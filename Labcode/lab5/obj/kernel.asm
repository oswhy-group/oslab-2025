
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
    .globl kern_entry
kern_entry:
    # a0: hartid
    # a1: dtb physical address
    # save hartid and dtb address
    la t0, boot_hartid
ffffffffc0200000:	0000b297          	auipc	t0,0xb
ffffffffc0200004:	00028293          	mv	t0,t0
    sd a0, 0(t0)
ffffffffc0200008:	00a2b023          	sd	a0,0(t0) # ffffffffc020b000 <boot_hartid>
    la t0, boot_dtb
ffffffffc020000c:	0000b297          	auipc	t0,0xb
ffffffffc0200010:	ffc28293          	addi	t0,t0,-4 # ffffffffc020b008 <boot_dtb>
    sd a1, 0(t0)
ffffffffc0200014:	00b2b023          	sd	a1,0(t0)
    # t0 := 三级页表的虚拟地址
    lui     t0, %hi(boot_page_table_sv39)
ffffffffc0200018:	c020a2b7          	lui	t0,0xc020a
    # t1 := 0xffffffff40000000 即虚实映射偏移量
    li      t1, 0xffffffffc0000000 - 0x80000000
ffffffffc020001c:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200020:	037a                	slli	t1,t1,0x1e
    # t0 减去虚实映射偏移量 0xffffffff40000000，变为三级页表的物理地址
    sub     t0, t0, t1
ffffffffc0200022:	406282b3          	sub	t0,t0,t1
    # t0 >>= 12，变为三级页表的物理页号
    srli    t0, t0, 12
ffffffffc0200026:	00c2d293          	srli	t0,t0,0xc

    # t1 := 8 << 60，设置 satp 的 MODE 字段为 Sv39
    li      t1, 8 << 60
ffffffffc020002a:	fff0031b          	addiw	t1,zero,-1
ffffffffc020002e:	137e                	slli	t1,t1,0x3f
    # 将刚才计算出的预设三级页表物理页号附加到 satp 中
    or      t0, t0, t1
ffffffffc0200030:	0062e2b3          	or	t0,t0,t1
    # 将算出的 t0(即新的MODE|页表基址物理页号) 覆盖到 satp 中
    csrw    satp, t0
ffffffffc0200034:	18029073          	csrw	satp,t0
    # 使用 sfence.vma 指令刷新 TLB
    sfence.vma
ffffffffc0200038:	12000073          	sfence.vma
    # 从此，我们给内核搭建出了一个完美的虚拟内存空间！
    #nop # 可能映射的位置有些bug。。插入一个nop
    
    # 我们在虚拟内存空间中：随意将 sp 设置为虚拟地址！
    lui sp, %hi(bootstacktop)
ffffffffc020003c:	c020a137          	lui	sp,0xc020a

    # 我们在虚拟内存空间中：随意跳转到虚拟地址！
    # 跳转到 kern_init
    lui t0, %hi(kern_init)
ffffffffc0200040:	c02002b7          	lui	t0,0xc0200
    addi t0, t0, %lo(kern_init)
ffffffffc0200044:	04a28293          	addi	t0,t0,74 # ffffffffc020004a <kern_init>
    jr t0
ffffffffc0200048:	8282                	jr	t0

ffffffffc020004a <kern_init>:
void grade_backtrace(void);

int kern_init(void)
{
    extern char edata[], end[];
    memset(edata, 0, end - edata);
ffffffffc020004a:	000a6517          	auipc	a0,0xa6
ffffffffc020004e:	24650513          	addi	a0,a0,582 # ffffffffc02a6290 <buf>
ffffffffc0200052:	000aa617          	auipc	a2,0xaa
ffffffffc0200056:	6e260613          	addi	a2,a2,1762 # ffffffffc02aa734 <end>
{
ffffffffc020005a:	1141                	addi	sp,sp,-16
    memset(edata, 0, end - edata);
ffffffffc020005c:	8e09                	sub	a2,a2,a0
ffffffffc020005e:	4581                	li	a1,0
{
ffffffffc0200060:	e406                	sd	ra,8(sp)
    memset(edata, 0, end - edata);
ffffffffc0200062:	009050ef          	jal	ra,ffffffffc020586a <memset>
    dtb_init();
ffffffffc0200066:	598000ef          	jal	ra,ffffffffc02005fe <dtb_init>
    cons_init(); // init the console
ffffffffc020006a:	522000ef          	jal	ra,ffffffffc020058c <cons_init>

    const char *message = "(THU.CST) os is loading ...";
    cprintf("%s\n\n", message);
ffffffffc020006e:	00006597          	auipc	a1,0x6
ffffffffc0200072:	82a58593          	addi	a1,a1,-2006 # ffffffffc0205898 <etext+0x4>
ffffffffc0200076:	00006517          	auipc	a0,0x6
ffffffffc020007a:	84250513          	addi	a0,a0,-1982 # ffffffffc02058b8 <etext+0x24>
ffffffffc020007e:	116000ef          	jal	ra,ffffffffc0200194 <cprintf>

    print_kerninfo();
ffffffffc0200082:	19a000ef          	jal	ra,ffffffffc020021c <print_kerninfo>

    // grade_backtrace();

    pmm_init(); // init physical memory management
ffffffffc0200086:	68c020ef          	jal	ra,ffffffffc0202712 <pmm_init>

    pic_init(); // init interrupt controller
ffffffffc020008a:	131000ef          	jal	ra,ffffffffc02009ba <pic_init>
    idt_init(); // init interrupt descriptor table
ffffffffc020008e:	12f000ef          	jal	ra,ffffffffc02009bc <idt_init>

    vmm_init();  // init virtual memory management
ffffffffc0200092:	159030ef          	jal	ra,ffffffffc02039ea <vmm_init>
    proc_init(); // init process table
ffffffffc0200096:	6b1040ef          	jal	ra,ffffffffc0204f46 <proc_init>

    clock_init();  // init clock interrupt
ffffffffc020009a:	4a0000ef          	jal	ra,ffffffffc020053a <clock_init>
    intr_enable(); // enable irq interrupt
ffffffffc020009e:	111000ef          	jal	ra,ffffffffc02009ae <intr_enable>

    cpu_idle(); // run idle process
ffffffffc02000a2:	068050ef          	jal	ra,ffffffffc020510a <cpu_idle>

ffffffffc02000a6 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
ffffffffc02000a6:	715d                	addi	sp,sp,-80
ffffffffc02000a8:	e486                	sd	ra,72(sp)
ffffffffc02000aa:	e0a6                	sd	s1,64(sp)
ffffffffc02000ac:	fc4a                	sd	s2,56(sp)
ffffffffc02000ae:	f84e                	sd	s3,48(sp)
ffffffffc02000b0:	f452                	sd	s4,40(sp)
ffffffffc02000b2:	f056                	sd	s5,32(sp)
ffffffffc02000b4:	ec5a                	sd	s6,24(sp)
ffffffffc02000b6:	e85e                	sd	s7,16(sp)
    if (prompt != NULL) {
ffffffffc02000b8:	c901                	beqz	a0,ffffffffc02000c8 <readline+0x22>
ffffffffc02000ba:	85aa                	mv	a1,a0
        cprintf("%s", prompt);
ffffffffc02000bc:	00006517          	auipc	a0,0x6
ffffffffc02000c0:	80450513          	addi	a0,a0,-2044 # ffffffffc02058c0 <etext+0x2c>
ffffffffc02000c4:	0d0000ef          	jal	ra,ffffffffc0200194 <cprintf>
readline(const char *prompt) {
ffffffffc02000c8:	4481                	li	s1,0
    while (1) {
        c = getchar();
        if (c < 0) {
            return NULL;
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
ffffffffc02000ca:	497d                	li	s2,31
            cputchar(c);
            buf[i ++] = c;
        }
        else if (c == '\b' && i > 0) {
ffffffffc02000cc:	49a1                	li	s3,8
            cputchar(c);
            i --;
        }
        else if (c == '\n' || c == '\r') {
ffffffffc02000ce:	4aa9                	li	s5,10
ffffffffc02000d0:	4b35                	li	s6,13
            buf[i ++] = c;
ffffffffc02000d2:	000a6b97          	auipc	s7,0xa6
ffffffffc02000d6:	1beb8b93          	addi	s7,s7,446 # ffffffffc02a6290 <buf>
        else if (c >= ' ' && i < BUFSIZE - 1) {
ffffffffc02000da:	3fe00a13          	li	s4,1022
        c = getchar();
ffffffffc02000de:	12e000ef          	jal	ra,ffffffffc020020c <getchar>
        if (c < 0) {
ffffffffc02000e2:	00054a63          	bltz	a0,ffffffffc02000f6 <readline+0x50>
        else if (c >= ' ' && i < BUFSIZE - 1) {
ffffffffc02000e6:	00a95a63          	bge	s2,a0,ffffffffc02000fa <readline+0x54>
ffffffffc02000ea:	029a5263          	bge	s4,s1,ffffffffc020010e <readline+0x68>
        c = getchar();
ffffffffc02000ee:	11e000ef          	jal	ra,ffffffffc020020c <getchar>
        if (c < 0) {
ffffffffc02000f2:	fe055ae3          	bgez	a0,ffffffffc02000e6 <readline+0x40>
            return NULL;
ffffffffc02000f6:	4501                	li	a0,0
ffffffffc02000f8:	a091                	j	ffffffffc020013c <readline+0x96>
        else if (c == '\b' && i > 0) {
ffffffffc02000fa:	03351463          	bne	a0,s3,ffffffffc0200122 <readline+0x7c>
ffffffffc02000fe:	e8a9                	bnez	s1,ffffffffc0200150 <readline+0xaa>
        c = getchar();
ffffffffc0200100:	10c000ef          	jal	ra,ffffffffc020020c <getchar>
        if (c < 0) {
ffffffffc0200104:	fe0549e3          	bltz	a0,ffffffffc02000f6 <readline+0x50>
        else if (c >= ' ' && i < BUFSIZE - 1) {
ffffffffc0200108:	fea959e3          	bge	s2,a0,ffffffffc02000fa <readline+0x54>
ffffffffc020010c:	4481                	li	s1,0
            cputchar(c);
ffffffffc020010e:	e42a                	sd	a0,8(sp)
ffffffffc0200110:	0ba000ef          	jal	ra,ffffffffc02001ca <cputchar>
            buf[i ++] = c;
ffffffffc0200114:	6522                	ld	a0,8(sp)
ffffffffc0200116:	009b87b3          	add	a5,s7,s1
ffffffffc020011a:	2485                	addiw	s1,s1,1
ffffffffc020011c:	00a78023          	sb	a0,0(a5)
ffffffffc0200120:	bf7d                	j	ffffffffc02000de <readline+0x38>
        else if (c == '\n' || c == '\r') {
ffffffffc0200122:	01550463          	beq	a0,s5,ffffffffc020012a <readline+0x84>
ffffffffc0200126:	fb651ce3          	bne	a0,s6,ffffffffc02000de <readline+0x38>
            cputchar(c);
ffffffffc020012a:	0a0000ef          	jal	ra,ffffffffc02001ca <cputchar>
            buf[i] = '\0';
ffffffffc020012e:	000a6517          	auipc	a0,0xa6
ffffffffc0200132:	16250513          	addi	a0,a0,354 # ffffffffc02a6290 <buf>
ffffffffc0200136:	94aa                	add	s1,s1,a0
ffffffffc0200138:	00048023          	sb	zero,0(s1)
            return buf;
        }
    }
}
ffffffffc020013c:	60a6                	ld	ra,72(sp)
ffffffffc020013e:	6486                	ld	s1,64(sp)
ffffffffc0200140:	7962                	ld	s2,56(sp)
ffffffffc0200142:	79c2                	ld	s3,48(sp)
ffffffffc0200144:	7a22                	ld	s4,40(sp)
ffffffffc0200146:	7a82                	ld	s5,32(sp)
ffffffffc0200148:	6b62                	ld	s6,24(sp)
ffffffffc020014a:	6bc2                	ld	s7,16(sp)
ffffffffc020014c:	6161                	addi	sp,sp,80
ffffffffc020014e:	8082                	ret
            cputchar(c);
ffffffffc0200150:	4521                	li	a0,8
ffffffffc0200152:	078000ef          	jal	ra,ffffffffc02001ca <cputchar>
            i --;
ffffffffc0200156:	34fd                	addiw	s1,s1,-1
ffffffffc0200158:	b759                	j	ffffffffc02000de <readline+0x38>

ffffffffc020015a <cputch>:
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt)
{
ffffffffc020015a:	1141                	addi	sp,sp,-16
ffffffffc020015c:	e022                	sd	s0,0(sp)
ffffffffc020015e:	e406                	sd	ra,8(sp)
ffffffffc0200160:	842e                	mv	s0,a1
    cons_putc(c);
ffffffffc0200162:	42c000ef          	jal	ra,ffffffffc020058e <cons_putc>
    (*cnt)++;
ffffffffc0200166:	401c                	lw	a5,0(s0)
}
ffffffffc0200168:	60a2                	ld	ra,8(sp)
    (*cnt)++;
ffffffffc020016a:	2785                	addiw	a5,a5,1
ffffffffc020016c:	c01c                	sw	a5,0(s0)
}
ffffffffc020016e:	6402                	ld	s0,0(sp)
ffffffffc0200170:	0141                	addi	sp,sp,16
ffffffffc0200172:	8082                	ret

ffffffffc0200174 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int vcprintf(const char *fmt, va_list ap)
{
ffffffffc0200174:	1101                	addi	sp,sp,-32
ffffffffc0200176:	862a                	mv	a2,a0
ffffffffc0200178:	86ae                	mv	a3,a1
    int cnt = 0;
    vprintfmt((void *)cputch, &cnt, fmt, ap);
ffffffffc020017a:	00000517          	auipc	a0,0x0
ffffffffc020017e:	fe050513          	addi	a0,a0,-32 # ffffffffc020015a <cputch>
ffffffffc0200182:	006c                	addi	a1,sp,12
{
ffffffffc0200184:	ec06                	sd	ra,24(sp)
    int cnt = 0;
ffffffffc0200186:	c602                	sw	zero,12(sp)
    vprintfmt((void *)cputch, &cnt, fmt, ap);
ffffffffc0200188:	2be050ef          	jal	ra,ffffffffc0205446 <vprintfmt>
    return cnt;
}
ffffffffc020018c:	60e2                	ld	ra,24(sp)
ffffffffc020018e:	4532                	lw	a0,12(sp)
ffffffffc0200190:	6105                	addi	sp,sp,32
ffffffffc0200192:	8082                	ret

ffffffffc0200194 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int cprintf(const char *fmt, ...)
{
ffffffffc0200194:	711d                	addi	sp,sp,-96
    va_list ap;
    int cnt;
    va_start(ap, fmt);
ffffffffc0200196:	02810313          	addi	t1,sp,40 # ffffffffc020a028 <boot_page_table_sv39+0x28>
{
ffffffffc020019a:	8e2a                	mv	t3,a0
ffffffffc020019c:	f42e                	sd	a1,40(sp)
ffffffffc020019e:	f832                	sd	a2,48(sp)
ffffffffc02001a0:	fc36                	sd	a3,56(sp)
    vprintfmt((void *)cputch, &cnt, fmt, ap);
ffffffffc02001a2:	00000517          	auipc	a0,0x0
ffffffffc02001a6:	fb850513          	addi	a0,a0,-72 # ffffffffc020015a <cputch>
ffffffffc02001aa:	004c                	addi	a1,sp,4
ffffffffc02001ac:	869a                	mv	a3,t1
ffffffffc02001ae:	8672                	mv	a2,t3
{
ffffffffc02001b0:	ec06                	sd	ra,24(sp)
ffffffffc02001b2:	e0ba                	sd	a4,64(sp)
ffffffffc02001b4:	e4be                	sd	a5,72(sp)
ffffffffc02001b6:	e8c2                	sd	a6,80(sp)
ffffffffc02001b8:	ecc6                	sd	a7,88(sp)
    va_start(ap, fmt);
ffffffffc02001ba:	e41a                	sd	t1,8(sp)
    int cnt = 0;
ffffffffc02001bc:	c202                	sw	zero,4(sp)
    vprintfmt((void *)cputch, &cnt, fmt, ap);
ffffffffc02001be:	288050ef          	jal	ra,ffffffffc0205446 <vprintfmt>
    cnt = vcprintf(fmt, ap);
    va_end(ap);
    return cnt;
}
ffffffffc02001c2:	60e2                	ld	ra,24(sp)
ffffffffc02001c4:	4512                	lw	a0,4(sp)
ffffffffc02001c6:	6125                	addi	sp,sp,96
ffffffffc02001c8:	8082                	ret

ffffffffc02001ca <cputchar>:

/* cputchar - writes a single character to stdout */
void cputchar(int c)
{
    cons_putc(c);
ffffffffc02001ca:	a6d1                	j	ffffffffc020058e <cons_putc>

ffffffffc02001cc <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int cputs(const char *str)
{
ffffffffc02001cc:	1101                	addi	sp,sp,-32
ffffffffc02001ce:	e822                	sd	s0,16(sp)
ffffffffc02001d0:	ec06                	sd	ra,24(sp)
ffffffffc02001d2:	e426                	sd	s1,8(sp)
ffffffffc02001d4:	842a                	mv	s0,a0
    int cnt = 0;
    char c;
    while ((c = *str++) != '\0')
ffffffffc02001d6:	00054503          	lbu	a0,0(a0)
ffffffffc02001da:	c51d                	beqz	a0,ffffffffc0200208 <cputs+0x3c>
ffffffffc02001dc:	0405                	addi	s0,s0,1
ffffffffc02001de:	4485                	li	s1,1
ffffffffc02001e0:	9c81                	subw	s1,s1,s0
    cons_putc(c);
ffffffffc02001e2:	3ac000ef          	jal	ra,ffffffffc020058e <cons_putc>
    while ((c = *str++) != '\0')
ffffffffc02001e6:	00044503          	lbu	a0,0(s0)
ffffffffc02001ea:	008487bb          	addw	a5,s1,s0
ffffffffc02001ee:	0405                	addi	s0,s0,1
ffffffffc02001f0:	f96d                	bnez	a0,ffffffffc02001e2 <cputs+0x16>
    (*cnt)++;
ffffffffc02001f2:	0017841b          	addiw	s0,a5,1
    cons_putc(c);
ffffffffc02001f6:	4529                	li	a0,10
ffffffffc02001f8:	396000ef          	jal	ra,ffffffffc020058e <cons_putc>
    {
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
    return cnt;
}
ffffffffc02001fc:	60e2                	ld	ra,24(sp)
ffffffffc02001fe:	8522                	mv	a0,s0
ffffffffc0200200:	6442                	ld	s0,16(sp)
ffffffffc0200202:	64a2                	ld	s1,8(sp)
ffffffffc0200204:	6105                	addi	sp,sp,32
ffffffffc0200206:	8082                	ret
    while ((c = *str++) != '\0')
ffffffffc0200208:	4405                	li	s0,1
ffffffffc020020a:	b7f5                	j	ffffffffc02001f6 <cputs+0x2a>

ffffffffc020020c <getchar>:

/* getchar - reads a single non-zero character from stdin */
int getchar(void)
{
ffffffffc020020c:	1141                	addi	sp,sp,-16
ffffffffc020020e:	e406                	sd	ra,8(sp)
    int c;
    while ((c = cons_getc()) == 0)
ffffffffc0200210:	3b2000ef          	jal	ra,ffffffffc02005c2 <cons_getc>
ffffffffc0200214:	dd75                	beqz	a0,ffffffffc0200210 <getchar+0x4>
        /* do nothing */;
    return c;
}
ffffffffc0200216:	60a2                	ld	ra,8(sp)
ffffffffc0200218:	0141                	addi	sp,sp,16
ffffffffc020021a:	8082                	ret

ffffffffc020021c <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void print_kerninfo(void)
{
ffffffffc020021c:	1141                	addi	sp,sp,-16
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
ffffffffc020021e:	00005517          	auipc	a0,0x5
ffffffffc0200222:	6aa50513          	addi	a0,a0,1706 # ffffffffc02058c8 <etext+0x34>
{
ffffffffc0200226:	e406                	sd	ra,8(sp)
    cprintf("Special kernel symbols:\n");
ffffffffc0200228:	f6dff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  entry  0x%08x (virtual)\n", kern_init);
ffffffffc020022c:	00000597          	auipc	a1,0x0
ffffffffc0200230:	e1e58593          	addi	a1,a1,-482 # ffffffffc020004a <kern_init>
ffffffffc0200234:	00005517          	auipc	a0,0x5
ffffffffc0200238:	6b450513          	addi	a0,a0,1716 # ffffffffc02058e8 <etext+0x54>
ffffffffc020023c:	f59ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  etext  0x%08x (virtual)\n", etext);
ffffffffc0200240:	00005597          	auipc	a1,0x5
ffffffffc0200244:	65458593          	addi	a1,a1,1620 # ffffffffc0205894 <etext>
ffffffffc0200248:	00005517          	auipc	a0,0x5
ffffffffc020024c:	6c050513          	addi	a0,a0,1728 # ffffffffc0205908 <etext+0x74>
ffffffffc0200250:	f45ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  edata  0x%08x (virtual)\n", edata);
ffffffffc0200254:	000a6597          	auipc	a1,0xa6
ffffffffc0200258:	03c58593          	addi	a1,a1,60 # ffffffffc02a6290 <buf>
ffffffffc020025c:	00005517          	auipc	a0,0x5
ffffffffc0200260:	6cc50513          	addi	a0,a0,1740 # ffffffffc0205928 <etext+0x94>
ffffffffc0200264:	f31ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  end    0x%08x (virtual)\n", end);
ffffffffc0200268:	000aa597          	auipc	a1,0xaa
ffffffffc020026c:	4cc58593          	addi	a1,a1,1228 # ffffffffc02aa734 <end>
ffffffffc0200270:	00005517          	auipc	a0,0x5
ffffffffc0200274:	6d850513          	addi	a0,a0,1752 # ffffffffc0205948 <etext+0xb4>
ffffffffc0200278:	f1dff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n",
            (end - kern_init + 1023) / 1024);
ffffffffc020027c:	000ab597          	auipc	a1,0xab
ffffffffc0200280:	8b758593          	addi	a1,a1,-1865 # ffffffffc02aab33 <end+0x3ff>
ffffffffc0200284:	00000797          	auipc	a5,0x0
ffffffffc0200288:	dc678793          	addi	a5,a5,-570 # ffffffffc020004a <kern_init>
ffffffffc020028c:	40f587b3          	sub	a5,a1,a5
    cprintf("Kernel executable memory footprint: %dKB\n",
ffffffffc0200290:	43f7d593          	srai	a1,a5,0x3f
}
ffffffffc0200294:	60a2                	ld	ra,8(sp)
    cprintf("Kernel executable memory footprint: %dKB\n",
ffffffffc0200296:	3ff5f593          	andi	a1,a1,1023
ffffffffc020029a:	95be                	add	a1,a1,a5
ffffffffc020029c:	85a9                	srai	a1,a1,0xa
ffffffffc020029e:	00005517          	auipc	a0,0x5
ffffffffc02002a2:	6ca50513          	addi	a0,a0,1738 # ffffffffc0205968 <etext+0xd4>
}
ffffffffc02002a6:	0141                	addi	sp,sp,16
    cprintf("Kernel executable memory footprint: %dKB\n",
ffffffffc02002a8:	b5f5                	j	ffffffffc0200194 <cprintf>

ffffffffc02002aa <print_stackframe>:
 * jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the
 * boundary.
 * */
void print_stackframe(void)
{
ffffffffc02002aa:	1141                	addi	sp,sp,-16
    panic("Not Implemented!");
ffffffffc02002ac:	00005617          	auipc	a2,0x5
ffffffffc02002b0:	6ec60613          	addi	a2,a2,1772 # ffffffffc0205998 <etext+0x104>
ffffffffc02002b4:	04f00593          	li	a1,79
ffffffffc02002b8:	00005517          	auipc	a0,0x5
ffffffffc02002bc:	6f850513          	addi	a0,a0,1784 # ffffffffc02059b0 <etext+0x11c>
{
ffffffffc02002c0:	e406                	sd	ra,8(sp)
    panic("Not Implemented!");
ffffffffc02002c2:	1cc000ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc02002c6 <mon_help>:
    }
}

/* mon_help - print the information about mon_* functions */
int mon_help(int argc, char **argv, struct trapframe *tf)
{
ffffffffc02002c6:	1141                	addi	sp,sp,-16
    int i;
    for (i = 0; i < NCOMMANDS; i++)
    {
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
ffffffffc02002c8:	00005617          	auipc	a2,0x5
ffffffffc02002cc:	70060613          	addi	a2,a2,1792 # ffffffffc02059c8 <etext+0x134>
ffffffffc02002d0:	00005597          	auipc	a1,0x5
ffffffffc02002d4:	71858593          	addi	a1,a1,1816 # ffffffffc02059e8 <etext+0x154>
ffffffffc02002d8:	00005517          	auipc	a0,0x5
ffffffffc02002dc:	71850513          	addi	a0,a0,1816 # ffffffffc02059f0 <etext+0x15c>
{
ffffffffc02002e0:	e406                	sd	ra,8(sp)
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
ffffffffc02002e2:	eb3ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
ffffffffc02002e6:	00005617          	auipc	a2,0x5
ffffffffc02002ea:	71a60613          	addi	a2,a2,1818 # ffffffffc0205a00 <etext+0x16c>
ffffffffc02002ee:	00005597          	auipc	a1,0x5
ffffffffc02002f2:	73a58593          	addi	a1,a1,1850 # ffffffffc0205a28 <etext+0x194>
ffffffffc02002f6:	00005517          	auipc	a0,0x5
ffffffffc02002fa:	6fa50513          	addi	a0,a0,1786 # ffffffffc02059f0 <etext+0x15c>
ffffffffc02002fe:	e97ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
ffffffffc0200302:	00005617          	auipc	a2,0x5
ffffffffc0200306:	73660613          	addi	a2,a2,1846 # ffffffffc0205a38 <etext+0x1a4>
ffffffffc020030a:	00005597          	auipc	a1,0x5
ffffffffc020030e:	74e58593          	addi	a1,a1,1870 # ffffffffc0205a58 <etext+0x1c4>
ffffffffc0200312:	00005517          	auipc	a0,0x5
ffffffffc0200316:	6de50513          	addi	a0,a0,1758 # ffffffffc02059f0 <etext+0x15c>
ffffffffc020031a:	e7bff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    }
    return 0;
}
ffffffffc020031e:	60a2                	ld	ra,8(sp)
ffffffffc0200320:	4501                	li	a0,0
ffffffffc0200322:	0141                	addi	sp,sp,16
ffffffffc0200324:	8082                	ret

ffffffffc0200326 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int mon_kerninfo(int argc, char **argv, struct trapframe *tf)
{
ffffffffc0200326:	1141                	addi	sp,sp,-16
ffffffffc0200328:	e406                	sd	ra,8(sp)
    print_kerninfo();
ffffffffc020032a:	ef3ff0ef          	jal	ra,ffffffffc020021c <print_kerninfo>
    return 0;
}
ffffffffc020032e:	60a2                	ld	ra,8(sp)
ffffffffc0200330:	4501                	li	a0,0
ffffffffc0200332:	0141                	addi	sp,sp,16
ffffffffc0200334:	8082                	ret

ffffffffc0200336 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int mon_backtrace(int argc, char **argv, struct trapframe *tf)
{
ffffffffc0200336:	1141                	addi	sp,sp,-16
ffffffffc0200338:	e406                	sd	ra,8(sp)
    print_stackframe();
ffffffffc020033a:	f71ff0ef          	jal	ra,ffffffffc02002aa <print_stackframe>
    return 0;
}
ffffffffc020033e:	60a2                	ld	ra,8(sp)
ffffffffc0200340:	4501                	li	a0,0
ffffffffc0200342:	0141                	addi	sp,sp,16
ffffffffc0200344:	8082                	ret

ffffffffc0200346 <kmonitor>:
{
ffffffffc0200346:	7115                	addi	sp,sp,-224
ffffffffc0200348:	ed5e                	sd	s7,152(sp)
ffffffffc020034a:	8baa                	mv	s7,a0
    cprintf("Welcome to the kernel debug monitor!!\n");
ffffffffc020034c:	00005517          	auipc	a0,0x5
ffffffffc0200350:	71c50513          	addi	a0,a0,1820 # ffffffffc0205a68 <etext+0x1d4>
{
ffffffffc0200354:	ed86                	sd	ra,216(sp)
ffffffffc0200356:	e9a2                	sd	s0,208(sp)
ffffffffc0200358:	e5a6                	sd	s1,200(sp)
ffffffffc020035a:	e1ca                	sd	s2,192(sp)
ffffffffc020035c:	fd4e                	sd	s3,184(sp)
ffffffffc020035e:	f952                	sd	s4,176(sp)
ffffffffc0200360:	f556                	sd	s5,168(sp)
ffffffffc0200362:	f15a                	sd	s6,160(sp)
ffffffffc0200364:	e962                	sd	s8,144(sp)
ffffffffc0200366:	e566                	sd	s9,136(sp)
ffffffffc0200368:	e16a                	sd	s10,128(sp)
    cprintf("Welcome to the kernel debug monitor!!\n");
ffffffffc020036a:	e2bff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
ffffffffc020036e:	00005517          	auipc	a0,0x5
ffffffffc0200372:	72250513          	addi	a0,a0,1826 # ffffffffc0205a90 <etext+0x1fc>
ffffffffc0200376:	e1fff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    if (tf != NULL)
ffffffffc020037a:	000b8563          	beqz	s7,ffffffffc0200384 <kmonitor+0x3e>
        print_trapframe(tf);
ffffffffc020037e:	855e                	mv	a0,s7
ffffffffc0200380:	025000ef          	jal	ra,ffffffffc0200ba4 <print_trapframe>
ffffffffc0200384:	00005c17          	auipc	s8,0x5
ffffffffc0200388:	77cc0c13          	addi	s8,s8,1916 # ffffffffc0205b00 <commands>
        if ((buf = readline("K> ")) != NULL)
ffffffffc020038c:	00005917          	auipc	s2,0x5
ffffffffc0200390:	72c90913          	addi	s2,s2,1836 # ffffffffc0205ab8 <etext+0x224>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL)
ffffffffc0200394:	00005497          	auipc	s1,0x5
ffffffffc0200398:	72c48493          	addi	s1,s1,1836 # ffffffffc0205ac0 <etext+0x22c>
        if (argc == MAXARGS - 1)
ffffffffc020039c:	49bd                	li	s3,15
            cprintf("Too many arguments (max %d).\n", MAXARGS);
ffffffffc020039e:	00005b17          	auipc	s6,0x5
ffffffffc02003a2:	72ab0b13          	addi	s6,s6,1834 # ffffffffc0205ac8 <etext+0x234>
        argv[argc++] = buf;
ffffffffc02003a6:	00005a17          	auipc	s4,0x5
ffffffffc02003aa:	642a0a13          	addi	s4,s4,1602 # ffffffffc02059e8 <etext+0x154>
    for (i = 0; i < NCOMMANDS; i++)
ffffffffc02003ae:	4a8d                	li	s5,3
        if ((buf = readline("K> ")) != NULL)
ffffffffc02003b0:	854a                	mv	a0,s2
ffffffffc02003b2:	cf5ff0ef          	jal	ra,ffffffffc02000a6 <readline>
ffffffffc02003b6:	842a                	mv	s0,a0
ffffffffc02003b8:	dd65                	beqz	a0,ffffffffc02003b0 <kmonitor+0x6a>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL)
ffffffffc02003ba:	00054583          	lbu	a1,0(a0)
    int argc = 0;
ffffffffc02003be:	4c81                	li	s9,0
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL)
ffffffffc02003c0:	e1bd                	bnez	a1,ffffffffc0200426 <kmonitor+0xe0>
    if (argc == 0)
ffffffffc02003c2:	fe0c87e3          	beqz	s9,ffffffffc02003b0 <kmonitor+0x6a>
        if (strcmp(commands[i].name, argv[0]) == 0)
ffffffffc02003c6:	6582                	ld	a1,0(sp)
ffffffffc02003c8:	00005d17          	auipc	s10,0x5
ffffffffc02003cc:	738d0d13          	addi	s10,s10,1848 # ffffffffc0205b00 <commands>
        argv[argc++] = buf;
ffffffffc02003d0:	8552                	mv	a0,s4
    for (i = 0; i < NCOMMANDS; i++)
ffffffffc02003d2:	4401                	li	s0,0
ffffffffc02003d4:	0d61                	addi	s10,s10,24
        if (strcmp(commands[i].name, argv[0]) == 0)
ffffffffc02003d6:	43a050ef          	jal	ra,ffffffffc0205810 <strcmp>
ffffffffc02003da:	c919                	beqz	a0,ffffffffc02003f0 <kmonitor+0xaa>
    for (i = 0; i < NCOMMANDS; i++)
ffffffffc02003dc:	2405                	addiw	s0,s0,1
ffffffffc02003de:	0b540063          	beq	s0,s5,ffffffffc020047e <kmonitor+0x138>
        if (strcmp(commands[i].name, argv[0]) == 0)
ffffffffc02003e2:	000d3503          	ld	a0,0(s10)
ffffffffc02003e6:	6582                	ld	a1,0(sp)
    for (i = 0; i < NCOMMANDS; i++)
ffffffffc02003e8:	0d61                	addi	s10,s10,24
        if (strcmp(commands[i].name, argv[0]) == 0)
ffffffffc02003ea:	426050ef          	jal	ra,ffffffffc0205810 <strcmp>
ffffffffc02003ee:	f57d                	bnez	a0,ffffffffc02003dc <kmonitor+0x96>
            return commands[i].func(argc - 1, argv + 1, tf);
ffffffffc02003f0:	00141793          	slli	a5,s0,0x1
ffffffffc02003f4:	97a2                	add	a5,a5,s0
ffffffffc02003f6:	078e                	slli	a5,a5,0x3
ffffffffc02003f8:	97e2                	add	a5,a5,s8
ffffffffc02003fa:	6b9c                	ld	a5,16(a5)
ffffffffc02003fc:	865e                	mv	a2,s7
ffffffffc02003fe:	002c                	addi	a1,sp,8
ffffffffc0200400:	fffc851b          	addiw	a0,s9,-1
ffffffffc0200404:	9782                	jalr	a5
            if (runcmd(buf, tf) < 0)
ffffffffc0200406:	fa0555e3          	bgez	a0,ffffffffc02003b0 <kmonitor+0x6a>
}
ffffffffc020040a:	60ee                	ld	ra,216(sp)
ffffffffc020040c:	644e                	ld	s0,208(sp)
ffffffffc020040e:	64ae                	ld	s1,200(sp)
ffffffffc0200410:	690e                	ld	s2,192(sp)
ffffffffc0200412:	79ea                	ld	s3,184(sp)
ffffffffc0200414:	7a4a                	ld	s4,176(sp)
ffffffffc0200416:	7aaa                	ld	s5,168(sp)
ffffffffc0200418:	7b0a                	ld	s6,160(sp)
ffffffffc020041a:	6bea                	ld	s7,152(sp)
ffffffffc020041c:	6c4a                	ld	s8,144(sp)
ffffffffc020041e:	6caa                	ld	s9,136(sp)
ffffffffc0200420:	6d0a                	ld	s10,128(sp)
ffffffffc0200422:	612d                	addi	sp,sp,224
ffffffffc0200424:	8082                	ret
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL)
ffffffffc0200426:	8526                	mv	a0,s1
ffffffffc0200428:	42c050ef          	jal	ra,ffffffffc0205854 <strchr>
ffffffffc020042c:	c901                	beqz	a0,ffffffffc020043c <kmonitor+0xf6>
ffffffffc020042e:	00144583          	lbu	a1,1(s0)
            *buf++ = '\0';
ffffffffc0200432:	00040023          	sb	zero,0(s0)
ffffffffc0200436:	0405                	addi	s0,s0,1
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL)
ffffffffc0200438:	d5c9                	beqz	a1,ffffffffc02003c2 <kmonitor+0x7c>
ffffffffc020043a:	b7f5                	j	ffffffffc0200426 <kmonitor+0xe0>
        if (*buf == '\0')
ffffffffc020043c:	00044783          	lbu	a5,0(s0)
ffffffffc0200440:	d3c9                	beqz	a5,ffffffffc02003c2 <kmonitor+0x7c>
        if (argc == MAXARGS - 1)
ffffffffc0200442:	033c8963          	beq	s9,s3,ffffffffc0200474 <kmonitor+0x12e>
        argv[argc++] = buf;
ffffffffc0200446:	003c9793          	slli	a5,s9,0x3
ffffffffc020044a:	0118                	addi	a4,sp,128
ffffffffc020044c:	97ba                	add	a5,a5,a4
ffffffffc020044e:	f887b023          	sd	s0,-128(a5)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL)
ffffffffc0200452:	00044583          	lbu	a1,0(s0)
        argv[argc++] = buf;
ffffffffc0200456:	2c85                	addiw	s9,s9,1
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL)
ffffffffc0200458:	e591                	bnez	a1,ffffffffc0200464 <kmonitor+0x11e>
ffffffffc020045a:	b7b5                	j	ffffffffc02003c6 <kmonitor+0x80>
ffffffffc020045c:	00144583          	lbu	a1,1(s0)
            buf++;
ffffffffc0200460:	0405                	addi	s0,s0,1
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL)
ffffffffc0200462:	d1a5                	beqz	a1,ffffffffc02003c2 <kmonitor+0x7c>
ffffffffc0200464:	8526                	mv	a0,s1
ffffffffc0200466:	3ee050ef          	jal	ra,ffffffffc0205854 <strchr>
ffffffffc020046a:	d96d                	beqz	a0,ffffffffc020045c <kmonitor+0x116>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL)
ffffffffc020046c:	00044583          	lbu	a1,0(s0)
ffffffffc0200470:	d9a9                	beqz	a1,ffffffffc02003c2 <kmonitor+0x7c>
ffffffffc0200472:	bf55                	j	ffffffffc0200426 <kmonitor+0xe0>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
ffffffffc0200474:	45c1                	li	a1,16
ffffffffc0200476:	855a                	mv	a0,s6
ffffffffc0200478:	d1dff0ef          	jal	ra,ffffffffc0200194 <cprintf>
ffffffffc020047c:	b7e9                	j	ffffffffc0200446 <kmonitor+0x100>
    cprintf("Unknown command '%s'\n", argv[0]);
ffffffffc020047e:	6582                	ld	a1,0(sp)
ffffffffc0200480:	00005517          	auipc	a0,0x5
ffffffffc0200484:	66850513          	addi	a0,a0,1640 # ffffffffc0205ae8 <etext+0x254>
ffffffffc0200488:	d0dff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    return 0;
ffffffffc020048c:	b715                	j	ffffffffc02003b0 <kmonitor+0x6a>

ffffffffc020048e <__panic>:
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void __panic(const char *file, int line, const char *fmt, ...)
{
    if (is_panic)
ffffffffc020048e:	000aa317          	auipc	t1,0xaa
ffffffffc0200492:	22a30313          	addi	t1,t1,554 # ffffffffc02aa6b8 <is_panic>
ffffffffc0200496:	00033e03          	ld	t3,0(t1)
{
ffffffffc020049a:	715d                	addi	sp,sp,-80
ffffffffc020049c:	ec06                	sd	ra,24(sp)
ffffffffc020049e:	e822                	sd	s0,16(sp)
ffffffffc02004a0:	f436                	sd	a3,40(sp)
ffffffffc02004a2:	f83a                	sd	a4,48(sp)
ffffffffc02004a4:	fc3e                	sd	a5,56(sp)
ffffffffc02004a6:	e0c2                	sd	a6,64(sp)
ffffffffc02004a8:	e4c6                	sd	a7,72(sp)
    if (is_panic)
ffffffffc02004aa:	020e1a63          	bnez	t3,ffffffffc02004de <__panic+0x50>
    {
        goto panic_dead;
    }
    is_panic = 1;
ffffffffc02004ae:	4785                	li	a5,1
ffffffffc02004b0:	00f33023          	sd	a5,0(t1)

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
ffffffffc02004b4:	8432                	mv	s0,a2
ffffffffc02004b6:	103c                	addi	a5,sp,40
    cprintf("kernel panic at %s:%d:\n    ", file, line);
ffffffffc02004b8:	862e                	mv	a2,a1
ffffffffc02004ba:	85aa                	mv	a1,a0
ffffffffc02004bc:	00005517          	auipc	a0,0x5
ffffffffc02004c0:	68c50513          	addi	a0,a0,1676 # ffffffffc0205b48 <commands+0x48>
    va_start(ap, fmt);
ffffffffc02004c4:	e43e                	sd	a5,8(sp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
ffffffffc02004c6:	ccfff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    vcprintf(fmt, ap);
ffffffffc02004ca:	65a2                	ld	a1,8(sp)
ffffffffc02004cc:	8522                	mv	a0,s0
ffffffffc02004ce:	ca7ff0ef          	jal	ra,ffffffffc0200174 <vcprintf>
    cprintf("\n");
ffffffffc02004d2:	00006517          	auipc	a0,0x6
ffffffffc02004d6:	76e50513          	addi	a0,a0,1902 # ffffffffc0206c40 <default_pmm_manager+0x578>
ffffffffc02004da:	cbbff0ef          	jal	ra,ffffffffc0200194 <cprintf>
#endif
}

static inline void sbi_shutdown(void)
{
	SBI_CALL_0(SBI_SHUTDOWN);
ffffffffc02004de:	4501                	li	a0,0
ffffffffc02004e0:	4581                	li	a1,0
ffffffffc02004e2:	4601                	li	a2,0
ffffffffc02004e4:	48a1                	li	a7,8
ffffffffc02004e6:	00000073          	ecall
    va_end(ap);

panic_dead:
    // No debug monitor here
    sbi_shutdown();
    intr_disable();
ffffffffc02004ea:	4ca000ef          	jal	ra,ffffffffc02009b4 <intr_disable>
    while (1)
    {
        kmonitor(NULL);
ffffffffc02004ee:	4501                	li	a0,0
ffffffffc02004f0:	e57ff0ef          	jal	ra,ffffffffc0200346 <kmonitor>
    while (1)
ffffffffc02004f4:	bfed                	j	ffffffffc02004ee <__panic+0x60>

ffffffffc02004f6 <__warn>:
    }
}

/* __warn - like panic, but don't */
void __warn(const char *file, int line, const char *fmt, ...)
{
ffffffffc02004f6:	715d                	addi	sp,sp,-80
ffffffffc02004f8:	832e                	mv	t1,a1
ffffffffc02004fa:	e822                	sd	s0,16(sp)
    va_list ap;
    va_start(ap, fmt);
    cprintf("kernel warning at %s:%d:\n    ", file, line);
ffffffffc02004fc:	85aa                	mv	a1,a0
{
ffffffffc02004fe:	8432                	mv	s0,a2
ffffffffc0200500:	fc3e                	sd	a5,56(sp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
ffffffffc0200502:	861a                	mv	a2,t1
    va_start(ap, fmt);
ffffffffc0200504:	103c                	addi	a5,sp,40
    cprintf("kernel warning at %s:%d:\n    ", file, line);
ffffffffc0200506:	00005517          	auipc	a0,0x5
ffffffffc020050a:	66250513          	addi	a0,a0,1634 # ffffffffc0205b68 <commands+0x68>
{
ffffffffc020050e:	ec06                	sd	ra,24(sp)
ffffffffc0200510:	f436                	sd	a3,40(sp)
ffffffffc0200512:	f83a                	sd	a4,48(sp)
ffffffffc0200514:	e0c2                	sd	a6,64(sp)
ffffffffc0200516:	e4c6                	sd	a7,72(sp)
    va_start(ap, fmt);
ffffffffc0200518:	e43e                	sd	a5,8(sp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
ffffffffc020051a:	c7bff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    vcprintf(fmt, ap);
ffffffffc020051e:	65a2                	ld	a1,8(sp)
ffffffffc0200520:	8522                	mv	a0,s0
ffffffffc0200522:	c53ff0ef          	jal	ra,ffffffffc0200174 <vcprintf>
    cprintf("\n");
ffffffffc0200526:	00006517          	auipc	a0,0x6
ffffffffc020052a:	71a50513          	addi	a0,a0,1818 # ffffffffc0206c40 <default_pmm_manager+0x578>
ffffffffc020052e:	c67ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    va_end(ap);
}
ffffffffc0200532:	60e2                	ld	ra,24(sp)
ffffffffc0200534:	6442                	ld	s0,16(sp)
ffffffffc0200536:	6161                	addi	sp,sp,80
ffffffffc0200538:	8082                	ret

ffffffffc020053a <clock_init>:
 * and then enable IRQ_TIMER.
 * */
void clock_init(void) {
    // divided by 500 when using Spike(2MHz)
    // divided by 100 when using QEMU(10MHz)
    timebase = 1e7 / 100;
ffffffffc020053a:	67e1                	lui	a5,0x18
ffffffffc020053c:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_obj___user_exit_out_size+0xd580>
ffffffffc0200540:	000aa717          	auipc	a4,0xaa
ffffffffc0200544:	18f73423          	sd	a5,392(a4) # ffffffffc02aa6c8 <timebase>
    __asm__ __volatile__("rdtime %0" : "=r"(n));
ffffffffc0200548:	c0102573          	rdtime	a0
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
ffffffffc020054c:	4581                	li	a1,0
    ticks = 0;

    cprintf("++ setup timer interrupts\n");
}

void clock_set_next_event(void) { sbi_set_timer(get_cycles() + timebase); }
ffffffffc020054e:	953e                	add	a0,a0,a5
ffffffffc0200550:	4601                	li	a2,0
ffffffffc0200552:	4881                	li	a7,0
ffffffffc0200554:	00000073          	ecall
    set_csr(sie, MIP_STIP);
ffffffffc0200558:	02000793          	li	a5,32
ffffffffc020055c:	1047a7f3          	csrrs	a5,sie,a5
    cprintf("++ setup timer interrupts\n");
ffffffffc0200560:	00005517          	auipc	a0,0x5
ffffffffc0200564:	62850513          	addi	a0,a0,1576 # ffffffffc0205b88 <commands+0x88>
    ticks = 0;
ffffffffc0200568:	000aa797          	auipc	a5,0xaa
ffffffffc020056c:	1407bc23          	sd	zero,344(a5) # ffffffffc02aa6c0 <ticks>
    cprintf("++ setup timer interrupts\n");
ffffffffc0200570:	b115                	j	ffffffffc0200194 <cprintf>

ffffffffc0200572 <clock_set_next_event>:
    __asm__ __volatile__("rdtime %0" : "=r"(n));
ffffffffc0200572:	c0102573          	rdtime	a0
void clock_set_next_event(void) { sbi_set_timer(get_cycles() + timebase); }
ffffffffc0200576:	000aa797          	auipc	a5,0xaa
ffffffffc020057a:	1527b783          	ld	a5,338(a5) # ffffffffc02aa6c8 <timebase>
ffffffffc020057e:	953e                	add	a0,a0,a5
ffffffffc0200580:	4581                	li	a1,0
ffffffffc0200582:	4601                	li	a2,0
ffffffffc0200584:	4881                	li	a7,0
ffffffffc0200586:	00000073          	ecall
ffffffffc020058a:	8082                	ret

ffffffffc020058c <cons_init>:

/* serial_intr - try to feed input characters from serial port */
void serial_intr(void) {}

/* cons_init - initializes the console devices */
void cons_init(void) {}
ffffffffc020058c:	8082                	ret

ffffffffc020058e <cons_putc>:
#include <riscv.h>
#include <assert.h>

static inline bool __intr_save(void)
{
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc020058e:	100027f3          	csrr	a5,sstatus
ffffffffc0200592:	8b89                	andi	a5,a5,2
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
ffffffffc0200594:	0ff57513          	zext.b	a0,a0
ffffffffc0200598:	e799                	bnez	a5,ffffffffc02005a6 <cons_putc+0x18>
ffffffffc020059a:	4581                	li	a1,0
ffffffffc020059c:	4601                	li	a2,0
ffffffffc020059e:	4885                	li	a7,1
ffffffffc02005a0:	00000073          	ecall
    return 0;
}

static inline void __intr_restore(bool flag)
{
    if (flag)
ffffffffc02005a4:	8082                	ret

/* cons_putc - print a single character @c to console devices */
void cons_putc(int c) {
ffffffffc02005a6:	1101                	addi	sp,sp,-32
ffffffffc02005a8:	ec06                	sd	ra,24(sp)
ffffffffc02005aa:	e42a                	sd	a0,8(sp)
        intr_disable();
ffffffffc02005ac:	408000ef          	jal	ra,ffffffffc02009b4 <intr_disable>
ffffffffc02005b0:	6522                	ld	a0,8(sp)
ffffffffc02005b2:	4581                	li	a1,0
ffffffffc02005b4:	4601                	li	a2,0
ffffffffc02005b6:	4885                	li	a7,1
ffffffffc02005b8:	00000073          	ecall
    local_intr_save(intr_flag);
    {
        sbi_console_putchar((unsigned char)c);
    }
    local_intr_restore(intr_flag);
}
ffffffffc02005bc:	60e2                	ld	ra,24(sp)
ffffffffc02005be:	6105                	addi	sp,sp,32
    {
        intr_enable();
ffffffffc02005c0:	a6fd                	j	ffffffffc02009ae <intr_enable>

ffffffffc02005c2 <cons_getc>:
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02005c2:	100027f3          	csrr	a5,sstatus
ffffffffc02005c6:	8b89                	andi	a5,a5,2
ffffffffc02005c8:	eb89                	bnez	a5,ffffffffc02005da <cons_getc+0x18>
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
ffffffffc02005ca:	4501                	li	a0,0
ffffffffc02005cc:	4581                	li	a1,0
ffffffffc02005ce:	4601                	li	a2,0
ffffffffc02005d0:	4889                	li	a7,2
ffffffffc02005d2:	00000073          	ecall
ffffffffc02005d6:	2501                	sext.w	a0,a0
    {
        c = sbi_console_getchar();
    }
    local_intr_restore(intr_flag);
    return c;
}
ffffffffc02005d8:	8082                	ret
int cons_getc(void) {
ffffffffc02005da:	1101                	addi	sp,sp,-32
ffffffffc02005dc:	ec06                	sd	ra,24(sp)
        intr_disable();
ffffffffc02005de:	3d6000ef          	jal	ra,ffffffffc02009b4 <intr_disable>
ffffffffc02005e2:	4501                	li	a0,0
ffffffffc02005e4:	4581                	li	a1,0
ffffffffc02005e6:	4601                	li	a2,0
ffffffffc02005e8:	4889                	li	a7,2
ffffffffc02005ea:	00000073          	ecall
ffffffffc02005ee:	2501                	sext.w	a0,a0
ffffffffc02005f0:	e42a                	sd	a0,8(sp)
        intr_enable();
ffffffffc02005f2:	3bc000ef          	jal	ra,ffffffffc02009ae <intr_enable>
}
ffffffffc02005f6:	60e2                	ld	ra,24(sp)
ffffffffc02005f8:	6522                	ld	a0,8(sp)
ffffffffc02005fa:	6105                	addi	sp,sp,32
ffffffffc02005fc:	8082                	ret

ffffffffc02005fe <dtb_init>:

// 保存解析出的系统物理内存信息
static uint64_t memory_base = 0;
static uint64_t memory_size = 0;

void dtb_init(void) {
ffffffffc02005fe:	7119                	addi	sp,sp,-128
    cprintf("DTB Init\n");
ffffffffc0200600:	00005517          	auipc	a0,0x5
ffffffffc0200604:	5a850513          	addi	a0,a0,1448 # ffffffffc0205ba8 <commands+0xa8>
void dtb_init(void) {
ffffffffc0200608:	fc86                	sd	ra,120(sp)
ffffffffc020060a:	f8a2                	sd	s0,112(sp)
ffffffffc020060c:	e8d2                	sd	s4,80(sp)
ffffffffc020060e:	f4a6                	sd	s1,104(sp)
ffffffffc0200610:	f0ca                	sd	s2,96(sp)
ffffffffc0200612:	ecce                	sd	s3,88(sp)
ffffffffc0200614:	e4d6                	sd	s5,72(sp)
ffffffffc0200616:	e0da                	sd	s6,64(sp)
ffffffffc0200618:	fc5e                	sd	s7,56(sp)
ffffffffc020061a:	f862                	sd	s8,48(sp)
ffffffffc020061c:	f466                	sd	s9,40(sp)
ffffffffc020061e:	f06a                	sd	s10,32(sp)
ffffffffc0200620:	ec6e                	sd	s11,24(sp)
    cprintf("DTB Init\n");
ffffffffc0200622:	b73ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("HartID: %ld\n", boot_hartid);
ffffffffc0200626:	0000b597          	auipc	a1,0xb
ffffffffc020062a:	9da5b583          	ld	a1,-1574(a1) # ffffffffc020b000 <boot_hartid>
ffffffffc020062e:	00005517          	auipc	a0,0x5
ffffffffc0200632:	58a50513          	addi	a0,a0,1418 # ffffffffc0205bb8 <commands+0xb8>
ffffffffc0200636:	b5fff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("DTB Address: 0x%lx\n", boot_dtb);
ffffffffc020063a:	0000b417          	auipc	s0,0xb
ffffffffc020063e:	9ce40413          	addi	s0,s0,-1586 # ffffffffc020b008 <boot_dtb>
ffffffffc0200642:	600c                	ld	a1,0(s0)
ffffffffc0200644:	00005517          	auipc	a0,0x5
ffffffffc0200648:	58450513          	addi	a0,a0,1412 # ffffffffc0205bc8 <commands+0xc8>
ffffffffc020064c:	b49ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    
    if (boot_dtb == 0) {
ffffffffc0200650:	00043a03          	ld	s4,0(s0)
        cprintf("Error: DTB address is null\n");
ffffffffc0200654:	00005517          	auipc	a0,0x5
ffffffffc0200658:	58c50513          	addi	a0,a0,1420 # ffffffffc0205be0 <commands+0xe0>
    if (boot_dtb == 0) {
ffffffffc020065c:	120a0463          	beqz	s4,ffffffffc0200784 <dtb_init+0x186>
        return;
    }
    
    // 转换为虚拟地址
    uintptr_t dtb_vaddr = boot_dtb + PHYSICAL_MEMORY_OFFSET;
ffffffffc0200660:	57f5                	li	a5,-3
ffffffffc0200662:	07fa                	slli	a5,a5,0x1e
ffffffffc0200664:	00fa0733          	add	a4,s4,a5
    const struct fdt_header *header = (const struct fdt_header *)dtb_vaddr;
    
    // 验证DTB
    uint32_t magic = fdt32_to_cpu(header->magic);
ffffffffc0200668:	431c                	lw	a5,0(a4)
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020066a:	00ff0637          	lui	a2,0xff0
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020066e:	6b41                	lui	s6,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200670:	0087d59b          	srliw	a1,a5,0x8
ffffffffc0200674:	0187969b          	slliw	a3,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200678:	0187d51b          	srliw	a0,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020067c:	0105959b          	slliw	a1,a1,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200680:	0107d79b          	srliw	a5,a5,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200684:	8df1                	and	a1,a1,a2
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200686:	8ec9                	or	a3,a3,a0
ffffffffc0200688:	0087979b          	slliw	a5,a5,0x8
ffffffffc020068c:	1b7d                	addi	s6,s6,-1
ffffffffc020068e:	0167f7b3          	and	a5,a5,s6
ffffffffc0200692:	8dd5                	or	a1,a1,a3
ffffffffc0200694:	8ddd                	or	a1,a1,a5
    if (magic != 0xd00dfeed) {
ffffffffc0200696:	d00e07b7          	lui	a5,0xd00e0
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020069a:	2581                	sext.w	a1,a1
    if (magic != 0xd00dfeed) {
ffffffffc020069c:	eed78793          	addi	a5,a5,-275 # ffffffffd00dfeed <end+0xfe357b9>
ffffffffc02006a0:	10f59163          	bne	a1,a5,ffffffffc02007a2 <dtb_init+0x1a4>
        return;
    }
    
    // 提取内存信息
    uint64_t mem_base, mem_size;
    if (extract_memory_info(dtb_vaddr, header, &mem_base, &mem_size) == 0) {
ffffffffc02006a4:	471c                	lw	a5,8(a4)
ffffffffc02006a6:	4754                	lw	a3,12(a4)
    int in_memory_node = 0;
ffffffffc02006a8:	4c81                	li	s9,0
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006aa:	0087d59b          	srliw	a1,a5,0x8
ffffffffc02006ae:	0086d51b          	srliw	a0,a3,0x8
ffffffffc02006b2:	0186941b          	slliw	s0,a3,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02006b6:	0186d89b          	srliw	a7,a3,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006ba:	01879a1b          	slliw	s4,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02006be:	0187d81b          	srliw	a6,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006c2:	0105151b          	slliw	a0,a0,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02006c6:	0106d69b          	srliw	a3,a3,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006ca:	0105959b          	slliw	a1,a1,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02006ce:	0107d79b          	srliw	a5,a5,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006d2:	8d71                	and	a0,a0,a2
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02006d4:	01146433          	or	s0,s0,a7
ffffffffc02006d8:	0086969b          	slliw	a3,a3,0x8
ffffffffc02006dc:	010a6a33          	or	s4,s4,a6
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006e0:	8e6d                	and	a2,a2,a1
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02006e2:	0087979b          	slliw	a5,a5,0x8
ffffffffc02006e6:	8c49                	or	s0,s0,a0
ffffffffc02006e8:	0166f6b3          	and	a3,a3,s6
ffffffffc02006ec:	00ca6a33          	or	s4,s4,a2
ffffffffc02006f0:	0167f7b3          	and	a5,a5,s6
ffffffffc02006f4:	8c55                	or	s0,s0,a3
ffffffffc02006f6:	00fa6a33          	or	s4,s4,a5
    const char *strings_base = (const char *)(dtb_vaddr + strings_offset);
ffffffffc02006fa:	1402                	slli	s0,s0,0x20
    const uint32_t *struct_ptr = (const uint32_t *)(dtb_vaddr + struct_offset);
ffffffffc02006fc:	1a02                	slli	s4,s4,0x20
    const char *strings_base = (const char *)(dtb_vaddr + strings_offset);
ffffffffc02006fe:	9001                	srli	s0,s0,0x20
    const uint32_t *struct_ptr = (const uint32_t *)(dtb_vaddr + struct_offset);
ffffffffc0200700:	020a5a13          	srli	s4,s4,0x20
    const char *strings_base = (const char *)(dtb_vaddr + strings_offset);
ffffffffc0200704:	943a                	add	s0,s0,a4
    const uint32_t *struct_ptr = (const uint32_t *)(dtb_vaddr + struct_offset);
ffffffffc0200706:	9a3a                	add	s4,s4,a4
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200708:	00ff0c37          	lui	s8,0xff0
        switch (token) {
ffffffffc020070c:	4b8d                	li	s7,3
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc020070e:	00005917          	auipc	s2,0x5
ffffffffc0200712:	52290913          	addi	s2,s2,1314 # ffffffffc0205c30 <commands+0x130>
ffffffffc0200716:	49bd                	li	s3,15
        switch (token) {
ffffffffc0200718:	4d91                	li	s11,4
ffffffffc020071a:	4d05                	li	s10,1
                if (strncmp(name, "memory", 6) == 0) {
ffffffffc020071c:	00005497          	auipc	s1,0x5
ffffffffc0200720:	50c48493          	addi	s1,s1,1292 # ffffffffc0205c28 <commands+0x128>
        uint32_t token = fdt32_to_cpu(*struct_ptr++);
ffffffffc0200724:	000a2703          	lw	a4,0(s4)
ffffffffc0200728:	004a0a93          	addi	s5,s4,4
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020072c:	0087569b          	srliw	a3,a4,0x8
ffffffffc0200730:	0187179b          	slliw	a5,a4,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200734:	0187561b          	srliw	a2,a4,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200738:	0106969b          	slliw	a3,a3,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020073c:	0107571b          	srliw	a4,a4,0x10
ffffffffc0200740:	8fd1                	or	a5,a5,a2
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200742:	0186f6b3          	and	a3,a3,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200746:	0087171b          	slliw	a4,a4,0x8
ffffffffc020074a:	8fd5                	or	a5,a5,a3
ffffffffc020074c:	00eb7733          	and	a4,s6,a4
ffffffffc0200750:	8fd9                	or	a5,a5,a4
ffffffffc0200752:	2781                	sext.w	a5,a5
        switch (token) {
ffffffffc0200754:	09778c63          	beq	a5,s7,ffffffffc02007ec <dtb_init+0x1ee>
ffffffffc0200758:	00fbea63          	bltu	s7,a5,ffffffffc020076c <dtb_init+0x16e>
ffffffffc020075c:	07a78663          	beq	a5,s10,ffffffffc02007c8 <dtb_init+0x1ca>
ffffffffc0200760:	4709                	li	a4,2
ffffffffc0200762:	00e79763          	bne	a5,a4,ffffffffc0200770 <dtb_init+0x172>
ffffffffc0200766:	4c81                	li	s9,0
ffffffffc0200768:	8a56                	mv	s4,s5
ffffffffc020076a:	bf6d                	j	ffffffffc0200724 <dtb_init+0x126>
ffffffffc020076c:	ffb78ee3          	beq	a5,s11,ffffffffc0200768 <dtb_init+0x16a>
        cprintf("  End:  0x%016lx\n", mem_base + mem_size - 1);
        // 保存到全局变量，供 PMM 查询
        memory_base = mem_base;
        memory_size = mem_size;
    } else {
        cprintf("Warning: Could not extract memory info from DTB\n");
ffffffffc0200770:	00005517          	auipc	a0,0x5
ffffffffc0200774:	53850513          	addi	a0,a0,1336 # ffffffffc0205ca8 <commands+0x1a8>
ffffffffc0200778:	a1dff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    }
    cprintf("DTB init completed\n");
ffffffffc020077c:	00005517          	auipc	a0,0x5
ffffffffc0200780:	56450513          	addi	a0,a0,1380 # ffffffffc0205ce0 <commands+0x1e0>
}
ffffffffc0200784:	7446                	ld	s0,112(sp)
ffffffffc0200786:	70e6                	ld	ra,120(sp)
ffffffffc0200788:	74a6                	ld	s1,104(sp)
ffffffffc020078a:	7906                	ld	s2,96(sp)
ffffffffc020078c:	69e6                	ld	s3,88(sp)
ffffffffc020078e:	6a46                	ld	s4,80(sp)
ffffffffc0200790:	6aa6                	ld	s5,72(sp)
ffffffffc0200792:	6b06                	ld	s6,64(sp)
ffffffffc0200794:	7be2                	ld	s7,56(sp)
ffffffffc0200796:	7c42                	ld	s8,48(sp)
ffffffffc0200798:	7ca2                	ld	s9,40(sp)
ffffffffc020079a:	7d02                	ld	s10,32(sp)
ffffffffc020079c:	6de2                	ld	s11,24(sp)
ffffffffc020079e:	6109                	addi	sp,sp,128
    cprintf("DTB init completed\n");
ffffffffc02007a0:	bad5                	j	ffffffffc0200194 <cprintf>
}
ffffffffc02007a2:	7446                	ld	s0,112(sp)
ffffffffc02007a4:	70e6                	ld	ra,120(sp)
ffffffffc02007a6:	74a6                	ld	s1,104(sp)
ffffffffc02007a8:	7906                	ld	s2,96(sp)
ffffffffc02007aa:	69e6                	ld	s3,88(sp)
ffffffffc02007ac:	6a46                	ld	s4,80(sp)
ffffffffc02007ae:	6aa6                	ld	s5,72(sp)
ffffffffc02007b0:	6b06                	ld	s6,64(sp)
ffffffffc02007b2:	7be2                	ld	s7,56(sp)
ffffffffc02007b4:	7c42                	ld	s8,48(sp)
ffffffffc02007b6:	7ca2                	ld	s9,40(sp)
ffffffffc02007b8:	7d02                	ld	s10,32(sp)
ffffffffc02007ba:	6de2                	ld	s11,24(sp)
        cprintf("Error: Invalid DTB magic number: 0x%x\n", magic);
ffffffffc02007bc:	00005517          	auipc	a0,0x5
ffffffffc02007c0:	44450513          	addi	a0,a0,1092 # ffffffffc0205c00 <commands+0x100>
}
ffffffffc02007c4:	6109                	addi	sp,sp,128
        cprintf("Error: Invalid DTB magic number: 0x%x\n", magic);
ffffffffc02007c6:	b2f9                	j	ffffffffc0200194 <cprintf>
                int name_len = strlen(name);
ffffffffc02007c8:	8556                	mv	a0,s5
ffffffffc02007ca:	7ff040ef          	jal	ra,ffffffffc02057c8 <strlen>
ffffffffc02007ce:	8a2a                	mv	s4,a0
                if (strncmp(name, "memory", 6) == 0) {
ffffffffc02007d0:	4619                	li	a2,6
ffffffffc02007d2:	85a6                	mv	a1,s1
ffffffffc02007d4:	8556                	mv	a0,s5
                int name_len = strlen(name);
ffffffffc02007d6:	2a01                	sext.w	s4,s4
                if (strncmp(name, "memory", 6) == 0) {
ffffffffc02007d8:	056050ef          	jal	ra,ffffffffc020582e <strncmp>
ffffffffc02007dc:	e111                	bnez	a0,ffffffffc02007e0 <dtb_init+0x1e2>
                    in_memory_node = 1;
ffffffffc02007de:	4c85                	li	s9,1
                struct_ptr = (const uint32_t *)(((uintptr_t)struct_ptr + name_len + 4) & ~3);
ffffffffc02007e0:	0a91                	addi	s5,s5,4
ffffffffc02007e2:	9ad2                	add	s5,s5,s4
ffffffffc02007e4:	ffcafa93          	andi	s5,s5,-4
        switch (token) {
ffffffffc02007e8:	8a56                	mv	s4,s5
ffffffffc02007ea:	bf2d                	j	ffffffffc0200724 <dtb_init+0x126>
                uint32_t prop_len = fdt32_to_cpu(*struct_ptr++);
ffffffffc02007ec:	004a2783          	lw	a5,4(s4)
                uint32_t prop_nameoff = fdt32_to_cpu(*struct_ptr++);
ffffffffc02007f0:	00ca0693          	addi	a3,s4,12
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02007f4:	0087d71b          	srliw	a4,a5,0x8
ffffffffc02007f8:	01879a9b          	slliw	s5,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02007fc:	0187d61b          	srliw	a2,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200800:	0107171b          	slliw	a4,a4,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200804:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200808:	00caeab3          	or	s5,s5,a2
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020080c:	01877733          	and	a4,a4,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200810:	0087979b          	slliw	a5,a5,0x8
ffffffffc0200814:	00eaeab3          	or	s5,s5,a4
ffffffffc0200818:	00fb77b3          	and	a5,s6,a5
ffffffffc020081c:	00faeab3          	or	s5,s5,a5
ffffffffc0200820:	2a81                	sext.w	s5,s5
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc0200822:	000c9c63          	bnez	s9,ffffffffc020083a <dtb_init+0x23c>
                struct_ptr = (const uint32_t *)(((uintptr_t)struct_ptr + prop_len + 3) & ~3);
ffffffffc0200826:	1a82                	slli	s5,s5,0x20
ffffffffc0200828:	00368793          	addi	a5,a3,3
ffffffffc020082c:	020ada93          	srli	s5,s5,0x20
ffffffffc0200830:	9abe                	add	s5,s5,a5
ffffffffc0200832:	ffcafa93          	andi	s5,s5,-4
        switch (token) {
ffffffffc0200836:	8a56                	mv	s4,s5
ffffffffc0200838:	b5f5                	j	ffffffffc0200724 <dtb_init+0x126>
                uint32_t prop_nameoff = fdt32_to_cpu(*struct_ptr++);
ffffffffc020083a:	008a2783          	lw	a5,8(s4)
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc020083e:	85ca                	mv	a1,s2
ffffffffc0200840:	e436                	sd	a3,8(sp)
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200842:	0087d51b          	srliw	a0,a5,0x8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200846:	0187d61b          	srliw	a2,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020084a:	0187971b          	slliw	a4,a5,0x18
ffffffffc020084e:	0105151b          	slliw	a0,a0,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200852:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200856:	8f51                	or	a4,a4,a2
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200858:	01857533          	and	a0,a0,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020085c:	0087979b          	slliw	a5,a5,0x8
ffffffffc0200860:	8d59                	or	a0,a0,a4
ffffffffc0200862:	00fb77b3          	and	a5,s6,a5
ffffffffc0200866:	8d5d                	or	a0,a0,a5
                const char *prop_name = strings_base + prop_nameoff;
ffffffffc0200868:	1502                	slli	a0,a0,0x20
ffffffffc020086a:	9101                	srli	a0,a0,0x20
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc020086c:	9522                	add	a0,a0,s0
ffffffffc020086e:	7a3040ef          	jal	ra,ffffffffc0205810 <strcmp>
ffffffffc0200872:	66a2                	ld	a3,8(sp)
ffffffffc0200874:	f94d                	bnez	a0,ffffffffc0200826 <dtb_init+0x228>
ffffffffc0200876:	fb59f8e3          	bgeu	s3,s5,ffffffffc0200826 <dtb_init+0x228>
                    *mem_base = fdt64_to_cpu(reg_data[0]);
ffffffffc020087a:	00ca3783          	ld	a5,12(s4)
                    *mem_size = fdt64_to_cpu(reg_data[1]);
ffffffffc020087e:	014a3703          	ld	a4,20(s4)
        cprintf("Physical Memory from DTB:\n");
ffffffffc0200882:	00005517          	auipc	a0,0x5
ffffffffc0200886:	3b650513          	addi	a0,a0,950 # ffffffffc0205c38 <commands+0x138>
           fdt32_to_cpu(x >> 32);
ffffffffc020088a:	4207d613          	srai	a2,a5,0x20
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020088e:	0087d31b          	srliw	t1,a5,0x8
           fdt32_to_cpu(x >> 32);
ffffffffc0200892:	42075593          	srai	a1,a4,0x20
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200896:	0187de1b          	srliw	t3,a5,0x18
ffffffffc020089a:	0186581b          	srliw	a6,a2,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020089e:	0187941b          	slliw	s0,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02008a2:	0107d89b          	srliw	a7,a5,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02008a6:	0187d693          	srli	a3,a5,0x18
ffffffffc02008aa:	01861f1b          	slliw	t5,a2,0x18
ffffffffc02008ae:	0087579b          	srliw	a5,a4,0x8
ffffffffc02008b2:	0103131b          	slliw	t1,t1,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02008b6:	0106561b          	srliw	a2,a2,0x10
ffffffffc02008ba:	010f6f33          	or	t5,t5,a6
ffffffffc02008be:	0187529b          	srliw	t0,a4,0x18
ffffffffc02008c2:	0185df9b          	srliw	t6,a1,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02008c6:	01837333          	and	t1,t1,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02008ca:	01c46433          	or	s0,s0,t3
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02008ce:	0186f6b3          	and	a3,a3,s8
ffffffffc02008d2:	01859e1b          	slliw	t3,a1,0x18
ffffffffc02008d6:	01871e9b          	slliw	t4,a4,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02008da:	0107581b          	srliw	a6,a4,0x10
ffffffffc02008de:	0086161b          	slliw	a2,a2,0x8
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02008e2:	8361                	srli	a4,a4,0x18
ffffffffc02008e4:	0107979b          	slliw	a5,a5,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02008e8:	0105d59b          	srliw	a1,a1,0x10
ffffffffc02008ec:	01e6e6b3          	or	a3,a3,t5
ffffffffc02008f0:	00cb7633          	and	a2,s6,a2
ffffffffc02008f4:	0088181b          	slliw	a6,a6,0x8
ffffffffc02008f8:	0085959b          	slliw	a1,a1,0x8
ffffffffc02008fc:	00646433          	or	s0,s0,t1
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200900:	0187f7b3          	and	a5,a5,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200904:	01fe6333          	or	t1,t3,t6
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200908:	01877c33          	and	s8,a4,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020090c:	0088989b          	slliw	a7,a7,0x8
ffffffffc0200910:	011b78b3          	and	a7,s6,a7
ffffffffc0200914:	005eeeb3          	or	t4,t4,t0
ffffffffc0200918:	00c6e733          	or	a4,a3,a2
ffffffffc020091c:	006c6c33          	or	s8,s8,t1
ffffffffc0200920:	010b76b3          	and	a3,s6,a6
ffffffffc0200924:	00bb7b33          	and	s6,s6,a1
ffffffffc0200928:	01d7e7b3          	or	a5,a5,t4
ffffffffc020092c:	016c6b33          	or	s6,s8,s6
ffffffffc0200930:	01146433          	or	s0,s0,a7
ffffffffc0200934:	8fd5                	or	a5,a5,a3
           fdt32_to_cpu(x >> 32);
ffffffffc0200936:	1702                	slli	a4,a4,0x20
ffffffffc0200938:	1b02                	slli	s6,s6,0x20
    return ((uint64_t)fdt32_to_cpu(x & 0xffffffff) << 32) | 
ffffffffc020093a:	1782                	slli	a5,a5,0x20
           fdt32_to_cpu(x >> 32);
ffffffffc020093c:	9301                	srli	a4,a4,0x20
    return ((uint64_t)fdt32_to_cpu(x & 0xffffffff) << 32) | 
ffffffffc020093e:	1402                	slli	s0,s0,0x20
           fdt32_to_cpu(x >> 32);
ffffffffc0200940:	020b5b13          	srli	s6,s6,0x20
    return ((uint64_t)fdt32_to_cpu(x & 0xffffffff) << 32) | 
ffffffffc0200944:	0167eb33          	or	s6,a5,s6
ffffffffc0200948:	8c59                	or	s0,s0,a4
        cprintf("Physical Memory from DTB:\n");
ffffffffc020094a:	84bff0ef          	jal	ra,ffffffffc0200194 <cprintf>
        cprintf("  Base: 0x%016lx\n", mem_base);
ffffffffc020094e:	85a2                	mv	a1,s0
ffffffffc0200950:	00005517          	auipc	a0,0x5
ffffffffc0200954:	30850513          	addi	a0,a0,776 # ffffffffc0205c58 <commands+0x158>
ffffffffc0200958:	83dff0ef          	jal	ra,ffffffffc0200194 <cprintf>
        cprintf("  Size: 0x%016lx (%ld MB)\n", mem_size, mem_size / (1024 * 1024));
ffffffffc020095c:	014b5613          	srli	a2,s6,0x14
ffffffffc0200960:	85da                	mv	a1,s6
ffffffffc0200962:	00005517          	auipc	a0,0x5
ffffffffc0200966:	30e50513          	addi	a0,a0,782 # ffffffffc0205c70 <commands+0x170>
ffffffffc020096a:	82bff0ef          	jal	ra,ffffffffc0200194 <cprintf>
        cprintf("  End:  0x%016lx\n", mem_base + mem_size - 1);
ffffffffc020096e:	008b05b3          	add	a1,s6,s0
ffffffffc0200972:	15fd                	addi	a1,a1,-1
ffffffffc0200974:	00005517          	auipc	a0,0x5
ffffffffc0200978:	31c50513          	addi	a0,a0,796 # ffffffffc0205c90 <commands+0x190>
ffffffffc020097c:	819ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("DTB init completed\n");
ffffffffc0200980:	00005517          	auipc	a0,0x5
ffffffffc0200984:	36050513          	addi	a0,a0,864 # ffffffffc0205ce0 <commands+0x1e0>
        memory_base = mem_base;
ffffffffc0200988:	000aa797          	auipc	a5,0xaa
ffffffffc020098c:	d487b423          	sd	s0,-696(a5) # ffffffffc02aa6d0 <memory_base>
        memory_size = mem_size;
ffffffffc0200990:	000aa797          	auipc	a5,0xaa
ffffffffc0200994:	d567b423          	sd	s6,-696(a5) # ffffffffc02aa6d8 <memory_size>
    cprintf("DTB init completed\n");
ffffffffc0200998:	b3f5                	j	ffffffffc0200784 <dtb_init+0x186>

ffffffffc020099a <get_memory_base>:

uint64_t get_memory_base(void) {
    return memory_base;
}
ffffffffc020099a:	000aa517          	auipc	a0,0xaa
ffffffffc020099e:	d3653503          	ld	a0,-714(a0) # ffffffffc02aa6d0 <memory_base>
ffffffffc02009a2:	8082                	ret

ffffffffc02009a4 <get_memory_size>:

uint64_t get_memory_size(void) {
    return memory_size;
}
ffffffffc02009a4:	000aa517          	auipc	a0,0xaa
ffffffffc02009a8:	d3453503          	ld	a0,-716(a0) # ffffffffc02aa6d8 <memory_size>
ffffffffc02009ac:	8082                	ret

ffffffffc02009ae <intr_enable>:
#include <intr.h>
#include <riscv.h>

/* intr_enable - enable irq interrupt */
void intr_enable(void) { set_csr(sstatus, SSTATUS_SIE); }
ffffffffc02009ae:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc02009b2:	8082                	ret

ffffffffc02009b4 <intr_disable>:

/* intr_disable - disable irq interrupt */
void intr_disable(void) { clear_csr(sstatus, SSTATUS_SIE); }
ffffffffc02009b4:	100177f3          	csrrci	a5,sstatus,2
ffffffffc02009b8:	8082                	ret

ffffffffc02009ba <pic_init>:
#include <picirq.h>

void pic_enable(unsigned int irq) {}

/* pic_init - initialize the 8259A interrupt controllers */
void pic_init(void) {}
ffffffffc02009ba:	8082                	ret

ffffffffc02009bc <idt_init>:
void idt_init(void)
{
    extern void __alltraps(void);
    /* Set sscratch register to 0, indicating to exception vector that we are
     * presently executing in the kernel */
    write_csr(sscratch, 0);
ffffffffc02009bc:	14005073          	csrwi	sscratch,0
    /* Set the exception vector address */
    write_csr(stvec, &__alltraps);
ffffffffc02009c0:	00000797          	auipc	a5,0x0
ffffffffc02009c4:	48078793          	addi	a5,a5,1152 # ffffffffc0200e40 <__alltraps>
ffffffffc02009c8:	10579073          	csrw	stvec,a5
    /* Allow kernel to access user memory */
    set_csr(sstatus, SSTATUS_SUM);
ffffffffc02009cc:	000407b7          	lui	a5,0x40
ffffffffc02009d0:	1007a7f3          	csrrs	a5,sstatus,a5
}
ffffffffc02009d4:	8082                	ret

ffffffffc02009d6 <print_regs>:
    cprintf("  cause    0x%08x\n", tf->cause);
}

void print_regs(struct pushregs *gpr)
{
    cprintf("  zero     0x%08x\n", gpr->zero);
ffffffffc02009d6:	610c                	ld	a1,0(a0)
{
ffffffffc02009d8:	1141                	addi	sp,sp,-16
ffffffffc02009da:	e022                	sd	s0,0(sp)
ffffffffc02009dc:	842a                	mv	s0,a0
    cprintf("  zero     0x%08x\n", gpr->zero);
ffffffffc02009de:	00005517          	auipc	a0,0x5
ffffffffc02009e2:	31a50513          	addi	a0,a0,794 # ffffffffc0205cf8 <commands+0x1f8>
{
ffffffffc02009e6:	e406                	sd	ra,8(sp)
    cprintf("  zero     0x%08x\n", gpr->zero);
ffffffffc02009e8:	facff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  ra       0x%08x\n", gpr->ra);
ffffffffc02009ec:	640c                	ld	a1,8(s0)
ffffffffc02009ee:	00005517          	auipc	a0,0x5
ffffffffc02009f2:	32250513          	addi	a0,a0,802 # ffffffffc0205d10 <commands+0x210>
ffffffffc02009f6:	f9eff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  sp       0x%08x\n", gpr->sp);
ffffffffc02009fa:	680c                	ld	a1,16(s0)
ffffffffc02009fc:	00005517          	auipc	a0,0x5
ffffffffc0200a00:	32c50513          	addi	a0,a0,812 # ffffffffc0205d28 <commands+0x228>
ffffffffc0200a04:	f90ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  gp       0x%08x\n", gpr->gp);
ffffffffc0200a08:	6c0c                	ld	a1,24(s0)
ffffffffc0200a0a:	00005517          	auipc	a0,0x5
ffffffffc0200a0e:	33650513          	addi	a0,a0,822 # ffffffffc0205d40 <commands+0x240>
ffffffffc0200a12:	f82ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  tp       0x%08x\n", gpr->tp);
ffffffffc0200a16:	700c                	ld	a1,32(s0)
ffffffffc0200a18:	00005517          	auipc	a0,0x5
ffffffffc0200a1c:	34050513          	addi	a0,a0,832 # ffffffffc0205d58 <commands+0x258>
ffffffffc0200a20:	f74ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  t0       0x%08x\n", gpr->t0);
ffffffffc0200a24:	740c                	ld	a1,40(s0)
ffffffffc0200a26:	00005517          	auipc	a0,0x5
ffffffffc0200a2a:	34a50513          	addi	a0,a0,842 # ffffffffc0205d70 <commands+0x270>
ffffffffc0200a2e:	f66ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  t1       0x%08x\n", gpr->t1);
ffffffffc0200a32:	780c                	ld	a1,48(s0)
ffffffffc0200a34:	00005517          	auipc	a0,0x5
ffffffffc0200a38:	35450513          	addi	a0,a0,852 # ffffffffc0205d88 <commands+0x288>
ffffffffc0200a3c:	f58ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  t2       0x%08x\n", gpr->t2);
ffffffffc0200a40:	7c0c                	ld	a1,56(s0)
ffffffffc0200a42:	00005517          	auipc	a0,0x5
ffffffffc0200a46:	35e50513          	addi	a0,a0,862 # ffffffffc0205da0 <commands+0x2a0>
ffffffffc0200a4a:	f4aff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  s0       0x%08x\n", gpr->s0);
ffffffffc0200a4e:	602c                	ld	a1,64(s0)
ffffffffc0200a50:	00005517          	auipc	a0,0x5
ffffffffc0200a54:	36850513          	addi	a0,a0,872 # ffffffffc0205db8 <commands+0x2b8>
ffffffffc0200a58:	f3cff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  s1       0x%08x\n", gpr->s1);
ffffffffc0200a5c:	642c                	ld	a1,72(s0)
ffffffffc0200a5e:	00005517          	auipc	a0,0x5
ffffffffc0200a62:	37250513          	addi	a0,a0,882 # ffffffffc0205dd0 <commands+0x2d0>
ffffffffc0200a66:	f2eff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  a0       0x%08x\n", gpr->a0);
ffffffffc0200a6a:	682c                	ld	a1,80(s0)
ffffffffc0200a6c:	00005517          	auipc	a0,0x5
ffffffffc0200a70:	37c50513          	addi	a0,a0,892 # ffffffffc0205de8 <commands+0x2e8>
ffffffffc0200a74:	f20ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  a1       0x%08x\n", gpr->a1);
ffffffffc0200a78:	6c2c                	ld	a1,88(s0)
ffffffffc0200a7a:	00005517          	auipc	a0,0x5
ffffffffc0200a7e:	38650513          	addi	a0,a0,902 # ffffffffc0205e00 <commands+0x300>
ffffffffc0200a82:	f12ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  a2       0x%08x\n", gpr->a2);
ffffffffc0200a86:	702c                	ld	a1,96(s0)
ffffffffc0200a88:	00005517          	auipc	a0,0x5
ffffffffc0200a8c:	39050513          	addi	a0,a0,912 # ffffffffc0205e18 <commands+0x318>
ffffffffc0200a90:	f04ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  a3       0x%08x\n", gpr->a3);
ffffffffc0200a94:	742c                	ld	a1,104(s0)
ffffffffc0200a96:	00005517          	auipc	a0,0x5
ffffffffc0200a9a:	39a50513          	addi	a0,a0,922 # ffffffffc0205e30 <commands+0x330>
ffffffffc0200a9e:	ef6ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  a4       0x%08x\n", gpr->a4);
ffffffffc0200aa2:	782c                	ld	a1,112(s0)
ffffffffc0200aa4:	00005517          	auipc	a0,0x5
ffffffffc0200aa8:	3a450513          	addi	a0,a0,932 # ffffffffc0205e48 <commands+0x348>
ffffffffc0200aac:	ee8ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  a5       0x%08x\n", gpr->a5);
ffffffffc0200ab0:	7c2c                	ld	a1,120(s0)
ffffffffc0200ab2:	00005517          	auipc	a0,0x5
ffffffffc0200ab6:	3ae50513          	addi	a0,a0,942 # ffffffffc0205e60 <commands+0x360>
ffffffffc0200aba:	edaff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  a6       0x%08x\n", gpr->a6);
ffffffffc0200abe:	604c                	ld	a1,128(s0)
ffffffffc0200ac0:	00005517          	auipc	a0,0x5
ffffffffc0200ac4:	3b850513          	addi	a0,a0,952 # ffffffffc0205e78 <commands+0x378>
ffffffffc0200ac8:	eccff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  a7       0x%08x\n", gpr->a7);
ffffffffc0200acc:	644c                	ld	a1,136(s0)
ffffffffc0200ace:	00005517          	auipc	a0,0x5
ffffffffc0200ad2:	3c250513          	addi	a0,a0,962 # ffffffffc0205e90 <commands+0x390>
ffffffffc0200ad6:	ebeff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  s2       0x%08x\n", gpr->s2);
ffffffffc0200ada:	684c                	ld	a1,144(s0)
ffffffffc0200adc:	00005517          	auipc	a0,0x5
ffffffffc0200ae0:	3cc50513          	addi	a0,a0,972 # ffffffffc0205ea8 <commands+0x3a8>
ffffffffc0200ae4:	eb0ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  s3       0x%08x\n", gpr->s3);
ffffffffc0200ae8:	6c4c                	ld	a1,152(s0)
ffffffffc0200aea:	00005517          	auipc	a0,0x5
ffffffffc0200aee:	3d650513          	addi	a0,a0,982 # ffffffffc0205ec0 <commands+0x3c0>
ffffffffc0200af2:	ea2ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  s4       0x%08x\n", gpr->s4);
ffffffffc0200af6:	704c                	ld	a1,160(s0)
ffffffffc0200af8:	00005517          	auipc	a0,0x5
ffffffffc0200afc:	3e050513          	addi	a0,a0,992 # ffffffffc0205ed8 <commands+0x3d8>
ffffffffc0200b00:	e94ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  s5       0x%08x\n", gpr->s5);
ffffffffc0200b04:	744c                	ld	a1,168(s0)
ffffffffc0200b06:	00005517          	auipc	a0,0x5
ffffffffc0200b0a:	3ea50513          	addi	a0,a0,1002 # ffffffffc0205ef0 <commands+0x3f0>
ffffffffc0200b0e:	e86ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  s6       0x%08x\n", gpr->s6);
ffffffffc0200b12:	784c                	ld	a1,176(s0)
ffffffffc0200b14:	00005517          	auipc	a0,0x5
ffffffffc0200b18:	3f450513          	addi	a0,a0,1012 # ffffffffc0205f08 <commands+0x408>
ffffffffc0200b1c:	e78ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  s7       0x%08x\n", gpr->s7);
ffffffffc0200b20:	7c4c                	ld	a1,184(s0)
ffffffffc0200b22:	00005517          	auipc	a0,0x5
ffffffffc0200b26:	3fe50513          	addi	a0,a0,1022 # ffffffffc0205f20 <commands+0x420>
ffffffffc0200b2a:	e6aff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  s8       0x%08x\n", gpr->s8);
ffffffffc0200b2e:	606c                	ld	a1,192(s0)
ffffffffc0200b30:	00005517          	auipc	a0,0x5
ffffffffc0200b34:	40850513          	addi	a0,a0,1032 # ffffffffc0205f38 <commands+0x438>
ffffffffc0200b38:	e5cff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  s9       0x%08x\n", gpr->s9);
ffffffffc0200b3c:	646c                	ld	a1,200(s0)
ffffffffc0200b3e:	00005517          	auipc	a0,0x5
ffffffffc0200b42:	41250513          	addi	a0,a0,1042 # ffffffffc0205f50 <commands+0x450>
ffffffffc0200b46:	e4eff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  s10      0x%08x\n", gpr->s10);
ffffffffc0200b4a:	686c                	ld	a1,208(s0)
ffffffffc0200b4c:	00005517          	auipc	a0,0x5
ffffffffc0200b50:	41c50513          	addi	a0,a0,1052 # ffffffffc0205f68 <commands+0x468>
ffffffffc0200b54:	e40ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  s11      0x%08x\n", gpr->s11);
ffffffffc0200b58:	6c6c                	ld	a1,216(s0)
ffffffffc0200b5a:	00005517          	auipc	a0,0x5
ffffffffc0200b5e:	42650513          	addi	a0,a0,1062 # ffffffffc0205f80 <commands+0x480>
ffffffffc0200b62:	e32ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  t3       0x%08x\n", gpr->t3);
ffffffffc0200b66:	706c                	ld	a1,224(s0)
ffffffffc0200b68:	00005517          	auipc	a0,0x5
ffffffffc0200b6c:	43050513          	addi	a0,a0,1072 # ffffffffc0205f98 <commands+0x498>
ffffffffc0200b70:	e24ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  t4       0x%08x\n", gpr->t4);
ffffffffc0200b74:	746c                	ld	a1,232(s0)
ffffffffc0200b76:	00005517          	auipc	a0,0x5
ffffffffc0200b7a:	43a50513          	addi	a0,a0,1082 # ffffffffc0205fb0 <commands+0x4b0>
ffffffffc0200b7e:	e16ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  t5       0x%08x\n", gpr->t5);
ffffffffc0200b82:	786c                	ld	a1,240(s0)
ffffffffc0200b84:	00005517          	auipc	a0,0x5
ffffffffc0200b88:	44450513          	addi	a0,a0,1092 # ffffffffc0205fc8 <commands+0x4c8>
ffffffffc0200b8c:	e08ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  t6       0x%08x\n", gpr->t6);
ffffffffc0200b90:	7c6c                	ld	a1,248(s0)
}
ffffffffc0200b92:	6402                	ld	s0,0(sp)
ffffffffc0200b94:	60a2                	ld	ra,8(sp)
    cprintf("  t6       0x%08x\n", gpr->t6);
ffffffffc0200b96:	00005517          	auipc	a0,0x5
ffffffffc0200b9a:	44a50513          	addi	a0,a0,1098 # ffffffffc0205fe0 <commands+0x4e0>
}
ffffffffc0200b9e:	0141                	addi	sp,sp,16
    cprintf("  t6       0x%08x\n", gpr->t6);
ffffffffc0200ba0:	df4ff06f          	j	ffffffffc0200194 <cprintf>

ffffffffc0200ba4 <print_trapframe>:
{
ffffffffc0200ba4:	1141                	addi	sp,sp,-16
ffffffffc0200ba6:	e022                	sd	s0,0(sp)
    cprintf("trapframe at %p\n", tf);
ffffffffc0200ba8:	85aa                	mv	a1,a0
{
ffffffffc0200baa:	842a                	mv	s0,a0
    cprintf("trapframe at %p\n", tf);
ffffffffc0200bac:	00005517          	auipc	a0,0x5
ffffffffc0200bb0:	44c50513          	addi	a0,a0,1100 # ffffffffc0205ff8 <commands+0x4f8>
{
ffffffffc0200bb4:	e406                	sd	ra,8(sp)
    cprintf("trapframe at %p\n", tf);
ffffffffc0200bb6:	ddeff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    print_regs(&tf->gpr);
ffffffffc0200bba:	8522                	mv	a0,s0
ffffffffc0200bbc:	e1bff0ef          	jal	ra,ffffffffc02009d6 <print_regs>
    cprintf("  status   0x%08x\n", tf->status);
ffffffffc0200bc0:	10043583          	ld	a1,256(s0)
ffffffffc0200bc4:	00005517          	auipc	a0,0x5
ffffffffc0200bc8:	44c50513          	addi	a0,a0,1100 # ffffffffc0206010 <commands+0x510>
ffffffffc0200bcc:	dc8ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  epc      0x%08x\n", tf->epc);
ffffffffc0200bd0:	10843583          	ld	a1,264(s0)
ffffffffc0200bd4:	00005517          	auipc	a0,0x5
ffffffffc0200bd8:	45450513          	addi	a0,a0,1108 # ffffffffc0206028 <commands+0x528>
ffffffffc0200bdc:	db8ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  tval 0x%08x\n", tf->tval);
ffffffffc0200be0:	11043583          	ld	a1,272(s0)
ffffffffc0200be4:	00005517          	auipc	a0,0x5
ffffffffc0200be8:	45c50513          	addi	a0,a0,1116 # ffffffffc0206040 <commands+0x540>
ffffffffc0200bec:	da8ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("  cause    0x%08x\n", tf->cause);
ffffffffc0200bf0:	11843583          	ld	a1,280(s0)
}
ffffffffc0200bf4:	6402                	ld	s0,0(sp)
ffffffffc0200bf6:	60a2                	ld	ra,8(sp)
    cprintf("  cause    0x%08x\n", tf->cause);
ffffffffc0200bf8:	00005517          	auipc	a0,0x5
ffffffffc0200bfc:	45850513          	addi	a0,a0,1112 # ffffffffc0206050 <commands+0x550>
}
ffffffffc0200c00:	0141                	addi	sp,sp,16
    cprintf("  cause    0x%08x\n", tf->cause);
ffffffffc0200c02:	d92ff06f          	j	ffffffffc0200194 <cprintf>

ffffffffc0200c06 <interrupt_handler>:

extern struct mm_struct *check_mm_struct;

void interrupt_handler(struct trapframe *tf)
{
    intptr_t cause = (tf->cause << 1) >> 1;
ffffffffc0200c06:	11853783          	ld	a5,280(a0)
ffffffffc0200c0a:	472d                	li	a4,11
ffffffffc0200c0c:	0786                	slli	a5,a5,0x1
ffffffffc0200c0e:	8385                	srli	a5,a5,0x1
ffffffffc0200c10:	08f76363          	bltu	a4,a5,ffffffffc0200c96 <interrupt_handler+0x90>
ffffffffc0200c14:	00005717          	auipc	a4,0x5
ffffffffc0200c18:	4f470713          	addi	a4,a4,1268 # ffffffffc0206108 <commands+0x608>
ffffffffc0200c1c:	078a                	slli	a5,a5,0x2
ffffffffc0200c1e:	97ba                	add	a5,a5,a4
ffffffffc0200c20:	439c                	lw	a5,0(a5)
ffffffffc0200c22:	97ba                	add	a5,a5,a4
ffffffffc0200c24:	8782                	jr	a5
        break;
    case IRQ_H_SOFT:
        cprintf("Hypervisor software interrupt\n");
        break;
    case IRQ_M_SOFT:
        cprintf("Machine software interrupt\n");
ffffffffc0200c26:	00005517          	auipc	a0,0x5
ffffffffc0200c2a:	4a250513          	addi	a0,a0,1186 # ffffffffc02060c8 <commands+0x5c8>
ffffffffc0200c2e:	d66ff06f          	j	ffffffffc0200194 <cprintf>
        cprintf("Hypervisor software interrupt\n");
ffffffffc0200c32:	00005517          	auipc	a0,0x5
ffffffffc0200c36:	47650513          	addi	a0,a0,1142 # ffffffffc02060a8 <commands+0x5a8>
ffffffffc0200c3a:	d5aff06f          	j	ffffffffc0200194 <cprintf>
        cprintf("User software interrupt\n");
ffffffffc0200c3e:	00005517          	auipc	a0,0x5
ffffffffc0200c42:	42a50513          	addi	a0,a0,1066 # ffffffffc0206068 <commands+0x568>
ffffffffc0200c46:	d4eff06f          	j	ffffffffc0200194 <cprintf>
        cprintf("Supervisor software interrupt\n");
ffffffffc0200c4a:	00005517          	auipc	a0,0x5
ffffffffc0200c4e:	43e50513          	addi	a0,a0,1086 # ffffffffc0206088 <commands+0x588>
ffffffffc0200c52:	d42ff06f          	j	ffffffffc0200194 <cprintf>
{
ffffffffc0200c56:	1141                	addi	sp,sp,-16
ffffffffc0200c58:	e406                	sd	ra,8(sp)
        /* 时间片轮转： 
         *(1) 设置下一次时钟中断（clock_set_next_event）
         *(2) ticks 计数器自增
         *(3) 每 TICK_NUM 次中断（如 100 次），进行判断当前是否有进程正在运行，如果有则标记该进程需要被重新调度（current->need_resched）
         */
        clock_set_next_event();
ffffffffc0200c5a:	919ff0ef          	jal	ra,ffffffffc0200572 <clock_set_next_event>
        if (++ticks % TICK_NUM == 0)
ffffffffc0200c5e:	000aa697          	auipc	a3,0xaa
ffffffffc0200c62:	a6268693          	addi	a3,a3,-1438 # ffffffffc02aa6c0 <ticks>
ffffffffc0200c66:	629c                	ld	a5,0(a3)
ffffffffc0200c68:	06400713          	li	a4,100
ffffffffc0200c6c:	0785                	addi	a5,a5,1
ffffffffc0200c6e:	02e7f733          	remu	a4,a5,a4
ffffffffc0200c72:	e29c                	sd	a5,0(a3)
ffffffffc0200c74:	eb01                	bnez	a4,ffffffffc0200c84 <interrupt_handler+0x7e>
        {
            if (current != NULL)
ffffffffc0200c76:	000aa797          	auipc	a5,0xaa
ffffffffc0200c7a:	aa27b783          	ld	a5,-1374(a5) # ffffffffc02aa718 <current>
ffffffffc0200c7e:	c399                	beqz	a5,ffffffffc0200c84 <interrupt_handler+0x7e>
            {
                current->need_resched = 1;
ffffffffc0200c80:	4705                	li	a4,1
ffffffffc0200c82:	ef98                	sd	a4,24(a5)
        break;
    default:
        print_trapframe(tf);
        break;
    }
}
ffffffffc0200c84:	60a2                	ld	ra,8(sp)
ffffffffc0200c86:	0141                	addi	sp,sp,16
ffffffffc0200c88:	8082                	ret
        cprintf("Supervisor external interrupt\n");
ffffffffc0200c8a:	00005517          	auipc	a0,0x5
ffffffffc0200c8e:	45e50513          	addi	a0,a0,1118 # ffffffffc02060e8 <commands+0x5e8>
ffffffffc0200c92:	d02ff06f          	j	ffffffffc0200194 <cprintf>
        print_trapframe(tf);
ffffffffc0200c96:	b739                	j	ffffffffc0200ba4 <print_trapframe>

ffffffffc0200c98 <exception_handler>:
void kernel_execve_ret(struct trapframe *tf, uintptr_t kstacktop);
void exception_handler(struct trapframe *tf)
{
    int ret;
    switch (tf->cause)
ffffffffc0200c98:	11853783          	ld	a5,280(a0)
{
ffffffffc0200c9c:	1141                	addi	sp,sp,-16
ffffffffc0200c9e:	e022                	sd	s0,0(sp)
ffffffffc0200ca0:	e406                	sd	ra,8(sp)
ffffffffc0200ca2:	473d                	li	a4,15
ffffffffc0200ca4:	842a                	mv	s0,a0
ffffffffc0200ca6:	0cf76463          	bltu	a4,a5,ffffffffc0200d6e <exception_handler+0xd6>
ffffffffc0200caa:	00005717          	auipc	a4,0x5
ffffffffc0200cae:	61e70713          	addi	a4,a4,1566 # ffffffffc02062c8 <commands+0x7c8>
ffffffffc0200cb2:	078a                	slli	a5,a5,0x2
ffffffffc0200cb4:	97ba                	add	a5,a5,a4
ffffffffc0200cb6:	439c                	lw	a5,0(a5)
ffffffffc0200cb8:	97ba                	add	a5,a5,a4
ffffffffc0200cba:	8782                	jr	a5
        // cprintf("Environment call from U-mode\n");
        tf->epc += 4;
        syscall();
        break;
    case CAUSE_SUPERVISOR_ECALL:
        cprintf("Environment call from S-mode\n");
ffffffffc0200cbc:	00005517          	auipc	a0,0x5
ffffffffc0200cc0:	56450513          	addi	a0,a0,1380 # ffffffffc0206220 <commands+0x720>
ffffffffc0200cc4:	cd0ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
        tf->epc += 4;
ffffffffc0200cc8:	10843783          	ld	a5,264(s0)
        break;
    default:
        print_trapframe(tf);
        break;
    }
}
ffffffffc0200ccc:	60a2                	ld	ra,8(sp)
        tf->epc += 4;
ffffffffc0200cce:	0791                	addi	a5,a5,4
ffffffffc0200cd0:	10f43423          	sd	a5,264(s0)
}
ffffffffc0200cd4:	6402                	ld	s0,0(sp)
ffffffffc0200cd6:	0141                	addi	sp,sp,16
        syscall();
ffffffffc0200cd8:	66c0406f          	j	ffffffffc0205344 <syscall>
        cprintf("Environment call from H-mode\n");
ffffffffc0200cdc:	00005517          	auipc	a0,0x5
ffffffffc0200ce0:	56450513          	addi	a0,a0,1380 # ffffffffc0206240 <commands+0x740>
}
ffffffffc0200ce4:	6402                	ld	s0,0(sp)
ffffffffc0200ce6:	60a2                	ld	ra,8(sp)
ffffffffc0200ce8:	0141                	addi	sp,sp,16
        cprintf("Instruction access fault\n");
ffffffffc0200cea:	caaff06f          	j	ffffffffc0200194 <cprintf>
        cprintf("Environment call from M-mode\n");
ffffffffc0200cee:	00005517          	auipc	a0,0x5
ffffffffc0200cf2:	57250513          	addi	a0,a0,1394 # ffffffffc0206260 <commands+0x760>
ffffffffc0200cf6:	b7fd                	j	ffffffffc0200ce4 <exception_handler+0x4c>
        cprintf("Instruction page fault\n");
ffffffffc0200cf8:	00005517          	auipc	a0,0x5
ffffffffc0200cfc:	58850513          	addi	a0,a0,1416 # ffffffffc0206280 <commands+0x780>
ffffffffc0200d00:	b7d5                	j	ffffffffc0200ce4 <exception_handler+0x4c>
        cprintf("Load page fault\n");
ffffffffc0200d02:	00005517          	auipc	a0,0x5
ffffffffc0200d06:	59650513          	addi	a0,a0,1430 # ffffffffc0206298 <commands+0x798>
ffffffffc0200d0a:	bfe9                	j	ffffffffc0200ce4 <exception_handler+0x4c>
        cprintf("Store/AMO page fault\n");
ffffffffc0200d0c:	00005517          	auipc	a0,0x5
ffffffffc0200d10:	5a450513          	addi	a0,a0,1444 # ffffffffc02062b0 <commands+0x7b0>
ffffffffc0200d14:	bfc1                	j	ffffffffc0200ce4 <exception_handler+0x4c>
        cprintf("Instruction address misaligned\n");
ffffffffc0200d16:	00005517          	auipc	a0,0x5
ffffffffc0200d1a:	42250513          	addi	a0,a0,1058 # ffffffffc0206138 <commands+0x638>
ffffffffc0200d1e:	b7d9                	j	ffffffffc0200ce4 <exception_handler+0x4c>
        cprintf("Instruction access fault\n");
ffffffffc0200d20:	00005517          	auipc	a0,0x5
ffffffffc0200d24:	43850513          	addi	a0,a0,1080 # ffffffffc0206158 <commands+0x658>
ffffffffc0200d28:	bf75                	j	ffffffffc0200ce4 <exception_handler+0x4c>
        cprintf("Illegal instruction\n");
ffffffffc0200d2a:	00005517          	auipc	a0,0x5
ffffffffc0200d2e:	44e50513          	addi	a0,a0,1102 # ffffffffc0206178 <commands+0x678>
ffffffffc0200d32:	bf4d                	j	ffffffffc0200ce4 <exception_handler+0x4c>
        cprintf("Breakpoint\n");
ffffffffc0200d34:	00005517          	auipc	a0,0x5
ffffffffc0200d38:	45c50513          	addi	a0,a0,1116 # ffffffffc0206190 <commands+0x690>
ffffffffc0200d3c:	c58ff0ef          	jal	ra,ffffffffc0200194 <cprintf>
        if (tf->gpr.a7 == 10)
ffffffffc0200d40:	6458                	ld	a4,136(s0)
ffffffffc0200d42:	47a9                	li	a5,10
ffffffffc0200d44:	04f70663          	beq	a4,a5,ffffffffc0200d90 <exception_handler+0xf8>
}
ffffffffc0200d48:	60a2                	ld	ra,8(sp)
ffffffffc0200d4a:	6402                	ld	s0,0(sp)
ffffffffc0200d4c:	0141                	addi	sp,sp,16
ffffffffc0200d4e:	8082                	ret
        cprintf("Load address misaligned\n");
ffffffffc0200d50:	00005517          	auipc	a0,0x5
ffffffffc0200d54:	45050513          	addi	a0,a0,1104 # ffffffffc02061a0 <commands+0x6a0>
ffffffffc0200d58:	b771                	j	ffffffffc0200ce4 <exception_handler+0x4c>
        cprintf("Load access fault\n");
ffffffffc0200d5a:	00005517          	auipc	a0,0x5
ffffffffc0200d5e:	46650513          	addi	a0,a0,1126 # ffffffffc02061c0 <commands+0x6c0>
ffffffffc0200d62:	b749                	j	ffffffffc0200ce4 <exception_handler+0x4c>
        cprintf("Store/AMO access fault\n");
ffffffffc0200d64:	00005517          	auipc	a0,0x5
ffffffffc0200d68:	4a450513          	addi	a0,a0,1188 # ffffffffc0206208 <commands+0x708>
ffffffffc0200d6c:	bfa5                	j	ffffffffc0200ce4 <exception_handler+0x4c>
        print_trapframe(tf);
ffffffffc0200d6e:	8522                	mv	a0,s0
}
ffffffffc0200d70:	6402                	ld	s0,0(sp)
ffffffffc0200d72:	60a2                	ld	ra,8(sp)
ffffffffc0200d74:	0141                	addi	sp,sp,16
        print_trapframe(tf);
ffffffffc0200d76:	b53d                	j	ffffffffc0200ba4 <print_trapframe>
        panic("AMO address misaligned\n");
ffffffffc0200d78:	00005617          	auipc	a2,0x5
ffffffffc0200d7c:	46060613          	addi	a2,a2,1120 # ffffffffc02061d8 <commands+0x6d8>
ffffffffc0200d80:	0b800593          	li	a1,184
ffffffffc0200d84:	00005517          	auipc	a0,0x5
ffffffffc0200d88:	46c50513          	addi	a0,a0,1132 # ffffffffc02061f0 <commands+0x6f0>
ffffffffc0200d8c:	f02ff0ef          	jal	ra,ffffffffc020048e <__panic>
            tf->epc += 4;
ffffffffc0200d90:	10843783          	ld	a5,264(s0)
ffffffffc0200d94:	0791                	addi	a5,a5,4
ffffffffc0200d96:	10f43423          	sd	a5,264(s0)
            syscall();
ffffffffc0200d9a:	5aa040ef          	jal	ra,ffffffffc0205344 <syscall>
            kernel_execve_ret(tf, current->kstack + KSTACKSIZE);
ffffffffc0200d9e:	000aa797          	auipc	a5,0xaa
ffffffffc0200da2:	97a7b783          	ld	a5,-1670(a5) # ffffffffc02aa718 <current>
ffffffffc0200da6:	6b9c                	ld	a5,16(a5)
ffffffffc0200da8:	8522                	mv	a0,s0
}
ffffffffc0200daa:	6402                	ld	s0,0(sp)
ffffffffc0200dac:	60a2                	ld	ra,8(sp)
            kernel_execve_ret(tf, current->kstack + KSTACKSIZE);
ffffffffc0200dae:	6589                	lui	a1,0x2
ffffffffc0200db0:	95be                	add	a1,a1,a5
}
ffffffffc0200db2:	0141                	addi	sp,sp,16
            kernel_execve_ret(tf, current->kstack + KSTACKSIZE);
ffffffffc0200db4:	aaa9                	j	ffffffffc0200f0e <kernel_execve_ret>

ffffffffc0200db6 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void trap(struct trapframe *tf)
{
ffffffffc0200db6:	1101                	addi	sp,sp,-32
ffffffffc0200db8:	e822                	sd	s0,16(sp)
    // dispatch based on what type of trap occurred
    //    cputs("some trap");
    if (current == NULL)
ffffffffc0200dba:	000aa417          	auipc	s0,0xaa
ffffffffc0200dbe:	95e40413          	addi	s0,s0,-1698 # ffffffffc02aa718 <current>
ffffffffc0200dc2:	6018                	ld	a4,0(s0)
{
ffffffffc0200dc4:	ec06                	sd	ra,24(sp)
ffffffffc0200dc6:	e426                	sd	s1,8(sp)
ffffffffc0200dc8:	e04a                	sd	s2,0(sp)
    if ((intptr_t)tf->cause < 0)
ffffffffc0200dca:	11853683          	ld	a3,280(a0)
    if (current == NULL)
ffffffffc0200dce:	cf1d                	beqz	a4,ffffffffc0200e0c <trap+0x56>
    return (tf->status & SSTATUS_SPP) != 0;
ffffffffc0200dd0:	10053483          	ld	s1,256(a0)
    {
        trap_dispatch(tf);
    }
    else
    {
        struct trapframe *otf = current->tf;
ffffffffc0200dd4:	0a073903          	ld	s2,160(a4)
        current->tf = tf;
ffffffffc0200dd8:	f348                	sd	a0,160(a4)
    return (tf->status & SSTATUS_SPP) != 0;
ffffffffc0200dda:	1004f493          	andi	s1,s1,256
    if ((intptr_t)tf->cause < 0)
ffffffffc0200dde:	0206c463          	bltz	a3,ffffffffc0200e06 <trap+0x50>
        exception_handler(tf);
ffffffffc0200de2:	eb7ff0ef          	jal	ra,ffffffffc0200c98 <exception_handler>

        bool in_kernel = trap_in_kernel(tf);

        trap_dispatch(tf);

        current->tf = otf;
ffffffffc0200de6:	601c                	ld	a5,0(s0)
ffffffffc0200de8:	0b27b023          	sd	s2,160(a5)
        if (!in_kernel)
ffffffffc0200dec:	e499                	bnez	s1,ffffffffc0200dfa <trap+0x44>
        {
            if (current->flags & PF_EXITING)
ffffffffc0200dee:	0b07a703          	lw	a4,176(a5)
ffffffffc0200df2:	8b05                	andi	a4,a4,1
ffffffffc0200df4:	e329                	bnez	a4,ffffffffc0200e36 <trap+0x80>
            {
                do_exit(-E_KILLED);
            }
            if (current->need_resched)
ffffffffc0200df6:	6f9c                	ld	a5,24(a5)
ffffffffc0200df8:	eb85                	bnez	a5,ffffffffc0200e28 <trap+0x72>
            {
                schedule();
            }
        }
    }
}
ffffffffc0200dfa:	60e2                	ld	ra,24(sp)
ffffffffc0200dfc:	6442                	ld	s0,16(sp)
ffffffffc0200dfe:	64a2                	ld	s1,8(sp)
ffffffffc0200e00:	6902                	ld	s2,0(sp)
ffffffffc0200e02:	6105                	addi	sp,sp,32
ffffffffc0200e04:	8082                	ret
        interrupt_handler(tf);
ffffffffc0200e06:	e01ff0ef          	jal	ra,ffffffffc0200c06 <interrupt_handler>
ffffffffc0200e0a:	bff1                	j	ffffffffc0200de6 <trap+0x30>
    if ((intptr_t)tf->cause < 0)
ffffffffc0200e0c:	0006c863          	bltz	a3,ffffffffc0200e1c <trap+0x66>
}
ffffffffc0200e10:	6442                	ld	s0,16(sp)
ffffffffc0200e12:	60e2                	ld	ra,24(sp)
ffffffffc0200e14:	64a2                	ld	s1,8(sp)
ffffffffc0200e16:	6902                	ld	s2,0(sp)
ffffffffc0200e18:	6105                	addi	sp,sp,32
        exception_handler(tf);
ffffffffc0200e1a:	bdbd                	j	ffffffffc0200c98 <exception_handler>
}
ffffffffc0200e1c:	6442                	ld	s0,16(sp)
ffffffffc0200e1e:	60e2                	ld	ra,24(sp)
ffffffffc0200e20:	64a2                	ld	s1,8(sp)
ffffffffc0200e22:	6902                	ld	s2,0(sp)
ffffffffc0200e24:	6105                	addi	sp,sp,32
        interrupt_handler(tf);
ffffffffc0200e26:	b3c5                	j	ffffffffc0200c06 <interrupt_handler>
}
ffffffffc0200e28:	6442                	ld	s0,16(sp)
ffffffffc0200e2a:	60e2                	ld	ra,24(sp)
ffffffffc0200e2c:	64a2                	ld	s1,8(sp)
ffffffffc0200e2e:	6902                	ld	s2,0(sp)
ffffffffc0200e30:	6105                	addi	sp,sp,32
                schedule();
ffffffffc0200e32:	3f80406f          	j	ffffffffc020522a <schedule>
                do_exit(-E_KILLED);
ffffffffc0200e36:	555d                	li	a0,-9
ffffffffc0200e38:	62a030ef          	jal	ra,ffffffffc0204462 <do_exit>
            if (current->need_resched)
ffffffffc0200e3c:	601c                	ld	a5,0(s0)
ffffffffc0200e3e:	bf65                	j	ffffffffc0200df6 <trap+0x40>

ffffffffc0200e40 <__alltraps>:
    LOAD x2, 2*REGBYTES(sp)
    .endm

    .globl __alltraps
__alltraps:
    SAVE_ALL
ffffffffc0200e40:	14011173          	csrrw	sp,sscratch,sp
ffffffffc0200e44:	00011463          	bnez	sp,ffffffffc0200e4c <__alltraps+0xc>
ffffffffc0200e48:	14002173          	csrr	sp,sscratch
ffffffffc0200e4c:	712d                	addi	sp,sp,-288
ffffffffc0200e4e:	e002                	sd	zero,0(sp)
ffffffffc0200e50:	e406                	sd	ra,8(sp)
ffffffffc0200e52:	ec0e                	sd	gp,24(sp)
ffffffffc0200e54:	f012                	sd	tp,32(sp)
ffffffffc0200e56:	f416                	sd	t0,40(sp)
ffffffffc0200e58:	f81a                	sd	t1,48(sp)
ffffffffc0200e5a:	fc1e                	sd	t2,56(sp)
ffffffffc0200e5c:	e0a2                	sd	s0,64(sp)
ffffffffc0200e5e:	e4a6                	sd	s1,72(sp)
ffffffffc0200e60:	e8aa                	sd	a0,80(sp)
ffffffffc0200e62:	ecae                	sd	a1,88(sp)
ffffffffc0200e64:	f0b2                	sd	a2,96(sp)
ffffffffc0200e66:	f4b6                	sd	a3,104(sp)
ffffffffc0200e68:	f8ba                	sd	a4,112(sp)
ffffffffc0200e6a:	fcbe                	sd	a5,120(sp)
ffffffffc0200e6c:	e142                	sd	a6,128(sp)
ffffffffc0200e6e:	e546                	sd	a7,136(sp)
ffffffffc0200e70:	e94a                	sd	s2,144(sp)
ffffffffc0200e72:	ed4e                	sd	s3,152(sp)
ffffffffc0200e74:	f152                	sd	s4,160(sp)
ffffffffc0200e76:	f556                	sd	s5,168(sp)
ffffffffc0200e78:	f95a                	sd	s6,176(sp)
ffffffffc0200e7a:	fd5e                	sd	s7,184(sp)
ffffffffc0200e7c:	e1e2                	sd	s8,192(sp)
ffffffffc0200e7e:	e5e6                	sd	s9,200(sp)
ffffffffc0200e80:	e9ea                	sd	s10,208(sp)
ffffffffc0200e82:	edee                	sd	s11,216(sp)
ffffffffc0200e84:	f1f2                	sd	t3,224(sp)
ffffffffc0200e86:	f5f6                	sd	t4,232(sp)
ffffffffc0200e88:	f9fa                	sd	t5,240(sp)
ffffffffc0200e8a:	fdfe                	sd	t6,248(sp)
ffffffffc0200e8c:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0200e90:	100024f3          	csrr	s1,sstatus
ffffffffc0200e94:	14102973          	csrr	s2,sepc
ffffffffc0200e98:	143029f3          	csrr	s3,stval
ffffffffc0200e9c:	14202a73          	csrr	s4,scause
ffffffffc0200ea0:	e822                	sd	s0,16(sp)
ffffffffc0200ea2:	e226                	sd	s1,256(sp)
ffffffffc0200ea4:	e64a                	sd	s2,264(sp)
ffffffffc0200ea6:	ea4e                	sd	s3,272(sp)
ffffffffc0200ea8:	ee52                	sd	s4,280(sp)

    move  a0, sp
ffffffffc0200eaa:	850a                	mv	a0,sp
    jal trap
ffffffffc0200eac:	f0bff0ef          	jal	ra,ffffffffc0200db6 <trap>

ffffffffc0200eb0 <__trapret>:
    # sp should be the same as before "jal trap"

    .globl __trapret
__trapret:
    RESTORE_ALL
ffffffffc0200eb0:	6492                	ld	s1,256(sp)
ffffffffc0200eb2:	6932                	ld	s2,264(sp)
ffffffffc0200eb4:	1004f413          	andi	s0,s1,256
ffffffffc0200eb8:	e401                	bnez	s0,ffffffffc0200ec0 <__trapret+0x10>
ffffffffc0200eba:	1200                	addi	s0,sp,288
ffffffffc0200ebc:	14041073          	csrw	sscratch,s0
ffffffffc0200ec0:	10049073          	csrw	sstatus,s1
ffffffffc0200ec4:	14191073          	csrw	sepc,s2
ffffffffc0200ec8:	60a2                	ld	ra,8(sp)
ffffffffc0200eca:	61e2                	ld	gp,24(sp)
ffffffffc0200ecc:	7202                	ld	tp,32(sp)
ffffffffc0200ece:	72a2                	ld	t0,40(sp)
ffffffffc0200ed0:	7342                	ld	t1,48(sp)
ffffffffc0200ed2:	73e2                	ld	t2,56(sp)
ffffffffc0200ed4:	6406                	ld	s0,64(sp)
ffffffffc0200ed6:	64a6                	ld	s1,72(sp)
ffffffffc0200ed8:	6546                	ld	a0,80(sp)
ffffffffc0200eda:	65e6                	ld	a1,88(sp)
ffffffffc0200edc:	7606                	ld	a2,96(sp)
ffffffffc0200ede:	76a6                	ld	a3,104(sp)
ffffffffc0200ee0:	7746                	ld	a4,112(sp)
ffffffffc0200ee2:	77e6                	ld	a5,120(sp)
ffffffffc0200ee4:	680a                	ld	a6,128(sp)
ffffffffc0200ee6:	68aa                	ld	a7,136(sp)
ffffffffc0200ee8:	694a                	ld	s2,144(sp)
ffffffffc0200eea:	69ea                	ld	s3,152(sp)
ffffffffc0200eec:	7a0a                	ld	s4,160(sp)
ffffffffc0200eee:	7aaa                	ld	s5,168(sp)
ffffffffc0200ef0:	7b4a                	ld	s6,176(sp)
ffffffffc0200ef2:	7bea                	ld	s7,184(sp)
ffffffffc0200ef4:	6c0e                	ld	s8,192(sp)
ffffffffc0200ef6:	6cae                	ld	s9,200(sp)
ffffffffc0200ef8:	6d4e                	ld	s10,208(sp)
ffffffffc0200efa:	6dee                	ld	s11,216(sp)
ffffffffc0200efc:	7e0e                	ld	t3,224(sp)
ffffffffc0200efe:	7eae                	ld	t4,232(sp)
ffffffffc0200f00:	7f4e                	ld	t5,240(sp)
ffffffffc0200f02:	7fee                	ld	t6,248(sp)
ffffffffc0200f04:	6142                	ld	sp,16(sp)
    # return from supervisor call
    sret
ffffffffc0200f06:	10200073          	sret

ffffffffc0200f0a <forkrets>:
 
    .globl forkrets
forkrets:
    # set stack to this new process's trapframe
    move sp, a0
ffffffffc0200f0a:	812a                	mv	sp,a0
    j __trapret
ffffffffc0200f0c:	b755                	j	ffffffffc0200eb0 <__trapret>

ffffffffc0200f0e <kernel_execve_ret>:

    .global kernel_execve_ret
kernel_execve_ret:
    // adjust sp to beneath kstacktop of current process
    addi a1, a1, -36*REGBYTES
ffffffffc0200f0e:	ee058593          	addi	a1,a1,-288 # 1ee0 <_binary_obj___user_faultread_out_size-0x7cc8>

    // copy from previous trapframe to new trapframe
    LOAD s1, 35*REGBYTES(a0)
ffffffffc0200f12:	11853483          	ld	s1,280(a0)
    STORE s1, 35*REGBYTES(a1)
ffffffffc0200f16:	1095bc23          	sd	s1,280(a1)
    LOAD s1, 34*REGBYTES(a0)
ffffffffc0200f1a:	11053483          	ld	s1,272(a0)
    STORE s1, 34*REGBYTES(a1)
ffffffffc0200f1e:	1095b823          	sd	s1,272(a1)
    LOAD s1, 33*REGBYTES(a0)
ffffffffc0200f22:	10853483          	ld	s1,264(a0)
    STORE s1, 33*REGBYTES(a1)
ffffffffc0200f26:	1095b423          	sd	s1,264(a1)
    LOAD s1, 32*REGBYTES(a0)
ffffffffc0200f2a:	10053483          	ld	s1,256(a0)
    STORE s1, 32*REGBYTES(a1)
ffffffffc0200f2e:	1095b023          	sd	s1,256(a1)
    LOAD s1, 31*REGBYTES(a0)
ffffffffc0200f32:	7d64                	ld	s1,248(a0)
    STORE s1, 31*REGBYTES(a1)
ffffffffc0200f34:	fde4                	sd	s1,248(a1)
    LOAD s1, 30*REGBYTES(a0)
ffffffffc0200f36:	7964                	ld	s1,240(a0)
    STORE s1, 30*REGBYTES(a1)
ffffffffc0200f38:	f9e4                	sd	s1,240(a1)
    LOAD s1, 29*REGBYTES(a0)
ffffffffc0200f3a:	7564                	ld	s1,232(a0)
    STORE s1, 29*REGBYTES(a1)
ffffffffc0200f3c:	f5e4                	sd	s1,232(a1)
    LOAD s1, 28*REGBYTES(a0)
ffffffffc0200f3e:	7164                	ld	s1,224(a0)
    STORE s1, 28*REGBYTES(a1)
ffffffffc0200f40:	f1e4                	sd	s1,224(a1)
    LOAD s1, 27*REGBYTES(a0)
ffffffffc0200f42:	6d64                	ld	s1,216(a0)
    STORE s1, 27*REGBYTES(a1)
ffffffffc0200f44:	ede4                	sd	s1,216(a1)
    LOAD s1, 26*REGBYTES(a0)
ffffffffc0200f46:	6964                	ld	s1,208(a0)
    STORE s1, 26*REGBYTES(a1)
ffffffffc0200f48:	e9e4                	sd	s1,208(a1)
    LOAD s1, 25*REGBYTES(a0)
ffffffffc0200f4a:	6564                	ld	s1,200(a0)
    STORE s1, 25*REGBYTES(a1)
ffffffffc0200f4c:	e5e4                	sd	s1,200(a1)
    LOAD s1, 24*REGBYTES(a0)
ffffffffc0200f4e:	6164                	ld	s1,192(a0)
    STORE s1, 24*REGBYTES(a1)
ffffffffc0200f50:	e1e4                	sd	s1,192(a1)
    LOAD s1, 23*REGBYTES(a0)
ffffffffc0200f52:	7d44                	ld	s1,184(a0)
    STORE s1, 23*REGBYTES(a1)
ffffffffc0200f54:	fdc4                	sd	s1,184(a1)
    LOAD s1, 22*REGBYTES(a0)
ffffffffc0200f56:	7944                	ld	s1,176(a0)
    STORE s1, 22*REGBYTES(a1)
ffffffffc0200f58:	f9c4                	sd	s1,176(a1)
    LOAD s1, 21*REGBYTES(a0)
ffffffffc0200f5a:	7544                	ld	s1,168(a0)
    STORE s1, 21*REGBYTES(a1)
ffffffffc0200f5c:	f5c4                	sd	s1,168(a1)
    LOAD s1, 20*REGBYTES(a0)
ffffffffc0200f5e:	7144                	ld	s1,160(a0)
    STORE s1, 20*REGBYTES(a1)
ffffffffc0200f60:	f1c4                	sd	s1,160(a1)
    LOAD s1, 19*REGBYTES(a0)
ffffffffc0200f62:	6d44                	ld	s1,152(a0)
    STORE s1, 19*REGBYTES(a1)
ffffffffc0200f64:	edc4                	sd	s1,152(a1)
    LOAD s1, 18*REGBYTES(a0)
ffffffffc0200f66:	6944                	ld	s1,144(a0)
    STORE s1, 18*REGBYTES(a1)
ffffffffc0200f68:	e9c4                	sd	s1,144(a1)
    LOAD s1, 17*REGBYTES(a0)
ffffffffc0200f6a:	6544                	ld	s1,136(a0)
    STORE s1, 17*REGBYTES(a1)
ffffffffc0200f6c:	e5c4                	sd	s1,136(a1)
    LOAD s1, 16*REGBYTES(a0)
ffffffffc0200f6e:	6144                	ld	s1,128(a0)
    STORE s1, 16*REGBYTES(a1)
ffffffffc0200f70:	e1c4                	sd	s1,128(a1)
    LOAD s1, 15*REGBYTES(a0)
ffffffffc0200f72:	7d24                	ld	s1,120(a0)
    STORE s1, 15*REGBYTES(a1)
ffffffffc0200f74:	fda4                	sd	s1,120(a1)
    LOAD s1, 14*REGBYTES(a0)
ffffffffc0200f76:	7924                	ld	s1,112(a0)
    STORE s1, 14*REGBYTES(a1)
ffffffffc0200f78:	f9a4                	sd	s1,112(a1)
    LOAD s1, 13*REGBYTES(a0)
ffffffffc0200f7a:	7524                	ld	s1,104(a0)
    STORE s1, 13*REGBYTES(a1)
ffffffffc0200f7c:	f5a4                	sd	s1,104(a1)
    LOAD s1, 12*REGBYTES(a0)
ffffffffc0200f7e:	7124                	ld	s1,96(a0)
    STORE s1, 12*REGBYTES(a1)
ffffffffc0200f80:	f1a4                	sd	s1,96(a1)
    LOAD s1, 11*REGBYTES(a0)
ffffffffc0200f82:	6d24                	ld	s1,88(a0)
    STORE s1, 11*REGBYTES(a1)
ffffffffc0200f84:	eda4                	sd	s1,88(a1)
    LOAD s1, 10*REGBYTES(a0)
ffffffffc0200f86:	6924                	ld	s1,80(a0)
    STORE s1, 10*REGBYTES(a1)
ffffffffc0200f88:	e9a4                	sd	s1,80(a1)
    LOAD s1, 9*REGBYTES(a0)
ffffffffc0200f8a:	6524                	ld	s1,72(a0)
    STORE s1, 9*REGBYTES(a1)
ffffffffc0200f8c:	e5a4                	sd	s1,72(a1)
    LOAD s1, 8*REGBYTES(a0)
ffffffffc0200f8e:	6124                	ld	s1,64(a0)
    STORE s1, 8*REGBYTES(a1)
ffffffffc0200f90:	e1a4                	sd	s1,64(a1)
    LOAD s1, 7*REGBYTES(a0)
ffffffffc0200f92:	7d04                	ld	s1,56(a0)
    STORE s1, 7*REGBYTES(a1)
ffffffffc0200f94:	fd84                	sd	s1,56(a1)
    LOAD s1, 6*REGBYTES(a0)
ffffffffc0200f96:	7904                	ld	s1,48(a0)
    STORE s1, 6*REGBYTES(a1)
ffffffffc0200f98:	f984                	sd	s1,48(a1)
    LOAD s1, 5*REGBYTES(a0)
ffffffffc0200f9a:	7504                	ld	s1,40(a0)
    STORE s1, 5*REGBYTES(a1)
ffffffffc0200f9c:	f584                	sd	s1,40(a1)
    LOAD s1, 4*REGBYTES(a0)
ffffffffc0200f9e:	7104                	ld	s1,32(a0)
    STORE s1, 4*REGBYTES(a1)
ffffffffc0200fa0:	f184                	sd	s1,32(a1)
    LOAD s1, 3*REGBYTES(a0)
ffffffffc0200fa2:	6d04                	ld	s1,24(a0)
    STORE s1, 3*REGBYTES(a1)
ffffffffc0200fa4:	ed84                	sd	s1,24(a1)
    LOAD s1, 2*REGBYTES(a0)
ffffffffc0200fa6:	6904                	ld	s1,16(a0)
    STORE s1, 2*REGBYTES(a1)
ffffffffc0200fa8:	e984                	sd	s1,16(a1)
    LOAD s1, 1*REGBYTES(a0)
ffffffffc0200faa:	6504                	ld	s1,8(a0)
    STORE s1, 1*REGBYTES(a1)
ffffffffc0200fac:	e584                	sd	s1,8(a1)
    LOAD s1, 0*REGBYTES(a0)
ffffffffc0200fae:	6104                	ld	s1,0(a0)
    STORE s1, 0*REGBYTES(a1)
ffffffffc0200fb0:	e184                	sd	s1,0(a1)

    // acutually adjust sp
    move sp, a1
ffffffffc0200fb2:	812e                	mv	sp,a1
ffffffffc0200fb4:	bdf5                	j	ffffffffc0200eb0 <__trapret>

ffffffffc0200fb6 <default_init>:
 * list_init - initialize a new entry
 * @elm:        new entry to be initialized
 * */
static inline void
list_init(list_entry_t *elm) {
    elm->prev = elm->next = elm;
ffffffffc0200fb6:	000a5797          	auipc	a5,0xa5
ffffffffc0200fba:	6da78793          	addi	a5,a5,1754 # ffffffffc02a6690 <free_area>
ffffffffc0200fbe:	e79c                	sd	a5,8(a5)
ffffffffc0200fc0:	e39c                	sd	a5,0(a5)

static void
default_init(void)
{
    list_init(&free_list);
    nr_free = 0;
ffffffffc0200fc2:	0007a823          	sw	zero,16(a5)
}
ffffffffc0200fc6:	8082                	ret

ffffffffc0200fc8 <default_nr_free_pages>:

static size_t
default_nr_free_pages(void)
{
    return nr_free;
}
ffffffffc0200fc8:	000a5517          	auipc	a0,0xa5
ffffffffc0200fcc:	6d856503          	lwu	a0,1752(a0) # ffffffffc02a66a0 <free_area+0x10>
ffffffffc0200fd0:	8082                	ret

ffffffffc0200fd2 <default_check>:

// LAB2: below code is used to check the first fit allocation algorithm (your EXERCISE 1)
// NOTICE: You SHOULD NOT CHANGE basic_check, default_check functions!
static void
default_check(void)
{
ffffffffc0200fd2:	715d                	addi	sp,sp,-80
ffffffffc0200fd4:	e0a2                	sd	s0,64(sp)
 * list_next - get the next entry
 * @listelm:    the list head
 **/
static inline list_entry_t *
list_next(list_entry_t *listelm) {
    return listelm->next;
ffffffffc0200fd6:	000a5417          	auipc	s0,0xa5
ffffffffc0200fda:	6ba40413          	addi	s0,s0,1722 # ffffffffc02a6690 <free_area>
ffffffffc0200fde:	641c                	ld	a5,8(s0)
ffffffffc0200fe0:	e486                	sd	ra,72(sp)
ffffffffc0200fe2:	fc26                	sd	s1,56(sp)
ffffffffc0200fe4:	f84a                	sd	s2,48(sp)
ffffffffc0200fe6:	f44e                	sd	s3,40(sp)
ffffffffc0200fe8:	f052                	sd	s4,32(sp)
ffffffffc0200fea:	ec56                	sd	s5,24(sp)
ffffffffc0200fec:	e85a                	sd	s6,16(sp)
ffffffffc0200fee:	e45e                	sd	s7,8(sp)
ffffffffc0200ff0:	e062                	sd	s8,0(sp)
    int count = 0, total = 0;
    list_entry_t *le = &free_list;
    while ((le = list_next(le)) != &free_list)
ffffffffc0200ff2:	2a878d63          	beq	a5,s0,ffffffffc02012ac <default_check+0x2da>
    int count = 0, total = 0;
ffffffffc0200ff6:	4481                	li	s1,0
ffffffffc0200ff8:	4901                	li	s2,0
 * test_bit - Determine whether a bit is set
 * @nr:     the bit to test
 * @addr:   the address to count from
 * */
static inline bool test_bit(int nr, volatile void *addr) {
    return (((*(volatile unsigned long *)addr) >> nr) & 1);
ffffffffc0200ffa:	ff07b703          	ld	a4,-16(a5)
    {
        struct Page *p = le2page(le, page_link);
        assert(PageProperty(p));
ffffffffc0200ffe:	8b09                	andi	a4,a4,2
ffffffffc0201000:	2a070a63          	beqz	a4,ffffffffc02012b4 <default_check+0x2e2>
        count++, total += p->property;
ffffffffc0201004:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201008:	679c                	ld	a5,8(a5)
ffffffffc020100a:	2905                	addiw	s2,s2,1
ffffffffc020100c:	9cb9                	addw	s1,s1,a4
    while ((le = list_next(le)) != &free_list)
ffffffffc020100e:	fe8796e3          	bne	a5,s0,ffffffffc0200ffa <default_check+0x28>
    }
    assert(total == nr_free_pages());
ffffffffc0201012:	89a6                	mv	s3,s1
ffffffffc0201014:	6df000ef          	jal	ra,ffffffffc0201ef2 <nr_free_pages>
ffffffffc0201018:	6f351e63          	bne	a0,s3,ffffffffc0201714 <default_check+0x742>
    assert((p0 = alloc_page()) != NULL);
ffffffffc020101c:	4505                	li	a0,1
ffffffffc020101e:	657000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc0201022:	8aaa                	mv	s5,a0
ffffffffc0201024:	42050863          	beqz	a0,ffffffffc0201454 <default_check+0x482>
    assert((p1 = alloc_page()) != NULL);
ffffffffc0201028:	4505                	li	a0,1
ffffffffc020102a:	64b000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc020102e:	89aa                	mv	s3,a0
ffffffffc0201030:	70050263          	beqz	a0,ffffffffc0201734 <default_check+0x762>
    assert((p2 = alloc_page()) != NULL);
ffffffffc0201034:	4505                	li	a0,1
ffffffffc0201036:	63f000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc020103a:	8a2a                	mv	s4,a0
ffffffffc020103c:	48050c63          	beqz	a0,ffffffffc02014d4 <default_check+0x502>
    assert(p0 != p1 && p0 != p2 && p1 != p2);
ffffffffc0201040:	293a8a63          	beq	s5,s3,ffffffffc02012d4 <default_check+0x302>
ffffffffc0201044:	28aa8863          	beq	s5,a0,ffffffffc02012d4 <default_check+0x302>
ffffffffc0201048:	28a98663          	beq	s3,a0,ffffffffc02012d4 <default_check+0x302>
    assert(page_ref(p0) == 0 && page_ref(p1) == 0 && page_ref(p2) == 0);
ffffffffc020104c:	000aa783          	lw	a5,0(s5)
ffffffffc0201050:	2a079263          	bnez	a5,ffffffffc02012f4 <default_check+0x322>
ffffffffc0201054:	0009a783          	lw	a5,0(s3)
ffffffffc0201058:	28079e63          	bnez	a5,ffffffffc02012f4 <default_check+0x322>
ffffffffc020105c:	411c                	lw	a5,0(a0)
ffffffffc020105e:	28079b63          	bnez	a5,ffffffffc02012f4 <default_check+0x322>
extern uint_t va_pa_offset;

static inline ppn_t
page2ppn(struct Page *page)
{
    return page - pages + nbase;
ffffffffc0201062:	000a9797          	auipc	a5,0xa9
ffffffffc0201066:	69e7b783          	ld	a5,1694(a5) # ffffffffc02aa700 <pages>
ffffffffc020106a:	40fa8733          	sub	a4,s5,a5
ffffffffc020106e:	00007617          	auipc	a2,0x7
ffffffffc0201072:	c9a63603          	ld	a2,-870(a2) # ffffffffc0207d08 <nbase>
ffffffffc0201076:	8719                	srai	a4,a4,0x6
ffffffffc0201078:	9732                	add	a4,a4,a2
    assert(page2pa(p0) < npage * PGSIZE);
ffffffffc020107a:	000a9697          	auipc	a3,0xa9
ffffffffc020107e:	67e6b683          	ld	a3,1662(a3) # ffffffffc02aa6f8 <npage>
ffffffffc0201082:	06b2                	slli	a3,a3,0xc
}

static inline uintptr_t
page2pa(struct Page *page)
{
    return page2ppn(page) << PGSHIFT;
ffffffffc0201084:	0732                	slli	a4,a4,0xc
ffffffffc0201086:	28d77763          	bgeu	a4,a3,ffffffffc0201314 <default_check+0x342>
    return page - pages + nbase;
ffffffffc020108a:	40f98733          	sub	a4,s3,a5
ffffffffc020108e:	8719                	srai	a4,a4,0x6
ffffffffc0201090:	9732                	add	a4,a4,a2
    return page2ppn(page) << PGSHIFT;
ffffffffc0201092:	0732                	slli	a4,a4,0xc
    assert(page2pa(p1) < npage * PGSIZE);
ffffffffc0201094:	4cd77063          	bgeu	a4,a3,ffffffffc0201554 <default_check+0x582>
    return page - pages + nbase;
ffffffffc0201098:	40f507b3          	sub	a5,a0,a5
ffffffffc020109c:	8799                	srai	a5,a5,0x6
ffffffffc020109e:	97b2                	add	a5,a5,a2
    return page2ppn(page) << PGSHIFT;
ffffffffc02010a0:	07b2                	slli	a5,a5,0xc
    assert(page2pa(p2) < npage * PGSIZE);
ffffffffc02010a2:	30d7f963          	bgeu	a5,a3,ffffffffc02013b4 <default_check+0x3e2>
    assert(alloc_page() == NULL);
ffffffffc02010a6:	4505                	li	a0,1
    list_entry_t free_list_store = free_list;
ffffffffc02010a8:	00043c03          	ld	s8,0(s0)
ffffffffc02010ac:	00843b83          	ld	s7,8(s0)
    unsigned int nr_free_store = nr_free;
ffffffffc02010b0:	01042b03          	lw	s6,16(s0)
    elm->prev = elm->next = elm;
ffffffffc02010b4:	e400                	sd	s0,8(s0)
ffffffffc02010b6:	e000                	sd	s0,0(s0)
    nr_free = 0;
ffffffffc02010b8:	000a5797          	auipc	a5,0xa5
ffffffffc02010bc:	5e07a423          	sw	zero,1512(a5) # ffffffffc02a66a0 <free_area+0x10>
    assert(alloc_page() == NULL);
ffffffffc02010c0:	5b5000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc02010c4:	2c051863          	bnez	a0,ffffffffc0201394 <default_check+0x3c2>
    free_page(p0);
ffffffffc02010c8:	4585                	li	a1,1
ffffffffc02010ca:	8556                	mv	a0,s5
ffffffffc02010cc:	5e7000ef          	jal	ra,ffffffffc0201eb2 <free_pages>
    free_page(p1);
ffffffffc02010d0:	4585                	li	a1,1
ffffffffc02010d2:	854e                	mv	a0,s3
ffffffffc02010d4:	5df000ef          	jal	ra,ffffffffc0201eb2 <free_pages>
    free_page(p2);
ffffffffc02010d8:	4585                	li	a1,1
ffffffffc02010da:	8552                	mv	a0,s4
ffffffffc02010dc:	5d7000ef          	jal	ra,ffffffffc0201eb2 <free_pages>
    assert(nr_free == 3);
ffffffffc02010e0:	4818                	lw	a4,16(s0)
ffffffffc02010e2:	478d                	li	a5,3
ffffffffc02010e4:	28f71863          	bne	a4,a5,ffffffffc0201374 <default_check+0x3a2>
    assert((p0 = alloc_page()) != NULL);
ffffffffc02010e8:	4505                	li	a0,1
ffffffffc02010ea:	58b000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc02010ee:	89aa                	mv	s3,a0
ffffffffc02010f0:	26050263          	beqz	a0,ffffffffc0201354 <default_check+0x382>
    assert((p1 = alloc_page()) != NULL);
ffffffffc02010f4:	4505                	li	a0,1
ffffffffc02010f6:	57f000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc02010fa:	8aaa                	mv	s5,a0
ffffffffc02010fc:	3a050c63          	beqz	a0,ffffffffc02014b4 <default_check+0x4e2>
    assert((p2 = alloc_page()) != NULL);
ffffffffc0201100:	4505                	li	a0,1
ffffffffc0201102:	573000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc0201106:	8a2a                	mv	s4,a0
ffffffffc0201108:	38050663          	beqz	a0,ffffffffc0201494 <default_check+0x4c2>
    assert(alloc_page() == NULL);
ffffffffc020110c:	4505                	li	a0,1
ffffffffc020110e:	567000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc0201112:	36051163          	bnez	a0,ffffffffc0201474 <default_check+0x4a2>
    free_page(p0);
ffffffffc0201116:	4585                	li	a1,1
ffffffffc0201118:	854e                	mv	a0,s3
ffffffffc020111a:	599000ef          	jal	ra,ffffffffc0201eb2 <free_pages>
    assert(!list_empty(&free_list));
ffffffffc020111e:	641c                	ld	a5,8(s0)
ffffffffc0201120:	20878a63          	beq	a5,s0,ffffffffc0201334 <default_check+0x362>
    assert((p = alloc_page()) == p0);
ffffffffc0201124:	4505                	li	a0,1
ffffffffc0201126:	54f000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc020112a:	30a99563          	bne	s3,a0,ffffffffc0201434 <default_check+0x462>
    assert(alloc_page() == NULL);
ffffffffc020112e:	4505                	li	a0,1
ffffffffc0201130:	545000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc0201134:	2e051063          	bnez	a0,ffffffffc0201414 <default_check+0x442>
    assert(nr_free == 0);
ffffffffc0201138:	481c                	lw	a5,16(s0)
ffffffffc020113a:	2a079d63          	bnez	a5,ffffffffc02013f4 <default_check+0x422>
    free_page(p);
ffffffffc020113e:	854e                	mv	a0,s3
ffffffffc0201140:	4585                	li	a1,1
    free_list = free_list_store;
ffffffffc0201142:	01843023          	sd	s8,0(s0)
ffffffffc0201146:	01743423          	sd	s7,8(s0)
    nr_free = nr_free_store;
ffffffffc020114a:	01642823          	sw	s6,16(s0)
    free_page(p);
ffffffffc020114e:	565000ef          	jal	ra,ffffffffc0201eb2 <free_pages>
    free_page(p1);
ffffffffc0201152:	4585                	li	a1,1
ffffffffc0201154:	8556                	mv	a0,s5
ffffffffc0201156:	55d000ef          	jal	ra,ffffffffc0201eb2 <free_pages>
    free_page(p2);
ffffffffc020115a:	4585                	li	a1,1
ffffffffc020115c:	8552                	mv	a0,s4
ffffffffc020115e:	555000ef          	jal	ra,ffffffffc0201eb2 <free_pages>

    basic_check();

    struct Page *p0 = alloc_pages(5), *p1, *p2;
ffffffffc0201162:	4515                	li	a0,5
ffffffffc0201164:	511000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc0201168:	89aa                	mv	s3,a0
    assert(p0 != NULL);
ffffffffc020116a:	26050563          	beqz	a0,ffffffffc02013d4 <default_check+0x402>
ffffffffc020116e:	651c                	ld	a5,8(a0)
ffffffffc0201170:	8385                	srli	a5,a5,0x1
ffffffffc0201172:	8b85                	andi	a5,a5,1
    assert(!PageProperty(p0));
ffffffffc0201174:	54079063          	bnez	a5,ffffffffc02016b4 <default_check+0x6e2>

    list_entry_t free_list_store = free_list;
    list_init(&free_list);
    assert(list_empty(&free_list));
    assert(alloc_page() == NULL);
ffffffffc0201178:	4505                	li	a0,1
    list_entry_t free_list_store = free_list;
ffffffffc020117a:	00043b03          	ld	s6,0(s0)
ffffffffc020117e:	00843a83          	ld	s5,8(s0)
ffffffffc0201182:	e000                	sd	s0,0(s0)
ffffffffc0201184:	e400                	sd	s0,8(s0)
    assert(alloc_page() == NULL);
ffffffffc0201186:	4ef000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc020118a:	50051563          	bnez	a0,ffffffffc0201694 <default_check+0x6c2>

    unsigned int nr_free_store = nr_free;
    nr_free = 0;

    free_pages(p0 + 2, 3);
ffffffffc020118e:	08098a13          	addi	s4,s3,128
ffffffffc0201192:	8552                	mv	a0,s4
ffffffffc0201194:	458d                	li	a1,3
    unsigned int nr_free_store = nr_free;
ffffffffc0201196:	01042b83          	lw	s7,16(s0)
    nr_free = 0;
ffffffffc020119a:	000a5797          	auipc	a5,0xa5
ffffffffc020119e:	5007a323          	sw	zero,1286(a5) # ffffffffc02a66a0 <free_area+0x10>
    free_pages(p0 + 2, 3);
ffffffffc02011a2:	511000ef          	jal	ra,ffffffffc0201eb2 <free_pages>
    assert(alloc_pages(4) == NULL);
ffffffffc02011a6:	4511                	li	a0,4
ffffffffc02011a8:	4cd000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc02011ac:	4c051463          	bnez	a0,ffffffffc0201674 <default_check+0x6a2>
ffffffffc02011b0:	0889b783          	ld	a5,136(s3)
ffffffffc02011b4:	8385                	srli	a5,a5,0x1
ffffffffc02011b6:	8b85                	andi	a5,a5,1
    assert(PageProperty(p0 + 2) && p0[2].property == 3);
ffffffffc02011b8:	48078e63          	beqz	a5,ffffffffc0201654 <default_check+0x682>
ffffffffc02011bc:	0909a703          	lw	a4,144(s3)
ffffffffc02011c0:	478d                	li	a5,3
ffffffffc02011c2:	48f71963          	bne	a4,a5,ffffffffc0201654 <default_check+0x682>
    assert((p1 = alloc_pages(3)) != NULL);
ffffffffc02011c6:	450d                	li	a0,3
ffffffffc02011c8:	4ad000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc02011cc:	8c2a                	mv	s8,a0
ffffffffc02011ce:	46050363          	beqz	a0,ffffffffc0201634 <default_check+0x662>
    assert(alloc_page() == NULL);
ffffffffc02011d2:	4505                	li	a0,1
ffffffffc02011d4:	4a1000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc02011d8:	42051e63          	bnez	a0,ffffffffc0201614 <default_check+0x642>
    assert(p0 + 2 == p1);
ffffffffc02011dc:	418a1c63          	bne	s4,s8,ffffffffc02015f4 <default_check+0x622>

    p2 = p0 + 1;
    free_page(p0);
ffffffffc02011e0:	4585                	li	a1,1
ffffffffc02011e2:	854e                	mv	a0,s3
ffffffffc02011e4:	4cf000ef          	jal	ra,ffffffffc0201eb2 <free_pages>
    free_pages(p1, 3);
ffffffffc02011e8:	458d                	li	a1,3
ffffffffc02011ea:	8552                	mv	a0,s4
ffffffffc02011ec:	4c7000ef          	jal	ra,ffffffffc0201eb2 <free_pages>
ffffffffc02011f0:	0089b783          	ld	a5,8(s3)
    p2 = p0 + 1;
ffffffffc02011f4:	04098c13          	addi	s8,s3,64
ffffffffc02011f8:	8385                	srli	a5,a5,0x1
ffffffffc02011fa:	8b85                	andi	a5,a5,1
    assert(PageProperty(p0) && p0->property == 1);
ffffffffc02011fc:	3c078c63          	beqz	a5,ffffffffc02015d4 <default_check+0x602>
ffffffffc0201200:	0109a703          	lw	a4,16(s3)
ffffffffc0201204:	4785                	li	a5,1
ffffffffc0201206:	3cf71763          	bne	a4,a5,ffffffffc02015d4 <default_check+0x602>
ffffffffc020120a:	008a3783          	ld	a5,8(s4)
ffffffffc020120e:	8385                	srli	a5,a5,0x1
ffffffffc0201210:	8b85                	andi	a5,a5,1
    assert(PageProperty(p1) && p1->property == 3);
ffffffffc0201212:	3a078163          	beqz	a5,ffffffffc02015b4 <default_check+0x5e2>
ffffffffc0201216:	010a2703          	lw	a4,16(s4)
ffffffffc020121a:	478d                	li	a5,3
ffffffffc020121c:	38f71c63          	bne	a4,a5,ffffffffc02015b4 <default_check+0x5e2>

    assert((p0 = alloc_page()) == p2 - 1);
ffffffffc0201220:	4505                	li	a0,1
ffffffffc0201222:	453000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc0201226:	36a99763          	bne	s3,a0,ffffffffc0201594 <default_check+0x5c2>
    free_page(p0);
ffffffffc020122a:	4585                	li	a1,1
ffffffffc020122c:	487000ef          	jal	ra,ffffffffc0201eb2 <free_pages>
    assert((p0 = alloc_pages(2)) == p2 + 1);
ffffffffc0201230:	4509                	li	a0,2
ffffffffc0201232:	443000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc0201236:	32aa1f63          	bne	s4,a0,ffffffffc0201574 <default_check+0x5a2>

    free_pages(p0, 2);
ffffffffc020123a:	4589                	li	a1,2
ffffffffc020123c:	477000ef          	jal	ra,ffffffffc0201eb2 <free_pages>
    free_page(p2);
ffffffffc0201240:	4585                	li	a1,1
ffffffffc0201242:	8562                	mv	a0,s8
ffffffffc0201244:	46f000ef          	jal	ra,ffffffffc0201eb2 <free_pages>

    assert((p0 = alloc_pages(5)) != NULL);
ffffffffc0201248:	4515                	li	a0,5
ffffffffc020124a:	42b000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc020124e:	89aa                	mv	s3,a0
ffffffffc0201250:	48050263          	beqz	a0,ffffffffc02016d4 <default_check+0x702>
    assert(alloc_page() == NULL);
ffffffffc0201254:	4505                	li	a0,1
ffffffffc0201256:	41f000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc020125a:	2c051d63          	bnez	a0,ffffffffc0201534 <default_check+0x562>

    assert(nr_free == 0);
ffffffffc020125e:	481c                	lw	a5,16(s0)
ffffffffc0201260:	2a079a63          	bnez	a5,ffffffffc0201514 <default_check+0x542>
    nr_free = nr_free_store;

    free_list = free_list_store;
    free_pages(p0, 5);
ffffffffc0201264:	4595                	li	a1,5
ffffffffc0201266:	854e                	mv	a0,s3
    nr_free = nr_free_store;
ffffffffc0201268:	01742823          	sw	s7,16(s0)
    free_list = free_list_store;
ffffffffc020126c:	01643023          	sd	s6,0(s0)
ffffffffc0201270:	01543423          	sd	s5,8(s0)
    free_pages(p0, 5);
ffffffffc0201274:	43f000ef          	jal	ra,ffffffffc0201eb2 <free_pages>
    return listelm->next;
ffffffffc0201278:	641c                	ld	a5,8(s0)

    le = &free_list;
    while ((le = list_next(le)) != &free_list)
ffffffffc020127a:	00878963          	beq	a5,s0,ffffffffc020128c <default_check+0x2ba>
    {
        struct Page *p = le2page(le, page_link);
        count--, total -= p->property;
ffffffffc020127e:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201282:	679c                	ld	a5,8(a5)
ffffffffc0201284:	397d                	addiw	s2,s2,-1
ffffffffc0201286:	9c99                	subw	s1,s1,a4
    while ((le = list_next(le)) != &free_list)
ffffffffc0201288:	fe879be3          	bne	a5,s0,ffffffffc020127e <default_check+0x2ac>
    }
    assert(count == 0);
ffffffffc020128c:	26091463          	bnez	s2,ffffffffc02014f4 <default_check+0x522>
    assert(total == 0);
ffffffffc0201290:	46049263          	bnez	s1,ffffffffc02016f4 <default_check+0x722>
}
ffffffffc0201294:	60a6                	ld	ra,72(sp)
ffffffffc0201296:	6406                	ld	s0,64(sp)
ffffffffc0201298:	74e2                	ld	s1,56(sp)
ffffffffc020129a:	7942                	ld	s2,48(sp)
ffffffffc020129c:	79a2                	ld	s3,40(sp)
ffffffffc020129e:	7a02                	ld	s4,32(sp)
ffffffffc02012a0:	6ae2                	ld	s5,24(sp)
ffffffffc02012a2:	6b42                	ld	s6,16(sp)
ffffffffc02012a4:	6ba2                	ld	s7,8(sp)
ffffffffc02012a6:	6c02                	ld	s8,0(sp)
ffffffffc02012a8:	6161                	addi	sp,sp,80
ffffffffc02012aa:	8082                	ret
    while ((le = list_next(le)) != &free_list)
ffffffffc02012ac:	4981                	li	s3,0
    int count = 0, total = 0;
ffffffffc02012ae:	4481                	li	s1,0
ffffffffc02012b0:	4901                	li	s2,0
ffffffffc02012b2:	b38d                	j	ffffffffc0201014 <default_check+0x42>
        assert(PageProperty(p));
ffffffffc02012b4:	00005697          	auipc	a3,0x5
ffffffffc02012b8:	05468693          	addi	a3,a3,84 # ffffffffc0206308 <commands+0x808>
ffffffffc02012bc:	00005617          	auipc	a2,0x5
ffffffffc02012c0:	05c60613          	addi	a2,a2,92 # ffffffffc0206318 <commands+0x818>
ffffffffc02012c4:	11000593          	li	a1,272
ffffffffc02012c8:	00005517          	auipc	a0,0x5
ffffffffc02012cc:	06850513          	addi	a0,a0,104 # ffffffffc0206330 <commands+0x830>
ffffffffc02012d0:	9beff0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(p0 != p1 && p0 != p2 && p1 != p2);
ffffffffc02012d4:	00005697          	auipc	a3,0x5
ffffffffc02012d8:	0f468693          	addi	a3,a3,244 # ffffffffc02063c8 <commands+0x8c8>
ffffffffc02012dc:	00005617          	auipc	a2,0x5
ffffffffc02012e0:	03c60613          	addi	a2,a2,60 # ffffffffc0206318 <commands+0x818>
ffffffffc02012e4:	0db00593          	li	a1,219
ffffffffc02012e8:	00005517          	auipc	a0,0x5
ffffffffc02012ec:	04850513          	addi	a0,a0,72 # ffffffffc0206330 <commands+0x830>
ffffffffc02012f0:	99eff0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_ref(p0) == 0 && page_ref(p1) == 0 && page_ref(p2) == 0);
ffffffffc02012f4:	00005697          	auipc	a3,0x5
ffffffffc02012f8:	0fc68693          	addi	a3,a3,252 # ffffffffc02063f0 <commands+0x8f0>
ffffffffc02012fc:	00005617          	auipc	a2,0x5
ffffffffc0201300:	01c60613          	addi	a2,a2,28 # ffffffffc0206318 <commands+0x818>
ffffffffc0201304:	0dc00593          	li	a1,220
ffffffffc0201308:	00005517          	auipc	a0,0x5
ffffffffc020130c:	02850513          	addi	a0,a0,40 # ffffffffc0206330 <commands+0x830>
ffffffffc0201310:	97eff0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page2pa(p0) < npage * PGSIZE);
ffffffffc0201314:	00005697          	auipc	a3,0x5
ffffffffc0201318:	11c68693          	addi	a3,a3,284 # ffffffffc0206430 <commands+0x930>
ffffffffc020131c:	00005617          	auipc	a2,0x5
ffffffffc0201320:	ffc60613          	addi	a2,a2,-4 # ffffffffc0206318 <commands+0x818>
ffffffffc0201324:	0de00593          	li	a1,222
ffffffffc0201328:	00005517          	auipc	a0,0x5
ffffffffc020132c:	00850513          	addi	a0,a0,8 # ffffffffc0206330 <commands+0x830>
ffffffffc0201330:	95eff0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(!list_empty(&free_list));
ffffffffc0201334:	00005697          	auipc	a3,0x5
ffffffffc0201338:	18468693          	addi	a3,a3,388 # ffffffffc02064b8 <commands+0x9b8>
ffffffffc020133c:	00005617          	auipc	a2,0x5
ffffffffc0201340:	fdc60613          	addi	a2,a2,-36 # ffffffffc0206318 <commands+0x818>
ffffffffc0201344:	0f700593          	li	a1,247
ffffffffc0201348:	00005517          	auipc	a0,0x5
ffffffffc020134c:	fe850513          	addi	a0,a0,-24 # ffffffffc0206330 <commands+0x830>
ffffffffc0201350:	93eff0ef          	jal	ra,ffffffffc020048e <__panic>
    assert((p0 = alloc_page()) != NULL);
ffffffffc0201354:	00005697          	auipc	a3,0x5
ffffffffc0201358:	01468693          	addi	a3,a3,20 # ffffffffc0206368 <commands+0x868>
ffffffffc020135c:	00005617          	auipc	a2,0x5
ffffffffc0201360:	fbc60613          	addi	a2,a2,-68 # ffffffffc0206318 <commands+0x818>
ffffffffc0201364:	0f000593          	li	a1,240
ffffffffc0201368:	00005517          	auipc	a0,0x5
ffffffffc020136c:	fc850513          	addi	a0,a0,-56 # ffffffffc0206330 <commands+0x830>
ffffffffc0201370:	91eff0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(nr_free == 3);
ffffffffc0201374:	00005697          	auipc	a3,0x5
ffffffffc0201378:	13468693          	addi	a3,a3,308 # ffffffffc02064a8 <commands+0x9a8>
ffffffffc020137c:	00005617          	auipc	a2,0x5
ffffffffc0201380:	f9c60613          	addi	a2,a2,-100 # ffffffffc0206318 <commands+0x818>
ffffffffc0201384:	0ee00593          	li	a1,238
ffffffffc0201388:	00005517          	auipc	a0,0x5
ffffffffc020138c:	fa850513          	addi	a0,a0,-88 # ffffffffc0206330 <commands+0x830>
ffffffffc0201390:	8feff0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(alloc_page() == NULL);
ffffffffc0201394:	00005697          	auipc	a3,0x5
ffffffffc0201398:	0fc68693          	addi	a3,a3,252 # ffffffffc0206490 <commands+0x990>
ffffffffc020139c:	00005617          	auipc	a2,0x5
ffffffffc02013a0:	f7c60613          	addi	a2,a2,-132 # ffffffffc0206318 <commands+0x818>
ffffffffc02013a4:	0e900593          	li	a1,233
ffffffffc02013a8:	00005517          	auipc	a0,0x5
ffffffffc02013ac:	f8850513          	addi	a0,a0,-120 # ffffffffc0206330 <commands+0x830>
ffffffffc02013b0:	8deff0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page2pa(p2) < npage * PGSIZE);
ffffffffc02013b4:	00005697          	auipc	a3,0x5
ffffffffc02013b8:	0bc68693          	addi	a3,a3,188 # ffffffffc0206470 <commands+0x970>
ffffffffc02013bc:	00005617          	auipc	a2,0x5
ffffffffc02013c0:	f5c60613          	addi	a2,a2,-164 # ffffffffc0206318 <commands+0x818>
ffffffffc02013c4:	0e000593          	li	a1,224
ffffffffc02013c8:	00005517          	auipc	a0,0x5
ffffffffc02013cc:	f6850513          	addi	a0,a0,-152 # ffffffffc0206330 <commands+0x830>
ffffffffc02013d0:	8beff0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(p0 != NULL);
ffffffffc02013d4:	00005697          	auipc	a3,0x5
ffffffffc02013d8:	12c68693          	addi	a3,a3,300 # ffffffffc0206500 <commands+0xa00>
ffffffffc02013dc:	00005617          	auipc	a2,0x5
ffffffffc02013e0:	f3c60613          	addi	a2,a2,-196 # ffffffffc0206318 <commands+0x818>
ffffffffc02013e4:	11800593          	li	a1,280
ffffffffc02013e8:	00005517          	auipc	a0,0x5
ffffffffc02013ec:	f4850513          	addi	a0,a0,-184 # ffffffffc0206330 <commands+0x830>
ffffffffc02013f0:	89eff0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(nr_free == 0);
ffffffffc02013f4:	00005697          	auipc	a3,0x5
ffffffffc02013f8:	0fc68693          	addi	a3,a3,252 # ffffffffc02064f0 <commands+0x9f0>
ffffffffc02013fc:	00005617          	auipc	a2,0x5
ffffffffc0201400:	f1c60613          	addi	a2,a2,-228 # ffffffffc0206318 <commands+0x818>
ffffffffc0201404:	0fd00593          	li	a1,253
ffffffffc0201408:	00005517          	auipc	a0,0x5
ffffffffc020140c:	f2850513          	addi	a0,a0,-216 # ffffffffc0206330 <commands+0x830>
ffffffffc0201410:	87eff0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(alloc_page() == NULL);
ffffffffc0201414:	00005697          	auipc	a3,0x5
ffffffffc0201418:	07c68693          	addi	a3,a3,124 # ffffffffc0206490 <commands+0x990>
ffffffffc020141c:	00005617          	auipc	a2,0x5
ffffffffc0201420:	efc60613          	addi	a2,a2,-260 # ffffffffc0206318 <commands+0x818>
ffffffffc0201424:	0fb00593          	li	a1,251
ffffffffc0201428:	00005517          	auipc	a0,0x5
ffffffffc020142c:	f0850513          	addi	a0,a0,-248 # ffffffffc0206330 <commands+0x830>
ffffffffc0201430:	85eff0ef          	jal	ra,ffffffffc020048e <__panic>
    assert((p = alloc_page()) == p0);
ffffffffc0201434:	00005697          	auipc	a3,0x5
ffffffffc0201438:	09c68693          	addi	a3,a3,156 # ffffffffc02064d0 <commands+0x9d0>
ffffffffc020143c:	00005617          	auipc	a2,0x5
ffffffffc0201440:	edc60613          	addi	a2,a2,-292 # ffffffffc0206318 <commands+0x818>
ffffffffc0201444:	0fa00593          	li	a1,250
ffffffffc0201448:	00005517          	auipc	a0,0x5
ffffffffc020144c:	ee850513          	addi	a0,a0,-280 # ffffffffc0206330 <commands+0x830>
ffffffffc0201450:	83eff0ef          	jal	ra,ffffffffc020048e <__panic>
    assert((p0 = alloc_page()) != NULL);
ffffffffc0201454:	00005697          	auipc	a3,0x5
ffffffffc0201458:	f1468693          	addi	a3,a3,-236 # ffffffffc0206368 <commands+0x868>
ffffffffc020145c:	00005617          	auipc	a2,0x5
ffffffffc0201460:	ebc60613          	addi	a2,a2,-324 # ffffffffc0206318 <commands+0x818>
ffffffffc0201464:	0d700593          	li	a1,215
ffffffffc0201468:	00005517          	auipc	a0,0x5
ffffffffc020146c:	ec850513          	addi	a0,a0,-312 # ffffffffc0206330 <commands+0x830>
ffffffffc0201470:	81eff0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(alloc_page() == NULL);
ffffffffc0201474:	00005697          	auipc	a3,0x5
ffffffffc0201478:	01c68693          	addi	a3,a3,28 # ffffffffc0206490 <commands+0x990>
ffffffffc020147c:	00005617          	auipc	a2,0x5
ffffffffc0201480:	e9c60613          	addi	a2,a2,-356 # ffffffffc0206318 <commands+0x818>
ffffffffc0201484:	0f400593          	li	a1,244
ffffffffc0201488:	00005517          	auipc	a0,0x5
ffffffffc020148c:	ea850513          	addi	a0,a0,-344 # ffffffffc0206330 <commands+0x830>
ffffffffc0201490:	ffffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert((p2 = alloc_page()) != NULL);
ffffffffc0201494:	00005697          	auipc	a3,0x5
ffffffffc0201498:	f1468693          	addi	a3,a3,-236 # ffffffffc02063a8 <commands+0x8a8>
ffffffffc020149c:	00005617          	auipc	a2,0x5
ffffffffc02014a0:	e7c60613          	addi	a2,a2,-388 # ffffffffc0206318 <commands+0x818>
ffffffffc02014a4:	0f200593          	li	a1,242
ffffffffc02014a8:	00005517          	auipc	a0,0x5
ffffffffc02014ac:	e8850513          	addi	a0,a0,-376 # ffffffffc0206330 <commands+0x830>
ffffffffc02014b0:	fdffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert((p1 = alloc_page()) != NULL);
ffffffffc02014b4:	00005697          	auipc	a3,0x5
ffffffffc02014b8:	ed468693          	addi	a3,a3,-300 # ffffffffc0206388 <commands+0x888>
ffffffffc02014bc:	00005617          	auipc	a2,0x5
ffffffffc02014c0:	e5c60613          	addi	a2,a2,-420 # ffffffffc0206318 <commands+0x818>
ffffffffc02014c4:	0f100593          	li	a1,241
ffffffffc02014c8:	00005517          	auipc	a0,0x5
ffffffffc02014cc:	e6850513          	addi	a0,a0,-408 # ffffffffc0206330 <commands+0x830>
ffffffffc02014d0:	fbffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert((p2 = alloc_page()) != NULL);
ffffffffc02014d4:	00005697          	auipc	a3,0x5
ffffffffc02014d8:	ed468693          	addi	a3,a3,-300 # ffffffffc02063a8 <commands+0x8a8>
ffffffffc02014dc:	00005617          	auipc	a2,0x5
ffffffffc02014e0:	e3c60613          	addi	a2,a2,-452 # ffffffffc0206318 <commands+0x818>
ffffffffc02014e4:	0d900593          	li	a1,217
ffffffffc02014e8:	00005517          	auipc	a0,0x5
ffffffffc02014ec:	e4850513          	addi	a0,a0,-440 # ffffffffc0206330 <commands+0x830>
ffffffffc02014f0:	f9ffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(count == 0);
ffffffffc02014f4:	00005697          	auipc	a3,0x5
ffffffffc02014f8:	15c68693          	addi	a3,a3,348 # ffffffffc0206650 <commands+0xb50>
ffffffffc02014fc:	00005617          	auipc	a2,0x5
ffffffffc0201500:	e1c60613          	addi	a2,a2,-484 # ffffffffc0206318 <commands+0x818>
ffffffffc0201504:	14600593          	li	a1,326
ffffffffc0201508:	00005517          	auipc	a0,0x5
ffffffffc020150c:	e2850513          	addi	a0,a0,-472 # ffffffffc0206330 <commands+0x830>
ffffffffc0201510:	f7ffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(nr_free == 0);
ffffffffc0201514:	00005697          	auipc	a3,0x5
ffffffffc0201518:	fdc68693          	addi	a3,a3,-36 # ffffffffc02064f0 <commands+0x9f0>
ffffffffc020151c:	00005617          	auipc	a2,0x5
ffffffffc0201520:	dfc60613          	addi	a2,a2,-516 # ffffffffc0206318 <commands+0x818>
ffffffffc0201524:	13a00593          	li	a1,314
ffffffffc0201528:	00005517          	auipc	a0,0x5
ffffffffc020152c:	e0850513          	addi	a0,a0,-504 # ffffffffc0206330 <commands+0x830>
ffffffffc0201530:	f5ffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(alloc_page() == NULL);
ffffffffc0201534:	00005697          	auipc	a3,0x5
ffffffffc0201538:	f5c68693          	addi	a3,a3,-164 # ffffffffc0206490 <commands+0x990>
ffffffffc020153c:	00005617          	auipc	a2,0x5
ffffffffc0201540:	ddc60613          	addi	a2,a2,-548 # ffffffffc0206318 <commands+0x818>
ffffffffc0201544:	13800593          	li	a1,312
ffffffffc0201548:	00005517          	auipc	a0,0x5
ffffffffc020154c:	de850513          	addi	a0,a0,-536 # ffffffffc0206330 <commands+0x830>
ffffffffc0201550:	f3ffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page2pa(p1) < npage * PGSIZE);
ffffffffc0201554:	00005697          	auipc	a3,0x5
ffffffffc0201558:	efc68693          	addi	a3,a3,-260 # ffffffffc0206450 <commands+0x950>
ffffffffc020155c:	00005617          	auipc	a2,0x5
ffffffffc0201560:	dbc60613          	addi	a2,a2,-580 # ffffffffc0206318 <commands+0x818>
ffffffffc0201564:	0df00593          	li	a1,223
ffffffffc0201568:	00005517          	auipc	a0,0x5
ffffffffc020156c:	dc850513          	addi	a0,a0,-568 # ffffffffc0206330 <commands+0x830>
ffffffffc0201570:	f1ffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert((p0 = alloc_pages(2)) == p2 + 1);
ffffffffc0201574:	00005697          	auipc	a3,0x5
ffffffffc0201578:	09c68693          	addi	a3,a3,156 # ffffffffc0206610 <commands+0xb10>
ffffffffc020157c:	00005617          	auipc	a2,0x5
ffffffffc0201580:	d9c60613          	addi	a2,a2,-612 # ffffffffc0206318 <commands+0x818>
ffffffffc0201584:	13200593          	li	a1,306
ffffffffc0201588:	00005517          	auipc	a0,0x5
ffffffffc020158c:	da850513          	addi	a0,a0,-600 # ffffffffc0206330 <commands+0x830>
ffffffffc0201590:	efffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert((p0 = alloc_page()) == p2 - 1);
ffffffffc0201594:	00005697          	auipc	a3,0x5
ffffffffc0201598:	05c68693          	addi	a3,a3,92 # ffffffffc02065f0 <commands+0xaf0>
ffffffffc020159c:	00005617          	auipc	a2,0x5
ffffffffc02015a0:	d7c60613          	addi	a2,a2,-644 # ffffffffc0206318 <commands+0x818>
ffffffffc02015a4:	13000593          	li	a1,304
ffffffffc02015a8:	00005517          	auipc	a0,0x5
ffffffffc02015ac:	d8850513          	addi	a0,a0,-632 # ffffffffc0206330 <commands+0x830>
ffffffffc02015b0:	edffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(PageProperty(p1) && p1->property == 3);
ffffffffc02015b4:	00005697          	auipc	a3,0x5
ffffffffc02015b8:	01468693          	addi	a3,a3,20 # ffffffffc02065c8 <commands+0xac8>
ffffffffc02015bc:	00005617          	auipc	a2,0x5
ffffffffc02015c0:	d5c60613          	addi	a2,a2,-676 # ffffffffc0206318 <commands+0x818>
ffffffffc02015c4:	12e00593          	li	a1,302
ffffffffc02015c8:	00005517          	auipc	a0,0x5
ffffffffc02015cc:	d6850513          	addi	a0,a0,-664 # ffffffffc0206330 <commands+0x830>
ffffffffc02015d0:	ebffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(PageProperty(p0) && p0->property == 1);
ffffffffc02015d4:	00005697          	auipc	a3,0x5
ffffffffc02015d8:	fcc68693          	addi	a3,a3,-52 # ffffffffc02065a0 <commands+0xaa0>
ffffffffc02015dc:	00005617          	auipc	a2,0x5
ffffffffc02015e0:	d3c60613          	addi	a2,a2,-708 # ffffffffc0206318 <commands+0x818>
ffffffffc02015e4:	12d00593          	li	a1,301
ffffffffc02015e8:	00005517          	auipc	a0,0x5
ffffffffc02015ec:	d4850513          	addi	a0,a0,-696 # ffffffffc0206330 <commands+0x830>
ffffffffc02015f0:	e9ffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(p0 + 2 == p1);
ffffffffc02015f4:	00005697          	auipc	a3,0x5
ffffffffc02015f8:	f9c68693          	addi	a3,a3,-100 # ffffffffc0206590 <commands+0xa90>
ffffffffc02015fc:	00005617          	auipc	a2,0x5
ffffffffc0201600:	d1c60613          	addi	a2,a2,-740 # ffffffffc0206318 <commands+0x818>
ffffffffc0201604:	12800593          	li	a1,296
ffffffffc0201608:	00005517          	auipc	a0,0x5
ffffffffc020160c:	d2850513          	addi	a0,a0,-728 # ffffffffc0206330 <commands+0x830>
ffffffffc0201610:	e7ffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(alloc_page() == NULL);
ffffffffc0201614:	00005697          	auipc	a3,0x5
ffffffffc0201618:	e7c68693          	addi	a3,a3,-388 # ffffffffc0206490 <commands+0x990>
ffffffffc020161c:	00005617          	auipc	a2,0x5
ffffffffc0201620:	cfc60613          	addi	a2,a2,-772 # ffffffffc0206318 <commands+0x818>
ffffffffc0201624:	12700593          	li	a1,295
ffffffffc0201628:	00005517          	auipc	a0,0x5
ffffffffc020162c:	d0850513          	addi	a0,a0,-760 # ffffffffc0206330 <commands+0x830>
ffffffffc0201630:	e5ffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert((p1 = alloc_pages(3)) != NULL);
ffffffffc0201634:	00005697          	auipc	a3,0x5
ffffffffc0201638:	f3c68693          	addi	a3,a3,-196 # ffffffffc0206570 <commands+0xa70>
ffffffffc020163c:	00005617          	auipc	a2,0x5
ffffffffc0201640:	cdc60613          	addi	a2,a2,-804 # ffffffffc0206318 <commands+0x818>
ffffffffc0201644:	12600593          	li	a1,294
ffffffffc0201648:	00005517          	auipc	a0,0x5
ffffffffc020164c:	ce850513          	addi	a0,a0,-792 # ffffffffc0206330 <commands+0x830>
ffffffffc0201650:	e3ffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(PageProperty(p0 + 2) && p0[2].property == 3);
ffffffffc0201654:	00005697          	auipc	a3,0x5
ffffffffc0201658:	eec68693          	addi	a3,a3,-276 # ffffffffc0206540 <commands+0xa40>
ffffffffc020165c:	00005617          	auipc	a2,0x5
ffffffffc0201660:	cbc60613          	addi	a2,a2,-836 # ffffffffc0206318 <commands+0x818>
ffffffffc0201664:	12500593          	li	a1,293
ffffffffc0201668:	00005517          	auipc	a0,0x5
ffffffffc020166c:	cc850513          	addi	a0,a0,-824 # ffffffffc0206330 <commands+0x830>
ffffffffc0201670:	e1ffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(alloc_pages(4) == NULL);
ffffffffc0201674:	00005697          	auipc	a3,0x5
ffffffffc0201678:	eb468693          	addi	a3,a3,-332 # ffffffffc0206528 <commands+0xa28>
ffffffffc020167c:	00005617          	auipc	a2,0x5
ffffffffc0201680:	c9c60613          	addi	a2,a2,-868 # ffffffffc0206318 <commands+0x818>
ffffffffc0201684:	12400593          	li	a1,292
ffffffffc0201688:	00005517          	auipc	a0,0x5
ffffffffc020168c:	ca850513          	addi	a0,a0,-856 # ffffffffc0206330 <commands+0x830>
ffffffffc0201690:	dfffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(alloc_page() == NULL);
ffffffffc0201694:	00005697          	auipc	a3,0x5
ffffffffc0201698:	dfc68693          	addi	a3,a3,-516 # ffffffffc0206490 <commands+0x990>
ffffffffc020169c:	00005617          	auipc	a2,0x5
ffffffffc02016a0:	c7c60613          	addi	a2,a2,-900 # ffffffffc0206318 <commands+0x818>
ffffffffc02016a4:	11e00593          	li	a1,286
ffffffffc02016a8:	00005517          	auipc	a0,0x5
ffffffffc02016ac:	c8850513          	addi	a0,a0,-888 # ffffffffc0206330 <commands+0x830>
ffffffffc02016b0:	ddffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(!PageProperty(p0));
ffffffffc02016b4:	00005697          	auipc	a3,0x5
ffffffffc02016b8:	e5c68693          	addi	a3,a3,-420 # ffffffffc0206510 <commands+0xa10>
ffffffffc02016bc:	00005617          	auipc	a2,0x5
ffffffffc02016c0:	c5c60613          	addi	a2,a2,-932 # ffffffffc0206318 <commands+0x818>
ffffffffc02016c4:	11900593          	li	a1,281
ffffffffc02016c8:	00005517          	auipc	a0,0x5
ffffffffc02016cc:	c6850513          	addi	a0,a0,-920 # ffffffffc0206330 <commands+0x830>
ffffffffc02016d0:	dbffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert((p0 = alloc_pages(5)) != NULL);
ffffffffc02016d4:	00005697          	auipc	a3,0x5
ffffffffc02016d8:	f5c68693          	addi	a3,a3,-164 # ffffffffc0206630 <commands+0xb30>
ffffffffc02016dc:	00005617          	auipc	a2,0x5
ffffffffc02016e0:	c3c60613          	addi	a2,a2,-964 # ffffffffc0206318 <commands+0x818>
ffffffffc02016e4:	13700593          	li	a1,311
ffffffffc02016e8:	00005517          	auipc	a0,0x5
ffffffffc02016ec:	c4850513          	addi	a0,a0,-952 # ffffffffc0206330 <commands+0x830>
ffffffffc02016f0:	d9ffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(total == 0);
ffffffffc02016f4:	00005697          	auipc	a3,0x5
ffffffffc02016f8:	f6c68693          	addi	a3,a3,-148 # ffffffffc0206660 <commands+0xb60>
ffffffffc02016fc:	00005617          	auipc	a2,0x5
ffffffffc0201700:	c1c60613          	addi	a2,a2,-996 # ffffffffc0206318 <commands+0x818>
ffffffffc0201704:	14700593          	li	a1,327
ffffffffc0201708:	00005517          	auipc	a0,0x5
ffffffffc020170c:	c2850513          	addi	a0,a0,-984 # ffffffffc0206330 <commands+0x830>
ffffffffc0201710:	d7ffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(total == nr_free_pages());
ffffffffc0201714:	00005697          	auipc	a3,0x5
ffffffffc0201718:	c3468693          	addi	a3,a3,-972 # ffffffffc0206348 <commands+0x848>
ffffffffc020171c:	00005617          	auipc	a2,0x5
ffffffffc0201720:	bfc60613          	addi	a2,a2,-1028 # ffffffffc0206318 <commands+0x818>
ffffffffc0201724:	11300593          	li	a1,275
ffffffffc0201728:	00005517          	auipc	a0,0x5
ffffffffc020172c:	c0850513          	addi	a0,a0,-1016 # ffffffffc0206330 <commands+0x830>
ffffffffc0201730:	d5ffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert((p1 = alloc_page()) != NULL);
ffffffffc0201734:	00005697          	auipc	a3,0x5
ffffffffc0201738:	c5468693          	addi	a3,a3,-940 # ffffffffc0206388 <commands+0x888>
ffffffffc020173c:	00005617          	auipc	a2,0x5
ffffffffc0201740:	bdc60613          	addi	a2,a2,-1060 # ffffffffc0206318 <commands+0x818>
ffffffffc0201744:	0d800593          	li	a1,216
ffffffffc0201748:	00005517          	auipc	a0,0x5
ffffffffc020174c:	be850513          	addi	a0,a0,-1048 # ffffffffc0206330 <commands+0x830>
ffffffffc0201750:	d3ffe0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0201754 <default_free_pages>:
{
ffffffffc0201754:	1141                	addi	sp,sp,-16
ffffffffc0201756:	e406                	sd	ra,8(sp)
    assert(n > 0);
ffffffffc0201758:	14058463          	beqz	a1,ffffffffc02018a0 <default_free_pages+0x14c>
    for (; p != base + n; p++)
ffffffffc020175c:	00659693          	slli	a3,a1,0x6
ffffffffc0201760:	96aa                	add	a3,a3,a0
ffffffffc0201762:	87aa                	mv	a5,a0
ffffffffc0201764:	02d50263          	beq	a0,a3,ffffffffc0201788 <default_free_pages+0x34>
ffffffffc0201768:	6798                	ld	a4,8(a5)
ffffffffc020176a:	8b05                	andi	a4,a4,1
        assert(!PageReserved(p) && !PageProperty(p));
ffffffffc020176c:	10071a63          	bnez	a4,ffffffffc0201880 <default_free_pages+0x12c>
ffffffffc0201770:	6798                	ld	a4,8(a5)
ffffffffc0201772:	8b09                	andi	a4,a4,2
ffffffffc0201774:	10071663          	bnez	a4,ffffffffc0201880 <default_free_pages+0x12c>
        p->flags = 0;
ffffffffc0201778:	0007b423          	sd	zero,8(a5)
}

static inline void
set_page_ref(struct Page *page, int val)
{
    page->ref = val;
ffffffffc020177c:	0007a023          	sw	zero,0(a5)
    for (; p != base + n; p++)
ffffffffc0201780:	04078793          	addi	a5,a5,64
ffffffffc0201784:	fed792e3          	bne	a5,a3,ffffffffc0201768 <default_free_pages+0x14>
    base->property = n;
ffffffffc0201788:	2581                	sext.w	a1,a1
ffffffffc020178a:	c90c                	sw	a1,16(a0)
    SetPageProperty(base);
ffffffffc020178c:	00850893          	addi	a7,a0,8
    __op_bit(or, __NOP, nr, ((volatile unsigned long *)addr));
ffffffffc0201790:	4789                	li	a5,2
ffffffffc0201792:	40f8b02f          	amoor.d	zero,a5,(a7)
    nr_free += n;
ffffffffc0201796:	000a5697          	auipc	a3,0xa5
ffffffffc020179a:	efa68693          	addi	a3,a3,-262 # ffffffffc02a6690 <free_area>
ffffffffc020179e:	4a98                	lw	a4,16(a3)
    return list->next == list;
ffffffffc02017a0:	669c                	ld	a5,8(a3)
        list_add(&free_list, &(base->page_link));
ffffffffc02017a2:	01850613          	addi	a2,a0,24
    nr_free += n;
ffffffffc02017a6:	9db9                	addw	a1,a1,a4
ffffffffc02017a8:	ca8c                	sw	a1,16(a3)
    if (list_empty(&free_list))
ffffffffc02017aa:	0ad78463          	beq	a5,a3,ffffffffc0201852 <default_free_pages+0xfe>
            struct Page *page = le2page(le, page_link);
ffffffffc02017ae:	fe878713          	addi	a4,a5,-24
ffffffffc02017b2:	0006b803          	ld	a6,0(a3)
    if (list_empty(&free_list))
ffffffffc02017b6:	4581                	li	a1,0
            if (base < page)
ffffffffc02017b8:	00e56a63          	bltu	a0,a4,ffffffffc02017cc <default_free_pages+0x78>
    return listelm->next;
ffffffffc02017bc:	6798                	ld	a4,8(a5)
            else if (list_next(le) == &free_list)
ffffffffc02017be:	04d70c63          	beq	a4,a3,ffffffffc0201816 <default_free_pages+0xc2>
    for (; p != base + n; p++)
ffffffffc02017c2:	87ba                	mv	a5,a4
            struct Page *page = le2page(le, page_link);
ffffffffc02017c4:	fe878713          	addi	a4,a5,-24
            if (base < page)
ffffffffc02017c8:	fee57ae3          	bgeu	a0,a4,ffffffffc02017bc <default_free_pages+0x68>
ffffffffc02017cc:	c199                	beqz	a1,ffffffffc02017d2 <default_free_pages+0x7e>
ffffffffc02017ce:	0106b023          	sd	a6,0(a3)
    __list_add(elm, listelm->prev, listelm);
ffffffffc02017d2:	6398                	ld	a4,0(a5)
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 * */
static inline void
__list_add(list_entry_t *elm, list_entry_t *prev, list_entry_t *next) {
    prev->next = next->prev = elm;
ffffffffc02017d4:	e390                	sd	a2,0(a5)
ffffffffc02017d6:	e710                	sd	a2,8(a4)
    elm->next = next;
ffffffffc02017d8:	f11c                	sd	a5,32(a0)
    elm->prev = prev;
ffffffffc02017da:	ed18                	sd	a4,24(a0)
    if (le != &free_list)
ffffffffc02017dc:	00d70d63          	beq	a4,a3,ffffffffc02017f6 <default_free_pages+0xa2>
        if (p + p->property == base)
ffffffffc02017e0:	ff872583          	lw	a1,-8(a4)
        p = le2page(le, page_link);
ffffffffc02017e4:	fe870613          	addi	a2,a4,-24
        if (p + p->property == base)
ffffffffc02017e8:	02059813          	slli	a6,a1,0x20
ffffffffc02017ec:	01a85793          	srli	a5,a6,0x1a
ffffffffc02017f0:	97b2                	add	a5,a5,a2
ffffffffc02017f2:	02f50c63          	beq	a0,a5,ffffffffc020182a <default_free_pages+0xd6>
    return listelm->next;
ffffffffc02017f6:	711c                	ld	a5,32(a0)
    if (le != &free_list)
ffffffffc02017f8:	00d78c63          	beq	a5,a3,ffffffffc0201810 <default_free_pages+0xbc>
        if (base + base->property == p)
ffffffffc02017fc:	4910                	lw	a2,16(a0)
        p = le2page(le, page_link);
ffffffffc02017fe:	fe878693          	addi	a3,a5,-24
        if (base + base->property == p)
ffffffffc0201802:	02061593          	slli	a1,a2,0x20
ffffffffc0201806:	01a5d713          	srli	a4,a1,0x1a
ffffffffc020180a:	972a                	add	a4,a4,a0
ffffffffc020180c:	04e68a63          	beq	a3,a4,ffffffffc0201860 <default_free_pages+0x10c>
}
ffffffffc0201810:	60a2                	ld	ra,8(sp)
ffffffffc0201812:	0141                	addi	sp,sp,16
ffffffffc0201814:	8082                	ret
    prev->next = next->prev = elm;
ffffffffc0201816:	e790                	sd	a2,8(a5)
    elm->next = next;
ffffffffc0201818:	f114                	sd	a3,32(a0)
    return listelm->next;
ffffffffc020181a:	6798                	ld	a4,8(a5)
    elm->prev = prev;
ffffffffc020181c:	ed1c                	sd	a5,24(a0)
        while ((le = list_next(le)) != &free_list)
ffffffffc020181e:	02d70763          	beq	a4,a3,ffffffffc020184c <default_free_pages+0xf8>
    prev->next = next->prev = elm;
ffffffffc0201822:	8832                	mv	a6,a2
ffffffffc0201824:	4585                	li	a1,1
    for (; p != base + n; p++)
ffffffffc0201826:	87ba                	mv	a5,a4
ffffffffc0201828:	bf71                	j	ffffffffc02017c4 <default_free_pages+0x70>
            p->property += base->property;
ffffffffc020182a:	491c                	lw	a5,16(a0)
ffffffffc020182c:	9dbd                	addw	a1,a1,a5
ffffffffc020182e:	feb72c23          	sw	a1,-8(a4)
    __op_bit(and, __NOT, nr, ((volatile unsigned long *)addr));
ffffffffc0201832:	57f5                	li	a5,-3
ffffffffc0201834:	60f8b02f          	amoand.d	zero,a5,(a7)
    __list_del(listelm->prev, listelm->next);
ffffffffc0201838:	01853803          	ld	a6,24(a0)
ffffffffc020183c:	710c                	ld	a1,32(a0)
            base = p;
ffffffffc020183e:	8532                	mv	a0,a2
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 * */
static inline void
__list_del(list_entry_t *prev, list_entry_t *next) {
    prev->next = next;
ffffffffc0201840:	00b83423          	sd	a1,8(a6)
    return listelm->next;
ffffffffc0201844:	671c                	ld	a5,8(a4)
    next->prev = prev;
ffffffffc0201846:	0105b023          	sd	a6,0(a1)
ffffffffc020184a:	b77d                	j	ffffffffc02017f8 <default_free_pages+0xa4>
ffffffffc020184c:	e290                	sd	a2,0(a3)
        while ((le = list_next(le)) != &free_list)
ffffffffc020184e:	873e                	mv	a4,a5
ffffffffc0201850:	bf41                	j	ffffffffc02017e0 <default_free_pages+0x8c>
}
ffffffffc0201852:	60a2                	ld	ra,8(sp)
    prev->next = next->prev = elm;
ffffffffc0201854:	e390                	sd	a2,0(a5)
ffffffffc0201856:	e790                	sd	a2,8(a5)
    elm->next = next;
ffffffffc0201858:	f11c                	sd	a5,32(a0)
    elm->prev = prev;
ffffffffc020185a:	ed1c                	sd	a5,24(a0)
ffffffffc020185c:	0141                	addi	sp,sp,16
ffffffffc020185e:	8082                	ret
            base->property += p->property;
ffffffffc0201860:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201864:	ff078693          	addi	a3,a5,-16
ffffffffc0201868:	9e39                	addw	a2,a2,a4
ffffffffc020186a:	c910                	sw	a2,16(a0)
ffffffffc020186c:	5775                	li	a4,-3
ffffffffc020186e:	60e6b02f          	amoand.d	zero,a4,(a3)
    __list_del(listelm->prev, listelm->next);
ffffffffc0201872:	6398                	ld	a4,0(a5)
ffffffffc0201874:	679c                	ld	a5,8(a5)
}
ffffffffc0201876:	60a2                	ld	ra,8(sp)
    prev->next = next;
ffffffffc0201878:	e71c                	sd	a5,8(a4)
    next->prev = prev;
ffffffffc020187a:	e398                	sd	a4,0(a5)
ffffffffc020187c:	0141                	addi	sp,sp,16
ffffffffc020187e:	8082                	ret
        assert(!PageReserved(p) && !PageProperty(p));
ffffffffc0201880:	00005697          	auipc	a3,0x5
ffffffffc0201884:	df868693          	addi	a3,a3,-520 # ffffffffc0206678 <commands+0xb78>
ffffffffc0201888:	00005617          	auipc	a2,0x5
ffffffffc020188c:	a9060613          	addi	a2,a2,-1392 # ffffffffc0206318 <commands+0x818>
ffffffffc0201890:	09400593          	li	a1,148
ffffffffc0201894:	00005517          	auipc	a0,0x5
ffffffffc0201898:	a9c50513          	addi	a0,a0,-1380 # ffffffffc0206330 <commands+0x830>
ffffffffc020189c:	bf3fe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(n > 0);
ffffffffc02018a0:	00005697          	auipc	a3,0x5
ffffffffc02018a4:	dd068693          	addi	a3,a3,-560 # ffffffffc0206670 <commands+0xb70>
ffffffffc02018a8:	00005617          	auipc	a2,0x5
ffffffffc02018ac:	a7060613          	addi	a2,a2,-1424 # ffffffffc0206318 <commands+0x818>
ffffffffc02018b0:	09000593          	li	a1,144
ffffffffc02018b4:	00005517          	auipc	a0,0x5
ffffffffc02018b8:	a7c50513          	addi	a0,a0,-1412 # ffffffffc0206330 <commands+0x830>
ffffffffc02018bc:	bd3fe0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc02018c0 <default_alloc_pages>:
    assert(n > 0);
ffffffffc02018c0:	c941                	beqz	a0,ffffffffc0201950 <default_alloc_pages+0x90>
    if (n > nr_free)
ffffffffc02018c2:	000a5597          	auipc	a1,0xa5
ffffffffc02018c6:	dce58593          	addi	a1,a1,-562 # ffffffffc02a6690 <free_area>
ffffffffc02018ca:	0105a803          	lw	a6,16(a1)
ffffffffc02018ce:	872a                	mv	a4,a0
ffffffffc02018d0:	02081793          	slli	a5,a6,0x20
ffffffffc02018d4:	9381                	srli	a5,a5,0x20
ffffffffc02018d6:	00a7ee63          	bltu	a5,a0,ffffffffc02018f2 <default_alloc_pages+0x32>
    list_entry_t *le = &free_list;
ffffffffc02018da:	87ae                	mv	a5,a1
ffffffffc02018dc:	a801                	j	ffffffffc02018ec <default_alloc_pages+0x2c>
        if (p->property >= n)
ffffffffc02018de:	ff87a683          	lw	a3,-8(a5)
ffffffffc02018e2:	02069613          	slli	a2,a3,0x20
ffffffffc02018e6:	9201                	srli	a2,a2,0x20
ffffffffc02018e8:	00e67763          	bgeu	a2,a4,ffffffffc02018f6 <default_alloc_pages+0x36>
    return listelm->next;
ffffffffc02018ec:	679c                	ld	a5,8(a5)
    while ((le = list_next(le)) != &free_list)
ffffffffc02018ee:	feb798e3          	bne	a5,a1,ffffffffc02018de <default_alloc_pages+0x1e>
        return NULL;
ffffffffc02018f2:	4501                	li	a0,0
}
ffffffffc02018f4:	8082                	ret
    return listelm->prev;
ffffffffc02018f6:	0007b883          	ld	a7,0(a5)
    __list_del(listelm->prev, listelm->next);
ffffffffc02018fa:	0087b303          	ld	t1,8(a5)
        struct Page *p = le2page(le, page_link);
ffffffffc02018fe:	fe878513          	addi	a0,a5,-24
            p->property = page->property - n;
ffffffffc0201902:	00070e1b          	sext.w	t3,a4
    prev->next = next;
ffffffffc0201906:	0068b423          	sd	t1,8(a7)
    next->prev = prev;
ffffffffc020190a:	01133023          	sd	a7,0(t1)
        if (page->property > n)
ffffffffc020190e:	02c77863          	bgeu	a4,a2,ffffffffc020193e <default_alloc_pages+0x7e>
            struct Page *p = page + n;
ffffffffc0201912:	071a                	slli	a4,a4,0x6
ffffffffc0201914:	972a                	add	a4,a4,a0
            p->property = page->property - n;
ffffffffc0201916:	41c686bb          	subw	a3,a3,t3
ffffffffc020191a:	cb14                	sw	a3,16(a4)
    __op_bit(or, __NOP, nr, ((volatile unsigned long *)addr));
ffffffffc020191c:	00870613          	addi	a2,a4,8
ffffffffc0201920:	4689                	li	a3,2
ffffffffc0201922:	40d6302f          	amoor.d	zero,a3,(a2)
    __list_add(elm, listelm, listelm->next);
ffffffffc0201926:	0088b683          	ld	a3,8(a7)
            list_add(prev, &(p->page_link));
ffffffffc020192a:	01870613          	addi	a2,a4,24
        nr_free -= n;
ffffffffc020192e:	0105a803          	lw	a6,16(a1)
    prev->next = next->prev = elm;
ffffffffc0201932:	e290                	sd	a2,0(a3)
ffffffffc0201934:	00c8b423          	sd	a2,8(a7)
    elm->next = next;
ffffffffc0201938:	f314                	sd	a3,32(a4)
    elm->prev = prev;
ffffffffc020193a:	01173c23          	sd	a7,24(a4)
ffffffffc020193e:	41c8083b          	subw	a6,a6,t3
ffffffffc0201942:	0105a823          	sw	a6,16(a1)
    __op_bit(and, __NOT, nr, ((volatile unsigned long *)addr));
ffffffffc0201946:	5775                	li	a4,-3
ffffffffc0201948:	17c1                	addi	a5,a5,-16
ffffffffc020194a:	60e7b02f          	amoand.d	zero,a4,(a5)
}
ffffffffc020194e:	8082                	ret
{
ffffffffc0201950:	1141                	addi	sp,sp,-16
    assert(n > 0);
ffffffffc0201952:	00005697          	auipc	a3,0x5
ffffffffc0201956:	d1e68693          	addi	a3,a3,-738 # ffffffffc0206670 <commands+0xb70>
ffffffffc020195a:	00005617          	auipc	a2,0x5
ffffffffc020195e:	9be60613          	addi	a2,a2,-1602 # ffffffffc0206318 <commands+0x818>
ffffffffc0201962:	06c00593          	li	a1,108
ffffffffc0201966:	00005517          	auipc	a0,0x5
ffffffffc020196a:	9ca50513          	addi	a0,a0,-1590 # ffffffffc0206330 <commands+0x830>
{
ffffffffc020196e:	e406                	sd	ra,8(sp)
    assert(n > 0);
ffffffffc0201970:	b1ffe0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0201974 <default_init_memmap>:
{
ffffffffc0201974:	1141                	addi	sp,sp,-16
ffffffffc0201976:	e406                	sd	ra,8(sp)
    assert(n > 0);
ffffffffc0201978:	c5f1                	beqz	a1,ffffffffc0201a44 <default_init_memmap+0xd0>
    for (; p != base + n; p++)
ffffffffc020197a:	00659693          	slli	a3,a1,0x6
ffffffffc020197e:	96aa                	add	a3,a3,a0
ffffffffc0201980:	87aa                	mv	a5,a0
ffffffffc0201982:	00d50f63          	beq	a0,a3,ffffffffc02019a0 <default_init_memmap+0x2c>
    return (((*(volatile unsigned long *)addr) >> nr) & 1);
ffffffffc0201986:	6798                	ld	a4,8(a5)
ffffffffc0201988:	8b05                	andi	a4,a4,1
        assert(PageReserved(p));
ffffffffc020198a:	cf49                	beqz	a4,ffffffffc0201a24 <default_init_memmap+0xb0>
        p->flags = p->property = 0;
ffffffffc020198c:	0007a823          	sw	zero,16(a5)
ffffffffc0201990:	0007b423          	sd	zero,8(a5)
ffffffffc0201994:	0007a023          	sw	zero,0(a5)
    for (; p != base + n; p++)
ffffffffc0201998:	04078793          	addi	a5,a5,64
ffffffffc020199c:	fed795e3          	bne	a5,a3,ffffffffc0201986 <default_init_memmap+0x12>
    base->property = n;
ffffffffc02019a0:	2581                	sext.w	a1,a1
ffffffffc02019a2:	c90c                	sw	a1,16(a0)
    __op_bit(or, __NOP, nr, ((volatile unsigned long *)addr));
ffffffffc02019a4:	4789                	li	a5,2
ffffffffc02019a6:	00850713          	addi	a4,a0,8
ffffffffc02019aa:	40f7302f          	amoor.d	zero,a5,(a4)
    nr_free += n;
ffffffffc02019ae:	000a5697          	auipc	a3,0xa5
ffffffffc02019b2:	ce268693          	addi	a3,a3,-798 # ffffffffc02a6690 <free_area>
ffffffffc02019b6:	4a98                	lw	a4,16(a3)
    return list->next == list;
ffffffffc02019b8:	669c                	ld	a5,8(a3)
        list_add(&free_list, &(base->page_link));
ffffffffc02019ba:	01850613          	addi	a2,a0,24
    nr_free += n;
ffffffffc02019be:	9db9                	addw	a1,a1,a4
ffffffffc02019c0:	ca8c                	sw	a1,16(a3)
    if (list_empty(&free_list))
ffffffffc02019c2:	04d78a63          	beq	a5,a3,ffffffffc0201a16 <default_init_memmap+0xa2>
            struct Page *page = le2page(le, page_link);
ffffffffc02019c6:	fe878713          	addi	a4,a5,-24
ffffffffc02019ca:	0006b803          	ld	a6,0(a3)
    if (list_empty(&free_list))
ffffffffc02019ce:	4581                	li	a1,0
            if (base < page)
ffffffffc02019d0:	00e56a63          	bltu	a0,a4,ffffffffc02019e4 <default_init_memmap+0x70>
    return listelm->next;
ffffffffc02019d4:	6798                	ld	a4,8(a5)
            else if (list_next(le) == &free_list)
ffffffffc02019d6:	02d70263          	beq	a4,a3,ffffffffc02019fa <default_init_memmap+0x86>
    for (; p != base + n; p++)
ffffffffc02019da:	87ba                	mv	a5,a4
            struct Page *page = le2page(le, page_link);
ffffffffc02019dc:	fe878713          	addi	a4,a5,-24
            if (base < page)
ffffffffc02019e0:	fee57ae3          	bgeu	a0,a4,ffffffffc02019d4 <default_init_memmap+0x60>
ffffffffc02019e4:	c199                	beqz	a1,ffffffffc02019ea <default_init_memmap+0x76>
ffffffffc02019e6:	0106b023          	sd	a6,0(a3)
    __list_add(elm, listelm->prev, listelm);
ffffffffc02019ea:	6398                	ld	a4,0(a5)
}
ffffffffc02019ec:	60a2                	ld	ra,8(sp)
    prev->next = next->prev = elm;
ffffffffc02019ee:	e390                	sd	a2,0(a5)
ffffffffc02019f0:	e710                	sd	a2,8(a4)
    elm->next = next;
ffffffffc02019f2:	f11c                	sd	a5,32(a0)
    elm->prev = prev;
ffffffffc02019f4:	ed18                	sd	a4,24(a0)
ffffffffc02019f6:	0141                	addi	sp,sp,16
ffffffffc02019f8:	8082                	ret
    prev->next = next->prev = elm;
ffffffffc02019fa:	e790                	sd	a2,8(a5)
    elm->next = next;
ffffffffc02019fc:	f114                	sd	a3,32(a0)
    return listelm->next;
ffffffffc02019fe:	6798                	ld	a4,8(a5)
    elm->prev = prev;
ffffffffc0201a00:	ed1c                	sd	a5,24(a0)
        while ((le = list_next(le)) != &free_list)
ffffffffc0201a02:	00d70663          	beq	a4,a3,ffffffffc0201a0e <default_init_memmap+0x9a>
    prev->next = next->prev = elm;
ffffffffc0201a06:	8832                	mv	a6,a2
ffffffffc0201a08:	4585                	li	a1,1
    for (; p != base + n; p++)
ffffffffc0201a0a:	87ba                	mv	a5,a4
ffffffffc0201a0c:	bfc1                	j	ffffffffc02019dc <default_init_memmap+0x68>
}
ffffffffc0201a0e:	60a2                	ld	ra,8(sp)
ffffffffc0201a10:	e290                	sd	a2,0(a3)
ffffffffc0201a12:	0141                	addi	sp,sp,16
ffffffffc0201a14:	8082                	ret
ffffffffc0201a16:	60a2                	ld	ra,8(sp)
ffffffffc0201a18:	e390                	sd	a2,0(a5)
ffffffffc0201a1a:	e790                	sd	a2,8(a5)
    elm->next = next;
ffffffffc0201a1c:	f11c                	sd	a5,32(a0)
    elm->prev = prev;
ffffffffc0201a1e:	ed1c                	sd	a5,24(a0)
ffffffffc0201a20:	0141                	addi	sp,sp,16
ffffffffc0201a22:	8082                	ret
        assert(PageReserved(p));
ffffffffc0201a24:	00005697          	auipc	a3,0x5
ffffffffc0201a28:	c7c68693          	addi	a3,a3,-900 # ffffffffc02066a0 <commands+0xba0>
ffffffffc0201a2c:	00005617          	auipc	a2,0x5
ffffffffc0201a30:	8ec60613          	addi	a2,a2,-1812 # ffffffffc0206318 <commands+0x818>
ffffffffc0201a34:	04b00593          	li	a1,75
ffffffffc0201a38:	00005517          	auipc	a0,0x5
ffffffffc0201a3c:	8f850513          	addi	a0,a0,-1800 # ffffffffc0206330 <commands+0x830>
ffffffffc0201a40:	a4ffe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(n > 0);
ffffffffc0201a44:	00005697          	auipc	a3,0x5
ffffffffc0201a48:	c2c68693          	addi	a3,a3,-980 # ffffffffc0206670 <commands+0xb70>
ffffffffc0201a4c:	00005617          	auipc	a2,0x5
ffffffffc0201a50:	8cc60613          	addi	a2,a2,-1844 # ffffffffc0206318 <commands+0x818>
ffffffffc0201a54:	04700593          	li	a1,71
ffffffffc0201a58:	00005517          	auipc	a0,0x5
ffffffffc0201a5c:	8d850513          	addi	a0,a0,-1832 # ffffffffc0206330 <commands+0x830>
ffffffffc0201a60:	a2ffe0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0201a64 <slob_free>:
static void slob_free(void *block, int size)
{
	slob_t *cur, *b = (slob_t *)block;
	unsigned long flags;

	if (!block)
ffffffffc0201a64:	c94d                	beqz	a0,ffffffffc0201b16 <slob_free+0xb2>
{
ffffffffc0201a66:	1141                	addi	sp,sp,-16
ffffffffc0201a68:	e022                	sd	s0,0(sp)
ffffffffc0201a6a:	e406                	sd	ra,8(sp)
ffffffffc0201a6c:	842a                	mv	s0,a0
		return;

	if (size)
ffffffffc0201a6e:	e9c1                	bnez	a1,ffffffffc0201afe <slob_free+0x9a>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201a70:	100027f3          	csrr	a5,sstatus
ffffffffc0201a74:	8b89                	andi	a5,a5,2
    return 0;
ffffffffc0201a76:	4501                	li	a0,0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201a78:	ebd9                	bnez	a5,ffffffffc0201b0e <slob_free+0xaa>
		b->units = SLOB_UNITS(size);

	/* Find reinsertion point */
	spin_lock_irqsave(&slob_lock, flags);
	for (cur = slobfree; !(b > cur && b < cur->next); cur = cur->next)
ffffffffc0201a7a:	000a5617          	auipc	a2,0xa5
ffffffffc0201a7e:	80660613          	addi	a2,a2,-2042 # ffffffffc02a6280 <slobfree>
ffffffffc0201a82:	621c                	ld	a5,0(a2)
		if (cur >= cur->next && (b > cur || b < cur->next))
ffffffffc0201a84:	873e                	mv	a4,a5
	for (cur = slobfree; !(b > cur && b < cur->next); cur = cur->next)
ffffffffc0201a86:	679c                	ld	a5,8(a5)
ffffffffc0201a88:	02877a63          	bgeu	a4,s0,ffffffffc0201abc <slob_free+0x58>
ffffffffc0201a8c:	00f46463          	bltu	s0,a5,ffffffffc0201a94 <slob_free+0x30>
		if (cur >= cur->next && (b > cur || b < cur->next))
ffffffffc0201a90:	fef76ae3          	bltu	a4,a5,ffffffffc0201a84 <slob_free+0x20>
			break;

	if (b + b->units == cur->next)
ffffffffc0201a94:	400c                	lw	a1,0(s0)
ffffffffc0201a96:	00459693          	slli	a3,a1,0x4
ffffffffc0201a9a:	96a2                	add	a3,a3,s0
ffffffffc0201a9c:	02d78a63          	beq	a5,a3,ffffffffc0201ad0 <slob_free+0x6c>
		b->next = cur->next->next;
	}
	else
		b->next = cur->next;

	if (cur + cur->units == b)
ffffffffc0201aa0:	4314                	lw	a3,0(a4)
		b->next = cur->next;
ffffffffc0201aa2:	e41c                	sd	a5,8(s0)
	if (cur + cur->units == b)
ffffffffc0201aa4:	00469793          	slli	a5,a3,0x4
ffffffffc0201aa8:	97ba                	add	a5,a5,a4
ffffffffc0201aaa:	02f40e63          	beq	s0,a5,ffffffffc0201ae6 <slob_free+0x82>
	{
		cur->units += b->units;
		cur->next = b->next;
	}
	else
		cur->next = b;
ffffffffc0201aae:	e700                	sd	s0,8(a4)

	slobfree = cur;
ffffffffc0201ab0:	e218                	sd	a4,0(a2)
    if (flag)
ffffffffc0201ab2:	e129                	bnez	a0,ffffffffc0201af4 <slob_free+0x90>

	spin_unlock_irqrestore(&slob_lock, flags);
}
ffffffffc0201ab4:	60a2                	ld	ra,8(sp)
ffffffffc0201ab6:	6402                	ld	s0,0(sp)
ffffffffc0201ab8:	0141                	addi	sp,sp,16
ffffffffc0201aba:	8082                	ret
		if (cur >= cur->next && (b > cur || b < cur->next))
ffffffffc0201abc:	fcf764e3          	bltu	a4,a5,ffffffffc0201a84 <slob_free+0x20>
ffffffffc0201ac0:	fcf472e3          	bgeu	s0,a5,ffffffffc0201a84 <slob_free+0x20>
	if (b + b->units == cur->next)
ffffffffc0201ac4:	400c                	lw	a1,0(s0)
ffffffffc0201ac6:	00459693          	slli	a3,a1,0x4
ffffffffc0201aca:	96a2                	add	a3,a3,s0
ffffffffc0201acc:	fcd79ae3          	bne	a5,a3,ffffffffc0201aa0 <slob_free+0x3c>
		b->units += cur->next->units;
ffffffffc0201ad0:	4394                	lw	a3,0(a5)
		b->next = cur->next->next;
ffffffffc0201ad2:	679c                	ld	a5,8(a5)
		b->units += cur->next->units;
ffffffffc0201ad4:	9db5                	addw	a1,a1,a3
ffffffffc0201ad6:	c00c                	sw	a1,0(s0)
	if (cur + cur->units == b)
ffffffffc0201ad8:	4314                	lw	a3,0(a4)
		b->next = cur->next->next;
ffffffffc0201ada:	e41c                	sd	a5,8(s0)
	if (cur + cur->units == b)
ffffffffc0201adc:	00469793          	slli	a5,a3,0x4
ffffffffc0201ae0:	97ba                	add	a5,a5,a4
ffffffffc0201ae2:	fcf416e3          	bne	s0,a5,ffffffffc0201aae <slob_free+0x4a>
		cur->units += b->units;
ffffffffc0201ae6:	401c                	lw	a5,0(s0)
		cur->next = b->next;
ffffffffc0201ae8:	640c                	ld	a1,8(s0)
	slobfree = cur;
ffffffffc0201aea:	e218                	sd	a4,0(a2)
		cur->units += b->units;
ffffffffc0201aec:	9ebd                	addw	a3,a3,a5
ffffffffc0201aee:	c314                	sw	a3,0(a4)
		cur->next = b->next;
ffffffffc0201af0:	e70c                	sd	a1,8(a4)
ffffffffc0201af2:	d169                	beqz	a0,ffffffffc0201ab4 <slob_free+0x50>
}
ffffffffc0201af4:	6402                	ld	s0,0(sp)
ffffffffc0201af6:	60a2                	ld	ra,8(sp)
ffffffffc0201af8:	0141                	addi	sp,sp,16
        intr_enable();
ffffffffc0201afa:	eb5fe06f          	j	ffffffffc02009ae <intr_enable>
		b->units = SLOB_UNITS(size);
ffffffffc0201afe:	25bd                	addiw	a1,a1,15
ffffffffc0201b00:	8191                	srli	a1,a1,0x4
ffffffffc0201b02:	c10c                	sw	a1,0(a0)
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201b04:	100027f3          	csrr	a5,sstatus
ffffffffc0201b08:	8b89                	andi	a5,a5,2
    return 0;
ffffffffc0201b0a:	4501                	li	a0,0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201b0c:	d7bd                	beqz	a5,ffffffffc0201a7a <slob_free+0x16>
        intr_disable();
ffffffffc0201b0e:	ea7fe0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        return 1;
ffffffffc0201b12:	4505                	li	a0,1
ffffffffc0201b14:	b79d                	j	ffffffffc0201a7a <slob_free+0x16>
ffffffffc0201b16:	8082                	ret

ffffffffc0201b18 <__slob_get_free_pages.constprop.0>:
	struct Page *page = alloc_pages(1 << order);
ffffffffc0201b18:	4785                	li	a5,1
static void *__slob_get_free_pages(gfp_t gfp, int order)
ffffffffc0201b1a:	1141                	addi	sp,sp,-16
	struct Page *page = alloc_pages(1 << order);
ffffffffc0201b1c:	00a7953b          	sllw	a0,a5,a0
static void *__slob_get_free_pages(gfp_t gfp, int order)
ffffffffc0201b20:	e406                	sd	ra,8(sp)
	struct Page *page = alloc_pages(1 << order);
ffffffffc0201b22:	352000ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
	if (!page)
ffffffffc0201b26:	c91d                	beqz	a0,ffffffffc0201b5c <__slob_get_free_pages.constprop.0+0x44>
    return page - pages + nbase;
ffffffffc0201b28:	000a9697          	auipc	a3,0xa9
ffffffffc0201b2c:	bd86b683          	ld	a3,-1064(a3) # ffffffffc02aa700 <pages>
ffffffffc0201b30:	8d15                	sub	a0,a0,a3
ffffffffc0201b32:	8519                	srai	a0,a0,0x6
ffffffffc0201b34:	00006697          	auipc	a3,0x6
ffffffffc0201b38:	1d46b683          	ld	a3,468(a3) # ffffffffc0207d08 <nbase>
ffffffffc0201b3c:	9536                	add	a0,a0,a3
    return KADDR(page2pa(page));
ffffffffc0201b3e:	00c51793          	slli	a5,a0,0xc
ffffffffc0201b42:	83b1                	srli	a5,a5,0xc
ffffffffc0201b44:	000a9717          	auipc	a4,0xa9
ffffffffc0201b48:	bb473703          	ld	a4,-1100(a4) # ffffffffc02aa6f8 <npage>
    return page2ppn(page) << PGSHIFT;
ffffffffc0201b4c:	0532                	slli	a0,a0,0xc
    return KADDR(page2pa(page));
ffffffffc0201b4e:	00e7fa63          	bgeu	a5,a4,ffffffffc0201b62 <__slob_get_free_pages.constprop.0+0x4a>
ffffffffc0201b52:	000a9697          	auipc	a3,0xa9
ffffffffc0201b56:	bbe6b683          	ld	a3,-1090(a3) # ffffffffc02aa710 <va_pa_offset>
ffffffffc0201b5a:	9536                	add	a0,a0,a3
}
ffffffffc0201b5c:	60a2                	ld	ra,8(sp)
ffffffffc0201b5e:	0141                	addi	sp,sp,16
ffffffffc0201b60:	8082                	ret
ffffffffc0201b62:	86aa                	mv	a3,a0
ffffffffc0201b64:	00005617          	auipc	a2,0x5
ffffffffc0201b68:	b9c60613          	addi	a2,a2,-1124 # ffffffffc0206700 <default_pmm_manager+0x38>
ffffffffc0201b6c:	07100593          	li	a1,113
ffffffffc0201b70:	00005517          	auipc	a0,0x5
ffffffffc0201b74:	bb850513          	addi	a0,a0,-1096 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc0201b78:	917fe0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0201b7c <slob_alloc.constprop.0>:
static void *slob_alloc(size_t size, gfp_t gfp, int align)
ffffffffc0201b7c:	1101                	addi	sp,sp,-32
ffffffffc0201b7e:	ec06                	sd	ra,24(sp)
ffffffffc0201b80:	e822                	sd	s0,16(sp)
ffffffffc0201b82:	e426                	sd	s1,8(sp)
ffffffffc0201b84:	e04a                	sd	s2,0(sp)
	assert((size + SLOB_UNIT) < PAGE_SIZE);
ffffffffc0201b86:	01050713          	addi	a4,a0,16
ffffffffc0201b8a:	6785                	lui	a5,0x1
ffffffffc0201b8c:	0cf77363          	bgeu	a4,a5,ffffffffc0201c52 <slob_alloc.constprop.0+0xd6>
	int delta = 0, units = SLOB_UNITS(size);
ffffffffc0201b90:	00f50493          	addi	s1,a0,15
ffffffffc0201b94:	8091                	srli	s1,s1,0x4
ffffffffc0201b96:	2481                	sext.w	s1,s1
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201b98:	10002673          	csrr	a2,sstatus
ffffffffc0201b9c:	8a09                	andi	a2,a2,2
ffffffffc0201b9e:	e25d                	bnez	a2,ffffffffc0201c44 <slob_alloc.constprop.0+0xc8>
	prev = slobfree;
ffffffffc0201ba0:	000a4917          	auipc	s2,0xa4
ffffffffc0201ba4:	6e090913          	addi	s2,s2,1760 # ffffffffc02a6280 <slobfree>
ffffffffc0201ba8:	00093683          	ld	a3,0(s2)
	for (cur = prev->next;; prev = cur, cur = cur->next)
ffffffffc0201bac:	669c                	ld	a5,8(a3)
		if (cur->units >= units + delta)
ffffffffc0201bae:	4398                	lw	a4,0(a5)
ffffffffc0201bb0:	08975e63          	bge	a4,s1,ffffffffc0201c4c <slob_alloc.constprop.0+0xd0>
		if (cur == slobfree)
ffffffffc0201bb4:	00f68b63          	beq	a3,a5,ffffffffc0201bca <slob_alloc.constprop.0+0x4e>
	for (cur = prev->next;; prev = cur, cur = cur->next)
ffffffffc0201bb8:	6780                	ld	s0,8(a5)
		if (cur->units >= units + delta)
ffffffffc0201bba:	4018                	lw	a4,0(s0)
ffffffffc0201bbc:	02975a63          	bge	a4,s1,ffffffffc0201bf0 <slob_alloc.constprop.0+0x74>
		if (cur == slobfree)
ffffffffc0201bc0:	00093683          	ld	a3,0(s2)
ffffffffc0201bc4:	87a2                	mv	a5,s0
ffffffffc0201bc6:	fef699e3          	bne	a3,a5,ffffffffc0201bb8 <slob_alloc.constprop.0+0x3c>
    if (flag)
ffffffffc0201bca:	ee31                	bnez	a2,ffffffffc0201c26 <slob_alloc.constprop.0+0xaa>
			cur = (slob_t *)__slob_get_free_page(gfp);
ffffffffc0201bcc:	4501                	li	a0,0
ffffffffc0201bce:	f4bff0ef          	jal	ra,ffffffffc0201b18 <__slob_get_free_pages.constprop.0>
ffffffffc0201bd2:	842a                	mv	s0,a0
			if (!cur)
ffffffffc0201bd4:	cd05                	beqz	a0,ffffffffc0201c0c <slob_alloc.constprop.0+0x90>
			slob_free(cur, PAGE_SIZE);
ffffffffc0201bd6:	6585                	lui	a1,0x1
ffffffffc0201bd8:	e8dff0ef          	jal	ra,ffffffffc0201a64 <slob_free>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201bdc:	10002673          	csrr	a2,sstatus
ffffffffc0201be0:	8a09                	andi	a2,a2,2
ffffffffc0201be2:	ee05                	bnez	a2,ffffffffc0201c1a <slob_alloc.constprop.0+0x9e>
			cur = slobfree;
ffffffffc0201be4:	00093783          	ld	a5,0(s2)
	for (cur = prev->next;; prev = cur, cur = cur->next)
ffffffffc0201be8:	6780                	ld	s0,8(a5)
		if (cur->units >= units + delta)
ffffffffc0201bea:	4018                	lw	a4,0(s0)
ffffffffc0201bec:	fc974ae3          	blt	a4,s1,ffffffffc0201bc0 <slob_alloc.constprop.0+0x44>
			if (cur->units == units)	/* exact fit? */
ffffffffc0201bf0:	04e48763          	beq	s1,a4,ffffffffc0201c3e <slob_alloc.constprop.0+0xc2>
				prev->next = cur + units;
ffffffffc0201bf4:	00449693          	slli	a3,s1,0x4
ffffffffc0201bf8:	96a2                	add	a3,a3,s0
ffffffffc0201bfa:	e794                	sd	a3,8(a5)
				prev->next->next = cur->next;
ffffffffc0201bfc:	640c                	ld	a1,8(s0)
				prev->next->units = cur->units - units;
ffffffffc0201bfe:	9f05                	subw	a4,a4,s1
ffffffffc0201c00:	c298                	sw	a4,0(a3)
				prev->next->next = cur->next;
ffffffffc0201c02:	e68c                	sd	a1,8(a3)
				cur->units = units;
ffffffffc0201c04:	c004                	sw	s1,0(s0)
			slobfree = prev;
ffffffffc0201c06:	00f93023          	sd	a5,0(s2)
    if (flag)
ffffffffc0201c0a:	e20d                	bnez	a2,ffffffffc0201c2c <slob_alloc.constprop.0+0xb0>
}
ffffffffc0201c0c:	60e2                	ld	ra,24(sp)
ffffffffc0201c0e:	8522                	mv	a0,s0
ffffffffc0201c10:	6442                	ld	s0,16(sp)
ffffffffc0201c12:	64a2                	ld	s1,8(sp)
ffffffffc0201c14:	6902                	ld	s2,0(sp)
ffffffffc0201c16:	6105                	addi	sp,sp,32
ffffffffc0201c18:	8082                	ret
        intr_disable();
ffffffffc0201c1a:	d9bfe0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
			cur = slobfree;
ffffffffc0201c1e:	00093783          	ld	a5,0(s2)
        return 1;
ffffffffc0201c22:	4605                	li	a2,1
ffffffffc0201c24:	b7d1                	j	ffffffffc0201be8 <slob_alloc.constprop.0+0x6c>
        intr_enable();
ffffffffc0201c26:	d89fe0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0201c2a:	b74d                	j	ffffffffc0201bcc <slob_alloc.constprop.0+0x50>
ffffffffc0201c2c:	d83fe0ef          	jal	ra,ffffffffc02009ae <intr_enable>
}
ffffffffc0201c30:	60e2                	ld	ra,24(sp)
ffffffffc0201c32:	8522                	mv	a0,s0
ffffffffc0201c34:	6442                	ld	s0,16(sp)
ffffffffc0201c36:	64a2                	ld	s1,8(sp)
ffffffffc0201c38:	6902                	ld	s2,0(sp)
ffffffffc0201c3a:	6105                	addi	sp,sp,32
ffffffffc0201c3c:	8082                	ret
				prev->next = cur->next; /* unlink */
ffffffffc0201c3e:	6418                	ld	a4,8(s0)
ffffffffc0201c40:	e798                	sd	a4,8(a5)
ffffffffc0201c42:	b7d1                	j	ffffffffc0201c06 <slob_alloc.constprop.0+0x8a>
        intr_disable();
ffffffffc0201c44:	d71fe0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        return 1;
ffffffffc0201c48:	4605                	li	a2,1
ffffffffc0201c4a:	bf99                	j	ffffffffc0201ba0 <slob_alloc.constprop.0+0x24>
		if (cur->units >= units + delta)
ffffffffc0201c4c:	843e                	mv	s0,a5
ffffffffc0201c4e:	87b6                	mv	a5,a3
ffffffffc0201c50:	b745                	j	ffffffffc0201bf0 <slob_alloc.constprop.0+0x74>
	assert((size + SLOB_UNIT) < PAGE_SIZE);
ffffffffc0201c52:	00005697          	auipc	a3,0x5
ffffffffc0201c56:	ae668693          	addi	a3,a3,-1306 # ffffffffc0206738 <default_pmm_manager+0x70>
ffffffffc0201c5a:	00004617          	auipc	a2,0x4
ffffffffc0201c5e:	6be60613          	addi	a2,a2,1726 # ffffffffc0206318 <commands+0x818>
ffffffffc0201c62:	06300593          	li	a1,99
ffffffffc0201c66:	00005517          	auipc	a0,0x5
ffffffffc0201c6a:	af250513          	addi	a0,a0,-1294 # ffffffffc0206758 <default_pmm_manager+0x90>
ffffffffc0201c6e:	821fe0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0201c72 <kmalloc_init>:
	cprintf("use SLOB allocator\n");
}

inline void
kmalloc_init(void)
{
ffffffffc0201c72:	1141                	addi	sp,sp,-16
	cprintf("use SLOB allocator\n");
ffffffffc0201c74:	00005517          	auipc	a0,0x5
ffffffffc0201c78:	afc50513          	addi	a0,a0,-1284 # ffffffffc0206770 <default_pmm_manager+0xa8>
{
ffffffffc0201c7c:	e406                	sd	ra,8(sp)
	cprintf("use SLOB allocator\n");
ffffffffc0201c7e:	d16fe0ef          	jal	ra,ffffffffc0200194 <cprintf>
	slob_init();
	cprintf("kmalloc_init() succeeded!\n");
}
ffffffffc0201c82:	60a2                	ld	ra,8(sp)
	cprintf("kmalloc_init() succeeded!\n");
ffffffffc0201c84:	00005517          	auipc	a0,0x5
ffffffffc0201c88:	b0450513          	addi	a0,a0,-1276 # ffffffffc0206788 <default_pmm_manager+0xc0>
}
ffffffffc0201c8c:	0141                	addi	sp,sp,16
	cprintf("kmalloc_init() succeeded!\n");
ffffffffc0201c8e:	d06fe06f          	j	ffffffffc0200194 <cprintf>

ffffffffc0201c92 <kallocated>:

size_t
kallocated(void)
{
	return slob_allocated();
}
ffffffffc0201c92:	4501                	li	a0,0
ffffffffc0201c94:	8082                	ret

ffffffffc0201c96 <kmalloc>:
	return 0;
}

void *
kmalloc(size_t size)
{
ffffffffc0201c96:	1101                	addi	sp,sp,-32
ffffffffc0201c98:	e04a                	sd	s2,0(sp)
	if (size < PAGE_SIZE - SLOB_UNIT)
ffffffffc0201c9a:	6905                	lui	s2,0x1
{
ffffffffc0201c9c:	e822                	sd	s0,16(sp)
ffffffffc0201c9e:	ec06                	sd	ra,24(sp)
ffffffffc0201ca0:	e426                	sd	s1,8(sp)
	if (size < PAGE_SIZE - SLOB_UNIT)
ffffffffc0201ca2:	fef90793          	addi	a5,s2,-17 # fef <_binary_obj___user_faultread_out_size-0x8bb9>
{
ffffffffc0201ca6:	842a                	mv	s0,a0
	if (size < PAGE_SIZE - SLOB_UNIT)
ffffffffc0201ca8:	04a7f963          	bgeu	a5,a0,ffffffffc0201cfa <kmalloc+0x64>
	bb = slob_alloc(sizeof(bigblock_t), gfp, 0);
ffffffffc0201cac:	4561                	li	a0,24
ffffffffc0201cae:	ecfff0ef          	jal	ra,ffffffffc0201b7c <slob_alloc.constprop.0>
ffffffffc0201cb2:	84aa                	mv	s1,a0
	if (!bb)
ffffffffc0201cb4:	c929                	beqz	a0,ffffffffc0201d06 <kmalloc+0x70>
	bb->order = find_order(size);
ffffffffc0201cb6:	0004079b          	sext.w	a5,s0
	int order = 0;
ffffffffc0201cba:	4501                	li	a0,0
	for (; size > 4096; size >>= 1)
ffffffffc0201cbc:	00f95763          	bge	s2,a5,ffffffffc0201cca <kmalloc+0x34>
ffffffffc0201cc0:	6705                	lui	a4,0x1
ffffffffc0201cc2:	8785                	srai	a5,a5,0x1
		order++;
ffffffffc0201cc4:	2505                	addiw	a0,a0,1
	for (; size > 4096; size >>= 1)
ffffffffc0201cc6:	fef74ee3          	blt	a4,a5,ffffffffc0201cc2 <kmalloc+0x2c>
	bb->order = find_order(size);
ffffffffc0201cca:	c088                	sw	a0,0(s1)
	bb->pages = (void *)__slob_get_free_pages(gfp, bb->order);
ffffffffc0201ccc:	e4dff0ef          	jal	ra,ffffffffc0201b18 <__slob_get_free_pages.constprop.0>
ffffffffc0201cd0:	e488                	sd	a0,8(s1)
ffffffffc0201cd2:	842a                	mv	s0,a0
	if (bb->pages)
ffffffffc0201cd4:	c525                	beqz	a0,ffffffffc0201d3c <kmalloc+0xa6>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201cd6:	100027f3          	csrr	a5,sstatus
ffffffffc0201cda:	8b89                	andi	a5,a5,2
ffffffffc0201cdc:	ef8d                	bnez	a5,ffffffffc0201d16 <kmalloc+0x80>
		bb->next = bigblocks;
ffffffffc0201cde:	000a9797          	auipc	a5,0xa9
ffffffffc0201ce2:	a0278793          	addi	a5,a5,-1534 # ffffffffc02aa6e0 <bigblocks>
ffffffffc0201ce6:	6398                	ld	a4,0(a5)
		bigblocks = bb;
ffffffffc0201ce8:	e384                	sd	s1,0(a5)
		bb->next = bigblocks;
ffffffffc0201cea:	e898                	sd	a4,16(s1)
	return __kmalloc(size, 0);
}
ffffffffc0201cec:	60e2                	ld	ra,24(sp)
ffffffffc0201cee:	8522                	mv	a0,s0
ffffffffc0201cf0:	6442                	ld	s0,16(sp)
ffffffffc0201cf2:	64a2                	ld	s1,8(sp)
ffffffffc0201cf4:	6902                	ld	s2,0(sp)
ffffffffc0201cf6:	6105                	addi	sp,sp,32
ffffffffc0201cf8:	8082                	ret
		m = slob_alloc(size + SLOB_UNIT, gfp, 0);
ffffffffc0201cfa:	0541                	addi	a0,a0,16
ffffffffc0201cfc:	e81ff0ef          	jal	ra,ffffffffc0201b7c <slob_alloc.constprop.0>
		return m ? (void *)(m + 1) : 0;
ffffffffc0201d00:	01050413          	addi	s0,a0,16
ffffffffc0201d04:	f565                	bnez	a0,ffffffffc0201cec <kmalloc+0x56>
ffffffffc0201d06:	4401                	li	s0,0
}
ffffffffc0201d08:	60e2                	ld	ra,24(sp)
ffffffffc0201d0a:	8522                	mv	a0,s0
ffffffffc0201d0c:	6442                	ld	s0,16(sp)
ffffffffc0201d0e:	64a2                	ld	s1,8(sp)
ffffffffc0201d10:	6902                	ld	s2,0(sp)
ffffffffc0201d12:	6105                	addi	sp,sp,32
ffffffffc0201d14:	8082                	ret
        intr_disable();
ffffffffc0201d16:	c9ffe0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
		bb->next = bigblocks;
ffffffffc0201d1a:	000a9797          	auipc	a5,0xa9
ffffffffc0201d1e:	9c678793          	addi	a5,a5,-1594 # ffffffffc02aa6e0 <bigblocks>
ffffffffc0201d22:	6398                	ld	a4,0(a5)
		bigblocks = bb;
ffffffffc0201d24:	e384                	sd	s1,0(a5)
		bb->next = bigblocks;
ffffffffc0201d26:	e898                	sd	a4,16(s1)
        intr_enable();
ffffffffc0201d28:	c87fe0ef          	jal	ra,ffffffffc02009ae <intr_enable>
		return bb->pages;
ffffffffc0201d2c:	6480                	ld	s0,8(s1)
}
ffffffffc0201d2e:	60e2                	ld	ra,24(sp)
ffffffffc0201d30:	64a2                	ld	s1,8(sp)
ffffffffc0201d32:	8522                	mv	a0,s0
ffffffffc0201d34:	6442                	ld	s0,16(sp)
ffffffffc0201d36:	6902                	ld	s2,0(sp)
ffffffffc0201d38:	6105                	addi	sp,sp,32
ffffffffc0201d3a:	8082                	ret
	slob_free(bb, sizeof(bigblock_t));
ffffffffc0201d3c:	45e1                	li	a1,24
ffffffffc0201d3e:	8526                	mv	a0,s1
ffffffffc0201d40:	d25ff0ef          	jal	ra,ffffffffc0201a64 <slob_free>
	return __kmalloc(size, 0);
ffffffffc0201d44:	b765                	j	ffffffffc0201cec <kmalloc+0x56>

ffffffffc0201d46 <kfree>:
void kfree(void *block)
{
	bigblock_t *bb, **last = &bigblocks;
	unsigned long flags;

	if (!block)
ffffffffc0201d46:	c169                	beqz	a0,ffffffffc0201e08 <kfree+0xc2>
{
ffffffffc0201d48:	1101                	addi	sp,sp,-32
ffffffffc0201d4a:	e822                	sd	s0,16(sp)
ffffffffc0201d4c:	ec06                	sd	ra,24(sp)
ffffffffc0201d4e:	e426                	sd	s1,8(sp)
		return;

	if (!((unsigned long)block & (PAGE_SIZE - 1)))
ffffffffc0201d50:	03451793          	slli	a5,a0,0x34
ffffffffc0201d54:	842a                	mv	s0,a0
ffffffffc0201d56:	e3d9                	bnez	a5,ffffffffc0201ddc <kfree+0x96>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201d58:	100027f3          	csrr	a5,sstatus
ffffffffc0201d5c:	8b89                	andi	a5,a5,2
ffffffffc0201d5e:	e7d9                	bnez	a5,ffffffffc0201dec <kfree+0xa6>
	{
		/* might be on the big block list */
		spin_lock_irqsave(&block_lock, flags);
		for (bb = bigblocks; bb; last = &bb->next, bb = bb->next)
ffffffffc0201d60:	000a9797          	auipc	a5,0xa9
ffffffffc0201d64:	9807b783          	ld	a5,-1664(a5) # ffffffffc02aa6e0 <bigblocks>
    return 0;
ffffffffc0201d68:	4601                	li	a2,0
ffffffffc0201d6a:	cbad                	beqz	a5,ffffffffc0201ddc <kfree+0x96>
	bigblock_t *bb, **last = &bigblocks;
ffffffffc0201d6c:	000a9697          	auipc	a3,0xa9
ffffffffc0201d70:	97468693          	addi	a3,a3,-1676 # ffffffffc02aa6e0 <bigblocks>
ffffffffc0201d74:	a021                	j	ffffffffc0201d7c <kfree+0x36>
		for (bb = bigblocks; bb; last = &bb->next, bb = bb->next)
ffffffffc0201d76:	01048693          	addi	a3,s1,16
ffffffffc0201d7a:	c3a5                	beqz	a5,ffffffffc0201dda <kfree+0x94>
		{
			if (bb->pages == block)
ffffffffc0201d7c:	6798                	ld	a4,8(a5)
ffffffffc0201d7e:	84be                	mv	s1,a5
			{
				*last = bb->next;
ffffffffc0201d80:	6b9c                	ld	a5,16(a5)
			if (bb->pages == block)
ffffffffc0201d82:	fe871ae3          	bne	a4,s0,ffffffffc0201d76 <kfree+0x30>
				*last = bb->next;
ffffffffc0201d86:	e29c                	sd	a5,0(a3)
    if (flag)
ffffffffc0201d88:	ee2d                	bnez	a2,ffffffffc0201e02 <kfree+0xbc>
    return pa2page(PADDR(kva));
ffffffffc0201d8a:	c02007b7          	lui	a5,0xc0200
				spin_unlock_irqrestore(&block_lock, flags);
				__slob_free_pages((unsigned long)block, bb->order);
ffffffffc0201d8e:	4098                	lw	a4,0(s1)
ffffffffc0201d90:	08f46963          	bltu	s0,a5,ffffffffc0201e22 <kfree+0xdc>
ffffffffc0201d94:	000a9697          	auipc	a3,0xa9
ffffffffc0201d98:	97c6b683          	ld	a3,-1668(a3) # ffffffffc02aa710 <va_pa_offset>
ffffffffc0201d9c:	8c15                	sub	s0,s0,a3
    if (PPN(pa) >= npage)
ffffffffc0201d9e:	8031                	srli	s0,s0,0xc
ffffffffc0201da0:	000a9797          	auipc	a5,0xa9
ffffffffc0201da4:	9587b783          	ld	a5,-1704(a5) # ffffffffc02aa6f8 <npage>
ffffffffc0201da8:	06f47163          	bgeu	s0,a5,ffffffffc0201e0a <kfree+0xc4>
    return &pages[PPN(pa) - nbase];
ffffffffc0201dac:	00006517          	auipc	a0,0x6
ffffffffc0201db0:	f5c53503          	ld	a0,-164(a0) # ffffffffc0207d08 <nbase>
ffffffffc0201db4:	8c09                	sub	s0,s0,a0
ffffffffc0201db6:	041a                	slli	s0,s0,0x6
	free_pages(kva2page(kva), 1 << order);
ffffffffc0201db8:	000a9517          	auipc	a0,0xa9
ffffffffc0201dbc:	94853503          	ld	a0,-1720(a0) # ffffffffc02aa700 <pages>
ffffffffc0201dc0:	4585                	li	a1,1
ffffffffc0201dc2:	9522                	add	a0,a0,s0
ffffffffc0201dc4:	00e595bb          	sllw	a1,a1,a4
ffffffffc0201dc8:	0ea000ef          	jal	ra,ffffffffc0201eb2 <free_pages>
		spin_unlock_irqrestore(&block_lock, flags);
	}

	slob_free((slob_t *)block - 1, 0);
	return;
}
ffffffffc0201dcc:	6442                	ld	s0,16(sp)
ffffffffc0201dce:	60e2                	ld	ra,24(sp)
				slob_free(bb, sizeof(bigblock_t));
ffffffffc0201dd0:	8526                	mv	a0,s1
}
ffffffffc0201dd2:	64a2                	ld	s1,8(sp)
				slob_free(bb, sizeof(bigblock_t));
ffffffffc0201dd4:	45e1                	li	a1,24
}
ffffffffc0201dd6:	6105                	addi	sp,sp,32
	slob_free((slob_t *)block - 1, 0);
ffffffffc0201dd8:	b171                	j	ffffffffc0201a64 <slob_free>
ffffffffc0201dda:	e20d                	bnez	a2,ffffffffc0201dfc <kfree+0xb6>
ffffffffc0201ddc:	ff040513          	addi	a0,s0,-16
}
ffffffffc0201de0:	6442                	ld	s0,16(sp)
ffffffffc0201de2:	60e2                	ld	ra,24(sp)
ffffffffc0201de4:	64a2                	ld	s1,8(sp)
	slob_free((slob_t *)block - 1, 0);
ffffffffc0201de6:	4581                	li	a1,0
}
ffffffffc0201de8:	6105                	addi	sp,sp,32
	slob_free((slob_t *)block - 1, 0);
ffffffffc0201dea:	b9ad                	j	ffffffffc0201a64 <slob_free>
        intr_disable();
ffffffffc0201dec:	bc9fe0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
		for (bb = bigblocks; bb; last = &bb->next, bb = bb->next)
ffffffffc0201df0:	000a9797          	auipc	a5,0xa9
ffffffffc0201df4:	8f07b783          	ld	a5,-1808(a5) # ffffffffc02aa6e0 <bigblocks>
        return 1;
ffffffffc0201df8:	4605                	li	a2,1
ffffffffc0201dfa:	fbad                	bnez	a5,ffffffffc0201d6c <kfree+0x26>
        intr_enable();
ffffffffc0201dfc:	bb3fe0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0201e00:	bff1                	j	ffffffffc0201ddc <kfree+0x96>
ffffffffc0201e02:	badfe0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0201e06:	b751                	j	ffffffffc0201d8a <kfree+0x44>
ffffffffc0201e08:	8082                	ret
        panic("pa2page called with invalid pa");
ffffffffc0201e0a:	00005617          	auipc	a2,0x5
ffffffffc0201e0e:	9c660613          	addi	a2,a2,-1594 # ffffffffc02067d0 <default_pmm_manager+0x108>
ffffffffc0201e12:	06900593          	li	a1,105
ffffffffc0201e16:	00005517          	auipc	a0,0x5
ffffffffc0201e1a:	91250513          	addi	a0,a0,-1774 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc0201e1e:	e70fe0ef          	jal	ra,ffffffffc020048e <__panic>
    return pa2page(PADDR(kva));
ffffffffc0201e22:	86a2                	mv	a3,s0
ffffffffc0201e24:	00005617          	auipc	a2,0x5
ffffffffc0201e28:	98460613          	addi	a2,a2,-1660 # ffffffffc02067a8 <default_pmm_manager+0xe0>
ffffffffc0201e2c:	07700593          	li	a1,119
ffffffffc0201e30:	00005517          	auipc	a0,0x5
ffffffffc0201e34:	8f850513          	addi	a0,a0,-1800 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc0201e38:	e56fe0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0201e3c <pa2page.part.0>:
pa2page(uintptr_t pa)
ffffffffc0201e3c:	1141                	addi	sp,sp,-16
        panic("pa2page called with invalid pa");
ffffffffc0201e3e:	00005617          	auipc	a2,0x5
ffffffffc0201e42:	99260613          	addi	a2,a2,-1646 # ffffffffc02067d0 <default_pmm_manager+0x108>
ffffffffc0201e46:	06900593          	li	a1,105
ffffffffc0201e4a:	00005517          	auipc	a0,0x5
ffffffffc0201e4e:	8de50513          	addi	a0,a0,-1826 # ffffffffc0206728 <default_pmm_manager+0x60>
pa2page(uintptr_t pa)
ffffffffc0201e52:	e406                	sd	ra,8(sp)
        panic("pa2page called with invalid pa");
ffffffffc0201e54:	e3afe0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0201e58 <pte2page.part.0>:
pte2page(pte_t pte)
ffffffffc0201e58:	1141                	addi	sp,sp,-16
        panic("pte2page called with invalid pte");
ffffffffc0201e5a:	00005617          	auipc	a2,0x5
ffffffffc0201e5e:	99660613          	addi	a2,a2,-1642 # ffffffffc02067f0 <default_pmm_manager+0x128>
ffffffffc0201e62:	07f00593          	li	a1,127
ffffffffc0201e66:	00005517          	auipc	a0,0x5
ffffffffc0201e6a:	8c250513          	addi	a0,a0,-1854 # ffffffffc0206728 <default_pmm_manager+0x60>
pte2page(pte_t pte)
ffffffffc0201e6e:	e406                	sd	ra,8(sp)
        panic("pte2page called with invalid pte");
ffffffffc0201e70:	e1efe0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0201e74 <alloc_pages>:
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201e74:	100027f3          	csrr	a5,sstatus
ffffffffc0201e78:	8b89                	andi	a5,a5,2
ffffffffc0201e7a:	e799                	bnez	a5,ffffffffc0201e88 <alloc_pages+0x14>
{
    struct Page *page = NULL;
    bool intr_flag;
    local_intr_save(intr_flag);
    {
        page = pmm_manager->alloc_pages(n);
ffffffffc0201e7c:	000a9797          	auipc	a5,0xa9
ffffffffc0201e80:	88c7b783          	ld	a5,-1908(a5) # ffffffffc02aa708 <pmm_manager>
ffffffffc0201e84:	6f9c                	ld	a5,24(a5)
ffffffffc0201e86:	8782                	jr	a5
{
ffffffffc0201e88:	1141                	addi	sp,sp,-16
ffffffffc0201e8a:	e406                	sd	ra,8(sp)
ffffffffc0201e8c:	e022                	sd	s0,0(sp)
ffffffffc0201e8e:	842a                	mv	s0,a0
        intr_disable();
ffffffffc0201e90:	b25fe0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        page = pmm_manager->alloc_pages(n);
ffffffffc0201e94:	000a9797          	auipc	a5,0xa9
ffffffffc0201e98:	8747b783          	ld	a5,-1932(a5) # ffffffffc02aa708 <pmm_manager>
ffffffffc0201e9c:	6f9c                	ld	a5,24(a5)
ffffffffc0201e9e:	8522                	mv	a0,s0
ffffffffc0201ea0:	9782                	jalr	a5
ffffffffc0201ea2:	842a                	mv	s0,a0
        intr_enable();
ffffffffc0201ea4:	b0bfe0ef          	jal	ra,ffffffffc02009ae <intr_enable>
    }
    local_intr_restore(intr_flag);
    return page;
}
ffffffffc0201ea8:	60a2                	ld	ra,8(sp)
ffffffffc0201eaa:	8522                	mv	a0,s0
ffffffffc0201eac:	6402                	ld	s0,0(sp)
ffffffffc0201eae:	0141                	addi	sp,sp,16
ffffffffc0201eb0:	8082                	ret

ffffffffc0201eb2 <free_pages>:
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201eb2:	100027f3          	csrr	a5,sstatus
ffffffffc0201eb6:	8b89                	andi	a5,a5,2
ffffffffc0201eb8:	e799                	bnez	a5,ffffffffc0201ec6 <free_pages+0x14>
void free_pages(struct Page *base, size_t n)
{
    bool intr_flag;
    local_intr_save(intr_flag);
    {
        pmm_manager->free_pages(base, n);
ffffffffc0201eba:	000a9797          	auipc	a5,0xa9
ffffffffc0201ebe:	84e7b783          	ld	a5,-1970(a5) # ffffffffc02aa708 <pmm_manager>
ffffffffc0201ec2:	739c                	ld	a5,32(a5)
ffffffffc0201ec4:	8782                	jr	a5
{
ffffffffc0201ec6:	1101                	addi	sp,sp,-32
ffffffffc0201ec8:	ec06                	sd	ra,24(sp)
ffffffffc0201eca:	e822                	sd	s0,16(sp)
ffffffffc0201ecc:	e426                	sd	s1,8(sp)
ffffffffc0201ece:	842a                	mv	s0,a0
ffffffffc0201ed0:	84ae                	mv	s1,a1
        intr_disable();
ffffffffc0201ed2:	ae3fe0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        pmm_manager->free_pages(base, n);
ffffffffc0201ed6:	000a9797          	auipc	a5,0xa9
ffffffffc0201eda:	8327b783          	ld	a5,-1998(a5) # ffffffffc02aa708 <pmm_manager>
ffffffffc0201ede:	739c                	ld	a5,32(a5)
ffffffffc0201ee0:	85a6                	mv	a1,s1
ffffffffc0201ee2:	8522                	mv	a0,s0
ffffffffc0201ee4:	9782                	jalr	a5
    }
    local_intr_restore(intr_flag);
}
ffffffffc0201ee6:	6442                	ld	s0,16(sp)
ffffffffc0201ee8:	60e2                	ld	ra,24(sp)
ffffffffc0201eea:	64a2                	ld	s1,8(sp)
ffffffffc0201eec:	6105                	addi	sp,sp,32
        intr_enable();
ffffffffc0201eee:	ac1fe06f          	j	ffffffffc02009ae <intr_enable>

ffffffffc0201ef2 <nr_free_pages>:
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201ef2:	100027f3          	csrr	a5,sstatus
ffffffffc0201ef6:	8b89                	andi	a5,a5,2
ffffffffc0201ef8:	e799                	bnez	a5,ffffffffc0201f06 <nr_free_pages+0x14>
{
    size_t ret;
    bool intr_flag;
    local_intr_save(intr_flag);
    {
        ret = pmm_manager->nr_free_pages();
ffffffffc0201efa:	000a9797          	auipc	a5,0xa9
ffffffffc0201efe:	80e7b783          	ld	a5,-2034(a5) # ffffffffc02aa708 <pmm_manager>
ffffffffc0201f02:	779c                	ld	a5,40(a5)
ffffffffc0201f04:	8782                	jr	a5
{
ffffffffc0201f06:	1141                	addi	sp,sp,-16
ffffffffc0201f08:	e406                	sd	ra,8(sp)
ffffffffc0201f0a:	e022                	sd	s0,0(sp)
        intr_disable();
ffffffffc0201f0c:	aa9fe0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        ret = pmm_manager->nr_free_pages();
ffffffffc0201f10:	000a8797          	auipc	a5,0xa8
ffffffffc0201f14:	7f87b783          	ld	a5,2040(a5) # ffffffffc02aa708 <pmm_manager>
ffffffffc0201f18:	779c                	ld	a5,40(a5)
ffffffffc0201f1a:	9782                	jalr	a5
ffffffffc0201f1c:	842a                	mv	s0,a0
        intr_enable();
ffffffffc0201f1e:	a91fe0ef          	jal	ra,ffffffffc02009ae <intr_enable>
    }
    local_intr_restore(intr_flag);
    return ret;
}
ffffffffc0201f22:	60a2                	ld	ra,8(sp)
ffffffffc0201f24:	8522                	mv	a0,s0
ffffffffc0201f26:	6402                	ld	s0,0(sp)
ffffffffc0201f28:	0141                	addi	sp,sp,16
ffffffffc0201f2a:	8082                	ret

ffffffffc0201f2c <get_pte>:
//  la:     the linear address need to map
//  create: a logical value to decide if alloc a page for PT
// return vaule: the kernel virtual address of this pte
pte_t *get_pte(pde_t *pgdir, uintptr_t la, bool create)
{
    pde_t *pdep1 = &pgdir[PDX1(la)];
ffffffffc0201f2c:	01e5d793          	srli	a5,a1,0x1e
ffffffffc0201f30:	1ff7f793          	andi	a5,a5,511
{
ffffffffc0201f34:	7139                	addi	sp,sp,-64
    pde_t *pdep1 = &pgdir[PDX1(la)];
ffffffffc0201f36:	078e                	slli	a5,a5,0x3
{
ffffffffc0201f38:	f426                	sd	s1,40(sp)
    pde_t *pdep1 = &pgdir[PDX1(la)];
ffffffffc0201f3a:	00f504b3          	add	s1,a0,a5
    if (!(*pdep1 & PTE_V))
ffffffffc0201f3e:	6094                	ld	a3,0(s1)
{
ffffffffc0201f40:	f04a                	sd	s2,32(sp)
ffffffffc0201f42:	ec4e                	sd	s3,24(sp)
ffffffffc0201f44:	e852                	sd	s4,16(sp)
ffffffffc0201f46:	fc06                	sd	ra,56(sp)
ffffffffc0201f48:	f822                	sd	s0,48(sp)
ffffffffc0201f4a:	e456                	sd	s5,8(sp)
ffffffffc0201f4c:	e05a                	sd	s6,0(sp)
    if (!(*pdep1 & PTE_V))
ffffffffc0201f4e:	0016f793          	andi	a5,a3,1
{
ffffffffc0201f52:	892e                	mv	s2,a1
ffffffffc0201f54:	8a32                	mv	s4,a2
ffffffffc0201f56:	000a8997          	auipc	s3,0xa8
ffffffffc0201f5a:	7a298993          	addi	s3,s3,1954 # ffffffffc02aa6f8 <npage>
    if (!(*pdep1 & PTE_V))
ffffffffc0201f5e:	efbd                	bnez	a5,ffffffffc0201fdc <get_pte+0xb0>
    {
        struct Page *page;
        if (!create || (page = alloc_page()) == NULL)
ffffffffc0201f60:	14060c63          	beqz	a2,ffffffffc02020b8 <get_pte+0x18c>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201f64:	100027f3          	csrr	a5,sstatus
ffffffffc0201f68:	8b89                	andi	a5,a5,2
ffffffffc0201f6a:	14079963          	bnez	a5,ffffffffc02020bc <get_pte+0x190>
        page = pmm_manager->alloc_pages(n);
ffffffffc0201f6e:	000a8797          	auipc	a5,0xa8
ffffffffc0201f72:	79a7b783          	ld	a5,1946(a5) # ffffffffc02aa708 <pmm_manager>
ffffffffc0201f76:	6f9c                	ld	a5,24(a5)
ffffffffc0201f78:	4505                	li	a0,1
ffffffffc0201f7a:	9782                	jalr	a5
ffffffffc0201f7c:	842a                	mv	s0,a0
        if (!create || (page = alloc_page()) == NULL)
ffffffffc0201f7e:	12040d63          	beqz	s0,ffffffffc02020b8 <get_pte+0x18c>
    return page - pages + nbase;
ffffffffc0201f82:	000a8b17          	auipc	s6,0xa8
ffffffffc0201f86:	77eb0b13          	addi	s6,s6,1918 # ffffffffc02aa700 <pages>
ffffffffc0201f8a:	000b3503          	ld	a0,0(s6)
ffffffffc0201f8e:	00080ab7          	lui	s5,0x80
        {
            return NULL;
        }
        set_page_ref(page, 1);
        uintptr_t pa = page2pa(page);
        memset(KADDR(pa), 0, PGSIZE);
ffffffffc0201f92:	000a8997          	auipc	s3,0xa8
ffffffffc0201f96:	76698993          	addi	s3,s3,1894 # ffffffffc02aa6f8 <npage>
ffffffffc0201f9a:	40a40533          	sub	a0,s0,a0
ffffffffc0201f9e:	8519                	srai	a0,a0,0x6
ffffffffc0201fa0:	9556                	add	a0,a0,s5
ffffffffc0201fa2:	0009b703          	ld	a4,0(s3)
ffffffffc0201fa6:	00c51793          	slli	a5,a0,0xc
    page->ref = val;
ffffffffc0201faa:	4685                	li	a3,1
ffffffffc0201fac:	c014                	sw	a3,0(s0)
ffffffffc0201fae:	83b1                	srli	a5,a5,0xc
    return page2ppn(page) << PGSHIFT;
ffffffffc0201fb0:	0532                	slli	a0,a0,0xc
ffffffffc0201fb2:	16e7f763          	bgeu	a5,a4,ffffffffc0202120 <get_pte+0x1f4>
ffffffffc0201fb6:	000a8797          	auipc	a5,0xa8
ffffffffc0201fba:	75a7b783          	ld	a5,1882(a5) # ffffffffc02aa710 <va_pa_offset>
ffffffffc0201fbe:	6605                	lui	a2,0x1
ffffffffc0201fc0:	4581                	li	a1,0
ffffffffc0201fc2:	953e                	add	a0,a0,a5
ffffffffc0201fc4:	0a7030ef          	jal	ra,ffffffffc020586a <memset>
    return page - pages + nbase;
ffffffffc0201fc8:	000b3683          	ld	a3,0(s6)
ffffffffc0201fcc:	40d406b3          	sub	a3,s0,a3
ffffffffc0201fd0:	8699                	srai	a3,a3,0x6
ffffffffc0201fd2:	96d6                	add	a3,a3,s5
}

// construct PTE from a page and permission bits
static inline pte_t pte_create(uintptr_t ppn, int type)
{
    return (ppn << PTE_PPN_SHIFT) | PTE_V | type;
ffffffffc0201fd4:	06aa                	slli	a3,a3,0xa
ffffffffc0201fd6:	0116e693          	ori	a3,a3,17
        *pdep1 = pte_create(page2ppn(page), PTE_U | PTE_V);
ffffffffc0201fda:	e094                	sd	a3,0(s1)
    }

    pde_t *pdep0 = &((pde_t *)KADDR(PDE_ADDR(*pdep1)))[PDX0(la)];
ffffffffc0201fdc:	77fd                	lui	a5,0xfffff
ffffffffc0201fde:	068a                	slli	a3,a3,0x2
ffffffffc0201fe0:	0009b703          	ld	a4,0(s3)
ffffffffc0201fe4:	8efd                	and	a3,a3,a5
ffffffffc0201fe6:	00c6d793          	srli	a5,a3,0xc
ffffffffc0201fea:	10e7ff63          	bgeu	a5,a4,ffffffffc0202108 <get_pte+0x1dc>
ffffffffc0201fee:	000a8a97          	auipc	s5,0xa8
ffffffffc0201ff2:	722a8a93          	addi	s5,s5,1826 # ffffffffc02aa710 <va_pa_offset>
ffffffffc0201ff6:	000ab403          	ld	s0,0(s5)
ffffffffc0201ffa:	01595793          	srli	a5,s2,0x15
ffffffffc0201ffe:	1ff7f793          	andi	a5,a5,511
ffffffffc0202002:	96a2                	add	a3,a3,s0
ffffffffc0202004:	00379413          	slli	s0,a5,0x3
ffffffffc0202008:	9436                	add	s0,s0,a3
    if (!(*pdep0 & PTE_V))
ffffffffc020200a:	6014                	ld	a3,0(s0)
ffffffffc020200c:	0016f793          	andi	a5,a3,1
ffffffffc0202010:	ebad                	bnez	a5,ffffffffc0202082 <get_pte+0x156>
    {
        struct Page *page;
        if (!create || (page = alloc_page()) == NULL)
ffffffffc0202012:	0a0a0363          	beqz	s4,ffffffffc02020b8 <get_pte+0x18c>
ffffffffc0202016:	100027f3          	csrr	a5,sstatus
ffffffffc020201a:	8b89                	andi	a5,a5,2
ffffffffc020201c:	efcd                	bnez	a5,ffffffffc02020d6 <get_pte+0x1aa>
        page = pmm_manager->alloc_pages(n);
ffffffffc020201e:	000a8797          	auipc	a5,0xa8
ffffffffc0202022:	6ea7b783          	ld	a5,1770(a5) # ffffffffc02aa708 <pmm_manager>
ffffffffc0202026:	6f9c                	ld	a5,24(a5)
ffffffffc0202028:	4505                	li	a0,1
ffffffffc020202a:	9782                	jalr	a5
ffffffffc020202c:	84aa                	mv	s1,a0
        if (!create || (page = alloc_page()) == NULL)
ffffffffc020202e:	c4c9                	beqz	s1,ffffffffc02020b8 <get_pte+0x18c>
    return page - pages + nbase;
ffffffffc0202030:	000a8b17          	auipc	s6,0xa8
ffffffffc0202034:	6d0b0b13          	addi	s6,s6,1744 # ffffffffc02aa700 <pages>
ffffffffc0202038:	000b3503          	ld	a0,0(s6)
ffffffffc020203c:	00080a37          	lui	s4,0x80
        {
            return NULL;
        }
        set_page_ref(page, 1);
        uintptr_t pa = page2pa(page);
        memset(KADDR(pa), 0, PGSIZE);
ffffffffc0202040:	0009b703          	ld	a4,0(s3)
ffffffffc0202044:	40a48533          	sub	a0,s1,a0
ffffffffc0202048:	8519                	srai	a0,a0,0x6
ffffffffc020204a:	9552                	add	a0,a0,s4
ffffffffc020204c:	00c51793          	slli	a5,a0,0xc
    page->ref = val;
ffffffffc0202050:	4685                	li	a3,1
ffffffffc0202052:	c094                	sw	a3,0(s1)
ffffffffc0202054:	83b1                	srli	a5,a5,0xc
    return page2ppn(page) << PGSHIFT;
ffffffffc0202056:	0532                	slli	a0,a0,0xc
ffffffffc0202058:	0ee7f163          	bgeu	a5,a4,ffffffffc020213a <get_pte+0x20e>
ffffffffc020205c:	000ab783          	ld	a5,0(s5)
ffffffffc0202060:	6605                	lui	a2,0x1
ffffffffc0202062:	4581                	li	a1,0
ffffffffc0202064:	953e                	add	a0,a0,a5
ffffffffc0202066:	005030ef          	jal	ra,ffffffffc020586a <memset>
    return page - pages + nbase;
ffffffffc020206a:	000b3683          	ld	a3,0(s6)
ffffffffc020206e:	40d486b3          	sub	a3,s1,a3
ffffffffc0202072:	8699                	srai	a3,a3,0x6
ffffffffc0202074:	96d2                	add	a3,a3,s4
    return (ppn << PTE_PPN_SHIFT) | PTE_V | type;
ffffffffc0202076:	06aa                	slli	a3,a3,0xa
ffffffffc0202078:	0116e693          	ori	a3,a3,17
        *pdep0 = pte_create(page2ppn(page), PTE_U | PTE_V);
ffffffffc020207c:	e014                	sd	a3,0(s0)
    }
    return &((pte_t *)KADDR(PDE_ADDR(*pdep0)))[PTX(la)];
ffffffffc020207e:	0009b703          	ld	a4,0(s3)
ffffffffc0202082:	068a                	slli	a3,a3,0x2
ffffffffc0202084:	757d                	lui	a0,0xfffff
ffffffffc0202086:	8ee9                	and	a3,a3,a0
ffffffffc0202088:	00c6d793          	srli	a5,a3,0xc
ffffffffc020208c:	06e7f263          	bgeu	a5,a4,ffffffffc02020f0 <get_pte+0x1c4>
ffffffffc0202090:	000ab503          	ld	a0,0(s5)
ffffffffc0202094:	00c95913          	srli	s2,s2,0xc
ffffffffc0202098:	1ff97913          	andi	s2,s2,511
ffffffffc020209c:	96aa                	add	a3,a3,a0
ffffffffc020209e:	00391513          	slli	a0,s2,0x3
ffffffffc02020a2:	9536                	add	a0,a0,a3
}
ffffffffc02020a4:	70e2                	ld	ra,56(sp)
ffffffffc02020a6:	7442                	ld	s0,48(sp)
ffffffffc02020a8:	74a2                	ld	s1,40(sp)
ffffffffc02020aa:	7902                	ld	s2,32(sp)
ffffffffc02020ac:	69e2                	ld	s3,24(sp)
ffffffffc02020ae:	6a42                	ld	s4,16(sp)
ffffffffc02020b0:	6aa2                	ld	s5,8(sp)
ffffffffc02020b2:	6b02                	ld	s6,0(sp)
ffffffffc02020b4:	6121                	addi	sp,sp,64
ffffffffc02020b6:	8082                	ret
            return NULL;
ffffffffc02020b8:	4501                	li	a0,0
ffffffffc02020ba:	b7ed                	j	ffffffffc02020a4 <get_pte+0x178>
        intr_disable();
ffffffffc02020bc:	8f9fe0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        page = pmm_manager->alloc_pages(n);
ffffffffc02020c0:	000a8797          	auipc	a5,0xa8
ffffffffc02020c4:	6487b783          	ld	a5,1608(a5) # ffffffffc02aa708 <pmm_manager>
ffffffffc02020c8:	6f9c                	ld	a5,24(a5)
ffffffffc02020ca:	4505                	li	a0,1
ffffffffc02020cc:	9782                	jalr	a5
ffffffffc02020ce:	842a                	mv	s0,a0
        intr_enable();
ffffffffc02020d0:	8dffe0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc02020d4:	b56d                	j	ffffffffc0201f7e <get_pte+0x52>
        intr_disable();
ffffffffc02020d6:	8dffe0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
ffffffffc02020da:	000a8797          	auipc	a5,0xa8
ffffffffc02020de:	62e7b783          	ld	a5,1582(a5) # ffffffffc02aa708 <pmm_manager>
ffffffffc02020e2:	6f9c                	ld	a5,24(a5)
ffffffffc02020e4:	4505                	li	a0,1
ffffffffc02020e6:	9782                	jalr	a5
ffffffffc02020e8:	84aa                	mv	s1,a0
        intr_enable();
ffffffffc02020ea:	8c5fe0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc02020ee:	b781                	j	ffffffffc020202e <get_pte+0x102>
    return &((pte_t *)KADDR(PDE_ADDR(*pdep0)))[PTX(la)];
ffffffffc02020f0:	00004617          	auipc	a2,0x4
ffffffffc02020f4:	61060613          	addi	a2,a2,1552 # ffffffffc0206700 <default_pmm_manager+0x38>
ffffffffc02020f8:	0fa00593          	li	a1,250
ffffffffc02020fc:	00004517          	auipc	a0,0x4
ffffffffc0202100:	71c50513          	addi	a0,a0,1820 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202104:	b8afe0ef          	jal	ra,ffffffffc020048e <__panic>
    pde_t *pdep0 = &((pde_t *)KADDR(PDE_ADDR(*pdep1)))[PDX0(la)];
ffffffffc0202108:	00004617          	auipc	a2,0x4
ffffffffc020210c:	5f860613          	addi	a2,a2,1528 # ffffffffc0206700 <default_pmm_manager+0x38>
ffffffffc0202110:	0ed00593          	li	a1,237
ffffffffc0202114:	00004517          	auipc	a0,0x4
ffffffffc0202118:	70450513          	addi	a0,a0,1796 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc020211c:	b72fe0ef          	jal	ra,ffffffffc020048e <__panic>
        memset(KADDR(pa), 0, PGSIZE);
ffffffffc0202120:	86aa                	mv	a3,a0
ffffffffc0202122:	00004617          	auipc	a2,0x4
ffffffffc0202126:	5de60613          	addi	a2,a2,1502 # ffffffffc0206700 <default_pmm_manager+0x38>
ffffffffc020212a:	0e900593          	li	a1,233
ffffffffc020212e:	00004517          	auipc	a0,0x4
ffffffffc0202132:	6ea50513          	addi	a0,a0,1770 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202136:	b58fe0ef          	jal	ra,ffffffffc020048e <__panic>
        memset(KADDR(pa), 0, PGSIZE);
ffffffffc020213a:	86aa                	mv	a3,a0
ffffffffc020213c:	00004617          	auipc	a2,0x4
ffffffffc0202140:	5c460613          	addi	a2,a2,1476 # ffffffffc0206700 <default_pmm_manager+0x38>
ffffffffc0202144:	0f700593          	li	a1,247
ffffffffc0202148:	00004517          	auipc	a0,0x4
ffffffffc020214c:	6d050513          	addi	a0,a0,1744 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202150:	b3efe0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0202154 <get_page>:

// get_page - get related Page struct for linear address la using PDT pgdir
struct Page *get_page(pde_t *pgdir, uintptr_t la, pte_t **ptep_store)
{
ffffffffc0202154:	1141                	addi	sp,sp,-16
ffffffffc0202156:	e022                	sd	s0,0(sp)
ffffffffc0202158:	8432                	mv	s0,a2
    pte_t *ptep = get_pte(pgdir, la, 0);
ffffffffc020215a:	4601                	li	a2,0
{
ffffffffc020215c:	e406                	sd	ra,8(sp)
    pte_t *ptep = get_pte(pgdir, la, 0);
ffffffffc020215e:	dcfff0ef          	jal	ra,ffffffffc0201f2c <get_pte>
    if (ptep_store != NULL)
ffffffffc0202162:	c011                	beqz	s0,ffffffffc0202166 <get_page+0x12>
    {
        *ptep_store = ptep;
ffffffffc0202164:	e008                	sd	a0,0(s0)
    }
    if (ptep != NULL && *ptep & PTE_V)
ffffffffc0202166:	c511                	beqz	a0,ffffffffc0202172 <get_page+0x1e>
ffffffffc0202168:	611c                	ld	a5,0(a0)
    {
        return pte2page(*ptep);
    }
    return NULL;
ffffffffc020216a:	4501                	li	a0,0
    if (ptep != NULL && *ptep & PTE_V)
ffffffffc020216c:	0017f713          	andi	a4,a5,1
ffffffffc0202170:	e709                	bnez	a4,ffffffffc020217a <get_page+0x26>
}
ffffffffc0202172:	60a2                	ld	ra,8(sp)
ffffffffc0202174:	6402                	ld	s0,0(sp)
ffffffffc0202176:	0141                	addi	sp,sp,16
ffffffffc0202178:	8082                	ret
    return pa2page(PTE_ADDR(pte));
ffffffffc020217a:	078a                	slli	a5,a5,0x2
ffffffffc020217c:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc020217e:	000a8717          	auipc	a4,0xa8
ffffffffc0202182:	57a73703          	ld	a4,1402(a4) # ffffffffc02aa6f8 <npage>
ffffffffc0202186:	00e7ff63          	bgeu	a5,a4,ffffffffc02021a4 <get_page+0x50>
ffffffffc020218a:	60a2                	ld	ra,8(sp)
ffffffffc020218c:	6402                	ld	s0,0(sp)
    return &pages[PPN(pa) - nbase];
ffffffffc020218e:	fff80537          	lui	a0,0xfff80
ffffffffc0202192:	97aa                	add	a5,a5,a0
ffffffffc0202194:	079a                	slli	a5,a5,0x6
ffffffffc0202196:	000a8517          	auipc	a0,0xa8
ffffffffc020219a:	56a53503          	ld	a0,1386(a0) # ffffffffc02aa700 <pages>
ffffffffc020219e:	953e                	add	a0,a0,a5
ffffffffc02021a0:	0141                	addi	sp,sp,16
ffffffffc02021a2:	8082                	ret
ffffffffc02021a4:	c99ff0ef          	jal	ra,ffffffffc0201e3c <pa2page.part.0>

ffffffffc02021a8 <unmap_range>:
        tlb_invalidate(pgdir, la);
    }
}

void unmap_range(pde_t *pgdir, uintptr_t start, uintptr_t end)
{
ffffffffc02021a8:	7159                	addi	sp,sp,-112
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc02021aa:	00c5e7b3          	or	a5,a1,a2
{
ffffffffc02021ae:	f486                	sd	ra,104(sp)
ffffffffc02021b0:	f0a2                	sd	s0,96(sp)
ffffffffc02021b2:	eca6                	sd	s1,88(sp)
ffffffffc02021b4:	e8ca                	sd	s2,80(sp)
ffffffffc02021b6:	e4ce                	sd	s3,72(sp)
ffffffffc02021b8:	e0d2                	sd	s4,64(sp)
ffffffffc02021ba:	fc56                	sd	s5,56(sp)
ffffffffc02021bc:	f85a                	sd	s6,48(sp)
ffffffffc02021be:	f45e                	sd	s7,40(sp)
ffffffffc02021c0:	f062                	sd	s8,32(sp)
ffffffffc02021c2:	ec66                	sd	s9,24(sp)
ffffffffc02021c4:	e86a                	sd	s10,16(sp)
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc02021c6:	17d2                	slli	a5,a5,0x34
ffffffffc02021c8:	e3ed                	bnez	a5,ffffffffc02022aa <unmap_range+0x102>
    assert(USER_ACCESS(start, end));
ffffffffc02021ca:	002007b7          	lui	a5,0x200
ffffffffc02021ce:	842e                	mv	s0,a1
ffffffffc02021d0:	0ef5ed63          	bltu	a1,a5,ffffffffc02022ca <unmap_range+0x122>
ffffffffc02021d4:	8932                	mv	s2,a2
ffffffffc02021d6:	0ec5fa63          	bgeu	a1,a2,ffffffffc02022ca <unmap_range+0x122>
ffffffffc02021da:	4785                	li	a5,1
ffffffffc02021dc:	07fe                	slli	a5,a5,0x1f
ffffffffc02021de:	0ec7e663          	bltu	a5,a2,ffffffffc02022ca <unmap_range+0x122>
ffffffffc02021e2:	89aa                	mv	s3,a0
        }
        if (*ptep != 0)
        {
            page_remove_pte(pgdir, start, ptep);
        }
        start += PGSIZE;
ffffffffc02021e4:	6a05                	lui	s4,0x1
    if (PPN(pa) >= npage)
ffffffffc02021e6:	000a8c97          	auipc	s9,0xa8
ffffffffc02021ea:	512c8c93          	addi	s9,s9,1298 # ffffffffc02aa6f8 <npage>
    return &pages[PPN(pa) - nbase];
ffffffffc02021ee:	000a8c17          	auipc	s8,0xa8
ffffffffc02021f2:	512c0c13          	addi	s8,s8,1298 # ffffffffc02aa700 <pages>
ffffffffc02021f6:	fff80bb7          	lui	s7,0xfff80
        pmm_manager->free_pages(base, n);
ffffffffc02021fa:	000a8d17          	auipc	s10,0xa8
ffffffffc02021fe:	50ed0d13          	addi	s10,s10,1294 # ffffffffc02aa708 <pmm_manager>
            start = ROUNDDOWN(start + PTSIZE, PTSIZE);
ffffffffc0202202:	00200b37          	lui	s6,0x200
ffffffffc0202206:	ffe00ab7          	lui	s5,0xffe00
        pte_t *ptep = get_pte(pgdir, start, 0);
ffffffffc020220a:	4601                	li	a2,0
ffffffffc020220c:	85a2                	mv	a1,s0
ffffffffc020220e:	854e                	mv	a0,s3
ffffffffc0202210:	d1dff0ef          	jal	ra,ffffffffc0201f2c <get_pte>
ffffffffc0202214:	84aa                	mv	s1,a0
        if (ptep == NULL)
ffffffffc0202216:	cd29                	beqz	a0,ffffffffc0202270 <unmap_range+0xc8>
        if (*ptep != 0)
ffffffffc0202218:	611c                	ld	a5,0(a0)
ffffffffc020221a:	e395                	bnez	a5,ffffffffc020223e <unmap_range+0x96>
        start += PGSIZE;
ffffffffc020221c:	9452                	add	s0,s0,s4
    } while (start != 0 && start < end);
ffffffffc020221e:	ff2466e3          	bltu	s0,s2,ffffffffc020220a <unmap_range+0x62>
}
ffffffffc0202222:	70a6                	ld	ra,104(sp)
ffffffffc0202224:	7406                	ld	s0,96(sp)
ffffffffc0202226:	64e6                	ld	s1,88(sp)
ffffffffc0202228:	6946                	ld	s2,80(sp)
ffffffffc020222a:	69a6                	ld	s3,72(sp)
ffffffffc020222c:	6a06                	ld	s4,64(sp)
ffffffffc020222e:	7ae2                	ld	s5,56(sp)
ffffffffc0202230:	7b42                	ld	s6,48(sp)
ffffffffc0202232:	7ba2                	ld	s7,40(sp)
ffffffffc0202234:	7c02                	ld	s8,32(sp)
ffffffffc0202236:	6ce2                	ld	s9,24(sp)
ffffffffc0202238:	6d42                	ld	s10,16(sp)
ffffffffc020223a:	6165                	addi	sp,sp,112
ffffffffc020223c:	8082                	ret
    if (*ptep & PTE_V)
ffffffffc020223e:	0017f713          	andi	a4,a5,1
ffffffffc0202242:	df69                	beqz	a4,ffffffffc020221c <unmap_range+0x74>
    if (PPN(pa) >= npage)
ffffffffc0202244:	000cb703          	ld	a4,0(s9)
    return pa2page(PTE_ADDR(pte));
ffffffffc0202248:	078a                	slli	a5,a5,0x2
ffffffffc020224a:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc020224c:	08e7ff63          	bgeu	a5,a4,ffffffffc02022ea <unmap_range+0x142>
    return &pages[PPN(pa) - nbase];
ffffffffc0202250:	000c3503          	ld	a0,0(s8)
ffffffffc0202254:	97de                	add	a5,a5,s7
ffffffffc0202256:	079a                	slli	a5,a5,0x6
ffffffffc0202258:	953e                	add	a0,a0,a5
    page->ref -= 1;
ffffffffc020225a:	411c                	lw	a5,0(a0)
ffffffffc020225c:	fff7871b          	addiw	a4,a5,-1
ffffffffc0202260:	c118                	sw	a4,0(a0)
        if (page_ref(page) == 0)
ffffffffc0202262:	cf11                	beqz	a4,ffffffffc020227e <unmap_range+0xd6>
        *ptep = 0;
ffffffffc0202264:	0004b023          	sd	zero,0(s1)

// invalidate a TLB entry, but only if the page tables being
// edited are the ones currently in use by the processor.
void tlb_invalidate(pde_t *pgdir, uintptr_t la)
{
    asm volatile("sfence.vma %0" : : "r"(la));
ffffffffc0202268:	12040073          	sfence.vma	s0
        start += PGSIZE;
ffffffffc020226c:	9452                	add	s0,s0,s4
    } while (start != 0 && start < end);
ffffffffc020226e:	bf45                	j	ffffffffc020221e <unmap_range+0x76>
            start = ROUNDDOWN(start + PTSIZE, PTSIZE);
ffffffffc0202270:	945a                	add	s0,s0,s6
ffffffffc0202272:	01547433          	and	s0,s0,s5
    } while (start != 0 && start < end);
ffffffffc0202276:	d455                	beqz	s0,ffffffffc0202222 <unmap_range+0x7a>
ffffffffc0202278:	f92469e3          	bltu	s0,s2,ffffffffc020220a <unmap_range+0x62>
ffffffffc020227c:	b75d                	j	ffffffffc0202222 <unmap_range+0x7a>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc020227e:	100027f3          	csrr	a5,sstatus
ffffffffc0202282:	8b89                	andi	a5,a5,2
ffffffffc0202284:	e799                	bnez	a5,ffffffffc0202292 <unmap_range+0xea>
        pmm_manager->free_pages(base, n);
ffffffffc0202286:	000d3783          	ld	a5,0(s10)
ffffffffc020228a:	4585                	li	a1,1
ffffffffc020228c:	739c                	ld	a5,32(a5)
ffffffffc020228e:	9782                	jalr	a5
    if (flag)
ffffffffc0202290:	bfd1                	j	ffffffffc0202264 <unmap_range+0xbc>
ffffffffc0202292:	e42a                	sd	a0,8(sp)
        intr_disable();
ffffffffc0202294:	f20fe0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
ffffffffc0202298:	000d3783          	ld	a5,0(s10)
ffffffffc020229c:	6522                	ld	a0,8(sp)
ffffffffc020229e:	4585                	li	a1,1
ffffffffc02022a0:	739c                	ld	a5,32(a5)
ffffffffc02022a2:	9782                	jalr	a5
        intr_enable();
ffffffffc02022a4:	f0afe0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc02022a8:	bf75                	j	ffffffffc0202264 <unmap_range+0xbc>
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc02022aa:	00004697          	auipc	a3,0x4
ffffffffc02022ae:	57e68693          	addi	a3,a3,1406 # ffffffffc0206828 <default_pmm_manager+0x160>
ffffffffc02022b2:	00004617          	auipc	a2,0x4
ffffffffc02022b6:	06660613          	addi	a2,a2,102 # ffffffffc0206318 <commands+0x818>
ffffffffc02022ba:	12000593          	li	a1,288
ffffffffc02022be:	00004517          	auipc	a0,0x4
ffffffffc02022c2:	55a50513          	addi	a0,a0,1370 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc02022c6:	9c8fe0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(USER_ACCESS(start, end));
ffffffffc02022ca:	00004697          	auipc	a3,0x4
ffffffffc02022ce:	58e68693          	addi	a3,a3,1422 # ffffffffc0206858 <default_pmm_manager+0x190>
ffffffffc02022d2:	00004617          	auipc	a2,0x4
ffffffffc02022d6:	04660613          	addi	a2,a2,70 # ffffffffc0206318 <commands+0x818>
ffffffffc02022da:	12100593          	li	a1,289
ffffffffc02022de:	00004517          	auipc	a0,0x4
ffffffffc02022e2:	53a50513          	addi	a0,a0,1338 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc02022e6:	9a8fe0ef          	jal	ra,ffffffffc020048e <__panic>
ffffffffc02022ea:	b53ff0ef          	jal	ra,ffffffffc0201e3c <pa2page.part.0>

ffffffffc02022ee <exit_range>:
{
ffffffffc02022ee:	7119                	addi	sp,sp,-128
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc02022f0:	00c5e7b3          	or	a5,a1,a2
{
ffffffffc02022f4:	fc86                	sd	ra,120(sp)
ffffffffc02022f6:	f8a2                	sd	s0,112(sp)
ffffffffc02022f8:	f4a6                	sd	s1,104(sp)
ffffffffc02022fa:	f0ca                	sd	s2,96(sp)
ffffffffc02022fc:	ecce                	sd	s3,88(sp)
ffffffffc02022fe:	e8d2                	sd	s4,80(sp)
ffffffffc0202300:	e4d6                	sd	s5,72(sp)
ffffffffc0202302:	e0da                	sd	s6,64(sp)
ffffffffc0202304:	fc5e                	sd	s7,56(sp)
ffffffffc0202306:	f862                	sd	s8,48(sp)
ffffffffc0202308:	f466                	sd	s9,40(sp)
ffffffffc020230a:	f06a                	sd	s10,32(sp)
ffffffffc020230c:	ec6e                	sd	s11,24(sp)
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc020230e:	17d2                	slli	a5,a5,0x34
ffffffffc0202310:	20079a63          	bnez	a5,ffffffffc0202524 <exit_range+0x236>
    assert(USER_ACCESS(start, end));
ffffffffc0202314:	002007b7          	lui	a5,0x200
ffffffffc0202318:	24f5e463          	bltu	a1,a5,ffffffffc0202560 <exit_range+0x272>
ffffffffc020231c:	8ab2                	mv	s5,a2
ffffffffc020231e:	24c5f163          	bgeu	a1,a2,ffffffffc0202560 <exit_range+0x272>
ffffffffc0202322:	4785                	li	a5,1
ffffffffc0202324:	07fe                	slli	a5,a5,0x1f
ffffffffc0202326:	22c7ed63          	bltu	a5,a2,ffffffffc0202560 <exit_range+0x272>
    d1start = ROUNDDOWN(start, PDSIZE);
ffffffffc020232a:	c00009b7          	lui	s3,0xc0000
ffffffffc020232e:	0135f9b3          	and	s3,a1,s3
    d0start = ROUNDDOWN(start, PTSIZE);
ffffffffc0202332:	ffe00937          	lui	s2,0xffe00
ffffffffc0202336:	400007b7          	lui	a5,0x40000
    return KADDR(page2pa(page));
ffffffffc020233a:	5cfd                	li	s9,-1
ffffffffc020233c:	8c2a                	mv	s8,a0
ffffffffc020233e:	0125f933          	and	s2,a1,s2
ffffffffc0202342:	99be                	add	s3,s3,a5
    if (PPN(pa) >= npage)
ffffffffc0202344:	000a8d17          	auipc	s10,0xa8
ffffffffc0202348:	3b4d0d13          	addi	s10,s10,948 # ffffffffc02aa6f8 <npage>
    return KADDR(page2pa(page));
ffffffffc020234c:	00ccdc93          	srli	s9,s9,0xc
    return &pages[PPN(pa) - nbase];
ffffffffc0202350:	000a8717          	auipc	a4,0xa8
ffffffffc0202354:	3b070713          	addi	a4,a4,944 # ffffffffc02aa700 <pages>
        pmm_manager->free_pages(base, n);
ffffffffc0202358:	000a8d97          	auipc	s11,0xa8
ffffffffc020235c:	3b0d8d93          	addi	s11,s11,944 # ffffffffc02aa708 <pmm_manager>
        pde1 = pgdir[PDX1(d1start)];
ffffffffc0202360:	c0000437          	lui	s0,0xc0000
ffffffffc0202364:	944e                	add	s0,s0,s3
ffffffffc0202366:	8079                	srli	s0,s0,0x1e
ffffffffc0202368:	1ff47413          	andi	s0,s0,511
ffffffffc020236c:	040e                	slli	s0,s0,0x3
ffffffffc020236e:	9462                	add	s0,s0,s8
ffffffffc0202370:	00043a03          	ld	s4,0(s0) # ffffffffc0000000 <_binary_obj___user_exit_out_size+0xffffffffbfff4ee0>
        if (pde1 & PTE_V)
ffffffffc0202374:	001a7793          	andi	a5,s4,1
ffffffffc0202378:	eb99                	bnez	a5,ffffffffc020238e <exit_range+0xa0>
    } while (d1start != 0 && d1start < end);
ffffffffc020237a:	12098463          	beqz	s3,ffffffffc02024a2 <exit_range+0x1b4>
ffffffffc020237e:	400007b7          	lui	a5,0x40000
ffffffffc0202382:	97ce                	add	a5,a5,s3
ffffffffc0202384:	894e                	mv	s2,s3
ffffffffc0202386:	1159fe63          	bgeu	s3,s5,ffffffffc02024a2 <exit_range+0x1b4>
ffffffffc020238a:	89be                	mv	s3,a5
ffffffffc020238c:	bfd1                	j	ffffffffc0202360 <exit_range+0x72>
    if (PPN(pa) >= npage)
ffffffffc020238e:	000d3783          	ld	a5,0(s10)
    return pa2page(PDE_ADDR(pde));
ffffffffc0202392:	0a0a                	slli	s4,s4,0x2
ffffffffc0202394:	00ca5a13          	srli	s4,s4,0xc
    if (PPN(pa) >= npage)
ffffffffc0202398:	1cfa7263          	bgeu	s4,a5,ffffffffc020255c <exit_range+0x26e>
    return &pages[PPN(pa) - nbase];
ffffffffc020239c:	fff80637          	lui	a2,0xfff80
ffffffffc02023a0:	9652                	add	a2,a2,s4
    return page - pages + nbase;
ffffffffc02023a2:	000806b7          	lui	a3,0x80
ffffffffc02023a6:	96b2                	add	a3,a3,a2
    return KADDR(page2pa(page));
ffffffffc02023a8:	0196f5b3          	and	a1,a3,s9
    return &pages[PPN(pa) - nbase];
ffffffffc02023ac:	061a                	slli	a2,a2,0x6
    return page2ppn(page) << PGSHIFT;
ffffffffc02023ae:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc02023b0:	18f5fa63          	bgeu	a1,a5,ffffffffc0202544 <exit_range+0x256>
ffffffffc02023b4:	000a8817          	auipc	a6,0xa8
ffffffffc02023b8:	35c80813          	addi	a6,a6,860 # ffffffffc02aa710 <va_pa_offset>
ffffffffc02023bc:	00083b03          	ld	s6,0(a6)
            free_pd0 = 1;
ffffffffc02023c0:	4b85                	li	s7,1
    return &pages[PPN(pa) - nbase];
ffffffffc02023c2:	fff80e37          	lui	t3,0xfff80
    return KADDR(page2pa(page));
ffffffffc02023c6:	9b36                	add	s6,s6,a3
    return page - pages + nbase;
ffffffffc02023c8:	00080337          	lui	t1,0x80
ffffffffc02023cc:	6885                	lui	a7,0x1
ffffffffc02023ce:	a819                	j	ffffffffc02023e4 <exit_range+0xf6>
                    free_pd0 = 0;
ffffffffc02023d0:	4b81                	li	s7,0
                d0start += PTSIZE;
ffffffffc02023d2:	002007b7          	lui	a5,0x200
ffffffffc02023d6:	993e                	add	s2,s2,a5
            } while (d0start != 0 && d0start < d1start + PDSIZE && d0start < end);
ffffffffc02023d8:	08090c63          	beqz	s2,ffffffffc0202470 <exit_range+0x182>
ffffffffc02023dc:	09397a63          	bgeu	s2,s3,ffffffffc0202470 <exit_range+0x182>
ffffffffc02023e0:	0f597063          	bgeu	s2,s5,ffffffffc02024c0 <exit_range+0x1d2>
                pde0 = pd0[PDX0(d0start)];
ffffffffc02023e4:	01595493          	srli	s1,s2,0x15
ffffffffc02023e8:	1ff4f493          	andi	s1,s1,511
ffffffffc02023ec:	048e                	slli	s1,s1,0x3
ffffffffc02023ee:	94da                	add	s1,s1,s6
ffffffffc02023f0:	609c                	ld	a5,0(s1)
                if (pde0 & PTE_V)
ffffffffc02023f2:	0017f693          	andi	a3,a5,1
ffffffffc02023f6:	dee9                	beqz	a3,ffffffffc02023d0 <exit_range+0xe2>
    if (PPN(pa) >= npage)
ffffffffc02023f8:	000d3583          	ld	a1,0(s10)
    return pa2page(PDE_ADDR(pde));
ffffffffc02023fc:	078a                	slli	a5,a5,0x2
ffffffffc02023fe:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc0202400:	14b7fe63          	bgeu	a5,a1,ffffffffc020255c <exit_range+0x26e>
    return &pages[PPN(pa) - nbase];
ffffffffc0202404:	97f2                	add	a5,a5,t3
    return page - pages + nbase;
ffffffffc0202406:	006786b3          	add	a3,a5,t1
    return KADDR(page2pa(page));
ffffffffc020240a:	0196feb3          	and	t4,a3,s9
    return &pages[PPN(pa) - nbase];
ffffffffc020240e:	00679513          	slli	a0,a5,0x6
    return page2ppn(page) << PGSHIFT;
ffffffffc0202412:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0202414:	12bef863          	bgeu	t4,a1,ffffffffc0202544 <exit_range+0x256>
ffffffffc0202418:	00083783          	ld	a5,0(a6)
ffffffffc020241c:	96be                	add	a3,a3,a5
                    for (int i = 0; i < NPTEENTRY; i++)
ffffffffc020241e:	011685b3          	add	a1,a3,a7
                        if (pt[i] & PTE_V)
ffffffffc0202422:	629c                	ld	a5,0(a3)
ffffffffc0202424:	8b85                	andi	a5,a5,1
ffffffffc0202426:	f7d5                	bnez	a5,ffffffffc02023d2 <exit_range+0xe4>
                    for (int i = 0; i < NPTEENTRY; i++)
ffffffffc0202428:	06a1                	addi	a3,a3,8
ffffffffc020242a:	fed59ce3          	bne	a1,a3,ffffffffc0202422 <exit_range+0x134>
    return &pages[PPN(pa) - nbase];
ffffffffc020242e:	631c                	ld	a5,0(a4)
ffffffffc0202430:	953e                	add	a0,a0,a5
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0202432:	100027f3          	csrr	a5,sstatus
ffffffffc0202436:	8b89                	andi	a5,a5,2
ffffffffc0202438:	e7d9                	bnez	a5,ffffffffc02024c6 <exit_range+0x1d8>
        pmm_manager->free_pages(base, n);
ffffffffc020243a:	000db783          	ld	a5,0(s11)
ffffffffc020243e:	4585                	li	a1,1
ffffffffc0202440:	e032                	sd	a2,0(sp)
ffffffffc0202442:	739c                	ld	a5,32(a5)
ffffffffc0202444:	9782                	jalr	a5
    if (flag)
ffffffffc0202446:	6602                	ld	a2,0(sp)
ffffffffc0202448:	000a8817          	auipc	a6,0xa8
ffffffffc020244c:	2c880813          	addi	a6,a6,712 # ffffffffc02aa710 <va_pa_offset>
ffffffffc0202450:	fff80e37          	lui	t3,0xfff80
ffffffffc0202454:	00080337          	lui	t1,0x80
ffffffffc0202458:	6885                	lui	a7,0x1
ffffffffc020245a:	000a8717          	auipc	a4,0xa8
ffffffffc020245e:	2a670713          	addi	a4,a4,678 # ffffffffc02aa700 <pages>
                        pd0[PDX0(d0start)] = 0;
ffffffffc0202462:	0004b023          	sd	zero,0(s1)
                d0start += PTSIZE;
ffffffffc0202466:	002007b7          	lui	a5,0x200
ffffffffc020246a:	993e                	add	s2,s2,a5
            } while (d0start != 0 && d0start < d1start + PDSIZE && d0start < end);
ffffffffc020246c:	f60918e3          	bnez	s2,ffffffffc02023dc <exit_range+0xee>
            if (free_pd0)
ffffffffc0202470:	f00b85e3          	beqz	s7,ffffffffc020237a <exit_range+0x8c>
    if (PPN(pa) >= npage)
ffffffffc0202474:	000d3783          	ld	a5,0(s10)
ffffffffc0202478:	0efa7263          	bgeu	s4,a5,ffffffffc020255c <exit_range+0x26e>
    return &pages[PPN(pa) - nbase];
ffffffffc020247c:	6308                	ld	a0,0(a4)
ffffffffc020247e:	9532                	add	a0,a0,a2
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0202480:	100027f3          	csrr	a5,sstatus
ffffffffc0202484:	8b89                	andi	a5,a5,2
ffffffffc0202486:	efad                	bnez	a5,ffffffffc0202500 <exit_range+0x212>
        pmm_manager->free_pages(base, n);
ffffffffc0202488:	000db783          	ld	a5,0(s11)
ffffffffc020248c:	4585                	li	a1,1
ffffffffc020248e:	739c                	ld	a5,32(a5)
ffffffffc0202490:	9782                	jalr	a5
ffffffffc0202492:	000a8717          	auipc	a4,0xa8
ffffffffc0202496:	26e70713          	addi	a4,a4,622 # ffffffffc02aa700 <pages>
                pgdir[PDX1(d1start)] = 0;
ffffffffc020249a:	00043023          	sd	zero,0(s0)
    } while (d1start != 0 && d1start < end);
ffffffffc020249e:	ee0990e3          	bnez	s3,ffffffffc020237e <exit_range+0x90>
}
ffffffffc02024a2:	70e6                	ld	ra,120(sp)
ffffffffc02024a4:	7446                	ld	s0,112(sp)
ffffffffc02024a6:	74a6                	ld	s1,104(sp)
ffffffffc02024a8:	7906                	ld	s2,96(sp)
ffffffffc02024aa:	69e6                	ld	s3,88(sp)
ffffffffc02024ac:	6a46                	ld	s4,80(sp)
ffffffffc02024ae:	6aa6                	ld	s5,72(sp)
ffffffffc02024b0:	6b06                	ld	s6,64(sp)
ffffffffc02024b2:	7be2                	ld	s7,56(sp)
ffffffffc02024b4:	7c42                	ld	s8,48(sp)
ffffffffc02024b6:	7ca2                	ld	s9,40(sp)
ffffffffc02024b8:	7d02                	ld	s10,32(sp)
ffffffffc02024ba:	6de2                	ld	s11,24(sp)
ffffffffc02024bc:	6109                	addi	sp,sp,128
ffffffffc02024be:	8082                	ret
            if (free_pd0)
ffffffffc02024c0:	ea0b8fe3          	beqz	s7,ffffffffc020237e <exit_range+0x90>
ffffffffc02024c4:	bf45                	j	ffffffffc0202474 <exit_range+0x186>
ffffffffc02024c6:	e032                	sd	a2,0(sp)
        intr_disable();
ffffffffc02024c8:	e42a                	sd	a0,8(sp)
ffffffffc02024ca:	ceafe0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        pmm_manager->free_pages(base, n);
ffffffffc02024ce:	000db783          	ld	a5,0(s11)
ffffffffc02024d2:	6522                	ld	a0,8(sp)
ffffffffc02024d4:	4585                	li	a1,1
ffffffffc02024d6:	739c                	ld	a5,32(a5)
ffffffffc02024d8:	9782                	jalr	a5
        intr_enable();
ffffffffc02024da:	cd4fe0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc02024de:	6602                	ld	a2,0(sp)
ffffffffc02024e0:	000a8717          	auipc	a4,0xa8
ffffffffc02024e4:	22070713          	addi	a4,a4,544 # ffffffffc02aa700 <pages>
ffffffffc02024e8:	6885                	lui	a7,0x1
ffffffffc02024ea:	00080337          	lui	t1,0x80
ffffffffc02024ee:	fff80e37          	lui	t3,0xfff80
ffffffffc02024f2:	000a8817          	auipc	a6,0xa8
ffffffffc02024f6:	21e80813          	addi	a6,a6,542 # ffffffffc02aa710 <va_pa_offset>
                        pd0[PDX0(d0start)] = 0;
ffffffffc02024fa:	0004b023          	sd	zero,0(s1)
ffffffffc02024fe:	b7a5                	j	ffffffffc0202466 <exit_range+0x178>
ffffffffc0202500:	e02a                	sd	a0,0(sp)
        intr_disable();
ffffffffc0202502:	cb2fe0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        pmm_manager->free_pages(base, n);
ffffffffc0202506:	000db783          	ld	a5,0(s11)
ffffffffc020250a:	6502                	ld	a0,0(sp)
ffffffffc020250c:	4585                	li	a1,1
ffffffffc020250e:	739c                	ld	a5,32(a5)
ffffffffc0202510:	9782                	jalr	a5
        intr_enable();
ffffffffc0202512:	c9cfe0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0202516:	000a8717          	auipc	a4,0xa8
ffffffffc020251a:	1ea70713          	addi	a4,a4,490 # ffffffffc02aa700 <pages>
                pgdir[PDX1(d1start)] = 0;
ffffffffc020251e:	00043023          	sd	zero,0(s0)
ffffffffc0202522:	bfb5                	j	ffffffffc020249e <exit_range+0x1b0>
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc0202524:	00004697          	auipc	a3,0x4
ffffffffc0202528:	30468693          	addi	a3,a3,772 # ffffffffc0206828 <default_pmm_manager+0x160>
ffffffffc020252c:	00004617          	auipc	a2,0x4
ffffffffc0202530:	dec60613          	addi	a2,a2,-532 # ffffffffc0206318 <commands+0x818>
ffffffffc0202534:	13500593          	li	a1,309
ffffffffc0202538:	00004517          	auipc	a0,0x4
ffffffffc020253c:	2e050513          	addi	a0,a0,736 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202540:	f4ffd0ef          	jal	ra,ffffffffc020048e <__panic>
    return KADDR(page2pa(page));
ffffffffc0202544:	00004617          	auipc	a2,0x4
ffffffffc0202548:	1bc60613          	addi	a2,a2,444 # ffffffffc0206700 <default_pmm_manager+0x38>
ffffffffc020254c:	07100593          	li	a1,113
ffffffffc0202550:	00004517          	auipc	a0,0x4
ffffffffc0202554:	1d850513          	addi	a0,a0,472 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc0202558:	f37fd0ef          	jal	ra,ffffffffc020048e <__panic>
ffffffffc020255c:	8e1ff0ef          	jal	ra,ffffffffc0201e3c <pa2page.part.0>
    assert(USER_ACCESS(start, end));
ffffffffc0202560:	00004697          	auipc	a3,0x4
ffffffffc0202564:	2f868693          	addi	a3,a3,760 # ffffffffc0206858 <default_pmm_manager+0x190>
ffffffffc0202568:	00004617          	auipc	a2,0x4
ffffffffc020256c:	db060613          	addi	a2,a2,-592 # ffffffffc0206318 <commands+0x818>
ffffffffc0202570:	13600593          	li	a1,310
ffffffffc0202574:	00004517          	auipc	a0,0x4
ffffffffc0202578:	2a450513          	addi	a0,a0,676 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc020257c:	f13fd0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0202580 <page_remove>:
{
ffffffffc0202580:	7179                	addi	sp,sp,-48
    pte_t *ptep = get_pte(pgdir, la, 0);
ffffffffc0202582:	4601                	li	a2,0
{
ffffffffc0202584:	ec26                	sd	s1,24(sp)
ffffffffc0202586:	f406                	sd	ra,40(sp)
ffffffffc0202588:	f022                	sd	s0,32(sp)
ffffffffc020258a:	84ae                	mv	s1,a1
    pte_t *ptep = get_pte(pgdir, la, 0);
ffffffffc020258c:	9a1ff0ef          	jal	ra,ffffffffc0201f2c <get_pte>
    if (ptep != NULL)
ffffffffc0202590:	c511                	beqz	a0,ffffffffc020259c <page_remove+0x1c>
    if (*ptep & PTE_V)
ffffffffc0202592:	611c                	ld	a5,0(a0)
ffffffffc0202594:	842a                	mv	s0,a0
ffffffffc0202596:	0017f713          	andi	a4,a5,1
ffffffffc020259a:	e711                	bnez	a4,ffffffffc02025a6 <page_remove+0x26>
}
ffffffffc020259c:	70a2                	ld	ra,40(sp)
ffffffffc020259e:	7402                	ld	s0,32(sp)
ffffffffc02025a0:	64e2                	ld	s1,24(sp)
ffffffffc02025a2:	6145                	addi	sp,sp,48
ffffffffc02025a4:	8082                	ret
    return pa2page(PTE_ADDR(pte));
ffffffffc02025a6:	078a                	slli	a5,a5,0x2
ffffffffc02025a8:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc02025aa:	000a8717          	auipc	a4,0xa8
ffffffffc02025ae:	14e73703          	ld	a4,334(a4) # ffffffffc02aa6f8 <npage>
ffffffffc02025b2:	06e7f363          	bgeu	a5,a4,ffffffffc0202618 <page_remove+0x98>
    return &pages[PPN(pa) - nbase];
ffffffffc02025b6:	fff80537          	lui	a0,0xfff80
ffffffffc02025ba:	97aa                	add	a5,a5,a0
ffffffffc02025bc:	079a                	slli	a5,a5,0x6
ffffffffc02025be:	000a8517          	auipc	a0,0xa8
ffffffffc02025c2:	14253503          	ld	a0,322(a0) # ffffffffc02aa700 <pages>
ffffffffc02025c6:	953e                	add	a0,a0,a5
    page->ref -= 1;
ffffffffc02025c8:	411c                	lw	a5,0(a0)
ffffffffc02025ca:	fff7871b          	addiw	a4,a5,-1
ffffffffc02025ce:	c118                	sw	a4,0(a0)
        if (page_ref(page) == 0)
ffffffffc02025d0:	cb11                	beqz	a4,ffffffffc02025e4 <page_remove+0x64>
        *ptep = 0;
ffffffffc02025d2:	00043023          	sd	zero,0(s0)
    asm volatile("sfence.vma %0" : : "r"(la));
ffffffffc02025d6:	12048073          	sfence.vma	s1
}
ffffffffc02025da:	70a2                	ld	ra,40(sp)
ffffffffc02025dc:	7402                	ld	s0,32(sp)
ffffffffc02025de:	64e2                	ld	s1,24(sp)
ffffffffc02025e0:	6145                	addi	sp,sp,48
ffffffffc02025e2:	8082                	ret
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02025e4:	100027f3          	csrr	a5,sstatus
ffffffffc02025e8:	8b89                	andi	a5,a5,2
ffffffffc02025ea:	eb89                	bnez	a5,ffffffffc02025fc <page_remove+0x7c>
        pmm_manager->free_pages(base, n);
ffffffffc02025ec:	000a8797          	auipc	a5,0xa8
ffffffffc02025f0:	11c7b783          	ld	a5,284(a5) # ffffffffc02aa708 <pmm_manager>
ffffffffc02025f4:	739c                	ld	a5,32(a5)
ffffffffc02025f6:	4585                	li	a1,1
ffffffffc02025f8:	9782                	jalr	a5
    if (flag)
ffffffffc02025fa:	bfe1                	j	ffffffffc02025d2 <page_remove+0x52>
        intr_disable();
ffffffffc02025fc:	e42a                	sd	a0,8(sp)
ffffffffc02025fe:	bb6fe0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
ffffffffc0202602:	000a8797          	auipc	a5,0xa8
ffffffffc0202606:	1067b783          	ld	a5,262(a5) # ffffffffc02aa708 <pmm_manager>
ffffffffc020260a:	739c                	ld	a5,32(a5)
ffffffffc020260c:	6522                	ld	a0,8(sp)
ffffffffc020260e:	4585                	li	a1,1
ffffffffc0202610:	9782                	jalr	a5
        intr_enable();
ffffffffc0202612:	b9cfe0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0202616:	bf75                	j	ffffffffc02025d2 <page_remove+0x52>
ffffffffc0202618:	825ff0ef          	jal	ra,ffffffffc0201e3c <pa2page.part.0>

ffffffffc020261c <page_insert>:
{
ffffffffc020261c:	7139                	addi	sp,sp,-64
ffffffffc020261e:	e852                	sd	s4,16(sp)
ffffffffc0202620:	8a32                	mv	s4,a2
ffffffffc0202622:	f822                	sd	s0,48(sp)
    pte_t *ptep = get_pte(pgdir, la, 1);
ffffffffc0202624:	4605                	li	a2,1
{
ffffffffc0202626:	842e                	mv	s0,a1
    pte_t *ptep = get_pte(pgdir, la, 1);
ffffffffc0202628:	85d2                	mv	a1,s4
{
ffffffffc020262a:	f426                	sd	s1,40(sp)
ffffffffc020262c:	fc06                	sd	ra,56(sp)
ffffffffc020262e:	f04a                	sd	s2,32(sp)
ffffffffc0202630:	ec4e                	sd	s3,24(sp)
ffffffffc0202632:	e456                	sd	s5,8(sp)
ffffffffc0202634:	84b6                	mv	s1,a3
    pte_t *ptep = get_pte(pgdir, la, 1);
ffffffffc0202636:	8f7ff0ef          	jal	ra,ffffffffc0201f2c <get_pte>
    if (ptep == NULL)
ffffffffc020263a:	c961                	beqz	a0,ffffffffc020270a <page_insert+0xee>
    page->ref += 1;
ffffffffc020263c:	4014                	lw	a3,0(s0)
    if (*ptep & PTE_V)
ffffffffc020263e:	611c                	ld	a5,0(a0)
ffffffffc0202640:	89aa                	mv	s3,a0
ffffffffc0202642:	0016871b          	addiw	a4,a3,1
ffffffffc0202646:	c018                	sw	a4,0(s0)
ffffffffc0202648:	0017f713          	andi	a4,a5,1
ffffffffc020264c:	ef05                	bnez	a4,ffffffffc0202684 <page_insert+0x68>
    return page - pages + nbase;
ffffffffc020264e:	000a8717          	auipc	a4,0xa8
ffffffffc0202652:	0b273703          	ld	a4,178(a4) # ffffffffc02aa700 <pages>
ffffffffc0202656:	8c19                	sub	s0,s0,a4
ffffffffc0202658:	000807b7          	lui	a5,0x80
ffffffffc020265c:	8419                	srai	s0,s0,0x6
ffffffffc020265e:	943e                	add	s0,s0,a5
    return (ppn << PTE_PPN_SHIFT) | PTE_V | type;
ffffffffc0202660:	042a                	slli	s0,s0,0xa
ffffffffc0202662:	8cc1                	or	s1,s1,s0
ffffffffc0202664:	0014e493          	ori	s1,s1,1
    *ptep = pte_create(page2ppn(page), PTE_V | perm);
ffffffffc0202668:	0099b023          	sd	s1,0(s3) # ffffffffc0000000 <_binary_obj___user_exit_out_size+0xffffffffbfff4ee0>
    asm volatile("sfence.vma %0" : : "r"(la));
ffffffffc020266c:	120a0073          	sfence.vma	s4
    return 0;
ffffffffc0202670:	4501                	li	a0,0
}
ffffffffc0202672:	70e2                	ld	ra,56(sp)
ffffffffc0202674:	7442                	ld	s0,48(sp)
ffffffffc0202676:	74a2                	ld	s1,40(sp)
ffffffffc0202678:	7902                	ld	s2,32(sp)
ffffffffc020267a:	69e2                	ld	s3,24(sp)
ffffffffc020267c:	6a42                	ld	s4,16(sp)
ffffffffc020267e:	6aa2                	ld	s5,8(sp)
ffffffffc0202680:	6121                	addi	sp,sp,64
ffffffffc0202682:	8082                	ret
    return pa2page(PTE_ADDR(pte));
ffffffffc0202684:	078a                	slli	a5,a5,0x2
ffffffffc0202686:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc0202688:	000a8717          	auipc	a4,0xa8
ffffffffc020268c:	07073703          	ld	a4,112(a4) # ffffffffc02aa6f8 <npage>
ffffffffc0202690:	06e7ff63          	bgeu	a5,a4,ffffffffc020270e <page_insert+0xf2>
    return &pages[PPN(pa) - nbase];
ffffffffc0202694:	000a8a97          	auipc	s5,0xa8
ffffffffc0202698:	06ca8a93          	addi	s5,s5,108 # ffffffffc02aa700 <pages>
ffffffffc020269c:	000ab703          	ld	a4,0(s5)
ffffffffc02026a0:	fff80937          	lui	s2,0xfff80
ffffffffc02026a4:	993e                	add	s2,s2,a5
ffffffffc02026a6:	091a                	slli	s2,s2,0x6
ffffffffc02026a8:	993a                	add	s2,s2,a4
        if (p == page)
ffffffffc02026aa:	01240c63          	beq	s0,s2,ffffffffc02026c2 <page_insert+0xa6>
    page->ref -= 1;
ffffffffc02026ae:	00092783          	lw	a5,0(s2) # fffffffffff80000 <end+0x3fcd58cc>
ffffffffc02026b2:	fff7869b          	addiw	a3,a5,-1
ffffffffc02026b6:	00d92023          	sw	a3,0(s2)
        if (page_ref(page) == 0)
ffffffffc02026ba:	c691                	beqz	a3,ffffffffc02026c6 <page_insert+0xaa>
    asm volatile("sfence.vma %0" : : "r"(la));
ffffffffc02026bc:	120a0073          	sfence.vma	s4
}
ffffffffc02026c0:	bf59                	j	ffffffffc0202656 <page_insert+0x3a>
ffffffffc02026c2:	c014                	sw	a3,0(s0)
    return page->ref;
ffffffffc02026c4:	bf49                	j	ffffffffc0202656 <page_insert+0x3a>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02026c6:	100027f3          	csrr	a5,sstatus
ffffffffc02026ca:	8b89                	andi	a5,a5,2
ffffffffc02026cc:	ef91                	bnez	a5,ffffffffc02026e8 <page_insert+0xcc>
        pmm_manager->free_pages(base, n);
ffffffffc02026ce:	000a8797          	auipc	a5,0xa8
ffffffffc02026d2:	03a7b783          	ld	a5,58(a5) # ffffffffc02aa708 <pmm_manager>
ffffffffc02026d6:	739c                	ld	a5,32(a5)
ffffffffc02026d8:	4585                	li	a1,1
ffffffffc02026da:	854a                	mv	a0,s2
ffffffffc02026dc:	9782                	jalr	a5
    return page - pages + nbase;
ffffffffc02026de:	000ab703          	ld	a4,0(s5)
    asm volatile("sfence.vma %0" : : "r"(la));
ffffffffc02026e2:	120a0073          	sfence.vma	s4
ffffffffc02026e6:	bf85                	j	ffffffffc0202656 <page_insert+0x3a>
        intr_disable();
ffffffffc02026e8:	accfe0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        pmm_manager->free_pages(base, n);
ffffffffc02026ec:	000a8797          	auipc	a5,0xa8
ffffffffc02026f0:	01c7b783          	ld	a5,28(a5) # ffffffffc02aa708 <pmm_manager>
ffffffffc02026f4:	739c                	ld	a5,32(a5)
ffffffffc02026f6:	4585                	li	a1,1
ffffffffc02026f8:	854a                	mv	a0,s2
ffffffffc02026fa:	9782                	jalr	a5
        intr_enable();
ffffffffc02026fc:	ab2fe0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0202700:	000ab703          	ld	a4,0(s5)
    asm volatile("sfence.vma %0" : : "r"(la));
ffffffffc0202704:	120a0073          	sfence.vma	s4
ffffffffc0202708:	b7b9                	j	ffffffffc0202656 <page_insert+0x3a>
        return -E_NO_MEM;
ffffffffc020270a:	5571                	li	a0,-4
ffffffffc020270c:	b79d                	j	ffffffffc0202672 <page_insert+0x56>
ffffffffc020270e:	f2eff0ef          	jal	ra,ffffffffc0201e3c <pa2page.part.0>

ffffffffc0202712 <pmm_init>:
    pmm_manager = &default_pmm_manager;
ffffffffc0202712:	00004797          	auipc	a5,0x4
ffffffffc0202716:	fb678793          	addi	a5,a5,-74 # ffffffffc02066c8 <default_pmm_manager>
    cprintf("memory management: %s\n", pmm_manager->name);
ffffffffc020271a:	638c                	ld	a1,0(a5)
{
ffffffffc020271c:	7159                	addi	sp,sp,-112
ffffffffc020271e:	f85a                	sd	s6,48(sp)
    cprintf("memory management: %s\n", pmm_manager->name);
ffffffffc0202720:	00004517          	auipc	a0,0x4
ffffffffc0202724:	15050513          	addi	a0,a0,336 # ffffffffc0206870 <default_pmm_manager+0x1a8>
    pmm_manager = &default_pmm_manager;
ffffffffc0202728:	000a8b17          	auipc	s6,0xa8
ffffffffc020272c:	fe0b0b13          	addi	s6,s6,-32 # ffffffffc02aa708 <pmm_manager>
{
ffffffffc0202730:	f486                	sd	ra,104(sp)
ffffffffc0202732:	e8ca                	sd	s2,80(sp)
ffffffffc0202734:	e4ce                	sd	s3,72(sp)
ffffffffc0202736:	f0a2                	sd	s0,96(sp)
ffffffffc0202738:	eca6                	sd	s1,88(sp)
ffffffffc020273a:	e0d2                	sd	s4,64(sp)
ffffffffc020273c:	fc56                	sd	s5,56(sp)
ffffffffc020273e:	f45e                	sd	s7,40(sp)
ffffffffc0202740:	f062                	sd	s8,32(sp)
ffffffffc0202742:	ec66                	sd	s9,24(sp)
    pmm_manager = &default_pmm_manager;
ffffffffc0202744:	00fb3023          	sd	a5,0(s6)
    cprintf("memory management: %s\n", pmm_manager->name);
ffffffffc0202748:	a4dfd0ef          	jal	ra,ffffffffc0200194 <cprintf>
    pmm_manager->init();
ffffffffc020274c:	000b3783          	ld	a5,0(s6)
    va_pa_offset = PHYSICAL_MEMORY_OFFSET;
ffffffffc0202750:	000a8997          	auipc	s3,0xa8
ffffffffc0202754:	fc098993          	addi	s3,s3,-64 # ffffffffc02aa710 <va_pa_offset>
    pmm_manager->init();
ffffffffc0202758:	679c                	ld	a5,8(a5)
ffffffffc020275a:	9782                	jalr	a5
    va_pa_offset = PHYSICAL_MEMORY_OFFSET;
ffffffffc020275c:	57f5                	li	a5,-3
ffffffffc020275e:	07fa                	slli	a5,a5,0x1e
ffffffffc0202760:	00f9b023          	sd	a5,0(s3)
    uint64_t mem_begin = get_memory_base();
ffffffffc0202764:	a36fe0ef          	jal	ra,ffffffffc020099a <get_memory_base>
ffffffffc0202768:	892a                	mv	s2,a0
    uint64_t mem_size = get_memory_size();
ffffffffc020276a:	a3afe0ef          	jal	ra,ffffffffc02009a4 <get_memory_size>
    if (mem_size == 0)
ffffffffc020276e:	200505e3          	beqz	a0,ffffffffc0203178 <pmm_init+0xa66>
    uint64_t mem_end = mem_begin + mem_size;
ffffffffc0202772:	84aa                	mv	s1,a0
    cprintf("physcial memory map:\n");
ffffffffc0202774:	00004517          	auipc	a0,0x4
ffffffffc0202778:	13450513          	addi	a0,a0,308 # ffffffffc02068a8 <default_pmm_manager+0x1e0>
ffffffffc020277c:	a19fd0ef          	jal	ra,ffffffffc0200194 <cprintf>
    uint64_t mem_end = mem_begin + mem_size;
ffffffffc0202780:	00990433          	add	s0,s2,s1
    cprintf("  memory: 0x%08lx, [0x%08lx, 0x%08lx].\n", mem_size, mem_begin,
ffffffffc0202784:	fff40693          	addi	a3,s0,-1
ffffffffc0202788:	864a                	mv	a2,s2
ffffffffc020278a:	85a6                	mv	a1,s1
ffffffffc020278c:	00004517          	auipc	a0,0x4
ffffffffc0202790:	13450513          	addi	a0,a0,308 # ffffffffc02068c0 <default_pmm_manager+0x1f8>
ffffffffc0202794:	a01fd0ef          	jal	ra,ffffffffc0200194 <cprintf>
    npage = maxpa / PGSIZE;
ffffffffc0202798:	c8000737          	lui	a4,0xc8000
ffffffffc020279c:	87a2                	mv	a5,s0
ffffffffc020279e:	54876163          	bltu	a4,s0,ffffffffc0202ce0 <pmm_init+0x5ce>
ffffffffc02027a2:	757d                	lui	a0,0xfffff
ffffffffc02027a4:	000a9617          	auipc	a2,0xa9
ffffffffc02027a8:	f8f60613          	addi	a2,a2,-113 # ffffffffc02ab733 <end+0xfff>
ffffffffc02027ac:	8e69                	and	a2,a2,a0
ffffffffc02027ae:	000a8497          	auipc	s1,0xa8
ffffffffc02027b2:	f4a48493          	addi	s1,s1,-182 # ffffffffc02aa6f8 <npage>
ffffffffc02027b6:	00c7d513          	srli	a0,a5,0xc
    pages = (struct Page *)ROUNDUP((void *)end, PGSIZE);
ffffffffc02027ba:	000a8b97          	auipc	s7,0xa8
ffffffffc02027be:	f46b8b93          	addi	s7,s7,-186 # ffffffffc02aa700 <pages>
    npage = maxpa / PGSIZE;
ffffffffc02027c2:	e088                	sd	a0,0(s1)
    pages = (struct Page *)ROUNDUP((void *)end, PGSIZE);
ffffffffc02027c4:	00cbb023          	sd	a2,0(s7)
    for (size_t i = 0; i < npage - nbase; i++)
ffffffffc02027c8:	000807b7          	lui	a5,0x80
    pages = (struct Page *)ROUNDUP((void *)end, PGSIZE);
ffffffffc02027cc:	86b2                	mv	a3,a2
    for (size_t i = 0; i < npage - nbase; i++)
ffffffffc02027ce:	02f50863          	beq	a0,a5,ffffffffc02027fe <pmm_init+0xec>
ffffffffc02027d2:	4781                	li	a5,0
ffffffffc02027d4:	4585                	li	a1,1
ffffffffc02027d6:	fff806b7          	lui	a3,0xfff80
        SetPageReserved(pages + i);
ffffffffc02027da:	00679513          	slli	a0,a5,0x6
ffffffffc02027de:	9532                	add	a0,a0,a2
ffffffffc02027e0:	00850713          	addi	a4,a0,8 # fffffffffffff008 <end+0x3fd548d4>
ffffffffc02027e4:	40b7302f          	amoor.d	zero,a1,(a4)
    for (size_t i = 0; i < npage - nbase; i++)
ffffffffc02027e8:	6088                	ld	a0,0(s1)
ffffffffc02027ea:	0785                	addi	a5,a5,1
        SetPageReserved(pages + i);
ffffffffc02027ec:	000bb603          	ld	a2,0(s7)
    for (size_t i = 0; i < npage - nbase; i++)
ffffffffc02027f0:	00d50733          	add	a4,a0,a3
ffffffffc02027f4:	fee7e3e3          	bltu	a5,a4,ffffffffc02027da <pmm_init+0xc8>
    uintptr_t freemem = PADDR((uintptr_t)pages + sizeof(struct Page) * (npage - nbase));
ffffffffc02027f8:	071a                	slli	a4,a4,0x6
ffffffffc02027fa:	00e606b3          	add	a3,a2,a4
ffffffffc02027fe:	c02007b7          	lui	a5,0xc0200
ffffffffc0202802:	2ef6ece3          	bltu	a3,a5,ffffffffc02032fa <pmm_init+0xbe8>
ffffffffc0202806:	0009b583          	ld	a1,0(s3)
    mem_end = ROUNDDOWN(mem_end, PGSIZE);
ffffffffc020280a:	77fd                	lui	a5,0xfffff
ffffffffc020280c:	8c7d                	and	s0,s0,a5
    uintptr_t freemem = PADDR((uintptr_t)pages + sizeof(struct Page) * (npage - nbase));
ffffffffc020280e:	8e8d                	sub	a3,a3,a1
    if (freemem < mem_end)
ffffffffc0202810:	5086eb63          	bltu	a3,s0,ffffffffc0202d26 <pmm_init+0x614>
    cprintf("vapaofset is %llu\n", va_pa_offset);
ffffffffc0202814:	00004517          	auipc	a0,0x4
ffffffffc0202818:	0d450513          	addi	a0,a0,212 # ffffffffc02068e8 <default_pmm_manager+0x220>
ffffffffc020281c:	979fd0ef          	jal	ra,ffffffffc0200194 <cprintf>
    return page;
}

static void check_alloc_page(void)
{
    pmm_manager->check();
ffffffffc0202820:	000b3783          	ld	a5,0(s6)
    boot_pgdir_va = (pte_t *)boot_page_table_sv39;
ffffffffc0202824:	000a8917          	auipc	s2,0xa8
ffffffffc0202828:	ecc90913          	addi	s2,s2,-308 # ffffffffc02aa6f0 <boot_pgdir_va>
    pmm_manager->check();
ffffffffc020282c:	7b9c                	ld	a5,48(a5)
ffffffffc020282e:	9782                	jalr	a5
    cprintf("check_alloc_page() succeeded!\n");
ffffffffc0202830:	00004517          	auipc	a0,0x4
ffffffffc0202834:	0d050513          	addi	a0,a0,208 # ffffffffc0206900 <default_pmm_manager+0x238>
ffffffffc0202838:	95dfd0ef          	jal	ra,ffffffffc0200194 <cprintf>
    boot_pgdir_va = (pte_t *)boot_page_table_sv39;
ffffffffc020283c:	00007697          	auipc	a3,0x7
ffffffffc0202840:	7c468693          	addi	a3,a3,1988 # ffffffffc020a000 <boot_page_table_sv39>
ffffffffc0202844:	00d93023          	sd	a3,0(s2)
    boot_pgdir_pa = PADDR(boot_pgdir_va);
ffffffffc0202848:	c02007b7          	lui	a5,0xc0200
ffffffffc020284c:	28f6ebe3          	bltu	a3,a5,ffffffffc02032e2 <pmm_init+0xbd0>
ffffffffc0202850:	0009b783          	ld	a5,0(s3)
ffffffffc0202854:	8e9d                	sub	a3,a3,a5
ffffffffc0202856:	000a8797          	auipc	a5,0xa8
ffffffffc020285a:	e8d7b923          	sd	a3,-366(a5) # ffffffffc02aa6e8 <boot_pgdir_pa>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc020285e:	100027f3          	csrr	a5,sstatus
ffffffffc0202862:	8b89                	andi	a5,a5,2
ffffffffc0202864:	4a079763          	bnez	a5,ffffffffc0202d12 <pmm_init+0x600>
        ret = pmm_manager->nr_free_pages();
ffffffffc0202868:	000b3783          	ld	a5,0(s6)
ffffffffc020286c:	779c                	ld	a5,40(a5)
ffffffffc020286e:	9782                	jalr	a5
ffffffffc0202870:	842a                	mv	s0,a0
    // so npage is always larger than KMEMSIZE / PGSIZE
    size_t nr_free_store;

    nr_free_store = nr_free_pages();

    assert(npage <= KERNTOP / PGSIZE);
ffffffffc0202872:	6098                	ld	a4,0(s1)
ffffffffc0202874:	c80007b7          	lui	a5,0xc8000
ffffffffc0202878:	83b1                	srli	a5,a5,0xc
ffffffffc020287a:	66e7e363          	bltu	a5,a4,ffffffffc0202ee0 <pmm_init+0x7ce>
    assert(boot_pgdir_va != NULL && (uint32_t)PGOFF(boot_pgdir_va) == 0);
ffffffffc020287e:	00093503          	ld	a0,0(s2)
ffffffffc0202882:	62050f63          	beqz	a0,ffffffffc0202ec0 <pmm_init+0x7ae>
ffffffffc0202886:	03451793          	slli	a5,a0,0x34
ffffffffc020288a:	62079b63          	bnez	a5,ffffffffc0202ec0 <pmm_init+0x7ae>
    assert(get_page(boot_pgdir_va, 0x0, NULL) == NULL);
ffffffffc020288e:	4601                	li	a2,0
ffffffffc0202890:	4581                	li	a1,0
ffffffffc0202892:	8c3ff0ef          	jal	ra,ffffffffc0202154 <get_page>
ffffffffc0202896:	60051563          	bnez	a0,ffffffffc0202ea0 <pmm_init+0x78e>
ffffffffc020289a:	100027f3          	csrr	a5,sstatus
ffffffffc020289e:	8b89                	andi	a5,a5,2
ffffffffc02028a0:	44079e63          	bnez	a5,ffffffffc0202cfc <pmm_init+0x5ea>
        page = pmm_manager->alloc_pages(n);
ffffffffc02028a4:	000b3783          	ld	a5,0(s6)
ffffffffc02028a8:	4505                	li	a0,1
ffffffffc02028aa:	6f9c                	ld	a5,24(a5)
ffffffffc02028ac:	9782                	jalr	a5
ffffffffc02028ae:	8a2a                	mv	s4,a0

    struct Page *p1, *p2;
    p1 = alloc_page();
    assert(page_insert(boot_pgdir_va, p1, 0x0, 0) == 0);
ffffffffc02028b0:	00093503          	ld	a0,0(s2)
ffffffffc02028b4:	4681                	li	a3,0
ffffffffc02028b6:	4601                	li	a2,0
ffffffffc02028b8:	85d2                	mv	a1,s4
ffffffffc02028ba:	d63ff0ef          	jal	ra,ffffffffc020261c <page_insert>
ffffffffc02028be:	26051ae3          	bnez	a0,ffffffffc0203332 <pmm_init+0xc20>

    pte_t *ptep;
    assert((ptep = get_pte(boot_pgdir_va, 0x0, 0)) != NULL);
ffffffffc02028c2:	00093503          	ld	a0,0(s2)
ffffffffc02028c6:	4601                	li	a2,0
ffffffffc02028c8:	4581                	li	a1,0
ffffffffc02028ca:	e62ff0ef          	jal	ra,ffffffffc0201f2c <get_pte>
ffffffffc02028ce:	240502e3          	beqz	a0,ffffffffc0203312 <pmm_init+0xc00>
    assert(pte2page(*ptep) == p1);
ffffffffc02028d2:	611c                	ld	a5,0(a0)
    if (!(pte & PTE_V))
ffffffffc02028d4:	0017f713          	andi	a4,a5,1
ffffffffc02028d8:	5a070263          	beqz	a4,ffffffffc0202e7c <pmm_init+0x76a>
    if (PPN(pa) >= npage)
ffffffffc02028dc:	6098                	ld	a4,0(s1)
    return pa2page(PTE_ADDR(pte));
ffffffffc02028de:	078a                	slli	a5,a5,0x2
ffffffffc02028e0:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc02028e2:	58e7fb63          	bgeu	a5,a4,ffffffffc0202e78 <pmm_init+0x766>
    return &pages[PPN(pa) - nbase];
ffffffffc02028e6:	000bb683          	ld	a3,0(s7)
ffffffffc02028ea:	fff80637          	lui	a2,0xfff80
ffffffffc02028ee:	97b2                	add	a5,a5,a2
ffffffffc02028f0:	079a                	slli	a5,a5,0x6
ffffffffc02028f2:	97b6                	add	a5,a5,a3
ffffffffc02028f4:	14fa17e3          	bne	s4,a5,ffffffffc0203242 <pmm_init+0xb30>
    assert(page_ref(p1) == 1);
ffffffffc02028f8:	000a2683          	lw	a3,0(s4) # 1000 <_binary_obj___user_faultread_out_size-0x8ba8>
ffffffffc02028fc:	4785                	li	a5,1
ffffffffc02028fe:	12f692e3          	bne	a3,a5,ffffffffc0203222 <pmm_init+0xb10>

    ptep = (pte_t *)KADDR(PDE_ADDR(boot_pgdir_va[0]));
ffffffffc0202902:	00093503          	ld	a0,0(s2)
ffffffffc0202906:	77fd                	lui	a5,0xfffff
ffffffffc0202908:	6114                	ld	a3,0(a0)
ffffffffc020290a:	068a                	slli	a3,a3,0x2
ffffffffc020290c:	8efd                	and	a3,a3,a5
ffffffffc020290e:	00c6d613          	srli	a2,a3,0xc
ffffffffc0202912:	0ee67ce3          	bgeu	a2,a4,ffffffffc020320a <pmm_init+0xaf8>
ffffffffc0202916:	0009bc03          	ld	s8,0(s3)
    ptep = (pte_t *)KADDR(PDE_ADDR(ptep[0])) + 1;
ffffffffc020291a:	96e2                	add	a3,a3,s8
ffffffffc020291c:	0006ba83          	ld	s5,0(a3)
ffffffffc0202920:	0a8a                	slli	s5,s5,0x2
ffffffffc0202922:	00fafab3          	and	s5,s5,a5
ffffffffc0202926:	00cad793          	srli	a5,s5,0xc
ffffffffc020292a:	0ce7f3e3          	bgeu	a5,a4,ffffffffc02031f0 <pmm_init+0xade>
    assert(get_pte(boot_pgdir_va, PGSIZE, 0) == ptep);
ffffffffc020292e:	4601                	li	a2,0
ffffffffc0202930:	6585                	lui	a1,0x1
    ptep = (pte_t *)KADDR(PDE_ADDR(ptep[0])) + 1;
ffffffffc0202932:	9ae2                	add	s5,s5,s8
    assert(get_pte(boot_pgdir_va, PGSIZE, 0) == ptep);
ffffffffc0202934:	df8ff0ef          	jal	ra,ffffffffc0201f2c <get_pte>
    ptep = (pte_t *)KADDR(PDE_ADDR(ptep[0])) + 1;
ffffffffc0202938:	0aa1                	addi	s5,s5,8
    assert(get_pte(boot_pgdir_va, PGSIZE, 0) == ptep);
ffffffffc020293a:	55551363          	bne	a0,s5,ffffffffc0202e80 <pmm_init+0x76e>
ffffffffc020293e:	100027f3          	csrr	a5,sstatus
ffffffffc0202942:	8b89                	andi	a5,a5,2
ffffffffc0202944:	3a079163          	bnez	a5,ffffffffc0202ce6 <pmm_init+0x5d4>
        page = pmm_manager->alloc_pages(n);
ffffffffc0202948:	000b3783          	ld	a5,0(s6)
ffffffffc020294c:	4505                	li	a0,1
ffffffffc020294e:	6f9c                	ld	a5,24(a5)
ffffffffc0202950:	9782                	jalr	a5
ffffffffc0202952:	8c2a                	mv	s8,a0

    p2 = alloc_page();
    assert(page_insert(boot_pgdir_va, p2, PGSIZE, PTE_U | PTE_W) == 0);
ffffffffc0202954:	00093503          	ld	a0,0(s2)
ffffffffc0202958:	46d1                	li	a3,20
ffffffffc020295a:	6605                	lui	a2,0x1
ffffffffc020295c:	85e2                	mv	a1,s8
ffffffffc020295e:	cbfff0ef          	jal	ra,ffffffffc020261c <page_insert>
ffffffffc0202962:	060517e3          	bnez	a0,ffffffffc02031d0 <pmm_init+0xabe>
    assert((ptep = get_pte(boot_pgdir_va, PGSIZE, 0)) != NULL);
ffffffffc0202966:	00093503          	ld	a0,0(s2)
ffffffffc020296a:	4601                	li	a2,0
ffffffffc020296c:	6585                	lui	a1,0x1
ffffffffc020296e:	dbeff0ef          	jal	ra,ffffffffc0201f2c <get_pte>
ffffffffc0202972:	02050fe3          	beqz	a0,ffffffffc02031b0 <pmm_init+0xa9e>
    assert(*ptep & PTE_U);
ffffffffc0202976:	611c                	ld	a5,0(a0)
ffffffffc0202978:	0107f713          	andi	a4,a5,16
ffffffffc020297c:	7c070e63          	beqz	a4,ffffffffc0203158 <pmm_init+0xa46>
    assert(*ptep & PTE_W);
ffffffffc0202980:	8b91                	andi	a5,a5,4
ffffffffc0202982:	7a078b63          	beqz	a5,ffffffffc0203138 <pmm_init+0xa26>
    assert(boot_pgdir_va[0] & PTE_U);
ffffffffc0202986:	00093503          	ld	a0,0(s2)
ffffffffc020298a:	611c                	ld	a5,0(a0)
ffffffffc020298c:	8bc1                	andi	a5,a5,16
ffffffffc020298e:	78078563          	beqz	a5,ffffffffc0203118 <pmm_init+0xa06>
    assert(page_ref(p2) == 1);
ffffffffc0202992:	000c2703          	lw	a4,0(s8)
ffffffffc0202996:	4785                	li	a5,1
ffffffffc0202998:	76f71063          	bne	a4,a5,ffffffffc02030f8 <pmm_init+0x9e6>

    assert(page_insert(boot_pgdir_va, p1, PGSIZE, 0) == 0);
ffffffffc020299c:	4681                	li	a3,0
ffffffffc020299e:	6605                	lui	a2,0x1
ffffffffc02029a0:	85d2                	mv	a1,s4
ffffffffc02029a2:	c7bff0ef          	jal	ra,ffffffffc020261c <page_insert>
ffffffffc02029a6:	72051963          	bnez	a0,ffffffffc02030d8 <pmm_init+0x9c6>
    assert(page_ref(p1) == 2);
ffffffffc02029aa:	000a2703          	lw	a4,0(s4)
ffffffffc02029ae:	4789                	li	a5,2
ffffffffc02029b0:	70f71463          	bne	a4,a5,ffffffffc02030b8 <pmm_init+0x9a6>
    assert(page_ref(p2) == 0);
ffffffffc02029b4:	000c2783          	lw	a5,0(s8)
ffffffffc02029b8:	6e079063          	bnez	a5,ffffffffc0203098 <pmm_init+0x986>
    assert((ptep = get_pte(boot_pgdir_va, PGSIZE, 0)) != NULL);
ffffffffc02029bc:	00093503          	ld	a0,0(s2)
ffffffffc02029c0:	4601                	li	a2,0
ffffffffc02029c2:	6585                	lui	a1,0x1
ffffffffc02029c4:	d68ff0ef          	jal	ra,ffffffffc0201f2c <get_pte>
ffffffffc02029c8:	6a050863          	beqz	a0,ffffffffc0203078 <pmm_init+0x966>
    assert(pte2page(*ptep) == p1);
ffffffffc02029cc:	6118                	ld	a4,0(a0)
    if (!(pte & PTE_V))
ffffffffc02029ce:	00177793          	andi	a5,a4,1
ffffffffc02029d2:	4a078563          	beqz	a5,ffffffffc0202e7c <pmm_init+0x76a>
    if (PPN(pa) >= npage)
ffffffffc02029d6:	6094                	ld	a3,0(s1)
    return pa2page(PTE_ADDR(pte));
ffffffffc02029d8:	00271793          	slli	a5,a4,0x2
ffffffffc02029dc:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc02029de:	48d7fd63          	bgeu	a5,a3,ffffffffc0202e78 <pmm_init+0x766>
    return &pages[PPN(pa) - nbase];
ffffffffc02029e2:	000bb683          	ld	a3,0(s7)
ffffffffc02029e6:	fff80ab7          	lui	s5,0xfff80
ffffffffc02029ea:	97d6                	add	a5,a5,s5
ffffffffc02029ec:	079a                	slli	a5,a5,0x6
ffffffffc02029ee:	97b6                	add	a5,a5,a3
ffffffffc02029f0:	66fa1463          	bne	s4,a5,ffffffffc0203058 <pmm_init+0x946>
    assert((*ptep & PTE_U) == 0);
ffffffffc02029f4:	8b41                	andi	a4,a4,16
ffffffffc02029f6:	64071163          	bnez	a4,ffffffffc0203038 <pmm_init+0x926>

    page_remove(boot_pgdir_va, 0x0);
ffffffffc02029fa:	00093503          	ld	a0,0(s2)
ffffffffc02029fe:	4581                	li	a1,0
ffffffffc0202a00:	b81ff0ef          	jal	ra,ffffffffc0202580 <page_remove>
    assert(page_ref(p1) == 1);
ffffffffc0202a04:	000a2c83          	lw	s9,0(s4)
ffffffffc0202a08:	4785                	li	a5,1
ffffffffc0202a0a:	60fc9763          	bne	s9,a5,ffffffffc0203018 <pmm_init+0x906>
    assert(page_ref(p2) == 0);
ffffffffc0202a0e:	000c2783          	lw	a5,0(s8)
ffffffffc0202a12:	5e079363          	bnez	a5,ffffffffc0202ff8 <pmm_init+0x8e6>

    page_remove(boot_pgdir_va, PGSIZE);
ffffffffc0202a16:	00093503          	ld	a0,0(s2)
ffffffffc0202a1a:	6585                	lui	a1,0x1
ffffffffc0202a1c:	b65ff0ef          	jal	ra,ffffffffc0202580 <page_remove>
    assert(page_ref(p1) == 0);
ffffffffc0202a20:	000a2783          	lw	a5,0(s4)
ffffffffc0202a24:	52079a63          	bnez	a5,ffffffffc0202f58 <pmm_init+0x846>
    assert(page_ref(p2) == 0);
ffffffffc0202a28:	000c2783          	lw	a5,0(s8)
ffffffffc0202a2c:	50079663          	bnez	a5,ffffffffc0202f38 <pmm_init+0x826>

    assert(page_ref(pde2page(boot_pgdir_va[0])) == 1);
ffffffffc0202a30:	00093a03          	ld	s4,0(s2)
    if (PPN(pa) >= npage)
ffffffffc0202a34:	608c                	ld	a1,0(s1)
    return pa2page(PDE_ADDR(pde));
ffffffffc0202a36:	000a3683          	ld	a3,0(s4)
ffffffffc0202a3a:	068a                	slli	a3,a3,0x2
ffffffffc0202a3c:	82b1                	srli	a3,a3,0xc
    if (PPN(pa) >= npage)
ffffffffc0202a3e:	42b6fd63          	bgeu	a3,a1,ffffffffc0202e78 <pmm_init+0x766>
    return &pages[PPN(pa) - nbase];
ffffffffc0202a42:	000bb503          	ld	a0,0(s7)
ffffffffc0202a46:	96d6                	add	a3,a3,s5
ffffffffc0202a48:	069a                	slli	a3,a3,0x6
    return page->ref;
ffffffffc0202a4a:	00d507b3          	add	a5,a0,a3
ffffffffc0202a4e:	439c                	lw	a5,0(a5)
ffffffffc0202a50:	4d979463          	bne	a5,s9,ffffffffc0202f18 <pmm_init+0x806>
    return page - pages + nbase;
ffffffffc0202a54:	8699                	srai	a3,a3,0x6
ffffffffc0202a56:	00080637          	lui	a2,0x80
ffffffffc0202a5a:	96b2                	add	a3,a3,a2
    return KADDR(page2pa(page));
ffffffffc0202a5c:	00c69713          	slli	a4,a3,0xc
ffffffffc0202a60:	8331                	srli	a4,a4,0xc
    return page2ppn(page) << PGSHIFT;
ffffffffc0202a62:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0202a64:	48b77e63          	bgeu	a4,a1,ffffffffc0202f00 <pmm_init+0x7ee>

    pde_t *pd1 = boot_pgdir_va, *pd0 = page2kva(pde2page(boot_pgdir_va[0]));
    free_page(pde2page(pd0[0]));
ffffffffc0202a68:	0009b703          	ld	a4,0(s3)
ffffffffc0202a6c:	96ba                	add	a3,a3,a4
    return pa2page(PDE_ADDR(pde));
ffffffffc0202a6e:	629c                	ld	a5,0(a3)
ffffffffc0202a70:	078a                	slli	a5,a5,0x2
ffffffffc0202a72:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc0202a74:	40b7f263          	bgeu	a5,a1,ffffffffc0202e78 <pmm_init+0x766>
    return &pages[PPN(pa) - nbase];
ffffffffc0202a78:	8f91                	sub	a5,a5,a2
ffffffffc0202a7a:	079a                	slli	a5,a5,0x6
ffffffffc0202a7c:	953e                	add	a0,a0,a5
ffffffffc0202a7e:	100027f3          	csrr	a5,sstatus
ffffffffc0202a82:	8b89                	andi	a5,a5,2
ffffffffc0202a84:	30079963          	bnez	a5,ffffffffc0202d96 <pmm_init+0x684>
        pmm_manager->free_pages(base, n);
ffffffffc0202a88:	000b3783          	ld	a5,0(s6)
ffffffffc0202a8c:	4585                	li	a1,1
ffffffffc0202a8e:	739c                	ld	a5,32(a5)
ffffffffc0202a90:	9782                	jalr	a5
    return pa2page(PDE_ADDR(pde));
ffffffffc0202a92:	000a3783          	ld	a5,0(s4)
    if (PPN(pa) >= npage)
ffffffffc0202a96:	6098                	ld	a4,0(s1)
    return pa2page(PDE_ADDR(pde));
ffffffffc0202a98:	078a                	slli	a5,a5,0x2
ffffffffc0202a9a:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc0202a9c:	3ce7fe63          	bgeu	a5,a4,ffffffffc0202e78 <pmm_init+0x766>
    return &pages[PPN(pa) - nbase];
ffffffffc0202aa0:	000bb503          	ld	a0,0(s7)
ffffffffc0202aa4:	fff80737          	lui	a4,0xfff80
ffffffffc0202aa8:	97ba                	add	a5,a5,a4
ffffffffc0202aaa:	079a                	slli	a5,a5,0x6
ffffffffc0202aac:	953e                	add	a0,a0,a5
ffffffffc0202aae:	100027f3          	csrr	a5,sstatus
ffffffffc0202ab2:	8b89                	andi	a5,a5,2
ffffffffc0202ab4:	2c079563          	bnez	a5,ffffffffc0202d7e <pmm_init+0x66c>
ffffffffc0202ab8:	000b3783          	ld	a5,0(s6)
ffffffffc0202abc:	4585                	li	a1,1
ffffffffc0202abe:	739c                	ld	a5,32(a5)
ffffffffc0202ac0:	9782                	jalr	a5
    free_page(pde2page(pd1[0]));
    boot_pgdir_va[0] = 0;
ffffffffc0202ac2:	00093783          	ld	a5,0(s2)
ffffffffc0202ac6:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0x3fd548cc>
    asm volatile("sfence.vma");
ffffffffc0202aca:	12000073          	sfence.vma
ffffffffc0202ace:	100027f3          	csrr	a5,sstatus
ffffffffc0202ad2:	8b89                	andi	a5,a5,2
ffffffffc0202ad4:	28079b63          	bnez	a5,ffffffffc0202d6a <pmm_init+0x658>
        ret = pmm_manager->nr_free_pages();
ffffffffc0202ad8:	000b3783          	ld	a5,0(s6)
ffffffffc0202adc:	779c                	ld	a5,40(a5)
ffffffffc0202ade:	9782                	jalr	a5
ffffffffc0202ae0:	8a2a                	mv	s4,a0
    flush_tlb();

    assert(nr_free_store == nr_free_pages());
ffffffffc0202ae2:	4b441b63          	bne	s0,s4,ffffffffc0202f98 <pmm_init+0x886>

    cprintf("check_pgdir() succeeded!\n");
ffffffffc0202ae6:	00004517          	auipc	a0,0x4
ffffffffc0202aea:	14250513          	addi	a0,a0,322 # ffffffffc0206c28 <default_pmm_manager+0x560>
ffffffffc0202aee:	ea6fd0ef          	jal	ra,ffffffffc0200194 <cprintf>
ffffffffc0202af2:	100027f3          	csrr	a5,sstatus
ffffffffc0202af6:	8b89                	andi	a5,a5,2
ffffffffc0202af8:	24079f63          	bnez	a5,ffffffffc0202d56 <pmm_init+0x644>
        ret = pmm_manager->nr_free_pages();
ffffffffc0202afc:	000b3783          	ld	a5,0(s6)
ffffffffc0202b00:	779c                	ld	a5,40(a5)
ffffffffc0202b02:	9782                	jalr	a5
ffffffffc0202b04:	8c2a                	mv	s8,a0
    pte_t *ptep;
    int i;

    nr_free_store = nr_free_pages();

    for (i = ROUNDDOWN(KERNBASE, PGSIZE); i < npage * PGSIZE; i += PGSIZE)
ffffffffc0202b06:	6098                	ld	a4,0(s1)
ffffffffc0202b08:	c0200437          	lui	s0,0xc0200
    {
        assert((ptep = get_pte(boot_pgdir_va, (uintptr_t)KADDR(i), 0)) != NULL);
        assert(PTE_ADDR(*ptep) == i);
ffffffffc0202b0c:	7afd                	lui	s5,0xfffff
    for (i = ROUNDDOWN(KERNBASE, PGSIZE); i < npage * PGSIZE; i += PGSIZE)
ffffffffc0202b0e:	00c71793          	slli	a5,a4,0xc
ffffffffc0202b12:	6a05                	lui	s4,0x1
ffffffffc0202b14:	02f47c63          	bgeu	s0,a5,ffffffffc0202b4c <pmm_init+0x43a>
        assert((ptep = get_pte(boot_pgdir_va, (uintptr_t)KADDR(i), 0)) != NULL);
ffffffffc0202b18:	00c45793          	srli	a5,s0,0xc
ffffffffc0202b1c:	00093503          	ld	a0,0(s2)
ffffffffc0202b20:	2ee7ff63          	bgeu	a5,a4,ffffffffc0202e1e <pmm_init+0x70c>
ffffffffc0202b24:	0009b583          	ld	a1,0(s3)
ffffffffc0202b28:	4601                	li	a2,0
ffffffffc0202b2a:	95a2                	add	a1,a1,s0
ffffffffc0202b2c:	c00ff0ef          	jal	ra,ffffffffc0201f2c <get_pte>
ffffffffc0202b30:	32050463          	beqz	a0,ffffffffc0202e58 <pmm_init+0x746>
        assert(PTE_ADDR(*ptep) == i);
ffffffffc0202b34:	611c                	ld	a5,0(a0)
ffffffffc0202b36:	078a                	slli	a5,a5,0x2
ffffffffc0202b38:	0157f7b3          	and	a5,a5,s5
ffffffffc0202b3c:	2e879e63          	bne	a5,s0,ffffffffc0202e38 <pmm_init+0x726>
    for (i = ROUNDDOWN(KERNBASE, PGSIZE); i < npage * PGSIZE; i += PGSIZE)
ffffffffc0202b40:	6098                	ld	a4,0(s1)
ffffffffc0202b42:	9452                	add	s0,s0,s4
ffffffffc0202b44:	00c71793          	slli	a5,a4,0xc
ffffffffc0202b48:	fcf468e3          	bltu	s0,a5,ffffffffc0202b18 <pmm_init+0x406>
    }

    assert(boot_pgdir_va[0] == 0);
ffffffffc0202b4c:	00093783          	ld	a5,0(s2)
ffffffffc0202b50:	639c                	ld	a5,0(a5)
ffffffffc0202b52:	42079363          	bnez	a5,ffffffffc0202f78 <pmm_init+0x866>
ffffffffc0202b56:	100027f3          	csrr	a5,sstatus
ffffffffc0202b5a:	8b89                	andi	a5,a5,2
ffffffffc0202b5c:	24079963          	bnez	a5,ffffffffc0202dae <pmm_init+0x69c>
        page = pmm_manager->alloc_pages(n);
ffffffffc0202b60:	000b3783          	ld	a5,0(s6)
ffffffffc0202b64:	4505                	li	a0,1
ffffffffc0202b66:	6f9c                	ld	a5,24(a5)
ffffffffc0202b68:	9782                	jalr	a5
ffffffffc0202b6a:	8a2a                	mv	s4,a0

    struct Page *p;
    p = alloc_page();
    assert(page_insert(boot_pgdir_va, p, 0x100, PTE_W | PTE_R) == 0);
ffffffffc0202b6c:	00093503          	ld	a0,0(s2)
ffffffffc0202b70:	4699                	li	a3,6
ffffffffc0202b72:	10000613          	li	a2,256
ffffffffc0202b76:	85d2                	mv	a1,s4
ffffffffc0202b78:	aa5ff0ef          	jal	ra,ffffffffc020261c <page_insert>
ffffffffc0202b7c:	44051e63          	bnez	a0,ffffffffc0202fd8 <pmm_init+0x8c6>
    assert(page_ref(p) == 1);
ffffffffc0202b80:	000a2703          	lw	a4,0(s4) # 1000 <_binary_obj___user_faultread_out_size-0x8ba8>
ffffffffc0202b84:	4785                	li	a5,1
ffffffffc0202b86:	42f71963          	bne	a4,a5,ffffffffc0202fb8 <pmm_init+0x8a6>
    assert(page_insert(boot_pgdir_va, p, 0x100 + PGSIZE, PTE_W | PTE_R) == 0);
ffffffffc0202b8a:	00093503          	ld	a0,0(s2)
ffffffffc0202b8e:	6405                	lui	s0,0x1
ffffffffc0202b90:	4699                	li	a3,6
ffffffffc0202b92:	10040613          	addi	a2,s0,256 # 1100 <_binary_obj___user_faultread_out_size-0x8aa8>
ffffffffc0202b96:	85d2                	mv	a1,s4
ffffffffc0202b98:	a85ff0ef          	jal	ra,ffffffffc020261c <page_insert>
ffffffffc0202b9c:	72051363          	bnez	a0,ffffffffc02032c2 <pmm_init+0xbb0>
    assert(page_ref(p) == 2);
ffffffffc0202ba0:	000a2703          	lw	a4,0(s4)
ffffffffc0202ba4:	4789                	li	a5,2
ffffffffc0202ba6:	6ef71e63          	bne	a4,a5,ffffffffc02032a2 <pmm_init+0xb90>

    const char *str = "ucore: Hello world!!";
    strcpy((void *)0x100, str);
ffffffffc0202baa:	00004597          	auipc	a1,0x4
ffffffffc0202bae:	1c658593          	addi	a1,a1,454 # ffffffffc0206d70 <default_pmm_manager+0x6a8>
ffffffffc0202bb2:	10000513          	li	a0,256
ffffffffc0202bb6:	449020ef          	jal	ra,ffffffffc02057fe <strcpy>
    assert(strcmp((void *)0x100, (void *)(0x100 + PGSIZE)) == 0);
ffffffffc0202bba:	10040593          	addi	a1,s0,256
ffffffffc0202bbe:	10000513          	li	a0,256
ffffffffc0202bc2:	44f020ef          	jal	ra,ffffffffc0205810 <strcmp>
ffffffffc0202bc6:	6a051e63          	bnez	a0,ffffffffc0203282 <pmm_init+0xb70>
    return page - pages + nbase;
ffffffffc0202bca:	000bb683          	ld	a3,0(s7)
ffffffffc0202bce:	00080737          	lui	a4,0x80
    return KADDR(page2pa(page));
ffffffffc0202bd2:	547d                	li	s0,-1
    return page - pages + nbase;
ffffffffc0202bd4:	40da06b3          	sub	a3,s4,a3
ffffffffc0202bd8:	8699                	srai	a3,a3,0x6
    return KADDR(page2pa(page));
ffffffffc0202bda:	609c                	ld	a5,0(s1)
    return page - pages + nbase;
ffffffffc0202bdc:	96ba                	add	a3,a3,a4
    return KADDR(page2pa(page));
ffffffffc0202bde:	8031                	srli	s0,s0,0xc
ffffffffc0202be0:	0086f733          	and	a4,a3,s0
    return page2ppn(page) << PGSHIFT;
ffffffffc0202be4:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0202be6:	30f77d63          	bgeu	a4,a5,ffffffffc0202f00 <pmm_init+0x7ee>

    *(char *)(page2kva(p) + 0x100) = '\0';
ffffffffc0202bea:	0009b783          	ld	a5,0(s3)
    assert(strlen((const char *)0x100) == 0);
ffffffffc0202bee:	10000513          	li	a0,256
    *(char *)(page2kva(p) + 0x100) = '\0';
ffffffffc0202bf2:	96be                	add	a3,a3,a5
ffffffffc0202bf4:	10068023          	sb	zero,256(a3)
    assert(strlen((const char *)0x100) == 0);
ffffffffc0202bf8:	3d1020ef          	jal	ra,ffffffffc02057c8 <strlen>
ffffffffc0202bfc:	66051363          	bnez	a0,ffffffffc0203262 <pmm_init+0xb50>

    pde_t *pd1 = boot_pgdir_va, *pd0 = page2kva(pde2page(boot_pgdir_va[0]));
ffffffffc0202c00:	00093a83          	ld	s5,0(s2)
    if (PPN(pa) >= npage)
ffffffffc0202c04:	609c                	ld	a5,0(s1)
    return pa2page(PDE_ADDR(pde));
ffffffffc0202c06:	000ab683          	ld	a3,0(s5) # fffffffffffff000 <end+0x3fd548cc>
ffffffffc0202c0a:	068a                	slli	a3,a3,0x2
ffffffffc0202c0c:	82b1                	srli	a3,a3,0xc
    if (PPN(pa) >= npage)
ffffffffc0202c0e:	26f6f563          	bgeu	a3,a5,ffffffffc0202e78 <pmm_init+0x766>
    return KADDR(page2pa(page));
ffffffffc0202c12:	8c75                	and	s0,s0,a3
    return page2ppn(page) << PGSHIFT;
ffffffffc0202c14:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0202c16:	2ef47563          	bgeu	s0,a5,ffffffffc0202f00 <pmm_init+0x7ee>
ffffffffc0202c1a:	0009b403          	ld	s0,0(s3)
ffffffffc0202c1e:	9436                	add	s0,s0,a3
ffffffffc0202c20:	100027f3          	csrr	a5,sstatus
ffffffffc0202c24:	8b89                	andi	a5,a5,2
ffffffffc0202c26:	1e079163          	bnez	a5,ffffffffc0202e08 <pmm_init+0x6f6>
        pmm_manager->free_pages(base, n);
ffffffffc0202c2a:	000b3783          	ld	a5,0(s6)
ffffffffc0202c2e:	4585                	li	a1,1
ffffffffc0202c30:	8552                	mv	a0,s4
ffffffffc0202c32:	739c                	ld	a5,32(a5)
ffffffffc0202c34:	9782                	jalr	a5
    return pa2page(PDE_ADDR(pde));
ffffffffc0202c36:	601c                	ld	a5,0(s0)
    if (PPN(pa) >= npage)
ffffffffc0202c38:	6098                	ld	a4,0(s1)
    return pa2page(PDE_ADDR(pde));
ffffffffc0202c3a:	078a                	slli	a5,a5,0x2
ffffffffc0202c3c:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc0202c3e:	22e7fd63          	bgeu	a5,a4,ffffffffc0202e78 <pmm_init+0x766>
    return &pages[PPN(pa) - nbase];
ffffffffc0202c42:	000bb503          	ld	a0,0(s7)
ffffffffc0202c46:	fff80737          	lui	a4,0xfff80
ffffffffc0202c4a:	97ba                	add	a5,a5,a4
ffffffffc0202c4c:	079a                	slli	a5,a5,0x6
ffffffffc0202c4e:	953e                	add	a0,a0,a5
ffffffffc0202c50:	100027f3          	csrr	a5,sstatus
ffffffffc0202c54:	8b89                	andi	a5,a5,2
ffffffffc0202c56:	18079d63          	bnez	a5,ffffffffc0202df0 <pmm_init+0x6de>
ffffffffc0202c5a:	000b3783          	ld	a5,0(s6)
ffffffffc0202c5e:	4585                	li	a1,1
ffffffffc0202c60:	739c                	ld	a5,32(a5)
ffffffffc0202c62:	9782                	jalr	a5
    return pa2page(PDE_ADDR(pde));
ffffffffc0202c64:	000ab783          	ld	a5,0(s5)
    if (PPN(pa) >= npage)
ffffffffc0202c68:	6098                	ld	a4,0(s1)
    return pa2page(PDE_ADDR(pde));
ffffffffc0202c6a:	078a                	slli	a5,a5,0x2
ffffffffc0202c6c:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc0202c6e:	20e7f563          	bgeu	a5,a4,ffffffffc0202e78 <pmm_init+0x766>
    return &pages[PPN(pa) - nbase];
ffffffffc0202c72:	000bb503          	ld	a0,0(s7)
ffffffffc0202c76:	fff80737          	lui	a4,0xfff80
ffffffffc0202c7a:	97ba                	add	a5,a5,a4
ffffffffc0202c7c:	079a                	slli	a5,a5,0x6
ffffffffc0202c7e:	953e                	add	a0,a0,a5
ffffffffc0202c80:	100027f3          	csrr	a5,sstatus
ffffffffc0202c84:	8b89                	andi	a5,a5,2
ffffffffc0202c86:	14079963          	bnez	a5,ffffffffc0202dd8 <pmm_init+0x6c6>
ffffffffc0202c8a:	000b3783          	ld	a5,0(s6)
ffffffffc0202c8e:	4585                	li	a1,1
ffffffffc0202c90:	739c                	ld	a5,32(a5)
ffffffffc0202c92:	9782                	jalr	a5
    free_page(p);
    free_page(pde2page(pd0[0]));
    free_page(pde2page(pd1[0]));
    boot_pgdir_va[0] = 0;
ffffffffc0202c94:	00093783          	ld	a5,0(s2)
ffffffffc0202c98:	0007b023          	sd	zero,0(a5)
    asm volatile("sfence.vma");
ffffffffc0202c9c:	12000073          	sfence.vma
ffffffffc0202ca0:	100027f3          	csrr	a5,sstatus
ffffffffc0202ca4:	8b89                	andi	a5,a5,2
ffffffffc0202ca6:	10079f63          	bnez	a5,ffffffffc0202dc4 <pmm_init+0x6b2>
        ret = pmm_manager->nr_free_pages();
ffffffffc0202caa:	000b3783          	ld	a5,0(s6)
ffffffffc0202cae:	779c                	ld	a5,40(a5)
ffffffffc0202cb0:	9782                	jalr	a5
ffffffffc0202cb2:	842a                	mv	s0,a0
    flush_tlb();

    assert(nr_free_store == nr_free_pages());
ffffffffc0202cb4:	4c8c1e63          	bne	s8,s0,ffffffffc0203190 <pmm_init+0xa7e>

    cprintf("check_boot_pgdir() succeeded!\n");
ffffffffc0202cb8:	00004517          	auipc	a0,0x4
ffffffffc0202cbc:	13050513          	addi	a0,a0,304 # ffffffffc0206de8 <default_pmm_manager+0x720>
ffffffffc0202cc0:	cd4fd0ef          	jal	ra,ffffffffc0200194 <cprintf>
}
ffffffffc0202cc4:	7406                	ld	s0,96(sp)
ffffffffc0202cc6:	70a6                	ld	ra,104(sp)
ffffffffc0202cc8:	64e6                	ld	s1,88(sp)
ffffffffc0202cca:	6946                	ld	s2,80(sp)
ffffffffc0202ccc:	69a6                	ld	s3,72(sp)
ffffffffc0202cce:	6a06                	ld	s4,64(sp)
ffffffffc0202cd0:	7ae2                	ld	s5,56(sp)
ffffffffc0202cd2:	7b42                	ld	s6,48(sp)
ffffffffc0202cd4:	7ba2                	ld	s7,40(sp)
ffffffffc0202cd6:	7c02                	ld	s8,32(sp)
ffffffffc0202cd8:	6ce2                	ld	s9,24(sp)
ffffffffc0202cda:	6165                	addi	sp,sp,112
    kmalloc_init();
ffffffffc0202cdc:	f97fe06f          	j	ffffffffc0201c72 <kmalloc_init>
    npage = maxpa / PGSIZE;
ffffffffc0202ce0:	c80007b7          	lui	a5,0xc8000
ffffffffc0202ce4:	bc7d                	j	ffffffffc02027a2 <pmm_init+0x90>
        intr_disable();
ffffffffc0202ce6:	ccffd0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        page = pmm_manager->alloc_pages(n);
ffffffffc0202cea:	000b3783          	ld	a5,0(s6)
ffffffffc0202cee:	4505                	li	a0,1
ffffffffc0202cf0:	6f9c                	ld	a5,24(a5)
ffffffffc0202cf2:	9782                	jalr	a5
ffffffffc0202cf4:	8c2a                	mv	s8,a0
        intr_enable();
ffffffffc0202cf6:	cb9fd0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0202cfa:	b9a9                	j	ffffffffc0202954 <pmm_init+0x242>
        intr_disable();
ffffffffc0202cfc:	cb9fd0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
ffffffffc0202d00:	000b3783          	ld	a5,0(s6)
ffffffffc0202d04:	4505                	li	a0,1
ffffffffc0202d06:	6f9c                	ld	a5,24(a5)
ffffffffc0202d08:	9782                	jalr	a5
ffffffffc0202d0a:	8a2a                	mv	s4,a0
        intr_enable();
ffffffffc0202d0c:	ca3fd0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0202d10:	b645                	j	ffffffffc02028b0 <pmm_init+0x19e>
        intr_disable();
ffffffffc0202d12:	ca3fd0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        ret = pmm_manager->nr_free_pages();
ffffffffc0202d16:	000b3783          	ld	a5,0(s6)
ffffffffc0202d1a:	779c                	ld	a5,40(a5)
ffffffffc0202d1c:	9782                	jalr	a5
ffffffffc0202d1e:	842a                	mv	s0,a0
        intr_enable();
ffffffffc0202d20:	c8ffd0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0202d24:	b6b9                	j	ffffffffc0202872 <pmm_init+0x160>
    mem_begin = ROUNDUP(freemem, PGSIZE);
ffffffffc0202d26:	6705                	lui	a4,0x1
ffffffffc0202d28:	177d                	addi	a4,a4,-1
ffffffffc0202d2a:	96ba                	add	a3,a3,a4
ffffffffc0202d2c:	8ff5                	and	a5,a5,a3
    if (PPN(pa) >= npage)
ffffffffc0202d2e:	00c7d713          	srli	a4,a5,0xc
ffffffffc0202d32:	14a77363          	bgeu	a4,a0,ffffffffc0202e78 <pmm_init+0x766>
    pmm_manager->init_memmap(base, n);
ffffffffc0202d36:	000b3683          	ld	a3,0(s6)
    return &pages[PPN(pa) - nbase];
ffffffffc0202d3a:	fff80537          	lui	a0,0xfff80
ffffffffc0202d3e:	972a                	add	a4,a4,a0
ffffffffc0202d40:	6a94                	ld	a3,16(a3)
        init_memmap(pa2page(mem_begin), (mem_end - mem_begin) / PGSIZE);
ffffffffc0202d42:	8c1d                	sub	s0,s0,a5
ffffffffc0202d44:	00671513          	slli	a0,a4,0x6
    pmm_manager->init_memmap(base, n);
ffffffffc0202d48:	00c45593          	srli	a1,s0,0xc
ffffffffc0202d4c:	9532                	add	a0,a0,a2
ffffffffc0202d4e:	9682                	jalr	a3
    cprintf("vapaofset is %llu\n", va_pa_offset);
ffffffffc0202d50:	0009b583          	ld	a1,0(s3)
}
ffffffffc0202d54:	b4c1                	j	ffffffffc0202814 <pmm_init+0x102>
        intr_disable();
ffffffffc0202d56:	c5ffd0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        ret = pmm_manager->nr_free_pages();
ffffffffc0202d5a:	000b3783          	ld	a5,0(s6)
ffffffffc0202d5e:	779c                	ld	a5,40(a5)
ffffffffc0202d60:	9782                	jalr	a5
ffffffffc0202d62:	8c2a                	mv	s8,a0
        intr_enable();
ffffffffc0202d64:	c4bfd0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0202d68:	bb79                	j	ffffffffc0202b06 <pmm_init+0x3f4>
        intr_disable();
ffffffffc0202d6a:	c4bfd0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
ffffffffc0202d6e:	000b3783          	ld	a5,0(s6)
ffffffffc0202d72:	779c                	ld	a5,40(a5)
ffffffffc0202d74:	9782                	jalr	a5
ffffffffc0202d76:	8a2a                	mv	s4,a0
        intr_enable();
ffffffffc0202d78:	c37fd0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0202d7c:	b39d                	j	ffffffffc0202ae2 <pmm_init+0x3d0>
ffffffffc0202d7e:	e42a                	sd	a0,8(sp)
        intr_disable();
ffffffffc0202d80:	c35fd0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        pmm_manager->free_pages(base, n);
ffffffffc0202d84:	000b3783          	ld	a5,0(s6)
ffffffffc0202d88:	6522                	ld	a0,8(sp)
ffffffffc0202d8a:	4585                	li	a1,1
ffffffffc0202d8c:	739c                	ld	a5,32(a5)
ffffffffc0202d8e:	9782                	jalr	a5
        intr_enable();
ffffffffc0202d90:	c1ffd0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0202d94:	b33d                	j	ffffffffc0202ac2 <pmm_init+0x3b0>
ffffffffc0202d96:	e42a                	sd	a0,8(sp)
        intr_disable();
ffffffffc0202d98:	c1dfd0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
ffffffffc0202d9c:	000b3783          	ld	a5,0(s6)
ffffffffc0202da0:	6522                	ld	a0,8(sp)
ffffffffc0202da2:	4585                	li	a1,1
ffffffffc0202da4:	739c                	ld	a5,32(a5)
ffffffffc0202da6:	9782                	jalr	a5
        intr_enable();
ffffffffc0202da8:	c07fd0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0202dac:	b1dd                	j	ffffffffc0202a92 <pmm_init+0x380>
        intr_disable();
ffffffffc0202dae:	c07fd0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        page = pmm_manager->alloc_pages(n);
ffffffffc0202db2:	000b3783          	ld	a5,0(s6)
ffffffffc0202db6:	4505                	li	a0,1
ffffffffc0202db8:	6f9c                	ld	a5,24(a5)
ffffffffc0202dba:	9782                	jalr	a5
ffffffffc0202dbc:	8a2a                	mv	s4,a0
        intr_enable();
ffffffffc0202dbe:	bf1fd0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0202dc2:	b36d                	j	ffffffffc0202b6c <pmm_init+0x45a>
        intr_disable();
ffffffffc0202dc4:	bf1fd0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        ret = pmm_manager->nr_free_pages();
ffffffffc0202dc8:	000b3783          	ld	a5,0(s6)
ffffffffc0202dcc:	779c                	ld	a5,40(a5)
ffffffffc0202dce:	9782                	jalr	a5
ffffffffc0202dd0:	842a                	mv	s0,a0
        intr_enable();
ffffffffc0202dd2:	bddfd0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0202dd6:	bdf9                	j	ffffffffc0202cb4 <pmm_init+0x5a2>
ffffffffc0202dd8:	e42a                	sd	a0,8(sp)
        intr_disable();
ffffffffc0202dda:	bdbfd0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        pmm_manager->free_pages(base, n);
ffffffffc0202dde:	000b3783          	ld	a5,0(s6)
ffffffffc0202de2:	6522                	ld	a0,8(sp)
ffffffffc0202de4:	4585                	li	a1,1
ffffffffc0202de6:	739c                	ld	a5,32(a5)
ffffffffc0202de8:	9782                	jalr	a5
        intr_enable();
ffffffffc0202dea:	bc5fd0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0202dee:	b55d                	j	ffffffffc0202c94 <pmm_init+0x582>
ffffffffc0202df0:	e42a                	sd	a0,8(sp)
        intr_disable();
ffffffffc0202df2:	bc3fd0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
ffffffffc0202df6:	000b3783          	ld	a5,0(s6)
ffffffffc0202dfa:	6522                	ld	a0,8(sp)
ffffffffc0202dfc:	4585                	li	a1,1
ffffffffc0202dfe:	739c                	ld	a5,32(a5)
ffffffffc0202e00:	9782                	jalr	a5
        intr_enable();
ffffffffc0202e02:	badfd0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0202e06:	bdb9                	j	ffffffffc0202c64 <pmm_init+0x552>
        intr_disable();
ffffffffc0202e08:	badfd0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
ffffffffc0202e0c:	000b3783          	ld	a5,0(s6)
ffffffffc0202e10:	4585                	li	a1,1
ffffffffc0202e12:	8552                	mv	a0,s4
ffffffffc0202e14:	739c                	ld	a5,32(a5)
ffffffffc0202e16:	9782                	jalr	a5
        intr_enable();
ffffffffc0202e18:	b97fd0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0202e1c:	bd29                	j	ffffffffc0202c36 <pmm_init+0x524>
        assert((ptep = get_pte(boot_pgdir_va, (uintptr_t)KADDR(i), 0)) != NULL);
ffffffffc0202e1e:	86a2                	mv	a3,s0
ffffffffc0202e20:	00004617          	auipc	a2,0x4
ffffffffc0202e24:	8e060613          	addi	a2,a2,-1824 # ffffffffc0206700 <default_pmm_manager+0x38>
ffffffffc0202e28:	25300593          	li	a1,595
ffffffffc0202e2c:	00004517          	auipc	a0,0x4
ffffffffc0202e30:	9ec50513          	addi	a0,a0,-1556 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202e34:	e5afd0ef          	jal	ra,ffffffffc020048e <__panic>
        assert(PTE_ADDR(*ptep) == i);
ffffffffc0202e38:	00004697          	auipc	a3,0x4
ffffffffc0202e3c:	e5068693          	addi	a3,a3,-432 # ffffffffc0206c88 <default_pmm_manager+0x5c0>
ffffffffc0202e40:	00003617          	auipc	a2,0x3
ffffffffc0202e44:	4d860613          	addi	a2,a2,1240 # ffffffffc0206318 <commands+0x818>
ffffffffc0202e48:	25400593          	li	a1,596
ffffffffc0202e4c:	00004517          	auipc	a0,0x4
ffffffffc0202e50:	9cc50513          	addi	a0,a0,-1588 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202e54:	e3afd0ef          	jal	ra,ffffffffc020048e <__panic>
        assert((ptep = get_pte(boot_pgdir_va, (uintptr_t)KADDR(i), 0)) != NULL);
ffffffffc0202e58:	00004697          	auipc	a3,0x4
ffffffffc0202e5c:	df068693          	addi	a3,a3,-528 # ffffffffc0206c48 <default_pmm_manager+0x580>
ffffffffc0202e60:	00003617          	auipc	a2,0x3
ffffffffc0202e64:	4b860613          	addi	a2,a2,1208 # ffffffffc0206318 <commands+0x818>
ffffffffc0202e68:	25300593          	li	a1,595
ffffffffc0202e6c:	00004517          	auipc	a0,0x4
ffffffffc0202e70:	9ac50513          	addi	a0,a0,-1620 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202e74:	e1afd0ef          	jal	ra,ffffffffc020048e <__panic>
ffffffffc0202e78:	fc5fe0ef          	jal	ra,ffffffffc0201e3c <pa2page.part.0>
ffffffffc0202e7c:	fddfe0ef          	jal	ra,ffffffffc0201e58 <pte2page.part.0>
    assert(get_pte(boot_pgdir_va, PGSIZE, 0) == ptep);
ffffffffc0202e80:	00004697          	auipc	a3,0x4
ffffffffc0202e84:	bc068693          	addi	a3,a3,-1088 # ffffffffc0206a40 <default_pmm_manager+0x378>
ffffffffc0202e88:	00003617          	auipc	a2,0x3
ffffffffc0202e8c:	49060613          	addi	a2,a2,1168 # ffffffffc0206318 <commands+0x818>
ffffffffc0202e90:	22300593          	li	a1,547
ffffffffc0202e94:	00004517          	auipc	a0,0x4
ffffffffc0202e98:	98450513          	addi	a0,a0,-1660 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202e9c:	df2fd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(get_page(boot_pgdir_va, 0x0, NULL) == NULL);
ffffffffc0202ea0:	00004697          	auipc	a3,0x4
ffffffffc0202ea4:	ae068693          	addi	a3,a3,-1312 # ffffffffc0206980 <default_pmm_manager+0x2b8>
ffffffffc0202ea8:	00003617          	auipc	a2,0x3
ffffffffc0202eac:	47060613          	addi	a2,a2,1136 # ffffffffc0206318 <commands+0x818>
ffffffffc0202eb0:	21600593          	li	a1,534
ffffffffc0202eb4:	00004517          	auipc	a0,0x4
ffffffffc0202eb8:	96450513          	addi	a0,a0,-1692 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202ebc:	dd2fd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(boot_pgdir_va != NULL && (uint32_t)PGOFF(boot_pgdir_va) == 0);
ffffffffc0202ec0:	00004697          	auipc	a3,0x4
ffffffffc0202ec4:	a8068693          	addi	a3,a3,-1408 # ffffffffc0206940 <default_pmm_manager+0x278>
ffffffffc0202ec8:	00003617          	auipc	a2,0x3
ffffffffc0202ecc:	45060613          	addi	a2,a2,1104 # ffffffffc0206318 <commands+0x818>
ffffffffc0202ed0:	21500593          	li	a1,533
ffffffffc0202ed4:	00004517          	auipc	a0,0x4
ffffffffc0202ed8:	94450513          	addi	a0,a0,-1724 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202edc:	db2fd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(npage <= KERNTOP / PGSIZE);
ffffffffc0202ee0:	00004697          	auipc	a3,0x4
ffffffffc0202ee4:	a4068693          	addi	a3,a3,-1472 # ffffffffc0206920 <default_pmm_manager+0x258>
ffffffffc0202ee8:	00003617          	auipc	a2,0x3
ffffffffc0202eec:	43060613          	addi	a2,a2,1072 # ffffffffc0206318 <commands+0x818>
ffffffffc0202ef0:	21400593          	li	a1,532
ffffffffc0202ef4:	00004517          	auipc	a0,0x4
ffffffffc0202ef8:	92450513          	addi	a0,a0,-1756 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202efc:	d92fd0ef          	jal	ra,ffffffffc020048e <__panic>
    return KADDR(page2pa(page));
ffffffffc0202f00:	00004617          	auipc	a2,0x4
ffffffffc0202f04:	80060613          	addi	a2,a2,-2048 # ffffffffc0206700 <default_pmm_manager+0x38>
ffffffffc0202f08:	07100593          	li	a1,113
ffffffffc0202f0c:	00004517          	auipc	a0,0x4
ffffffffc0202f10:	81c50513          	addi	a0,a0,-2020 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc0202f14:	d7afd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_ref(pde2page(boot_pgdir_va[0])) == 1);
ffffffffc0202f18:	00004697          	auipc	a3,0x4
ffffffffc0202f1c:	cb868693          	addi	a3,a3,-840 # ffffffffc0206bd0 <default_pmm_manager+0x508>
ffffffffc0202f20:	00003617          	auipc	a2,0x3
ffffffffc0202f24:	3f860613          	addi	a2,a2,1016 # ffffffffc0206318 <commands+0x818>
ffffffffc0202f28:	23c00593          	li	a1,572
ffffffffc0202f2c:	00004517          	auipc	a0,0x4
ffffffffc0202f30:	8ec50513          	addi	a0,a0,-1812 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202f34:	d5afd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_ref(p2) == 0);
ffffffffc0202f38:	00004697          	auipc	a3,0x4
ffffffffc0202f3c:	c5068693          	addi	a3,a3,-944 # ffffffffc0206b88 <default_pmm_manager+0x4c0>
ffffffffc0202f40:	00003617          	auipc	a2,0x3
ffffffffc0202f44:	3d860613          	addi	a2,a2,984 # ffffffffc0206318 <commands+0x818>
ffffffffc0202f48:	23a00593          	li	a1,570
ffffffffc0202f4c:	00004517          	auipc	a0,0x4
ffffffffc0202f50:	8cc50513          	addi	a0,a0,-1844 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202f54:	d3afd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_ref(p1) == 0);
ffffffffc0202f58:	00004697          	auipc	a3,0x4
ffffffffc0202f5c:	c6068693          	addi	a3,a3,-928 # ffffffffc0206bb8 <default_pmm_manager+0x4f0>
ffffffffc0202f60:	00003617          	auipc	a2,0x3
ffffffffc0202f64:	3b860613          	addi	a2,a2,952 # ffffffffc0206318 <commands+0x818>
ffffffffc0202f68:	23900593          	li	a1,569
ffffffffc0202f6c:	00004517          	auipc	a0,0x4
ffffffffc0202f70:	8ac50513          	addi	a0,a0,-1876 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202f74:	d1afd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(boot_pgdir_va[0] == 0);
ffffffffc0202f78:	00004697          	auipc	a3,0x4
ffffffffc0202f7c:	d2868693          	addi	a3,a3,-728 # ffffffffc0206ca0 <default_pmm_manager+0x5d8>
ffffffffc0202f80:	00003617          	auipc	a2,0x3
ffffffffc0202f84:	39860613          	addi	a2,a2,920 # ffffffffc0206318 <commands+0x818>
ffffffffc0202f88:	25700593          	li	a1,599
ffffffffc0202f8c:	00004517          	auipc	a0,0x4
ffffffffc0202f90:	88c50513          	addi	a0,a0,-1908 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202f94:	cfafd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(nr_free_store == nr_free_pages());
ffffffffc0202f98:	00004697          	auipc	a3,0x4
ffffffffc0202f9c:	c6868693          	addi	a3,a3,-920 # ffffffffc0206c00 <default_pmm_manager+0x538>
ffffffffc0202fa0:	00003617          	auipc	a2,0x3
ffffffffc0202fa4:	37860613          	addi	a2,a2,888 # ffffffffc0206318 <commands+0x818>
ffffffffc0202fa8:	24400593          	li	a1,580
ffffffffc0202fac:	00004517          	auipc	a0,0x4
ffffffffc0202fb0:	86c50513          	addi	a0,a0,-1940 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202fb4:	cdafd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_ref(p) == 1);
ffffffffc0202fb8:	00004697          	auipc	a3,0x4
ffffffffc0202fbc:	d4068693          	addi	a3,a3,-704 # ffffffffc0206cf8 <default_pmm_manager+0x630>
ffffffffc0202fc0:	00003617          	auipc	a2,0x3
ffffffffc0202fc4:	35860613          	addi	a2,a2,856 # ffffffffc0206318 <commands+0x818>
ffffffffc0202fc8:	25c00593          	li	a1,604
ffffffffc0202fcc:	00004517          	auipc	a0,0x4
ffffffffc0202fd0:	84c50513          	addi	a0,a0,-1972 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202fd4:	cbafd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_insert(boot_pgdir_va, p, 0x100, PTE_W | PTE_R) == 0);
ffffffffc0202fd8:	00004697          	auipc	a3,0x4
ffffffffc0202fdc:	ce068693          	addi	a3,a3,-800 # ffffffffc0206cb8 <default_pmm_manager+0x5f0>
ffffffffc0202fe0:	00003617          	auipc	a2,0x3
ffffffffc0202fe4:	33860613          	addi	a2,a2,824 # ffffffffc0206318 <commands+0x818>
ffffffffc0202fe8:	25b00593          	li	a1,603
ffffffffc0202fec:	00004517          	auipc	a0,0x4
ffffffffc0202ff0:	82c50513          	addi	a0,a0,-2004 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0202ff4:	c9afd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_ref(p2) == 0);
ffffffffc0202ff8:	00004697          	auipc	a3,0x4
ffffffffc0202ffc:	b9068693          	addi	a3,a3,-1136 # ffffffffc0206b88 <default_pmm_manager+0x4c0>
ffffffffc0203000:	00003617          	auipc	a2,0x3
ffffffffc0203004:	31860613          	addi	a2,a2,792 # ffffffffc0206318 <commands+0x818>
ffffffffc0203008:	23600593          	li	a1,566
ffffffffc020300c:	00004517          	auipc	a0,0x4
ffffffffc0203010:	80c50513          	addi	a0,a0,-2036 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0203014:	c7afd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_ref(p1) == 1);
ffffffffc0203018:	00004697          	auipc	a3,0x4
ffffffffc020301c:	a1068693          	addi	a3,a3,-1520 # ffffffffc0206a28 <default_pmm_manager+0x360>
ffffffffc0203020:	00003617          	auipc	a2,0x3
ffffffffc0203024:	2f860613          	addi	a2,a2,760 # ffffffffc0206318 <commands+0x818>
ffffffffc0203028:	23500593          	li	a1,565
ffffffffc020302c:	00003517          	auipc	a0,0x3
ffffffffc0203030:	7ec50513          	addi	a0,a0,2028 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0203034:	c5afd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert((*ptep & PTE_U) == 0);
ffffffffc0203038:	00004697          	auipc	a3,0x4
ffffffffc020303c:	b6868693          	addi	a3,a3,-1176 # ffffffffc0206ba0 <default_pmm_manager+0x4d8>
ffffffffc0203040:	00003617          	auipc	a2,0x3
ffffffffc0203044:	2d860613          	addi	a2,a2,728 # ffffffffc0206318 <commands+0x818>
ffffffffc0203048:	23200593          	li	a1,562
ffffffffc020304c:	00003517          	auipc	a0,0x3
ffffffffc0203050:	7cc50513          	addi	a0,a0,1996 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0203054:	c3afd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(pte2page(*ptep) == p1);
ffffffffc0203058:	00004697          	auipc	a3,0x4
ffffffffc020305c:	9b868693          	addi	a3,a3,-1608 # ffffffffc0206a10 <default_pmm_manager+0x348>
ffffffffc0203060:	00003617          	auipc	a2,0x3
ffffffffc0203064:	2b860613          	addi	a2,a2,696 # ffffffffc0206318 <commands+0x818>
ffffffffc0203068:	23100593          	li	a1,561
ffffffffc020306c:	00003517          	auipc	a0,0x3
ffffffffc0203070:	7ac50513          	addi	a0,a0,1964 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0203074:	c1afd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert((ptep = get_pte(boot_pgdir_va, PGSIZE, 0)) != NULL);
ffffffffc0203078:	00004697          	auipc	a3,0x4
ffffffffc020307c:	a3868693          	addi	a3,a3,-1480 # ffffffffc0206ab0 <default_pmm_manager+0x3e8>
ffffffffc0203080:	00003617          	auipc	a2,0x3
ffffffffc0203084:	29860613          	addi	a2,a2,664 # ffffffffc0206318 <commands+0x818>
ffffffffc0203088:	23000593          	li	a1,560
ffffffffc020308c:	00003517          	auipc	a0,0x3
ffffffffc0203090:	78c50513          	addi	a0,a0,1932 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0203094:	bfafd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_ref(p2) == 0);
ffffffffc0203098:	00004697          	auipc	a3,0x4
ffffffffc020309c:	af068693          	addi	a3,a3,-1296 # ffffffffc0206b88 <default_pmm_manager+0x4c0>
ffffffffc02030a0:	00003617          	auipc	a2,0x3
ffffffffc02030a4:	27860613          	addi	a2,a2,632 # ffffffffc0206318 <commands+0x818>
ffffffffc02030a8:	22f00593          	li	a1,559
ffffffffc02030ac:	00003517          	auipc	a0,0x3
ffffffffc02030b0:	76c50513          	addi	a0,a0,1900 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc02030b4:	bdafd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_ref(p1) == 2);
ffffffffc02030b8:	00004697          	auipc	a3,0x4
ffffffffc02030bc:	ab868693          	addi	a3,a3,-1352 # ffffffffc0206b70 <default_pmm_manager+0x4a8>
ffffffffc02030c0:	00003617          	auipc	a2,0x3
ffffffffc02030c4:	25860613          	addi	a2,a2,600 # ffffffffc0206318 <commands+0x818>
ffffffffc02030c8:	22e00593          	li	a1,558
ffffffffc02030cc:	00003517          	auipc	a0,0x3
ffffffffc02030d0:	74c50513          	addi	a0,a0,1868 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc02030d4:	bbafd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_insert(boot_pgdir_va, p1, PGSIZE, 0) == 0);
ffffffffc02030d8:	00004697          	auipc	a3,0x4
ffffffffc02030dc:	a6868693          	addi	a3,a3,-1432 # ffffffffc0206b40 <default_pmm_manager+0x478>
ffffffffc02030e0:	00003617          	auipc	a2,0x3
ffffffffc02030e4:	23860613          	addi	a2,a2,568 # ffffffffc0206318 <commands+0x818>
ffffffffc02030e8:	22d00593          	li	a1,557
ffffffffc02030ec:	00003517          	auipc	a0,0x3
ffffffffc02030f0:	72c50513          	addi	a0,a0,1836 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc02030f4:	b9afd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_ref(p2) == 1);
ffffffffc02030f8:	00004697          	auipc	a3,0x4
ffffffffc02030fc:	a3068693          	addi	a3,a3,-1488 # ffffffffc0206b28 <default_pmm_manager+0x460>
ffffffffc0203100:	00003617          	auipc	a2,0x3
ffffffffc0203104:	21860613          	addi	a2,a2,536 # ffffffffc0206318 <commands+0x818>
ffffffffc0203108:	22b00593          	li	a1,555
ffffffffc020310c:	00003517          	auipc	a0,0x3
ffffffffc0203110:	70c50513          	addi	a0,a0,1804 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0203114:	b7afd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(boot_pgdir_va[0] & PTE_U);
ffffffffc0203118:	00004697          	auipc	a3,0x4
ffffffffc020311c:	9f068693          	addi	a3,a3,-1552 # ffffffffc0206b08 <default_pmm_manager+0x440>
ffffffffc0203120:	00003617          	auipc	a2,0x3
ffffffffc0203124:	1f860613          	addi	a2,a2,504 # ffffffffc0206318 <commands+0x818>
ffffffffc0203128:	22a00593          	li	a1,554
ffffffffc020312c:	00003517          	auipc	a0,0x3
ffffffffc0203130:	6ec50513          	addi	a0,a0,1772 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0203134:	b5afd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(*ptep & PTE_W);
ffffffffc0203138:	00004697          	auipc	a3,0x4
ffffffffc020313c:	9c068693          	addi	a3,a3,-1600 # ffffffffc0206af8 <default_pmm_manager+0x430>
ffffffffc0203140:	00003617          	auipc	a2,0x3
ffffffffc0203144:	1d860613          	addi	a2,a2,472 # ffffffffc0206318 <commands+0x818>
ffffffffc0203148:	22900593          	li	a1,553
ffffffffc020314c:	00003517          	auipc	a0,0x3
ffffffffc0203150:	6cc50513          	addi	a0,a0,1740 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0203154:	b3afd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(*ptep & PTE_U);
ffffffffc0203158:	00004697          	auipc	a3,0x4
ffffffffc020315c:	99068693          	addi	a3,a3,-1648 # ffffffffc0206ae8 <default_pmm_manager+0x420>
ffffffffc0203160:	00003617          	auipc	a2,0x3
ffffffffc0203164:	1b860613          	addi	a2,a2,440 # ffffffffc0206318 <commands+0x818>
ffffffffc0203168:	22800593          	li	a1,552
ffffffffc020316c:	00003517          	auipc	a0,0x3
ffffffffc0203170:	6ac50513          	addi	a0,a0,1708 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0203174:	b1afd0ef          	jal	ra,ffffffffc020048e <__panic>
        panic("DTB memory info not available");
ffffffffc0203178:	00003617          	auipc	a2,0x3
ffffffffc020317c:	71060613          	addi	a2,a2,1808 # ffffffffc0206888 <default_pmm_manager+0x1c0>
ffffffffc0203180:	06500593          	li	a1,101
ffffffffc0203184:	00003517          	auipc	a0,0x3
ffffffffc0203188:	69450513          	addi	a0,a0,1684 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc020318c:	b02fd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(nr_free_store == nr_free_pages());
ffffffffc0203190:	00004697          	auipc	a3,0x4
ffffffffc0203194:	a7068693          	addi	a3,a3,-1424 # ffffffffc0206c00 <default_pmm_manager+0x538>
ffffffffc0203198:	00003617          	auipc	a2,0x3
ffffffffc020319c:	18060613          	addi	a2,a2,384 # ffffffffc0206318 <commands+0x818>
ffffffffc02031a0:	26e00593          	li	a1,622
ffffffffc02031a4:	00003517          	auipc	a0,0x3
ffffffffc02031a8:	67450513          	addi	a0,a0,1652 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc02031ac:	ae2fd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert((ptep = get_pte(boot_pgdir_va, PGSIZE, 0)) != NULL);
ffffffffc02031b0:	00004697          	auipc	a3,0x4
ffffffffc02031b4:	90068693          	addi	a3,a3,-1792 # ffffffffc0206ab0 <default_pmm_manager+0x3e8>
ffffffffc02031b8:	00003617          	auipc	a2,0x3
ffffffffc02031bc:	16060613          	addi	a2,a2,352 # ffffffffc0206318 <commands+0x818>
ffffffffc02031c0:	22700593          	li	a1,551
ffffffffc02031c4:	00003517          	auipc	a0,0x3
ffffffffc02031c8:	65450513          	addi	a0,a0,1620 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc02031cc:	ac2fd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_insert(boot_pgdir_va, p2, PGSIZE, PTE_U | PTE_W) == 0);
ffffffffc02031d0:	00004697          	auipc	a3,0x4
ffffffffc02031d4:	8a068693          	addi	a3,a3,-1888 # ffffffffc0206a70 <default_pmm_manager+0x3a8>
ffffffffc02031d8:	00003617          	auipc	a2,0x3
ffffffffc02031dc:	14060613          	addi	a2,a2,320 # ffffffffc0206318 <commands+0x818>
ffffffffc02031e0:	22600593          	li	a1,550
ffffffffc02031e4:	00003517          	auipc	a0,0x3
ffffffffc02031e8:	63450513          	addi	a0,a0,1588 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc02031ec:	aa2fd0ef          	jal	ra,ffffffffc020048e <__panic>
    ptep = (pte_t *)KADDR(PDE_ADDR(ptep[0])) + 1;
ffffffffc02031f0:	86d6                	mv	a3,s5
ffffffffc02031f2:	00003617          	auipc	a2,0x3
ffffffffc02031f6:	50e60613          	addi	a2,a2,1294 # ffffffffc0206700 <default_pmm_manager+0x38>
ffffffffc02031fa:	22200593          	li	a1,546
ffffffffc02031fe:	00003517          	auipc	a0,0x3
ffffffffc0203202:	61a50513          	addi	a0,a0,1562 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0203206:	a88fd0ef          	jal	ra,ffffffffc020048e <__panic>
    ptep = (pte_t *)KADDR(PDE_ADDR(boot_pgdir_va[0]));
ffffffffc020320a:	00003617          	auipc	a2,0x3
ffffffffc020320e:	4f660613          	addi	a2,a2,1270 # ffffffffc0206700 <default_pmm_manager+0x38>
ffffffffc0203212:	22100593          	li	a1,545
ffffffffc0203216:	00003517          	auipc	a0,0x3
ffffffffc020321a:	60250513          	addi	a0,a0,1538 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc020321e:	a70fd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_ref(p1) == 1);
ffffffffc0203222:	00004697          	auipc	a3,0x4
ffffffffc0203226:	80668693          	addi	a3,a3,-2042 # ffffffffc0206a28 <default_pmm_manager+0x360>
ffffffffc020322a:	00003617          	auipc	a2,0x3
ffffffffc020322e:	0ee60613          	addi	a2,a2,238 # ffffffffc0206318 <commands+0x818>
ffffffffc0203232:	21f00593          	li	a1,543
ffffffffc0203236:	00003517          	auipc	a0,0x3
ffffffffc020323a:	5e250513          	addi	a0,a0,1506 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc020323e:	a50fd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(pte2page(*ptep) == p1);
ffffffffc0203242:	00003697          	auipc	a3,0x3
ffffffffc0203246:	7ce68693          	addi	a3,a3,1998 # ffffffffc0206a10 <default_pmm_manager+0x348>
ffffffffc020324a:	00003617          	auipc	a2,0x3
ffffffffc020324e:	0ce60613          	addi	a2,a2,206 # ffffffffc0206318 <commands+0x818>
ffffffffc0203252:	21e00593          	li	a1,542
ffffffffc0203256:	00003517          	auipc	a0,0x3
ffffffffc020325a:	5c250513          	addi	a0,a0,1474 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc020325e:	a30fd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(strlen((const char *)0x100) == 0);
ffffffffc0203262:	00004697          	auipc	a3,0x4
ffffffffc0203266:	b5e68693          	addi	a3,a3,-1186 # ffffffffc0206dc0 <default_pmm_manager+0x6f8>
ffffffffc020326a:	00003617          	auipc	a2,0x3
ffffffffc020326e:	0ae60613          	addi	a2,a2,174 # ffffffffc0206318 <commands+0x818>
ffffffffc0203272:	26500593          	li	a1,613
ffffffffc0203276:	00003517          	auipc	a0,0x3
ffffffffc020327a:	5a250513          	addi	a0,a0,1442 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc020327e:	a10fd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(strcmp((void *)0x100, (void *)(0x100 + PGSIZE)) == 0);
ffffffffc0203282:	00004697          	auipc	a3,0x4
ffffffffc0203286:	b0668693          	addi	a3,a3,-1274 # ffffffffc0206d88 <default_pmm_manager+0x6c0>
ffffffffc020328a:	00003617          	auipc	a2,0x3
ffffffffc020328e:	08e60613          	addi	a2,a2,142 # ffffffffc0206318 <commands+0x818>
ffffffffc0203292:	26200593          	li	a1,610
ffffffffc0203296:	00003517          	auipc	a0,0x3
ffffffffc020329a:	58250513          	addi	a0,a0,1410 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc020329e:	9f0fd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_ref(p) == 2);
ffffffffc02032a2:	00004697          	auipc	a3,0x4
ffffffffc02032a6:	ab668693          	addi	a3,a3,-1354 # ffffffffc0206d58 <default_pmm_manager+0x690>
ffffffffc02032aa:	00003617          	auipc	a2,0x3
ffffffffc02032ae:	06e60613          	addi	a2,a2,110 # ffffffffc0206318 <commands+0x818>
ffffffffc02032b2:	25e00593          	li	a1,606
ffffffffc02032b6:	00003517          	auipc	a0,0x3
ffffffffc02032ba:	56250513          	addi	a0,a0,1378 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc02032be:	9d0fd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_insert(boot_pgdir_va, p, 0x100 + PGSIZE, PTE_W | PTE_R) == 0);
ffffffffc02032c2:	00004697          	auipc	a3,0x4
ffffffffc02032c6:	a4e68693          	addi	a3,a3,-1458 # ffffffffc0206d10 <default_pmm_manager+0x648>
ffffffffc02032ca:	00003617          	auipc	a2,0x3
ffffffffc02032ce:	04e60613          	addi	a2,a2,78 # ffffffffc0206318 <commands+0x818>
ffffffffc02032d2:	25d00593          	li	a1,605
ffffffffc02032d6:	00003517          	auipc	a0,0x3
ffffffffc02032da:	54250513          	addi	a0,a0,1346 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc02032de:	9b0fd0ef          	jal	ra,ffffffffc020048e <__panic>
    boot_pgdir_pa = PADDR(boot_pgdir_va);
ffffffffc02032e2:	00003617          	auipc	a2,0x3
ffffffffc02032e6:	4c660613          	addi	a2,a2,1222 # ffffffffc02067a8 <default_pmm_manager+0xe0>
ffffffffc02032ea:	0c900593          	li	a1,201
ffffffffc02032ee:	00003517          	auipc	a0,0x3
ffffffffc02032f2:	52a50513          	addi	a0,a0,1322 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc02032f6:	998fd0ef          	jal	ra,ffffffffc020048e <__panic>
    uintptr_t freemem = PADDR((uintptr_t)pages + sizeof(struct Page) * (npage - nbase));
ffffffffc02032fa:	00003617          	auipc	a2,0x3
ffffffffc02032fe:	4ae60613          	addi	a2,a2,1198 # ffffffffc02067a8 <default_pmm_manager+0xe0>
ffffffffc0203302:	08100593          	li	a1,129
ffffffffc0203306:	00003517          	auipc	a0,0x3
ffffffffc020330a:	51250513          	addi	a0,a0,1298 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc020330e:	980fd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert((ptep = get_pte(boot_pgdir_va, 0x0, 0)) != NULL);
ffffffffc0203312:	00003697          	auipc	a3,0x3
ffffffffc0203316:	6ce68693          	addi	a3,a3,1742 # ffffffffc02069e0 <default_pmm_manager+0x318>
ffffffffc020331a:	00003617          	auipc	a2,0x3
ffffffffc020331e:	ffe60613          	addi	a2,a2,-2 # ffffffffc0206318 <commands+0x818>
ffffffffc0203322:	21d00593          	li	a1,541
ffffffffc0203326:	00003517          	auipc	a0,0x3
ffffffffc020332a:	4f250513          	addi	a0,a0,1266 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc020332e:	960fd0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(page_insert(boot_pgdir_va, p1, 0x0, 0) == 0);
ffffffffc0203332:	00003697          	auipc	a3,0x3
ffffffffc0203336:	67e68693          	addi	a3,a3,1662 # ffffffffc02069b0 <default_pmm_manager+0x2e8>
ffffffffc020333a:	00003617          	auipc	a2,0x3
ffffffffc020333e:	fde60613          	addi	a2,a2,-34 # ffffffffc0206318 <commands+0x818>
ffffffffc0203342:	21a00593          	li	a1,538
ffffffffc0203346:	00003517          	auipc	a0,0x3
ffffffffc020334a:	4d250513          	addi	a0,a0,1234 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc020334e:	940fd0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0203352 <copy_range>:
{
ffffffffc0203352:	7159                	addi	sp,sp,-112
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc0203354:	00d667b3          	or	a5,a2,a3
{
ffffffffc0203358:	f486                	sd	ra,104(sp)
ffffffffc020335a:	f0a2                	sd	s0,96(sp)
ffffffffc020335c:	eca6                	sd	s1,88(sp)
ffffffffc020335e:	e8ca                	sd	s2,80(sp)
ffffffffc0203360:	e4ce                	sd	s3,72(sp)
ffffffffc0203362:	e0d2                	sd	s4,64(sp)
ffffffffc0203364:	fc56                	sd	s5,56(sp)
ffffffffc0203366:	f85a                	sd	s6,48(sp)
ffffffffc0203368:	f45e                	sd	s7,40(sp)
ffffffffc020336a:	f062                	sd	s8,32(sp)
ffffffffc020336c:	ec66                	sd	s9,24(sp)
ffffffffc020336e:	e86a                	sd	s10,16(sp)
ffffffffc0203370:	e46e                	sd	s11,8(sp)
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc0203372:	17d2                	slli	a5,a5,0x34
ffffffffc0203374:	20079f63          	bnez	a5,ffffffffc0203592 <copy_range+0x240>
    assert(USER_ACCESS(start, end));
ffffffffc0203378:	002007b7          	lui	a5,0x200
ffffffffc020337c:	8432                	mv	s0,a2
ffffffffc020337e:	1af66263          	bltu	a2,a5,ffffffffc0203522 <copy_range+0x1d0>
ffffffffc0203382:	8936                	mv	s2,a3
ffffffffc0203384:	18d67f63          	bgeu	a2,a3,ffffffffc0203522 <copy_range+0x1d0>
ffffffffc0203388:	4785                	li	a5,1
ffffffffc020338a:	07fe                	slli	a5,a5,0x1f
ffffffffc020338c:	18d7eb63          	bltu	a5,a3,ffffffffc0203522 <copy_range+0x1d0>
ffffffffc0203390:	5b7d                	li	s6,-1
ffffffffc0203392:	8aaa                	mv	s5,a0
ffffffffc0203394:	89ae                	mv	s3,a1
        start += PGSIZE;
ffffffffc0203396:	6a05                	lui	s4,0x1
    if (PPN(pa) >= npage)
ffffffffc0203398:	000a7c17          	auipc	s8,0xa7
ffffffffc020339c:	360c0c13          	addi	s8,s8,864 # ffffffffc02aa6f8 <npage>
    return &pages[PPN(pa) - nbase];
ffffffffc02033a0:	000a7b97          	auipc	s7,0xa7
ffffffffc02033a4:	360b8b93          	addi	s7,s7,864 # ffffffffc02aa700 <pages>
    return KADDR(page2pa(page));
ffffffffc02033a8:	00cb5b13          	srli	s6,s6,0xc
        page = pmm_manager->alloc_pages(n);
ffffffffc02033ac:	000a7c97          	auipc	s9,0xa7
ffffffffc02033b0:	35cc8c93          	addi	s9,s9,860 # ffffffffc02aa708 <pmm_manager>
        pte_t *ptep = get_pte(from, start, 0), *nptep;
ffffffffc02033b4:	4601                	li	a2,0
ffffffffc02033b6:	85a2                	mv	a1,s0
ffffffffc02033b8:	854e                	mv	a0,s3
ffffffffc02033ba:	b73fe0ef          	jal	ra,ffffffffc0201f2c <get_pte>
ffffffffc02033be:	84aa                	mv	s1,a0
        if (ptep == NULL)
ffffffffc02033c0:	0e050c63          	beqz	a0,ffffffffc02034b8 <copy_range+0x166>
        if (*ptep & PTE_V)
ffffffffc02033c4:	611c                	ld	a5,0(a0)
ffffffffc02033c6:	8b85                	andi	a5,a5,1
ffffffffc02033c8:	e785                	bnez	a5,ffffffffc02033f0 <copy_range+0x9e>
        start += PGSIZE;
ffffffffc02033ca:	9452                	add	s0,s0,s4
    } while (start != 0 && start < end);
ffffffffc02033cc:	ff2464e3          	bltu	s0,s2,ffffffffc02033b4 <copy_range+0x62>
    return 0;
ffffffffc02033d0:	4501                	li	a0,0
}
ffffffffc02033d2:	70a6                	ld	ra,104(sp)
ffffffffc02033d4:	7406                	ld	s0,96(sp)
ffffffffc02033d6:	64e6                	ld	s1,88(sp)
ffffffffc02033d8:	6946                	ld	s2,80(sp)
ffffffffc02033da:	69a6                	ld	s3,72(sp)
ffffffffc02033dc:	6a06                	ld	s4,64(sp)
ffffffffc02033de:	7ae2                	ld	s5,56(sp)
ffffffffc02033e0:	7b42                	ld	s6,48(sp)
ffffffffc02033e2:	7ba2                	ld	s7,40(sp)
ffffffffc02033e4:	7c02                	ld	s8,32(sp)
ffffffffc02033e6:	6ce2                	ld	s9,24(sp)
ffffffffc02033e8:	6d42                	ld	s10,16(sp)
ffffffffc02033ea:	6da2                	ld	s11,8(sp)
ffffffffc02033ec:	6165                	addi	sp,sp,112
ffffffffc02033ee:	8082                	ret
            if ((nptep = get_pte(to, start, 1)) == NULL)
ffffffffc02033f0:	4605                	li	a2,1
ffffffffc02033f2:	85a2                	mv	a1,s0
ffffffffc02033f4:	8556                	mv	a0,s5
ffffffffc02033f6:	b37fe0ef          	jal	ra,ffffffffc0201f2c <get_pte>
ffffffffc02033fa:	c56d                	beqz	a0,ffffffffc02034e4 <copy_range+0x192>
            uint32_t perm = (*ptep & PTE_USER);
ffffffffc02033fc:	609c                	ld	a5,0(s1)
    if (!(pte & PTE_V))
ffffffffc02033fe:	0017f713          	andi	a4,a5,1
ffffffffc0203402:	01f7f493          	andi	s1,a5,31
ffffffffc0203406:	16070a63          	beqz	a4,ffffffffc020357a <copy_range+0x228>
    if (PPN(pa) >= npage)
ffffffffc020340a:	000c3683          	ld	a3,0(s8)
    return pa2page(PTE_ADDR(pte));
ffffffffc020340e:	078a                	slli	a5,a5,0x2
ffffffffc0203410:	00c7d713          	srli	a4,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc0203414:	14d77763          	bgeu	a4,a3,ffffffffc0203562 <copy_range+0x210>
    return &pages[PPN(pa) - nbase];
ffffffffc0203418:	000bb783          	ld	a5,0(s7)
ffffffffc020341c:	fff806b7          	lui	a3,0xfff80
ffffffffc0203420:	9736                	add	a4,a4,a3
ffffffffc0203422:	071a                	slli	a4,a4,0x6
ffffffffc0203424:	00e78db3          	add	s11,a5,a4
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0203428:	10002773          	csrr	a4,sstatus
ffffffffc020342c:	8b09                	andi	a4,a4,2
ffffffffc020342e:	e345                	bnez	a4,ffffffffc02034ce <copy_range+0x17c>
        page = pmm_manager->alloc_pages(n);
ffffffffc0203430:	000cb703          	ld	a4,0(s9)
ffffffffc0203434:	4505                	li	a0,1
ffffffffc0203436:	6f18                	ld	a4,24(a4)
ffffffffc0203438:	9702                	jalr	a4
ffffffffc020343a:	8d2a                	mv	s10,a0
            assert(page != NULL);
ffffffffc020343c:	0c0d8363          	beqz	s11,ffffffffc0203502 <copy_range+0x1b0>
            assert(npage != NULL);
ffffffffc0203440:	100d0163          	beqz	s10,ffffffffc0203542 <copy_range+0x1f0>
    return page - pages + nbase;
ffffffffc0203444:	000bb703          	ld	a4,0(s7)
ffffffffc0203448:	000805b7          	lui	a1,0x80
    return KADDR(page2pa(page));
ffffffffc020344c:	000c3603          	ld	a2,0(s8)
    return page - pages + nbase;
ffffffffc0203450:	40ed86b3          	sub	a3,s11,a4
ffffffffc0203454:	8699                	srai	a3,a3,0x6
ffffffffc0203456:	96ae                	add	a3,a3,a1
    return KADDR(page2pa(page));
ffffffffc0203458:	0166f7b3          	and	a5,a3,s6
    return page2ppn(page) << PGSHIFT;
ffffffffc020345c:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc020345e:	08c7f663          	bgeu	a5,a2,ffffffffc02034ea <copy_range+0x198>
    return page - pages + nbase;
ffffffffc0203462:	40ed07b3          	sub	a5,s10,a4
    return KADDR(page2pa(page));
ffffffffc0203466:	000a7717          	auipc	a4,0xa7
ffffffffc020346a:	2aa70713          	addi	a4,a4,682 # ffffffffc02aa710 <va_pa_offset>
ffffffffc020346e:	6308                	ld	a0,0(a4)
    return page - pages + nbase;
ffffffffc0203470:	8799                	srai	a5,a5,0x6
ffffffffc0203472:	97ae                	add	a5,a5,a1
    return KADDR(page2pa(page));
ffffffffc0203474:	0167f733          	and	a4,a5,s6
ffffffffc0203478:	00a685b3          	add	a1,a3,a0
    return page2ppn(page) << PGSHIFT;
ffffffffc020347c:	07b2                	slli	a5,a5,0xc
    return KADDR(page2pa(page));
ffffffffc020347e:	06c77563          	bgeu	a4,a2,ffffffffc02034e8 <copy_range+0x196>
            memcpy(dst_kvaddr, src_kvaddr, PGSIZE);
ffffffffc0203482:	6605                	lui	a2,0x1
ffffffffc0203484:	953e                	add	a0,a0,a5
ffffffffc0203486:	3f6020ef          	jal	ra,ffffffffc020587c <memcpy>
            ret = page_insert(to, npage, start, perm);
ffffffffc020348a:	86a6                	mv	a3,s1
ffffffffc020348c:	8622                	mv	a2,s0
ffffffffc020348e:	85ea                	mv	a1,s10
ffffffffc0203490:	8556                	mv	a0,s5
ffffffffc0203492:	98aff0ef          	jal	ra,ffffffffc020261c <page_insert>
            assert(ret == 0);
ffffffffc0203496:	d915                	beqz	a0,ffffffffc02033ca <copy_range+0x78>
ffffffffc0203498:	00004697          	auipc	a3,0x4
ffffffffc020349c:	99068693          	addi	a3,a3,-1648 # ffffffffc0206e28 <default_pmm_manager+0x760>
ffffffffc02034a0:	00003617          	auipc	a2,0x3
ffffffffc02034a4:	e7860613          	addi	a2,a2,-392 # ffffffffc0206318 <commands+0x818>
ffffffffc02034a8:	1b200593          	li	a1,434
ffffffffc02034ac:	00003517          	auipc	a0,0x3
ffffffffc02034b0:	36c50513          	addi	a0,a0,876 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc02034b4:	fdbfc0ef          	jal	ra,ffffffffc020048e <__panic>
            start = ROUNDDOWN(start + PTSIZE, PTSIZE);
ffffffffc02034b8:	00200637          	lui	a2,0x200
ffffffffc02034bc:	9432                	add	s0,s0,a2
ffffffffc02034be:	ffe00637          	lui	a2,0xffe00
ffffffffc02034c2:	8c71                	and	s0,s0,a2
    } while (start != 0 && start < end);
ffffffffc02034c4:	f00406e3          	beqz	s0,ffffffffc02033d0 <copy_range+0x7e>
ffffffffc02034c8:	ef2466e3          	bltu	s0,s2,ffffffffc02033b4 <copy_range+0x62>
ffffffffc02034cc:	b711                	j	ffffffffc02033d0 <copy_range+0x7e>
        intr_disable();
ffffffffc02034ce:	ce6fd0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        page = pmm_manager->alloc_pages(n);
ffffffffc02034d2:	000cb703          	ld	a4,0(s9)
ffffffffc02034d6:	4505                	li	a0,1
ffffffffc02034d8:	6f18                	ld	a4,24(a4)
ffffffffc02034da:	9702                	jalr	a4
ffffffffc02034dc:	8d2a                	mv	s10,a0
        intr_enable();
ffffffffc02034de:	cd0fd0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc02034e2:	bfa9                	j	ffffffffc020343c <copy_range+0xea>
                return -E_NO_MEM;
ffffffffc02034e4:	5571                	li	a0,-4
ffffffffc02034e6:	b5f5                	j	ffffffffc02033d2 <copy_range+0x80>
ffffffffc02034e8:	86be                	mv	a3,a5
ffffffffc02034ea:	00003617          	auipc	a2,0x3
ffffffffc02034ee:	21660613          	addi	a2,a2,534 # ffffffffc0206700 <default_pmm_manager+0x38>
ffffffffc02034f2:	07100593          	li	a1,113
ffffffffc02034f6:	00003517          	auipc	a0,0x3
ffffffffc02034fa:	23250513          	addi	a0,a0,562 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc02034fe:	f91fc0ef          	jal	ra,ffffffffc020048e <__panic>
            assert(page != NULL);
ffffffffc0203502:	00004697          	auipc	a3,0x4
ffffffffc0203506:	90668693          	addi	a3,a3,-1786 # ffffffffc0206e08 <default_pmm_manager+0x740>
ffffffffc020350a:	00003617          	auipc	a2,0x3
ffffffffc020350e:	e0e60613          	addi	a2,a2,-498 # ffffffffc0206318 <commands+0x818>
ffffffffc0203512:	19400593          	li	a1,404
ffffffffc0203516:	00003517          	auipc	a0,0x3
ffffffffc020351a:	30250513          	addi	a0,a0,770 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc020351e:	f71fc0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(USER_ACCESS(start, end));
ffffffffc0203522:	00003697          	auipc	a3,0x3
ffffffffc0203526:	33668693          	addi	a3,a3,822 # ffffffffc0206858 <default_pmm_manager+0x190>
ffffffffc020352a:	00003617          	auipc	a2,0x3
ffffffffc020352e:	dee60613          	addi	a2,a2,-530 # ffffffffc0206318 <commands+0x818>
ffffffffc0203532:	17c00593          	li	a1,380
ffffffffc0203536:	00003517          	auipc	a0,0x3
ffffffffc020353a:	2e250513          	addi	a0,a0,738 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc020353e:	f51fc0ef          	jal	ra,ffffffffc020048e <__panic>
            assert(npage != NULL);
ffffffffc0203542:	00004697          	auipc	a3,0x4
ffffffffc0203546:	8d668693          	addi	a3,a3,-1834 # ffffffffc0206e18 <default_pmm_manager+0x750>
ffffffffc020354a:	00003617          	auipc	a2,0x3
ffffffffc020354e:	dce60613          	addi	a2,a2,-562 # ffffffffc0206318 <commands+0x818>
ffffffffc0203552:	19500593          	li	a1,405
ffffffffc0203556:	00003517          	auipc	a0,0x3
ffffffffc020355a:	2c250513          	addi	a0,a0,706 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc020355e:	f31fc0ef          	jal	ra,ffffffffc020048e <__panic>
        panic("pa2page called with invalid pa");
ffffffffc0203562:	00003617          	auipc	a2,0x3
ffffffffc0203566:	26e60613          	addi	a2,a2,622 # ffffffffc02067d0 <default_pmm_manager+0x108>
ffffffffc020356a:	06900593          	li	a1,105
ffffffffc020356e:	00003517          	auipc	a0,0x3
ffffffffc0203572:	1ba50513          	addi	a0,a0,442 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc0203576:	f19fc0ef          	jal	ra,ffffffffc020048e <__panic>
        panic("pte2page called with invalid pte");
ffffffffc020357a:	00003617          	auipc	a2,0x3
ffffffffc020357e:	27660613          	addi	a2,a2,630 # ffffffffc02067f0 <default_pmm_manager+0x128>
ffffffffc0203582:	07f00593          	li	a1,127
ffffffffc0203586:	00003517          	auipc	a0,0x3
ffffffffc020358a:	1a250513          	addi	a0,a0,418 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc020358e:	f01fc0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc0203592:	00003697          	auipc	a3,0x3
ffffffffc0203596:	29668693          	addi	a3,a3,662 # ffffffffc0206828 <default_pmm_manager+0x160>
ffffffffc020359a:	00003617          	auipc	a2,0x3
ffffffffc020359e:	d7e60613          	addi	a2,a2,-642 # ffffffffc0206318 <commands+0x818>
ffffffffc02035a2:	17b00593          	li	a1,379
ffffffffc02035a6:	00003517          	auipc	a0,0x3
ffffffffc02035aa:	27250513          	addi	a0,a0,626 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc02035ae:	ee1fc0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc02035b2 <pgdir_alloc_page>:
{
ffffffffc02035b2:	7179                	addi	sp,sp,-48
ffffffffc02035b4:	ec26                	sd	s1,24(sp)
ffffffffc02035b6:	e84a                	sd	s2,16(sp)
ffffffffc02035b8:	e052                	sd	s4,0(sp)
ffffffffc02035ba:	f406                	sd	ra,40(sp)
ffffffffc02035bc:	f022                	sd	s0,32(sp)
ffffffffc02035be:	e44e                	sd	s3,8(sp)
ffffffffc02035c0:	8a2a                	mv	s4,a0
ffffffffc02035c2:	84ae                	mv	s1,a1
ffffffffc02035c4:	8932                	mv	s2,a2
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02035c6:	100027f3          	csrr	a5,sstatus
ffffffffc02035ca:	8b89                	andi	a5,a5,2
        page = pmm_manager->alloc_pages(n);
ffffffffc02035cc:	000a7997          	auipc	s3,0xa7
ffffffffc02035d0:	13c98993          	addi	s3,s3,316 # ffffffffc02aa708 <pmm_manager>
ffffffffc02035d4:	ef8d                	bnez	a5,ffffffffc020360e <pgdir_alloc_page+0x5c>
ffffffffc02035d6:	0009b783          	ld	a5,0(s3)
ffffffffc02035da:	4505                	li	a0,1
ffffffffc02035dc:	6f9c                	ld	a5,24(a5)
ffffffffc02035de:	9782                	jalr	a5
ffffffffc02035e0:	842a                	mv	s0,a0
    if (page != NULL)
ffffffffc02035e2:	cc09                	beqz	s0,ffffffffc02035fc <pgdir_alloc_page+0x4a>
        if (page_insert(pgdir, page, la, perm) != 0)
ffffffffc02035e4:	86ca                	mv	a3,s2
ffffffffc02035e6:	8626                	mv	a2,s1
ffffffffc02035e8:	85a2                	mv	a1,s0
ffffffffc02035ea:	8552                	mv	a0,s4
ffffffffc02035ec:	830ff0ef          	jal	ra,ffffffffc020261c <page_insert>
ffffffffc02035f0:	e915                	bnez	a0,ffffffffc0203624 <pgdir_alloc_page+0x72>
        assert(page_ref(page) == 1);
ffffffffc02035f2:	4018                	lw	a4,0(s0)
        page->pra_vaddr = la;
ffffffffc02035f4:	fc04                	sd	s1,56(s0)
        assert(page_ref(page) == 1);
ffffffffc02035f6:	4785                	li	a5,1
ffffffffc02035f8:	04f71e63          	bne	a4,a5,ffffffffc0203654 <pgdir_alloc_page+0xa2>
}
ffffffffc02035fc:	70a2                	ld	ra,40(sp)
ffffffffc02035fe:	8522                	mv	a0,s0
ffffffffc0203600:	7402                	ld	s0,32(sp)
ffffffffc0203602:	64e2                	ld	s1,24(sp)
ffffffffc0203604:	6942                	ld	s2,16(sp)
ffffffffc0203606:	69a2                	ld	s3,8(sp)
ffffffffc0203608:	6a02                	ld	s4,0(sp)
ffffffffc020360a:	6145                	addi	sp,sp,48
ffffffffc020360c:	8082                	ret
        intr_disable();
ffffffffc020360e:	ba6fd0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        page = pmm_manager->alloc_pages(n);
ffffffffc0203612:	0009b783          	ld	a5,0(s3)
ffffffffc0203616:	4505                	li	a0,1
ffffffffc0203618:	6f9c                	ld	a5,24(a5)
ffffffffc020361a:	9782                	jalr	a5
ffffffffc020361c:	842a                	mv	s0,a0
        intr_enable();
ffffffffc020361e:	b90fd0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0203622:	b7c1                	j	ffffffffc02035e2 <pgdir_alloc_page+0x30>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0203624:	100027f3          	csrr	a5,sstatus
ffffffffc0203628:	8b89                	andi	a5,a5,2
ffffffffc020362a:	eb89                	bnez	a5,ffffffffc020363c <pgdir_alloc_page+0x8a>
        pmm_manager->free_pages(base, n);
ffffffffc020362c:	0009b783          	ld	a5,0(s3)
ffffffffc0203630:	8522                	mv	a0,s0
ffffffffc0203632:	4585                	li	a1,1
ffffffffc0203634:	739c                	ld	a5,32(a5)
            return NULL;
ffffffffc0203636:	4401                	li	s0,0
        pmm_manager->free_pages(base, n);
ffffffffc0203638:	9782                	jalr	a5
    if (flag)
ffffffffc020363a:	b7c9                	j	ffffffffc02035fc <pgdir_alloc_page+0x4a>
        intr_disable();
ffffffffc020363c:	b78fd0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
ffffffffc0203640:	0009b783          	ld	a5,0(s3)
ffffffffc0203644:	8522                	mv	a0,s0
ffffffffc0203646:	4585                	li	a1,1
ffffffffc0203648:	739c                	ld	a5,32(a5)
            return NULL;
ffffffffc020364a:	4401                	li	s0,0
        pmm_manager->free_pages(base, n);
ffffffffc020364c:	9782                	jalr	a5
        intr_enable();
ffffffffc020364e:	b60fd0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0203652:	b76d                	j	ffffffffc02035fc <pgdir_alloc_page+0x4a>
        assert(page_ref(page) == 1);
ffffffffc0203654:	00003697          	auipc	a3,0x3
ffffffffc0203658:	7e468693          	addi	a3,a3,2020 # ffffffffc0206e38 <default_pmm_manager+0x770>
ffffffffc020365c:	00003617          	auipc	a2,0x3
ffffffffc0203660:	cbc60613          	addi	a2,a2,-836 # ffffffffc0206318 <commands+0x818>
ffffffffc0203664:	1fb00593          	li	a1,507
ffffffffc0203668:	00003517          	auipc	a0,0x3
ffffffffc020366c:	1b050513          	addi	a0,a0,432 # ffffffffc0206818 <default_pmm_manager+0x150>
ffffffffc0203670:	e1ffc0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0203674 <check_vma_overlap.part.0>:
    return vma;
}

// check_vma_overlap - check if vma1 overlaps vma2 ?
static inline void
check_vma_overlap(struct vma_struct *prev, struct vma_struct *next)
ffffffffc0203674:	1141                	addi	sp,sp,-16
{
    assert(prev->vm_start < prev->vm_end);
    assert(prev->vm_end <= next->vm_start);
    assert(next->vm_start < next->vm_end);
ffffffffc0203676:	00003697          	auipc	a3,0x3
ffffffffc020367a:	7da68693          	addi	a3,a3,2010 # ffffffffc0206e50 <default_pmm_manager+0x788>
ffffffffc020367e:	00003617          	auipc	a2,0x3
ffffffffc0203682:	c9a60613          	addi	a2,a2,-870 # ffffffffc0206318 <commands+0x818>
ffffffffc0203686:	07400593          	li	a1,116
ffffffffc020368a:	00003517          	auipc	a0,0x3
ffffffffc020368e:	7e650513          	addi	a0,a0,2022 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
check_vma_overlap(struct vma_struct *prev, struct vma_struct *next)
ffffffffc0203692:	e406                	sd	ra,8(sp)
    assert(next->vm_start < next->vm_end);
ffffffffc0203694:	dfbfc0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0203698 <mm_create>:
{
ffffffffc0203698:	1141                	addi	sp,sp,-16
    struct mm_struct *mm = kmalloc(sizeof(struct mm_struct));
ffffffffc020369a:	04000513          	li	a0,64
{
ffffffffc020369e:	e406                	sd	ra,8(sp)
    struct mm_struct *mm = kmalloc(sizeof(struct mm_struct));
ffffffffc02036a0:	df6fe0ef          	jal	ra,ffffffffc0201c96 <kmalloc>
    if (mm != NULL)
ffffffffc02036a4:	cd19                	beqz	a0,ffffffffc02036c2 <mm_create+0x2a>
    elm->prev = elm->next = elm;
ffffffffc02036a6:	e508                	sd	a0,8(a0)
ffffffffc02036a8:	e108                	sd	a0,0(a0)
        mm->mmap_cache = NULL;
ffffffffc02036aa:	00053823          	sd	zero,16(a0)
        mm->pgdir = NULL;
ffffffffc02036ae:	00053c23          	sd	zero,24(a0)
        mm->map_count = 0;
ffffffffc02036b2:	02052023          	sw	zero,32(a0)
        mm->sm_priv = NULL;
ffffffffc02036b6:	02053423          	sd	zero,40(a0)
}

static inline void
set_mm_count(struct mm_struct *mm, int val)
{
    mm->mm_count = val;
ffffffffc02036ba:	02052823          	sw	zero,48(a0)
typedef volatile bool lock_t;

static inline void
lock_init(lock_t *lock)
{
    *lock = 0;
ffffffffc02036be:	02053c23          	sd	zero,56(a0)
}
ffffffffc02036c2:	60a2                	ld	ra,8(sp)
ffffffffc02036c4:	0141                	addi	sp,sp,16
ffffffffc02036c6:	8082                	ret

ffffffffc02036c8 <find_vma>:
{
ffffffffc02036c8:	86aa                	mv	a3,a0
    if (mm != NULL)
ffffffffc02036ca:	c505                	beqz	a0,ffffffffc02036f2 <find_vma+0x2a>
        vma = mm->mmap_cache;
ffffffffc02036cc:	6908                	ld	a0,16(a0)
        if (!(vma != NULL && vma->vm_start <= addr && vma->vm_end > addr))
ffffffffc02036ce:	c501                	beqz	a0,ffffffffc02036d6 <find_vma+0xe>
ffffffffc02036d0:	651c                	ld	a5,8(a0)
ffffffffc02036d2:	02f5f263          	bgeu	a1,a5,ffffffffc02036f6 <find_vma+0x2e>
    return listelm->next;
ffffffffc02036d6:	669c                	ld	a5,8(a3)
            while ((le = list_next(le)) != list)
ffffffffc02036d8:	00f68d63          	beq	a3,a5,ffffffffc02036f2 <find_vma+0x2a>
                if (vma->vm_start <= addr && addr < vma->vm_end)
ffffffffc02036dc:	fe87b703          	ld	a4,-24(a5) # 1fffe8 <_binary_obj___user_exit_out_size+0x1f4ec8>
ffffffffc02036e0:	00e5e663          	bltu	a1,a4,ffffffffc02036ec <find_vma+0x24>
ffffffffc02036e4:	ff07b703          	ld	a4,-16(a5)
ffffffffc02036e8:	00e5ec63          	bltu	a1,a4,ffffffffc0203700 <find_vma+0x38>
ffffffffc02036ec:	679c                	ld	a5,8(a5)
            while ((le = list_next(le)) != list)
ffffffffc02036ee:	fef697e3          	bne	a3,a5,ffffffffc02036dc <find_vma+0x14>
    struct vma_struct *vma = NULL;
ffffffffc02036f2:	4501                	li	a0,0
}
ffffffffc02036f4:	8082                	ret
        if (!(vma != NULL && vma->vm_start <= addr && vma->vm_end > addr))
ffffffffc02036f6:	691c                	ld	a5,16(a0)
ffffffffc02036f8:	fcf5ffe3          	bgeu	a1,a5,ffffffffc02036d6 <find_vma+0xe>
            mm->mmap_cache = vma;
ffffffffc02036fc:	ea88                	sd	a0,16(a3)
ffffffffc02036fe:	8082                	ret
                vma = le2vma(le, list_link);
ffffffffc0203700:	fe078513          	addi	a0,a5,-32
            mm->mmap_cache = vma;
ffffffffc0203704:	ea88                	sd	a0,16(a3)
ffffffffc0203706:	8082                	ret

ffffffffc0203708 <insert_vma_struct>:
}

// insert_vma_struct -insert vma in mm's list link
void insert_vma_struct(struct mm_struct *mm, struct vma_struct *vma)
{
    assert(vma->vm_start < vma->vm_end);
ffffffffc0203708:	6590                	ld	a2,8(a1)
ffffffffc020370a:	0105b803          	ld	a6,16(a1) # 80010 <_binary_obj___user_exit_out_size+0x74ef0>
{
ffffffffc020370e:	1141                	addi	sp,sp,-16
ffffffffc0203710:	e406                	sd	ra,8(sp)
ffffffffc0203712:	87aa                	mv	a5,a0
    assert(vma->vm_start < vma->vm_end);
ffffffffc0203714:	01066763          	bltu	a2,a6,ffffffffc0203722 <insert_vma_struct+0x1a>
ffffffffc0203718:	a085                	j	ffffffffc0203778 <insert_vma_struct+0x70>

    list_entry_t *le = list;
    while ((le = list_next(le)) != list)
    {
        struct vma_struct *mmap_prev = le2vma(le, list_link);
        if (mmap_prev->vm_start > vma->vm_start)
ffffffffc020371a:	fe87b703          	ld	a4,-24(a5)
ffffffffc020371e:	04e66863          	bltu	a2,a4,ffffffffc020376e <insert_vma_struct+0x66>
ffffffffc0203722:	86be                	mv	a3,a5
ffffffffc0203724:	679c                	ld	a5,8(a5)
    while ((le = list_next(le)) != list)
ffffffffc0203726:	fef51ae3          	bne	a0,a5,ffffffffc020371a <insert_vma_struct+0x12>
    }

    le_next = list_next(le_prev);

    /* check overlap */
    if (le_prev != list)
ffffffffc020372a:	02a68463          	beq	a3,a0,ffffffffc0203752 <insert_vma_struct+0x4a>
    {
        check_vma_overlap(le2vma(le_prev, list_link), vma);
ffffffffc020372e:	ff06b703          	ld	a4,-16(a3)
    assert(prev->vm_start < prev->vm_end);
ffffffffc0203732:	fe86b883          	ld	a7,-24(a3)
ffffffffc0203736:	08e8f163          	bgeu	a7,a4,ffffffffc02037b8 <insert_vma_struct+0xb0>
    assert(prev->vm_end <= next->vm_start);
ffffffffc020373a:	04e66f63          	bltu	a2,a4,ffffffffc0203798 <insert_vma_struct+0x90>
    }
    if (le_next != list)
ffffffffc020373e:	00f50a63          	beq	a0,a5,ffffffffc0203752 <insert_vma_struct+0x4a>
        if (mmap_prev->vm_start > vma->vm_start)
ffffffffc0203742:	fe87b703          	ld	a4,-24(a5)
    assert(prev->vm_end <= next->vm_start);
ffffffffc0203746:	05076963          	bltu	a4,a6,ffffffffc0203798 <insert_vma_struct+0x90>
    assert(next->vm_start < next->vm_end);
ffffffffc020374a:	ff07b603          	ld	a2,-16(a5)
ffffffffc020374e:	02c77363          	bgeu	a4,a2,ffffffffc0203774 <insert_vma_struct+0x6c>
    }

    vma->vm_mm = mm;
    list_add_after(le_prev, &(vma->list_link));

    mm->map_count++;
ffffffffc0203752:	5118                	lw	a4,32(a0)
    vma->vm_mm = mm;
ffffffffc0203754:	e188                	sd	a0,0(a1)
    list_add_after(le_prev, &(vma->list_link));
ffffffffc0203756:	02058613          	addi	a2,a1,32
    prev->next = next->prev = elm;
ffffffffc020375a:	e390                	sd	a2,0(a5)
ffffffffc020375c:	e690                	sd	a2,8(a3)
}
ffffffffc020375e:	60a2                	ld	ra,8(sp)
    elm->next = next;
ffffffffc0203760:	f59c                	sd	a5,40(a1)
    elm->prev = prev;
ffffffffc0203762:	f194                	sd	a3,32(a1)
    mm->map_count++;
ffffffffc0203764:	0017079b          	addiw	a5,a4,1
ffffffffc0203768:	d11c                	sw	a5,32(a0)
}
ffffffffc020376a:	0141                	addi	sp,sp,16
ffffffffc020376c:	8082                	ret
    if (le_prev != list)
ffffffffc020376e:	fca690e3          	bne	a3,a0,ffffffffc020372e <insert_vma_struct+0x26>
ffffffffc0203772:	bfd1                	j	ffffffffc0203746 <insert_vma_struct+0x3e>
ffffffffc0203774:	f01ff0ef          	jal	ra,ffffffffc0203674 <check_vma_overlap.part.0>
    assert(vma->vm_start < vma->vm_end);
ffffffffc0203778:	00003697          	auipc	a3,0x3
ffffffffc020377c:	70868693          	addi	a3,a3,1800 # ffffffffc0206e80 <default_pmm_manager+0x7b8>
ffffffffc0203780:	00003617          	auipc	a2,0x3
ffffffffc0203784:	b9860613          	addi	a2,a2,-1128 # ffffffffc0206318 <commands+0x818>
ffffffffc0203788:	07a00593          	li	a1,122
ffffffffc020378c:	00003517          	auipc	a0,0x3
ffffffffc0203790:	6e450513          	addi	a0,a0,1764 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203794:	cfbfc0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(prev->vm_end <= next->vm_start);
ffffffffc0203798:	00003697          	auipc	a3,0x3
ffffffffc020379c:	72868693          	addi	a3,a3,1832 # ffffffffc0206ec0 <default_pmm_manager+0x7f8>
ffffffffc02037a0:	00003617          	auipc	a2,0x3
ffffffffc02037a4:	b7860613          	addi	a2,a2,-1160 # ffffffffc0206318 <commands+0x818>
ffffffffc02037a8:	07300593          	li	a1,115
ffffffffc02037ac:	00003517          	auipc	a0,0x3
ffffffffc02037b0:	6c450513          	addi	a0,a0,1732 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc02037b4:	cdbfc0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(prev->vm_start < prev->vm_end);
ffffffffc02037b8:	00003697          	auipc	a3,0x3
ffffffffc02037bc:	6e868693          	addi	a3,a3,1768 # ffffffffc0206ea0 <default_pmm_manager+0x7d8>
ffffffffc02037c0:	00003617          	auipc	a2,0x3
ffffffffc02037c4:	b5860613          	addi	a2,a2,-1192 # ffffffffc0206318 <commands+0x818>
ffffffffc02037c8:	07200593          	li	a1,114
ffffffffc02037cc:	00003517          	auipc	a0,0x3
ffffffffc02037d0:	6a450513          	addi	a0,a0,1700 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc02037d4:	cbbfc0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc02037d8 <mm_destroy>:

// mm_destroy - free mm and mm internal fields
void mm_destroy(struct mm_struct *mm)
{
    assert(mm_count(mm) == 0);
ffffffffc02037d8:	591c                	lw	a5,48(a0)
{
ffffffffc02037da:	1141                	addi	sp,sp,-16
ffffffffc02037dc:	e406                	sd	ra,8(sp)
ffffffffc02037de:	e022                	sd	s0,0(sp)
    assert(mm_count(mm) == 0);
ffffffffc02037e0:	e78d                	bnez	a5,ffffffffc020380a <mm_destroy+0x32>
ffffffffc02037e2:	842a                	mv	s0,a0
    return listelm->next;
ffffffffc02037e4:	6508                	ld	a0,8(a0)

    list_entry_t *list = &(mm->mmap_list), *le;
    while ((le = list_next(list)) != list)
ffffffffc02037e6:	00a40c63          	beq	s0,a0,ffffffffc02037fe <mm_destroy+0x26>
    __list_del(listelm->prev, listelm->next);
ffffffffc02037ea:	6118                	ld	a4,0(a0)
ffffffffc02037ec:	651c                	ld	a5,8(a0)
    {
        list_del(le);
        kfree(le2vma(le, list_link)); // kfree vma
ffffffffc02037ee:	1501                	addi	a0,a0,-32
    prev->next = next;
ffffffffc02037f0:	e71c                	sd	a5,8(a4)
    next->prev = prev;
ffffffffc02037f2:	e398                	sd	a4,0(a5)
ffffffffc02037f4:	d52fe0ef          	jal	ra,ffffffffc0201d46 <kfree>
    return listelm->next;
ffffffffc02037f8:	6408                	ld	a0,8(s0)
    while ((le = list_next(list)) != list)
ffffffffc02037fa:	fea418e3          	bne	s0,a0,ffffffffc02037ea <mm_destroy+0x12>
    }
    kfree(mm); // kfree mm
ffffffffc02037fe:	8522                	mv	a0,s0
    mm = NULL;
}
ffffffffc0203800:	6402                	ld	s0,0(sp)
ffffffffc0203802:	60a2                	ld	ra,8(sp)
ffffffffc0203804:	0141                	addi	sp,sp,16
    kfree(mm); // kfree mm
ffffffffc0203806:	d40fe06f          	j	ffffffffc0201d46 <kfree>
    assert(mm_count(mm) == 0);
ffffffffc020380a:	00003697          	auipc	a3,0x3
ffffffffc020380e:	6d668693          	addi	a3,a3,1750 # ffffffffc0206ee0 <default_pmm_manager+0x818>
ffffffffc0203812:	00003617          	auipc	a2,0x3
ffffffffc0203816:	b0660613          	addi	a2,a2,-1274 # ffffffffc0206318 <commands+0x818>
ffffffffc020381a:	09e00593          	li	a1,158
ffffffffc020381e:	00003517          	auipc	a0,0x3
ffffffffc0203822:	65250513          	addi	a0,a0,1618 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203826:	c69fc0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc020382a <mm_map>:

int mm_map(struct mm_struct *mm, uintptr_t addr, size_t len, uint32_t vm_flags,
           struct vma_struct **vma_store)
{
ffffffffc020382a:	7139                	addi	sp,sp,-64
ffffffffc020382c:	f822                	sd	s0,48(sp)
    uintptr_t start = ROUNDDOWN(addr, PGSIZE), end = ROUNDUP(addr + len, PGSIZE);
ffffffffc020382e:	6405                	lui	s0,0x1
ffffffffc0203830:	147d                	addi	s0,s0,-1
ffffffffc0203832:	77fd                	lui	a5,0xfffff
ffffffffc0203834:	9622                	add	a2,a2,s0
ffffffffc0203836:	962e                	add	a2,a2,a1
{
ffffffffc0203838:	f426                	sd	s1,40(sp)
ffffffffc020383a:	fc06                	sd	ra,56(sp)
    uintptr_t start = ROUNDDOWN(addr, PGSIZE), end = ROUNDUP(addr + len, PGSIZE);
ffffffffc020383c:	00f5f4b3          	and	s1,a1,a5
{
ffffffffc0203840:	f04a                	sd	s2,32(sp)
ffffffffc0203842:	ec4e                	sd	s3,24(sp)
ffffffffc0203844:	e852                	sd	s4,16(sp)
ffffffffc0203846:	e456                	sd	s5,8(sp)
    if (!USER_ACCESS(start, end))
ffffffffc0203848:	002005b7          	lui	a1,0x200
ffffffffc020384c:	00f67433          	and	s0,a2,a5
ffffffffc0203850:	06b4e363          	bltu	s1,a1,ffffffffc02038b6 <mm_map+0x8c>
ffffffffc0203854:	0684f163          	bgeu	s1,s0,ffffffffc02038b6 <mm_map+0x8c>
ffffffffc0203858:	4785                	li	a5,1
ffffffffc020385a:	07fe                	slli	a5,a5,0x1f
ffffffffc020385c:	0487ed63          	bltu	a5,s0,ffffffffc02038b6 <mm_map+0x8c>
ffffffffc0203860:	89aa                	mv	s3,a0
    {
        return -E_INVAL;
    }

    assert(mm != NULL);
ffffffffc0203862:	cd21                	beqz	a0,ffffffffc02038ba <mm_map+0x90>

    int ret = -E_INVAL;

    struct vma_struct *vma;
    if ((vma = find_vma(mm, start)) != NULL && end > vma->vm_start)
ffffffffc0203864:	85a6                	mv	a1,s1
ffffffffc0203866:	8ab6                	mv	s5,a3
ffffffffc0203868:	8a3a                	mv	s4,a4
ffffffffc020386a:	e5fff0ef          	jal	ra,ffffffffc02036c8 <find_vma>
ffffffffc020386e:	c501                	beqz	a0,ffffffffc0203876 <mm_map+0x4c>
ffffffffc0203870:	651c                	ld	a5,8(a0)
ffffffffc0203872:	0487e263          	bltu	a5,s0,ffffffffc02038b6 <mm_map+0x8c>
    struct vma_struct *vma = kmalloc(sizeof(struct vma_struct));
ffffffffc0203876:	03000513          	li	a0,48
ffffffffc020387a:	c1cfe0ef          	jal	ra,ffffffffc0201c96 <kmalloc>
ffffffffc020387e:	892a                	mv	s2,a0
    {
        goto out;
    }
    ret = -E_NO_MEM;
ffffffffc0203880:	5571                	li	a0,-4
    if (vma != NULL)
ffffffffc0203882:	02090163          	beqz	s2,ffffffffc02038a4 <mm_map+0x7a>

    if ((vma = vma_create(start, end, vm_flags)) == NULL)
    {
        goto out;
    }
    insert_vma_struct(mm, vma);
ffffffffc0203886:	854e                	mv	a0,s3
        vma->vm_start = vm_start;
ffffffffc0203888:	00993423          	sd	s1,8(s2)
        vma->vm_end = vm_end;
ffffffffc020388c:	00893823          	sd	s0,16(s2)
        vma->vm_flags = vm_flags;
ffffffffc0203890:	01592c23          	sw	s5,24(s2)
    insert_vma_struct(mm, vma);
ffffffffc0203894:	85ca                	mv	a1,s2
ffffffffc0203896:	e73ff0ef          	jal	ra,ffffffffc0203708 <insert_vma_struct>
    if (vma_store != NULL)
    {
        *vma_store = vma;
    }
    ret = 0;
ffffffffc020389a:	4501                	li	a0,0
    if (vma_store != NULL)
ffffffffc020389c:	000a0463          	beqz	s4,ffffffffc02038a4 <mm_map+0x7a>
        *vma_store = vma;
ffffffffc02038a0:	012a3023          	sd	s2,0(s4) # 1000 <_binary_obj___user_faultread_out_size-0x8ba8>

out:
    return ret;
}
ffffffffc02038a4:	70e2                	ld	ra,56(sp)
ffffffffc02038a6:	7442                	ld	s0,48(sp)
ffffffffc02038a8:	74a2                	ld	s1,40(sp)
ffffffffc02038aa:	7902                	ld	s2,32(sp)
ffffffffc02038ac:	69e2                	ld	s3,24(sp)
ffffffffc02038ae:	6a42                	ld	s4,16(sp)
ffffffffc02038b0:	6aa2                	ld	s5,8(sp)
ffffffffc02038b2:	6121                	addi	sp,sp,64
ffffffffc02038b4:	8082                	ret
        return -E_INVAL;
ffffffffc02038b6:	5575                	li	a0,-3
ffffffffc02038b8:	b7f5                	j	ffffffffc02038a4 <mm_map+0x7a>
    assert(mm != NULL);
ffffffffc02038ba:	00003697          	auipc	a3,0x3
ffffffffc02038be:	63e68693          	addi	a3,a3,1598 # ffffffffc0206ef8 <default_pmm_manager+0x830>
ffffffffc02038c2:	00003617          	auipc	a2,0x3
ffffffffc02038c6:	a5660613          	addi	a2,a2,-1450 # ffffffffc0206318 <commands+0x818>
ffffffffc02038ca:	0b300593          	li	a1,179
ffffffffc02038ce:	00003517          	auipc	a0,0x3
ffffffffc02038d2:	5a250513          	addi	a0,a0,1442 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc02038d6:	bb9fc0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc02038da <dup_mmap>:

int dup_mmap(struct mm_struct *to, struct mm_struct *from)
{
ffffffffc02038da:	7139                	addi	sp,sp,-64
ffffffffc02038dc:	fc06                	sd	ra,56(sp)
ffffffffc02038de:	f822                	sd	s0,48(sp)
ffffffffc02038e0:	f426                	sd	s1,40(sp)
ffffffffc02038e2:	f04a                	sd	s2,32(sp)
ffffffffc02038e4:	ec4e                	sd	s3,24(sp)
ffffffffc02038e6:	e852                	sd	s4,16(sp)
ffffffffc02038e8:	e456                	sd	s5,8(sp)
    assert(to != NULL && from != NULL);
ffffffffc02038ea:	c52d                	beqz	a0,ffffffffc0203954 <dup_mmap+0x7a>
ffffffffc02038ec:	892a                	mv	s2,a0
ffffffffc02038ee:	84ae                	mv	s1,a1
    list_entry_t *list = &(from->mmap_list), *le = list;
ffffffffc02038f0:	842e                	mv	s0,a1
    assert(to != NULL && from != NULL);
ffffffffc02038f2:	e595                	bnez	a1,ffffffffc020391e <dup_mmap+0x44>
ffffffffc02038f4:	a085                	j	ffffffffc0203954 <dup_mmap+0x7a>
        if (nvma == NULL)
        {
            return -E_NO_MEM;
        }

        insert_vma_struct(to, nvma);
ffffffffc02038f6:	854a                	mv	a0,s2
        vma->vm_start = vm_start;
ffffffffc02038f8:	0155b423          	sd	s5,8(a1) # 200008 <_binary_obj___user_exit_out_size+0x1f4ee8>
        vma->vm_end = vm_end;
ffffffffc02038fc:	0145b823          	sd	s4,16(a1)
        vma->vm_flags = vm_flags;
ffffffffc0203900:	0135ac23          	sw	s3,24(a1)
        insert_vma_struct(to, nvma);
ffffffffc0203904:	e05ff0ef          	jal	ra,ffffffffc0203708 <insert_vma_struct>

        bool share = 0;
        if (copy_range(to->pgdir, from->pgdir, vma->vm_start, vma->vm_end, share) != 0)
ffffffffc0203908:	ff043683          	ld	a3,-16(s0) # ff0 <_binary_obj___user_faultread_out_size-0x8bb8>
ffffffffc020390c:	fe843603          	ld	a2,-24(s0)
ffffffffc0203910:	6c8c                	ld	a1,24(s1)
ffffffffc0203912:	01893503          	ld	a0,24(s2)
ffffffffc0203916:	4701                	li	a4,0
ffffffffc0203918:	a3bff0ef          	jal	ra,ffffffffc0203352 <copy_range>
ffffffffc020391c:	e105                	bnez	a0,ffffffffc020393c <dup_mmap+0x62>
    return listelm->prev;
ffffffffc020391e:	6000                	ld	s0,0(s0)
    while ((le = list_prev(le)) != list)
ffffffffc0203920:	02848863          	beq	s1,s0,ffffffffc0203950 <dup_mmap+0x76>
    struct vma_struct *vma = kmalloc(sizeof(struct vma_struct));
ffffffffc0203924:	03000513          	li	a0,48
        nvma = vma_create(vma->vm_start, vma->vm_end, vma->vm_flags);
ffffffffc0203928:	fe843a83          	ld	s5,-24(s0)
ffffffffc020392c:	ff043a03          	ld	s4,-16(s0)
ffffffffc0203930:	ff842983          	lw	s3,-8(s0)
    struct vma_struct *vma = kmalloc(sizeof(struct vma_struct));
ffffffffc0203934:	b62fe0ef          	jal	ra,ffffffffc0201c96 <kmalloc>
ffffffffc0203938:	85aa                	mv	a1,a0
    if (vma != NULL)
ffffffffc020393a:	fd55                	bnez	a0,ffffffffc02038f6 <dup_mmap+0x1c>
            return -E_NO_MEM;
ffffffffc020393c:	5571                	li	a0,-4
        {
            return -E_NO_MEM;
        }
    }
    return 0;
}
ffffffffc020393e:	70e2                	ld	ra,56(sp)
ffffffffc0203940:	7442                	ld	s0,48(sp)
ffffffffc0203942:	74a2                	ld	s1,40(sp)
ffffffffc0203944:	7902                	ld	s2,32(sp)
ffffffffc0203946:	69e2                	ld	s3,24(sp)
ffffffffc0203948:	6a42                	ld	s4,16(sp)
ffffffffc020394a:	6aa2                	ld	s5,8(sp)
ffffffffc020394c:	6121                	addi	sp,sp,64
ffffffffc020394e:	8082                	ret
    return 0;
ffffffffc0203950:	4501                	li	a0,0
ffffffffc0203952:	b7f5                	j	ffffffffc020393e <dup_mmap+0x64>
    assert(to != NULL && from != NULL);
ffffffffc0203954:	00003697          	auipc	a3,0x3
ffffffffc0203958:	5b468693          	addi	a3,a3,1460 # ffffffffc0206f08 <default_pmm_manager+0x840>
ffffffffc020395c:	00003617          	auipc	a2,0x3
ffffffffc0203960:	9bc60613          	addi	a2,a2,-1604 # ffffffffc0206318 <commands+0x818>
ffffffffc0203964:	0cf00593          	li	a1,207
ffffffffc0203968:	00003517          	auipc	a0,0x3
ffffffffc020396c:	50850513          	addi	a0,a0,1288 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203970:	b1ffc0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0203974 <exit_mmap>:

void exit_mmap(struct mm_struct *mm)
{
ffffffffc0203974:	1101                	addi	sp,sp,-32
ffffffffc0203976:	ec06                	sd	ra,24(sp)
ffffffffc0203978:	e822                	sd	s0,16(sp)
ffffffffc020397a:	e426                	sd	s1,8(sp)
ffffffffc020397c:	e04a                	sd	s2,0(sp)
    assert(mm != NULL && mm_count(mm) == 0);
ffffffffc020397e:	c531                	beqz	a0,ffffffffc02039ca <exit_mmap+0x56>
ffffffffc0203980:	591c                	lw	a5,48(a0)
ffffffffc0203982:	84aa                	mv	s1,a0
ffffffffc0203984:	e3b9                	bnez	a5,ffffffffc02039ca <exit_mmap+0x56>
    return listelm->next;
ffffffffc0203986:	6500                	ld	s0,8(a0)
    pde_t *pgdir = mm->pgdir;
ffffffffc0203988:	01853903          	ld	s2,24(a0)
    list_entry_t *list = &(mm->mmap_list), *le = list;
    while ((le = list_next(le)) != list)
ffffffffc020398c:	02850663          	beq	a0,s0,ffffffffc02039b8 <exit_mmap+0x44>
    {
        struct vma_struct *vma = le2vma(le, list_link);
        unmap_range(pgdir, vma->vm_start, vma->vm_end);
ffffffffc0203990:	ff043603          	ld	a2,-16(s0)
ffffffffc0203994:	fe843583          	ld	a1,-24(s0)
ffffffffc0203998:	854a                	mv	a0,s2
ffffffffc020399a:	80ffe0ef          	jal	ra,ffffffffc02021a8 <unmap_range>
ffffffffc020399e:	6400                	ld	s0,8(s0)
    while ((le = list_next(le)) != list)
ffffffffc02039a0:	fe8498e3          	bne	s1,s0,ffffffffc0203990 <exit_mmap+0x1c>
ffffffffc02039a4:	6400                	ld	s0,8(s0)
    }
    while ((le = list_next(le)) != list)
ffffffffc02039a6:	00848c63          	beq	s1,s0,ffffffffc02039be <exit_mmap+0x4a>
    {
        struct vma_struct *vma = le2vma(le, list_link);
        exit_range(pgdir, vma->vm_start, vma->vm_end);
ffffffffc02039aa:	ff043603          	ld	a2,-16(s0)
ffffffffc02039ae:	fe843583          	ld	a1,-24(s0)
ffffffffc02039b2:	854a                	mv	a0,s2
ffffffffc02039b4:	93bfe0ef          	jal	ra,ffffffffc02022ee <exit_range>
ffffffffc02039b8:	6400                	ld	s0,8(s0)
    while ((le = list_next(le)) != list)
ffffffffc02039ba:	fe8498e3          	bne	s1,s0,ffffffffc02039aa <exit_mmap+0x36>
    }
}
ffffffffc02039be:	60e2                	ld	ra,24(sp)
ffffffffc02039c0:	6442                	ld	s0,16(sp)
ffffffffc02039c2:	64a2                	ld	s1,8(sp)
ffffffffc02039c4:	6902                	ld	s2,0(sp)
ffffffffc02039c6:	6105                	addi	sp,sp,32
ffffffffc02039c8:	8082                	ret
    assert(mm != NULL && mm_count(mm) == 0);
ffffffffc02039ca:	00003697          	auipc	a3,0x3
ffffffffc02039ce:	55e68693          	addi	a3,a3,1374 # ffffffffc0206f28 <default_pmm_manager+0x860>
ffffffffc02039d2:	00003617          	auipc	a2,0x3
ffffffffc02039d6:	94660613          	addi	a2,a2,-1722 # ffffffffc0206318 <commands+0x818>
ffffffffc02039da:	0e800593          	li	a1,232
ffffffffc02039de:	00003517          	auipc	a0,0x3
ffffffffc02039e2:	49250513          	addi	a0,a0,1170 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc02039e6:	aa9fc0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc02039ea <vmm_init>:
}

// vmm_init - initialize virtual memory management
//          - now just call check_vmm to check correctness of vmm
void vmm_init(void)
{
ffffffffc02039ea:	7139                	addi	sp,sp,-64
    struct mm_struct *mm = kmalloc(sizeof(struct mm_struct));
ffffffffc02039ec:	04000513          	li	a0,64
{
ffffffffc02039f0:	fc06                	sd	ra,56(sp)
ffffffffc02039f2:	f822                	sd	s0,48(sp)
ffffffffc02039f4:	f426                	sd	s1,40(sp)
ffffffffc02039f6:	f04a                	sd	s2,32(sp)
ffffffffc02039f8:	ec4e                	sd	s3,24(sp)
ffffffffc02039fa:	e852                	sd	s4,16(sp)
ffffffffc02039fc:	e456                	sd	s5,8(sp)
    struct mm_struct *mm = kmalloc(sizeof(struct mm_struct));
ffffffffc02039fe:	a98fe0ef          	jal	ra,ffffffffc0201c96 <kmalloc>
    if (mm != NULL)
ffffffffc0203a02:	2e050663          	beqz	a0,ffffffffc0203cee <vmm_init+0x304>
ffffffffc0203a06:	84aa                	mv	s1,a0
    elm->prev = elm->next = elm;
ffffffffc0203a08:	e508                	sd	a0,8(a0)
ffffffffc0203a0a:	e108                	sd	a0,0(a0)
        mm->mmap_cache = NULL;
ffffffffc0203a0c:	00053823          	sd	zero,16(a0)
        mm->pgdir = NULL;
ffffffffc0203a10:	00053c23          	sd	zero,24(a0)
        mm->map_count = 0;
ffffffffc0203a14:	02052023          	sw	zero,32(a0)
        mm->sm_priv = NULL;
ffffffffc0203a18:	02053423          	sd	zero,40(a0)
ffffffffc0203a1c:	02052823          	sw	zero,48(a0)
ffffffffc0203a20:	02053c23          	sd	zero,56(a0)
ffffffffc0203a24:	03200413          	li	s0,50
ffffffffc0203a28:	a811                	j	ffffffffc0203a3c <vmm_init+0x52>
        vma->vm_start = vm_start;
ffffffffc0203a2a:	e500                	sd	s0,8(a0)
        vma->vm_end = vm_end;
ffffffffc0203a2c:	e91c                	sd	a5,16(a0)
        vma->vm_flags = vm_flags;
ffffffffc0203a2e:	00052c23          	sw	zero,24(a0)
    assert(mm != NULL);

    int step1 = 10, step2 = step1 * 10;

    int i;
    for (i = step1; i >= 1; i--)
ffffffffc0203a32:	146d                	addi	s0,s0,-5
    {
        struct vma_struct *vma = vma_create(i * 5, i * 5 + 2, 0);
        assert(vma != NULL);
        insert_vma_struct(mm, vma);
ffffffffc0203a34:	8526                	mv	a0,s1
ffffffffc0203a36:	cd3ff0ef          	jal	ra,ffffffffc0203708 <insert_vma_struct>
    for (i = step1; i >= 1; i--)
ffffffffc0203a3a:	c80d                	beqz	s0,ffffffffc0203a6c <vmm_init+0x82>
    struct vma_struct *vma = kmalloc(sizeof(struct vma_struct));
ffffffffc0203a3c:	03000513          	li	a0,48
ffffffffc0203a40:	a56fe0ef          	jal	ra,ffffffffc0201c96 <kmalloc>
ffffffffc0203a44:	85aa                	mv	a1,a0
ffffffffc0203a46:	00240793          	addi	a5,s0,2
    if (vma != NULL)
ffffffffc0203a4a:	f165                	bnez	a0,ffffffffc0203a2a <vmm_init+0x40>
        assert(vma != NULL);
ffffffffc0203a4c:	00003697          	auipc	a3,0x3
ffffffffc0203a50:	67468693          	addi	a3,a3,1652 # ffffffffc02070c0 <default_pmm_manager+0x9f8>
ffffffffc0203a54:	00003617          	auipc	a2,0x3
ffffffffc0203a58:	8c460613          	addi	a2,a2,-1852 # ffffffffc0206318 <commands+0x818>
ffffffffc0203a5c:	12c00593          	li	a1,300
ffffffffc0203a60:	00003517          	auipc	a0,0x3
ffffffffc0203a64:	41050513          	addi	a0,a0,1040 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203a68:	a27fc0ef          	jal	ra,ffffffffc020048e <__panic>
ffffffffc0203a6c:	03700413          	li	s0,55
    }

    for (i = step1 + 1; i <= step2; i++)
ffffffffc0203a70:	1f900913          	li	s2,505
ffffffffc0203a74:	a819                	j	ffffffffc0203a8a <vmm_init+0xa0>
        vma->vm_start = vm_start;
ffffffffc0203a76:	e500                	sd	s0,8(a0)
        vma->vm_end = vm_end;
ffffffffc0203a78:	e91c                	sd	a5,16(a0)
        vma->vm_flags = vm_flags;
ffffffffc0203a7a:	00052c23          	sw	zero,24(a0)
    for (i = step1 + 1; i <= step2; i++)
ffffffffc0203a7e:	0415                	addi	s0,s0,5
    {
        struct vma_struct *vma = vma_create(i * 5, i * 5 + 2, 0);
        assert(vma != NULL);
        insert_vma_struct(mm, vma);
ffffffffc0203a80:	8526                	mv	a0,s1
ffffffffc0203a82:	c87ff0ef          	jal	ra,ffffffffc0203708 <insert_vma_struct>
    for (i = step1 + 1; i <= step2; i++)
ffffffffc0203a86:	03240a63          	beq	s0,s2,ffffffffc0203aba <vmm_init+0xd0>
    struct vma_struct *vma = kmalloc(sizeof(struct vma_struct));
ffffffffc0203a8a:	03000513          	li	a0,48
ffffffffc0203a8e:	a08fe0ef          	jal	ra,ffffffffc0201c96 <kmalloc>
ffffffffc0203a92:	85aa                	mv	a1,a0
ffffffffc0203a94:	00240793          	addi	a5,s0,2
    if (vma != NULL)
ffffffffc0203a98:	fd79                	bnez	a0,ffffffffc0203a76 <vmm_init+0x8c>
        assert(vma != NULL);
ffffffffc0203a9a:	00003697          	auipc	a3,0x3
ffffffffc0203a9e:	62668693          	addi	a3,a3,1574 # ffffffffc02070c0 <default_pmm_manager+0x9f8>
ffffffffc0203aa2:	00003617          	auipc	a2,0x3
ffffffffc0203aa6:	87660613          	addi	a2,a2,-1930 # ffffffffc0206318 <commands+0x818>
ffffffffc0203aaa:	13300593          	li	a1,307
ffffffffc0203aae:	00003517          	auipc	a0,0x3
ffffffffc0203ab2:	3c250513          	addi	a0,a0,962 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203ab6:	9d9fc0ef          	jal	ra,ffffffffc020048e <__panic>
    return listelm->next;
ffffffffc0203aba:	649c                	ld	a5,8(s1)
ffffffffc0203abc:	471d                	li	a4,7
    }

    list_entry_t *le = list_next(&(mm->mmap_list));

    for (i = 1; i <= step2; i++)
ffffffffc0203abe:	1fb00593          	li	a1,507
    {
        assert(le != &(mm->mmap_list));
ffffffffc0203ac2:	16f48663          	beq	s1,a5,ffffffffc0203c2e <vmm_init+0x244>
        struct vma_struct *mmap = le2vma(le, list_link);
        assert(mmap->vm_start == i * 5 && mmap->vm_end == i * 5 + 2);
ffffffffc0203ac6:	fe87b603          	ld	a2,-24(a5) # ffffffffffffefe8 <end+0x3fd548b4>
ffffffffc0203aca:	ffe70693          	addi	a3,a4,-2
ffffffffc0203ace:	10d61063          	bne	a2,a3,ffffffffc0203bce <vmm_init+0x1e4>
ffffffffc0203ad2:	ff07b683          	ld	a3,-16(a5)
ffffffffc0203ad6:	0ed71c63          	bne	a4,a3,ffffffffc0203bce <vmm_init+0x1e4>
    for (i = 1; i <= step2; i++)
ffffffffc0203ada:	0715                	addi	a4,a4,5
ffffffffc0203adc:	679c                	ld	a5,8(a5)
ffffffffc0203ade:	feb712e3          	bne	a4,a1,ffffffffc0203ac2 <vmm_init+0xd8>
ffffffffc0203ae2:	4a1d                	li	s4,7
ffffffffc0203ae4:	4415                	li	s0,5
        le = list_next(le);
    }

    for (i = 5; i <= 5 * step2; i += 5)
ffffffffc0203ae6:	1f900a93          	li	s5,505
    {
        struct vma_struct *vma1 = find_vma(mm, i);
ffffffffc0203aea:	85a2                	mv	a1,s0
ffffffffc0203aec:	8526                	mv	a0,s1
ffffffffc0203aee:	bdbff0ef          	jal	ra,ffffffffc02036c8 <find_vma>
ffffffffc0203af2:	892a                	mv	s2,a0
        assert(vma1 != NULL);
ffffffffc0203af4:	16050d63          	beqz	a0,ffffffffc0203c6e <vmm_init+0x284>
        struct vma_struct *vma2 = find_vma(mm, i + 1);
ffffffffc0203af8:	00140593          	addi	a1,s0,1
ffffffffc0203afc:	8526                	mv	a0,s1
ffffffffc0203afe:	bcbff0ef          	jal	ra,ffffffffc02036c8 <find_vma>
ffffffffc0203b02:	89aa                	mv	s3,a0
        assert(vma2 != NULL);
ffffffffc0203b04:	14050563          	beqz	a0,ffffffffc0203c4e <vmm_init+0x264>
        struct vma_struct *vma3 = find_vma(mm, i + 2);
ffffffffc0203b08:	85d2                	mv	a1,s4
ffffffffc0203b0a:	8526                	mv	a0,s1
ffffffffc0203b0c:	bbdff0ef          	jal	ra,ffffffffc02036c8 <find_vma>
        assert(vma3 == NULL);
ffffffffc0203b10:	16051f63          	bnez	a0,ffffffffc0203c8e <vmm_init+0x2a4>
        struct vma_struct *vma4 = find_vma(mm, i + 3);
ffffffffc0203b14:	00340593          	addi	a1,s0,3
ffffffffc0203b18:	8526                	mv	a0,s1
ffffffffc0203b1a:	bafff0ef          	jal	ra,ffffffffc02036c8 <find_vma>
        assert(vma4 == NULL);
ffffffffc0203b1e:	1a051863          	bnez	a0,ffffffffc0203cce <vmm_init+0x2e4>
        struct vma_struct *vma5 = find_vma(mm, i + 4);
ffffffffc0203b22:	00440593          	addi	a1,s0,4
ffffffffc0203b26:	8526                	mv	a0,s1
ffffffffc0203b28:	ba1ff0ef          	jal	ra,ffffffffc02036c8 <find_vma>
        assert(vma5 == NULL);
ffffffffc0203b2c:	18051163          	bnez	a0,ffffffffc0203cae <vmm_init+0x2c4>

        assert(vma1->vm_start == i && vma1->vm_end == i + 2);
ffffffffc0203b30:	00893783          	ld	a5,8(s2)
ffffffffc0203b34:	0a879d63          	bne	a5,s0,ffffffffc0203bee <vmm_init+0x204>
ffffffffc0203b38:	01093783          	ld	a5,16(s2)
ffffffffc0203b3c:	0b479963          	bne	a5,s4,ffffffffc0203bee <vmm_init+0x204>
        assert(vma2->vm_start == i && vma2->vm_end == i + 2);
ffffffffc0203b40:	0089b783          	ld	a5,8(s3)
ffffffffc0203b44:	0c879563          	bne	a5,s0,ffffffffc0203c0e <vmm_init+0x224>
ffffffffc0203b48:	0109b783          	ld	a5,16(s3)
ffffffffc0203b4c:	0d479163          	bne	a5,s4,ffffffffc0203c0e <vmm_init+0x224>
    for (i = 5; i <= 5 * step2; i += 5)
ffffffffc0203b50:	0415                	addi	s0,s0,5
ffffffffc0203b52:	0a15                	addi	s4,s4,5
ffffffffc0203b54:	f9541be3          	bne	s0,s5,ffffffffc0203aea <vmm_init+0x100>
ffffffffc0203b58:	4411                	li	s0,4
    }

    for (i = 4; i >= 0; i--)
ffffffffc0203b5a:	597d                	li	s2,-1
    {
        struct vma_struct *vma_below_5 = find_vma(mm, i);
ffffffffc0203b5c:	85a2                	mv	a1,s0
ffffffffc0203b5e:	8526                	mv	a0,s1
ffffffffc0203b60:	b69ff0ef          	jal	ra,ffffffffc02036c8 <find_vma>
ffffffffc0203b64:	0004059b          	sext.w	a1,s0
        if (vma_below_5 != NULL)
ffffffffc0203b68:	c90d                	beqz	a0,ffffffffc0203b9a <vmm_init+0x1b0>
        {
            cprintf("vma_below_5: i %x, start %x, end %x\n", i, vma_below_5->vm_start, vma_below_5->vm_end);
ffffffffc0203b6a:	6914                	ld	a3,16(a0)
ffffffffc0203b6c:	6510                	ld	a2,8(a0)
ffffffffc0203b6e:	00003517          	auipc	a0,0x3
ffffffffc0203b72:	4da50513          	addi	a0,a0,1242 # ffffffffc0207048 <default_pmm_manager+0x980>
ffffffffc0203b76:	e1efc0ef          	jal	ra,ffffffffc0200194 <cprintf>
        }
        assert(vma_below_5 == NULL);
ffffffffc0203b7a:	00003697          	auipc	a3,0x3
ffffffffc0203b7e:	4f668693          	addi	a3,a3,1270 # ffffffffc0207070 <default_pmm_manager+0x9a8>
ffffffffc0203b82:	00002617          	auipc	a2,0x2
ffffffffc0203b86:	79660613          	addi	a2,a2,1942 # ffffffffc0206318 <commands+0x818>
ffffffffc0203b8a:	15900593          	li	a1,345
ffffffffc0203b8e:	00003517          	auipc	a0,0x3
ffffffffc0203b92:	2e250513          	addi	a0,a0,738 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203b96:	8f9fc0ef          	jal	ra,ffffffffc020048e <__panic>
    for (i = 4; i >= 0; i--)
ffffffffc0203b9a:	147d                	addi	s0,s0,-1
ffffffffc0203b9c:	fd2410e3          	bne	s0,s2,ffffffffc0203b5c <vmm_init+0x172>
    }

    mm_destroy(mm);
ffffffffc0203ba0:	8526                	mv	a0,s1
ffffffffc0203ba2:	c37ff0ef          	jal	ra,ffffffffc02037d8 <mm_destroy>

    cprintf("check_vma_struct() succeeded!\n");
ffffffffc0203ba6:	00003517          	auipc	a0,0x3
ffffffffc0203baa:	4e250513          	addi	a0,a0,1250 # ffffffffc0207088 <default_pmm_manager+0x9c0>
ffffffffc0203bae:	de6fc0ef          	jal	ra,ffffffffc0200194 <cprintf>
}
ffffffffc0203bb2:	7442                	ld	s0,48(sp)
ffffffffc0203bb4:	70e2                	ld	ra,56(sp)
ffffffffc0203bb6:	74a2                	ld	s1,40(sp)
ffffffffc0203bb8:	7902                	ld	s2,32(sp)
ffffffffc0203bba:	69e2                	ld	s3,24(sp)
ffffffffc0203bbc:	6a42                	ld	s4,16(sp)
ffffffffc0203bbe:	6aa2                	ld	s5,8(sp)
    cprintf("check_vmm() succeeded.\n");
ffffffffc0203bc0:	00003517          	auipc	a0,0x3
ffffffffc0203bc4:	4e850513          	addi	a0,a0,1256 # ffffffffc02070a8 <default_pmm_manager+0x9e0>
}
ffffffffc0203bc8:	6121                	addi	sp,sp,64
    cprintf("check_vmm() succeeded.\n");
ffffffffc0203bca:	dcafc06f          	j	ffffffffc0200194 <cprintf>
        assert(mmap->vm_start == i * 5 && mmap->vm_end == i * 5 + 2);
ffffffffc0203bce:	00003697          	auipc	a3,0x3
ffffffffc0203bd2:	39268693          	addi	a3,a3,914 # ffffffffc0206f60 <default_pmm_manager+0x898>
ffffffffc0203bd6:	00002617          	auipc	a2,0x2
ffffffffc0203bda:	74260613          	addi	a2,a2,1858 # ffffffffc0206318 <commands+0x818>
ffffffffc0203bde:	13d00593          	li	a1,317
ffffffffc0203be2:	00003517          	auipc	a0,0x3
ffffffffc0203be6:	28e50513          	addi	a0,a0,654 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203bea:	8a5fc0ef          	jal	ra,ffffffffc020048e <__panic>
        assert(vma1->vm_start == i && vma1->vm_end == i + 2);
ffffffffc0203bee:	00003697          	auipc	a3,0x3
ffffffffc0203bf2:	3fa68693          	addi	a3,a3,1018 # ffffffffc0206fe8 <default_pmm_manager+0x920>
ffffffffc0203bf6:	00002617          	auipc	a2,0x2
ffffffffc0203bfa:	72260613          	addi	a2,a2,1826 # ffffffffc0206318 <commands+0x818>
ffffffffc0203bfe:	14e00593          	li	a1,334
ffffffffc0203c02:	00003517          	auipc	a0,0x3
ffffffffc0203c06:	26e50513          	addi	a0,a0,622 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203c0a:	885fc0ef          	jal	ra,ffffffffc020048e <__panic>
        assert(vma2->vm_start == i && vma2->vm_end == i + 2);
ffffffffc0203c0e:	00003697          	auipc	a3,0x3
ffffffffc0203c12:	40a68693          	addi	a3,a3,1034 # ffffffffc0207018 <default_pmm_manager+0x950>
ffffffffc0203c16:	00002617          	auipc	a2,0x2
ffffffffc0203c1a:	70260613          	addi	a2,a2,1794 # ffffffffc0206318 <commands+0x818>
ffffffffc0203c1e:	14f00593          	li	a1,335
ffffffffc0203c22:	00003517          	auipc	a0,0x3
ffffffffc0203c26:	24e50513          	addi	a0,a0,590 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203c2a:	865fc0ef          	jal	ra,ffffffffc020048e <__panic>
        assert(le != &(mm->mmap_list));
ffffffffc0203c2e:	00003697          	auipc	a3,0x3
ffffffffc0203c32:	31a68693          	addi	a3,a3,794 # ffffffffc0206f48 <default_pmm_manager+0x880>
ffffffffc0203c36:	00002617          	auipc	a2,0x2
ffffffffc0203c3a:	6e260613          	addi	a2,a2,1762 # ffffffffc0206318 <commands+0x818>
ffffffffc0203c3e:	13b00593          	li	a1,315
ffffffffc0203c42:	00003517          	auipc	a0,0x3
ffffffffc0203c46:	22e50513          	addi	a0,a0,558 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203c4a:	845fc0ef          	jal	ra,ffffffffc020048e <__panic>
        assert(vma2 != NULL);
ffffffffc0203c4e:	00003697          	auipc	a3,0x3
ffffffffc0203c52:	35a68693          	addi	a3,a3,858 # ffffffffc0206fa8 <default_pmm_manager+0x8e0>
ffffffffc0203c56:	00002617          	auipc	a2,0x2
ffffffffc0203c5a:	6c260613          	addi	a2,a2,1730 # ffffffffc0206318 <commands+0x818>
ffffffffc0203c5e:	14600593          	li	a1,326
ffffffffc0203c62:	00003517          	auipc	a0,0x3
ffffffffc0203c66:	20e50513          	addi	a0,a0,526 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203c6a:	825fc0ef          	jal	ra,ffffffffc020048e <__panic>
        assert(vma1 != NULL);
ffffffffc0203c6e:	00003697          	auipc	a3,0x3
ffffffffc0203c72:	32a68693          	addi	a3,a3,810 # ffffffffc0206f98 <default_pmm_manager+0x8d0>
ffffffffc0203c76:	00002617          	auipc	a2,0x2
ffffffffc0203c7a:	6a260613          	addi	a2,a2,1698 # ffffffffc0206318 <commands+0x818>
ffffffffc0203c7e:	14400593          	li	a1,324
ffffffffc0203c82:	00003517          	auipc	a0,0x3
ffffffffc0203c86:	1ee50513          	addi	a0,a0,494 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203c8a:	805fc0ef          	jal	ra,ffffffffc020048e <__panic>
        assert(vma3 == NULL);
ffffffffc0203c8e:	00003697          	auipc	a3,0x3
ffffffffc0203c92:	32a68693          	addi	a3,a3,810 # ffffffffc0206fb8 <default_pmm_manager+0x8f0>
ffffffffc0203c96:	00002617          	auipc	a2,0x2
ffffffffc0203c9a:	68260613          	addi	a2,a2,1666 # ffffffffc0206318 <commands+0x818>
ffffffffc0203c9e:	14800593          	li	a1,328
ffffffffc0203ca2:	00003517          	auipc	a0,0x3
ffffffffc0203ca6:	1ce50513          	addi	a0,a0,462 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203caa:	fe4fc0ef          	jal	ra,ffffffffc020048e <__panic>
        assert(vma5 == NULL);
ffffffffc0203cae:	00003697          	auipc	a3,0x3
ffffffffc0203cb2:	32a68693          	addi	a3,a3,810 # ffffffffc0206fd8 <default_pmm_manager+0x910>
ffffffffc0203cb6:	00002617          	auipc	a2,0x2
ffffffffc0203cba:	66260613          	addi	a2,a2,1634 # ffffffffc0206318 <commands+0x818>
ffffffffc0203cbe:	14c00593          	li	a1,332
ffffffffc0203cc2:	00003517          	auipc	a0,0x3
ffffffffc0203cc6:	1ae50513          	addi	a0,a0,430 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203cca:	fc4fc0ef          	jal	ra,ffffffffc020048e <__panic>
        assert(vma4 == NULL);
ffffffffc0203cce:	00003697          	auipc	a3,0x3
ffffffffc0203cd2:	2fa68693          	addi	a3,a3,762 # ffffffffc0206fc8 <default_pmm_manager+0x900>
ffffffffc0203cd6:	00002617          	auipc	a2,0x2
ffffffffc0203cda:	64260613          	addi	a2,a2,1602 # ffffffffc0206318 <commands+0x818>
ffffffffc0203cde:	14a00593          	li	a1,330
ffffffffc0203ce2:	00003517          	auipc	a0,0x3
ffffffffc0203ce6:	18e50513          	addi	a0,a0,398 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203cea:	fa4fc0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(mm != NULL);
ffffffffc0203cee:	00003697          	auipc	a3,0x3
ffffffffc0203cf2:	20a68693          	addi	a3,a3,522 # ffffffffc0206ef8 <default_pmm_manager+0x830>
ffffffffc0203cf6:	00002617          	auipc	a2,0x2
ffffffffc0203cfa:	62260613          	addi	a2,a2,1570 # ffffffffc0206318 <commands+0x818>
ffffffffc0203cfe:	12400593          	li	a1,292
ffffffffc0203d02:	00003517          	auipc	a0,0x3
ffffffffc0203d06:	16e50513          	addi	a0,a0,366 # ffffffffc0206e70 <default_pmm_manager+0x7a8>
ffffffffc0203d0a:	f84fc0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0203d0e <user_mem_check>:
}
bool user_mem_check(struct mm_struct *mm, uintptr_t addr, size_t len, bool write)
{
ffffffffc0203d0e:	7179                	addi	sp,sp,-48
ffffffffc0203d10:	f022                	sd	s0,32(sp)
ffffffffc0203d12:	f406                	sd	ra,40(sp)
ffffffffc0203d14:	ec26                	sd	s1,24(sp)
ffffffffc0203d16:	e84a                	sd	s2,16(sp)
ffffffffc0203d18:	e44e                	sd	s3,8(sp)
ffffffffc0203d1a:	e052                	sd	s4,0(sp)
ffffffffc0203d1c:	842e                	mv	s0,a1
    if (mm != NULL)
ffffffffc0203d1e:	c135                	beqz	a0,ffffffffc0203d82 <user_mem_check+0x74>
    {
        if (!USER_ACCESS(addr, addr + len))
ffffffffc0203d20:	002007b7          	lui	a5,0x200
ffffffffc0203d24:	04f5e663          	bltu	a1,a5,ffffffffc0203d70 <user_mem_check+0x62>
ffffffffc0203d28:	00c584b3          	add	s1,a1,a2
ffffffffc0203d2c:	0495f263          	bgeu	a1,s1,ffffffffc0203d70 <user_mem_check+0x62>
ffffffffc0203d30:	4785                	li	a5,1
ffffffffc0203d32:	07fe                	slli	a5,a5,0x1f
ffffffffc0203d34:	0297ee63          	bltu	a5,s1,ffffffffc0203d70 <user_mem_check+0x62>
ffffffffc0203d38:	892a                	mv	s2,a0
ffffffffc0203d3a:	89b6                	mv	s3,a3
            {
                return 0;
            }
            if (write && (vma->vm_flags & VM_STACK))
            {
                if (start < vma->vm_start + PGSIZE)
ffffffffc0203d3c:	6a05                	lui	s4,0x1
ffffffffc0203d3e:	a821                	j	ffffffffc0203d56 <user_mem_check+0x48>
            if (!(vma->vm_flags & ((write) ? VM_WRITE : VM_READ)))
ffffffffc0203d40:	0027f693          	andi	a3,a5,2
                if (start < vma->vm_start + PGSIZE)
ffffffffc0203d44:	9752                	add	a4,a4,s4
            if (write && (vma->vm_flags & VM_STACK))
ffffffffc0203d46:	8ba1                	andi	a5,a5,8
            if (!(vma->vm_flags & ((write) ? VM_WRITE : VM_READ)))
ffffffffc0203d48:	c685                	beqz	a3,ffffffffc0203d70 <user_mem_check+0x62>
            if (write && (vma->vm_flags & VM_STACK))
ffffffffc0203d4a:	c399                	beqz	a5,ffffffffc0203d50 <user_mem_check+0x42>
                if (start < vma->vm_start + PGSIZE)
ffffffffc0203d4c:	02e46263          	bltu	s0,a4,ffffffffc0203d70 <user_mem_check+0x62>
                { // check stack start & size
                    return 0;
                }
            }
            start = vma->vm_end;
ffffffffc0203d50:	6900                	ld	s0,16(a0)
        while (start < end)
ffffffffc0203d52:	04947663          	bgeu	s0,s1,ffffffffc0203d9e <user_mem_check+0x90>
            if ((vma = find_vma(mm, start)) == NULL || start < vma->vm_start)
ffffffffc0203d56:	85a2                	mv	a1,s0
ffffffffc0203d58:	854a                	mv	a0,s2
ffffffffc0203d5a:	96fff0ef          	jal	ra,ffffffffc02036c8 <find_vma>
ffffffffc0203d5e:	c909                	beqz	a0,ffffffffc0203d70 <user_mem_check+0x62>
ffffffffc0203d60:	6518                	ld	a4,8(a0)
ffffffffc0203d62:	00e46763          	bltu	s0,a4,ffffffffc0203d70 <user_mem_check+0x62>
            if (!(vma->vm_flags & ((write) ? VM_WRITE : VM_READ)))
ffffffffc0203d66:	4d1c                	lw	a5,24(a0)
ffffffffc0203d68:	fc099ce3          	bnez	s3,ffffffffc0203d40 <user_mem_check+0x32>
ffffffffc0203d6c:	8b85                	andi	a5,a5,1
ffffffffc0203d6e:	f3ed                	bnez	a5,ffffffffc0203d50 <user_mem_check+0x42>
            return 0;
ffffffffc0203d70:	4501                	li	a0,0
        }
        return 1;
    }
    return KERN_ACCESS(addr, addr + len);
ffffffffc0203d72:	70a2                	ld	ra,40(sp)
ffffffffc0203d74:	7402                	ld	s0,32(sp)
ffffffffc0203d76:	64e2                	ld	s1,24(sp)
ffffffffc0203d78:	6942                	ld	s2,16(sp)
ffffffffc0203d7a:	69a2                	ld	s3,8(sp)
ffffffffc0203d7c:	6a02                	ld	s4,0(sp)
ffffffffc0203d7e:	6145                	addi	sp,sp,48
ffffffffc0203d80:	8082                	ret
    return KERN_ACCESS(addr, addr + len);
ffffffffc0203d82:	c02007b7          	lui	a5,0xc0200
ffffffffc0203d86:	4501                	li	a0,0
ffffffffc0203d88:	fef5e5e3          	bltu	a1,a5,ffffffffc0203d72 <user_mem_check+0x64>
ffffffffc0203d8c:	962e                	add	a2,a2,a1
ffffffffc0203d8e:	fec5f2e3          	bgeu	a1,a2,ffffffffc0203d72 <user_mem_check+0x64>
ffffffffc0203d92:	c8000537          	lui	a0,0xc8000
ffffffffc0203d96:	0505                	addi	a0,a0,1
ffffffffc0203d98:	00a63533          	sltu	a0,a2,a0
ffffffffc0203d9c:	bfd9                	j	ffffffffc0203d72 <user_mem_check+0x64>
        return 1;
ffffffffc0203d9e:	4505                	li	a0,1
ffffffffc0203da0:	bfc9                	j	ffffffffc0203d72 <user_mem_check+0x64>

ffffffffc0203da2 <kernel_thread_entry>:
.text
.globl kernel_thread_entry
kernel_thread_entry:        # void kernel_thread(void)
	move a0, s1
ffffffffc0203da2:	8526                	mv	a0,s1
	jalr s0
ffffffffc0203da4:	9402                	jalr	s0

	jal do_exit
ffffffffc0203da6:	6bc000ef          	jal	ra,ffffffffc0204462 <do_exit>

ffffffffc0203daa <alloc_proc>:
void switch_to(struct context *from, struct context *to);

// alloc_proc - alloc a proc_struct and init all fields of proc_struct
static struct proc_struct *
alloc_proc(void)
{
ffffffffc0203daa:	1141                	addi	sp,sp,-16
    struct proc_struct *proc = kmalloc(sizeof(struct proc_struct));
ffffffffc0203dac:	10800513          	li	a0,264
{
ffffffffc0203db0:	e022                	sd	s0,0(sp)
ffffffffc0203db2:	e406                	sd	ra,8(sp)
    struct proc_struct *proc = kmalloc(sizeof(struct proc_struct));
ffffffffc0203db4:	ee3fd0ef          	jal	ra,ffffffffc0201c96 <kmalloc>
ffffffffc0203db8:	842a                	mv	s0,a0
    if (proc != NULL)
ffffffffc0203dba:	cd3d                	beqz	a0,ffffffffc0203e38 <alloc_proc+0x8e>
    {
	cprintf("alloc_proc: allocated %p (&current=%p)\n", proc, &current);
ffffffffc0203dbc:	85aa                	mv	a1,a0
ffffffffc0203dbe:	000a7617          	auipc	a2,0xa7
ffffffffc0203dc2:	95a60613          	addi	a2,a2,-1702 # ffffffffc02aa718 <current>
ffffffffc0203dc6:	00003517          	auipc	a0,0x3
ffffffffc0203dca:	30a50513          	addi	a0,a0,778 # ffffffffc02070d0 <default_pmm_manager+0xa08>
ffffffffc0203dce:	bc6fc0ef          	jal	ra,ffffffffc0200194 <cprintf>
         *       struct trapframe *tf;                       // Trap frame for current interrupt
         *       uintptr_t pgdir;                            // the base addr of Page Directroy Table(PDT)
         *       uint32_t flags;                             // Process flag
         *       char name[PROC_NAME_LEN + 1];               // Process name
         */
        proc->state = PROC_UNINIT;
ffffffffc0203dd2:	57fd                	li	a5,-1
ffffffffc0203dd4:	1782                	slli	a5,a5,0x20
        proc->runs = 0;
        proc->kstack = 0;
        proc->need_resched = 0;
        proc->parent = NULL;
        proc->mm = NULL;
        memset(&(proc->context), 0, sizeof(struct context));
ffffffffc0203dd6:	07000613          	li	a2,112
ffffffffc0203dda:	4581                	li	a1,0
        proc->state = PROC_UNINIT;
ffffffffc0203ddc:	e01c                	sd	a5,0(s0)
        proc->runs = 0;
ffffffffc0203dde:	00042423          	sw	zero,8(s0)
        proc->kstack = 0;
ffffffffc0203de2:	00043823          	sd	zero,16(s0)
        proc->need_resched = 0;
ffffffffc0203de6:	00043c23          	sd	zero,24(s0)
        proc->parent = NULL;
ffffffffc0203dea:	02043023          	sd	zero,32(s0)
        proc->mm = NULL;
ffffffffc0203dee:	02043423          	sd	zero,40(s0)
        memset(&(proc->context), 0, sizeof(struct context));
ffffffffc0203df2:	03040513          	addi	a0,s0,48
ffffffffc0203df6:	275010ef          	jal	ra,ffffffffc020586a <memset>
        proc->tf = NULL;
        proc->pgdir = boot_pgdir_pa;
ffffffffc0203dfa:	000a7797          	auipc	a5,0xa7
ffffffffc0203dfe:	8ee7b783          	ld	a5,-1810(a5) # ffffffffc02aa6e8 <boot_pgdir_pa>
ffffffffc0203e02:	f45c                	sd	a5,168(s0)
        proc->tf = NULL;
ffffffffc0203e04:	0a043023          	sd	zero,160(s0)
        proc->flags = 0;
ffffffffc0203e08:	0a042823          	sw	zero,176(s0)
        memset(proc->name, 0, sizeof(proc->name));
ffffffffc0203e0c:	4641                	li	a2,16
ffffffffc0203e0e:	4581                	li	a1,0
ffffffffc0203e10:	0b440513          	addi	a0,s0,180
ffffffffc0203e14:	257010ef          	jal	ra,ffffffffc020586a <memset>
        list_init(&(proc->list_link));
ffffffffc0203e18:	0c840713          	addi	a4,s0,200
        list_init(&(proc->hash_link));
ffffffffc0203e1c:	0d840793          	addi	a5,s0,216
    elm->prev = elm->next = elm;
ffffffffc0203e20:	e878                	sd	a4,208(s0)
ffffffffc0203e22:	e478                	sd	a4,200(s0)
ffffffffc0203e24:	f07c                	sd	a5,224(s0)
ffffffffc0203e26:	ec7c                	sd	a5,216(s0)
        proc->exit_code = 0;
ffffffffc0203e28:	0e043423          	sd	zero,232(s0)
         * below fields(add in LAB5) in proc_struct need to be initialized
         *       uint32_t wait_state;                        // waiting state
         *       struct proc_struct *cptr, *yptr, *optr;     // relations between processes
         */
        proc->wait_state = 0;
        proc->cptr = NULL;
ffffffffc0203e2c:	0e043823          	sd	zero,240(s0)
        proc->yptr = NULL;
ffffffffc0203e30:	0e043c23          	sd	zero,248(s0)
        proc->optr = NULL;
ffffffffc0203e34:	10043023          	sd	zero,256(s0)
    }
    return proc;
}
ffffffffc0203e38:	60a2                	ld	ra,8(sp)
ffffffffc0203e3a:	8522                	mv	a0,s0
ffffffffc0203e3c:	6402                	ld	s0,0(sp)
ffffffffc0203e3e:	0141                	addi	sp,sp,16
ffffffffc0203e40:	8082                	ret

ffffffffc0203e42 <forkret>:
// NOTE: the addr of forkret is setted in copy_thread function
//       after switch_to, the current proc will execute here.
static void
forkret(void)
{
    forkrets(current->tf);
ffffffffc0203e42:	000a7797          	auipc	a5,0xa7
ffffffffc0203e46:	8d67b783          	ld	a5,-1834(a5) # ffffffffc02aa718 <current>
ffffffffc0203e4a:	73c8                	ld	a0,160(a5)
ffffffffc0203e4c:	8befd06f          	j	ffffffffc0200f0a <forkrets>

ffffffffc0203e50 <user_main>:
user_main(void *arg)
{
#ifdef TEST
    KERNEL_EXECVE2(TEST, TESTSTART, TESTSIZE);
#else
    KERNEL_EXECVE(exit);
ffffffffc0203e50:	000a7797          	auipc	a5,0xa7
ffffffffc0203e54:	8c87b783          	ld	a5,-1848(a5) # ffffffffc02aa718 <current>
ffffffffc0203e58:	43cc                	lw	a1,4(a5)
{
ffffffffc0203e5a:	7139                	addi	sp,sp,-64
    KERNEL_EXECVE(exit);
ffffffffc0203e5c:	00003617          	auipc	a2,0x3
ffffffffc0203e60:	29c60613          	addi	a2,a2,668 # ffffffffc02070f8 <default_pmm_manager+0xa30>
ffffffffc0203e64:	00003517          	auipc	a0,0x3
ffffffffc0203e68:	29c50513          	addi	a0,a0,668 # ffffffffc0207100 <default_pmm_manager+0xa38>
{
ffffffffc0203e6c:	fc06                	sd	ra,56(sp)
    KERNEL_EXECVE(exit);
ffffffffc0203e6e:	b26fc0ef          	jal	ra,ffffffffc0200194 <cprintf>
ffffffffc0203e72:	3fe07797          	auipc	a5,0x3fe07
ffffffffc0203e76:	2ae78793          	addi	a5,a5,686 # b120 <_binary_obj___user_exit_out_size>
ffffffffc0203e7a:	e43e                	sd	a5,8(sp)
ffffffffc0203e7c:	00003517          	auipc	a0,0x3
ffffffffc0203e80:	27c50513          	addi	a0,a0,636 # ffffffffc02070f8 <default_pmm_manager+0xa30>
ffffffffc0203e84:	00026797          	auipc	a5,0x26
ffffffffc0203e88:	68c78793          	addi	a5,a5,1676 # ffffffffc022a510 <_binary_obj___user_exit_out_start>
ffffffffc0203e8c:	f03e                	sd	a5,32(sp)
ffffffffc0203e8e:	f42a                	sd	a0,40(sp)
    int64_t ret = 0, len = strlen(name);
ffffffffc0203e90:	e802                	sd	zero,16(sp)
ffffffffc0203e92:	137010ef          	jal	ra,ffffffffc02057c8 <strlen>
ffffffffc0203e96:	ec2a                	sd	a0,24(sp)
    asm volatile(
ffffffffc0203e98:	4511                	li	a0,4
ffffffffc0203e9a:	55a2                	lw	a1,40(sp)
ffffffffc0203e9c:	4662                	lw	a2,24(sp)
ffffffffc0203e9e:	5682                	lw	a3,32(sp)
ffffffffc0203ea0:	4722                	lw	a4,8(sp)
ffffffffc0203ea2:	48a9                	li	a7,10
ffffffffc0203ea4:	9002                	ebreak
ffffffffc0203ea6:	c82a                	sw	a0,16(sp)
    cprintf("ret = %d\n", ret);
ffffffffc0203ea8:	65c2                	ld	a1,16(sp)
ffffffffc0203eaa:	00003517          	auipc	a0,0x3
ffffffffc0203eae:	27e50513          	addi	a0,a0,638 # ffffffffc0207128 <default_pmm_manager+0xa60>
ffffffffc0203eb2:	ae2fc0ef          	jal	ra,ffffffffc0200194 <cprintf>
#endif
    panic("user_main execve failed.\n");
ffffffffc0203eb6:	00003617          	auipc	a2,0x3
ffffffffc0203eba:	28260613          	addi	a2,a2,642 # ffffffffc0207138 <default_pmm_manager+0xa70>
ffffffffc0203ebe:	3b700593          	li	a1,951
ffffffffc0203ec2:	00003517          	auipc	a0,0x3
ffffffffc0203ec6:	29650513          	addi	a0,a0,662 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc0203eca:	dc4fc0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0203ece <put_pgdir>:
    return pa2page(PADDR(kva));
ffffffffc0203ece:	6d14                	ld	a3,24(a0)
{
ffffffffc0203ed0:	1141                	addi	sp,sp,-16
ffffffffc0203ed2:	e406                	sd	ra,8(sp)
ffffffffc0203ed4:	c02007b7          	lui	a5,0xc0200
ffffffffc0203ed8:	02f6ee63          	bltu	a3,a5,ffffffffc0203f14 <put_pgdir+0x46>
ffffffffc0203edc:	000a7517          	auipc	a0,0xa7
ffffffffc0203ee0:	83453503          	ld	a0,-1996(a0) # ffffffffc02aa710 <va_pa_offset>
ffffffffc0203ee4:	8e89                	sub	a3,a3,a0
    if (PPN(pa) >= npage)
ffffffffc0203ee6:	82b1                	srli	a3,a3,0xc
ffffffffc0203ee8:	000a7797          	auipc	a5,0xa7
ffffffffc0203eec:	8107b783          	ld	a5,-2032(a5) # ffffffffc02aa6f8 <npage>
ffffffffc0203ef0:	02f6fe63          	bgeu	a3,a5,ffffffffc0203f2c <put_pgdir+0x5e>
    return &pages[PPN(pa) - nbase];
ffffffffc0203ef4:	00004517          	auipc	a0,0x4
ffffffffc0203ef8:	e1453503          	ld	a0,-492(a0) # ffffffffc0207d08 <nbase>
}
ffffffffc0203efc:	60a2                	ld	ra,8(sp)
ffffffffc0203efe:	8e89                	sub	a3,a3,a0
ffffffffc0203f00:	069a                	slli	a3,a3,0x6
    free_page(kva2page(mm->pgdir));
ffffffffc0203f02:	000a6517          	auipc	a0,0xa6
ffffffffc0203f06:	7fe53503          	ld	a0,2046(a0) # ffffffffc02aa700 <pages>
ffffffffc0203f0a:	4585                	li	a1,1
ffffffffc0203f0c:	9536                	add	a0,a0,a3
}
ffffffffc0203f0e:	0141                	addi	sp,sp,16
    free_page(kva2page(mm->pgdir));
ffffffffc0203f10:	fa3fd06f          	j	ffffffffc0201eb2 <free_pages>
    return pa2page(PADDR(kva));
ffffffffc0203f14:	00003617          	auipc	a2,0x3
ffffffffc0203f18:	89460613          	addi	a2,a2,-1900 # ffffffffc02067a8 <default_pmm_manager+0xe0>
ffffffffc0203f1c:	07700593          	li	a1,119
ffffffffc0203f20:	00003517          	auipc	a0,0x3
ffffffffc0203f24:	80850513          	addi	a0,a0,-2040 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc0203f28:	d66fc0ef          	jal	ra,ffffffffc020048e <__panic>
        panic("pa2page called with invalid pa");
ffffffffc0203f2c:	00003617          	auipc	a2,0x3
ffffffffc0203f30:	8a460613          	addi	a2,a2,-1884 # ffffffffc02067d0 <default_pmm_manager+0x108>
ffffffffc0203f34:	06900593          	li	a1,105
ffffffffc0203f38:	00002517          	auipc	a0,0x2
ffffffffc0203f3c:	7f050513          	addi	a0,a0,2032 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc0203f40:	d4efc0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0203f44 <proc_run>:
{
ffffffffc0203f44:	7179                	addi	sp,sp,-48
ffffffffc0203f46:	e84a                	sd	s2,16(sp)
    if (proc != current)
ffffffffc0203f48:	000a6917          	auipc	s2,0xa6
ffffffffc0203f4c:	7d090913          	addi	s2,s2,2000 # ffffffffc02aa718 <current>
{
ffffffffc0203f50:	ec26                	sd	s1,24(sp)
    if (proc != current)
ffffffffc0203f52:	00093483          	ld	s1,0(s2)
{
ffffffffc0203f56:	f406                	sd	ra,40(sp)
ffffffffc0203f58:	f022                	sd	s0,32(sp)
ffffffffc0203f5a:	e44e                	sd	s3,8(sp)
    if (proc != current)
ffffffffc0203f5c:	06a48263          	beq	s1,a0,ffffffffc0203fc0 <proc_run+0x7c>
ffffffffc0203f60:	842a                	mv	s0,a0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0203f62:	100027f3          	csrr	a5,sstatus
ffffffffc0203f66:	8b89                	andi	a5,a5,2
    return 0;
ffffffffc0203f68:	4981                	li	s3,0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0203f6a:	ebb5                	bnez	a5,ffffffffc0203fde <proc_run+0x9a>
	 cprintf("proc_run: about to switch from %s(%d) to %s(%d), pgdir = 0x%x\n", 
ffffffffc0203f6c:	745c                	ld	a5,168(s0)
ffffffffc0203f6e:	4058                	lw	a4,4(s0)
ffffffffc0203f70:	40d0                	lw	a2,4(s1)
ffffffffc0203f72:	0b440693          	addi	a3,s0,180
ffffffffc0203f76:	0b448593          	addi	a1,s1,180
ffffffffc0203f7a:	00003517          	auipc	a0,0x3
ffffffffc0203f7e:	1f650513          	addi	a0,a0,502 # ffffffffc0207170 <default_pmm_manager+0xaa8>
ffffffffc0203f82:	a12fc0ef          	jal	ra,ffffffffc0200194 <cprintf>
#define barrier() __asm__ __volatile__("fence" ::: "memory")

static inline void
lsatp(unsigned long pgdir)
{
  write_csr(satp, 0x8000000000000000 | (pgdir >> RISCV_PGSHIFT));
ffffffffc0203f86:	745c                	ld	a5,168(s0)
ffffffffc0203f88:	577d                	li	a4,-1
ffffffffc0203f8a:	177e                	slli	a4,a4,0x3f
ffffffffc0203f8c:	83b1                	srli	a5,a5,0xc
ffffffffc0203f8e:	8fd9                	or	a5,a5,a4
	current = proc;
ffffffffc0203f90:	00893023          	sd	s0,0(s2)
ffffffffc0203f94:	18079073          	csrw	satp,a5
	cprintf("proc_run: after lsatp, about to switch_to\n");
ffffffffc0203f98:	00003517          	auipc	a0,0x3
ffffffffc0203f9c:	21850513          	addi	a0,a0,536 # ffffffffc02071b0 <default_pmm_manager+0xae8>
ffffffffc0203fa0:	9f4fc0ef          	jal	ra,ffffffffc0200194 <cprintf>
        switch_to(&(prev->context), &(proc->context));
ffffffffc0203fa4:	03048513          	addi	a0,s1,48
ffffffffc0203fa8:	03040593          	addi	a1,s0,48
ffffffffc0203fac:	194010ef          	jal	ra,ffffffffc0205140 <switch_to>
	cprintf("proc_run: after switch_to (should not reach here immediately)\n");
ffffffffc0203fb0:	00003517          	auipc	a0,0x3
ffffffffc0203fb4:	23050513          	addi	a0,a0,560 # ffffffffc02071e0 <default_pmm_manager+0xb18>
ffffffffc0203fb8:	9dcfc0ef          	jal	ra,ffffffffc0200194 <cprintf>
    if (flag)
ffffffffc0203fbc:	00099963          	bnez	s3,ffffffffc0203fce <proc_run+0x8a>
}
ffffffffc0203fc0:	70a2                	ld	ra,40(sp)
ffffffffc0203fc2:	7402                	ld	s0,32(sp)
ffffffffc0203fc4:	64e2                	ld	s1,24(sp)
ffffffffc0203fc6:	6942                	ld	s2,16(sp)
ffffffffc0203fc8:	69a2                	ld	s3,8(sp)
ffffffffc0203fca:	6145                	addi	sp,sp,48
ffffffffc0203fcc:	8082                	ret
ffffffffc0203fce:	7402                	ld	s0,32(sp)
ffffffffc0203fd0:	70a2                	ld	ra,40(sp)
ffffffffc0203fd2:	64e2                	ld	s1,24(sp)
ffffffffc0203fd4:	6942                	ld	s2,16(sp)
ffffffffc0203fd6:	69a2                	ld	s3,8(sp)
ffffffffc0203fd8:	6145                	addi	sp,sp,48
        intr_enable();
ffffffffc0203fda:	9d5fc06f          	j	ffffffffc02009ae <intr_enable>
        intr_disable();
ffffffffc0203fde:	9d7fc0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        return 1;
ffffffffc0203fe2:	4985                	li	s3,1
	struct proc_struct *prev = current;
ffffffffc0203fe4:	00093483          	ld	s1,0(s2)
ffffffffc0203fe8:	b751                	j	ffffffffc0203f6c <proc_run+0x28>

ffffffffc0203fea <do_fork>:
{
ffffffffc0203fea:	7159                	addi	sp,sp,-112
ffffffffc0203fec:	fc56                	sd	s5,56(sp)
    if (nr_process >= MAX_PROCESS)
ffffffffc0203fee:	000a6a97          	auipc	s5,0xa6
ffffffffc0203ff2:	742a8a93          	addi	s5,s5,1858 # ffffffffc02aa730 <nr_process>
ffffffffc0203ff6:	000aa703          	lw	a4,0(s5)
{
ffffffffc0203ffa:	f486                	sd	ra,104(sp)
ffffffffc0203ffc:	f0a2                	sd	s0,96(sp)
ffffffffc0203ffe:	eca6                	sd	s1,88(sp)
ffffffffc0204000:	e8ca                	sd	s2,80(sp)
ffffffffc0204002:	e4ce                	sd	s3,72(sp)
ffffffffc0204004:	e0d2                	sd	s4,64(sp)
ffffffffc0204006:	f85a                	sd	s6,48(sp)
ffffffffc0204008:	f45e                	sd	s7,40(sp)
ffffffffc020400a:	f062                	sd	s8,32(sp)
ffffffffc020400c:	ec66                	sd	s9,24(sp)
ffffffffc020400e:	e86a                	sd	s10,16(sp)
ffffffffc0204010:	e46e                	sd	s11,8(sp)
    if (nr_process >= MAX_PROCESS)
ffffffffc0204012:	6785                	lui	a5,0x1
ffffffffc0204014:	36f75563          	bge	a4,a5,ffffffffc020437e <do_fork+0x394>
ffffffffc0204018:	892a                	mv	s2,a0
ffffffffc020401a:	89ae                	mv	s3,a1
ffffffffc020401c:	84b2                	mv	s1,a2
    if ((proc = alloc_proc()) == NULL)
ffffffffc020401e:	d8dff0ef          	jal	ra,ffffffffc0203daa <alloc_proc>
ffffffffc0204022:	842a                	mv	s0,a0
ffffffffc0204024:	36050463          	beqz	a0,ffffffffc020438c <do_fork+0x3a2>
    struct Page *page = alloc_pages(KSTACKPAGE);
ffffffffc0204028:	4509                	li	a0,2
ffffffffc020402a:	e4bfd0ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
    if (page != NULL)
ffffffffc020402e:	34050663          	beqz	a0,ffffffffc020437a <do_fork+0x390>
    return page - pages + nbase;
ffffffffc0204032:	000a6a17          	auipc	s4,0xa6
ffffffffc0204036:	6cea0a13          	addi	s4,s4,1742 # ffffffffc02aa700 <pages>
ffffffffc020403a:	000a3683          	ld	a3,0(s4)
ffffffffc020403e:	00004b17          	auipc	s6,0x4
ffffffffc0204042:	ccab0b13          	addi	s6,s6,-822 # ffffffffc0207d08 <nbase>
ffffffffc0204046:	000b3d83          	ld	s11,0(s6)
ffffffffc020404a:	40d506b3          	sub	a3,a0,a3
ffffffffc020404e:	8699                	srai	a3,a3,0x6
    return KADDR(page2pa(page));
ffffffffc0204050:	000a6b97          	auipc	s7,0xa6
ffffffffc0204054:	6a8b8b93          	addi	s7,s7,1704 # ffffffffc02aa6f8 <npage>
    return page - pages + nbase;
ffffffffc0204058:	96ee                	add	a3,a3,s11
    return KADDR(page2pa(page));
ffffffffc020405a:	000bb703          	ld	a4,0(s7)
ffffffffc020405e:	00c69793          	slli	a5,a3,0xc
ffffffffc0204062:	83b1                	srli	a5,a5,0xc
    return page2ppn(page) << PGSHIFT;
ffffffffc0204064:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0204066:	32e7fa63          	bgeu	a5,a4,ffffffffc020439a <do_fork+0x3b0>
ffffffffc020406a:	000a6c17          	auipc	s8,0xa6
ffffffffc020406e:	6a6c0c13          	addi	s8,s8,1702 # ffffffffc02aa710 <va_pa_offset>
ffffffffc0204072:	000c3783          	ld	a5,0(s8)
ffffffffc0204076:	96be                	add	a3,a3,a5
        proc->kstack = (uintptr_t)page2kva(page);
ffffffffc0204078:	e814                	sd	a3,16(s0)
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc020407a:	100027f3          	csrr	a5,sstatus
ffffffffc020407e:	8b89                	andi	a5,a5,2
ffffffffc0204080:	2a079e63          	bnez	a5,ffffffffc020433c <do_fork+0x352>
        proc->parent = current;
ffffffffc0204084:	000a6797          	auipc	a5,0xa6
ffffffffc0204088:	6947b783          	ld	a5,1684(a5) # ffffffffc02aa718 <current>
ffffffffc020408c:	f01c                	sd	a5,32(s0)
    struct mm_struct *mm, *oldmm = current->mm;
ffffffffc020408e:	0287bd03          	ld	s10,40(a5)
    if (oldmm == NULL)
ffffffffc0204092:	020d0763          	beqz	s10,ffffffffc02040c0 <do_fork+0xd6>
    if (clone_flags & CLONE_VM)
ffffffffc0204096:	10097913          	andi	s2,s2,256
ffffffffc020409a:	1a090063          	beqz	s2,ffffffffc020423a <do_fork+0x250>
}

static inline int
mm_count_inc(struct mm_struct *mm)
{
    mm->mm_count += 1;
ffffffffc020409e:	030d2783          	lw	a5,48(s10)
    proc->pgdir = PADDR(mm->pgdir);
ffffffffc02040a2:	018d3683          	ld	a3,24(s10)
ffffffffc02040a6:	c0200737          	lui	a4,0xc0200
ffffffffc02040aa:	2785                	addiw	a5,a5,1
ffffffffc02040ac:	02fd2823          	sw	a5,48(s10)
    proc->mm = mm;
ffffffffc02040b0:	03a43423          	sd	s10,40(s0)
    proc->pgdir = PADDR(mm->pgdir);
ffffffffc02040b4:	34e6e363          	bltu	a3,a4,ffffffffc02043fa <do_fork+0x410>
ffffffffc02040b8:	000c3783          	ld	a5,0(s8)
ffffffffc02040bc:	8e9d                	sub	a3,a3,a5
ffffffffc02040be:	f454                	sd	a3,168(s0)
    proc->tf = (struct trapframe *)(proc->kstack + KSTACKSIZE) - 1;
ffffffffc02040c0:	01043883          	ld	a7,16(s0)
ffffffffc02040c4:	6709                	lui	a4,0x2
ffffffffc02040c6:	ee070713          	addi	a4,a4,-288 # 1ee0 <_binary_obj___user_faultread_out_size-0x7cc8>
ffffffffc02040ca:	9746                	add	a4,a4,a7
ffffffffc02040cc:	f058                	sd	a4,160(s0)
    *(proc->tf) = *tf;
ffffffffc02040ce:	87ba                	mv	a5,a4
ffffffffc02040d0:	12048813          	addi	a6,s1,288
ffffffffc02040d4:	6088                	ld	a0,0(s1)
ffffffffc02040d6:	648c                	ld	a1,8(s1)
ffffffffc02040d8:	6890                	ld	a2,16(s1)
ffffffffc02040da:	6c94                	ld	a3,24(s1)
ffffffffc02040dc:	e388                	sd	a0,0(a5)
ffffffffc02040de:	e78c                	sd	a1,8(a5)
ffffffffc02040e0:	eb90                	sd	a2,16(a5)
ffffffffc02040e2:	ef94                	sd	a3,24(a5)
ffffffffc02040e4:	02048493          	addi	s1,s1,32
ffffffffc02040e8:	02078793          	addi	a5,a5,32
ffffffffc02040ec:	ff0494e3          	bne	s1,a6,ffffffffc02040d4 <do_fork+0xea>
    proc->tf->gpr.a0 = 0;
ffffffffc02040f0:	04073823          	sd	zero,80(a4)
    proc->tf->gpr.sp = (esp == 0) ? (uintptr_t)proc->tf-8 : esp;
ffffffffc02040f4:	26098263          	beqz	s3,ffffffffc0204358 <do_fork+0x36e>
ffffffffc02040f8:	01373823          	sd	s3,16(a4)
    proc->context.ra = (uintptr_t)forkret;
ffffffffc02040fc:	00000797          	auipc	a5,0x0
ffffffffc0204100:	d4678793          	addi	a5,a5,-698 # ffffffffc0203e42 <forkret>
ffffffffc0204104:	f81c                	sd	a5,48(s0)
    proc->context.sp = (uintptr_t)(proc->tf);
ffffffffc0204106:	fc18                	sd	a4,56(s0)
ffffffffc0204108:	100027f3          	csrr	a5,sstatus
ffffffffc020410c:	8b89                	andi	a5,a5,2
    return 0;
ffffffffc020410e:	4901                	li	s2,0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0204110:	26079163          	bnez	a5,ffffffffc0204372 <do_fork+0x388>
         cprintf("do_fork: before get_pid, proc=%p parent=%p\n", proc, proc->parent);
ffffffffc0204114:	7010                	ld	a2,32(s0)
ffffffffc0204116:	85a2                	mv	a1,s0
ffffffffc0204118:	00003517          	auipc	a0,0x3
ffffffffc020411c:	13050513          	addi	a0,a0,304 # ffffffffc0207248 <default_pmm_manager+0xb80>
ffffffffc0204120:	874fc0ef          	jal	ra,ffffffffc0200194 <cprintf>
    if (++last_pid >= MAX_PID)
ffffffffc0204124:	000a2817          	auipc	a6,0xa2
ffffffffc0204128:	16480813          	addi	a6,a6,356 # ffffffffc02a6288 <last_pid.1>
ffffffffc020412c:	00082783          	lw	a5,0(a6)
ffffffffc0204130:	6709                	lui	a4,0x2
ffffffffc0204132:	0017861b          	addiw	a2,a5,1
ffffffffc0204136:	00c82023          	sw	a2,0(a6)
ffffffffc020413a:	18e65a63          	bge	a2,a4,ffffffffc02042ce <do_fork+0x2e4>
    if (last_pid >= next_safe)
ffffffffc020413e:	000a2317          	auipc	t1,0xa2
ffffffffc0204142:	14e30313          	addi	t1,t1,334 # ffffffffc02a628c <next_safe.0>
ffffffffc0204146:	00032783          	lw	a5,0(t1)
ffffffffc020414a:	000a6497          	auipc	s1,0xa6
ffffffffc020414e:	55e48493          	addi	s1,s1,1374 # ffffffffc02aa6a8 <proc_list>
ffffffffc0204152:	18f65663          	bge	a2,a5,ffffffffc02042de <do_fork+0x2f4>
        cprintf("do_fork: after get_pid, proc=%p pid=%d parent=%p\n", proc, proc->pid, proc->parent);
ffffffffc0204156:	7014                	ld	a3,32(s0)
        proc->pid = get_pid();
ffffffffc0204158:	c050                	sw	a2,4(s0)
        cprintf("do_fork: after get_pid, proc=%p pid=%d parent=%p\n", proc, proc->pid, proc->parent);
ffffffffc020415a:	85a2                	mv	a1,s0
ffffffffc020415c:	00003517          	auipc	a0,0x3
ffffffffc0204160:	11c50513          	addi	a0,a0,284 # ffffffffc0207278 <default_pmm_manager+0xbb0>
ffffffffc0204164:	830fc0ef          	jal	ra,ffffffffc0200194 <cprintf>
    list_add(hash_list + pid_hashfn(proc->pid), &(proc->hash_link));
ffffffffc0204168:	4048                	lw	a0,4(s0)
ffffffffc020416a:	45a9                	li	a1,10
ffffffffc020416c:	258010ef          	jal	ra,ffffffffc02053c4 <hash32>
ffffffffc0204170:	02051793          	slli	a5,a0,0x20
ffffffffc0204174:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0204178:	000a2797          	auipc	a5,0xa2
ffffffffc020417c:	53078793          	addi	a5,a5,1328 # ffffffffc02a66a8 <hash_list>
ffffffffc0204180:	953e                	add	a0,a0,a5
    __list_add(elm, listelm, listelm->next);
ffffffffc0204182:	6518                	ld	a4,8(a0)
ffffffffc0204184:	0d840793          	addi	a5,s0,216
        cprintf("do_fork: after hash_proc, proc=%p parent=%p\n", proc, proc->parent);
ffffffffc0204188:	7010                	ld	a2,32(s0)
    prev->next = next->prev = elm;
ffffffffc020418a:	e31c                	sd	a5,0(a4)
ffffffffc020418c:	e51c                	sd	a5,8(a0)
    elm->next = next;
ffffffffc020418e:	f078                	sd	a4,224(s0)
    elm->prev = prev;
ffffffffc0204190:	ec68                	sd	a0,216(s0)
ffffffffc0204192:	85a2                	mv	a1,s0
ffffffffc0204194:	00003517          	auipc	a0,0x3
ffffffffc0204198:	11c50513          	addi	a0,a0,284 # ffffffffc02072b0 <default_pmm_manager+0xbe8>
ffffffffc020419c:	ff9fb0ef          	jal	ra,ffffffffc0200194 <cprintf>
    if ((proc->optr = proc->parent->cptr) != NULL)
ffffffffc02041a0:	7014                	ld	a3,32(s0)
    __list_add(elm, listelm, listelm->next);
ffffffffc02041a2:	6490                	ld	a2,8(s1)
    list_add(&proc_list, &(proc->list_link));
ffffffffc02041a4:	0c840793          	addi	a5,s0,200
    if ((proc->optr = proc->parent->cptr) != NULL)
ffffffffc02041a8:	7af8                	ld	a4,240(a3)
    prev->next = next->prev = elm;
ffffffffc02041aa:	e21c                	sd	a5,0(a2)
ffffffffc02041ac:	e49c                	sd	a5,8(s1)
    elm->next = next;
ffffffffc02041ae:	e870                	sd	a2,208(s0)
    elm->prev = prev;
ffffffffc02041b0:	e464                	sd	s1,200(s0)
    proc->yptr = NULL;
ffffffffc02041b2:	0e043c23          	sd	zero,248(s0)
    if ((proc->optr = proc->parent->cptr) != NULL)
ffffffffc02041b6:	10e43023          	sd	a4,256(s0)
ffffffffc02041ba:	c311                	beqz	a4,ffffffffc02041be <do_fork+0x1d4>
        proc->optr->yptr = proc;
ffffffffc02041bc:	ff60                	sd	s0,248(a4)
    nr_process++;
ffffffffc02041be:	000aa783          	lw	a5,0(s5)
        cprintf("do_fork: after set_links, proc=%p pid=%d parent=%p\n", proc, proc->pid, proc->parent);
ffffffffc02041c2:	4050                	lw	a2,4(s0)
ffffffffc02041c4:	85a2                	mv	a1,s0
    nr_process++;
ffffffffc02041c6:	2785                	addiw	a5,a5,1
    proc->parent->cptr = proc;
ffffffffc02041c8:	fae0                	sd	s0,240(a3)
        cprintf("do_fork: after set_links, proc=%p pid=%d parent=%p\n", proc, proc->pid, proc->parent);
ffffffffc02041ca:	00003517          	auipc	a0,0x3
ffffffffc02041ce:	11650513          	addi	a0,a0,278 # ffffffffc02072e0 <default_pmm_manager+0xc18>
    nr_process++;
ffffffffc02041d2:	00faa023          	sw	a5,0(s5)
        cprintf("do_fork: after set_links, proc=%p pid=%d parent=%p\n", proc, proc->pid, proc->parent);
ffffffffc02041d6:	fbffb0ef          	jal	ra,ffffffffc0200194 <cprintf>
    if (flag)
ffffffffc02041da:	18091463          	bnez	s2,ffffffffc0204362 <do_fork+0x378>
    wakeup_proc(proc);
ffffffffc02041de:	8522                	mv	a0,s0
ffffffffc02041e0:	7cb000ef          	jal	ra,ffffffffc02051aa <wakeup_proc>
    ret = proc->pid;
ffffffffc02041e4:	4044                	lw	s1,4(s0)
    free_pages(kva2page((void *)(proc->kstack)), KSTACKPAGE);
ffffffffc02041e6:	6814                	ld	a3,16(s0)
    return pa2page(PADDR(kva));
ffffffffc02041e8:	c02007b7          	lui	a5,0xc0200
ffffffffc02041ec:	1cf6e363          	bltu	a3,a5,ffffffffc02043b2 <do_fork+0x3c8>
ffffffffc02041f0:	000c3703          	ld	a4,0(s8)
    if (PPN(pa) >= npage)
ffffffffc02041f4:	000bb783          	ld	a5,0(s7)
    return pa2page(PADDR(kva));
ffffffffc02041f8:	8e99                	sub	a3,a3,a4
    if (PPN(pa) >= npage)
ffffffffc02041fa:	82b1                	srli	a3,a3,0xc
ffffffffc02041fc:	1cf6f763          	bgeu	a3,a5,ffffffffc02043ca <do_fork+0x3e0>
    return &pages[PPN(pa) - nbase];
ffffffffc0204200:	000b3783          	ld	a5,0(s6)
ffffffffc0204204:	000a3503          	ld	a0,0(s4)
ffffffffc0204208:	4589                	li	a1,2
ffffffffc020420a:	8e9d                	sub	a3,a3,a5
ffffffffc020420c:	069a                	slli	a3,a3,0x6
ffffffffc020420e:	9536                	add	a0,a0,a3
ffffffffc0204210:	ca3fd0ef          	jal	ra,ffffffffc0201eb2 <free_pages>
    kfree(proc);
ffffffffc0204214:	8522                	mv	a0,s0
ffffffffc0204216:	b31fd0ef          	jal	ra,ffffffffc0201d46 <kfree>
}
ffffffffc020421a:	70a6                	ld	ra,104(sp)
ffffffffc020421c:	7406                	ld	s0,96(sp)
ffffffffc020421e:	6946                	ld	s2,80(sp)
ffffffffc0204220:	69a6                	ld	s3,72(sp)
ffffffffc0204222:	6a06                	ld	s4,64(sp)
ffffffffc0204224:	7ae2                	ld	s5,56(sp)
ffffffffc0204226:	7b42                	ld	s6,48(sp)
ffffffffc0204228:	7ba2                	ld	s7,40(sp)
ffffffffc020422a:	7c02                	ld	s8,32(sp)
ffffffffc020422c:	6ce2                	ld	s9,24(sp)
ffffffffc020422e:	6d42                	ld	s10,16(sp)
ffffffffc0204230:	6da2                	ld	s11,8(sp)
ffffffffc0204232:	8526                	mv	a0,s1
ffffffffc0204234:	64e6                	ld	s1,88(sp)
ffffffffc0204236:	6165                	addi	sp,sp,112
ffffffffc0204238:	8082                	ret
    if ((mm = mm_create()) == NULL)
ffffffffc020423a:	c5eff0ef          	jal	ra,ffffffffc0203698 <mm_create>
ffffffffc020423e:	8caa                	mv	s9,a0
ffffffffc0204240:	14050b63          	beqz	a0,ffffffffc0204396 <do_fork+0x3ac>
    if ((page = alloc_page()) == NULL)
ffffffffc0204244:	4505                	li	a0,1
ffffffffc0204246:	c2ffd0ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc020424a:	cd2d                	beqz	a0,ffffffffc02042c4 <do_fork+0x2da>
    return page - pages + nbase;
ffffffffc020424c:	000a3683          	ld	a3,0(s4)
    return KADDR(page2pa(page));
ffffffffc0204250:	000bb703          	ld	a4,0(s7)
    return page - pages + nbase;
ffffffffc0204254:	40d506b3          	sub	a3,a0,a3
ffffffffc0204258:	8699                	srai	a3,a3,0x6
ffffffffc020425a:	96ee                	add	a3,a3,s11
    return KADDR(page2pa(page));
ffffffffc020425c:	00c69793          	slli	a5,a3,0xc
ffffffffc0204260:	83b1                	srli	a5,a5,0xc
    return page2ppn(page) << PGSHIFT;
ffffffffc0204262:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0204264:	12e7fb63          	bgeu	a5,a4,ffffffffc020439a <do_fork+0x3b0>
ffffffffc0204268:	000c3903          	ld	s2,0(s8)
    memcpy(pgdir, boot_pgdir_va, PGSIZE);
ffffffffc020426c:	6605                	lui	a2,0x1
ffffffffc020426e:	000a6597          	auipc	a1,0xa6
ffffffffc0204272:	4825b583          	ld	a1,1154(a1) # ffffffffc02aa6f0 <boot_pgdir_va>
ffffffffc0204276:	9936                	add	s2,s2,a3
ffffffffc0204278:	854a                	mv	a0,s2
ffffffffc020427a:	602010ef          	jal	ra,ffffffffc020587c <memcpy>
static inline void
lock_mm(struct mm_struct *mm)
{
    if (mm != NULL)
    {
        lock(&(mm->mm_lock));
ffffffffc020427e:	038d0d93          	addi	s11,s10,56
    mm->pgdir = pgdir;
ffffffffc0204282:	012cbc23          	sd	s2,24(s9)
 * test_and_set_bit - Atomically set a bit and return its old value
 * @nr:     the bit to set
 * @addr:   the address to count from
 * */
static inline bool test_and_set_bit(int nr, volatile void *addr) {
    return __test_and_op_bit(or, __NOP, nr, ((volatile unsigned long *)addr));
ffffffffc0204286:	4785                	li	a5,1
ffffffffc0204288:	40fdb7af          	amoor.d	a5,a5,(s11)
}

static inline void
lock(lock_t *lock)
{
    while (!try_lock(lock))
ffffffffc020428c:	8b85                	andi	a5,a5,1
ffffffffc020428e:	4905                	li	s2,1
ffffffffc0204290:	c799                	beqz	a5,ffffffffc020429e <do_fork+0x2b4>
    {
        schedule();
ffffffffc0204292:	799000ef          	jal	ra,ffffffffc020522a <schedule>
ffffffffc0204296:	412db7af          	amoor.d	a5,s2,(s11)
    while (!try_lock(lock))
ffffffffc020429a:	8b85                	andi	a5,a5,1
ffffffffc020429c:	fbfd                	bnez	a5,ffffffffc0204292 <do_fork+0x2a8>
        ret = dup_mmap(mm, oldmm);
ffffffffc020429e:	85ea                	mv	a1,s10
ffffffffc02042a0:	8566                	mv	a0,s9
ffffffffc02042a2:	e38ff0ef          	jal	ra,ffffffffc02038da <dup_mmap>
 * test_and_clear_bit - Atomically clear a bit and return its old value
 * @nr:     the bit to clear
 * @addr:   the address to count from
 * */
static inline bool test_and_clear_bit(int nr, volatile void *addr) {
    return __test_and_op_bit(and, __NOT, nr, ((volatile unsigned long *)addr));
ffffffffc02042a6:	57f9                	li	a5,-2
ffffffffc02042a8:	60fdb7af          	amoand.d	a5,a5,(s11)
ffffffffc02042ac:	8b85                	andi	a5,a5,1
}

static inline void
unlock(lock_t *lock)
{
    if (!test_and_clear_bit(0, lock))
ffffffffc02042ae:	12078a63          	beqz	a5,ffffffffc02043e2 <do_fork+0x3f8>
good_mm:
ffffffffc02042b2:	8d66                	mv	s10,s9
    if (ret != 0)
ffffffffc02042b4:	de0505e3          	beqz	a0,ffffffffc020409e <do_fork+0xb4>
    exit_mmap(mm);
ffffffffc02042b8:	8566                	mv	a0,s9
ffffffffc02042ba:	ebaff0ef          	jal	ra,ffffffffc0203974 <exit_mmap>
    put_pgdir(mm);
ffffffffc02042be:	8566                	mv	a0,s9
ffffffffc02042c0:	c0fff0ef          	jal	ra,ffffffffc0203ece <put_pgdir>
    mm_destroy(mm);
ffffffffc02042c4:	8566                	mv	a0,s9
ffffffffc02042c6:	d12ff0ef          	jal	ra,ffffffffc02037d8 <mm_destroy>
    ret = -E_NO_MEM;
ffffffffc02042ca:	54f1                	li	s1,-4
ffffffffc02042cc:	bf29                	j	ffffffffc02041e6 <do_fork+0x1fc>
        last_pid = 1;
ffffffffc02042ce:	4785                	li	a5,1
ffffffffc02042d0:	00f82023          	sw	a5,0(a6)
        goto inside;
ffffffffc02042d4:	4605                	li	a2,1
ffffffffc02042d6:	000a2317          	auipc	t1,0xa2
ffffffffc02042da:	fb630313          	addi	t1,t1,-74 # ffffffffc02a628c <next_safe.0>
    return listelm->next;
ffffffffc02042de:	000a6497          	auipc	s1,0xa6
ffffffffc02042e2:	3ca48493          	addi	s1,s1,970 # ffffffffc02aa6a8 <proc_list>
ffffffffc02042e6:	0084be03          	ld	t3,8(s1)
        next_safe = MAX_PID;
ffffffffc02042ea:	6789                	lui	a5,0x2
ffffffffc02042ec:	00f32023          	sw	a5,0(t1)
ffffffffc02042f0:	86b2                	mv	a3,a2
ffffffffc02042f2:	4501                	li	a0,0
        while ((le = list_next(le)) != list)
ffffffffc02042f4:	6e89                	lui	t4,0x2
ffffffffc02042f6:	089e0663          	beq	t3,s1,ffffffffc0204382 <do_fork+0x398>
ffffffffc02042fa:	88aa                	mv	a7,a0
ffffffffc02042fc:	87f2                	mv	a5,t3
ffffffffc02042fe:	6589                	lui	a1,0x2
ffffffffc0204300:	a811                	j	ffffffffc0204314 <do_fork+0x32a>
            else if (proc->pid > last_pid && next_safe > proc->pid)
ffffffffc0204302:	00e6d663          	bge	a3,a4,ffffffffc020430e <do_fork+0x324>
ffffffffc0204306:	00b75463          	bge	a4,a1,ffffffffc020430e <do_fork+0x324>
ffffffffc020430a:	85ba                	mv	a1,a4
ffffffffc020430c:	4885                	li	a7,1
ffffffffc020430e:	679c                	ld	a5,8(a5)
        while ((le = list_next(le)) != list)
ffffffffc0204310:	00978d63          	beq	a5,s1,ffffffffc020432a <do_fork+0x340>
            if (proc->pid == last_pid)
ffffffffc0204314:	f3c7a703          	lw	a4,-196(a5) # 1f3c <_binary_obj___user_faultread_out_size-0x7c6c>
ffffffffc0204318:	fed715e3          	bne	a4,a3,ffffffffc0204302 <do_fork+0x318>
                if (++last_pid >= next_safe)
ffffffffc020431c:	2685                	addiw	a3,a3,1
ffffffffc020431e:	04b6d563          	bge	a3,a1,ffffffffc0204368 <do_fork+0x37e>
ffffffffc0204322:	679c                	ld	a5,8(a5)
ffffffffc0204324:	4505                	li	a0,1
        while ((le = list_next(le)) != list)
ffffffffc0204326:	fe9797e3          	bne	a5,s1,ffffffffc0204314 <do_fork+0x32a>
ffffffffc020432a:	c501                	beqz	a0,ffffffffc0204332 <do_fork+0x348>
ffffffffc020432c:	00d82023          	sw	a3,0(a6)
ffffffffc0204330:	8636                	mv	a2,a3
ffffffffc0204332:	e20882e3          	beqz	a7,ffffffffc0204156 <do_fork+0x16c>
ffffffffc0204336:	00b32023          	sw	a1,0(t1)
ffffffffc020433a:	bd31                	j	ffffffffc0204156 <do_fork+0x16c>
        intr_disable();
ffffffffc020433c:	e78fc0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        proc->parent = current;
ffffffffc0204340:	000a6c97          	auipc	s9,0xa6
ffffffffc0204344:	3d8c8c93          	addi	s9,s9,984 # ffffffffc02aa718 <current>
ffffffffc0204348:	000cb783          	ld	a5,0(s9)
ffffffffc020434c:	f01c                	sd	a5,32(s0)
        intr_enable();
ffffffffc020434e:	e60fc0ef          	jal	ra,ffffffffc02009ae <intr_enable>
    struct mm_struct *mm, *oldmm = current->mm;
ffffffffc0204352:	000cb783          	ld	a5,0(s9)
ffffffffc0204356:	bb25                	j	ffffffffc020408e <do_fork+0xa4>
    proc->tf->gpr.sp = (esp == 0) ? (uintptr_t)proc->tf-8 : esp;
ffffffffc0204358:	6989                	lui	s3,0x2
ffffffffc020435a:	ed898993          	addi	s3,s3,-296 # 1ed8 <_binary_obj___user_faultread_out_size-0x7cd0>
ffffffffc020435e:	99c6                	add	s3,s3,a7
ffffffffc0204360:	bb61                	j	ffffffffc02040f8 <do_fork+0x10e>
ffffffffc0204362:	e4cfc0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0204366:	bda5                	j	ffffffffc02041de <do_fork+0x1f4>
                    if (last_pid >= MAX_PID)
ffffffffc0204368:	01d6c363          	blt	a3,t4,ffffffffc020436e <do_fork+0x384>
                        last_pid = 1;
ffffffffc020436c:	4685                	li	a3,1
                    goto repeat;
ffffffffc020436e:	4505                	li	a0,1
ffffffffc0204370:	b759                	j	ffffffffc02042f6 <do_fork+0x30c>
        intr_disable();
ffffffffc0204372:	e42fc0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        return 1;
ffffffffc0204376:	4905                	li	s2,1
ffffffffc0204378:	bb71                	j	ffffffffc0204114 <do_fork+0x12a>
    ret = -E_NO_MEM;
ffffffffc020437a:	54f1                	li	s1,-4
ffffffffc020437c:	bd61                	j	ffffffffc0204214 <do_fork+0x22a>
    int ret = -E_NO_FREE_PROC;
ffffffffc020437e:	54ed                	li	s1,-5
ffffffffc0204380:	bd69                	j	ffffffffc020421a <do_fork+0x230>
ffffffffc0204382:	c519                	beqz	a0,ffffffffc0204390 <do_fork+0x3a6>
ffffffffc0204384:	00d82023          	sw	a3,0(a6)
    return last_pid;
ffffffffc0204388:	8636                	mv	a2,a3
ffffffffc020438a:	b3f1                	j	ffffffffc0204156 <do_fork+0x16c>
    ret = -E_NO_MEM;
ffffffffc020438c:	54f1                	li	s1,-4
    return ret;
ffffffffc020438e:	b571                	j	ffffffffc020421a <do_fork+0x230>
    return last_pid;
ffffffffc0204390:	00082603          	lw	a2,0(a6)
ffffffffc0204394:	b3c9                	j	ffffffffc0204156 <do_fork+0x16c>
    ret = -E_NO_MEM;
ffffffffc0204396:	54f1                	li	s1,-4
ffffffffc0204398:	b5b9                	j	ffffffffc02041e6 <do_fork+0x1fc>
ffffffffc020439a:	00002617          	auipc	a2,0x2
ffffffffc020439e:	36660613          	addi	a2,a2,870 # ffffffffc0206700 <default_pmm_manager+0x38>
ffffffffc02043a2:	07100593          	li	a1,113
ffffffffc02043a6:	00002517          	auipc	a0,0x2
ffffffffc02043aa:	38250513          	addi	a0,a0,898 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc02043ae:	8e0fc0ef          	jal	ra,ffffffffc020048e <__panic>
    return pa2page(PADDR(kva));
ffffffffc02043b2:	00002617          	auipc	a2,0x2
ffffffffc02043b6:	3f660613          	addi	a2,a2,1014 # ffffffffc02067a8 <default_pmm_manager+0xe0>
ffffffffc02043ba:	07700593          	li	a1,119
ffffffffc02043be:	00002517          	auipc	a0,0x2
ffffffffc02043c2:	36a50513          	addi	a0,a0,874 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc02043c6:	8c8fc0ef          	jal	ra,ffffffffc020048e <__panic>
        panic("pa2page called with invalid pa");
ffffffffc02043ca:	00002617          	auipc	a2,0x2
ffffffffc02043ce:	40660613          	addi	a2,a2,1030 # ffffffffc02067d0 <default_pmm_manager+0x108>
ffffffffc02043d2:	06900593          	li	a1,105
ffffffffc02043d6:	00002517          	auipc	a0,0x2
ffffffffc02043da:	35250513          	addi	a0,a0,850 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc02043de:	8b0fc0ef          	jal	ra,ffffffffc020048e <__panic>
    {
        panic("Unlock failed.\n");
ffffffffc02043e2:	00003617          	auipc	a2,0x3
ffffffffc02043e6:	e3e60613          	addi	a2,a2,-450 # ffffffffc0207220 <default_pmm_manager+0xb58>
ffffffffc02043ea:	03f00593          	li	a1,63
ffffffffc02043ee:	00003517          	auipc	a0,0x3
ffffffffc02043f2:	e4250513          	addi	a0,a0,-446 # ffffffffc0207230 <default_pmm_manager+0xb68>
ffffffffc02043f6:	898fc0ef          	jal	ra,ffffffffc020048e <__panic>
    proc->pgdir = PADDR(mm->pgdir);
ffffffffc02043fa:	00002617          	auipc	a2,0x2
ffffffffc02043fe:	3ae60613          	addi	a2,a2,942 # ffffffffc02067a8 <default_pmm_manager+0xe0>
ffffffffc0204402:	19e00593          	li	a1,414
ffffffffc0204406:	00003517          	auipc	a0,0x3
ffffffffc020440a:	d5250513          	addi	a0,a0,-686 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc020440e:	880fc0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0204412 <kernel_thread>:
{
ffffffffc0204412:	7129                	addi	sp,sp,-320
ffffffffc0204414:	fa22                	sd	s0,304(sp)
ffffffffc0204416:	f626                	sd	s1,296(sp)
ffffffffc0204418:	f24a                	sd	s2,288(sp)
ffffffffc020441a:	84ae                	mv	s1,a1
ffffffffc020441c:	892a                	mv	s2,a0
ffffffffc020441e:	8432                	mv	s0,a2
    memset(&tf, 0, sizeof(struct trapframe));
ffffffffc0204420:	4581                	li	a1,0
ffffffffc0204422:	12000613          	li	a2,288
ffffffffc0204426:	850a                	mv	a0,sp
{
ffffffffc0204428:	fe06                	sd	ra,312(sp)
    memset(&tf, 0, sizeof(struct trapframe));
ffffffffc020442a:	440010ef          	jal	ra,ffffffffc020586a <memset>
    tf.gpr.s0 = (uintptr_t)fn;
ffffffffc020442e:	e0ca                	sd	s2,64(sp)
    tf.gpr.s1 = (uintptr_t)arg;
ffffffffc0204430:	e4a6                	sd	s1,72(sp)
    tf.status = (read_csr(sstatus) | SSTATUS_SPP | SSTATUS_SPIE) & ~SSTATUS_SIE;
ffffffffc0204432:	100027f3          	csrr	a5,sstatus
ffffffffc0204436:	edd7f793          	andi	a5,a5,-291
ffffffffc020443a:	1207e793          	ori	a5,a5,288
ffffffffc020443e:	e23e                	sd	a5,256(sp)
    return do_fork(clone_flags | CLONE_VM, 0, &tf);
ffffffffc0204440:	860a                	mv	a2,sp
ffffffffc0204442:	10046513          	ori	a0,s0,256
    tf.epc = (uintptr_t)kernel_thread_entry;
ffffffffc0204446:	00000797          	auipc	a5,0x0
ffffffffc020444a:	95c78793          	addi	a5,a5,-1700 # ffffffffc0203da2 <kernel_thread_entry>
    return do_fork(clone_flags | CLONE_VM, 0, &tf);
ffffffffc020444e:	4581                	li	a1,0
    tf.epc = (uintptr_t)kernel_thread_entry;
ffffffffc0204450:	e63e                	sd	a5,264(sp)
    return do_fork(clone_flags | CLONE_VM, 0, &tf);
ffffffffc0204452:	b99ff0ef          	jal	ra,ffffffffc0203fea <do_fork>
}
ffffffffc0204456:	70f2                	ld	ra,312(sp)
ffffffffc0204458:	7452                	ld	s0,304(sp)
ffffffffc020445a:	74b2                	ld	s1,296(sp)
ffffffffc020445c:	7912                	ld	s2,288(sp)
ffffffffc020445e:	6131                	addi	sp,sp,320
ffffffffc0204460:	8082                	ret

ffffffffc0204462 <do_exit>:
{
ffffffffc0204462:	7179                	addi	sp,sp,-48
ffffffffc0204464:	f022                	sd	s0,32(sp)
    if (current == idleproc)
ffffffffc0204466:	000a6417          	auipc	s0,0xa6
ffffffffc020446a:	2b240413          	addi	s0,s0,690 # ffffffffc02aa718 <current>
ffffffffc020446e:	601c                	ld	a5,0(s0)
{
ffffffffc0204470:	f406                	sd	ra,40(sp)
ffffffffc0204472:	ec26                	sd	s1,24(sp)
ffffffffc0204474:	e84a                	sd	s2,16(sp)
ffffffffc0204476:	e44e                	sd	s3,8(sp)
ffffffffc0204478:	e052                	sd	s4,0(sp)
    if (current == idleproc)
ffffffffc020447a:	000a6717          	auipc	a4,0xa6
ffffffffc020447e:	2a673703          	ld	a4,678(a4) # ffffffffc02aa720 <idleproc>
ffffffffc0204482:	0ce78c63          	beq	a5,a4,ffffffffc020455a <do_exit+0xf8>
    if (current == initproc)
ffffffffc0204486:	000a6497          	auipc	s1,0xa6
ffffffffc020448a:	2a248493          	addi	s1,s1,674 # ffffffffc02aa728 <initproc>
ffffffffc020448e:	6098                	ld	a4,0(s1)
ffffffffc0204490:	0ee78b63          	beq	a5,a4,ffffffffc0204586 <do_exit+0x124>
    struct mm_struct *mm = current->mm;
ffffffffc0204494:	0287b983          	ld	s3,40(a5)
ffffffffc0204498:	892a                	mv	s2,a0
    if (mm != NULL)
ffffffffc020449a:	02098663          	beqz	s3,ffffffffc02044c6 <do_exit+0x64>
ffffffffc020449e:	000a6797          	auipc	a5,0xa6
ffffffffc02044a2:	24a7b783          	ld	a5,586(a5) # ffffffffc02aa6e8 <boot_pgdir_pa>
ffffffffc02044a6:	577d                	li	a4,-1
ffffffffc02044a8:	177e                	slli	a4,a4,0x3f
ffffffffc02044aa:	83b1                	srli	a5,a5,0xc
ffffffffc02044ac:	8fd9                	or	a5,a5,a4
ffffffffc02044ae:	18079073          	csrw	satp,a5
    mm->mm_count -= 1;
ffffffffc02044b2:	0309a783          	lw	a5,48(s3)
ffffffffc02044b6:	fff7871b          	addiw	a4,a5,-1
ffffffffc02044ba:	02e9a823          	sw	a4,48(s3)
        if (mm_count_dec(mm) == 0)
ffffffffc02044be:	cb55                	beqz	a4,ffffffffc0204572 <do_exit+0x110>
        current->mm = NULL;
ffffffffc02044c0:	601c                	ld	a5,0(s0)
ffffffffc02044c2:	0207b423          	sd	zero,40(a5)
    current->state = PROC_ZOMBIE;
ffffffffc02044c6:	601c                	ld	a5,0(s0)
ffffffffc02044c8:	470d                	li	a4,3
ffffffffc02044ca:	c398                	sw	a4,0(a5)
    current->exit_code = error_code;
ffffffffc02044cc:	0f27a423          	sw	s2,232(a5)
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02044d0:	100027f3          	csrr	a5,sstatus
ffffffffc02044d4:	8b89                	andi	a5,a5,2
    return 0;
ffffffffc02044d6:	4a01                	li	s4,0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02044d8:	e3f9                	bnez	a5,ffffffffc020459e <do_exit+0x13c>
        proc = current->parent;
ffffffffc02044da:	6018                	ld	a4,0(s0)
        if (proc->wait_state == WT_CHILD)
ffffffffc02044dc:	800007b7          	lui	a5,0x80000
ffffffffc02044e0:	0785                	addi	a5,a5,1
        proc = current->parent;
ffffffffc02044e2:	7308                	ld	a0,32(a4)
        if (proc->wait_state == WT_CHILD)
ffffffffc02044e4:	0ec52703          	lw	a4,236(a0)
ffffffffc02044e8:	0af70f63          	beq	a4,a5,ffffffffc02045a6 <do_exit+0x144>
        while (current->cptr != NULL)
ffffffffc02044ec:	6018                	ld	a4,0(s0)
ffffffffc02044ee:	7b7c                	ld	a5,240(a4)
ffffffffc02044f0:	c3a1                	beqz	a5,ffffffffc0204530 <do_exit+0xce>
                if (initproc->wait_state == WT_CHILD)
ffffffffc02044f2:	800009b7          	lui	s3,0x80000
            if (proc->state == PROC_ZOMBIE)
ffffffffc02044f6:	490d                	li	s2,3
                if (initproc->wait_state == WT_CHILD)
ffffffffc02044f8:	0985                	addi	s3,s3,1
ffffffffc02044fa:	a021                	j	ffffffffc0204502 <do_exit+0xa0>
        while (current->cptr != NULL)
ffffffffc02044fc:	6018                	ld	a4,0(s0)
ffffffffc02044fe:	7b7c                	ld	a5,240(a4)
ffffffffc0204500:	cb85                	beqz	a5,ffffffffc0204530 <do_exit+0xce>
            current->cptr = proc->optr;
ffffffffc0204502:	1007b683          	ld	a3,256(a5) # ffffffff80000100 <_binary_obj___user_exit_out_size+0xffffffff7fff4fe0>
            if ((proc->optr = initproc->cptr) != NULL)
ffffffffc0204506:	6088                	ld	a0,0(s1)
            current->cptr = proc->optr;
ffffffffc0204508:	fb74                	sd	a3,240(a4)
            if ((proc->optr = initproc->cptr) != NULL)
ffffffffc020450a:	7978                	ld	a4,240(a0)
            proc->yptr = NULL;
ffffffffc020450c:	0e07bc23          	sd	zero,248(a5)
            if ((proc->optr = initproc->cptr) != NULL)
ffffffffc0204510:	10e7b023          	sd	a4,256(a5)
ffffffffc0204514:	c311                	beqz	a4,ffffffffc0204518 <do_exit+0xb6>
                initproc->cptr->yptr = proc;
ffffffffc0204516:	ff7c                	sd	a5,248(a4)
            if (proc->state == PROC_ZOMBIE)
ffffffffc0204518:	4398                	lw	a4,0(a5)
            proc->parent = initproc;
ffffffffc020451a:	f388                	sd	a0,32(a5)
            initproc->cptr = proc;
ffffffffc020451c:	f97c                	sd	a5,240(a0)
            if (proc->state == PROC_ZOMBIE)
ffffffffc020451e:	fd271fe3          	bne	a4,s2,ffffffffc02044fc <do_exit+0x9a>
                if (initproc->wait_state == WT_CHILD)
ffffffffc0204522:	0ec52783          	lw	a5,236(a0)
ffffffffc0204526:	fd379be3          	bne	a5,s3,ffffffffc02044fc <do_exit+0x9a>
                    wakeup_proc(initproc);
ffffffffc020452a:	481000ef          	jal	ra,ffffffffc02051aa <wakeup_proc>
ffffffffc020452e:	b7f9                	j	ffffffffc02044fc <do_exit+0x9a>
    if (flag)
ffffffffc0204530:	020a1263          	bnez	s4,ffffffffc0204554 <do_exit+0xf2>
    schedule();
ffffffffc0204534:	4f7000ef          	jal	ra,ffffffffc020522a <schedule>
    panic("do_exit will not return!! %d.\n", current->pid);
ffffffffc0204538:	601c                	ld	a5,0(s0)
ffffffffc020453a:	00003617          	auipc	a2,0x3
ffffffffc020453e:	dfe60613          	addi	a2,a2,-514 # ffffffffc0207338 <default_pmm_manager+0xc70>
ffffffffc0204542:	23d00593          	li	a1,573
ffffffffc0204546:	43d4                	lw	a3,4(a5)
ffffffffc0204548:	00003517          	auipc	a0,0x3
ffffffffc020454c:	c1050513          	addi	a0,a0,-1008 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc0204550:	f3ffb0ef          	jal	ra,ffffffffc020048e <__panic>
        intr_enable();
ffffffffc0204554:	c5afc0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0204558:	bff1                	j	ffffffffc0204534 <do_exit+0xd2>
        panic("idleproc exit.\n");
ffffffffc020455a:	00003617          	auipc	a2,0x3
ffffffffc020455e:	dbe60613          	addi	a2,a2,-578 # ffffffffc0207318 <default_pmm_manager+0xc50>
ffffffffc0204562:	20900593          	li	a1,521
ffffffffc0204566:	00003517          	auipc	a0,0x3
ffffffffc020456a:	bf250513          	addi	a0,a0,-1038 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc020456e:	f21fb0ef          	jal	ra,ffffffffc020048e <__panic>
            exit_mmap(mm);
ffffffffc0204572:	854e                	mv	a0,s3
ffffffffc0204574:	c00ff0ef          	jal	ra,ffffffffc0203974 <exit_mmap>
            put_pgdir(mm);
ffffffffc0204578:	854e                	mv	a0,s3
ffffffffc020457a:	955ff0ef          	jal	ra,ffffffffc0203ece <put_pgdir>
            mm_destroy(mm);
ffffffffc020457e:	854e                	mv	a0,s3
ffffffffc0204580:	a58ff0ef          	jal	ra,ffffffffc02037d8 <mm_destroy>
ffffffffc0204584:	bf35                	j	ffffffffc02044c0 <do_exit+0x5e>
        panic("initproc exit.\n");
ffffffffc0204586:	00003617          	auipc	a2,0x3
ffffffffc020458a:	da260613          	addi	a2,a2,-606 # ffffffffc0207328 <default_pmm_manager+0xc60>
ffffffffc020458e:	20d00593          	li	a1,525
ffffffffc0204592:	00003517          	auipc	a0,0x3
ffffffffc0204596:	bc650513          	addi	a0,a0,-1082 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc020459a:	ef5fb0ef          	jal	ra,ffffffffc020048e <__panic>
        intr_disable();
ffffffffc020459e:	c16fc0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        return 1;
ffffffffc02045a2:	4a05                	li	s4,1
ffffffffc02045a4:	bf1d                	j	ffffffffc02044da <do_exit+0x78>
            wakeup_proc(proc);
ffffffffc02045a6:	405000ef          	jal	ra,ffffffffc02051aa <wakeup_proc>
ffffffffc02045aa:	b789                	j	ffffffffc02044ec <do_exit+0x8a>

ffffffffc02045ac <do_wait.part.0>:
int do_wait(int pid, int *code_store)
ffffffffc02045ac:	715d                	addi	sp,sp,-80
ffffffffc02045ae:	f84a                	sd	s2,48(sp)
ffffffffc02045b0:	f44e                	sd	s3,40(sp)
        current->wait_state = WT_CHILD;
ffffffffc02045b2:	80000937          	lui	s2,0x80000
    if (0 < pid && pid < MAX_PID)
ffffffffc02045b6:	6989                	lui	s3,0x2
int do_wait(int pid, int *code_store)
ffffffffc02045b8:	fc26                	sd	s1,56(sp)
ffffffffc02045ba:	f052                	sd	s4,32(sp)
ffffffffc02045bc:	ec56                	sd	s5,24(sp)
ffffffffc02045be:	e85a                	sd	s6,16(sp)
ffffffffc02045c0:	e45e                	sd	s7,8(sp)
ffffffffc02045c2:	e486                	sd	ra,72(sp)
ffffffffc02045c4:	e0a2                	sd	s0,64(sp)
ffffffffc02045c6:	84aa                	mv	s1,a0
ffffffffc02045c8:	8a2e                	mv	s4,a1
        proc = current->cptr;
ffffffffc02045ca:	000a6b97          	auipc	s7,0xa6
ffffffffc02045ce:	14eb8b93          	addi	s7,s7,334 # ffffffffc02aa718 <current>
    if (0 < pid && pid < MAX_PID)
ffffffffc02045d2:	00050b1b          	sext.w	s6,a0
ffffffffc02045d6:	fff50a9b          	addiw	s5,a0,-1
ffffffffc02045da:	19f9                	addi	s3,s3,-2
        current->wait_state = WT_CHILD;
ffffffffc02045dc:	0905                	addi	s2,s2,1
    if (pid != 0)
ffffffffc02045de:	ccbd                	beqz	s1,ffffffffc020465c <do_wait.part.0+0xb0>
    if (0 < pid && pid < MAX_PID)
ffffffffc02045e0:	0359e863          	bltu	s3,s5,ffffffffc0204610 <do_wait.part.0+0x64>
        list_entry_t *list = hash_list + pid_hashfn(pid), *le = list;
ffffffffc02045e4:	45a9                	li	a1,10
ffffffffc02045e6:	855a                	mv	a0,s6
ffffffffc02045e8:	5dd000ef          	jal	ra,ffffffffc02053c4 <hash32>
ffffffffc02045ec:	02051793          	slli	a5,a0,0x20
ffffffffc02045f0:	01c7d513          	srli	a0,a5,0x1c
ffffffffc02045f4:	000a2797          	auipc	a5,0xa2
ffffffffc02045f8:	0b478793          	addi	a5,a5,180 # ffffffffc02a66a8 <hash_list>
ffffffffc02045fc:	953e                	add	a0,a0,a5
ffffffffc02045fe:	842a                	mv	s0,a0
        while ((le = list_next(le)) != list)
ffffffffc0204600:	a029                	j	ffffffffc020460a <do_wait.part.0+0x5e>
            if (proc->pid == pid)
ffffffffc0204602:	f2c42783          	lw	a5,-212(s0)
ffffffffc0204606:	02978163          	beq	a5,s1,ffffffffc0204628 <do_wait.part.0+0x7c>
ffffffffc020460a:	6400                	ld	s0,8(s0)
        while ((le = list_next(le)) != list)
ffffffffc020460c:	fe851be3          	bne	a0,s0,ffffffffc0204602 <do_wait.part.0+0x56>
    return -E_BAD_PROC;
ffffffffc0204610:	5579                	li	a0,-2
}
ffffffffc0204612:	60a6                	ld	ra,72(sp)
ffffffffc0204614:	6406                	ld	s0,64(sp)
ffffffffc0204616:	74e2                	ld	s1,56(sp)
ffffffffc0204618:	7942                	ld	s2,48(sp)
ffffffffc020461a:	79a2                	ld	s3,40(sp)
ffffffffc020461c:	7a02                	ld	s4,32(sp)
ffffffffc020461e:	6ae2                	ld	s5,24(sp)
ffffffffc0204620:	6b42                	ld	s6,16(sp)
ffffffffc0204622:	6ba2                	ld	s7,8(sp)
ffffffffc0204624:	6161                	addi	sp,sp,80
ffffffffc0204626:	8082                	ret
        if (proc != NULL && proc->parent == current)
ffffffffc0204628:	000bb683          	ld	a3,0(s7)
ffffffffc020462c:	f4843783          	ld	a5,-184(s0)
ffffffffc0204630:	fed790e3          	bne	a5,a3,ffffffffc0204610 <do_wait.part.0+0x64>
            if (proc->state == PROC_ZOMBIE)
ffffffffc0204634:	f2842703          	lw	a4,-216(s0)
ffffffffc0204638:	478d                	li	a5,3
ffffffffc020463a:	0ef70b63          	beq	a4,a5,ffffffffc0204730 <do_wait.part.0+0x184>
        current->state = PROC_SLEEPING;
ffffffffc020463e:	4785                	li	a5,1
ffffffffc0204640:	c29c                	sw	a5,0(a3)
        current->wait_state = WT_CHILD;
ffffffffc0204642:	0f26a623          	sw	s2,236(a3)
        schedule();
ffffffffc0204646:	3e5000ef          	jal	ra,ffffffffc020522a <schedule>
        if (current->flags & PF_EXITING)
ffffffffc020464a:	000bb783          	ld	a5,0(s7)
ffffffffc020464e:	0b07a783          	lw	a5,176(a5)
ffffffffc0204652:	8b85                	andi	a5,a5,1
ffffffffc0204654:	d7c9                	beqz	a5,ffffffffc02045de <do_wait.part.0+0x32>
            do_exit(-E_KILLED);
ffffffffc0204656:	555d                	li	a0,-9
ffffffffc0204658:	e0bff0ef          	jal	ra,ffffffffc0204462 <do_exit>
        proc = current->cptr;
ffffffffc020465c:	000bb683          	ld	a3,0(s7)
ffffffffc0204660:	7ae0                	ld	s0,240(a3)
        for (; proc != NULL; proc = proc->optr)
ffffffffc0204662:	d45d                	beqz	s0,ffffffffc0204610 <do_wait.part.0+0x64>
            if (proc->state == PROC_ZOMBIE)
ffffffffc0204664:	470d                	li	a4,3
ffffffffc0204666:	a021                	j	ffffffffc020466e <do_wait.part.0+0xc2>
        for (; proc != NULL; proc = proc->optr)
ffffffffc0204668:	10043403          	ld	s0,256(s0)
ffffffffc020466c:	d869                	beqz	s0,ffffffffc020463e <do_wait.part.0+0x92>
            if (proc->state == PROC_ZOMBIE)
ffffffffc020466e:	401c                	lw	a5,0(s0)
ffffffffc0204670:	fee79ce3          	bne	a5,a4,ffffffffc0204668 <do_wait.part.0+0xbc>
    if (proc == idleproc || proc == initproc)
ffffffffc0204674:	000a6797          	auipc	a5,0xa6
ffffffffc0204678:	0ac7b783          	ld	a5,172(a5) # ffffffffc02aa720 <idleproc>
ffffffffc020467c:	0c878963          	beq	a5,s0,ffffffffc020474e <do_wait.part.0+0x1a2>
ffffffffc0204680:	000a6797          	auipc	a5,0xa6
ffffffffc0204684:	0a87b783          	ld	a5,168(a5) # ffffffffc02aa728 <initproc>
ffffffffc0204688:	0cf40363          	beq	s0,a5,ffffffffc020474e <do_wait.part.0+0x1a2>
    if (code_store != NULL)
ffffffffc020468c:	000a0663          	beqz	s4,ffffffffc0204698 <do_wait.part.0+0xec>
        *code_store = proc->exit_code;
ffffffffc0204690:	0e842783          	lw	a5,232(s0)
ffffffffc0204694:	00fa2023          	sw	a5,0(s4)
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0204698:	100027f3          	csrr	a5,sstatus
ffffffffc020469c:	8b89                	andi	a5,a5,2
    return 0;
ffffffffc020469e:	4581                	li	a1,0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02046a0:	e7c1                	bnez	a5,ffffffffc0204728 <do_wait.part.0+0x17c>
    __list_del(listelm->prev, listelm->next);
ffffffffc02046a2:	6c70                	ld	a2,216(s0)
ffffffffc02046a4:	7074                	ld	a3,224(s0)
    if (proc->optr != NULL)
ffffffffc02046a6:	10043703          	ld	a4,256(s0)
        proc->optr->yptr = proc->yptr;
ffffffffc02046aa:	7c7c                	ld	a5,248(s0)
    prev->next = next;
ffffffffc02046ac:	e614                	sd	a3,8(a2)
    next->prev = prev;
ffffffffc02046ae:	e290                	sd	a2,0(a3)
    __list_del(listelm->prev, listelm->next);
ffffffffc02046b0:	6470                	ld	a2,200(s0)
ffffffffc02046b2:	6874                	ld	a3,208(s0)
    prev->next = next;
ffffffffc02046b4:	e614                	sd	a3,8(a2)
    next->prev = prev;
ffffffffc02046b6:	e290                	sd	a2,0(a3)
    if (proc->optr != NULL)
ffffffffc02046b8:	c319                	beqz	a4,ffffffffc02046be <do_wait.part.0+0x112>
        proc->optr->yptr = proc->yptr;
ffffffffc02046ba:	ff7c                	sd	a5,248(a4)
    if (proc->yptr != NULL)
ffffffffc02046bc:	7c7c                	ld	a5,248(s0)
ffffffffc02046be:	c3b5                	beqz	a5,ffffffffc0204722 <do_wait.part.0+0x176>
        proc->yptr->optr = proc->optr;
ffffffffc02046c0:	10e7b023          	sd	a4,256(a5)
    nr_process--;
ffffffffc02046c4:	000a6717          	auipc	a4,0xa6
ffffffffc02046c8:	06c70713          	addi	a4,a4,108 # ffffffffc02aa730 <nr_process>
ffffffffc02046cc:	431c                	lw	a5,0(a4)
ffffffffc02046ce:	37fd                	addiw	a5,a5,-1
ffffffffc02046d0:	c31c                	sw	a5,0(a4)
    if (flag)
ffffffffc02046d2:	e5a9                	bnez	a1,ffffffffc020471c <do_wait.part.0+0x170>
    free_pages(kva2page((void *)(proc->kstack)), KSTACKPAGE);
ffffffffc02046d4:	6814                	ld	a3,16(s0)
    return pa2page(PADDR(kva));
ffffffffc02046d6:	c02007b7          	lui	a5,0xc0200
ffffffffc02046da:	04f6ee63          	bltu	a3,a5,ffffffffc0204736 <do_wait.part.0+0x18a>
ffffffffc02046de:	000a6797          	auipc	a5,0xa6
ffffffffc02046e2:	0327b783          	ld	a5,50(a5) # ffffffffc02aa710 <va_pa_offset>
ffffffffc02046e6:	8e9d                	sub	a3,a3,a5
    if (PPN(pa) >= npage)
ffffffffc02046e8:	82b1                	srli	a3,a3,0xc
ffffffffc02046ea:	000a6797          	auipc	a5,0xa6
ffffffffc02046ee:	00e7b783          	ld	a5,14(a5) # ffffffffc02aa6f8 <npage>
ffffffffc02046f2:	06f6fa63          	bgeu	a3,a5,ffffffffc0204766 <do_wait.part.0+0x1ba>
    return &pages[PPN(pa) - nbase];
ffffffffc02046f6:	00003517          	auipc	a0,0x3
ffffffffc02046fa:	61253503          	ld	a0,1554(a0) # ffffffffc0207d08 <nbase>
ffffffffc02046fe:	8e89                	sub	a3,a3,a0
ffffffffc0204700:	069a                	slli	a3,a3,0x6
ffffffffc0204702:	000a6517          	auipc	a0,0xa6
ffffffffc0204706:	ffe53503          	ld	a0,-2(a0) # ffffffffc02aa700 <pages>
ffffffffc020470a:	9536                	add	a0,a0,a3
ffffffffc020470c:	4589                	li	a1,2
ffffffffc020470e:	fa4fd0ef          	jal	ra,ffffffffc0201eb2 <free_pages>
    kfree(proc);
ffffffffc0204712:	8522                	mv	a0,s0
ffffffffc0204714:	e32fd0ef          	jal	ra,ffffffffc0201d46 <kfree>
    return 0;
ffffffffc0204718:	4501                	li	a0,0
ffffffffc020471a:	bde5                	j	ffffffffc0204612 <do_wait.part.0+0x66>
        intr_enable();
ffffffffc020471c:	a92fc0ef          	jal	ra,ffffffffc02009ae <intr_enable>
ffffffffc0204720:	bf55                	j	ffffffffc02046d4 <do_wait.part.0+0x128>
        proc->parent->cptr = proc->optr;
ffffffffc0204722:	701c                	ld	a5,32(s0)
ffffffffc0204724:	fbf8                	sd	a4,240(a5)
ffffffffc0204726:	bf79                	j	ffffffffc02046c4 <do_wait.part.0+0x118>
        intr_disable();
ffffffffc0204728:	a8cfc0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        return 1;
ffffffffc020472c:	4585                	li	a1,1
ffffffffc020472e:	bf95                	j	ffffffffc02046a2 <do_wait.part.0+0xf6>
            struct proc_struct *proc = le2proc(le, hash_link);
ffffffffc0204730:	f2840413          	addi	s0,s0,-216
ffffffffc0204734:	b781                	j	ffffffffc0204674 <do_wait.part.0+0xc8>
    return pa2page(PADDR(kva));
ffffffffc0204736:	00002617          	auipc	a2,0x2
ffffffffc020473a:	07260613          	addi	a2,a2,114 # ffffffffc02067a8 <default_pmm_manager+0xe0>
ffffffffc020473e:	07700593          	li	a1,119
ffffffffc0204742:	00002517          	auipc	a0,0x2
ffffffffc0204746:	fe650513          	addi	a0,a0,-26 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc020474a:	d45fb0ef          	jal	ra,ffffffffc020048e <__panic>
        panic("wait idleproc or initproc.\n");
ffffffffc020474e:	00003617          	auipc	a2,0x3
ffffffffc0204752:	c0a60613          	addi	a2,a2,-1014 # ffffffffc0207358 <default_pmm_manager+0xc90>
ffffffffc0204756:	35f00593          	li	a1,863
ffffffffc020475a:	00003517          	auipc	a0,0x3
ffffffffc020475e:	9fe50513          	addi	a0,a0,-1538 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc0204762:	d2dfb0ef          	jal	ra,ffffffffc020048e <__panic>
        panic("pa2page called with invalid pa");
ffffffffc0204766:	00002617          	auipc	a2,0x2
ffffffffc020476a:	06a60613          	addi	a2,a2,106 # ffffffffc02067d0 <default_pmm_manager+0x108>
ffffffffc020476e:	06900593          	li	a1,105
ffffffffc0204772:	00002517          	auipc	a0,0x2
ffffffffc0204776:	fb650513          	addi	a0,a0,-74 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc020477a:	d15fb0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc020477e <init_main>:
}

// init_main - the second kernel thread used to create user_main kernel threads
static int
init_main(void *arg)
{
ffffffffc020477e:	1101                	addi	sp,sp,-32
ffffffffc0204780:	e426                	sd	s1,8(sp)
    cprintf("init_main: starting, current = %s(%d)\n", current->name, current->pid);
ffffffffc0204782:	000a6497          	auipc	s1,0xa6
ffffffffc0204786:	f9648493          	addi	s1,s1,-106 # ffffffffc02aa718 <current>
ffffffffc020478a:	608c                	ld	a1,0(s1)
ffffffffc020478c:	00003517          	auipc	a0,0x3
ffffffffc0204790:	bec50513          	addi	a0,a0,-1044 # ffffffffc0207378 <default_pmm_manager+0xcb0>
{
ffffffffc0204794:	ec06                	sd	ra,24(sp)
    cprintf("init_main: starting, current = %s(%d)\n", current->name, current->pid);
ffffffffc0204796:	41d0                	lw	a2,4(a1)
ffffffffc0204798:	0b458593          	addi	a1,a1,180 # 20b4 <_binary_obj___user_faultread_out_size-0x7af4>
{
ffffffffc020479c:	e822                	sd	s0,16(sp)
    cprintf("init_main: starting, current = %s(%d)\n", current->name, current->pid);
ffffffffc020479e:	9f7fb0ef          	jal	ra,ffffffffc0200194 <cprintf>
    size_t nr_free_pages_store = nr_free_pages();
ffffffffc02047a2:	f50fd0ef          	jal	ra,ffffffffc0201ef2 <nr_free_pages>
    size_t kernel_allocated_store = kallocated();
ffffffffc02047a6:	cecfd0ef          	jal	ra,ffffffffc0201c92 <kallocated>

    cprintf("init_main: about to create user_main\n");
ffffffffc02047aa:	00003517          	auipc	a0,0x3
ffffffffc02047ae:	bf650513          	addi	a0,a0,-1034 # ffffffffc02073a0 <default_pmm_manager+0xcd8>
ffffffffc02047b2:	9e3fb0ef          	jal	ra,ffffffffc0200194 <cprintf>
    int pid = kernel_thread(user_main, NULL, 0);
ffffffffc02047b6:	4601                	li	a2,0
ffffffffc02047b8:	4581                	li	a1,0
ffffffffc02047ba:	fffff517          	auipc	a0,0xfffff
ffffffffc02047be:	69650513          	addi	a0,a0,1686 # ffffffffc0203e50 <user_main>
ffffffffc02047c2:	c51ff0ef          	jal	ra,ffffffffc0204412 <kernel_thread>
    if (0 < pid && pid < MAX_PID)
ffffffffc02047c6:	6789                	lui	a5,0x2
ffffffffc02047c8:	fff5071b          	addiw	a4,a0,-1
ffffffffc02047cc:	17f9                	addi	a5,a5,-2
    int pid = kernel_thread(user_main, NULL, 0);
ffffffffc02047ce:	842a                	mv	s0,a0
    if (0 < pid && pid < MAX_PID)
ffffffffc02047d0:	0ce7e463          	bltu	a5,a4,ffffffffc0204898 <init_main+0x11a>
        list_entry_t *list = hash_list + pid_hashfn(pid), *le = list;
ffffffffc02047d4:	2501                	sext.w	a0,a0
ffffffffc02047d6:	45a9                	li	a1,10
ffffffffc02047d8:	3ed000ef          	jal	ra,ffffffffc02053c4 <hash32>
ffffffffc02047dc:	02051793          	slli	a5,a0,0x20
ffffffffc02047e0:	01c7d713          	srli	a4,a5,0x1c
ffffffffc02047e4:	000a2797          	auipc	a5,0xa2
ffffffffc02047e8:	ec478793          	addi	a5,a5,-316 # ffffffffc02a66a8 <hash_list>
ffffffffc02047ec:	973e                	add	a4,a4,a5
ffffffffc02047ee:	863a                	mv	a2,a4
        while ((le = list_next(le)) != list)
ffffffffc02047f0:	a029                	j	ffffffffc02047fa <init_main+0x7c>
            if (proc->pid == pid)
ffffffffc02047f2:	f2c62783          	lw	a5,-212(a2)
ffffffffc02047f6:	0e878663          	beq	a5,s0,ffffffffc02048e2 <init_main+0x164>
    return listelm->next;
ffffffffc02047fa:	6610                	ld	a2,8(a2)
        while ((le = list_next(le)) != list)
ffffffffc02047fc:	fec71be3          	bne	a4,a2,ffffffffc02047f2 <init_main+0x74>
    return NULL;
ffffffffc0204800:	4601                	li	a2,0
    struct proc_struct *child = find_proc(pid);
    cprintf("init_main: user_main created with pid = %d, child=%p\n", pid, child);
ffffffffc0204802:	85a2                	mv	a1,s0
ffffffffc0204804:	00003517          	auipc	a0,0x3
ffffffffc0204808:	bc450513          	addi	a0,a0,-1084 # ffffffffc02073c8 <default_pmm_manager+0xd00>
ffffffffc020480c:	989fb0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("init_main: current=%p name=%s pid=%d, initproc=%p\n", current, current->name, current->pid, initproc);
ffffffffc0204810:	608c                	ld	a1,0(s1)
ffffffffc0204812:	000a6497          	auipc	s1,0xa6
ffffffffc0204816:	f1648493          	addi	s1,s1,-234 # ffffffffc02aa728 <initproc>
ffffffffc020481a:	6098                	ld	a4,0(s1)
ffffffffc020481c:	41d4                	lw	a3,4(a1)
ffffffffc020481e:	0b458613          	addi	a2,a1,180
ffffffffc0204822:	00003517          	auipc	a0,0x3
ffffffffc0204826:	bde50513          	addi	a0,a0,-1058 # ffffffffc0207400 <default_pmm_manager+0xd38>
ffffffffc020482a:	96bfb0ef          	jal	ra,ffffffffc0200194 <cprintf>
    if (pid <= 0)
ffffffffc020482e:	a019                	j	ffffffffc0204834 <init_main+0xb6>
         panic("create user_main failed.\n");
    }

    while (do_wait(0, NULL) == 0)
    {
        schedule();
ffffffffc0204830:	1fb000ef          	jal	ra,ffffffffc020522a <schedule>
    if (code_store != NULL)
ffffffffc0204834:	4581                	li	a1,0
ffffffffc0204836:	4501                	li	a0,0
ffffffffc0204838:	d75ff0ef          	jal	ra,ffffffffc02045ac <do_wait.part.0>
    while (do_wait(0, NULL) == 0)
ffffffffc020483c:	d975                	beqz	a0,ffffffffc0204830 <init_main+0xb2>
    }

    cprintf("all user-mode processes have quit.\n");
ffffffffc020483e:	00003517          	auipc	a0,0x3
ffffffffc0204842:	c1a50513          	addi	a0,a0,-998 # ffffffffc0207458 <default_pmm_manager+0xd90>
ffffffffc0204846:	94ffb0ef          	jal	ra,ffffffffc0200194 <cprintf>
    assert(initproc->cptr == NULL && initproc->yptr == NULL && initproc->optr == NULL);
ffffffffc020484a:	609c                	ld	a5,0(s1)
ffffffffc020484c:	7bf8                	ld	a4,240(a5)
ffffffffc020484e:	ef49                	bnez	a4,ffffffffc02048e8 <init_main+0x16a>
ffffffffc0204850:	7ff8                	ld	a4,248(a5)
ffffffffc0204852:	eb59                	bnez	a4,ffffffffc02048e8 <init_main+0x16a>
ffffffffc0204854:	1007b703          	ld	a4,256(a5)
ffffffffc0204858:	eb41                	bnez	a4,ffffffffc02048e8 <init_main+0x16a>
    assert(nr_process == 2);
ffffffffc020485a:	000a6697          	auipc	a3,0xa6
ffffffffc020485e:	ed66a683          	lw	a3,-298(a3) # ffffffffc02aa730 <nr_process>
ffffffffc0204862:	4709                	li	a4,2
ffffffffc0204864:	0ae69263          	bne	a3,a4,ffffffffc0204908 <init_main+0x18a>
ffffffffc0204868:	000a6717          	auipc	a4,0xa6
ffffffffc020486c:	e4070713          	addi	a4,a4,-448 # ffffffffc02aa6a8 <proc_list>
    assert(list_next(&proc_list) == &(initproc->list_link));
ffffffffc0204870:	6714                	ld	a3,8(a4)
ffffffffc0204872:	0c878793          	addi	a5,a5,200
ffffffffc0204876:	0ad79963          	bne	a5,a3,ffffffffc0204928 <init_main+0x1aa>
    assert(list_prev(&proc_list) == &(initproc->list_link));
ffffffffc020487a:	6318                	ld	a4,0(a4)
ffffffffc020487c:	0ce79663          	bne	a5,a4,ffffffffc0204948 <init_main+0x1ca>

    cprintf("init check memory pass.\n");
ffffffffc0204880:	00003517          	auipc	a0,0x3
ffffffffc0204884:	cc050513          	addi	a0,a0,-832 # ffffffffc0207540 <default_pmm_manager+0xe78>
ffffffffc0204888:	90dfb0ef          	jal	ra,ffffffffc0200194 <cprintf>
    return 0;
}
ffffffffc020488c:	60e2                	ld	ra,24(sp)
ffffffffc020488e:	6442                	ld	s0,16(sp)
ffffffffc0204890:	64a2                	ld	s1,8(sp)
ffffffffc0204892:	4501                	li	a0,0
ffffffffc0204894:	6105                	addi	sp,sp,32
ffffffffc0204896:	8082                	ret
    cprintf("init_main: user_main created with pid = %d, child=%p\n", pid, child);
ffffffffc0204898:	85aa                	mv	a1,a0
ffffffffc020489a:	4601                	li	a2,0
ffffffffc020489c:	00003517          	auipc	a0,0x3
ffffffffc02048a0:	b2c50513          	addi	a0,a0,-1236 # ffffffffc02073c8 <default_pmm_manager+0xd00>
ffffffffc02048a4:	8f1fb0ef          	jal	ra,ffffffffc0200194 <cprintf>
    cprintf("init_main: current=%p name=%s pid=%d, initproc=%p\n", current, current->name, current->pid, initproc);
ffffffffc02048a8:	608c                	ld	a1,0(s1)
ffffffffc02048aa:	000a6497          	auipc	s1,0xa6
ffffffffc02048ae:	e7e48493          	addi	s1,s1,-386 # ffffffffc02aa728 <initproc>
ffffffffc02048b2:	6098                	ld	a4,0(s1)
ffffffffc02048b4:	41d4                	lw	a3,4(a1)
ffffffffc02048b6:	0b458613          	addi	a2,a1,180
ffffffffc02048ba:	00003517          	auipc	a0,0x3
ffffffffc02048be:	b4650513          	addi	a0,a0,-1210 # ffffffffc0207400 <default_pmm_manager+0xd38>
ffffffffc02048c2:	8d3fb0ef          	jal	ra,ffffffffc0200194 <cprintf>
    if (pid <= 0)
ffffffffc02048c6:	f68047e3          	bgtz	s0,ffffffffc0204834 <init_main+0xb6>
         panic("create user_main failed.\n");
ffffffffc02048ca:	00003617          	auipc	a2,0x3
ffffffffc02048ce:	b6e60613          	addi	a2,a2,-1170 # ffffffffc0207438 <default_pmm_manager+0xd70>
ffffffffc02048d2:	3c900593          	li	a1,969
ffffffffc02048d6:	00003517          	auipc	a0,0x3
ffffffffc02048da:	88250513          	addi	a0,a0,-1918 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc02048de:	bb1fb0ef          	jal	ra,ffffffffc020048e <__panic>
            struct proc_struct *proc = le2proc(le, hash_link);
ffffffffc02048e2:	f2860613          	addi	a2,a2,-216
ffffffffc02048e6:	bf31                	j	ffffffffc0204802 <init_main+0x84>
    assert(initproc->cptr == NULL && initproc->yptr == NULL && initproc->optr == NULL);
ffffffffc02048e8:	00003697          	auipc	a3,0x3
ffffffffc02048ec:	b9868693          	addi	a3,a3,-1128 # ffffffffc0207480 <default_pmm_manager+0xdb8>
ffffffffc02048f0:	00002617          	auipc	a2,0x2
ffffffffc02048f4:	a2860613          	addi	a2,a2,-1496 # ffffffffc0206318 <commands+0x818>
ffffffffc02048f8:	3d200593          	li	a1,978
ffffffffc02048fc:	00003517          	auipc	a0,0x3
ffffffffc0204900:	85c50513          	addi	a0,a0,-1956 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc0204904:	b8bfb0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(nr_process == 2);
ffffffffc0204908:	00003697          	auipc	a3,0x3
ffffffffc020490c:	bc868693          	addi	a3,a3,-1080 # ffffffffc02074d0 <default_pmm_manager+0xe08>
ffffffffc0204910:	00002617          	auipc	a2,0x2
ffffffffc0204914:	a0860613          	addi	a2,a2,-1528 # ffffffffc0206318 <commands+0x818>
ffffffffc0204918:	3d300593          	li	a1,979
ffffffffc020491c:	00003517          	auipc	a0,0x3
ffffffffc0204920:	83c50513          	addi	a0,a0,-1988 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc0204924:	b6bfb0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(list_next(&proc_list) == &(initproc->list_link));
ffffffffc0204928:	00003697          	auipc	a3,0x3
ffffffffc020492c:	bb868693          	addi	a3,a3,-1096 # ffffffffc02074e0 <default_pmm_manager+0xe18>
ffffffffc0204930:	00002617          	auipc	a2,0x2
ffffffffc0204934:	9e860613          	addi	a2,a2,-1560 # ffffffffc0206318 <commands+0x818>
ffffffffc0204938:	3d400593          	li	a1,980
ffffffffc020493c:	00003517          	auipc	a0,0x3
ffffffffc0204940:	81c50513          	addi	a0,a0,-2020 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc0204944:	b4bfb0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(list_prev(&proc_list) == &(initproc->list_link));
ffffffffc0204948:	00003697          	auipc	a3,0x3
ffffffffc020494c:	bc868693          	addi	a3,a3,-1080 # ffffffffc0207510 <default_pmm_manager+0xe48>
ffffffffc0204950:	00002617          	auipc	a2,0x2
ffffffffc0204954:	9c860613          	addi	a2,a2,-1592 # ffffffffc0206318 <commands+0x818>
ffffffffc0204958:	3d500593          	li	a1,981
ffffffffc020495c:	00002517          	auipc	a0,0x2
ffffffffc0204960:	7fc50513          	addi	a0,a0,2044 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc0204964:	b2bfb0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0204968 <do_execve>:
{
ffffffffc0204968:	7171                	addi	sp,sp,-176
ffffffffc020496a:	e4ee                	sd	s11,72(sp)
    struct mm_struct *mm = current->mm;
ffffffffc020496c:	000a6d97          	auipc	s11,0xa6
ffffffffc0204970:	dacd8d93          	addi	s11,s11,-596 # ffffffffc02aa718 <current>
ffffffffc0204974:	000db783          	ld	a5,0(s11)
{
ffffffffc0204978:	e54e                	sd	s3,136(sp)
ffffffffc020497a:	ed26                	sd	s1,152(sp)
    struct mm_struct *mm = current->mm;
ffffffffc020497c:	0287b983          	ld	s3,40(a5)
{
ffffffffc0204980:	e94a                	sd	s2,144(sp)
ffffffffc0204982:	f4de                	sd	s7,104(sp)
ffffffffc0204984:	892a                	mv	s2,a0
ffffffffc0204986:	8bb2                	mv	s7,a2
ffffffffc0204988:	84ae                	mv	s1,a1
    if (!user_mem_check(mm, (uintptr_t)name, len, 0))
ffffffffc020498a:	862e                	mv	a2,a1
ffffffffc020498c:	4681                	li	a3,0
ffffffffc020498e:	85aa                	mv	a1,a0
ffffffffc0204990:	854e                	mv	a0,s3
{
ffffffffc0204992:	f506                	sd	ra,168(sp)
ffffffffc0204994:	f122                	sd	s0,160(sp)
ffffffffc0204996:	e152                	sd	s4,128(sp)
ffffffffc0204998:	fcd6                	sd	s5,120(sp)
ffffffffc020499a:	f8da                	sd	s6,112(sp)
ffffffffc020499c:	f0e2                	sd	s8,96(sp)
ffffffffc020499e:	ece6                	sd	s9,88(sp)
ffffffffc02049a0:	e8ea                	sd	s10,80(sp)
ffffffffc02049a2:	f05e                	sd	s7,32(sp)
    if (!user_mem_check(mm, (uintptr_t)name, len, 0))
ffffffffc02049a4:	b6aff0ef          	jal	ra,ffffffffc0203d0e <user_mem_check>
ffffffffc02049a8:	40050a63          	beqz	a0,ffffffffc0204dbc <do_execve+0x454>
    memset(local_name, 0, sizeof(local_name));
ffffffffc02049ac:	4641                	li	a2,16
ffffffffc02049ae:	4581                	li	a1,0
ffffffffc02049b0:	1808                	addi	a0,sp,48
ffffffffc02049b2:	6b9000ef          	jal	ra,ffffffffc020586a <memset>
    memcpy(local_name, name, len);
ffffffffc02049b6:	47bd                	li	a5,15
ffffffffc02049b8:	8626                	mv	a2,s1
ffffffffc02049ba:	1e97e263          	bltu	a5,s1,ffffffffc0204b9e <do_execve+0x236>
ffffffffc02049be:	85ca                	mv	a1,s2
ffffffffc02049c0:	1808                	addi	a0,sp,48
ffffffffc02049c2:	6bb000ef          	jal	ra,ffffffffc020587c <memcpy>
    if (mm != NULL)
ffffffffc02049c6:	1e098363          	beqz	s3,ffffffffc0204bac <do_execve+0x244>
        cputs("mm != NULL");
ffffffffc02049ca:	00002517          	auipc	a0,0x2
ffffffffc02049ce:	52e50513          	addi	a0,a0,1326 # ffffffffc0206ef8 <default_pmm_manager+0x830>
ffffffffc02049d2:	ffafb0ef          	jal	ra,ffffffffc02001cc <cputs>
ffffffffc02049d6:	000a6797          	auipc	a5,0xa6
ffffffffc02049da:	d127b783          	ld	a5,-750(a5) # ffffffffc02aa6e8 <boot_pgdir_pa>
ffffffffc02049de:	577d                	li	a4,-1
ffffffffc02049e0:	177e                	slli	a4,a4,0x3f
ffffffffc02049e2:	83b1                	srli	a5,a5,0xc
ffffffffc02049e4:	8fd9                	or	a5,a5,a4
ffffffffc02049e6:	18079073          	csrw	satp,a5
ffffffffc02049ea:	0309a783          	lw	a5,48(s3) # 2030 <_binary_obj___user_faultread_out_size-0x7b78>
ffffffffc02049ee:	fff7871b          	addiw	a4,a5,-1
ffffffffc02049f2:	02e9a823          	sw	a4,48(s3)
        if (mm_count_dec(mm) == 0)
ffffffffc02049f6:	2c070463          	beqz	a4,ffffffffc0204cbe <do_execve+0x356>
        current->mm = NULL;
ffffffffc02049fa:	000db783          	ld	a5,0(s11)
ffffffffc02049fe:	0207b423          	sd	zero,40(a5)
    if ((mm = mm_create()) == NULL)
ffffffffc0204a02:	c97fe0ef          	jal	ra,ffffffffc0203698 <mm_create>
ffffffffc0204a06:	84aa                	mv	s1,a0
ffffffffc0204a08:	1c050d63          	beqz	a0,ffffffffc0204be2 <do_execve+0x27a>
    if ((page = alloc_page()) == NULL)
ffffffffc0204a0c:	4505                	li	a0,1
ffffffffc0204a0e:	c66fd0ef          	jal	ra,ffffffffc0201e74 <alloc_pages>
ffffffffc0204a12:	3a050963          	beqz	a0,ffffffffc0204dc4 <do_execve+0x45c>
    return page - pages + nbase;
ffffffffc0204a16:	000a6c97          	auipc	s9,0xa6
ffffffffc0204a1a:	ceac8c93          	addi	s9,s9,-790 # ffffffffc02aa700 <pages>
ffffffffc0204a1e:	000cb683          	ld	a3,0(s9)
    return KADDR(page2pa(page));
ffffffffc0204a22:	000a6c17          	auipc	s8,0xa6
ffffffffc0204a26:	cd6c0c13          	addi	s8,s8,-810 # ffffffffc02aa6f8 <npage>
    return page - pages + nbase;
ffffffffc0204a2a:	00003717          	auipc	a4,0x3
ffffffffc0204a2e:	2de73703          	ld	a4,734(a4) # ffffffffc0207d08 <nbase>
ffffffffc0204a32:	40d506b3          	sub	a3,a0,a3
ffffffffc0204a36:	8699                	srai	a3,a3,0x6
    return KADDR(page2pa(page));
ffffffffc0204a38:	5afd                	li	s5,-1
ffffffffc0204a3a:	000c3783          	ld	a5,0(s8)
    return page - pages + nbase;
ffffffffc0204a3e:	96ba                	add	a3,a3,a4
ffffffffc0204a40:	e83a                	sd	a4,16(sp)
    return KADDR(page2pa(page));
ffffffffc0204a42:	00cad713          	srli	a4,s5,0xc
ffffffffc0204a46:	ec3a                	sd	a4,24(sp)
ffffffffc0204a48:	8f75                	and	a4,a4,a3
    return page2ppn(page) << PGSHIFT;
ffffffffc0204a4a:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0204a4c:	38f77063          	bgeu	a4,a5,ffffffffc0204dcc <do_execve+0x464>
ffffffffc0204a50:	000a6b17          	auipc	s6,0xa6
ffffffffc0204a54:	cc0b0b13          	addi	s6,s6,-832 # ffffffffc02aa710 <va_pa_offset>
ffffffffc0204a58:	000b3903          	ld	s2,0(s6)
    memcpy(pgdir, boot_pgdir_va, PGSIZE);
ffffffffc0204a5c:	6605                	lui	a2,0x1
ffffffffc0204a5e:	000a6597          	auipc	a1,0xa6
ffffffffc0204a62:	c925b583          	ld	a1,-878(a1) # ffffffffc02aa6f0 <boot_pgdir_va>
ffffffffc0204a66:	9936                	add	s2,s2,a3
ffffffffc0204a68:	854a                	mv	a0,s2
ffffffffc0204a6a:	613000ef          	jal	ra,ffffffffc020587c <memcpy>
    if (elf->e_magic != ELF_MAGIC)
ffffffffc0204a6e:	7782                	ld	a5,32(sp)
ffffffffc0204a70:	4398                	lw	a4,0(a5)
ffffffffc0204a72:	464c47b7          	lui	a5,0x464c4
    mm->pgdir = pgdir;
ffffffffc0204a76:	0124bc23          	sd	s2,24(s1)
    if (elf->e_magic != ELF_MAGIC)
ffffffffc0204a7a:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_obj___user_exit_out_size+0x464b945f>
ffffffffc0204a7e:	14f71863          	bne	a4,a5,ffffffffc0204bce <do_execve+0x266>
    struct proghdr *ph_end = ph + elf->e_phnum;
ffffffffc0204a82:	7682                	ld	a3,32(sp)
ffffffffc0204a84:	0386d703          	lhu	a4,56(a3)
    struct proghdr *ph = (struct proghdr *)(binary + elf->e_phoff);
ffffffffc0204a88:	0206b983          	ld	s3,32(a3)
    struct proghdr *ph_end = ph + elf->e_phnum;
ffffffffc0204a8c:	00371793          	slli	a5,a4,0x3
ffffffffc0204a90:	8f99                	sub	a5,a5,a4
    struct proghdr *ph = (struct proghdr *)(binary + elf->e_phoff);
ffffffffc0204a92:	99b6                	add	s3,s3,a3
    struct proghdr *ph_end = ph + elf->e_phnum;
ffffffffc0204a94:	078e                	slli	a5,a5,0x3
ffffffffc0204a96:	97ce                	add	a5,a5,s3
ffffffffc0204a98:	f43e                	sd	a5,40(sp)
    for (; ph < ph_end; ph++)
ffffffffc0204a9a:	00f9fc63          	bgeu	s3,a5,ffffffffc0204ab2 <do_execve+0x14a>
        if (ph->p_type != ELF_PT_LOAD)
ffffffffc0204a9e:	0009a783          	lw	a5,0(s3)
ffffffffc0204aa2:	4705                	li	a4,1
ffffffffc0204aa4:	14e78163          	beq	a5,a4,ffffffffc0204be6 <do_execve+0x27e>
    for (; ph < ph_end; ph++)
ffffffffc0204aa8:	77a2                	ld	a5,40(sp)
ffffffffc0204aaa:	03898993          	addi	s3,s3,56
ffffffffc0204aae:	fef9e8e3          	bltu	s3,a5,ffffffffc0204a9e <do_execve+0x136>
    if ((ret = mm_map(mm, USTACKTOP - USTACKSIZE, USTACKSIZE, vm_flags, NULL)) != 0)
ffffffffc0204ab2:	4701                	li	a4,0
ffffffffc0204ab4:	46ad                	li	a3,11
ffffffffc0204ab6:	00100637          	lui	a2,0x100
ffffffffc0204aba:	7ff005b7          	lui	a1,0x7ff00
ffffffffc0204abe:	8526                	mv	a0,s1
ffffffffc0204ac0:	d6bfe0ef          	jal	ra,ffffffffc020382a <mm_map>
ffffffffc0204ac4:	8a2a                	mv	s4,a0
ffffffffc0204ac6:	1e051263          	bnez	a0,ffffffffc0204caa <do_execve+0x342>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - PGSIZE, PTE_USER) != NULL);
ffffffffc0204aca:	6c88                	ld	a0,24(s1)
ffffffffc0204acc:	467d                	li	a2,31
ffffffffc0204ace:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc0204ad2:	ae1fe0ef          	jal	ra,ffffffffc02035b2 <pgdir_alloc_page>
ffffffffc0204ad6:	38050363          	beqz	a0,ffffffffc0204e5c <do_execve+0x4f4>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - 2 * PGSIZE, PTE_USER) != NULL);
ffffffffc0204ada:	6c88                	ld	a0,24(s1)
ffffffffc0204adc:	467d                	li	a2,31
ffffffffc0204ade:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc0204ae2:	ad1fe0ef          	jal	ra,ffffffffc02035b2 <pgdir_alloc_page>
ffffffffc0204ae6:	34050b63          	beqz	a0,ffffffffc0204e3c <do_execve+0x4d4>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - 3 * PGSIZE, PTE_USER) != NULL);
ffffffffc0204aea:	6c88                	ld	a0,24(s1)
ffffffffc0204aec:	467d                	li	a2,31
ffffffffc0204aee:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc0204af2:	ac1fe0ef          	jal	ra,ffffffffc02035b2 <pgdir_alloc_page>
ffffffffc0204af6:	32050363          	beqz	a0,ffffffffc0204e1c <do_execve+0x4b4>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - 4 * PGSIZE, PTE_USER) != NULL);
ffffffffc0204afa:	6c88                	ld	a0,24(s1)
ffffffffc0204afc:	467d                	li	a2,31
ffffffffc0204afe:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc0204b02:	ab1fe0ef          	jal	ra,ffffffffc02035b2 <pgdir_alloc_page>
ffffffffc0204b06:	2e050b63          	beqz	a0,ffffffffc0204dfc <do_execve+0x494>
    mm->mm_count += 1;
ffffffffc0204b0a:	589c                	lw	a5,48(s1)
    current->mm = mm;
ffffffffc0204b0c:	000db603          	ld	a2,0(s11)
    current->pgdir = PADDR(mm->pgdir);
ffffffffc0204b10:	6c94                	ld	a3,24(s1)
ffffffffc0204b12:	2785                	addiw	a5,a5,1
ffffffffc0204b14:	d89c                	sw	a5,48(s1)
    current->mm = mm;
ffffffffc0204b16:	f604                	sd	s1,40(a2)
    current->pgdir = PADDR(mm->pgdir);
ffffffffc0204b18:	c02007b7          	lui	a5,0xc0200
ffffffffc0204b1c:	2cf6e463          	bltu	a3,a5,ffffffffc0204de4 <do_execve+0x47c>
ffffffffc0204b20:	000b3783          	ld	a5,0(s6)
ffffffffc0204b24:	577d                	li	a4,-1
ffffffffc0204b26:	177e                	slli	a4,a4,0x3f
ffffffffc0204b28:	8e9d                	sub	a3,a3,a5
ffffffffc0204b2a:	00c6d793          	srli	a5,a3,0xc
ffffffffc0204b2e:	f654                	sd	a3,168(a2)
ffffffffc0204b30:	8fd9                	or	a5,a5,a4
ffffffffc0204b32:	18079073          	csrw	satp,a5
    struct trapframe *tf = current->tf;
ffffffffc0204b36:	7240                	ld	s0,160(a2)
    memset(tf, 0, sizeof(struct trapframe));
ffffffffc0204b38:	4581                	li	a1,0
ffffffffc0204b3a:	12000613          	li	a2,288
ffffffffc0204b3e:	8522                	mv	a0,s0
    uintptr_t sstatus = tf->status;
ffffffffc0204b40:	10043483          	ld	s1,256(s0)
    memset(tf, 0, sizeof(struct trapframe));
ffffffffc0204b44:	527000ef          	jal	ra,ffffffffc020586a <memset>
    tf->epc = elf->e_entry;
ffffffffc0204b48:	7782                	ld	a5,32(sp)
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc0204b4a:	000db903          	ld	s2,0(s11)
    tf->status = sstatus & ~SSTATUS_SPP;
ffffffffc0204b4e:	eff4f493          	andi	s1,s1,-257
    tf->epc = elf->e_entry;
ffffffffc0204b52:	6f98                	ld	a4,24(a5)
    tf->gpr.sp = USTACKTOP;
ffffffffc0204b54:	4785                	li	a5,1
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc0204b56:	0b490913          	addi	s2,s2,180 # ffffffff800000b4 <_binary_obj___user_exit_out_size+0xffffffff7fff4f94>
    tf->gpr.sp = USTACKTOP;
ffffffffc0204b5a:	07fe                	slli	a5,a5,0x1f
    tf->status |= SSTATUS_SPIE;
ffffffffc0204b5c:	0204e493          	ori	s1,s1,32
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc0204b60:	4641                	li	a2,16
ffffffffc0204b62:	4581                	li	a1,0
    tf->gpr.sp = USTACKTOP;
ffffffffc0204b64:	e81c                	sd	a5,16(s0)
    tf->epc = elf->e_entry;
ffffffffc0204b66:	10e43423          	sd	a4,264(s0)
    tf->status |= SSTATUS_SPIE;
ffffffffc0204b6a:	10943023          	sd	s1,256(s0)
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc0204b6e:	854a                	mv	a0,s2
ffffffffc0204b70:	4fb000ef          	jal	ra,ffffffffc020586a <memset>
    return memcpy(proc->name, name, PROC_NAME_LEN);
ffffffffc0204b74:	463d                	li	a2,15
ffffffffc0204b76:	180c                	addi	a1,sp,48
ffffffffc0204b78:	854a                	mv	a0,s2
ffffffffc0204b7a:	503000ef          	jal	ra,ffffffffc020587c <memcpy>
}
ffffffffc0204b7e:	70aa                	ld	ra,168(sp)
ffffffffc0204b80:	740a                	ld	s0,160(sp)
ffffffffc0204b82:	64ea                	ld	s1,152(sp)
ffffffffc0204b84:	694a                	ld	s2,144(sp)
ffffffffc0204b86:	69aa                	ld	s3,136(sp)
ffffffffc0204b88:	7ae6                	ld	s5,120(sp)
ffffffffc0204b8a:	7b46                	ld	s6,112(sp)
ffffffffc0204b8c:	7ba6                	ld	s7,104(sp)
ffffffffc0204b8e:	7c06                	ld	s8,96(sp)
ffffffffc0204b90:	6ce6                	ld	s9,88(sp)
ffffffffc0204b92:	6d46                	ld	s10,80(sp)
ffffffffc0204b94:	6da6                	ld	s11,72(sp)
ffffffffc0204b96:	8552                	mv	a0,s4
ffffffffc0204b98:	6a0a                	ld	s4,128(sp)
ffffffffc0204b9a:	614d                	addi	sp,sp,176
ffffffffc0204b9c:	8082                	ret
    memcpy(local_name, name, len);
ffffffffc0204b9e:	463d                	li	a2,15
ffffffffc0204ba0:	85ca                	mv	a1,s2
ffffffffc0204ba2:	1808                	addi	a0,sp,48
ffffffffc0204ba4:	4d9000ef          	jal	ra,ffffffffc020587c <memcpy>
    if (mm != NULL)
ffffffffc0204ba8:	e20991e3          	bnez	s3,ffffffffc02049ca <do_execve+0x62>
    if (current->mm != NULL)
ffffffffc0204bac:	000db783          	ld	a5,0(s11)
ffffffffc0204bb0:	779c                	ld	a5,40(a5)
ffffffffc0204bb2:	e40788e3          	beqz	a5,ffffffffc0204a02 <do_execve+0x9a>
        panic("load_icode: current->mm must be empty.\n");
ffffffffc0204bb6:	00003617          	auipc	a2,0x3
ffffffffc0204bba:	9aa60613          	addi	a2,a2,-1622 # ffffffffc0207560 <default_pmm_manager+0xe98>
ffffffffc0204bbe:	24900593          	li	a1,585
ffffffffc0204bc2:	00002517          	auipc	a0,0x2
ffffffffc0204bc6:	59650513          	addi	a0,a0,1430 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc0204bca:	8c5fb0ef          	jal	ra,ffffffffc020048e <__panic>
    put_pgdir(mm);
ffffffffc0204bce:	8526                	mv	a0,s1
ffffffffc0204bd0:	afeff0ef          	jal	ra,ffffffffc0203ece <put_pgdir>
    mm_destroy(mm);
ffffffffc0204bd4:	8526                	mv	a0,s1
ffffffffc0204bd6:	c03fe0ef          	jal	ra,ffffffffc02037d8 <mm_destroy>
        ret = -E_INVAL_ELF;
ffffffffc0204bda:	5a61                	li	s4,-8
    do_exit(ret);
ffffffffc0204bdc:	8552                	mv	a0,s4
ffffffffc0204bde:	885ff0ef          	jal	ra,ffffffffc0204462 <do_exit>
    int ret = -E_NO_MEM;
ffffffffc0204be2:	5a71                	li	s4,-4
ffffffffc0204be4:	bfe5                	j	ffffffffc0204bdc <do_execve+0x274>
        if (ph->p_filesz > ph->p_memsz)
ffffffffc0204be6:	0289b603          	ld	a2,40(s3)
ffffffffc0204bea:	0209b783          	ld	a5,32(s3)
ffffffffc0204bee:	1cf66d63          	bltu	a2,a5,ffffffffc0204dc8 <do_execve+0x460>
        if (ph->p_flags & ELF_PF_X)
ffffffffc0204bf2:	0049a783          	lw	a5,4(s3)
ffffffffc0204bf6:	0017f693          	andi	a3,a5,1
ffffffffc0204bfa:	c291                	beqz	a3,ffffffffc0204bfe <do_execve+0x296>
            vm_flags |= VM_EXEC;
ffffffffc0204bfc:	4691                	li	a3,4
        if (ph->p_flags & ELF_PF_W)
ffffffffc0204bfe:	0027f713          	andi	a4,a5,2
        if (ph->p_flags & ELF_PF_R)
ffffffffc0204c02:	8b91                	andi	a5,a5,4
        if (ph->p_flags & ELF_PF_W)
ffffffffc0204c04:	e779                	bnez	a4,ffffffffc0204cd2 <do_execve+0x36a>
        vm_flags = 0, perm = PTE_U | PTE_V;
ffffffffc0204c06:	4d45                	li	s10,17
        if (ph->p_flags & ELF_PF_R)
ffffffffc0204c08:	c781                	beqz	a5,ffffffffc0204c10 <do_execve+0x2a8>
            vm_flags |= VM_READ;
ffffffffc0204c0a:	0016e693          	ori	a3,a3,1
            perm |= PTE_R;
ffffffffc0204c0e:	4d4d                	li	s10,19
        if (vm_flags & VM_WRITE)
ffffffffc0204c10:	0026f793          	andi	a5,a3,2
ffffffffc0204c14:	e3f1                	bnez	a5,ffffffffc0204cd8 <do_execve+0x370>
        if (vm_flags & VM_EXEC)
ffffffffc0204c16:	0046f793          	andi	a5,a3,4
ffffffffc0204c1a:	c399                	beqz	a5,ffffffffc0204c20 <do_execve+0x2b8>
            perm |= PTE_X;
ffffffffc0204c1c:	008d6d13          	ori	s10,s10,8
        if ((ret = mm_map(mm, ph->p_va, ph->p_memsz, vm_flags, NULL)) != 0)
ffffffffc0204c20:	0109b583          	ld	a1,16(s3)
ffffffffc0204c24:	4701                	li	a4,0
ffffffffc0204c26:	8526                	mv	a0,s1
ffffffffc0204c28:	c03fe0ef          	jal	ra,ffffffffc020382a <mm_map>
ffffffffc0204c2c:	8a2a                	mv	s4,a0
ffffffffc0204c2e:	ed35                	bnez	a0,ffffffffc0204caa <do_execve+0x342>
        uintptr_t start = ph->p_va, end, la = ROUNDDOWN(start, PGSIZE);
ffffffffc0204c30:	0109bb83          	ld	s7,16(s3)
ffffffffc0204c34:	77fd                	lui	a5,0xfffff
        end = ph->p_va + ph->p_filesz;
ffffffffc0204c36:	0209ba03          	ld	s4,32(s3)
        unsigned char *from = binary + ph->p_offset;
ffffffffc0204c3a:	0089b903          	ld	s2,8(s3)
        uintptr_t start = ph->p_va, end, la = ROUNDDOWN(start, PGSIZE);
ffffffffc0204c3e:	00fbfab3          	and	s5,s7,a5
        unsigned char *from = binary + ph->p_offset;
ffffffffc0204c42:	7782                	ld	a5,32(sp)
        end = ph->p_va + ph->p_filesz;
ffffffffc0204c44:	9a5e                	add	s4,s4,s7
        unsigned char *from = binary + ph->p_offset;
ffffffffc0204c46:	993e                	add	s2,s2,a5
        while (start < end)
ffffffffc0204c48:	054be963          	bltu	s7,s4,ffffffffc0204c9a <do_execve+0x332>
ffffffffc0204c4c:	aa95                	j	ffffffffc0204dc0 <do_execve+0x458>
            off = start - la, size = PGSIZE - off, la += PGSIZE;
ffffffffc0204c4e:	6785                	lui	a5,0x1
ffffffffc0204c50:	415b8533          	sub	a0,s7,s5
ffffffffc0204c54:	9abe                	add	s5,s5,a5
ffffffffc0204c56:	417a8633          	sub	a2,s5,s7
            if (end < la)
ffffffffc0204c5a:	015a7463          	bgeu	s4,s5,ffffffffc0204c62 <do_execve+0x2fa>
                size -= la - end;
ffffffffc0204c5e:	417a0633          	sub	a2,s4,s7
    return page - pages + nbase;
ffffffffc0204c62:	000cb683          	ld	a3,0(s9)
ffffffffc0204c66:	67c2                	ld	a5,16(sp)
    return KADDR(page2pa(page));
ffffffffc0204c68:	000c3583          	ld	a1,0(s8)
    return page - pages + nbase;
ffffffffc0204c6c:	40d406b3          	sub	a3,s0,a3
ffffffffc0204c70:	8699                	srai	a3,a3,0x6
ffffffffc0204c72:	96be                	add	a3,a3,a5
    return KADDR(page2pa(page));
ffffffffc0204c74:	67e2                	ld	a5,24(sp)
ffffffffc0204c76:	00f6f833          	and	a6,a3,a5
    return page2ppn(page) << PGSHIFT;
ffffffffc0204c7a:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0204c7c:	14b87863          	bgeu	a6,a1,ffffffffc0204dcc <do_execve+0x464>
ffffffffc0204c80:	000b3803          	ld	a6,0(s6)
            memcpy(page2kva(page) + off, from, size);
ffffffffc0204c84:	85ca                	mv	a1,s2
            start += size, from += size;
ffffffffc0204c86:	9bb2                	add	s7,s7,a2
ffffffffc0204c88:	96c2                	add	a3,a3,a6
            memcpy(page2kva(page) + off, from, size);
ffffffffc0204c8a:	9536                	add	a0,a0,a3
            start += size, from += size;
ffffffffc0204c8c:	e432                	sd	a2,8(sp)
            memcpy(page2kva(page) + off, from, size);
ffffffffc0204c8e:	3ef000ef          	jal	ra,ffffffffc020587c <memcpy>
            start += size, from += size;
ffffffffc0204c92:	6622                	ld	a2,8(sp)
ffffffffc0204c94:	9932                	add	s2,s2,a2
        while (start < end)
ffffffffc0204c96:	054bf363          	bgeu	s7,s4,ffffffffc0204cdc <do_execve+0x374>
            if ((page = pgdir_alloc_page(mm->pgdir, la, perm)) == NULL)
ffffffffc0204c9a:	6c88                	ld	a0,24(s1)
ffffffffc0204c9c:	866a                	mv	a2,s10
ffffffffc0204c9e:	85d6                	mv	a1,s5
ffffffffc0204ca0:	913fe0ef          	jal	ra,ffffffffc02035b2 <pgdir_alloc_page>
ffffffffc0204ca4:	842a                	mv	s0,a0
ffffffffc0204ca6:	f545                	bnez	a0,ffffffffc0204c4e <do_execve+0x2e6>
        ret = -E_NO_MEM;
ffffffffc0204ca8:	5a71                	li	s4,-4
    exit_mmap(mm);
ffffffffc0204caa:	8526                	mv	a0,s1
ffffffffc0204cac:	cc9fe0ef          	jal	ra,ffffffffc0203974 <exit_mmap>
    put_pgdir(mm);
ffffffffc0204cb0:	8526                	mv	a0,s1
ffffffffc0204cb2:	a1cff0ef          	jal	ra,ffffffffc0203ece <put_pgdir>
    mm_destroy(mm);
ffffffffc0204cb6:	8526                	mv	a0,s1
ffffffffc0204cb8:	b21fe0ef          	jal	ra,ffffffffc02037d8 <mm_destroy>
    return ret;
ffffffffc0204cbc:	b705                	j	ffffffffc0204bdc <do_execve+0x274>
            exit_mmap(mm);
ffffffffc0204cbe:	854e                	mv	a0,s3
ffffffffc0204cc0:	cb5fe0ef          	jal	ra,ffffffffc0203974 <exit_mmap>
            put_pgdir(mm);
ffffffffc0204cc4:	854e                	mv	a0,s3
ffffffffc0204cc6:	a08ff0ef          	jal	ra,ffffffffc0203ece <put_pgdir>
            mm_destroy(mm);
ffffffffc0204cca:	854e                	mv	a0,s3
ffffffffc0204ccc:	b0dfe0ef          	jal	ra,ffffffffc02037d8 <mm_destroy>
ffffffffc0204cd0:	b32d                	j	ffffffffc02049fa <do_execve+0x92>
            vm_flags |= VM_WRITE;
ffffffffc0204cd2:	0026e693          	ori	a3,a3,2
        if (ph->p_flags & ELF_PF_R)
ffffffffc0204cd6:	fb95                	bnez	a5,ffffffffc0204c0a <do_execve+0x2a2>
            perm |= (PTE_W | PTE_R);
ffffffffc0204cd8:	4d5d                	li	s10,23
ffffffffc0204cda:	bf35                	j	ffffffffc0204c16 <do_execve+0x2ae>
        end = ph->p_va + ph->p_memsz;
ffffffffc0204cdc:	0109b683          	ld	a3,16(s3)
ffffffffc0204ce0:	0289b903          	ld	s2,40(s3)
ffffffffc0204ce4:	9936                	add	s2,s2,a3
        if (start < la)
ffffffffc0204ce6:	075bfd63          	bgeu	s7,s5,ffffffffc0204d60 <do_execve+0x3f8>
            if (start == end)
ffffffffc0204cea:	db790fe3          	beq	s2,s7,ffffffffc0204aa8 <do_execve+0x140>
            off = start + PGSIZE - la, size = PGSIZE - off;
ffffffffc0204cee:	6785                	lui	a5,0x1
ffffffffc0204cf0:	00fb8533          	add	a0,s7,a5
ffffffffc0204cf4:	41550533          	sub	a0,a0,s5
                size -= la - end;
ffffffffc0204cf8:	41790a33          	sub	s4,s2,s7
            if (end < la)
ffffffffc0204cfc:	0b597d63          	bgeu	s2,s5,ffffffffc0204db6 <do_execve+0x44e>
    return page - pages + nbase;
ffffffffc0204d00:	000cb683          	ld	a3,0(s9)
ffffffffc0204d04:	67c2                	ld	a5,16(sp)
    return KADDR(page2pa(page));
ffffffffc0204d06:	000c3603          	ld	a2,0(s8)
    return page - pages + nbase;
ffffffffc0204d0a:	40d406b3          	sub	a3,s0,a3
ffffffffc0204d0e:	8699                	srai	a3,a3,0x6
ffffffffc0204d10:	96be                	add	a3,a3,a5
    return KADDR(page2pa(page));
ffffffffc0204d12:	67e2                	ld	a5,24(sp)
ffffffffc0204d14:	00f6f5b3          	and	a1,a3,a5
    return page2ppn(page) << PGSHIFT;
ffffffffc0204d18:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0204d1a:	0ac5f963          	bgeu	a1,a2,ffffffffc0204dcc <do_execve+0x464>
ffffffffc0204d1e:	000b3803          	ld	a6,0(s6)
            memset(page2kva(page) + off, 0, size);
ffffffffc0204d22:	8652                	mv	a2,s4
ffffffffc0204d24:	4581                	li	a1,0
ffffffffc0204d26:	96c2                	add	a3,a3,a6
ffffffffc0204d28:	9536                	add	a0,a0,a3
ffffffffc0204d2a:	341000ef          	jal	ra,ffffffffc020586a <memset>
            start += size;
ffffffffc0204d2e:	017a0733          	add	a4,s4,s7
            assert((end < la && start == end) || (end >= la && start == la));
ffffffffc0204d32:	03597463          	bgeu	s2,s5,ffffffffc0204d5a <do_execve+0x3f2>
ffffffffc0204d36:	d6e909e3          	beq	s2,a4,ffffffffc0204aa8 <do_execve+0x140>
ffffffffc0204d3a:	00003697          	auipc	a3,0x3
ffffffffc0204d3e:	84e68693          	addi	a3,a3,-1970 # ffffffffc0207588 <default_pmm_manager+0xec0>
ffffffffc0204d42:	00001617          	auipc	a2,0x1
ffffffffc0204d46:	5d660613          	addi	a2,a2,1494 # ffffffffc0206318 <commands+0x818>
ffffffffc0204d4a:	2b200593          	li	a1,690
ffffffffc0204d4e:	00002517          	auipc	a0,0x2
ffffffffc0204d52:	40a50513          	addi	a0,a0,1034 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc0204d56:	f38fb0ef          	jal	ra,ffffffffc020048e <__panic>
ffffffffc0204d5a:	ff5710e3          	bne	a4,s5,ffffffffc0204d3a <do_execve+0x3d2>
ffffffffc0204d5e:	8bd6                	mv	s7,s5
        while (start < end)
ffffffffc0204d60:	d52bf4e3          	bgeu	s7,s2,ffffffffc0204aa8 <do_execve+0x140>
            if ((page = pgdir_alloc_page(mm->pgdir, la, perm)) == NULL)
ffffffffc0204d64:	6c88                	ld	a0,24(s1)
ffffffffc0204d66:	866a                	mv	a2,s10
ffffffffc0204d68:	85d6                	mv	a1,s5
ffffffffc0204d6a:	849fe0ef          	jal	ra,ffffffffc02035b2 <pgdir_alloc_page>
ffffffffc0204d6e:	842a                	mv	s0,a0
ffffffffc0204d70:	dd05                	beqz	a0,ffffffffc0204ca8 <do_execve+0x340>
            off = start - la, size = PGSIZE - off, la += PGSIZE;
ffffffffc0204d72:	6785                	lui	a5,0x1
ffffffffc0204d74:	415b8533          	sub	a0,s7,s5
ffffffffc0204d78:	9abe                	add	s5,s5,a5
ffffffffc0204d7a:	417a8633          	sub	a2,s5,s7
            if (end < la)
ffffffffc0204d7e:	01597463          	bgeu	s2,s5,ffffffffc0204d86 <do_execve+0x41e>
                size -= la - end;
ffffffffc0204d82:	41790633          	sub	a2,s2,s7
    return page - pages + nbase;
ffffffffc0204d86:	000cb683          	ld	a3,0(s9)
ffffffffc0204d8a:	67c2                	ld	a5,16(sp)
    return KADDR(page2pa(page));
ffffffffc0204d8c:	000c3583          	ld	a1,0(s8)
    return page - pages + nbase;
ffffffffc0204d90:	40d406b3          	sub	a3,s0,a3
ffffffffc0204d94:	8699                	srai	a3,a3,0x6
ffffffffc0204d96:	96be                	add	a3,a3,a5
    return KADDR(page2pa(page));
ffffffffc0204d98:	67e2                	ld	a5,24(sp)
ffffffffc0204d9a:	00f6f833          	and	a6,a3,a5
    return page2ppn(page) << PGSHIFT;
ffffffffc0204d9e:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0204da0:	02b87663          	bgeu	a6,a1,ffffffffc0204dcc <do_execve+0x464>
ffffffffc0204da4:	000b3803          	ld	a6,0(s6)
            memset(page2kva(page) + off, 0, size);
ffffffffc0204da8:	4581                	li	a1,0
            start += size;
ffffffffc0204daa:	9bb2                	add	s7,s7,a2
ffffffffc0204dac:	96c2                	add	a3,a3,a6
            memset(page2kva(page) + off, 0, size);
ffffffffc0204dae:	9536                	add	a0,a0,a3
ffffffffc0204db0:	2bb000ef          	jal	ra,ffffffffc020586a <memset>
ffffffffc0204db4:	b775                	j	ffffffffc0204d60 <do_execve+0x3f8>
            off = start + PGSIZE - la, size = PGSIZE - off;
ffffffffc0204db6:	417a8a33          	sub	s4,s5,s7
ffffffffc0204dba:	b799                	j	ffffffffc0204d00 <do_execve+0x398>
        return -E_INVAL;
ffffffffc0204dbc:	5a75                	li	s4,-3
ffffffffc0204dbe:	b3c1                	j	ffffffffc0204b7e <do_execve+0x216>
        while (start < end)
ffffffffc0204dc0:	86de                	mv	a3,s7
ffffffffc0204dc2:	bf39                	j	ffffffffc0204ce0 <do_execve+0x378>
    int ret = -E_NO_MEM;
ffffffffc0204dc4:	5a71                	li	s4,-4
ffffffffc0204dc6:	bdc5                	j	ffffffffc0204cb6 <do_execve+0x34e>
            ret = -E_INVAL_ELF;
ffffffffc0204dc8:	5a61                	li	s4,-8
ffffffffc0204dca:	b5c5                	j	ffffffffc0204caa <do_execve+0x342>
ffffffffc0204dcc:	00002617          	auipc	a2,0x2
ffffffffc0204dd0:	93460613          	addi	a2,a2,-1740 # ffffffffc0206700 <default_pmm_manager+0x38>
ffffffffc0204dd4:	07100593          	li	a1,113
ffffffffc0204dd8:	00002517          	auipc	a0,0x2
ffffffffc0204ddc:	95050513          	addi	a0,a0,-1712 # ffffffffc0206728 <default_pmm_manager+0x60>
ffffffffc0204de0:	eaefb0ef          	jal	ra,ffffffffc020048e <__panic>
    current->pgdir = PADDR(mm->pgdir);
ffffffffc0204de4:	00002617          	auipc	a2,0x2
ffffffffc0204de8:	9c460613          	addi	a2,a2,-1596 # ffffffffc02067a8 <default_pmm_manager+0xe0>
ffffffffc0204dec:	2d100593          	li	a1,721
ffffffffc0204df0:	00002517          	auipc	a0,0x2
ffffffffc0204df4:	36850513          	addi	a0,a0,872 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc0204df8:	e96fb0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - 4 * PGSIZE, PTE_USER) != NULL);
ffffffffc0204dfc:	00003697          	auipc	a3,0x3
ffffffffc0204e00:	8a468693          	addi	a3,a3,-1884 # ffffffffc02076a0 <default_pmm_manager+0xfd8>
ffffffffc0204e04:	00001617          	auipc	a2,0x1
ffffffffc0204e08:	51460613          	addi	a2,a2,1300 # ffffffffc0206318 <commands+0x818>
ffffffffc0204e0c:	2cc00593          	li	a1,716
ffffffffc0204e10:	00002517          	auipc	a0,0x2
ffffffffc0204e14:	34850513          	addi	a0,a0,840 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc0204e18:	e76fb0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - 3 * PGSIZE, PTE_USER) != NULL);
ffffffffc0204e1c:	00003697          	auipc	a3,0x3
ffffffffc0204e20:	83c68693          	addi	a3,a3,-1988 # ffffffffc0207658 <default_pmm_manager+0xf90>
ffffffffc0204e24:	00001617          	auipc	a2,0x1
ffffffffc0204e28:	4f460613          	addi	a2,a2,1268 # ffffffffc0206318 <commands+0x818>
ffffffffc0204e2c:	2cb00593          	li	a1,715
ffffffffc0204e30:	00002517          	auipc	a0,0x2
ffffffffc0204e34:	32850513          	addi	a0,a0,808 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc0204e38:	e56fb0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - 2 * PGSIZE, PTE_USER) != NULL);
ffffffffc0204e3c:	00002697          	auipc	a3,0x2
ffffffffc0204e40:	7d468693          	addi	a3,a3,2004 # ffffffffc0207610 <default_pmm_manager+0xf48>
ffffffffc0204e44:	00001617          	auipc	a2,0x1
ffffffffc0204e48:	4d460613          	addi	a2,a2,1236 # ffffffffc0206318 <commands+0x818>
ffffffffc0204e4c:	2ca00593          	li	a1,714
ffffffffc0204e50:	00002517          	auipc	a0,0x2
ffffffffc0204e54:	30850513          	addi	a0,a0,776 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc0204e58:	e36fb0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - PGSIZE, PTE_USER) != NULL);
ffffffffc0204e5c:	00002697          	auipc	a3,0x2
ffffffffc0204e60:	76c68693          	addi	a3,a3,1900 # ffffffffc02075c8 <default_pmm_manager+0xf00>
ffffffffc0204e64:	00001617          	auipc	a2,0x1
ffffffffc0204e68:	4b460613          	addi	a2,a2,1204 # ffffffffc0206318 <commands+0x818>
ffffffffc0204e6c:	2c900593          	li	a1,713
ffffffffc0204e70:	00002517          	auipc	a0,0x2
ffffffffc0204e74:	2e850513          	addi	a0,a0,744 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc0204e78:	e16fb0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc0204e7c <do_yield>:
    current->need_resched = 1;
ffffffffc0204e7c:	000a6797          	auipc	a5,0xa6
ffffffffc0204e80:	89c7b783          	ld	a5,-1892(a5) # ffffffffc02aa718 <current>
ffffffffc0204e84:	4705                	li	a4,1
ffffffffc0204e86:	ef98                	sd	a4,24(a5)
}
ffffffffc0204e88:	4501                	li	a0,0
ffffffffc0204e8a:	8082                	ret

ffffffffc0204e8c <do_wait>:
{
ffffffffc0204e8c:	1101                	addi	sp,sp,-32
ffffffffc0204e8e:	e822                	sd	s0,16(sp)
ffffffffc0204e90:	e426                	sd	s1,8(sp)
ffffffffc0204e92:	ec06                	sd	ra,24(sp)
ffffffffc0204e94:	842e                	mv	s0,a1
ffffffffc0204e96:	84aa                	mv	s1,a0
    if (code_store != NULL)
ffffffffc0204e98:	c999                	beqz	a1,ffffffffc0204eae <do_wait+0x22>
    struct mm_struct *mm = current->mm;
ffffffffc0204e9a:	000a6797          	auipc	a5,0xa6
ffffffffc0204e9e:	87e7b783          	ld	a5,-1922(a5) # ffffffffc02aa718 <current>
        if (!user_mem_check(mm, (uintptr_t)code_store, sizeof(int), 1))
ffffffffc0204ea2:	7788                	ld	a0,40(a5)
ffffffffc0204ea4:	4685                	li	a3,1
ffffffffc0204ea6:	4611                	li	a2,4
ffffffffc0204ea8:	e67fe0ef          	jal	ra,ffffffffc0203d0e <user_mem_check>
ffffffffc0204eac:	c909                	beqz	a0,ffffffffc0204ebe <do_wait+0x32>
ffffffffc0204eae:	85a2                	mv	a1,s0
}
ffffffffc0204eb0:	6442                	ld	s0,16(sp)
ffffffffc0204eb2:	60e2                	ld	ra,24(sp)
ffffffffc0204eb4:	8526                	mv	a0,s1
ffffffffc0204eb6:	64a2                	ld	s1,8(sp)
ffffffffc0204eb8:	6105                	addi	sp,sp,32
ffffffffc0204eba:	ef2ff06f          	j	ffffffffc02045ac <do_wait.part.0>
ffffffffc0204ebe:	60e2                	ld	ra,24(sp)
ffffffffc0204ec0:	6442                	ld	s0,16(sp)
ffffffffc0204ec2:	64a2                	ld	s1,8(sp)
ffffffffc0204ec4:	5575                	li	a0,-3
ffffffffc0204ec6:	6105                	addi	sp,sp,32
ffffffffc0204ec8:	8082                	ret

ffffffffc0204eca <do_kill>:
{
ffffffffc0204eca:	1141                	addi	sp,sp,-16
    if (0 < pid && pid < MAX_PID)
ffffffffc0204ecc:	6789                	lui	a5,0x2
{
ffffffffc0204ece:	e406                	sd	ra,8(sp)
ffffffffc0204ed0:	e022                	sd	s0,0(sp)
    if (0 < pid && pid < MAX_PID)
ffffffffc0204ed2:	fff5071b          	addiw	a4,a0,-1
ffffffffc0204ed6:	17f9                	addi	a5,a5,-2
ffffffffc0204ed8:	02e7e963          	bltu	a5,a4,ffffffffc0204f0a <do_kill+0x40>
        list_entry_t *list = hash_list + pid_hashfn(pid), *le = list;
ffffffffc0204edc:	842a                	mv	s0,a0
ffffffffc0204ede:	45a9                	li	a1,10
ffffffffc0204ee0:	2501                	sext.w	a0,a0
ffffffffc0204ee2:	4e2000ef          	jal	ra,ffffffffc02053c4 <hash32>
ffffffffc0204ee6:	02051793          	slli	a5,a0,0x20
ffffffffc0204eea:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0204eee:	000a1797          	auipc	a5,0xa1
ffffffffc0204ef2:	7ba78793          	addi	a5,a5,1978 # ffffffffc02a66a8 <hash_list>
ffffffffc0204ef6:	953e                	add	a0,a0,a5
ffffffffc0204ef8:	87aa                	mv	a5,a0
        while ((le = list_next(le)) != list)
ffffffffc0204efa:	a029                	j	ffffffffc0204f04 <do_kill+0x3a>
            if (proc->pid == pid)
ffffffffc0204efc:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0204f00:	00870b63          	beq	a4,s0,ffffffffc0204f16 <do_kill+0x4c>
ffffffffc0204f04:	679c                	ld	a5,8(a5)
        while ((le = list_next(le)) != list)
ffffffffc0204f06:	fef51be3          	bne	a0,a5,ffffffffc0204efc <do_kill+0x32>
    return -E_INVAL;
ffffffffc0204f0a:	5475                	li	s0,-3
}
ffffffffc0204f0c:	60a2                	ld	ra,8(sp)
ffffffffc0204f0e:	8522                	mv	a0,s0
ffffffffc0204f10:	6402                	ld	s0,0(sp)
ffffffffc0204f12:	0141                	addi	sp,sp,16
ffffffffc0204f14:	8082                	ret
        if (!(proc->flags & PF_EXITING))
ffffffffc0204f16:	fd87a703          	lw	a4,-40(a5)
ffffffffc0204f1a:	00177693          	andi	a3,a4,1
ffffffffc0204f1e:	e295                	bnez	a3,ffffffffc0204f42 <do_kill+0x78>
            if (proc->wait_state & WT_INTERRUPTED)
ffffffffc0204f20:	4bd4                	lw	a3,20(a5)
            proc->flags |= PF_EXITING;
ffffffffc0204f22:	00176713          	ori	a4,a4,1
ffffffffc0204f26:	fce7ac23          	sw	a4,-40(a5)
            return 0;
ffffffffc0204f2a:	4401                	li	s0,0
            if (proc->wait_state & WT_INTERRUPTED)
ffffffffc0204f2c:	fe06d0e3          	bgez	a3,ffffffffc0204f0c <do_kill+0x42>
                wakeup_proc(proc);
ffffffffc0204f30:	f2878513          	addi	a0,a5,-216
ffffffffc0204f34:	276000ef          	jal	ra,ffffffffc02051aa <wakeup_proc>
}
ffffffffc0204f38:	60a2                	ld	ra,8(sp)
ffffffffc0204f3a:	8522                	mv	a0,s0
ffffffffc0204f3c:	6402                	ld	s0,0(sp)
ffffffffc0204f3e:	0141                	addi	sp,sp,16
ffffffffc0204f40:	8082                	ret
        return -E_KILLED;
ffffffffc0204f42:	545d                	li	s0,-9
ffffffffc0204f44:	b7e1                	j	ffffffffc0204f0c <do_kill+0x42>

ffffffffc0204f46 <proc_init>:

// proc_init - set up the first kernel thread idleproc "idle" by itself and
//           - create the second kernel thread init_main
void proc_init(void)
{
ffffffffc0204f46:	7179                	addi	sp,sp,-48
ffffffffc0204f48:	ec26                	sd	s1,24(sp)
    elm->prev = elm->next = elm;
ffffffffc0204f4a:	000a5797          	auipc	a5,0xa5
ffffffffc0204f4e:	75e78793          	addi	a5,a5,1886 # ffffffffc02aa6a8 <proc_list>
ffffffffc0204f52:	f406                	sd	ra,40(sp)
ffffffffc0204f54:	f022                	sd	s0,32(sp)
ffffffffc0204f56:	e84a                	sd	s2,16(sp)
ffffffffc0204f58:	e44e                	sd	s3,8(sp)
ffffffffc0204f5a:	000a1497          	auipc	s1,0xa1
ffffffffc0204f5e:	74e48493          	addi	s1,s1,1870 # ffffffffc02a66a8 <hash_list>
ffffffffc0204f62:	e79c                	sd	a5,8(a5)
ffffffffc0204f64:	e39c                	sd	a5,0(a5)
    int i;

    list_init(&proc_list);
    for (i = 0; i < HASH_LIST_SIZE; i++)
ffffffffc0204f66:	000a5717          	auipc	a4,0xa5
ffffffffc0204f6a:	74270713          	addi	a4,a4,1858 # ffffffffc02aa6a8 <proc_list>
ffffffffc0204f6e:	87a6                	mv	a5,s1
ffffffffc0204f70:	e79c                	sd	a5,8(a5)
ffffffffc0204f72:	e39c                	sd	a5,0(a5)
ffffffffc0204f74:	07c1                	addi	a5,a5,16
ffffffffc0204f76:	fef71de3          	bne	a4,a5,ffffffffc0204f70 <proc_init+0x2a>
    {
        list_init(hash_list + i);
    }

    if ((idleproc = alloc_proc()) == NULL)
ffffffffc0204f7a:	e31fe0ef          	jal	ra,ffffffffc0203daa <alloc_proc>
ffffffffc0204f7e:	000a5997          	auipc	s3,0xa5
ffffffffc0204f82:	7a298993          	addi	s3,s3,1954 # ffffffffc02aa720 <idleproc>
ffffffffc0204f86:	00a9b023          	sd	a0,0(s3)
ffffffffc0204f8a:	12050463          	beqz	a0,ffffffffc02050b2 <proc_init+0x16c>
    {
        panic("cannot alloc idleproc.\n");
    }

    idleproc->pid = 0;
    idleproc->state = PROC_RUNNABLE;
ffffffffc0204f8e:	4789                	li	a5,2
ffffffffc0204f90:	e11c                	sd	a5,0(a0)
    idleproc->kstack = (uintptr_t)bootstack;
ffffffffc0204f92:	00003797          	auipc	a5,0x3
ffffffffc0204f96:	06e78793          	addi	a5,a5,110 # ffffffffc0208000 <bootstack>
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc0204f9a:	0b450413          	addi	s0,a0,180
    idleproc->kstack = (uintptr_t)bootstack;
ffffffffc0204f9e:	e91c                	sd	a5,16(a0)
    idleproc->need_resched = 1;
ffffffffc0204fa0:	4785                	li	a5,1
ffffffffc0204fa2:	ed1c                	sd	a5,24(a0)
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc0204fa4:	4641                	li	a2,16
ffffffffc0204fa6:	4581                	li	a1,0
ffffffffc0204fa8:	8522                	mv	a0,s0
ffffffffc0204faa:	0c1000ef          	jal	ra,ffffffffc020586a <memset>
    return memcpy(proc->name, name, PROC_NAME_LEN);
ffffffffc0204fae:	463d                	li	a2,15
ffffffffc0204fb0:	00002597          	auipc	a1,0x2
ffffffffc0204fb4:	75058593          	addi	a1,a1,1872 # ffffffffc0207700 <default_pmm_manager+0x1038>
ffffffffc0204fb8:	8522                	mv	a0,s0
ffffffffc0204fba:	0c3000ef          	jal	ra,ffffffffc020587c <memcpy>
    set_proc_name(idleproc, "idle");


    idleproc->tf = (struct trapframe *)(idleproc->kstack + KSTACKSIZE) - 1;
ffffffffc0204fbe:	0009b783          	ld	a5,0(s3)

    nr_process++;
ffffffffc0204fc2:	000a5617          	auipc	a2,0xa5
ffffffffc0204fc6:	76e60613          	addi	a2,a2,1902 # ffffffffc02aa730 <nr_process>
ffffffffc0204fca:	4218                	lw	a4,0(a2)
    idleproc->tf = (struct trapframe *)(idleproc->kstack + KSTACKSIZE) - 1;
ffffffffc0204fcc:	6b94                	ld	a3,16(a5)
ffffffffc0204fce:	6909                	lui	s2,0x2
ffffffffc0204fd0:	ee090593          	addi	a1,s2,-288 # 1ee0 <_binary_obj___user_faultread_out_size-0x7cc8>
ffffffffc0204fd4:	96ae                	add	a3,a3,a1
    nr_process++;
ffffffffc0204fd6:	2705                	addiw	a4,a4,1
    idleproc->tf = (struct trapframe *)(idleproc->kstack + KSTACKSIZE) - 1;
ffffffffc0204fd8:	f3d4                	sd	a3,160(a5)

    current = idleproc;

     cprintf("proc_init: about to create init_main\n");
ffffffffc0204fda:	00002517          	auipc	a0,0x2
ffffffffc0204fde:	72e50513          	addi	a0,a0,1838 # ffffffffc0207708 <default_pmm_manager+0x1040>
    nr_process++;
ffffffffc0204fe2:	c218                	sw	a4,0(a2)
    current = idleproc;
ffffffffc0204fe4:	000a5717          	auipc	a4,0xa5
ffffffffc0204fe8:	72f73a23          	sd	a5,1844(a4) # ffffffffc02aa718 <current>
     cprintf("proc_init: about to create init_main\n");
ffffffffc0204fec:	9a8fb0ef          	jal	ra,ffffffffc0200194 <cprintf>

    int pid = kernel_thread(init_main, NULL, 0);
ffffffffc0204ff0:	4601                	li	a2,0
ffffffffc0204ff2:	4581                	li	a1,0
ffffffffc0204ff4:	fffff517          	auipc	a0,0xfffff
ffffffffc0204ff8:	78a50513          	addi	a0,a0,1930 # ffffffffc020477e <init_main>
ffffffffc0204ffc:	c16ff0ef          	jal	ra,ffffffffc0204412 <kernel_thread>
ffffffffc0205000:	842a                	mv	s0,a0
    if (pid <= 0)
ffffffffc0205002:	08a05c63          	blez	a0,ffffffffc020509a <proc_init+0x154>
    if (0 < pid && pid < MAX_PID)
ffffffffc0205006:	fff5079b          	addiw	a5,a0,-1
ffffffffc020500a:	1979                	addi	s2,s2,-2
ffffffffc020500c:	2501                	sext.w	a0,a0
ffffffffc020500e:	02f96363          	bltu	s2,a5,ffffffffc0205034 <proc_init+0xee>
        list_entry_t *list = hash_list + pid_hashfn(pid), *le = list;
ffffffffc0205012:	45a9                	li	a1,10
ffffffffc0205014:	3b0000ef          	jal	ra,ffffffffc02053c4 <hash32>
ffffffffc0205018:	02051793          	slli	a5,a0,0x20
ffffffffc020501c:	01c7d693          	srli	a3,a5,0x1c
ffffffffc0205020:	96a6                	add	a3,a3,s1
ffffffffc0205022:	87b6                	mv	a5,a3
        while ((le = list_next(le)) != list)
ffffffffc0205024:	a029                	j	ffffffffc020502e <proc_init+0xe8>
            if (proc->pid == pid)
ffffffffc0205026:	f2c7a703          	lw	a4,-212(a5)
ffffffffc020502a:	06870563          	beq	a4,s0,ffffffffc0205094 <proc_init+0x14e>
    return listelm->next;
ffffffffc020502e:	679c                	ld	a5,8(a5)
        while ((le = list_next(le)) != list)
ffffffffc0205030:	fef69be3          	bne	a3,a5,ffffffffc0205026 <proc_init+0xe0>
    return NULL;
ffffffffc0205034:	4781                	li	a5,0
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc0205036:	0b478493          	addi	s1,a5,180
    {
        panic("create init_main failed.\n");
    }

    initproc = find_proc(pid);
ffffffffc020503a:	000a5417          	auipc	s0,0xa5
ffffffffc020503e:	6ee40413          	addi	s0,s0,1774 # ffffffffc02aa728 <initproc>
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc0205042:	4641                	li	a2,16
ffffffffc0205044:	4581                	li	a1,0
ffffffffc0205046:	8526                	mv	a0,s1
    initproc = find_proc(pid);
ffffffffc0205048:	e01c                	sd	a5,0(s0)
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc020504a:	021000ef          	jal	ra,ffffffffc020586a <memset>
    return memcpy(proc->name, name, PROC_NAME_LEN);
ffffffffc020504e:	463d                	li	a2,15
ffffffffc0205050:	00002597          	auipc	a1,0x2
ffffffffc0205054:	70058593          	addi	a1,a1,1792 # ffffffffc0207750 <default_pmm_manager+0x1088>
ffffffffc0205058:	8526                	mv	a0,s1
ffffffffc020505a:	023000ef          	jal	ra,ffffffffc020587c <memcpy>
    set_proc_name(initproc, "init");

    cprintf("proc_init: initproc pid = %d, state = %d\n", initproc->pid, initproc->state);
ffffffffc020505e:	601c                	ld	a5,0(s0)
ffffffffc0205060:	00002517          	auipc	a0,0x2
ffffffffc0205064:	6f850513          	addi	a0,a0,1784 # ffffffffc0207758 <default_pmm_manager+0x1090>
ffffffffc0205068:	4390                	lw	a2,0(a5)
ffffffffc020506a:	43cc                	lw	a1,4(a5)
ffffffffc020506c:	928fb0ef          	jal	ra,ffffffffc0200194 <cprintf>

    assert(idleproc != NULL && idleproc->pid == 0);
ffffffffc0205070:	0009b783          	ld	a5,0(s3)
ffffffffc0205074:	cbbd                	beqz	a5,ffffffffc02050ea <proc_init+0x1a4>
ffffffffc0205076:	43dc                	lw	a5,4(a5)
ffffffffc0205078:	ebad                	bnez	a5,ffffffffc02050ea <proc_init+0x1a4>
    assert(initproc != NULL && initproc->pid == 1);
ffffffffc020507a:	601c                	ld	a5,0(s0)
ffffffffc020507c:	c7b9                	beqz	a5,ffffffffc02050ca <proc_init+0x184>
ffffffffc020507e:	43d8                	lw	a4,4(a5)
ffffffffc0205080:	4785                	li	a5,1
ffffffffc0205082:	04f71463          	bne	a4,a5,ffffffffc02050ca <proc_init+0x184>
}
ffffffffc0205086:	70a2                	ld	ra,40(sp)
ffffffffc0205088:	7402                	ld	s0,32(sp)
ffffffffc020508a:	64e2                	ld	s1,24(sp)
ffffffffc020508c:	6942                	ld	s2,16(sp)
ffffffffc020508e:	69a2                	ld	s3,8(sp)
ffffffffc0205090:	6145                	addi	sp,sp,48
ffffffffc0205092:	8082                	ret
            struct proc_struct *proc = le2proc(le, hash_link);
ffffffffc0205094:	f2878793          	addi	a5,a5,-216
ffffffffc0205098:	bf79                	j	ffffffffc0205036 <proc_init+0xf0>
        panic("create init_main failed.\n");
ffffffffc020509a:	00002617          	auipc	a2,0x2
ffffffffc020509e:	69660613          	addi	a2,a2,1686 # ffffffffc0207730 <default_pmm_manager+0x1068>
ffffffffc02050a2:	3fe00593          	li	a1,1022
ffffffffc02050a6:	00002517          	auipc	a0,0x2
ffffffffc02050aa:	0b250513          	addi	a0,a0,178 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc02050ae:	be0fb0ef          	jal	ra,ffffffffc020048e <__panic>
        panic("cannot alloc idleproc.\n");
ffffffffc02050b2:	00002617          	auipc	a2,0x2
ffffffffc02050b6:	63660613          	addi	a2,a2,1590 # ffffffffc02076e8 <default_pmm_manager+0x1020>
ffffffffc02050ba:	3e900593          	li	a1,1001
ffffffffc02050be:	00002517          	auipc	a0,0x2
ffffffffc02050c2:	09a50513          	addi	a0,a0,154 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc02050c6:	bc8fb0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(initproc != NULL && initproc->pid == 1);
ffffffffc02050ca:	00002697          	auipc	a3,0x2
ffffffffc02050ce:	6e668693          	addi	a3,a3,1766 # ffffffffc02077b0 <default_pmm_manager+0x10e8>
ffffffffc02050d2:	00001617          	auipc	a2,0x1
ffffffffc02050d6:	24660613          	addi	a2,a2,582 # ffffffffc0206318 <commands+0x818>
ffffffffc02050da:	40700593          	li	a1,1031
ffffffffc02050de:	00002517          	auipc	a0,0x2
ffffffffc02050e2:	07a50513          	addi	a0,a0,122 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc02050e6:	ba8fb0ef          	jal	ra,ffffffffc020048e <__panic>
    assert(idleproc != NULL && idleproc->pid == 0);
ffffffffc02050ea:	00002697          	auipc	a3,0x2
ffffffffc02050ee:	69e68693          	addi	a3,a3,1694 # ffffffffc0207788 <default_pmm_manager+0x10c0>
ffffffffc02050f2:	00001617          	auipc	a2,0x1
ffffffffc02050f6:	22660613          	addi	a2,a2,550 # ffffffffc0206318 <commands+0x818>
ffffffffc02050fa:	40600593          	li	a1,1030
ffffffffc02050fe:	00002517          	auipc	a0,0x2
ffffffffc0205102:	05a50513          	addi	a0,a0,90 # ffffffffc0207158 <default_pmm_manager+0xa90>
ffffffffc0205106:	b88fb0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc020510a <cpu_idle>:

// cpu_idle - at the end of kern_init, the first kernel thread idleproc will do below works
void cpu_idle(void)
{
ffffffffc020510a:	1101                	addi	sp,sp,-32
    cprintf("cpu_idle: starting idle loop\n");
ffffffffc020510c:	00002517          	auipc	a0,0x2
ffffffffc0205110:	6cc50513          	addi	a0,a0,1740 # ffffffffc02077d8 <default_pmm_manager+0x1110>
{
ffffffffc0205114:	e822                	sd	s0,16(sp)
ffffffffc0205116:	e426                	sd	s1,8(sp)
ffffffffc0205118:	ec06                	sd	ra,24(sp)
ffffffffc020511a:	000a5497          	auipc	s1,0xa5
ffffffffc020511e:	5fe48493          	addi	s1,s1,1534 # ffffffffc02aa718 <current>
    cprintf("cpu_idle: starting idle loop\n");
ffffffffc0205122:	872fb0ef          	jal	ra,ffffffffc0200194 <cprintf>
    while (1)
    {
        if (current->need_resched)
        {
        cprintf("cpu_idle: need_resched = 1, calling schedule\n");
ffffffffc0205126:	00002417          	auipc	s0,0x2
ffffffffc020512a:	6d240413          	addi	s0,s0,1746 # ffffffffc02077f8 <default_pmm_manager+0x1130>
        if (current->need_resched)
ffffffffc020512e:	6098                	ld	a4,0(s1)
ffffffffc0205130:	6f1c                	ld	a5,24(a4)
ffffffffc0205132:	dffd                	beqz	a5,ffffffffc0205130 <cpu_idle+0x26>
        cprintf("cpu_idle: need_resched = 1, calling schedule\n");
ffffffffc0205134:	8522                	mv	a0,s0
ffffffffc0205136:	85efb0ef          	jal	ra,ffffffffc0200194 <cprintf>
        schedule();
ffffffffc020513a:	0f0000ef          	jal	ra,ffffffffc020522a <schedule>
ffffffffc020513e:	bfc5                	j	ffffffffc020512e <cpu_idle+0x24>

ffffffffc0205140 <switch_to>:
.text
# void switch_to(struct proc_struct* from, struct proc_struct* to)
.globl switch_to
switch_to:
    # save from's registers
    STORE ra, 0*REGBYTES(a0)
ffffffffc0205140:	00153023          	sd	ra,0(a0)
    STORE sp, 1*REGBYTES(a0)
ffffffffc0205144:	00253423          	sd	sp,8(a0)
    STORE s0, 2*REGBYTES(a0)
ffffffffc0205148:	e900                	sd	s0,16(a0)
    STORE s1, 3*REGBYTES(a0)
ffffffffc020514a:	ed04                	sd	s1,24(a0)
    STORE s2, 4*REGBYTES(a0)
ffffffffc020514c:	03253023          	sd	s2,32(a0)
    STORE s3, 5*REGBYTES(a0)
ffffffffc0205150:	03353423          	sd	s3,40(a0)
    STORE s4, 6*REGBYTES(a0)
ffffffffc0205154:	03453823          	sd	s4,48(a0)
    STORE s5, 7*REGBYTES(a0)
ffffffffc0205158:	03553c23          	sd	s5,56(a0)
    STORE s6, 8*REGBYTES(a0)
ffffffffc020515c:	05653023          	sd	s6,64(a0)
    STORE s7, 9*REGBYTES(a0)
ffffffffc0205160:	05753423          	sd	s7,72(a0)
    STORE s8, 10*REGBYTES(a0)
ffffffffc0205164:	05853823          	sd	s8,80(a0)
    STORE s9, 11*REGBYTES(a0)
ffffffffc0205168:	05953c23          	sd	s9,88(a0)
    STORE s10, 12*REGBYTES(a0)
ffffffffc020516c:	07a53023          	sd	s10,96(a0)
    STORE s11, 13*REGBYTES(a0)
ffffffffc0205170:	07b53423          	sd	s11,104(a0)

    # restore to's registers
    LOAD ra, 0*REGBYTES(a1)
ffffffffc0205174:	0005b083          	ld	ra,0(a1)
    LOAD sp, 1*REGBYTES(a1)
ffffffffc0205178:	0085b103          	ld	sp,8(a1)
    LOAD s0, 2*REGBYTES(a1)
ffffffffc020517c:	6980                	ld	s0,16(a1)
    LOAD s1, 3*REGBYTES(a1)
ffffffffc020517e:	6d84                	ld	s1,24(a1)
    LOAD s2, 4*REGBYTES(a1)
ffffffffc0205180:	0205b903          	ld	s2,32(a1)
    LOAD s3, 5*REGBYTES(a1)
ffffffffc0205184:	0285b983          	ld	s3,40(a1)
    LOAD s4, 6*REGBYTES(a1)
ffffffffc0205188:	0305ba03          	ld	s4,48(a1)
    LOAD s5, 7*REGBYTES(a1)
ffffffffc020518c:	0385ba83          	ld	s5,56(a1)
    LOAD s6, 8*REGBYTES(a1)
ffffffffc0205190:	0405bb03          	ld	s6,64(a1)
    LOAD s7, 9*REGBYTES(a1)
ffffffffc0205194:	0485bb83          	ld	s7,72(a1)
    LOAD s8, 10*REGBYTES(a1)
ffffffffc0205198:	0505bc03          	ld	s8,80(a1)
    LOAD s9, 11*REGBYTES(a1)
ffffffffc020519c:	0585bc83          	ld	s9,88(a1)
    LOAD s10, 12*REGBYTES(a1)
ffffffffc02051a0:	0605bd03          	ld	s10,96(a1)
    LOAD s11, 13*REGBYTES(a1)
ffffffffc02051a4:	0685bd83          	ld	s11,104(a1)

    ret
ffffffffc02051a8:	8082                	ret

ffffffffc02051aa <wakeup_proc>:
#include <sched.h>
#include <assert.h>

void wakeup_proc(struct proc_struct *proc)
{
    assert(proc->state != PROC_ZOMBIE);
ffffffffc02051aa:	4118                	lw	a4,0(a0)
{
ffffffffc02051ac:	1101                	addi	sp,sp,-32
ffffffffc02051ae:	ec06                	sd	ra,24(sp)
ffffffffc02051b0:	e822                	sd	s0,16(sp)
ffffffffc02051b2:	e426                	sd	s1,8(sp)
    assert(proc->state != PROC_ZOMBIE);
ffffffffc02051b4:	478d                	li	a5,3
ffffffffc02051b6:	04f70b63          	beq	a4,a5,ffffffffc020520c <wakeup_proc+0x62>
ffffffffc02051ba:	842a                	mv	s0,a0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02051bc:	100027f3          	csrr	a5,sstatus
ffffffffc02051c0:	8b89                	andi	a5,a5,2
    return 0;
ffffffffc02051c2:	4481                	li	s1,0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02051c4:	ef9d                	bnez	a5,ffffffffc0205202 <wakeup_proc+0x58>
    bool intr_flag;
    local_intr_save(intr_flag);
    {
        if (proc->state != PROC_RUNNABLE)
ffffffffc02051c6:	4789                	li	a5,2
ffffffffc02051c8:	02f70163          	beq	a4,a5,ffffffffc02051ea <wakeup_proc+0x40>
        {
            proc->state = PROC_RUNNABLE;
ffffffffc02051cc:	c01c                	sw	a5,0(s0)
            proc->wait_state = 0;
ffffffffc02051ce:	0e042623          	sw	zero,236(s0)
    if (flag)
ffffffffc02051d2:	e491                	bnez	s1,ffffffffc02051de <wakeup_proc+0x34>
        {
            warn("wakeup runnable process.\n");
        }
    }
    local_intr_restore(intr_flag);
}
ffffffffc02051d4:	60e2                	ld	ra,24(sp)
ffffffffc02051d6:	6442                	ld	s0,16(sp)
ffffffffc02051d8:	64a2                	ld	s1,8(sp)
ffffffffc02051da:	6105                	addi	sp,sp,32
ffffffffc02051dc:	8082                	ret
ffffffffc02051de:	6442                	ld	s0,16(sp)
ffffffffc02051e0:	60e2                	ld	ra,24(sp)
ffffffffc02051e2:	64a2                	ld	s1,8(sp)
ffffffffc02051e4:	6105                	addi	sp,sp,32
        intr_enable();
ffffffffc02051e6:	fc8fb06f          	j	ffffffffc02009ae <intr_enable>
            warn("wakeup runnable process.\n");
ffffffffc02051ea:	00002617          	auipc	a2,0x2
ffffffffc02051ee:	67660613          	addi	a2,a2,1654 # ffffffffc0207860 <default_pmm_manager+0x1198>
ffffffffc02051f2:	45d1                	li	a1,20
ffffffffc02051f4:	00002517          	auipc	a0,0x2
ffffffffc02051f8:	65450513          	addi	a0,a0,1620 # ffffffffc0207848 <default_pmm_manager+0x1180>
ffffffffc02051fc:	afafb0ef          	jal	ra,ffffffffc02004f6 <__warn>
ffffffffc0205200:	bfc9                	j	ffffffffc02051d2 <wakeup_proc+0x28>
        intr_disable();
ffffffffc0205202:	fb2fb0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        if (proc->state != PROC_RUNNABLE)
ffffffffc0205206:	4018                	lw	a4,0(s0)
        return 1;
ffffffffc0205208:	4485                	li	s1,1
ffffffffc020520a:	bf75                	j	ffffffffc02051c6 <wakeup_proc+0x1c>
    assert(proc->state != PROC_ZOMBIE);
ffffffffc020520c:	00002697          	auipc	a3,0x2
ffffffffc0205210:	61c68693          	addi	a3,a3,1564 # ffffffffc0207828 <default_pmm_manager+0x1160>
ffffffffc0205214:	00001617          	auipc	a2,0x1
ffffffffc0205218:	10460613          	addi	a2,a2,260 # ffffffffc0206318 <commands+0x818>
ffffffffc020521c:	45a5                	li	a1,9
ffffffffc020521e:	00002517          	auipc	a0,0x2
ffffffffc0205222:	62a50513          	addi	a0,a0,1578 # ffffffffc0207848 <default_pmm_manager+0x1180>
ffffffffc0205226:	a68fb0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc020522a <schedule>:

void schedule(void)
{
ffffffffc020522a:	1101                	addi	sp,sp,-32
ffffffffc020522c:	ec06                	sd	ra,24(sp)
ffffffffc020522e:	e822                	sd	s0,16(sp)
ffffffffc0205230:	e426                	sd	s1,8(sp)
ffffffffc0205232:	e04a                	sd	s2,0(sp)
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0205234:	100027f3          	csrr	a5,sstatus
ffffffffc0205238:	8b89                	andi	a5,a5,2
ffffffffc020523a:	4481                	li	s1,0
ffffffffc020523c:	e7c5                	bnez	a5,ffffffffc02052e4 <schedule+0xba>
    bool intr_flag;
    list_entry_t *le, *last;
    struct proc_struct *next = NULL;
    local_intr_save(intr_flag);
    {
        current->need_resched = 0;
ffffffffc020523e:	000a5917          	auipc	s2,0xa5
ffffffffc0205242:	4da90913          	addi	s2,s2,1242 # ffffffffc02aa718 <current>
ffffffffc0205246:	00093583          	ld	a1,0(s2)
        last = (current == idleproc) ? &proc_list : &(current->list_link);
ffffffffc020524a:	000a5417          	auipc	s0,0xa5
ffffffffc020524e:	4d643403          	ld	s0,1238(s0) # ffffffffc02aa720 <idleproc>
        current->need_resched = 0;
ffffffffc0205252:	0005bc23          	sd	zero,24(a1)
        last = (current == idleproc) ? &proc_list : &(current->list_link);
ffffffffc0205256:	08858163          	beq	a1,s0,ffffffffc02052d8 <schedule+0xae>
ffffffffc020525a:	0c858693          	addi	a3,a1,200
ffffffffc020525e:	000a5617          	auipc	a2,0xa5
ffffffffc0205262:	44a60613          	addi	a2,a2,1098 # ffffffffc02aa6a8 <proc_list>
        le = last;
ffffffffc0205266:	87b6                	mv	a5,a3
    struct proc_struct *next = NULL;
ffffffffc0205268:	4501                	li	a0,0
        do
        {
            if ((le = list_next(le)) != &proc_list)
            {
                next = le2proc(le, list_link);
                if (next->state == PROC_RUNNABLE)
ffffffffc020526a:	4809                	li	a6,2
ffffffffc020526c:	679c                	ld	a5,8(a5)
            if ((le = list_next(le)) != &proc_list)
ffffffffc020526e:	00c78863          	beq	a5,a2,ffffffffc020527e <schedule+0x54>
                if (next->state == PROC_RUNNABLE)
ffffffffc0205272:	f387a703          	lw	a4,-200(a5)
                next = le2proc(le, list_link);
ffffffffc0205276:	f3878513          	addi	a0,a5,-200
                if (next->state == PROC_RUNNABLE)
ffffffffc020527a:	05070263          	beq	a4,a6,ffffffffc02052be <schedule+0x94>
                {
                    break;
                }
            }
        } while (le != last);
ffffffffc020527e:	fef697e3          	bne	a3,a5,ffffffffc020526c <schedule+0x42>
        if (next == NULL || next->state != PROC_RUNNABLE)
ffffffffc0205282:	ed15                	bnez	a0,ffffffffc02052be <schedule+0x94>
        {
            next = idleproc;
        }
        next->runs++;
ffffffffc0205284:	441c                	lw	a5,8(s0)
        cprintf("schedule: current = %s(%d), next = %s(%d)\n", current->name, current->pid, next->name, next->pid);
ffffffffc0205286:	41d0                	lw	a2,4(a1)
ffffffffc0205288:	4058                	lw	a4,4(s0)
        next->runs++;
ffffffffc020528a:	2785                	addiw	a5,a5,1
ffffffffc020528c:	c41c                	sw	a5,8(s0)
        cprintf("schedule: current = %s(%d), next = %s(%d)\n", current->name, current->pid, next->name, next->pid);
ffffffffc020528e:	0b440693          	addi	a3,s0,180
ffffffffc0205292:	0b458593          	addi	a1,a1,180
ffffffffc0205296:	00002517          	auipc	a0,0x2
ffffffffc020529a:	5ea50513          	addi	a0,a0,1514 # ffffffffc0207880 <default_pmm_manager+0x11b8>
ffffffffc020529e:	ef7fa0ef          	jal	ra,ffffffffc0200194 <cprintf>
	if (next != current)
ffffffffc02052a2:	00093783          	ld	a5,0(s2)
ffffffffc02052a6:	00878563          	beq	a5,s0,ffffffffc02052b0 <schedule+0x86>
        {
            proc_run(next);
ffffffffc02052aa:	8522                	mv	a0,s0
ffffffffc02052ac:	c99fe0ef          	jal	ra,ffffffffc0203f44 <proc_run>
    if (flag)
ffffffffc02052b0:	ec89                	bnez	s1,ffffffffc02052ca <schedule+0xa0>
        }
    }
    local_intr_restore(intr_flag);
}
ffffffffc02052b2:	60e2                	ld	ra,24(sp)
ffffffffc02052b4:	6442                	ld	s0,16(sp)
ffffffffc02052b6:	64a2                	ld	s1,8(sp)
ffffffffc02052b8:	6902                	ld	s2,0(sp)
ffffffffc02052ba:	6105                	addi	sp,sp,32
ffffffffc02052bc:	8082                	ret
        if (next == NULL || next->state != PROC_RUNNABLE)
ffffffffc02052be:	4118                	lw	a4,0(a0)
ffffffffc02052c0:	4789                	li	a5,2
ffffffffc02052c2:	fcf711e3          	bne	a4,a5,ffffffffc0205284 <schedule+0x5a>
ffffffffc02052c6:	842a                	mv	s0,a0
ffffffffc02052c8:	bf75                	j	ffffffffc0205284 <schedule+0x5a>
}
ffffffffc02052ca:	6442                	ld	s0,16(sp)
ffffffffc02052cc:	60e2                	ld	ra,24(sp)
ffffffffc02052ce:	64a2                	ld	s1,8(sp)
ffffffffc02052d0:	6902                	ld	s2,0(sp)
ffffffffc02052d2:	6105                	addi	sp,sp,32
        intr_enable();
ffffffffc02052d4:	edafb06f          	j	ffffffffc02009ae <intr_enable>
        last = (current == idleproc) ? &proc_list : &(current->list_link);
ffffffffc02052d8:	000a5617          	auipc	a2,0xa5
ffffffffc02052dc:	3d060613          	addi	a2,a2,976 # ffffffffc02aa6a8 <proc_list>
ffffffffc02052e0:	86b2                	mv	a3,a2
ffffffffc02052e2:	b751                	j	ffffffffc0205266 <schedule+0x3c>
        intr_disable();
ffffffffc02052e4:	ed0fb0ef          	jal	ra,ffffffffc02009b4 <intr_disable>
        return 1;
ffffffffc02052e8:	4485                	li	s1,1
ffffffffc02052ea:	bf91                	j	ffffffffc020523e <schedule+0x14>

ffffffffc02052ec <sys_getpid>:
    return do_kill(pid);
}

static int
sys_getpid(uint64_t arg[]) {
    return current->pid;
ffffffffc02052ec:	000a5797          	auipc	a5,0xa5
ffffffffc02052f0:	42c7b783          	ld	a5,1068(a5) # ffffffffc02aa718 <current>
}
ffffffffc02052f4:	43c8                	lw	a0,4(a5)
ffffffffc02052f6:	8082                	ret

ffffffffc02052f8 <sys_pgdir>:

static int
sys_pgdir(uint64_t arg[]) {
    //print_pgdir();
    return 0;
}
ffffffffc02052f8:	4501                	li	a0,0
ffffffffc02052fa:	8082                	ret

ffffffffc02052fc <sys_putc>:
    cputchar(c);
ffffffffc02052fc:	4108                	lw	a0,0(a0)
sys_putc(uint64_t arg[]) {
ffffffffc02052fe:	1141                	addi	sp,sp,-16
ffffffffc0205300:	e406                	sd	ra,8(sp)
    cputchar(c);
ffffffffc0205302:	ec9fa0ef          	jal	ra,ffffffffc02001ca <cputchar>
}
ffffffffc0205306:	60a2                	ld	ra,8(sp)
ffffffffc0205308:	4501                	li	a0,0
ffffffffc020530a:	0141                	addi	sp,sp,16
ffffffffc020530c:	8082                	ret

ffffffffc020530e <sys_kill>:
    return do_kill(pid);
ffffffffc020530e:	4108                	lw	a0,0(a0)
ffffffffc0205310:	bbbff06f          	j	ffffffffc0204eca <do_kill>

ffffffffc0205314 <sys_yield>:
    return do_yield();
ffffffffc0205314:	b69ff06f          	j	ffffffffc0204e7c <do_yield>

ffffffffc0205318 <sys_exec>:
    return do_execve(name, len, binary, size);
ffffffffc0205318:	6d14                	ld	a3,24(a0)
ffffffffc020531a:	6910                	ld	a2,16(a0)
ffffffffc020531c:	650c                	ld	a1,8(a0)
ffffffffc020531e:	6108                	ld	a0,0(a0)
ffffffffc0205320:	e48ff06f          	j	ffffffffc0204968 <do_execve>

ffffffffc0205324 <sys_wait>:
    return do_wait(pid, store);
ffffffffc0205324:	650c                	ld	a1,8(a0)
ffffffffc0205326:	4108                	lw	a0,0(a0)
ffffffffc0205328:	b65ff06f          	j	ffffffffc0204e8c <do_wait>

ffffffffc020532c <sys_fork>:
    struct trapframe *tf = current->tf;
ffffffffc020532c:	000a5797          	auipc	a5,0xa5
ffffffffc0205330:	3ec7b783          	ld	a5,1004(a5) # ffffffffc02aa718 <current>
ffffffffc0205334:	73d0                	ld	a2,160(a5)
    return do_fork(0, stack, tf);
ffffffffc0205336:	4501                	li	a0,0
ffffffffc0205338:	6a0c                	ld	a1,16(a2)
ffffffffc020533a:	cb1fe06f          	j	ffffffffc0203fea <do_fork>

ffffffffc020533e <sys_exit>:
    return do_exit(error_code);
ffffffffc020533e:	4108                	lw	a0,0(a0)
ffffffffc0205340:	922ff06f          	j	ffffffffc0204462 <do_exit>

ffffffffc0205344 <syscall>:
};

#define NUM_SYSCALLS        ((sizeof(syscalls)) / (sizeof(syscalls[0])))

void
syscall(void) {
ffffffffc0205344:	715d                	addi	sp,sp,-80
ffffffffc0205346:	fc26                	sd	s1,56(sp)
    struct trapframe *tf = current->tf;
ffffffffc0205348:	000a5497          	auipc	s1,0xa5
ffffffffc020534c:	3d048493          	addi	s1,s1,976 # ffffffffc02aa718 <current>
ffffffffc0205350:	6098                	ld	a4,0(s1)
syscall(void) {
ffffffffc0205352:	e0a2                	sd	s0,64(sp)
ffffffffc0205354:	f84a                	sd	s2,48(sp)
    struct trapframe *tf = current->tf;
ffffffffc0205356:	7340                	ld	s0,160(a4)
syscall(void) {
ffffffffc0205358:	e486                	sd	ra,72(sp)
    uint64_t arg[5];
    int num = tf->gpr.a0;
    if (num >= 0 && num < NUM_SYSCALLS) {
ffffffffc020535a:	47fd                	li	a5,31
    int num = tf->gpr.a0;
ffffffffc020535c:	05042903          	lw	s2,80(s0)
    if (num >= 0 && num < NUM_SYSCALLS) {
ffffffffc0205360:	0327ee63          	bltu	a5,s2,ffffffffc020539c <syscall+0x58>
        if (syscalls[num] != NULL) {
ffffffffc0205364:	00391713          	slli	a4,s2,0x3
ffffffffc0205368:	00002797          	auipc	a5,0x2
ffffffffc020536c:	59078793          	addi	a5,a5,1424 # ffffffffc02078f8 <syscalls>
ffffffffc0205370:	97ba                	add	a5,a5,a4
ffffffffc0205372:	639c                	ld	a5,0(a5)
ffffffffc0205374:	c785                	beqz	a5,ffffffffc020539c <syscall+0x58>
            arg[0] = tf->gpr.a1;
ffffffffc0205376:	6c28                	ld	a0,88(s0)
            arg[1] = tf->gpr.a2;
ffffffffc0205378:	702c                	ld	a1,96(s0)
            arg[2] = tf->gpr.a3;
ffffffffc020537a:	7430                	ld	a2,104(s0)
            arg[3] = tf->gpr.a4;
ffffffffc020537c:	7834                	ld	a3,112(s0)
            arg[4] = tf->gpr.a5;
ffffffffc020537e:	7c38                	ld	a4,120(s0)
            arg[0] = tf->gpr.a1;
ffffffffc0205380:	e42a                	sd	a0,8(sp)
            arg[1] = tf->gpr.a2;
ffffffffc0205382:	e82e                	sd	a1,16(sp)
            arg[2] = tf->gpr.a3;
ffffffffc0205384:	ec32                	sd	a2,24(sp)
            arg[3] = tf->gpr.a4;
ffffffffc0205386:	f036                	sd	a3,32(sp)
            arg[4] = tf->gpr.a5;
ffffffffc0205388:	f43a                	sd	a4,40(sp)
            tf->gpr.a0 = syscalls[num](arg);
ffffffffc020538a:	0028                	addi	a0,sp,8
ffffffffc020538c:	9782                	jalr	a5
        }
    }
    print_trapframe(tf);
    panic("undefined syscall %d, pid = %d, name = %s.\n",
            num, current->pid, current->name);
}
ffffffffc020538e:	60a6                	ld	ra,72(sp)
            tf->gpr.a0 = syscalls[num](arg);
ffffffffc0205390:	e828                	sd	a0,80(s0)
}
ffffffffc0205392:	6406                	ld	s0,64(sp)
ffffffffc0205394:	74e2                	ld	s1,56(sp)
ffffffffc0205396:	7942                	ld	s2,48(sp)
ffffffffc0205398:	6161                	addi	sp,sp,80
ffffffffc020539a:	8082                	ret
    print_trapframe(tf);
ffffffffc020539c:	8522                	mv	a0,s0
ffffffffc020539e:	807fb0ef          	jal	ra,ffffffffc0200ba4 <print_trapframe>
    panic("undefined syscall %d, pid = %d, name = %s.\n",
ffffffffc02053a2:	609c                	ld	a5,0(s1)
ffffffffc02053a4:	86ca                	mv	a3,s2
ffffffffc02053a6:	00002617          	auipc	a2,0x2
ffffffffc02053aa:	50a60613          	addi	a2,a2,1290 # ffffffffc02078b0 <default_pmm_manager+0x11e8>
ffffffffc02053ae:	43d8                	lw	a4,4(a5)
ffffffffc02053b0:	06200593          	li	a1,98
ffffffffc02053b4:	0b478793          	addi	a5,a5,180
ffffffffc02053b8:	00002517          	auipc	a0,0x2
ffffffffc02053bc:	52850513          	addi	a0,a0,1320 # ffffffffc02078e0 <default_pmm_manager+0x1218>
ffffffffc02053c0:	8cefb0ef          	jal	ra,ffffffffc020048e <__panic>

ffffffffc02053c4 <hash32>:
 *
 * High bits are more random, so we use them.
 * */
uint32_t
hash32(uint32_t val, unsigned int bits) {
    uint32_t hash = val * GOLDEN_RATIO_PRIME_32;
ffffffffc02053c4:	9e3707b7          	lui	a5,0x9e370
ffffffffc02053c8:	2785                	addiw	a5,a5,1
ffffffffc02053ca:	02a7853b          	mulw	a0,a5,a0
    return (hash >> (32 - bits));
ffffffffc02053ce:	02000793          	li	a5,32
ffffffffc02053d2:	9f8d                	subw	a5,a5,a1
}
ffffffffc02053d4:	00f5553b          	srlw	a0,a0,a5
ffffffffc02053d8:	8082                	ret

ffffffffc02053da <printnum>:
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
    unsigned long long result = num;
    unsigned mod = do_div(result, base);
ffffffffc02053da:	02069813          	slli	a6,a3,0x20
        unsigned long long num, unsigned base, int width, int padc) {
ffffffffc02053de:	7179                	addi	sp,sp,-48
    unsigned mod = do_div(result, base);
ffffffffc02053e0:	02085813          	srli	a6,a6,0x20
        unsigned long long num, unsigned base, int width, int padc) {
ffffffffc02053e4:	e052                	sd	s4,0(sp)
    unsigned mod = do_div(result, base);
ffffffffc02053e6:	03067a33          	remu	s4,a2,a6
        unsigned long long num, unsigned base, int width, int padc) {
ffffffffc02053ea:	f022                	sd	s0,32(sp)
ffffffffc02053ec:	ec26                	sd	s1,24(sp)
ffffffffc02053ee:	e84a                	sd	s2,16(sp)
ffffffffc02053f0:	f406                	sd	ra,40(sp)
ffffffffc02053f2:	e44e                	sd	s3,8(sp)
ffffffffc02053f4:	84aa                	mv	s1,a0
ffffffffc02053f6:	892e                	mv	s2,a1
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
ffffffffc02053f8:	fff7041b          	addiw	s0,a4,-1
    unsigned mod = do_div(result, base);
ffffffffc02053fc:	2a01                	sext.w	s4,s4
    if (num >= base) {
ffffffffc02053fe:	03067e63          	bgeu	a2,a6,ffffffffc020543a <printnum+0x60>
ffffffffc0205402:	89be                	mv	s3,a5
        while (-- width > 0)
ffffffffc0205404:	00805763          	blez	s0,ffffffffc0205412 <printnum+0x38>
ffffffffc0205408:	347d                	addiw	s0,s0,-1
            putch(padc, putdat);
ffffffffc020540a:	85ca                	mv	a1,s2
ffffffffc020540c:	854e                	mv	a0,s3
ffffffffc020540e:	9482                	jalr	s1
        while (-- width > 0)
ffffffffc0205410:	fc65                	bnez	s0,ffffffffc0205408 <printnum+0x2e>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
ffffffffc0205412:	1a02                	slli	s4,s4,0x20
ffffffffc0205414:	00002797          	auipc	a5,0x2
ffffffffc0205418:	5e478793          	addi	a5,a5,1508 # ffffffffc02079f8 <syscalls+0x100>
ffffffffc020541c:	020a5a13          	srli	s4,s4,0x20
ffffffffc0205420:	9a3e                	add	s4,s4,a5
    // Crashes if num >= base. No idea what going on here
    // Here is a quick fix
    // update: Stack grows downward and destory the SBI
    // sbi_console_putchar("0123456789abcdef"[mod]);
    // (*(int *)putdat)++;
}
ffffffffc0205422:	7402                	ld	s0,32(sp)
    putch("0123456789abcdef"[mod], putdat);
ffffffffc0205424:	000a4503          	lbu	a0,0(s4)
}
ffffffffc0205428:	70a2                	ld	ra,40(sp)
ffffffffc020542a:	69a2                	ld	s3,8(sp)
ffffffffc020542c:	6a02                	ld	s4,0(sp)
    putch("0123456789abcdef"[mod], putdat);
ffffffffc020542e:	85ca                	mv	a1,s2
ffffffffc0205430:	87a6                	mv	a5,s1
}
ffffffffc0205432:	6942                	ld	s2,16(sp)
ffffffffc0205434:	64e2                	ld	s1,24(sp)
ffffffffc0205436:	6145                	addi	sp,sp,48
    putch("0123456789abcdef"[mod], putdat);
ffffffffc0205438:	8782                	jr	a5
        printnum(putch, putdat, result, base, width - 1, padc);
ffffffffc020543a:	03065633          	divu	a2,a2,a6
ffffffffc020543e:	8722                	mv	a4,s0
ffffffffc0205440:	f9bff0ef          	jal	ra,ffffffffc02053da <printnum>
ffffffffc0205444:	b7f9                	j	ffffffffc0205412 <printnum+0x38>

ffffffffc0205446 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
ffffffffc0205446:	7119                	addi	sp,sp,-128
ffffffffc0205448:	f4a6                	sd	s1,104(sp)
ffffffffc020544a:	f0ca                	sd	s2,96(sp)
ffffffffc020544c:	ecce                	sd	s3,88(sp)
ffffffffc020544e:	e8d2                	sd	s4,80(sp)
ffffffffc0205450:	e4d6                	sd	s5,72(sp)
ffffffffc0205452:	e0da                	sd	s6,64(sp)
ffffffffc0205454:	fc5e                	sd	s7,56(sp)
ffffffffc0205456:	f06a                	sd	s10,32(sp)
ffffffffc0205458:	fc86                	sd	ra,120(sp)
ffffffffc020545a:	f8a2                	sd	s0,112(sp)
ffffffffc020545c:	f862                	sd	s8,48(sp)
ffffffffc020545e:	f466                	sd	s9,40(sp)
ffffffffc0205460:	ec6e                	sd	s11,24(sp)
ffffffffc0205462:	892a                	mv	s2,a0
ffffffffc0205464:	84ae                	mv	s1,a1
ffffffffc0205466:	8d32                	mv	s10,a2
ffffffffc0205468:	8a36                	mv	s4,a3
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc020546a:	02500993          	li	s3,37
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
        width = precision = -1;
ffffffffc020546e:	5b7d                	li	s6,-1
ffffffffc0205470:	00002a97          	auipc	s5,0x2
ffffffffc0205474:	5b4a8a93          	addi	s5,s5,1460 # ffffffffc0207a24 <syscalls+0x12c>
        case 'e':
            err = va_arg(ap, int);
            if (err < 0) {
                err = -err;
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
ffffffffc0205478:	00002b97          	auipc	s7,0x2
ffffffffc020547c:	7c8b8b93          	addi	s7,s7,1992 # ffffffffc0207c40 <error_string>
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc0205480:	000d4503          	lbu	a0,0(s10)
ffffffffc0205484:	001d0413          	addi	s0,s10,1
ffffffffc0205488:	01350a63          	beq	a0,s3,ffffffffc020549c <vprintfmt+0x56>
            if (ch == '\0') {
ffffffffc020548c:	c121                	beqz	a0,ffffffffc02054cc <vprintfmt+0x86>
            putch(ch, putdat);
ffffffffc020548e:	85a6                	mv	a1,s1
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc0205490:	0405                	addi	s0,s0,1
            putch(ch, putdat);
ffffffffc0205492:	9902                	jalr	s2
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc0205494:	fff44503          	lbu	a0,-1(s0)
ffffffffc0205498:	ff351ae3          	bne	a0,s3,ffffffffc020548c <vprintfmt+0x46>
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc020549c:	00044603          	lbu	a2,0(s0)
        char padc = ' ';
ffffffffc02054a0:	02000793          	li	a5,32
        lflag = altflag = 0;
ffffffffc02054a4:	4c81                	li	s9,0
ffffffffc02054a6:	4881                	li	a7,0
        width = precision = -1;
ffffffffc02054a8:	5c7d                	li	s8,-1
ffffffffc02054aa:	5dfd                	li	s11,-1
ffffffffc02054ac:	05500513          	li	a0,85
                if (ch < '0' || ch > '9') {
ffffffffc02054b0:	4825                	li	a6,9
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02054b2:	fdd6059b          	addiw	a1,a2,-35
ffffffffc02054b6:	0ff5f593          	zext.b	a1,a1
ffffffffc02054ba:	00140d13          	addi	s10,s0,1
ffffffffc02054be:	04b56263          	bltu	a0,a1,ffffffffc0205502 <vprintfmt+0xbc>
ffffffffc02054c2:	058a                	slli	a1,a1,0x2
ffffffffc02054c4:	95d6                	add	a1,a1,s5
ffffffffc02054c6:	4194                	lw	a3,0(a1)
ffffffffc02054c8:	96d6                	add	a3,a3,s5
ffffffffc02054ca:	8682                	jr	a3
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
ffffffffc02054cc:	70e6                	ld	ra,120(sp)
ffffffffc02054ce:	7446                	ld	s0,112(sp)
ffffffffc02054d0:	74a6                	ld	s1,104(sp)
ffffffffc02054d2:	7906                	ld	s2,96(sp)
ffffffffc02054d4:	69e6                	ld	s3,88(sp)
ffffffffc02054d6:	6a46                	ld	s4,80(sp)
ffffffffc02054d8:	6aa6                	ld	s5,72(sp)
ffffffffc02054da:	6b06                	ld	s6,64(sp)
ffffffffc02054dc:	7be2                	ld	s7,56(sp)
ffffffffc02054de:	7c42                	ld	s8,48(sp)
ffffffffc02054e0:	7ca2                	ld	s9,40(sp)
ffffffffc02054e2:	7d02                	ld	s10,32(sp)
ffffffffc02054e4:	6de2                	ld	s11,24(sp)
ffffffffc02054e6:	6109                	addi	sp,sp,128
ffffffffc02054e8:	8082                	ret
            padc = '0';
ffffffffc02054ea:	87b2                	mv	a5,a2
            goto reswitch;
ffffffffc02054ec:	00144603          	lbu	a2,1(s0)
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02054f0:	846a                	mv	s0,s10
ffffffffc02054f2:	00140d13          	addi	s10,s0,1
ffffffffc02054f6:	fdd6059b          	addiw	a1,a2,-35
ffffffffc02054fa:	0ff5f593          	zext.b	a1,a1
ffffffffc02054fe:	fcb572e3          	bgeu	a0,a1,ffffffffc02054c2 <vprintfmt+0x7c>
            putch('%', putdat);
ffffffffc0205502:	85a6                	mv	a1,s1
ffffffffc0205504:	02500513          	li	a0,37
ffffffffc0205508:	9902                	jalr	s2
            for (fmt --; fmt[-1] != '%'; fmt --)
ffffffffc020550a:	fff44783          	lbu	a5,-1(s0)
ffffffffc020550e:	8d22                	mv	s10,s0
ffffffffc0205510:	f73788e3          	beq	a5,s3,ffffffffc0205480 <vprintfmt+0x3a>
ffffffffc0205514:	ffed4783          	lbu	a5,-2(s10)
ffffffffc0205518:	1d7d                	addi	s10,s10,-1
ffffffffc020551a:	ff379de3          	bne	a5,s3,ffffffffc0205514 <vprintfmt+0xce>
ffffffffc020551e:	b78d                	j	ffffffffc0205480 <vprintfmt+0x3a>
                precision = precision * 10 + ch - '0';
ffffffffc0205520:	fd060c1b          	addiw	s8,a2,-48
                ch = *fmt;
ffffffffc0205524:	00144603          	lbu	a2,1(s0)
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0205528:	846a                	mv	s0,s10
                if (ch < '0' || ch > '9') {
ffffffffc020552a:	fd06069b          	addiw	a3,a2,-48
                ch = *fmt;
ffffffffc020552e:	0006059b          	sext.w	a1,a2
                if (ch < '0' || ch > '9') {
ffffffffc0205532:	02d86463          	bltu	a6,a3,ffffffffc020555a <vprintfmt+0x114>
                ch = *fmt;
ffffffffc0205536:	00144603          	lbu	a2,1(s0)
                precision = precision * 10 + ch - '0';
ffffffffc020553a:	002c169b          	slliw	a3,s8,0x2
ffffffffc020553e:	0186873b          	addw	a4,a3,s8
ffffffffc0205542:	0017171b          	slliw	a4,a4,0x1
ffffffffc0205546:	9f2d                	addw	a4,a4,a1
                if (ch < '0' || ch > '9') {
ffffffffc0205548:	fd06069b          	addiw	a3,a2,-48
            for (precision = 0; ; ++ fmt) {
ffffffffc020554c:	0405                	addi	s0,s0,1
                precision = precision * 10 + ch - '0';
ffffffffc020554e:	fd070c1b          	addiw	s8,a4,-48
                ch = *fmt;
ffffffffc0205552:	0006059b          	sext.w	a1,a2
                if (ch < '0' || ch > '9') {
ffffffffc0205556:	fed870e3          	bgeu	a6,a3,ffffffffc0205536 <vprintfmt+0xf0>
            if (width < 0)
ffffffffc020555a:	f40ddce3          	bgez	s11,ffffffffc02054b2 <vprintfmt+0x6c>
                width = precision, precision = -1;
ffffffffc020555e:	8de2                	mv	s11,s8
ffffffffc0205560:	5c7d                	li	s8,-1
ffffffffc0205562:	bf81                	j	ffffffffc02054b2 <vprintfmt+0x6c>
            if (width < 0)
ffffffffc0205564:	fffdc693          	not	a3,s11
ffffffffc0205568:	96fd                	srai	a3,a3,0x3f
ffffffffc020556a:	00ddfdb3          	and	s11,s11,a3
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc020556e:	00144603          	lbu	a2,1(s0)
ffffffffc0205572:	2d81                	sext.w	s11,s11
ffffffffc0205574:	846a                	mv	s0,s10
            goto reswitch;
ffffffffc0205576:	bf35                	j	ffffffffc02054b2 <vprintfmt+0x6c>
            precision = va_arg(ap, int);
ffffffffc0205578:	000a2c03          	lw	s8,0(s4)
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc020557c:	00144603          	lbu	a2,1(s0)
            precision = va_arg(ap, int);
ffffffffc0205580:	0a21                	addi	s4,s4,8
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0205582:	846a                	mv	s0,s10
            goto process_precision;
ffffffffc0205584:	bfd9                	j	ffffffffc020555a <vprintfmt+0x114>
    if (lflag >= 2) {
ffffffffc0205586:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc0205588:	008a0593          	addi	a1,s4,8
    if (lflag >= 2) {
ffffffffc020558c:	01174463          	blt	a4,a7,ffffffffc0205594 <vprintfmt+0x14e>
    else if (lflag) {
ffffffffc0205590:	1a088e63          	beqz	a7,ffffffffc020574c <vprintfmt+0x306>
        return va_arg(*ap, unsigned long);
ffffffffc0205594:	000a3603          	ld	a2,0(s4)
ffffffffc0205598:	46c1                	li	a3,16
ffffffffc020559a:	8a2e                	mv	s4,a1
            printnum(putch, putdat, num, base, width, padc);
ffffffffc020559c:	2781                	sext.w	a5,a5
ffffffffc020559e:	876e                	mv	a4,s11
ffffffffc02055a0:	85a6                	mv	a1,s1
ffffffffc02055a2:	854a                	mv	a0,s2
ffffffffc02055a4:	e37ff0ef          	jal	ra,ffffffffc02053da <printnum>
            break;
ffffffffc02055a8:	bde1                	j	ffffffffc0205480 <vprintfmt+0x3a>
            putch(va_arg(ap, int), putdat);
ffffffffc02055aa:	000a2503          	lw	a0,0(s4)
ffffffffc02055ae:	85a6                	mv	a1,s1
ffffffffc02055b0:	0a21                	addi	s4,s4,8
ffffffffc02055b2:	9902                	jalr	s2
            break;
ffffffffc02055b4:	b5f1                	j	ffffffffc0205480 <vprintfmt+0x3a>
    if (lflag >= 2) {
ffffffffc02055b6:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc02055b8:	008a0593          	addi	a1,s4,8
    if (lflag >= 2) {
ffffffffc02055bc:	01174463          	blt	a4,a7,ffffffffc02055c4 <vprintfmt+0x17e>
    else if (lflag) {
ffffffffc02055c0:	18088163          	beqz	a7,ffffffffc0205742 <vprintfmt+0x2fc>
        return va_arg(*ap, unsigned long);
ffffffffc02055c4:	000a3603          	ld	a2,0(s4)
ffffffffc02055c8:	46a9                	li	a3,10
ffffffffc02055ca:	8a2e                	mv	s4,a1
ffffffffc02055cc:	bfc1                	j	ffffffffc020559c <vprintfmt+0x156>
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02055ce:	00144603          	lbu	a2,1(s0)
            altflag = 1;
ffffffffc02055d2:	4c85                	li	s9,1
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02055d4:	846a                	mv	s0,s10
            goto reswitch;
ffffffffc02055d6:	bdf1                	j	ffffffffc02054b2 <vprintfmt+0x6c>
            putch(ch, putdat);
ffffffffc02055d8:	85a6                	mv	a1,s1
ffffffffc02055da:	02500513          	li	a0,37
ffffffffc02055de:	9902                	jalr	s2
            break;
ffffffffc02055e0:	b545                	j	ffffffffc0205480 <vprintfmt+0x3a>
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02055e2:	00144603          	lbu	a2,1(s0)
            lflag ++;
ffffffffc02055e6:	2885                	addiw	a7,a7,1
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02055e8:	846a                	mv	s0,s10
            goto reswitch;
ffffffffc02055ea:	b5e1                	j	ffffffffc02054b2 <vprintfmt+0x6c>
    if (lflag >= 2) {
ffffffffc02055ec:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc02055ee:	008a0593          	addi	a1,s4,8
    if (lflag >= 2) {
ffffffffc02055f2:	01174463          	blt	a4,a7,ffffffffc02055fa <vprintfmt+0x1b4>
    else if (lflag) {
ffffffffc02055f6:	14088163          	beqz	a7,ffffffffc0205738 <vprintfmt+0x2f2>
        return va_arg(*ap, unsigned long);
ffffffffc02055fa:	000a3603          	ld	a2,0(s4)
ffffffffc02055fe:	46a1                	li	a3,8
ffffffffc0205600:	8a2e                	mv	s4,a1
ffffffffc0205602:	bf69                	j	ffffffffc020559c <vprintfmt+0x156>
            putch('0', putdat);
ffffffffc0205604:	03000513          	li	a0,48
ffffffffc0205608:	85a6                	mv	a1,s1
ffffffffc020560a:	e03e                	sd	a5,0(sp)
ffffffffc020560c:	9902                	jalr	s2
            putch('x', putdat);
ffffffffc020560e:	85a6                	mv	a1,s1
ffffffffc0205610:	07800513          	li	a0,120
ffffffffc0205614:	9902                	jalr	s2
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
ffffffffc0205616:	0a21                	addi	s4,s4,8
            goto number;
ffffffffc0205618:	6782                	ld	a5,0(sp)
ffffffffc020561a:	46c1                	li	a3,16
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
ffffffffc020561c:	ff8a3603          	ld	a2,-8(s4)
            goto number;
ffffffffc0205620:	bfb5                	j	ffffffffc020559c <vprintfmt+0x156>
            if ((p = va_arg(ap, char *)) == NULL) {
ffffffffc0205622:	000a3403          	ld	s0,0(s4)
ffffffffc0205626:	008a0713          	addi	a4,s4,8
ffffffffc020562a:	e03a                	sd	a4,0(sp)
ffffffffc020562c:	14040263          	beqz	s0,ffffffffc0205770 <vprintfmt+0x32a>
            if (width > 0 && padc != '-') {
ffffffffc0205630:	0fb05763          	blez	s11,ffffffffc020571e <vprintfmt+0x2d8>
ffffffffc0205634:	02d00693          	li	a3,45
ffffffffc0205638:	0cd79163          	bne	a5,a3,ffffffffc02056fa <vprintfmt+0x2b4>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc020563c:	00044783          	lbu	a5,0(s0)
ffffffffc0205640:	0007851b          	sext.w	a0,a5
ffffffffc0205644:	cf85                	beqz	a5,ffffffffc020567c <vprintfmt+0x236>
ffffffffc0205646:	00140a13          	addi	s4,s0,1
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc020564a:	05e00413          	li	s0,94
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc020564e:	000c4563          	bltz	s8,ffffffffc0205658 <vprintfmt+0x212>
ffffffffc0205652:	3c7d                	addiw	s8,s8,-1
ffffffffc0205654:	036c0263          	beq	s8,s6,ffffffffc0205678 <vprintfmt+0x232>
                    putch('?', putdat);
ffffffffc0205658:	85a6                	mv	a1,s1
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc020565a:	0e0c8e63          	beqz	s9,ffffffffc0205756 <vprintfmt+0x310>
ffffffffc020565e:	3781                	addiw	a5,a5,-32
ffffffffc0205660:	0ef47b63          	bgeu	s0,a5,ffffffffc0205756 <vprintfmt+0x310>
                    putch('?', putdat);
ffffffffc0205664:	03f00513          	li	a0,63
ffffffffc0205668:	9902                	jalr	s2
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc020566a:	000a4783          	lbu	a5,0(s4)
ffffffffc020566e:	3dfd                	addiw	s11,s11,-1
ffffffffc0205670:	0a05                	addi	s4,s4,1
ffffffffc0205672:	0007851b          	sext.w	a0,a5
ffffffffc0205676:	ffe1                	bnez	a5,ffffffffc020564e <vprintfmt+0x208>
            for (; width > 0; width --) {
ffffffffc0205678:	01b05963          	blez	s11,ffffffffc020568a <vprintfmt+0x244>
ffffffffc020567c:	3dfd                	addiw	s11,s11,-1
                putch(' ', putdat);
ffffffffc020567e:	85a6                	mv	a1,s1
ffffffffc0205680:	02000513          	li	a0,32
ffffffffc0205684:	9902                	jalr	s2
            for (; width > 0; width --) {
ffffffffc0205686:	fe0d9be3          	bnez	s11,ffffffffc020567c <vprintfmt+0x236>
            if ((p = va_arg(ap, char *)) == NULL) {
ffffffffc020568a:	6a02                	ld	s4,0(sp)
ffffffffc020568c:	bbd5                	j	ffffffffc0205480 <vprintfmt+0x3a>
    if (lflag >= 2) {
ffffffffc020568e:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc0205690:	008a0c93          	addi	s9,s4,8
    if (lflag >= 2) {
ffffffffc0205694:	01174463          	blt	a4,a7,ffffffffc020569c <vprintfmt+0x256>
    else if (lflag) {
ffffffffc0205698:	08088d63          	beqz	a7,ffffffffc0205732 <vprintfmt+0x2ec>
        return va_arg(*ap, long);
ffffffffc020569c:	000a3403          	ld	s0,0(s4)
            if ((long long)num < 0) {
ffffffffc02056a0:	0a044d63          	bltz	s0,ffffffffc020575a <vprintfmt+0x314>
            num = getint(&ap, lflag);
ffffffffc02056a4:	8622                	mv	a2,s0
ffffffffc02056a6:	8a66                	mv	s4,s9
ffffffffc02056a8:	46a9                	li	a3,10
ffffffffc02056aa:	bdcd                	j	ffffffffc020559c <vprintfmt+0x156>
            err = va_arg(ap, int);
ffffffffc02056ac:	000a2783          	lw	a5,0(s4)
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
ffffffffc02056b0:	4761                	li	a4,24
            err = va_arg(ap, int);
ffffffffc02056b2:	0a21                	addi	s4,s4,8
            if (err < 0) {
ffffffffc02056b4:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc02056b8:	8fb5                	xor	a5,a5,a3
ffffffffc02056ba:	40d786bb          	subw	a3,a5,a3
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
ffffffffc02056be:	02d74163          	blt	a4,a3,ffffffffc02056e0 <vprintfmt+0x29a>
ffffffffc02056c2:	00369793          	slli	a5,a3,0x3
ffffffffc02056c6:	97de                	add	a5,a5,s7
ffffffffc02056c8:	639c                	ld	a5,0(a5)
ffffffffc02056ca:	cb99                	beqz	a5,ffffffffc02056e0 <vprintfmt+0x29a>
                printfmt(putch, putdat, "%s", p);
ffffffffc02056cc:	86be                	mv	a3,a5
ffffffffc02056ce:	00000617          	auipc	a2,0x0
ffffffffc02056d2:	1f260613          	addi	a2,a2,498 # ffffffffc02058c0 <etext+0x2c>
ffffffffc02056d6:	85a6                	mv	a1,s1
ffffffffc02056d8:	854a                	mv	a0,s2
ffffffffc02056da:	0ce000ef          	jal	ra,ffffffffc02057a8 <printfmt>
ffffffffc02056de:	b34d                	j	ffffffffc0205480 <vprintfmt+0x3a>
                printfmt(putch, putdat, "error %d", err);
ffffffffc02056e0:	00002617          	auipc	a2,0x2
ffffffffc02056e4:	33860613          	addi	a2,a2,824 # ffffffffc0207a18 <syscalls+0x120>
ffffffffc02056e8:	85a6                	mv	a1,s1
ffffffffc02056ea:	854a                	mv	a0,s2
ffffffffc02056ec:	0bc000ef          	jal	ra,ffffffffc02057a8 <printfmt>
ffffffffc02056f0:	bb41                	j	ffffffffc0205480 <vprintfmt+0x3a>
                p = "(null)";
ffffffffc02056f2:	00002417          	auipc	s0,0x2
ffffffffc02056f6:	31e40413          	addi	s0,s0,798 # ffffffffc0207a10 <syscalls+0x118>
                for (width -= strnlen(p, precision); width > 0; width --) {
ffffffffc02056fa:	85e2                	mv	a1,s8
ffffffffc02056fc:	8522                	mv	a0,s0
ffffffffc02056fe:	e43e                	sd	a5,8(sp)
ffffffffc0205700:	0e2000ef          	jal	ra,ffffffffc02057e2 <strnlen>
ffffffffc0205704:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0205708:	01b05b63          	blez	s11,ffffffffc020571e <vprintfmt+0x2d8>
                    putch(padc, putdat);
ffffffffc020570c:	67a2                	ld	a5,8(sp)
ffffffffc020570e:	00078a1b          	sext.w	s4,a5
                for (width -= strnlen(p, precision); width > 0; width --) {
ffffffffc0205712:	3dfd                	addiw	s11,s11,-1
                    putch(padc, putdat);
ffffffffc0205714:	85a6                	mv	a1,s1
ffffffffc0205716:	8552                	mv	a0,s4
ffffffffc0205718:	9902                	jalr	s2
                for (width -= strnlen(p, precision); width > 0; width --) {
ffffffffc020571a:	fe0d9ce3          	bnez	s11,ffffffffc0205712 <vprintfmt+0x2cc>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc020571e:	00044783          	lbu	a5,0(s0)
ffffffffc0205722:	00140a13          	addi	s4,s0,1
ffffffffc0205726:	0007851b          	sext.w	a0,a5
ffffffffc020572a:	d3a5                	beqz	a5,ffffffffc020568a <vprintfmt+0x244>
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc020572c:	05e00413          	li	s0,94
ffffffffc0205730:	bf39                	j	ffffffffc020564e <vprintfmt+0x208>
        return va_arg(*ap, int);
ffffffffc0205732:	000a2403          	lw	s0,0(s4)
ffffffffc0205736:	b7ad                	j	ffffffffc02056a0 <vprintfmt+0x25a>
        return va_arg(*ap, unsigned int);
ffffffffc0205738:	000a6603          	lwu	a2,0(s4)
ffffffffc020573c:	46a1                	li	a3,8
ffffffffc020573e:	8a2e                	mv	s4,a1
ffffffffc0205740:	bdb1                	j	ffffffffc020559c <vprintfmt+0x156>
ffffffffc0205742:	000a6603          	lwu	a2,0(s4)
ffffffffc0205746:	46a9                	li	a3,10
ffffffffc0205748:	8a2e                	mv	s4,a1
ffffffffc020574a:	bd89                	j	ffffffffc020559c <vprintfmt+0x156>
ffffffffc020574c:	000a6603          	lwu	a2,0(s4)
ffffffffc0205750:	46c1                	li	a3,16
ffffffffc0205752:	8a2e                	mv	s4,a1
ffffffffc0205754:	b5a1                	j	ffffffffc020559c <vprintfmt+0x156>
                    putch(ch, putdat);
ffffffffc0205756:	9902                	jalr	s2
ffffffffc0205758:	bf09                	j	ffffffffc020566a <vprintfmt+0x224>
                putch('-', putdat);
ffffffffc020575a:	85a6                	mv	a1,s1
ffffffffc020575c:	02d00513          	li	a0,45
ffffffffc0205760:	e03e                	sd	a5,0(sp)
ffffffffc0205762:	9902                	jalr	s2
                num = -(long long)num;
ffffffffc0205764:	6782                	ld	a5,0(sp)
ffffffffc0205766:	8a66                	mv	s4,s9
ffffffffc0205768:	40800633          	neg	a2,s0
ffffffffc020576c:	46a9                	li	a3,10
ffffffffc020576e:	b53d                	j	ffffffffc020559c <vprintfmt+0x156>
            if (width > 0 && padc != '-') {
ffffffffc0205770:	03b05163          	blez	s11,ffffffffc0205792 <vprintfmt+0x34c>
ffffffffc0205774:	02d00693          	li	a3,45
ffffffffc0205778:	f6d79de3          	bne	a5,a3,ffffffffc02056f2 <vprintfmt+0x2ac>
                p = "(null)";
ffffffffc020577c:	00002417          	auipc	s0,0x2
ffffffffc0205780:	29440413          	addi	s0,s0,660 # ffffffffc0207a10 <syscalls+0x118>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc0205784:	02800793          	li	a5,40
ffffffffc0205788:	02800513          	li	a0,40
ffffffffc020578c:	00140a13          	addi	s4,s0,1
ffffffffc0205790:	bd6d                	j	ffffffffc020564a <vprintfmt+0x204>
ffffffffc0205792:	00002a17          	auipc	s4,0x2
ffffffffc0205796:	27fa0a13          	addi	s4,s4,639 # ffffffffc0207a11 <syscalls+0x119>
ffffffffc020579a:	02800513          	li	a0,40
ffffffffc020579e:	02800793          	li	a5,40
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc02057a2:	05e00413          	li	s0,94
ffffffffc02057a6:	b565                	j	ffffffffc020564e <vprintfmt+0x208>

ffffffffc02057a8 <printfmt>:
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
ffffffffc02057a8:	715d                	addi	sp,sp,-80
    va_start(ap, fmt);
ffffffffc02057aa:	02810313          	addi	t1,sp,40
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
ffffffffc02057ae:	f436                	sd	a3,40(sp)
    vprintfmt(putch, putdat, fmt, ap);
ffffffffc02057b0:	869a                	mv	a3,t1
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
ffffffffc02057b2:	ec06                	sd	ra,24(sp)
ffffffffc02057b4:	f83a                	sd	a4,48(sp)
ffffffffc02057b6:	fc3e                	sd	a5,56(sp)
ffffffffc02057b8:	e0c2                	sd	a6,64(sp)
ffffffffc02057ba:	e4c6                	sd	a7,72(sp)
    va_start(ap, fmt);
ffffffffc02057bc:	e41a                	sd	t1,8(sp)
    vprintfmt(putch, putdat, fmt, ap);
ffffffffc02057be:	c89ff0ef          	jal	ra,ffffffffc0205446 <vprintfmt>
}
ffffffffc02057c2:	60e2                	ld	ra,24(sp)
ffffffffc02057c4:	6161                	addi	sp,sp,80
ffffffffc02057c6:	8082                	ret

ffffffffc02057c8 <strlen>:
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
ffffffffc02057c8:	00054783          	lbu	a5,0(a0)
strlen(const char *s) {
ffffffffc02057cc:	872a                	mv	a4,a0
    size_t cnt = 0;
ffffffffc02057ce:	4501                	li	a0,0
    while (*s ++ != '\0') {
ffffffffc02057d0:	cb81                	beqz	a5,ffffffffc02057e0 <strlen+0x18>
        cnt ++;
ffffffffc02057d2:	0505                	addi	a0,a0,1
    while (*s ++ != '\0') {
ffffffffc02057d4:	00a707b3          	add	a5,a4,a0
ffffffffc02057d8:	0007c783          	lbu	a5,0(a5)
ffffffffc02057dc:	fbfd                	bnez	a5,ffffffffc02057d2 <strlen+0xa>
ffffffffc02057de:	8082                	ret
    }
    return cnt;
}
ffffffffc02057e0:	8082                	ret

ffffffffc02057e2 <strnlen>:
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
ffffffffc02057e2:	4781                	li	a5,0
    while (cnt < len && *s ++ != '\0') {
ffffffffc02057e4:	e589                	bnez	a1,ffffffffc02057ee <strnlen+0xc>
ffffffffc02057e6:	a811                	j	ffffffffc02057fa <strnlen+0x18>
        cnt ++;
ffffffffc02057e8:	0785                	addi	a5,a5,1
    while (cnt < len && *s ++ != '\0') {
ffffffffc02057ea:	00f58863          	beq	a1,a5,ffffffffc02057fa <strnlen+0x18>
ffffffffc02057ee:	00f50733          	add	a4,a0,a5
ffffffffc02057f2:	00074703          	lbu	a4,0(a4)
ffffffffc02057f6:	fb6d                	bnez	a4,ffffffffc02057e8 <strnlen+0x6>
ffffffffc02057f8:	85be                	mv	a1,a5
    }
    return cnt;
}
ffffffffc02057fa:	852e                	mv	a0,a1
ffffffffc02057fc:	8082                	ret

ffffffffc02057fe <strcpy>:
char *
strcpy(char *dst, const char *src) {
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
#else
    char *p = dst;
ffffffffc02057fe:	87aa                	mv	a5,a0
    while ((*p ++ = *src ++) != '\0')
ffffffffc0205800:	0005c703          	lbu	a4,0(a1)
ffffffffc0205804:	0785                	addi	a5,a5,1
ffffffffc0205806:	0585                	addi	a1,a1,1
ffffffffc0205808:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020580c:	fb75                	bnez	a4,ffffffffc0205800 <strcpy+0x2>
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
ffffffffc020580e:	8082                	ret

ffffffffc0205810 <strcmp>:
int
strcmp(const char *s1, const char *s2) {
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
#else
    while (*s1 != '\0' && *s1 == *s2) {
ffffffffc0205810:	00054783          	lbu	a5,0(a0)
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc0205814:	0005c703          	lbu	a4,0(a1)
    while (*s1 != '\0' && *s1 == *s2) {
ffffffffc0205818:	cb89                	beqz	a5,ffffffffc020582a <strcmp+0x1a>
        s1 ++, s2 ++;
ffffffffc020581a:	0505                	addi	a0,a0,1
ffffffffc020581c:	0585                	addi	a1,a1,1
    while (*s1 != '\0' && *s1 == *s2) {
ffffffffc020581e:	fee789e3          	beq	a5,a4,ffffffffc0205810 <strcmp>
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc0205822:	0007851b          	sext.w	a0,a5
#endif /* __HAVE_ARCH_STRCMP */
}
ffffffffc0205826:	9d19                	subw	a0,a0,a4
ffffffffc0205828:	8082                	ret
ffffffffc020582a:	4501                	li	a0,0
ffffffffc020582c:	bfed                	j	ffffffffc0205826 <strcmp+0x16>

ffffffffc020582e <strncmp>:
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
ffffffffc020582e:	c20d                	beqz	a2,ffffffffc0205850 <strncmp+0x22>
ffffffffc0205830:	962e                	add	a2,a2,a1
ffffffffc0205832:	a031                	j	ffffffffc020583e <strncmp+0x10>
        n --, s1 ++, s2 ++;
ffffffffc0205834:	0505                	addi	a0,a0,1
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
ffffffffc0205836:	00e79a63          	bne	a5,a4,ffffffffc020584a <strncmp+0x1c>
ffffffffc020583a:	00b60b63          	beq	a2,a1,ffffffffc0205850 <strncmp+0x22>
ffffffffc020583e:	00054783          	lbu	a5,0(a0)
        n --, s1 ++, s2 ++;
ffffffffc0205842:	0585                	addi	a1,a1,1
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
ffffffffc0205844:	fff5c703          	lbu	a4,-1(a1)
ffffffffc0205848:	f7f5                	bnez	a5,ffffffffc0205834 <strncmp+0x6>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc020584a:	40e7853b          	subw	a0,a5,a4
}
ffffffffc020584e:	8082                	ret
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc0205850:	4501                	li	a0,0
ffffffffc0205852:	8082                	ret

ffffffffc0205854 <strchr>:
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
ffffffffc0205854:	00054783          	lbu	a5,0(a0)
ffffffffc0205858:	c799                	beqz	a5,ffffffffc0205866 <strchr+0x12>
        if (*s == c) {
ffffffffc020585a:	00f58763          	beq	a1,a5,ffffffffc0205868 <strchr+0x14>
    while (*s != '\0') {
ffffffffc020585e:	00154783          	lbu	a5,1(a0)
            return (char *)s;
        }
        s ++;
ffffffffc0205862:	0505                	addi	a0,a0,1
    while (*s != '\0') {
ffffffffc0205864:	fbfd                	bnez	a5,ffffffffc020585a <strchr+0x6>
    }
    return NULL;
ffffffffc0205866:	4501                	li	a0,0
}
ffffffffc0205868:	8082                	ret

ffffffffc020586a <memset>:
memset(void *s, char c, size_t n) {
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
#else
    char *p = s;
    while (n -- > 0) {
ffffffffc020586a:	ca01                	beqz	a2,ffffffffc020587a <memset+0x10>
ffffffffc020586c:	962a                	add	a2,a2,a0
    char *p = s;
ffffffffc020586e:	87aa                	mv	a5,a0
        *p ++ = c;
ffffffffc0205870:	0785                	addi	a5,a5,1
ffffffffc0205872:	feb78fa3          	sb	a1,-1(a5)
    while (n -- > 0) {
ffffffffc0205876:	fec79de3          	bne	a5,a2,ffffffffc0205870 <memset+0x6>
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
ffffffffc020587a:	8082                	ret

ffffffffc020587c <memcpy>:
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
#else
    const char *s = src;
    char *d = dst;
    while (n -- > 0) {
ffffffffc020587c:	ca19                	beqz	a2,ffffffffc0205892 <memcpy+0x16>
ffffffffc020587e:	962e                	add	a2,a2,a1
    char *d = dst;
ffffffffc0205880:	87aa                	mv	a5,a0
        *d ++ = *s ++;
ffffffffc0205882:	0005c703          	lbu	a4,0(a1)
ffffffffc0205886:	0585                	addi	a1,a1,1
ffffffffc0205888:	0785                	addi	a5,a5,1
ffffffffc020588a:	fee78fa3          	sb	a4,-1(a5)
    while (n -- > 0) {
ffffffffc020588e:	fec59ae3          	bne	a1,a2,ffffffffc0205882 <memcpy+0x6>
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
ffffffffc0205892:	8082                	ret
