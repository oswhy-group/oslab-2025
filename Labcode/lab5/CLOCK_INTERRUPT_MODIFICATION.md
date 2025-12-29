# Lab5 时钟中断处理修改说明

## 修改内容

### 修改文件
`kern/trap/trap.c`

### 修改位置
- IRQ_S_TIMER case 块（大约第110-128行）
- 删除了 num 静态变量定义（第22行）
- 删除了 print_ticks() 函数（第24-30行）

## 修改详情

### 之前的实现（LAB3 EXERCISE1）
```c
case IRQ_S_TIMER:
    /* LAB3 EXERCISE1   YOUR CODE :  */
    /*(1)设置下次时钟中断- clock_set_next_event()
     *(2)计数器（ticks）加一
     *(3)当计数器加到100的时候，我们会输出一个`100ticks`表示我们触发了100次时钟中断，同时打印次数（num）加一
     * (4)判断打印次数，当打印次数为10时，调用<sbi.h>中的关机函数关机
     */
    clock_set_next_event();
    if (++ticks % TICK_NUM == 0)
    {
        print_ticks();
        if (++num == 10)
        {
            sbi_shutdown();
        }
    }
    break;
```

### 现在的实现（LAB5 GRADE）
```c
case IRQ_S_TIMER:
    /* LAB5 GRADE   YOUR CODE :  */
    /* 时间片轮转： 
     *(1) 设置下一次时钟中断（clock_set_next_event）
     *(2) ticks 计数器自增
     *(3) 每 TICK_NUM 次中断（如 100 次），进行判断当前是否有进程正在运行，如果有则标记该进程需要被重新调度（current->need_resched）
     */
    clock_set_next_event();
    if (++ticks % TICK_NUM == 0)
    {
        if (current != NULL)
        {
            current->need_resched = 1;
        }
    }
    break;
```

## 功能说明

### 改动原因
从LAB3的时钟中断测试功能改为LAB5的时间片轮转调度功能。

### 新的功能实现

#### (1) 设置下一次时钟中断
```c
clock_set_next_event();
```
- 调用驱动层的时钟设置函数
- 为下一个时钟周期准备

#### (2) ticks 计数器自增
```c
if (++ticks % TICK_NUM == 0)
```
- ticks是全局计数器，每次中断递增
- TICK_NUM设为100，表示每100次中断检查一次

#### (3) 时间片轮转调度
```c
if (current != NULL)
{
    current->need_resched = 1;
}
```
- 检查当前是否有进程正在运行
- 如果有，标记该进程需要被重新调度
- 这是实现抢占式调度的关键机制

## 功能意义

### 时间片轮转（Time Slice Round Robin）
- **周期性检查**：每TICK_NUM个中断检查一次
- **公平调度**：确保每个进程都有机会运行
- **抢占机制**：通过设置need_resched标志，强制进行进程切换
- **提高响应性**：在多个可运行进程时，提高系统的响应性

### 与LAB3的区别
| 功能 | LAB3 | LAB5 |
|------|------|------|
| 用途 | 时钟测试 | 进程调度 |
| 输出 | "100ticks"提示和关机 | 无直接输出 |
| 调度 | 无 | 标记need_resched |
| 次数计数 | num变量记录 | 不需要 |

## 代码流程图

```
时钟中断发生
    ↓
clock_set_next_event()
    ↓
ticks++
    ↓
ticks % TICK_NUM == 0?
    ├─ NO → 返回继续执行
    └─ YES → 检查当前进程
              ├─ current == NULL → 返回
              └─ current != NULL → current->need_resched = 1
                                     ↓
                                   返回用户代码
                                     ↓
                                   用户代码执行一条指令
                                     ↓
                                   下一次异常时检查need_resched
                                     ↓
                                   进行进程调度
```

## 相关系统调用和函数

### schedule() 函数
- 检查所有进程的need_resched标志
- 如果标志被设置，选择新进程执行

### proc_struct 中的 need_resched
```c
volatile bool need_resched;  // 需要重新调度的标志
```

## 测试说明

修改后的代码实现了进程的时间片轮转调度。测试时可以：

1. **编译项目**
   ```bash
   make clean
   make
   ```

2. **运行测试**
   ```bash
   make grade
   ```

3. **预期结果**
   - 所有用户程序应正确执行
   - 多个进程能够正确切换
   - fork/exit等进程操作应正常工作

## 总结

这次修改实现了从测试时钟中断到实现时间片轮转调度的转变，这是操作系统多进程调度的核心机制。通过周期性地检查和标记need_resched标志，系统能够实现公平的进程调度。
