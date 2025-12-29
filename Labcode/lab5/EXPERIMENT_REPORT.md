# Lab5 实验报告

## 实验目标

完成操作系统Lab5实验，实现进程的创建、加载、执行和管理功能，包括：
1. 实现用户级进程的加载和执行
2. 实现进程的fork和copy-on-write机制
3. 完成Lab2/3/4中缺失的代码

---

## 练习1：加载应用程序并执行

### 设计思路

在load_icode函数中，已完成前5步：
1. 创建mm_struct管理用户内存空间
2. 创建并初始化页目录
3. 加载代码段和数据段
4. 创建并初始化栈
5. 更新当前进程的内存管理信息

第6步的关键任务是设置trapframe，使得从内核返回用户模式时能够正确执行应用程序。

### 实现过程

trapframe结构体包含以下关键字段：
- `gpr.sp`：栈指针
- `epc`：异常程序计数器（返回地址）
- `status`：处理器状态寄存器

**实现代码**（kern/process/proc.c 第718-726行）：

```c
tf->gpr.sp = USTACKTOP;           // 用户栈顶地址 (0x80000000)
tf->epc = elf->e_entry;            // ELF文件头中的程序入口地址
tf->status = sstatus & ~SSTATUS_SPP;  // 清除SPP位(bit8)，返回用户模式
tf->status |= SSTATUS_SPIE;        // 设置SPIE位(bit5)，启用中断
```

### 关键点说明

1. **SSTATUS_SPP位**（Supervisor Previous Privilege）
   - 值为0时：返回用户模式
   - 值为1时：返回监管模式
   - 通过清除此位确保返回用户模式

2. **SSTATUS_SPIE位**（Supervisor Previous Interrupt Enable）
   - 通过设置此位使用户模式下的中断能够工作

3. **栈初始化**
   - sp指向USTACKTOP (0x80000000)
   - 用户程序可以从此地址向下生长栈

### 用户态进程执行流程

从进程被选中执行到第一条指令的完整过程：

```
┌─────────────────────────────────────────────┐
│ 1. 进程被调度器选中 (schedule函数)          │
│    - 进程状态为PROC_RUNNABLE                │
└──────────────────────┬──────────────────────┘
                       ↓
┌─────────────────────────────────────────────┐
│ 2. proc_run(current) 执行                   │
│    a) 禁用中断 (local_intr_save)            │
│    b) 设置页表 (lsatp)                      │
│    c) 上下文切换 (switch_to)                │
│    d) 恢复中断 (local_intr_restore)         │
└──────────────────────┬──────────────────────┘
                       ↓
┌─────────────────────────────────────────────┐
│ 3. forkret函数                              │
│    - 调用 forkrets(current->tf)             │
└──────────────────────┬──────────────────────┘
                       ↓
┌─────────────────────────────────────────────┐
│ 4. 用户栈返回 (trapentry.S中)               │
│    - 从内核栈中恢复trapframe                │
│    - 执行sret指令                           │
└──────────────────────┬──────────────────────┘
                       ↓
┌─────────────────────────────────────────────┐
│ 5. 进入用户模式                             │
│    - SPP=0，进入用户模式                    │
│    - epc设置为程序入口地址                  │
│    - sp指向用户栈顶                         │
└──────────────────────┬──────────────────────┘
                       ↓
┌─────────────────────────────────────────────┐
│ 6. 执行应用程序第一条指令                   │
│    - 从 elf->e_entry 地址开始执行          │
└─────────────────────────────────────────────┘
```

---

## 练习2：父进程复制自己的内存空间给子进程

### 设计思路

copy_range函数是dup_mmap的核心实现，负责将父进程的用户内存空间复制到子进程。实现策略为页粒度的内存复制。

### 实现过程

**函数原型**（kern/mm/pmm.c）：
```c
int copy_range(pde_t *to, pde_t *from, uintptr_t start, uintptr_t end, bool share)
```

参数说明：
- `to`：子进程的页目录物理地址
- `from`：父进程的页目录物理地址
- `start`/`end`：要复制的虚拟地址范围
- `share`：是否共享（本实验未使用）

**实现代码**（kern/mm/pmm.c 第407-432行）：

```c
// (1) 获取源页的内核虚拟地址
void *src_kvaddr = page2kva(page);
// (2) 获取目标页的内核虚拟地址
void *dst_kvaddr = page2kva(npage);
// (3) 复制页内容（整页复制）
memcpy(dst_kvaddr, src_kvaddr, PGSIZE);
// (4) 建立物理页与虚拟地址的映射关系
ret = page_insert(to, npage, start, perm);
```

### 关键步骤说明

1. **遍历父进程页表**
   - 使用get_pte查询父进程的PTE
   - 检查页面有效性（PTE_V标志）

2. **为子进程分配新页**
   - alloc_page分配物理页
   - 保留原页的权限信息（perm）

3. **复制页内容**
   - page2kva转换物理页到内核虚拟地址
   - 使用memcpy完整复制一个页面（4KB）

4. **建立映射关系**
   - page_insert在子进程页表中建立映射
   - 子进程虚拟地址指向新分配的物理页

### Copy-on-Write (CoW) 机制设计

#### 基本概念
Copy-on-Write是一种内存管理优化技术，延迟内存复制到实际写入时进行。

#### 概要设计

**阶段1：创建时共享**
```
fork() 调用 copy_mm()
  ├─ 如果 CLONE_VM 标志设置，则共享内存空间
  └─ 否则调用 dup_mmap 复制内存空间
```

**阶段2：标记保护**
```
在copy_mm中，对共享页进行标记：
  ├─ 清除页表中的PTE_W（写）标志
  ├─ 为页面添加CoW标记
  └─ 增加页面引用计数（ref++）
```

**阶段3：缺页处理**
```
当进程尝试写入受保护页时：
  ├─ 触发Store Page Fault异常
  ├─ do_pgfault 检测到CoW条件
  └─ 执行写时复制逻辑
```

**阶段4：分离复制**
```
异常处理中执行以下步骤：
  1. 分配新物理页 (alloc_page)
  2. 复制原页内容 (memcpy)
  3. 更新页表映射到新页
  4. 恢复写权限 (设置PTE_W)
  5. 原页引用计数减一
  6. 新页引用计数为一
  7. 重新执行写指令
```

#### 详细设计

**数据结构扩展**：
```c
// 在PTE中添加CoW标记位
#define PTE_COW 0x400  // 自定义标志位，表示Copy-on-Write

// 页面结构体扩展
struct Page {
    int ref;           // 引用计数（已有）
    uint32_t cow_flag; // CoW标记
    // ... 其他字段
};
```

**copy_mm函数修改**：
```c
if (clone_flags & CLONE_VM) {
    // 不复制，共享内存空间
    mm->pgdir = from->pgdir;
    
    // 标记所有用户页为CoW
    for (each user page) {
        // 清除写权限
        pte &= ~PTE_W;
        // 设置CoW标记
        pte |= PTE_COW;
        // 增加引用计数
        page->ref++;
    }
} else {
    // 使用当前的copy_range复制内存
    copy_range(...);
}
```

**缺页处理函数**：
```c
int do_pgfault(struct trapframe *tf) {
    // ... 获取异常地址 va ...
    
    if (/* 检测到CoW条件 */) {
        // 1. 分配新页
        struct Page *newpage = alloc_page();
        
        // 2. 获取原页
        struct Page *oldpage = pte2page(*ptep);
        
        // 3. 复制内容
        memcpy(page2kva(newpage), page2kva(oldpage), PGSIZE);
        
        // 4. 更新页表映射
        page_insert(pgdir, newpage, va, perm | PTE_W);
        
        // 5. 清理引用计数
        oldpage->ref--;
        if (oldpage->ref == 0) {
            free_page(oldpage);
        }
        
        return 0;
    }
    
    // ... 处理其他缺页情况 ...
}
```

#### 实现优势

1. **性能优化**
   - 减少fork时的内存复制开销
   - 对于fork后立即exec的场景效果显著

2. **内存节省**
   - 共享只读数据段
   - 减少物理内存使用

3. **响应性改进**
   - fork()系统调用延迟降低
   - 进程创建更快速

#### 应用场景

- **进程创建**：fork系统调用
- **线程创建**：clone系统调用（CLONE_VM标志）
- **进程池模式**：预先创建工作进程

---

## 练习3：进程执行流程分析

### fork/exec/wait/exit 执行流程

#### fork系统调用流程

```
用户调用 fork()
  ↓
用户库函数 fork() (user/libs/syscall.c)
  └─ SYS_FORK 系统调用
       ↓
内核陷入处理 (kern/trap/trap.c)
  ├─ 识别SYS_FORK
  └─ 调用 do_fork()
       ↓
do_fork() (kern/process/proc.c)
  ├─ alloc_proc()：分配进程结构体
  ├─ setup_kstack()：分配内核栈
  ├─ copy_mm()：复制或共享内存空间
  ├─ copy_thread()：设置trapframe和上下文
  ├─ hash_proc()：添加到进程哈希表
  ├─ set_links()：建立父子进程关系
  ├─ wakeup_proc()：激活子进程
  └─ 返回子进程PID
       ↓
用户态继续执行
  ├─ 父进程：fork返回子进程PID
  └─ 子进程：fork返回0
```

#### exec系统调用流程

```
用户调用 execve()
  ↓
用户库函数 execve() (user/libs/syscall.c)
  └─ SYS_EXEC 系统调用
       ↓
内核陷入处理
  └─ 调用 do_execve()
       ↓
do_execve() (kern/process/proc.c)
  ├─ 保存程序名
  ├─ 清理旧内存空间
  │  ├─ exit_mmap()：释放内存映射
  │  ├─ put_pgdir()：释放页目录
  │  └─ mm_destroy()：销毁mm结构
  ├─ 调用 load_icode()
  │  ├─ 创建新mm结构
  │  ├─ 加载ELF程序
  │  └─ 设置trapframe
  └─ 新程序继续执行
```

#### wait系统调用流程

```
用户调用 wait()
  ↓
用户库函数 wait() (user/libs/syscall.c)
  └─ SYS_WAIT 系统调用
       ↓
内核陷入处理
  └─ 调用 do_wait()
       ↓
do_wait() (kern/process/proc.c)
  ├─ 检查是否有符合条件的子进程
  ├─ 如果有zombie子进程
  │  ├─ 获取退出码
  │  ├─ 清理进程资源
  │  └─ 返回子进程PID
  └─ 如果无符合子进程
     ├─ 设置wait_state = WT_CHILD
     ├─ 调用schedule()切换进程
     └─ 被子进程的do_exit唤醒后继续
```

#### exit系统调用流程

```
用户调用 exit()
  ↓
用户库函数 exit() (user/libs/syscall.c)
  └─ SYS_EXIT 系统调用
       ↓
内核陷入处理
  └─ 调用 do_exit()
       ↓
do_exit() (kern/process/proc.c)
  ├─ 状态设置：state = PROC_ZOMBIE
  ├─ 保存退出码：exit_code = error_code
  ├─ 唤醒父进程：wakeup_proc(parent)
  │  └─ 如果父进程在等待，唤醒它
  ├─ 创建孤儿
  │  └─ 将所有子进程的父进程改为init进程
  └─ 调用schedule()让出CPU
```

### 用户态与内核态的交错执行

#### 状态转换

```
用户态程序执行
  │
  ├─► 系统调用指令 (ecall)
  │       ↓
  │   陷入内核 (trap_in_kernel 检查返回false)
  │       ↓
  │   内核态处理
  │   ├─ 识别系统调用号
  │   ├─ 执行系统调用处理函数
  │   └─ 修改trapframe返回值
  │       ↓
  │   检查是否需要进程切换
  │   ├─ 如果需要，调用schedule()
  │   └─ 可能切换到其他进程
  │       ↓
  │   sret指令返回用户态
  │       ↓
  └─► 继续用户程序执行
```

#### 关键执行点

1. **ecall指令**：从用户态进入内核态
   - CPU自动保存返回地址到epc
   - 切换到监管模式（SPP=1）
   - 跳转到异常处理程序

2. **异常处理程序**（trapentry.S）
   - 保存通用寄存器到内核栈
   - 构造trapframe结构体

3. **C语言异常处理程序**（trap.c的trap函数）
   - 识别异常类型
   - 调用相应处理函数

4. **系统调用处理**
   - 从a7寄存器获取系统调用号
   - 调用对应的系统调用函数
   - 返回值放在a0寄存器

5. **sret指令**：返回用户态
   - 根据sstatus的SPP位判断目标模式
   - 恢复epc指向的指令地址
   - 恢复中断状态（SPIE→SIE）

### 内核态执行结果返回用户程序

#### 返回值机制

系统调用的返回值通过以下机制传递：

```c
// 内核端（do_fork为例）
int do_fork(...) {
    // ... 执行fork逻辑 ...
    return child_pid;  // 子进程PID
}

// syscall.c 中的系统调用包装
static int
sys_fork(uint64_t arg[], int narg, int *ret_store) {
    int ret = do_fork(...);
    *ret_store = ret;  // 存储返回值
    return 0;
}

// trap处理中
case SYS_FORK: {
    int ret;
    sys_fork(..., &ret);
    tf->gpr.a0 = ret;  // 返回值放入a0寄存器
    break;
}

// 用户态会从a0寄存器读取返回值
```

#### 异常返回过程

```c
// trapentry.S 或等效的汇编
.globl __trapret
__trapret:
    // 恢复通用寄存器
    LOAD x1, 1*REGBYTES(sp)
    // ... (跳过x0和其他寄存器)
    LOAD x31, 31*REGBYTES(sp)
    
    // 恢复trapframe中的特殊寄存器
    ld t0, 32*REGBYTES(sp)      // sstatus
    ld t1, 33*REGBYTES(sp)      // sepc
    
    csrw sstatus, t0            // 恢复状态寄存器
    csrw sepc, t1               // 恢复返回地址
    
    addi sp, sp, 34*REGBYTES    // 清理栈空间
    
    sret                         // 返回用户态
```

---

## 用户态进程执行状态生命周期图

```
                 ┌─────────────┐
                 │ PROC_UNINIT │
                 │  (初始化)   │
                 └──────┬──────┘
                        │ proc_init() / wakeup_proc()
                        ↓
              ┌───────────────────┐
              │  PROC_RUNNABLE    │◄────┐
              │   (就绪/运行)     │     │
              └────┬────────┬─────┘     │
                   │        │           │
         schedule()│        │           │
                   │        │     schedule()
                   ↓        │           │
            ┌────────────┐  │           │
            │ RUNNING    │  │           │
            │ (执行中)   │  │           │
            └────┬───────┘  │           │
                 │          │           │
                 ├─ wait()   ├─► PROC_SLEEPING ─┐
                 │           │  (睡眠/等待)    │
                 │           └────────┬────────┘
                 │                    │ wakeup_proc()
                 │                    └──────────►┘
                 │
                 └─ exit()
                    ↓
            ┌───────────────┐
            │ PROC_ZOMBIE   │
            │  (僵尸进程)   │
            └────┬──────────┘
                 │ wait() 清理
                 ↓
            ┌──────────────┐
            │   销毁       │
            │(进程资源)    │
            └──────────────┘

关键事件说明：
1. do_fork()创建新进程(UNINIT→RUNNABLE)
2. schedule()选择进程运行(RUNNABLE→RUNNING)
3. do_wait()使父进程等待(RUNNING→SLEEPING)
4. do_exit()进程退出(RUNNING→ZOMBIE)
5. 子进程exit/父进程wait清理资源
```

---

## 修改的文件列表

### kern/process/proc.c
- **alloc_proc()** (第85-130行)：完整实现proc_struct初始化
- **proc_run()** (第216-239行)：实现进程上下文切换
- **do_fork()** (第430-498行)：完整实现fork的7个步骤
- **load_icode()** (第710-726行)：实现trapframe设置

### kern/mm/pmm.c
- **copy_range()** (第407-432行)：实现内存页复制

### kern/trap/trap.c
- **添加num静态变量** (第22行)
- **IRQ_S_TIMER处理** (第126-137行)：实现时钟中断处理

---

## 编译和测试

### 编译命令
```bash
make clean
make
```

### 运行测试
```bash
make grade
```

### 期望输出
所有应用程序测试应显示"ok"，表示实现正确。

---

## 总结

本实验完整实现了：

1. ✓ 进程的加载和执行（load_icode第6步）
2. ✓ 进程的创建和fork（do_fork 7个步骤）
3. ✓ 内存空间的复制（copy_range）
4. ✓ 进程上下文的切换（proc_run）
5. ✓ 进程结构体的初始化（alloc_proc）
6. ✓ 时钟中断的处理（IRQ_S_TIMER）

设计遵循RISC-V特权级规范，正确处理用户态和内核态的转换，为后续的进程管理功能（等待、退出等）提供了坚实的基础。
