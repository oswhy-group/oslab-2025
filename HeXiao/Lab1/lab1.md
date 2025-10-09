# 任务一
    la sp,bootstacktop
这条指令里，sp 是栈指针寄存器，指向当前栈顶的位置,bootstacktop 是一个全局符号，代表内核启动栈的栈顶地址。因此，这条指令的实际操作为将 bootstacktop 所对应的地址值加载到栈指针寄存器 sp 中 。作用是通过将 bootstacktop 赋值给 sp，初始化了内核启动时的栈指针，明确了栈顶位置，为后续即将执行的函数（比如 kern_init 以及其调用链上的函数）提供一个可以正确使用的栈空间.

    tail kern_init
tail 是 RISC-V 汇编中的一条特殊跳转指令。这里跳转到kern_init函数的入口地址。目的是在完成内核启动初期的栈初始化等准备工作后，通过该指令从当前的 kern_entry 入口函数跳转到 kern_init 函数执行。而kern_init 函数通常是内核初始化流程中的关键函数，负责完成一系列更复杂的内核初始化任务，比如初始化内存管理系统、设备驱动初始化、进程调度系统初始化等。
# 任务二
使用GDB跟踪QEMU模拟RISC-V从加电开始直到执行内核第一条指令（跳转到0x80200000）的整个过程
首先，CPU从复位地址（0x1000）开始执行初始化固件（OpenSBI）的汇编代码，进行最基础的硬件初始化。通过`x 10/i $pc`查看当前pc值后要执行的10条指令如下

    0x1000: auipc t0,0x0    #将pc的值（0x1000）的值加载到t0
    0x1004: addi a1,t0,32 #将t0寄存器值加32后存入a1寄存器
    0x1008: csrr a0,mhartid #读取 mhartid（多核架构中当前硬件线程的 ID），并将其值存入 a0 寄存器。
    0x100c: ld t0,24(t0)  #从 t0 + 24 地址处，加载一个 64 位数据到 t0 寄存器。
    0x1010: jr t0  #跳转到 t0 寄存器所存储的地址处执行指令。
    0x1014: unimp  #无效代码，后续省略

通过单步指令`si`发现程序经过`0x1010: jr t0`跳转到地址0x80000000处执行。该地址处加载的是作为`bootloader`的 `OpenSBI.bin` ，该处的作用为加载操作系统内核并启动操作系统的执行。
通过指令`b* kern_entry`设置断点发现如下输出
    Breakpoint 1 at 0x80200000:file kern/init/entry.S, line 7.
通过指令`c`运行到该断点处后，再通过指令`x /3i 0x80200000`得到后续的3条代码如下，发现代码在0x80200008处跳转到0x8020000a处，即kern_init函数

    0x80200000 <kern_entry>:   auipc  sp,0x3
    0x80200004 <kern_entry+4>: mv     sp,sp
    0x80200008 <kern_entry+8>: j      0x8020000a <kern_init>

同时debug窗口输出如下，说明OpenSBI已经启动

    OpenSBI v0.4 (Jul  2 2019 11:53:53)

        ____                    _____ ____ _____
       / __ \                  / ____|  _ \_   _|
      | |  | |_ __   ___ _ __ | (___ | |_) || |
      | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
      | |__| | |_) |  __/ | | |____) | |_) || |_
       \____/| .__/ \___|_| |_|_____/|____/_____|
             | |
             |_|

    Platform Name          : QEMU Virt Machine
    Platform HART Features : RV64ACDFIMSU
    Platform Max HARTs     : 8
    Current Hart           : 0
    Firmware Base          : 0x80000000
    Firmware Size          : 112 KB
    Runtime SBI Version    : 0.1

    PMP0    : 0x0000000080000000-0x000000008001ffff (A)
    PMP1    : 0x0000000000000000-0xffffffffffffffff (A,R,W,X)
再次使用`b *kern_init`在kern_init函数处设置断点，通过`disassemble kern_init`指令查看kern_init函数的汇编代码如下

        Dump of assembler code for function kern init:
        0x000000008020000a <+0>:    auipc   a0,0x3                    #a0=pc+(0x3 << 12)
        0x000000008020000e <+4>:    addi    a0,a0,-2 #0x80203008      #a0=a0-4
        0x0000000080200012 <+8>:    auipc   a2,0x3                    #a2=pc+(0x3 <<12)
        0x0000000080200016 <+12>:   addi    a2,a2,-10 #0x80203008     #a2=a2-10
        0x000000008020001a <+16>:   addi    sp,sp,-16                 #sp=sp-16
        0x000000008020001c <+18>:   li      a1,0                      #a1=0
        0x000000008020001e <+20>:   sub     a2,a2,a0                  #a2=a2-a0
        0x9000000080200020 <+22>:   sd      ra,8(sp)                  #将返回地址ra存放在sp+8的位置
        0x0000000080200022 <+24>:   jal     ra,0x802004b6 <memset>    #跳转到 memset 函数的地址并将当前指令的下一条指令地址保存到 ra 寄存器中
        0x0000000080200026 <+28>:   auipc   a1,0x0                    #a1=pc+(0x0 << 12)
        0x000000008020002a <+32>:   addi    a1,a1,1186 #0x802004c8    #a1=a1+1186
        0x000000008020002e <+36>:   auipc   a0,0x0                    #a0=pc+(0x0<< 12)
        0x0000000080200032 <+40>:   addi    a0,a0,1210 #0x802004e8    #a0=a0+1210
        0x0000000080200036 <+44>:   jal     ra,0x80200056 <cprintf>   #跳转到 cprintf 函数的地址并将当前指令的下一条指令地址保存到 ra 寄存器中
        0x000000008020003a <+48>:   j       0x8020003a <kern_init+48> #跳转到0x8020003a
        End of assembler dump
发现最后一条指令会跳转到自身位置不断循环，继续输入`c`,debug窗口输出如下
`(THS.CST) os is loading ···`

