# 第一次实验
## 1.练习一
①``` la sp, bootstacktop ``` 将bootstacktop的值加载到栈指针寄存器sp中，它的目的在于建立内核的初始栈空间。 栈从 bootstacktop 向 bootstack 方向增长（满递减栈）

②``` tail kern_init ``` 将函数地址(kern_init)加载到寄存器 ra 中，准备跳转到 kern_init 执行，最主要的目的在于将程序控制权从内核入口代码（kern_entry）转移到内核初始化函数（kern_init），对内核进行初始化。
## 2.练习二
①RISC-V 硬件加电后最初执行的几条指令位于 0x1000 地址。

②这些初始指令主要实现了从硬件启动地址到固件的跳转，首先是加载固件的基地址到通用寄存器，然后通过跳转指令进入固件执行。

实验过程：
首先在虚拟机中将GDB与QEMU连接，运行后发现程序停在了0x1000地址处，然后在右侧窗口内输入``` b* kern_entry ```设置断点,得到输出``` Breakpoint 1 at 0x80200000: file kern/init/entry.S, line 7. ``` 表明断点设置成功。随后执行``` c ```命令继续执行，程序停在了kern_entry处。再通过指令`x /3i 0x80200000`得到后续的3条代码如下，发现代码在0x80200008处跳转到0x8020000a处，即kern_init函数
Continuing.
Breakpoint 1, kern_entry ()   at kern/init/entry.S:77la sp, bootstacktop 

    0x80200000 <kern_entry>:   auipc  sp,0x3
    0x80200004 <kern_entry+4>: mv     sp,sp
    0x80200008 <kern_entry+8>: j      0x8020000a <kern_init>
同时左侧debug窗口输出如下：
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
再次输入`c`,debug窗口输出如下：``` (THS.CST) os is loading ··· ```
回到kern_init函数，通过`disassemble kern_init`指令查看kern_init函数的汇编代码如下：

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
    发现原来是因为最后一条指令会跳转到自身位置不断循环，所以一直停留在kern_init函数处。之后重新打开终端想进行debug时会发现如下情况：
   $ make debug qemu-system-riscv64: -s: Failed to find an available port: Address already in use。