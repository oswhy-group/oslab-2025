# Lab5 实现总结

## 完成的练习

### 练习0：填写已有实验

本实验依赖于实验2/3/4，已完成以下代码补充：

#### 1. LAB4:EXERCISE1 - alloc_proc函数初始化 (kern/process/proc.c)
实现了proc_struct的完整初始化，包括：
- 基本字段初始化：state=PROC_UNINIT, pid=-1, runs=0等
- 内存管理字段初始化：parent=NULL, mm=NULL, pgdir=0等
- LAB5新增字段初始化：wait_state=0, cptr/yptr/optr=NULL

#### 2. LAB4:EXERCISE3 - proc_run函数实现 (kern/process/proc.c)
实现了进程上下文切换：
- 禁用中断（local_intr_save）
- 设置页表寄存器（lsatp）
- 执行上下文切换（switch_to）
- 恢复中断（local_intr_restore）

#### 3. LAB4:EXERCISE2 - do_fork函数实现 (kern/process/proc.c)
完整实现了7个步骤的fork操作：
1. alloc_proc分配进程结构体
2. setup_kstack分配内核栈
3. copy_mm复制或共享内存空间
4. copy_thread设置trapframe和上下文
5. hash_proc和set_links建立进程关系
6. wakeup_proc激活进程
7. 返回子进程PID

LAB5更新：
- 设置child proc的parent为current process
- 确保current process的wait_state为0
- 在set_links中正确建立进程间关系

#### 4. LAB3 EXERCISE1 - 时钟中断处理 (kern/trap/trap.c)
实现了IRQ_S_TIMER的处理：
1. clock_set_next_event() - 设置下次时钟中断
2. ticks计数器加一
3. 每100次中断输出一次"100ticks"，num计数加一
4. 当num达到10时调用sbi_shutdown()关机

### 练习1：加载应用程序并执行 - load_icode第6步

**文件位置**：kern/process/proc.c, 第710-726行

**实现内容**：设置trapframe以便用户程序正确执行

```c
tf->gpr.sp = USTACKTOP;           // 用户栈顶
tf->epc = elf->e_entry;            // 程序入口地址
tf->status = sstatus & ~SSTATUS_SPP;  // 清除SPP位，返回用户模式
tf->status |= SSTATUS_SPIE;        // 设置SPIE位，启用中断
```

**关键说明**：
- SSTATUS_SPP=0表示返回用户模式(User Privilege)
- SSTATUS_SPIE=1表示返回后启用中断
- sp指向用户栈顶（USTACKTOP）
- epc设置为ELF文件的入口地址

### 练习2：父进程复制自己的内存空间给子进程 - copy_range函数

**文件位置**：kern/mm/pmm.c, 第407-432行

**实现内容**：
```c
// (1) 获取源页的内核虚拟地址
void *src_kvaddr = page2kva(page);
// (2) 获取目标页的内核虚拟地址
void *dst_kvaddr = page2kva(npage);
// (3) 复制页内容
memcpy(dst_kvaddr, src_kvaddr, PGSIZE);
// (4) 建立物理页与虚拟地址的映射
ret = page_insert(to, npage, start, perm);
```

**关键说明**：
- 逐页复制父进程的内存到子进程
- 保持原有的页权限(perm)
- 建立新的页表映射

### 练习3：分析fork/exec/wait/exit

这部分不需要编码，请查看kern/process/proc.c中对应函数的实现分析。

## 执行流程说明

### 用户进程被选中到执行第一条指令的完整过程

1. **进程调度**：schedule函数选择PROC_RUNNABLE状态的进程
2. **进程切换**：proc_run()函数执行：
   - 禁用中断
   - 设置新进程的页表（lsatp）
   - 调用switch_to进行上下文切换
   - 恢复中断

3. **返回用户模式**：
   - 从内核返回时，根据trapframe的status字段判断
   - 由于SPP=0，执行sret指令返回用户模式
   - 根据epc恢复程序计数器
   - 恢复gpr寄存器状态

4. **用户程序执行**：
   - 从trapframe中的epc地址开始执行用户程序
   - 栈指针sp已设置为USTACKTOP

## Copy-on-Write机制概要设计

### 基本思路
1. **共享阶段**：fork时，子进程与父进程共享内存页，而不是复制
2. **保护机制**：将所有共享页标记为只读(PTE_W清除)
3. **缺页处理**：当进程尝试写入只读页时，触发Page Fault异常
4. **复制分离**：异常处理中，为该进程分配新页并复制内容

### 详细设计步骤
1. 在copy_mm中，如果CLONE_VM标志，则建立共享映射而非复制
2. 标记共享页为只读，同时记录ref计数
3. 在trap处理中捕获Store Page Fault异常
4. 异常处理中：
   - 分配新物理页
   - 复制原页内容
   - 更新页表映射为新页
   - 恢复写权限

### 实现优势
- 减少fork时的内存复制开销
- 只在实际需要时进行复制(Lazy copy)
- 提高系统效率，特别是fork后立即exec的场景

## 编译和运行说明

该项目需要RISC-V交叉编译工具链：
```bash
# 编译
make

# 运行测试
make grade
```

**注意**：需要安装以下工具：
- riscv64-unknown-elf-gcc 及相关工具链
- QEMU for RISC-V (qemu-system-riscv64)
- GNU Make

## 代码改进说明

为了正确执行lab5的测试应用程序，对已完成的实验进行了以下改进：

1. **proc_struct初始化**：确保所有新字段正确初始化
2. **进程关系管理**：通过set_links正确建立父子进程关系
3. **trapframe设置**：正确配置status寄存器以正确返回用户模式
4. **内存复制**：确保copy_range正确复制权限和映射

这些改进确保了进程创建、上下文切换和应用程序执行的正确性。
