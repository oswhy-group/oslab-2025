
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	00014297          	auipc	t0,0x14
ffffffffc0200004:	00028293          	mv	t0,t0
ffffffffc0200008:	00a2b023          	sd	a0,0(t0) # ffffffffc0214000 <boot_hartid>
ffffffffc020000c:	00014297          	auipc	t0,0x14
ffffffffc0200010:	ffc28293          	addi	t0,t0,-4 # ffffffffc0214008 <boot_dtb>
ffffffffc0200014:	00b2b023          	sd	a1,0(t0)
ffffffffc0200018:	c02132b7          	lui	t0,0xc0213
ffffffffc020001c:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200020:	037a                	slli	t1,t1,0x1e
ffffffffc0200022:	406282b3          	sub	t0,t0,t1
ffffffffc0200026:	00c2d293          	srli	t0,t0,0xc
ffffffffc020002a:	fff0031b          	addiw	t1,zero,-1
ffffffffc020002e:	137e                	slli	t1,t1,0x3f
ffffffffc0200030:	0062e2b3          	or	t0,t0,t1
ffffffffc0200034:	18029073          	csrw	satp,t0
ffffffffc0200038:	12000073          	sfence.vma
ffffffffc020003c:	c0213137          	lui	sp,0xc0213
ffffffffc0200040:	c02002b7          	lui	t0,0xc0200
ffffffffc0200044:	04a28293          	addi	t0,t0,74 # ffffffffc020004a <kern_init>
ffffffffc0200048:	8282                	jr	t0

ffffffffc020004a <kern_init>:
ffffffffc020004a:	00091517          	auipc	a0,0x91
ffffffffc020004e:	01650513          	addi	a0,a0,22 # ffffffffc0291060 <buf>
ffffffffc0200052:	00097617          	auipc	a2,0x97
ffffffffc0200056:	8be60613          	addi	a2,a2,-1858 # ffffffffc0296910 <end>
ffffffffc020005a:	1141                	addi	sp,sp,-16
ffffffffc020005c:	8e09                	sub	a2,a2,a0
ffffffffc020005e:	4581                	li	a1,0
ffffffffc0200060:	e406                	sd	ra,8(sp)
ffffffffc0200062:	7f80b0ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0200066:	52c000ef          	jal	ra,ffffffffc0200592 <cons_init>
ffffffffc020006a:	0000c597          	auipc	a1,0xc
ffffffffc020006e:	85e58593          	addi	a1,a1,-1954 # ffffffffc020b8c8 <etext+0x4>
ffffffffc0200072:	0000c517          	auipc	a0,0xc
ffffffffc0200076:	87650513          	addi	a0,a0,-1930 # ffffffffc020b8e8 <etext+0x24>
ffffffffc020007a:	12c000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020007e:	1ae000ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc0200082:	62a000ef          	jal	ra,ffffffffc02006ac <dtb_init>
ffffffffc0200086:	2db020ef          	jal	ra,ffffffffc0202b60 <pmm_init>
ffffffffc020008a:	3ef000ef          	jal	ra,ffffffffc0200c78 <pic_init>
ffffffffc020008e:	515000ef          	jal	ra,ffffffffc0200da2 <idt_init>
ffffffffc0200092:	076040ef          	jal	ra,ffffffffc0204108 <vmm_init>
ffffffffc0200096:	554070ef          	jal	ra,ffffffffc02075ea <sched_init>
ffffffffc020009a:	156070ef          	jal	ra,ffffffffc02071f0 <proc_init>
ffffffffc020009e:	1bf000ef          	jal	ra,ffffffffc0200a5c <ide_init>
ffffffffc02000a2:	2a8050ef          	jal	ra,ffffffffc020534a <fs_init>
ffffffffc02000a6:	4a4000ef          	jal	ra,ffffffffc020054a <clock_init>
ffffffffc02000aa:	3c3000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02000ae:	312070ef          	jal	ra,ffffffffc02073c0 <cpu_idle>

ffffffffc02000b2 <readline>:
ffffffffc02000b2:	715d                	addi	sp,sp,-80
ffffffffc02000b4:	e486                	sd	ra,72(sp)
ffffffffc02000b6:	e0a6                	sd	s1,64(sp)
ffffffffc02000b8:	fc4a                	sd	s2,56(sp)
ffffffffc02000ba:	f84e                	sd	s3,48(sp)
ffffffffc02000bc:	f452                	sd	s4,40(sp)
ffffffffc02000be:	f056                	sd	s5,32(sp)
ffffffffc02000c0:	ec5a                	sd	s6,24(sp)
ffffffffc02000c2:	e85e                	sd	s7,16(sp)
ffffffffc02000c4:	c901                	beqz	a0,ffffffffc02000d4 <readline+0x22>
ffffffffc02000c6:	85aa                	mv	a1,a0
ffffffffc02000c8:	0000c517          	auipc	a0,0xc
ffffffffc02000cc:	82850513          	addi	a0,a0,-2008 # ffffffffc020b8f0 <etext+0x2c>
ffffffffc02000d0:	0d6000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02000d4:	4481                	li	s1,0
ffffffffc02000d6:	497d                	li	s2,31
ffffffffc02000d8:	49a1                	li	s3,8
ffffffffc02000da:	4aa9                	li	s5,10
ffffffffc02000dc:	4b35                	li	s6,13
ffffffffc02000de:	00091b97          	auipc	s7,0x91
ffffffffc02000e2:	f82b8b93          	addi	s7,s7,-126 # ffffffffc0291060 <buf>
ffffffffc02000e6:	3fe00a13          	li	s4,1022
ffffffffc02000ea:	0fa000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc02000ee:	00054a63          	bltz	a0,ffffffffc0200102 <readline+0x50>
ffffffffc02000f2:	00a95a63          	bge	s2,a0,ffffffffc0200106 <readline+0x54>
ffffffffc02000f6:	029a5263          	bge	s4,s1,ffffffffc020011a <readline+0x68>
ffffffffc02000fa:	0ea000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc02000fe:	fe055ae3          	bgez	a0,ffffffffc02000f2 <readline+0x40>
ffffffffc0200102:	4501                	li	a0,0
ffffffffc0200104:	a091                	j	ffffffffc0200148 <readline+0x96>
ffffffffc0200106:	03351463          	bne	a0,s3,ffffffffc020012e <readline+0x7c>
ffffffffc020010a:	e8a9                	bnez	s1,ffffffffc020015c <readline+0xaa>
ffffffffc020010c:	0d8000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc0200110:	fe0549e3          	bltz	a0,ffffffffc0200102 <readline+0x50>
ffffffffc0200114:	fea959e3          	bge	s2,a0,ffffffffc0200106 <readline+0x54>
ffffffffc0200118:	4481                	li	s1,0
ffffffffc020011a:	e42a                	sd	a0,8(sp)
ffffffffc020011c:	0c6000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0200120:	6522                	ld	a0,8(sp)
ffffffffc0200122:	009b87b3          	add	a5,s7,s1
ffffffffc0200126:	2485                	addiw	s1,s1,1
ffffffffc0200128:	00a78023          	sb	a0,0(a5)
ffffffffc020012c:	bf7d                	j	ffffffffc02000ea <readline+0x38>
ffffffffc020012e:	01550463          	beq	a0,s5,ffffffffc0200136 <readline+0x84>
ffffffffc0200132:	fb651ce3          	bne	a0,s6,ffffffffc02000ea <readline+0x38>
ffffffffc0200136:	0ac000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc020013a:	00091517          	auipc	a0,0x91
ffffffffc020013e:	f2650513          	addi	a0,a0,-218 # ffffffffc0291060 <buf>
ffffffffc0200142:	94aa                	add	s1,s1,a0
ffffffffc0200144:	00048023          	sb	zero,0(s1)
ffffffffc0200148:	60a6                	ld	ra,72(sp)
ffffffffc020014a:	6486                	ld	s1,64(sp)
ffffffffc020014c:	7962                	ld	s2,56(sp)
ffffffffc020014e:	79c2                	ld	s3,48(sp)
ffffffffc0200150:	7a22                	ld	s4,40(sp)
ffffffffc0200152:	7a82                	ld	s5,32(sp)
ffffffffc0200154:	6b62                	ld	s6,24(sp)
ffffffffc0200156:	6bc2                	ld	s7,16(sp)
ffffffffc0200158:	6161                	addi	sp,sp,80
ffffffffc020015a:	8082                	ret
ffffffffc020015c:	4521                	li	a0,8
ffffffffc020015e:	084000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0200162:	34fd                	addiw	s1,s1,-1
ffffffffc0200164:	b759                	j	ffffffffc02000ea <readline+0x38>

ffffffffc0200166 <cputch>:
ffffffffc0200166:	1141                	addi	sp,sp,-16
ffffffffc0200168:	e022                	sd	s0,0(sp)
ffffffffc020016a:	e406                	sd	ra,8(sp)
ffffffffc020016c:	842e                	mv	s0,a1
ffffffffc020016e:	432000ef          	jal	ra,ffffffffc02005a0 <cons_putc>
ffffffffc0200172:	401c                	lw	a5,0(s0)
ffffffffc0200174:	60a2                	ld	ra,8(sp)
ffffffffc0200176:	2785                	addiw	a5,a5,1
ffffffffc0200178:	c01c                	sw	a5,0(s0)
ffffffffc020017a:	6402                	ld	s0,0(sp)
ffffffffc020017c:	0141                	addi	sp,sp,16
ffffffffc020017e:	8082                	ret

ffffffffc0200180 <vcprintf>:
ffffffffc0200180:	1101                	addi	sp,sp,-32
ffffffffc0200182:	872e                	mv	a4,a1
ffffffffc0200184:	75dd                	lui	a1,0xffff7
ffffffffc0200186:	86aa                	mv	a3,a0
ffffffffc0200188:	0070                	addi	a2,sp,12
ffffffffc020018a:	00000517          	auipc	a0,0x0
ffffffffc020018e:	fdc50513          	addi	a0,a0,-36 # ffffffffc0200166 <cputch>
ffffffffc0200192:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0200196:	ec06                	sd	ra,24(sp)
ffffffffc0200198:	c602                	sw	zero,12(sp)
ffffffffc020019a:	2320b0ef          	jal	ra,ffffffffc020b3cc <vprintfmt>
ffffffffc020019e:	60e2                	ld	ra,24(sp)
ffffffffc02001a0:	4532                	lw	a0,12(sp)
ffffffffc02001a2:	6105                	addi	sp,sp,32
ffffffffc02001a4:	8082                	ret

ffffffffc02001a6 <cprintf>:
ffffffffc02001a6:	711d                	addi	sp,sp,-96
ffffffffc02001a8:	02810313          	addi	t1,sp,40 # ffffffffc0213028 <boot_page_table_sv39+0x28>
ffffffffc02001ac:	8e2a                	mv	t3,a0
ffffffffc02001ae:	f42e                	sd	a1,40(sp)
ffffffffc02001b0:	75dd                	lui	a1,0xffff7
ffffffffc02001b2:	f832                	sd	a2,48(sp)
ffffffffc02001b4:	fc36                	sd	a3,56(sp)
ffffffffc02001b6:	e0ba                	sd	a4,64(sp)
ffffffffc02001b8:	00000517          	auipc	a0,0x0
ffffffffc02001bc:	fae50513          	addi	a0,a0,-82 # ffffffffc0200166 <cputch>
ffffffffc02001c0:	0050                	addi	a2,sp,4
ffffffffc02001c2:	871a                	mv	a4,t1
ffffffffc02001c4:	86f2                	mv	a3,t3
ffffffffc02001c6:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc02001ca:	ec06                	sd	ra,24(sp)
ffffffffc02001cc:	e4be                	sd	a5,72(sp)
ffffffffc02001ce:	e8c2                	sd	a6,80(sp)
ffffffffc02001d0:	ecc6                	sd	a7,88(sp)
ffffffffc02001d2:	e41a                	sd	t1,8(sp)
ffffffffc02001d4:	c202                	sw	zero,4(sp)
ffffffffc02001d6:	1f60b0ef          	jal	ra,ffffffffc020b3cc <vprintfmt>
ffffffffc02001da:	60e2                	ld	ra,24(sp)
ffffffffc02001dc:	4512                	lw	a0,4(sp)
ffffffffc02001de:	6125                	addi	sp,sp,96
ffffffffc02001e0:	8082                	ret

ffffffffc02001e2 <cputchar>:
ffffffffc02001e2:	ae7d                	j	ffffffffc02005a0 <cons_putc>

ffffffffc02001e4 <getchar>:
ffffffffc02001e4:	1141                	addi	sp,sp,-16
ffffffffc02001e6:	e406                	sd	ra,8(sp)
ffffffffc02001e8:	40c000ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc02001ec:	dd75                	beqz	a0,ffffffffc02001e8 <getchar+0x4>
ffffffffc02001ee:	60a2                	ld	ra,8(sp)
ffffffffc02001f0:	0141                	addi	sp,sp,16
ffffffffc02001f2:	8082                	ret

ffffffffc02001f4 <strdup>:
ffffffffc02001f4:	1101                	addi	sp,sp,-32
ffffffffc02001f6:	ec06                	sd	ra,24(sp)
ffffffffc02001f8:	e822                	sd	s0,16(sp)
ffffffffc02001fa:	e426                	sd	s1,8(sp)
ffffffffc02001fc:	e04a                	sd	s2,0(sp)
ffffffffc02001fe:	892a                	mv	s2,a0
ffffffffc0200200:	5b80b0ef          	jal	ra,ffffffffc020b7b8 <strlen>
ffffffffc0200204:	842a                	mv	s0,a0
ffffffffc0200206:	0505                	addi	a0,a0,1
ffffffffc0200208:	617010ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc020020c:	84aa                	mv	s1,a0
ffffffffc020020e:	c901                	beqz	a0,ffffffffc020021e <strdup+0x2a>
ffffffffc0200210:	8622                	mv	a2,s0
ffffffffc0200212:	85ca                	mv	a1,s2
ffffffffc0200214:	9426                	add	s0,s0,s1
ffffffffc0200216:	6960b0ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc020021a:	00040023          	sb	zero,0(s0)
ffffffffc020021e:	60e2                	ld	ra,24(sp)
ffffffffc0200220:	6442                	ld	s0,16(sp)
ffffffffc0200222:	6902                	ld	s2,0(sp)
ffffffffc0200224:	8526                	mv	a0,s1
ffffffffc0200226:	64a2                	ld	s1,8(sp)
ffffffffc0200228:	6105                	addi	sp,sp,32
ffffffffc020022a:	8082                	ret

ffffffffc020022c <print_kerninfo>:
ffffffffc020022c:	1141                	addi	sp,sp,-16
ffffffffc020022e:	0000b517          	auipc	a0,0xb
ffffffffc0200232:	6ca50513          	addi	a0,a0,1738 # ffffffffc020b8f8 <etext+0x34>
ffffffffc0200236:	e406                	sd	ra,8(sp)
ffffffffc0200238:	f6fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020023c:	00000597          	auipc	a1,0x0
ffffffffc0200240:	e0e58593          	addi	a1,a1,-498 # ffffffffc020004a <kern_init>
ffffffffc0200244:	0000b517          	auipc	a0,0xb
ffffffffc0200248:	6d450513          	addi	a0,a0,1748 # ffffffffc020b918 <etext+0x54>
ffffffffc020024c:	f5bff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200250:	0000b597          	auipc	a1,0xb
ffffffffc0200254:	67458593          	addi	a1,a1,1652 # ffffffffc020b8c4 <etext>
ffffffffc0200258:	0000b517          	auipc	a0,0xb
ffffffffc020025c:	6e050513          	addi	a0,a0,1760 # ffffffffc020b938 <etext+0x74>
ffffffffc0200260:	f47ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200264:	00091597          	auipc	a1,0x91
ffffffffc0200268:	dfc58593          	addi	a1,a1,-516 # ffffffffc0291060 <buf>
ffffffffc020026c:	0000b517          	auipc	a0,0xb
ffffffffc0200270:	6ec50513          	addi	a0,a0,1772 # ffffffffc020b958 <etext+0x94>
ffffffffc0200274:	f33ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200278:	00096597          	auipc	a1,0x96
ffffffffc020027c:	69858593          	addi	a1,a1,1688 # ffffffffc0296910 <end>
ffffffffc0200280:	0000b517          	auipc	a0,0xb
ffffffffc0200284:	6f850513          	addi	a0,a0,1784 # ffffffffc020b978 <etext+0xb4>
ffffffffc0200288:	f1fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020028c:	00097597          	auipc	a1,0x97
ffffffffc0200290:	a8358593          	addi	a1,a1,-1405 # ffffffffc0296d0f <end+0x3ff>
ffffffffc0200294:	00000797          	auipc	a5,0x0
ffffffffc0200298:	db678793          	addi	a5,a5,-586 # ffffffffc020004a <kern_init>
ffffffffc020029c:	40f587b3          	sub	a5,a1,a5
ffffffffc02002a0:	43f7d593          	srai	a1,a5,0x3f
ffffffffc02002a4:	60a2                	ld	ra,8(sp)
ffffffffc02002a6:	3ff5f593          	andi	a1,a1,1023
ffffffffc02002aa:	95be                	add	a1,a1,a5
ffffffffc02002ac:	85a9                	srai	a1,a1,0xa
ffffffffc02002ae:	0000b517          	auipc	a0,0xb
ffffffffc02002b2:	6ea50513          	addi	a0,a0,1770 # ffffffffc020b998 <etext+0xd4>
ffffffffc02002b6:	0141                	addi	sp,sp,16
ffffffffc02002b8:	b5fd                	j	ffffffffc02001a6 <cprintf>

ffffffffc02002ba <print_stackframe>:
ffffffffc02002ba:	1141                	addi	sp,sp,-16
ffffffffc02002bc:	0000b617          	auipc	a2,0xb
ffffffffc02002c0:	70c60613          	addi	a2,a2,1804 # ffffffffc020b9c8 <etext+0x104>
ffffffffc02002c4:	04e00593          	li	a1,78
ffffffffc02002c8:	0000b517          	auipc	a0,0xb
ffffffffc02002cc:	71850513          	addi	a0,a0,1816 # ffffffffc020b9e0 <etext+0x11c>
ffffffffc02002d0:	e406                	sd	ra,8(sp)
ffffffffc02002d2:	1cc000ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02002d6 <mon_help>:
ffffffffc02002d6:	1141                	addi	sp,sp,-16
ffffffffc02002d8:	0000b617          	auipc	a2,0xb
ffffffffc02002dc:	72060613          	addi	a2,a2,1824 # ffffffffc020b9f8 <etext+0x134>
ffffffffc02002e0:	0000b597          	auipc	a1,0xb
ffffffffc02002e4:	73858593          	addi	a1,a1,1848 # ffffffffc020ba18 <etext+0x154>
ffffffffc02002e8:	0000b517          	auipc	a0,0xb
ffffffffc02002ec:	73850513          	addi	a0,a0,1848 # ffffffffc020ba20 <etext+0x15c>
ffffffffc02002f0:	e406                	sd	ra,8(sp)
ffffffffc02002f2:	eb5ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02002f6:	0000b617          	auipc	a2,0xb
ffffffffc02002fa:	73a60613          	addi	a2,a2,1850 # ffffffffc020ba30 <etext+0x16c>
ffffffffc02002fe:	0000b597          	auipc	a1,0xb
ffffffffc0200302:	75a58593          	addi	a1,a1,1882 # ffffffffc020ba58 <etext+0x194>
ffffffffc0200306:	0000b517          	auipc	a0,0xb
ffffffffc020030a:	71a50513          	addi	a0,a0,1818 # ffffffffc020ba20 <etext+0x15c>
ffffffffc020030e:	e99ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200312:	0000b617          	auipc	a2,0xb
ffffffffc0200316:	75660613          	addi	a2,a2,1878 # ffffffffc020ba68 <etext+0x1a4>
ffffffffc020031a:	0000b597          	auipc	a1,0xb
ffffffffc020031e:	76e58593          	addi	a1,a1,1902 # ffffffffc020ba88 <etext+0x1c4>
ffffffffc0200322:	0000b517          	auipc	a0,0xb
ffffffffc0200326:	6fe50513          	addi	a0,a0,1790 # ffffffffc020ba20 <etext+0x15c>
ffffffffc020032a:	e7dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020032e:	60a2                	ld	ra,8(sp)
ffffffffc0200330:	4501                	li	a0,0
ffffffffc0200332:	0141                	addi	sp,sp,16
ffffffffc0200334:	8082                	ret

ffffffffc0200336 <mon_kerninfo>:
ffffffffc0200336:	1141                	addi	sp,sp,-16
ffffffffc0200338:	e406                	sd	ra,8(sp)
ffffffffc020033a:	ef3ff0ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc020033e:	60a2                	ld	ra,8(sp)
ffffffffc0200340:	4501                	li	a0,0
ffffffffc0200342:	0141                	addi	sp,sp,16
ffffffffc0200344:	8082                	ret

ffffffffc0200346 <mon_backtrace>:
ffffffffc0200346:	1141                	addi	sp,sp,-16
ffffffffc0200348:	e406                	sd	ra,8(sp)
ffffffffc020034a:	f71ff0ef          	jal	ra,ffffffffc02002ba <print_stackframe>
ffffffffc020034e:	60a2                	ld	ra,8(sp)
ffffffffc0200350:	4501                	li	a0,0
ffffffffc0200352:	0141                	addi	sp,sp,16
ffffffffc0200354:	8082                	ret

ffffffffc0200356 <kmonitor>:
ffffffffc0200356:	7115                	addi	sp,sp,-224
ffffffffc0200358:	ed5e                	sd	s7,152(sp)
ffffffffc020035a:	8baa                	mv	s7,a0
ffffffffc020035c:	0000b517          	auipc	a0,0xb
ffffffffc0200360:	73c50513          	addi	a0,a0,1852 # ffffffffc020ba98 <etext+0x1d4>
ffffffffc0200364:	ed86                	sd	ra,216(sp)
ffffffffc0200366:	e9a2                	sd	s0,208(sp)
ffffffffc0200368:	e5a6                	sd	s1,200(sp)
ffffffffc020036a:	e1ca                	sd	s2,192(sp)
ffffffffc020036c:	fd4e                	sd	s3,184(sp)
ffffffffc020036e:	f952                	sd	s4,176(sp)
ffffffffc0200370:	f556                	sd	s5,168(sp)
ffffffffc0200372:	f15a                	sd	s6,160(sp)
ffffffffc0200374:	e962                	sd	s8,144(sp)
ffffffffc0200376:	e566                	sd	s9,136(sp)
ffffffffc0200378:	e16a                	sd	s10,128(sp)
ffffffffc020037a:	e2dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020037e:	0000b517          	auipc	a0,0xb
ffffffffc0200382:	74250513          	addi	a0,a0,1858 # ffffffffc020bac0 <etext+0x1fc>
ffffffffc0200386:	e21ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020038a:	000b8563          	beqz	s7,ffffffffc0200394 <kmonitor+0x3e>
ffffffffc020038e:	855e                	mv	a0,s7
ffffffffc0200390:	3fb000ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc0200394:	0000bc17          	auipc	s8,0xb
ffffffffc0200398:	79cc0c13          	addi	s8,s8,1948 # ffffffffc020bb30 <commands>
ffffffffc020039c:	0000b917          	auipc	s2,0xb
ffffffffc02003a0:	74c90913          	addi	s2,s2,1868 # ffffffffc020bae8 <etext+0x224>
ffffffffc02003a4:	0000b497          	auipc	s1,0xb
ffffffffc02003a8:	74c48493          	addi	s1,s1,1868 # ffffffffc020baf0 <etext+0x22c>
ffffffffc02003ac:	49bd                	li	s3,15
ffffffffc02003ae:	0000bb17          	auipc	s6,0xb
ffffffffc02003b2:	74ab0b13          	addi	s6,s6,1866 # ffffffffc020baf8 <etext+0x234>
ffffffffc02003b6:	0000ba17          	auipc	s4,0xb
ffffffffc02003ba:	662a0a13          	addi	s4,s4,1634 # ffffffffc020ba18 <etext+0x154>
ffffffffc02003be:	4a8d                	li	s5,3
ffffffffc02003c0:	854a                	mv	a0,s2
ffffffffc02003c2:	cf1ff0ef          	jal	ra,ffffffffc02000b2 <readline>
ffffffffc02003c6:	842a                	mv	s0,a0
ffffffffc02003c8:	dd65                	beqz	a0,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc02003ca:	00054583          	lbu	a1,0(a0)
ffffffffc02003ce:	4c81                	li	s9,0
ffffffffc02003d0:	e1bd                	bnez	a1,ffffffffc0200436 <kmonitor+0xe0>
ffffffffc02003d2:	fe0c87e3          	beqz	s9,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc02003d6:	6582                	ld	a1,0(sp)
ffffffffc02003d8:	0000bd17          	auipc	s10,0xb
ffffffffc02003dc:	758d0d13          	addi	s10,s10,1880 # ffffffffc020bb30 <commands>
ffffffffc02003e0:	8552                	mv	a0,s4
ffffffffc02003e2:	4401                	li	s0,0
ffffffffc02003e4:	0d61                	addi	s10,s10,24
ffffffffc02003e6:	41a0b0ef          	jal	ra,ffffffffc020b800 <strcmp>
ffffffffc02003ea:	c919                	beqz	a0,ffffffffc0200400 <kmonitor+0xaa>
ffffffffc02003ec:	2405                	addiw	s0,s0,1
ffffffffc02003ee:	0b540063          	beq	s0,s5,ffffffffc020048e <kmonitor+0x138>
ffffffffc02003f2:	000d3503          	ld	a0,0(s10)
ffffffffc02003f6:	6582                	ld	a1,0(sp)
ffffffffc02003f8:	0d61                	addi	s10,s10,24
ffffffffc02003fa:	4060b0ef          	jal	ra,ffffffffc020b800 <strcmp>
ffffffffc02003fe:	f57d                	bnez	a0,ffffffffc02003ec <kmonitor+0x96>
ffffffffc0200400:	00141793          	slli	a5,s0,0x1
ffffffffc0200404:	97a2                	add	a5,a5,s0
ffffffffc0200406:	078e                	slli	a5,a5,0x3
ffffffffc0200408:	97e2                	add	a5,a5,s8
ffffffffc020040a:	6b9c                	ld	a5,16(a5)
ffffffffc020040c:	865e                	mv	a2,s7
ffffffffc020040e:	002c                	addi	a1,sp,8
ffffffffc0200410:	fffc851b          	addiw	a0,s9,-1
ffffffffc0200414:	9782                	jalr	a5
ffffffffc0200416:	fa0555e3          	bgez	a0,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc020041a:	60ee                	ld	ra,216(sp)
ffffffffc020041c:	644e                	ld	s0,208(sp)
ffffffffc020041e:	64ae                	ld	s1,200(sp)
ffffffffc0200420:	690e                	ld	s2,192(sp)
ffffffffc0200422:	79ea                	ld	s3,184(sp)
ffffffffc0200424:	7a4a                	ld	s4,176(sp)
ffffffffc0200426:	7aaa                	ld	s5,168(sp)
ffffffffc0200428:	7b0a                	ld	s6,160(sp)
ffffffffc020042a:	6bea                	ld	s7,152(sp)
ffffffffc020042c:	6c4a                	ld	s8,144(sp)
ffffffffc020042e:	6caa                	ld	s9,136(sp)
ffffffffc0200430:	6d0a                	ld	s10,128(sp)
ffffffffc0200432:	612d                	addi	sp,sp,224
ffffffffc0200434:	8082                	ret
ffffffffc0200436:	8526                	mv	a0,s1
ffffffffc0200438:	40c0b0ef          	jal	ra,ffffffffc020b844 <strchr>
ffffffffc020043c:	c901                	beqz	a0,ffffffffc020044c <kmonitor+0xf6>
ffffffffc020043e:	00144583          	lbu	a1,1(s0)
ffffffffc0200442:	00040023          	sb	zero,0(s0)
ffffffffc0200446:	0405                	addi	s0,s0,1
ffffffffc0200448:	d5c9                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc020044a:	b7f5                	j	ffffffffc0200436 <kmonitor+0xe0>
ffffffffc020044c:	00044783          	lbu	a5,0(s0)
ffffffffc0200450:	d3c9                	beqz	a5,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200452:	033c8963          	beq	s9,s3,ffffffffc0200484 <kmonitor+0x12e>
ffffffffc0200456:	003c9793          	slli	a5,s9,0x3
ffffffffc020045a:	0118                	addi	a4,sp,128
ffffffffc020045c:	97ba                	add	a5,a5,a4
ffffffffc020045e:	f887b023          	sd	s0,-128(a5)
ffffffffc0200462:	00044583          	lbu	a1,0(s0)
ffffffffc0200466:	2c85                	addiw	s9,s9,1
ffffffffc0200468:	e591                	bnez	a1,ffffffffc0200474 <kmonitor+0x11e>
ffffffffc020046a:	b7b5                	j	ffffffffc02003d6 <kmonitor+0x80>
ffffffffc020046c:	00144583          	lbu	a1,1(s0)
ffffffffc0200470:	0405                	addi	s0,s0,1
ffffffffc0200472:	d1a5                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200474:	8526                	mv	a0,s1
ffffffffc0200476:	3ce0b0ef          	jal	ra,ffffffffc020b844 <strchr>
ffffffffc020047a:	d96d                	beqz	a0,ffffffffc020046c <kmonitor+0x116>
ffffffffc020047c:	00044583          	lbu	a1,0(s0)
ffffffffc0200480:	d9a9                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200482:	bf55                	j	ffffffffc0200436 <kmonitor+0xe0>
ffffffffc0200484:	45c1                	li	a1,16
ffffffffc0200486:	855a                	mv	a0,s6
ffffffffc0200488:	d1fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020048c:	b7e9                	j	ffffffffc0200456 <kmonitor+0x100>
ffffffffc020048e:	6582                	ld	a1,0(sp)
ffffffffc0200490:	0000b517          	auipc	a0,0xb
ffffffffc0200494:	68850513          	addi	a0,a0,1672 # ffffffffc020bb18 <etext+0x254>
ffffffffc0200498:	d0fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020049c:	b715                	j	ffffffffc02003c0 <kmonitor+0x6a>

ffffffffc020049e <__panic>:
ffffffffc020049e:	00096317          	auipc	t1,0x96
ffffffffc02004a2:	3ca30313          	addi	t1,t1,970 # ffffffffc0296868 <is_panic>
ffffffffc02004a6:	00033e03          	ld	t3,0(t1)
ffffffffc02004aa:	715d                	addi	sp,sp,-80
ffffffffc02004ac:	ec06                	sd	ra,24(sp)
ffffffffc02004ae:	e822                	sd	s0,16(sp)
ffffffffc02004b0:	f436                	sd	a3,40(sp)
ffffffffc02004b2:	f83a                	sd	a4,48(sp)
ffffffffc02004b4:	fc3e                	sd	a5,56(sp)
ffffffffc02004b6:	e0c2                	sd	a6,64(sp)
ffffffffc02004b8:	e4c6                	sd	a7,72(sp)
ffffffffc02004ba:	020e1a63          	bnez	t3,ffffffffc02004ee <__panic+0x50>
ffffffffc02004be:	4785                	li	a5,1
ffffffffc02004c0:	00f33023          	sd	a5,0(t1)
ffffffffc02004c4:	8432                	mv	s0,a2
ffffffffc02004c6:	103c                	addi	a5,sp,40
ffffffffc02004c8:	862e                	mv	a2,a1
ffffffffc02004ca:	85aa                	mv	a1,a0
ffffffffc02004cc:	0000b517          	auipc	a0,0xb
ffffffffc02004d0:	6ac50513          	addi	a0,a0,1708 # ffffffffc020bb78 <commands+0x48>
ffffffffc02004d4:	e43e                	sd	a5,8(sp)
ffffffffc02004d6:	cd1ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004da:	65a2                	ld	a1,8(sp)
ffffffffc02004dc:	8522                	mv	a0,s0
ffffffffc02004de:	ca3ff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc02004e2:	0000d517          	auipc	a0,0xd
ffffffffc02004e6:	98e50513          	addi	a0,a0,-1650 # ffffffffc020ce70 <default_pmm_manager+0x610>
ffffffffc02004ea:	cbdff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004ee:	4501                	li	a0,0
ffffffffc02004f0:	4581                	li	a1,0
ffffffffc02004f2:	4601                	li	a2,0
ffffffffc02004f4:	48a1                	li	a7,8
ffffffffc02004f6:	00000073          	ecall
ffffffffc02004fa:	778000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02004fe:	4501                	li	a0,0
ffffffffc0200500:	e57ff0ef          	jal	ra,ffffffffc0200356 <kmonitor>
ffffffffc0200504:	bfed                	j	ffffffffc02004fe <__panic+0x60>

ffffffffc0200506 <__warn>:
ffffffffc0200506:	715d                	addi	sp,sp,-80
ffffffffc0200508:	832e                	mv	t1,a1
ffffffffc020050a:	e822                	sd	s0,16(sp)
ffffffffc020050c:	85aa                	mv	a1,a0
ffffffffc020050e:	8432                	mv	s0,a2
ffffffffc0200510:	fc3e                	sd	a5,56(sp)
ffffffffc0200512:	861a                	mv	a2,t1
ffffffffc0200514:	103c                	addi	a5,sp,40
ffffffffc0200516:	0000b517          	auipc	a0,0xb
ffffffffc020051a:	68250513          	addi	a0,a0,1666 # ffffffffc020bb98 <commands+0x68>
ffffffffc020051e:	ec06                	sd	ra,24(sp)
ffffffffc0200520:	f436                	sd	a3,40(sp)
ffffffffc0200522:	f83a                	sd	a4,48(sp)
ffffffffc0200524:	e0c2                	sd	a6,64(sp)
ffffffffc0200526:	e4c6                	sd	a7,72(sp)
ffffffffc0200528:	e43e                	sd	a5,8(sp)
ffffffffc020052a:	c7dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020052e:	65a2                	ld	a1,8(sp)
ffffffffc0200530:	8522                	mv	a0,s0
ffffffffc0200532:	c4fff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc0200536:	0000d517          	auipc	a0,0xd
ffffffffc020053a:	93a50513          	addi	a0,a0,-1734 # ffffffffc020ce70 <default_pmm_manager+0x610>
ffffffffc020053e:	c69ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200542:	60e2                	ld	ra,24(sp)
ffffffffc0200544:	6442                	ld	s0,16(sp)
ffffffffc0200546:	6161                	addi	sp,sp,80
ffffffffc0200548:	8082                	ret

ffffffffc020054a <clock_init>:
ffffffffc020054a:	02000793          	li	a5,32
ffffffffc020054e:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc0200552:	c0102573          	rdtime	a0
ffffffffc0200556:	67e1                	lui	a5,0x18
ffffffffc0200558:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc020055c:	953e                	add	a0,a0,a5
ffffffffc020055e:	4581                	li	a1,0
ffffffffc0200560:	4601                	li	a2,0
ffffffffc0200562:	4881                	li	a7,0
ffffffffc0200564:	00000073          	ecall
ffffffffc0200568:	0000b517          	auipc	a0,0xb
ffffffffc020056c:	65050513          	addi	a0,a0,1616 # ffffffffc020bbb8 <commands+0x88>
ffffffffc0200570:	00096797          	auipc	a5,0x96
ffffffffc0200574:	3007b023          	sd	zero,768(a5) # ffffffffc0296870 <ticks>
ffffffffc0200578:	b13d                	j	ffffffffc02001a6 <cprintf>

ffffffffc020057a <clock_set_next_event>:
ffffffffc020057a:	c0102573          	rdtime	a0
ffffffffc020057e:	67e1                	lui	a5,0x18
ffffffffc0200580:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc0200584:	953e                	add	a0,a0,a5
ffffffffc0200586:	4581                	li	a1,0
ffffffffc0200588:	4601                	li	a2,0
ffffffffc020058a:	4881                	li	a7,0
ffffffffc020058c:	00000073          	ecall
ffffffffc0200590:	8082                	ret

ffffffffc0200592 <cons_init>:
ffffffffc0200592:	4501                	li	a0,0
ffffffffc0200594:	4581                	li	a1,0
ffffffffc0200596:	4601                	li	a2,0
ffffffffc0200598:	4889                	li	a7,2
ffffffffc020059a:	00000073          	ecall
ffffffffc020059e:	8082                	ret

ffffffffc02005a0 <cons_putc>:
ffffffffc02005a0:	1101                	addi	sp,sp,-32
ffffffffc02005a2:	ec06                	sd	ra,24(sp)
ffffffffc02005a4:	100027f3          	csrr	a5,sstatus
ffffffffc02005a8:	8b89                	andi	a5,a5,2
ffffffffc02005aa:	4701                	li	a4,0
ffffffffc02005ac:	ef95                	bnez	a5,ffffffffc02005e8 <cons_putc+0x48>
ffffffffc02005ae:	47a1                	li	a5,8
ffffffffc02005b0:	00f50b63          	beq	a0,a5,ffffffffc02005c6 <cons_putc+0x26>
ffffffffc02005b4:	4581                	li	a1,0
ffffffffc02005b6:	4601                	li	a2,0
ffffffffc02005b8:	4885                	li	a7,1
ffffffffc02005ba:	00000073          	ecall
ffffffffc02005be:	e315                	bnez	a4,ffffffffc02005e2 <cons_putc+0x42>
ffffffffc02005c0:	60e2                	ld	ra,24(sp)
ffffffffc02005c2:	6105                	addi	sp,sp,32
ffffffffc02005c4:	8082                	ret
ffffffffc02005c6:	4521                	li	a0,8
ffffffffc02005c8:	4581                	li	a1,0
ffffffffc02005ca:	4601                	li	a2,0
ffffffffc02005cc:	4885                	li	a7,1
ffffffffc02005ce:	00000073          	ecall
ffffffffc02005d2:	02000513          	li	a0,32
ffffffffc02005d6:	00000073          	ecall
ffffffffc02005da:	4521                	li	a0,8
ffffffffc02005dc:	00000073          	ecall
ffffffffc02005e0:	d365                	beqz	a4,ffffffffc02005c0 <cons_putc+0x20>
ffffffffc02005e2:	60e2                	ld	ra,24(sp)
ffffffffc02005e4:	6105                	addi	sp,sp,32
ffffffffc02005e6:	a559                	j	ffffffffc0200c6c <intr_enable>
ffffffffc02005e8:	e42a                	sd	a0,8(sp)
ffffffffc02005ea:	688000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02005ee:	6522                	ld	a0,8(sp)
ffffffffc02005f0:	4705                	li	a4,1
ffffffffc02005f2:	bf75                	j	ffffffffc02005ae <cons_putc+0xe>

ffffffffc02005f4 <cons_getc>:
ffffffffc02005f4:	1101                	addi	sp,sp,-32
ffffffffc02005f6:	ec06                	sd	ra,24(sp)
ffffffffc02005f8:	100027f3          	csrr	a5,sstatus
ffffffffc02005fc:	8b89                	andi	a5,a5,2
ffffffffc02005fe:	4801                	li	a6,0
ffffffffc0200600:	e3d5                	bnez	a5,ffffffffc02006a4 <cons_getc+0xb0>
ffffffffc0200602:	00091697          	auipc	a3,0x91
ffffffffc0200606:	e5e68693          	addi	a3,a3,-418 # ffffffffc0291460 <cons>
ffffffffc020060a:	07f00713          	li	a4,127
ffffffffc020060e:	20000313          	li	t1,512
ffffffffc0200612:	a021                	j	ffffffffc020061a <cons_getc+0x26>
ffffffffc0200614:	0ff57513          	zext.b	a0,a0
ffffffffc0200618:	ef91                	bnez	a5,ffffffffc0200634 <cons_getc+0x40>
ffffffffc020061a:	4501                	li	a0,0
ffffffffc020061c:	4581                	li	a1,0
ffffffffc020061e:	4601                	li	a2,0
ffffffffc0200620:	4889                	li	a7,2
ffffffffc0200622:	00000073          	ecall
ffffffffc0200626:	0005079b          	sext.w	a5,a0
ffffffffc020062a:	0207c763          	bltz	a5,ffffffffc0200658 <cons_getc+0x64>
ffffffffc020062e:	fee793e3          	bne	a5,a4,ffffffffc0200614 <cons_getc+0x20>
ffffffffc0200632:	4521                	li	a0,8
ffffffffc0200634:	2046a783          	lw	a5,516(a3)
ffffffffc0200638:	02079613          	slli	a2,a5,0x20
ffffffffc020063c:	9201                	srli	a2,a2,0x20
ffffffffc020063e:	2785                	addiw	a5,a5,1
ffffffffc0200640:	9636                	add	a2,a2,a3
ffffffffc0200642:	20f6a223          	sw	a5,516(a3)
ffffffffc0200646:	00a60023          	sb	a0,0(a2)
ffffffffc020064a:	fc6798e3          	bne	a5,t1,ffffffffc020061a <cons_getc+0x26>
ffffffffc020064e:	00091797          	auipc	a5,0x91
ffffffffc0200652:	0007ab23          	sw	zero,22(a5) # ffffffffc0291664 <cons+0x204>
ffffffffc0200656:	b7d1                	j	ffffffffc020061a <cons_getc+0x26>
ffffffffc0200658:	2006a783          	lw	a5,512(a3)
ffffffffc020065c:	2046a703          	lw	a4,516(a3)
ffffffffc0200660:	4501                	li	a0,0
ffffffffc0200662:	00f70f63          	beq	a4,a5,ffffffffc0200680 <cons_getc+0x8c>
ffffffffc0200666:	0017861b          	addiw	a2,a5,1
ffffffffc020066a:	1782                	slli	a5,a5,0x20
ffffffffc020066c:	9381                	srli	a5,a5,0x20
ffffffffc020066e:	97b6                	add	a5,a5,a3
ffffffffc0200670:	20c6a023          	sw	a2,512(a3)
ffffffffc0200674:	20000713          	li	a4,512
ffffffffc0200678:	0007c503          	lbu	a0,0(a5)
ffffffffc020067c:	00e60763          	beq	a2,a4,ffffffffc020068a <cons_getc+0x96>
ffffffffc0200680:	00081b63          	bnez	a6,ffffffffc0200696 <cons_getc+0xa2>
ffffffffc0200684:	60e2                	ld	ra,24(sp)
ffffffffc0200686:	6105                	addi	sp,sp,32
ffffffffc0200688:	8082                	ret
ffffffffc020068a:	00091797          	auipc	a5,0x91
ffffffffc020068e:	fc07ab23          	sw	zero,-42(a5) # ffffffffc0291660 <cons+0x200>
ffffffffc0200692:	fe0809e3          	beqz	a6,ffffffffc0200684 <cons_getc+0x90>
ffffffffc0200696:	e42a                	sd	a0,8(sp)
ffffffffc0200698:	5d4000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020069c:	60e2                	ld	ra,24(sp)
ffffffffc020069e:	6522                	ld	a0,8(sp)
ffffffffc02006a0:	6105                	addi	sp,sp,32
ffffffffc02006a2:	8082                	ret
ffffffffc02006a4:	5ce000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02006a8:	4805                	li	a6,1
ffffffffc02006aa:	bfa1                	j	ffffffffc0200602 <cons_getc+0xe>

ffffffffc02006ac <dtb_init>:
ffffffffc02006ac:	7119                	addi	sp,sp,-128
ffffffffc02006ae:	0000b517          	auipc	a0,0xb
ffffffffc02006b2:	52a50513          	addi	a0,a0,1322 # ffffffffc020bbd8 <commands+0xa8>
ffffffffc02006b6:	fc86                	sd	ra,120(sp)
ffffffffc02006b8:	f8a2                	sd	s0,112(sp)
ffffffffc02006ba:	e8d2                	sd	s4,80(sp)
ffffffffc02006bc:	f4a6                	sd	s1,104(sp)
ffffffffc02006be:	f0ca                	sd	s2,96(sp)
ffffffffc02006c0:	ecce                	sd	s3,88(sp)
ffffffffc02006c2:	e4d6                	sd	s5,72(sp)
ffffffffc02006c4:	e0da                	sd	s6,64(sp)
ffffffffc02006c6:	fc5e                	sd	s7,56(sp)
ffffffffc02006c8:	f862                	sd	s8,48(sp)
ffffffffc02006ca:	f466                	sd	s9,40(sp)
ffffffffc02006cc:	f06a                	sd	s10,32(sp)
ffffffffc02006ce:	ec6e                	sd	s11,24(sp)
ffffffffc02006d0:	ad7ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006d4:	00014597          	auipc	a1,0x14
ffffffffc02006d8:	92c5b583          	ld	a1,-1748(a1) # ffffffffc0214000 <boot_hartid>
ffffffffc02006dc:	0000b517          	auipc	a0,0xb
ffffffffc02006e0:	50c50513          	addi	a0,a0,1292 # ffffffffc020bbe8 <commands+0xb8>
ffffffffc02006e4:	ac3ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006e8:	00014417          	auipc	s0,0x14
ffffffffc02006ec:	92040413          	addi	s0,s0,-1760 # ffffffffc0214008 <boot_dtb>
ffffffffc02006f0:	600c                	ld	a1,0(s0)
ffffffffc02006f2:	0000b517          	auipc	a0,0xb
ffffffffc02006f6:	50650513          	addi	a0,a0,1286 # ffffffffc020bbf8 <commands+0xc8>
ffffffffc02006fa:	aadff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006fe:	00043a03          	ld	s4,0(s0)
ffffffffc0200702:	0000b517          	auipc	a0,0xb
ffffffffc0200706:	50e50513          	addi	a0,a0,1294 # ffffffffc020bc10 <commands+0xe0>
ffffffffc020070a:	120a0463          	beqz	s4,ffffffffc0200832 <dtb_init+0x186>
ffffffffc020070e:	57f5                	li	a5,-3
ffffffffc0200710:	07fa                	slli	a5,a5,0x1e
ffffffffc0200712:	00fa0733          	add	a4,s4,a5
ffffffffc0200716:	431c                	lw	a5,0(a4)
ffffffffc0200718:	00ff0637          	lui	a2,0xff0
ffffffffc020071c:	6b41                	lui	s6,0x10
ffffffffc020071e:	0087d59b          	srliw	a1,a5,0x8
ffffffffc0200722:	0187969b          	slliw	a3,a5,0x18
ffffffffc0200726:	0187d51b          	srliw	a0,a5,0x18
ffffffffc020072a:	0105959b          	slliw	a1,a1,0x10
ffffffffc020072e:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200732:	8df1                	and	a1,a1,a2
ffffffffc0200734:	8ec9                	or	a3,a3,a0
ffffffffc0200736:	0087979b          	slliw	a5,a5,0x8
ffffffffc020073a:	1b7d                	addi	s6,s6,-1
ffffffffc020073c:	0167f7b3          	and	a5,a5,s6
ffffffffc0200740:	8dd5                	or	a1,a1,a3
ffffffffc0200742:	8ddd                	or	a1,a1,a5
ffffffffc0200744:	d00e07b7          	lui	a5,0xd00e0
ffffffffc0200748:	2581                	sext.w	a1,a1
ffffffffc020074a:	eed78793          	addi	a5,a5,-275 # ffffffffd00dfeed <end+0xfe495dd>
ffffffffc020074e:	10f59163          	bne	a1,a5,ffffffffc0200850 <dtb_init+0x1a4>
ffffffffc0200752:	471c                	lw	a5,8(a4)
ffffffffc0200754:	4754                	lw	a3,12(a4)
ffffffffc0200756:	4c81                	li	s9,0
ffffffffc0200758:	0087d59b          	srliw	a1,a5,0x8
ffffffffc020075c:	0086d51b          	srliw	a0,a3,0x8
ffffffffc0200760:	0186941b          	slliw	s0,a3,0x18
ffffffffc0200764:	0186d89b          	srliw	a7,a3,0x18
ffffffffc0200768:	01879a1b          	slliw	s4,a5,0x18
ffffffffc020076c:	0187d81b          	srliw	a6,a5,0x18
ffffffffc0200770:	0105151b          	slliw	a0,a0,0x10
ffffffffc0200774:	0106d69b          	srliw	a3,a3,0x10
ffffffffc0200778:	0105959b          	slliw	a1,a1,0x10
ffffffffc020077c:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200780:	8d71                	and	a0,a0,a2
ffffffffc0200782:	01146433          	or	s0,s0,a7
ffffffffc0200786:	0086969b          	slliw	a3,a3,0x8
ffffffffc020078a:	010a6a33          	or	s4,s4,a6
ffffffffc020078e:	8e6d                	and	a2,a2,a1
ffffffffc0200790:	0087979b          	slliw	a5,a5,0x8
ffffffffc0200794:	8c49                	or	s0,s0,a0
ffffffffc0200796:	0166f6b3          	and	a3,a3,s6
ffffffffc020079a:	00ca6a33          	or	s4,s4,a2
ffffffffc020079e:	0167f7b3          	and	a5,a5,s6
ffffffffc02007a2:	8c55                	or	s0,s0,a3
ffffffffc02007a4:	00fa6a33          	or	s4,s4,a5
ffffffffc02007a8:	1402                	slli	s0,s0,0x20
ffffffffc02007aa:	1a02                	slli	s4,s4,0x20
ffffffffc02007ac:	9001                	srli	s0,s0,0x20
ffffffffc02007ae:	020a5a13          	srli	s4,s4,0x20
ffffffffc02007b2:	943a                	add	s0,s0,a4
ffffffffc02007b4:	9a3a                	add	s4,s4,a4
ffffffffc02007b6:	00ff0c37          	lui	s8,0xff0
ffffffffc02007ba:	4b8d                	li	s7,3
ffffffffc02007bc:	0000b917          	auipc	s2,0xb
ffffffffc02007c0:	4a490913          	addi	s2,s2,1188 # ffffffffc020bc60 <commands+0x130>
ffffffffc02007c4:	49bd                	li	s3,15
ffffffffc02007c6:	4d91                	li	s11,4
ffffffffc02007c8:	4d05                	li	s10,1
ffffffffc02007ca:	0000b497          	auipc	s1,0xb
ffffffffc02007ce:	48e48493          	addi	s1,s1,1166 # ffffffffc020bc58 <commands+0x128>
ffffffffc02007d2:	000a2703          	lw	a4,0(s4)
ffffffffc02007d6:	004a0a93          	addi	s5,s4,4
ffffffffc02007da:	0087569b          	srliw	a3,a4,0x8
ffffffffc02007de:	0187179b          	slliw	a5,a4,0x18
ffffffffc02007e2:	0187561b          	srliw	a2,a4,0x18
ffffffffc02007e6:	0106969b          	slliw	a3,a3,0x10
ffffffffc02007ea:	0107571b          	srliw	a4,a4,0x10
ffffffffc02007ee:	8fd1                	or	a5,a5,a2
ffffffffc02007f0:	0186f6b3          	and	a3,a3,s8
ffffffffc02007f4:	0087171b          	slliw	a4,a4,0x8
ffffffffc02007f8:	8fd5                	or	a5,a5,a3
ffffffffc02007fa:	00eb7733          	and	a4,s6,a4
ffffffffc02007fe:	8fd9                	or	a5,a5,a4
ffffffffc0200800:	2781                	sext.w	a5,a5
ffffffffc0200802:	09778c63          	beq	a5,s7,ffffffffc020089a <dtb_init+0x1ee>
ffffffffc0200806:	00fbea63          	bltu	s7,a5,ffffffffc020081a <dtb_init+0x16e>
ffffffffc020080a:	07a78663          	beq	a5,s10,ffffffffc0200876 <dtb_init+0x1ca>
ffffffffc020080e:	4709                	li	a4,2
ffffffffc0200810:	00e79763          	bne	a5,a4,ffffffffc020081e <dtb_init+0x172>
ffffffffc0200814:	4c81                	li	s9,0
ffffffffc0200816:	8a56                	mv	s4,s5
ffffffffc0200818:	bf6d                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc020081a:	ffb78ee3          	beq	a5,s11,ffffffffc0200816 <dtb_init+0x16a>
ffffffffc020081e:	0000b517          	auipc	a0,0xb
ffffffffc0200822:	4ba50513          	addi	a0,a0,1210 # ffffffffc020bcd8 <commands+0x1a8>
ffffffffc0200826:	981ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020082a:	0000b517          	auipc	a0,0xb
ffffffffc020082e:	4e650513          	addi	a0,a0,1254 # ffffffffc020bd10 <commands+0x1e0>
ffffffffc0200832:	7446                	ld	s0,112(sp)
ffffffffc0200834:	70e6                	ld	ra,120(sp)
ffffffffc0200836:	74a6                	ld	s1,104(sp)
ffffffffc0200838:	7906                	ld	s2,96(sp)
ffffffffc020083a:	69e6                	ld	s3,88(sp)
ffffffffc020083c:	6a46                	ld	s4,80(sp)
ffffffffc020083e:	6aa6                	ld	s5,72(sp)
ffffffffc0200840:	6b06                	ld	s6,64(sp)
ffffffffc0200842:	7be2                	ld	s7,56(sp)
ffffffffc0200844:	7c42                	ld	s8,48(sp)
ffffffffc0200846:	7ca2                	ld	s9,40(sp)
ffffffffc0200848:	7d02                	ld	s10,32(sp)
ffffffffc020084a:	6de2                	ld	s11,24(sp)
ffffffffc020084c:	6109                	addi	sp,sp,128
ffffffffc020084e:	baa1                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200850:	7446                	ld	s0,112(sp)
ffffffffc0200852:	70e6                	ld	ra,120(sp)
ffffffffc0200854:	74a6                	ld	s1,104(sp)
ffffffffc0200856:	7906                	ld	s2,96(sp)
ffffffffc0200858:	69e6                	ld	s3,88(sp)
ffffffffc020085a:	6a46                	ld	s4,80(sp)
ffffffffc020085c:	6aa6                	ld	s5,72(sp)
ffffffffc020085e:	6b06                	ld	s6,64(sp)
ffffffffc0200860:	7be2                	ld	s7,56(sp)
ffffffffc0200862:	7c42                	ld	s8,48(sp)
ffffffffc0200864:	7ca2                	ld	s9,40(sp)
ffffffffc0200866:	7d02                	ld	s10,32(sp)
ffffffffc0200868:	6de2                	ld	s11,24(sp)
ffffffffc020086a:	0000b517          	auipc	a0,0xb
ffffffffc020086e:	3c650513          	addi	a0,a0,966 # ffffffffc020bc30 <commands+0x100>
ffffffffc0200872:	6109                	addi	sp,sp,128
ffffffffc0200874:	ba0d                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200876:	8556                	mv	a0,s5
ffffffffc0200878:	7410a0ef          	jal	ra,ffffffffc020b7b8 <strlen>
ffffffffc020087c:	8a2a                	mv	s4,a0
ffffffffc020087e:	4619                	li	a2,6
ffffffffc0200880:	85a6                	mv	a1,s1
ffffffffc0200882:	8556                	mv	a0,s5
ffffffffc0200884:	2a01                	sext.w	s4,s4
ffffffffc0200886:	7990a0ef          	jal	ra,ffffffffc020b81e <strncmp>
ffffffffc020088a:	e111                	bnez	a0,ffffffffc020088e <dtb_init+0x1e2>
ffffffffc020088c:	4c85                	li	s9,1
ffffffffc020088e:	0a91                	addi	s5,s5,4
ffffffffc0200890:	9ad2                	add	s5,s5,s4
ffffffffc0200892:	ffcafa93          	andi	s5,s5,-4
ffffffffc0200896:	8a56                	mv	s4,s5
ffffffffc0200898:	bf2d                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc020089a:	004a2783          	lw	a5,4(s4)
ffffffffc020089e:	00ca0693          	addi	a3,s4,12
ffffffffc02008a2:	0087d71b          	srliw	a4,a5,0x8
ffffffffc02008a6:	01879a9b          	slliw	s5,a5,0x18
ffffffffc02008aa:	0187d61b          	srliw	a2,a5,0x18
ffffffffc02008ae:	0107171b          	slliw	a4,a4,0x10
ffffffffc02008b2:	0107d79b          	srliw	a5,a5,0x10
ffffffffc02008b6:	00caeab3          	or	s5,s5,a2
ffffffffc02008ba:	01877733          	and	a4,a4,s8
ffffffffc02008be:	0087979b          	slliw	a5,a5,0x8
ffffffffc02008c2:	00eaeab3          	or	s5,s5,a4
ffffffffc02008c6:	00fb77b3          	and	a5,s6,a5
ffffffffc02008ca:	00faeab3          	or	s5,s5,a5
ffffffffc02008ce:	2a81                	sext.w	s5,s5
ffffffffc02008d0:	000c9c63          	bnez	s9,ffffffffc02008e8 <dtb_init+0x23c>
ffffffffc02008d4:	1a82                	slli	s5,s5,0x20
ffffffffc02008d6:	00368793          	addi	a5,a3,3
ffffffffc02008da:	020ada93          	srli	s5,s5,0x20
ffffffffc02008de:	9abe                	add	s5,s5,a5
ffffffffc02008e0:	ffcafa93          	andi	s5,s5,-4
ffffffffc02008e4:	8a56                	mv	s4,s5
ffffffffc02008e6:	b5f5                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc02008e8:	008a2783          	lw	a5,8(s4)
ffffffffc02008ec:	85ca                	mv	a1,s2
ffffffffc02008ee:	e436                	sd	a3,8(sp)
ffffffffc02008f0:	0087d51b          	srliw	a0,a5,0x8
ffffffffc02008f4:	0187d61b          	srliw	a2,a5,0x18
ffffffffc02008f8:	0187971b          	slliw	a4,a5,0x18
ffffffffc02008fc:	0105151b          	slliw	a0,a0,0x10
ffffffffc0200900:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200904:	8f51                	or	a4,a4,a2
ffffffffc0200906:	01857533          	and	a0,a0,s8
ffffffffc020090a:	0087979b          	slliw	a5,a5,0x8
ffffffffc020090e:	8d59                	or	a0,a0,a4
ffffffffc0200910:	00fb77b3          	and	a5,s6,a5
ffffffffc0200914:	8d5d                	or	a0,a0,a5
ffffffffc0200916:	1502                	slli	a0,a0,0x20
ffffffffc0200918:	9101                	srli	a0,a0,0x20
ffffffffc020091a:	9522                	add	a0,a0,s0
ffffffffc020091c:	6e50a0ef          	jal	ra,ffffffffc020b800 <strcmp>
ffffffffc0200920:	66a2                	ld	a3,8(sp)
ffffffffc0200922:	f94d                	bnez	a0,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200924:	fb59f8e3          	bgeu	s3,s5,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200928:	00ca3783          	ld	a5,12(s4)
ffffffffc020092c:	014a3703          	ld	a4,20(s4)
ffffffffc0200930:	0000b517          	auipc	a0,0xb
ffffffffc0200934:	33850513          	addi	a0,a0,824 # ffffffffc020bc68 <commands+0x138>
ffffffffc0200938:	4207d613          	srai	a2,a5,0x20
ffffffffc020093c:	0087d31b          	srliw	t1,a5,0x8
ffffffffc0200940:	42075593          	srai	a1,a4,0x20
ffffffffc0200944:	0187de1b          	srliw	t3,a5,0x18
ffffffffc0200948:	0186581b          	srliw	a6,a2,0x18
ffffffffc020094c:	0187941b          	slliw	s0,a5,0x18
ffffffffc0200950:	0107d89b          	srliw	a7,a5,0x10
ffffffffc0200954:	0187d693          	srli	a3,a5,0x18
ffffffffc0200958:	01861f1b          	slliw	t5,a2,0x18
ffffffffc020095c:	0087579b          	srliw	a5,a4,0x8
ffffffffc0200960:	0103131b          	slliw	t1,t1,0x10
ffffffffc0200964:	0106561b          	srliw	a2,a2,0x10
ffffffffc0200968:	010f6f33          	or	t5,t5,a6
ffffffffc020096c:	0187529b          	srliw	t0,a4,0x18
ffffffffc0200970:	0185df9b          	srliw	t6,a1,0x18
ffffffffc0200974:	01837333          	and	t1,t1,s8
ffffffffc0200978:	01c46433          	or	s0,s0,t3
ffffffffc020097c:	0186f6b3          	and	a3,a3,s8
ffffffffc0200980:	01859e1b          	slliw	t3,a1,0x18
ffffffffc0200984:	01871e9b          	slliw	t4,a4,0x18
ffffffffc0200988:	0107581b          	srliw	a6,a4,0x10
ffffffffc020098c:	0086161b          	slliw	a2,a2,0x8
ffffffffc0200990:	8361                	srli	a4,a4,0x18
ffffffffc0200992:	0107979b          	slliw	a5,a5,0x10
ffffffffc0200996:	0105d59b          	srliw	a1,a1,0x10
ffffffffc020099a:	01e6e6b3          	or	a3,a3,t5
ffffffffc020099e:	00cb7633          	and	a2,s6,a2
ffffffffc02009a2:	0088181b          	slliw	a6,a6,0x8
ffffffffc02009a6:	0085959b          	slliw	a1,a1,0x8
ffffffffc02009aa:	00646433          	or	s0,s0,t1
ffffffffc02009ae:	0187f7b3          	and	a5,a5,s8
ffffffffc02009b2:	01fe6333          	or	t1,t3,t6
ffffffffc02009b6:	01877c33          	and	s8,a4,s8
ffffffffc02009ba:	0088989b          	slliw	a7,a7,0x8
ffffffffc02009be:	011b78b3          	and	a7,s6,a7
ffffffffc02009c2:	005eeeb3          	or	t4,t4,t0
ffffffffc02009c6:	00c6e733          	or	a4,a3,a2
ffffffffc02009ca:	006c6c33          	or	s8,s8,t1
ffffffffc02009ce:	010b76b3          	and	a3,s6,a6
ffffffffc02009d2:	00bb7b33          	and	s6,s6,a1
ffffffffc02009d6:	01d7e7b3          	or	a5,a5,t4
ffffffffc02009da:	016c6b33          	or	s6,s8,s6
ffffffffc02009de:	01146433          	or	s0,s0,a7
ffffffffc02009e2:	8fd5                	or	a5,a5,a3
ffffffffc02009e4:	1702                	slli	a4,a4,0x20
ffffffffc02009e6:	1b02                	slli	s6,s6,0x20
ffffffffc02009e8:	1782                	slli	a5,a5,0x20
ffffffffc02009ea:	9301                	srli	a4,a4,0x20
ffffffffc02009ec:	1402                	slli	s0,s0,0x20
ffffffffc02009ee:	020b5b13          	srli	s6,s6,0x20
ffffffffc02009f2:	0167eb33          	or	s6,a5,s6
ffffffffc02009f6:	8c59                	or	s0,s0,a4
ffffffffc02009f8:	faeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02009fc:	85a2                	mv	a1,s0
ffffffffc02009fe:	0000b517          	auipc	a0,0xb
ffffffffc0200a02:	28a50513          	addi	a0,a0,650 # ffffffffc020bc88 <commands+0x158>
ffffffffc0200a06:	fa0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a0a:	014b5613          	srli	a2,s6,0x14
ffffffffc0200a0e:	85da                	mv	a1,s6
ffffffffc0200a10:	0000b517          	auipc	a0,0xb
ffffffffc0200a14:	29050513          	addi	a0,a0,656 # ffffffffc020bca0 <commands+0x170>
ffffffffc0200a18:	f8eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a1c:	008b05b3          	add	a1,s6,s0
ffffffffc0200a20:	15fd                	addi	a1,a1,-1
ffffffffc0200a22:	0000b517          	auipc	a0,0xb
ffffffffc0200a26:	29e50513          	addi	a0,a0,670 # ffffffffc020bcc0 <commands+0x190>
ffffffffc0200a2a:	f7cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a2e:	0000b517          	auipc	a0,0xb
ffffffffc0200a32:	2e250513          	addi	a0,a0,738 # ffffffffc020bd10 <commands+0x1e0>
ffffffffc0200a36:	00096797          	auipc	a5,0x96
ffffffffc0200a3a:	e487b123          	sd	s0,-446(a5) # ffffffffc0296878 <memory_base>
ffffffffc0200a3e:	00096797          	auipc	a5,0x96
ffffffffc0200a42:	e567b123          	sd	s6,-446(a5) # ffffffffc0296880 <memory_size>
ffffffffc0200a46:	b3f5                	j	ffffffffc0200832 <dtb_init+0x186>

ffffffffc0200a48 <get_memory_base>:
ffffffffc0200a48:	00096517          	auipc	a0,0x96
ffffffffc0200a4c:	e3053503          	ld	a0,-464(a0) # ffffffffc0296878 <memory_base>
ffffffffc0200a50:	8082                	ret

ffffffffc0200a52 <get_memory_size>:
ffffffffc0200a52:	00096517          	auipc	a0,0x96
ffffffffc0200a56:	e2e53503          	ld	a0,-466(a0) # ffffffffc0296880 <memory_size>
ffffffffc0200a5a:	8082                	ret

ffffffffc0200a5c <ide_init>:
ffffffffc0200a5c:	1141                	addi	sp,sp,-16
ffffffffc0200a5e:	00091597          	auipc	a1,0x91
ffffffffc0200a62:	c5a58593          	addi	a1,a1,-934 # ffffffffc02916b8 <ide_devices+0x50>
ffffffffc0200a66:	4505                	li	a0,1
ffffffffc0200a68:	e022                	sd	s0,0(sp)
ffffffffc0200a6a:	00091797          	auipc	a5,0x91
ffffffffc0200a6e:	be07af23          	sw	zero,-1026(a5) # ffffffffc0291668 <ide_devices>
ffffffffc0200a72:	00091797          	auipc	a5,0x91
ffffffffc0200a76:	c407a323          	sw	zero,-954(a5) # ffffffffc02916b8 <ide_devices+0x50>
ffffffffc0200a7a:	00091797          	auipc	a5,0x91
ffffffffc0200a7e:	c807a723          	sw	zero,-882(a5) # ffffffffc0291708 <ide_devices+0xa0>
ffffffffc0200a82:	00091797          	auipc	a5,0x91
ffffffffc0200a86:	cc07ab23          	sw	zero,-810(a5) # ffffffffc0291758 <ide_devices+0xf0>
ffffffffc0200a8a:	e406                	sd	ra,8(sp)
ffffffffc0200a8c:	00091417          	auipc	s0,0x91
ffffffffc0200a90:	bdc40413          	addi	s0,s0,-1060 # ffffffffc0291668 <ide_devices>
ffffffffc0200a94:	23a000ef          	jal	ra,ffffffffc0200cce <ramdisk_init>
ffffffffc0200a98:	483c                	lw	a5,80(s0)
ffffffffc0200a9a:	cf99                	beqz	a5,ffffffffc0200ab8 <ide_init+0x5c>
ffffffffc0200a9c:	00091597          	auipc	a1,0x91
ffffffffc0200aa0:	c6c58593          	addi	a1,a1,-916 # ffffffffc0291708 <ide_devices+0xa0>
ffffffffc0200aa4:	4509                	li	a0,2
ffffffffc0200aa6:	228000ef          	jal	ra,ffffffffc0200cce <ramdisk_init>
ffffffffc0200aaa:	0a042783          	lw	a5,160(s0)
ffffffffc0200aae:	c785                	beqz	a5,ffffffffc0200ad6 <ide_init+0x7a>
ffffffffc0200ab0:	60a2                	ld	ra,8(sp)
ffffffffc0200ab2:	6402                	ld	s0,0(sp)
ffffffffc0200ab4:	0141                	addi	sp,sp,16
ffffffffc0200ab6:	8082                	ret
ffffffffc0200ab8:	0000b697          	auipc	a3,0xb
ffffffffc0200abc:	27068693          	addi	a3,a3,624 # ffffffffc020bd28 <commands+0x1f8>
ffffffffc0200ac0:	0000b617          	auipc	a2,0xb
ffffffffc0200ac4:	28060613          	addi	a2,a2,640 # ffffffffc020bd40 <commands+0x210>
ffffffffc0200ac8:	45c5                	li	a1,17
ffffffffc0200aca:	0000b517          	auipc	a0,0xb
ffffffffc0200ace:	28e50513          	addi	a0,a0,654 # ffffffffc020bd58 <commands+0x228>
ffffffffc0200ad2:	9cdff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200ad6:	0000b697          	auipc	a3,0xb
ffffffffc0200ada:	29a68693          	addi	a3,a3,666 # ffffffffc020bd70 <commands+0x240>
ffffffffc0200ade:	0000b617          	auipc	a2,0xb
ffffffffc0200ae2:	26260613          	addi	a2,a2,610 # ffffffffc020bd40 <commands+0x210>
ffffffffc0200ae6:	45d1                	li	a1,20
ffffffffc0200ae8:	0000b517          	auipc	a0,0xb
ffffffffc0200aec:	27050513          	addi	a0,a0,624 # ffffffffc020bd58 <commands+0x228>
ffffffffc0200af0:	9afff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200af4 <ide_device_valid>:
ffffffffc0200af4:	478d                	li	a5,3
ffffffffc0200af6:	00a7ef63          	bltu	a5,a0,ffffffffc0200b14 <ide_device_valid+0x20>
ffffffffc0200afa:	00251793          	slli	a5,a0,0x2
ffffffffc0200afe:	953e                	add	a0,a0,a5
ffffffffc0200b00:	0512                	slli	a0,a0,0x4
ffffffffc0200b02:	00091797          	auipc	a5,0x91
ffffffffc0200b06:	b6678793          	addi	a5,a5,-1178 # ffffffffc0291668 <ide_devices>
ffffffffc0200b0a:	953e                	add	a0,a0,a5
ffffffffc0200b0c:	4108                	lw	a0,0(a0)
ffffffffc0200b0e:	00a03533          	snez	a0,a0
ffffffffc0200b12:	8082                	ret
ffffffffc0200b14:	4501                	li	a0,0
ffffffffc0200b16:	8082                	ret

ffffffffc0200b18 <ide_device_size>:
ffffffffc0200b18:	478d                	li	a5,3
ffffffffc0200b1a:	02a7e163          	bltu	a5,a0,ffffffffc0200b3c <ide_device_size+0x24>
ffffffffc0200b1e:	00251793          	slli	a5,a0,0x2
ffffffffc0200b22:	953e                	add	a0,a0,a5
ffffffffc0200b24:	0512                	slli	a0,a0,0x4
ffffffffc0200b26:	00091797          	auipc	a5,0x91
ffffffffc0200b2a:	b4278793          	addi	a5,a5,-1214 # ffffffffc0291668 <ide_devices>
ffffffffc0200b2e:	97aa                	add	a5,a5,a0
ffffffffc0200b30:	4398                	lw	a4,0(a5)
ffffffffc0200b32:	4501                	li	a0,0
ffffffffc0200b34:	c709                	beqz	a4,ffffffffc0200b3e <ide_device_size+0x26>
ffffffffc0200b36:	0087e503          	lwu	a0,8(a5)
ffffffffc0200b3a:	8082                	ret
ffffffffc0200b3c:	4501                	li	a0,0
ffffffffc0200b3e:	8082                	ret

ffffffffc0200b40 <ide_read_secs>:
ffffffffc0200b40:	1141                	addi	sp,sp,-16
ffffffffc0200b42:	e406                	sd	ra,8(sp)
ffffffffc0200b44:	08000793          	li	a5,128
ffffffffc0200b48:	04d7e763          	bltu	a5,a3,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b4c:	478d                	li	a5,3
ffffffffc0200b4e:	0005081b          	sext.w	a6,a0
ffffffffc0200b52:	04a7e263          	bltu	a5,a0,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b56:	00281793          	slli	a5,a6,0x2
ffffffffc0200b5a:	97c2                	add	a5,a5,a6
ffffffffc0200b5c:	0792                	slli	a5,a5,0x4
ffffffffc0200b5e:	00091817          	auipc	a6,0x91
ffffffffc0200b62:	b0a80813          	addi	a6,a6,-1270 # ffffffffc0291668 <ide_devices>
ffffffffc0200b66:	97c2                	add	a5,a5,a6
ffffffffc0200b68:	0007a883          	lw	a7,0(a5)
ffffffffc0200b6c:	02088563          	beqz	a7,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b70:	100008b7          	lui	a7,0x10000
ffffffffc0200b74:	0515f163          	bgeu	a1,a7,ffffffffc0200bb6 <ide_read_secs+0x76>
ffffffffc0200b78:	1582                	slli	a1,a1,0x20
ffffffffc0200b7a:	9181                	srli	a1,a1,0x20
ffffffffc0200b7c:	00d58733          	add	a4,a1,a3
ffffffffc0200b80:	02e8eb63          	bltu	a7,a4,ffffffffc0200bb6 <ide_read_secs+0x76>
ffffffffc0200b84:	00251713          	slli	a4,a0,0x2
ffffffffc0200b88:	60a2                	ld	ra,8(sp)
ffffffffc0200b8a:	63bc                	ld	a5,64(a5)
ffffffffc0200b8c:	953a                	add	a0,a0,a4
ffffffffc0200b8e:	0512                	slli	a0,a0,0x4
ffffffffc0200b90:	9542                	add	a0,a0,a6
ffffffffc0200b92:	0141                	addi	sp,sp,16
ffffffffc0200b94:	8782                	jr	a5
ffffffffc0200b96:	0000b697          	auipc	a3,0xb
ffffffffc0200b9a:	1f268693          	addi	a3,a3,498 # ffffffffc020bd88 <commands+0x258>
ffffffffc0200b9e:	0000b617          	auipc	a2,0xb
ffffffffc0200ba2:	1a260613          	addi	a2,a2,418 # ffffffffc020bd40 <commands+0x210>
ffffffffc0200ba6:	02200593          	li	a1,34
ffffffffc0200baa:	0000b517          	auipc	a0,0xb
ffffffffc0200bae:	1ae50513          	addi	a0,a0,430 # ffffffffc020bd58 <commands+0x228>
ffffffffc0200bb2:	8edff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200bb6:	0000b697          	auipc	a3,0xb
ffffffffc0200bba:	1fa68693          	addi	a3,a3,506 # ffffffffc020bdb0 <commands+0x280>
ffffffffc0200bbe:	0000b617          	auipc	a2,0xb
ffffffffc0200bc2:	18260613          	addi	a2,a2,386 # ffffffffc020bd40 <commands+0x210>
ffffffffc0200bc6:	02300593          	li	a1,35
ffffffffc0200bca:	0000b517          	auipc	a0,0xb
ffffffffc0200bce:	18e50513          	addi	a0,a0,398 # ffffffffc020bd58 <commands+0x228>
ffffffffc0200bd2:	8cdff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200bd6 <ide_write_secs>:
ffffffffc0200bd6:	1141                	addi	sp,sp,-16
ffffffffc0200bd8:	e406                	sd	ra,8(sp)
ffffffffc0200bda:	08000793          	li	a5,128
ffffffffc0200bde:	04d7e763          	bltu	a5,a3,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200be2:	478d                	li	a5,3
ffffffffc0200be4:	0005081b          	sext.w	a6,a0
ffffffffc0200be8:	04a7e263          	bltu	a5,a0,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200bec:	00281793          	slli	a5,a6,0x2
ffffffffc0200bf0:	97c2                	add	a5,a5,a6
ffffffffc0200bf2:	0792                	slli	a5,a5,0x4
ffffffffc0200bf4:	00091817          	auipc	a6,0x91
ffffffffc0200bf8:	a7480813          	addi	a6,a6,-1420 # ffffffffc0291668 <ide_devices>
ffffffffc0200bfc:	97c2                	add	a5,a5,a6
ffffffffc0200bfe:	0007a883          	lw	a7,0(a5)
ffffffffc0200c02:	02088563          	beqz	a7,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200c06:	100008b7          	lui	a7,0x10000
ffffffffc0200c0a:	0515f163          	bgeu	a1,a7,ffffffffc0200c4c <ide_write_secs+0x76>
ffffffffc0200c0e:	1582                	slli	a1,a1,0x20
ffffffffc0200c10:	9181                	srli	a1,a1,0x20
ffffffffc0200c12:	00d58733          	add	a4,a1,a3
ffffffffc0200c16:	02e8eb63          	bltu	a7,a4,ffffffffc0200c4c <ide_write_secs+0x76>
ffffffffc0200c1a:	00251713          	slli	a4,a0,0x2
ffffffffc0200c1e:	60a2                	ld	ra,8(sp)
ffffffffc0200c20:	67bc                	ld	a5,72(a5)
ffffffffc0200c22:	953a                	add	a0,a0,a4
ffffffffc0200c24:	0512                	slli	a0,a0,0x4
ffffffffc0200c26:	9542                	add	a0,a0,a6
ffffffffc0200c28:	0141                	addi	sp,sp,16
ffffffffc0200c2a:	8782                	jr	a5
ffffffffc0200c2c:	0000b697          	auipc	a3,0xb
ffffffffc0200c30:	15c68693          	addi	a3,a3,348 # ffffffffc020bd88 <commands+0x258>
ffffffffc0200c34:	0000b617          	auipc	a2,0xb
ffffffffc0200c38:	10c60613          	addi	a2,a2,268 # ffffffffc020bd40 <commands+0x210>
ffffffffc0200c3c:	02900593          	li	a1,41
ffffffffc0200c40:	0000b517          	auipc	a0,0xb
ffffffffc0200c44:	11850513          	addi	a0,a0,280 # ffffffffc020bd58 <commands+0x228>
ffffffffc0200c48:	857ff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200c4c:	0000b697          	auipc	a3,0xb
ffffffffc0200c50:	16468693          	addi	a3,a3,356 # ffffffffc020bdb0 <commands+0x280>
ffffffffc0200c54:	0000b617          	auipc	a2,0xb
ffffffffc0200c58:	0ec60613          	addi	a2,a2,236 # ffffffffc020bd40 <commands+0x210>
ffffffffc0200c5c:	02a00593          	li	a1,42
ffffffffc0200c60:	0000b517          	auipc	a0,0xb
ffffffffc0200c64:	0f850513          	addi	a0,a0,248 # ffffffffc020bd58 <commands+0x228>
ffffffffc0200c68:	837ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200c6c <intr_enable>:
ffffffffc0200c6c:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc0200c70:	8082                	ret

ffffffffc0200c72 <intr_disable>:
ffffffffc0200c72:	100177f3          	csrrci	a5,sstatus,2
ffffffffc0200c76:	8082                	ret

ffffffffc0200c78 <pic_init>:
ffffffffc0200c78:	8082                	ret

ffffffffc0200c7a <ramdisk_write>:
ffffffffc0200c7a:	00856703          	lwu	a4,8(a0)
ffffffffc0200c7e:	1141                	addi	sp,sp,-16
ffffffffc0200c80:	e406                	sd	ra,8(sp)
ffffffffc0200c82:	8f0d                	sub	a4,a4,a1
ffffffffc0200c84:	87ae                	mv	a5,a1
ffffffffc0200c86:	85b2                	mv	a1,a2
ffffffffc0200c88:	00e6f363          	bgeu	a3,a4,ffffffffc0200c8e <ramdisk_write+0x14>
ffffffffc0200c8c:	8736                	mv	a4,a3
ffffffffc0200c8e:	6908                	ld	a0,16(a0)
ffffffffc0200c90:	07a6                	slli	a5,a5,0x9
ffffffffc0200c92:	00971613          	slli	a2,a4,0x9
ffffffffc0200c96:	953e                	add	a0,a0,a5
ffffffffc0200c98:	4150a0ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc0200c9c:	60a2                	ld	ra,8(sp)
ffffffffc0200c9e:	4501                	li	a0,0
ffffffffc0200ca0:	0141                	addi	sp,sp,16
ffffffffc0200ca2:	8082                	ret

ffffffffc0200ca4 <ramdisk_read>:
ffffffffc0200ca4:	00856783          	lwu	a5,8(a0)
ffffffffc0200ca8:	1141                	addi	sp,sp,-16
ffffffffc0200caa:	e406                	sd	ra,8(sp)
ffffffffc0200cac:	8f8d                	sub	a5,a5,a1
ffffffffc0200cae:	872a                	mv	a4,a0
ffffffffc0200cb0:	8532                	mv	a0,a2
ffffffffc0200cb2:	00f6f363          	bgeu	a3,a5,ffffffffc0200cb8 <ramdisk_read+0x14>
ffffffffc0200cb6:	87b6                	mv	a5,a3
ffffffffc0200cb8:	6b18                	ld	a4,16(a4)
ffffffffc0200cba:	05a6                	slli	a1,a1,0x9
ffffffffc0200cbc:	00979613          	slli	a2,a5,0x9
ffffffffc0200cc0:	95ba                	add	a1,a1,a4
ffffffffc0200cc2:	3eb0a0ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc0200cc6:	60a2                	ld	ra,8(sp)
ffffffffc0200cc8:	4501                	li	a0,0
ffffffffc0200cca:	0141                	addi	sp,sp,16
ffffffffc0200ccc:	8082                	ret

ffffffffc0200cce <ramdisk_init>:
ffffffffc0200cce:	1101                	addi	sp,sp,-32
ffffffffc0200cd0:	e822                	sd	s0,16(sp)
ffffffffc0200cd2:	842e                	mv	s0,a1
ffffffffc0200cd4:	e426                	sd	s1,8(sp)
ffffffffc0200cd6:	05000613          	li	a2,80
ffffffffc0200cda:	84aa                	mv	s1,a0
ffffffffc0200cdc:	4581                	li	a1,0
ffffffffc0200cde:	8522                	mv	a0,s0
ffffffffc0200ce0:	ec06                	sd	ra,24(sp)
ffffffffc0200ce2:	e04a                	sd	s2,0(sp)
ffffffffc0200ce4:	3770a0ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0200ce8:	4785                	li	a5,1
ffffffffc0200cea:	06f48b63          	beq	s1,a5,ffffffffc0200d60 <ramdisk_init+0x92>
ffffffffc0200cee:	4789                	li	a5,2
ffffffffc0200cf0:	00090617          	auipc	a2,0x90
ffffffffc0200cf4:	32060613          	addi	a2,a2,800 # ffffffffc0291010 <arena>
ffffffffc0200cf8:	0001b917          	auipc	s2,0x1b
ffffffffc0200cfc:	01890913          	addi	s2,s2,24 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200d00:	08f49563          	bne	s1,a5,ffffffffc0200d8a <ramdisk_init+0xbc>
ffffffffc0200d04:	06c90863          	beq	s2,a2,ffffffffc0200d74 <ramdisk_init+0xa6>
ffffffffc0200d08:	412604b3          	sub	s1,a2,s2
ffffffffc0200d0c:	86a6                	mv	a3,s1
ffffffffc0200d0e:	85ca                	mv	a1,s2
ffffffffc0200d10:	167d                	addi	a2,a2,-1
ffffffffc0200d12:	0000b517          	auipc	a0,0xb
ffffffffc0200d16:	0f650513          	addi	a0,a0,246 # ffffffffc020be08 <commands+0x2d8>
ffffffffc0200d1a:	c8cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200d1e:	57fd                	li	a5,-1
ffffffffc0200d20:	1782                	slli	a5,a5,0x20
ffffffffc0200d22:	0785                	addi	a5,a5,1
ffffffffc0200d24:	0094d49b          	srliw	s1,s1,0x9
ffffffffc0200d28:	e01c                	sd	a5,0(s0)
ffffffffc0200d2a:	c404                	sw	s1,8(s0)
ffffffffc0200d2c:	01243823          	sd	s2,16(s0)
ffffffffc0200d30:	02040513          	addi	a0,s0,32
ffffffffc0200d34:	0000b597          	auipc	a1,0xb
ffffffffc0200d38:	12c58593          	addi	a1,a1,300 # ffffffffc020be60 <commands+0x330>
ffffffffc0200d3c:	2b30a0ef          	jal	ra,ffffffffc020b7ee <strcpy>
ffffffffc0200d40:	00000797          	auipc	a5,0x0
ffffffffc0200d44:	f6478793          	addi	a5,a5,-156 # ffffffffc0200ca4 <ramdisk_read>
ffffffffc0200d48:	e03c                	sd	a5,64(s0)
ffffffffc0200d4a:	00000797          	auipc	a5,0x0
ffffffffc0200d4e:	f3078793          	addi	a5,a5,-208 # ffffffffc0200c7a <ramdisk_write>
ffffffffc0200d52:	60e2                	ld	ra,24(sp)
ffffffffc0200d54:	e43c                	sd	a5,72(s0)
ffffffffc0200d56:	6442                	ld	s0,16(sp)
ffffffffc0200d58:	64a2                	ld	s1,8(sp)
ffffffffc0200d5a:	6902                	ld	s2,0(sp)
ffffffffc0200d5c:	6105                	addi	sp,sp,32
ffffffffc0200d5e:	8082                	ret
ffffffffc0200d60:	0001b617          	auipc	a2,0x1b
ffffffffc0200d64:	fb060613          	addi	a2,a2,-80 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200d68:	00013917          	auipc	s2,0x13
ffffffffc0200d6c:	2a890913          	addi	s2,s2,680 # ffffffffc0214010 <_binary_bin_swap_img_start>
ffffffffc0200d70:	f8c91ce3          	bne	s2,a2,ffffffffc0200d08 <ramdisk_init+0x3a>
ffffffffc0200d74:	6442                	ld	s0,16(sp)
ffffffffc0200d76:	60e2                	ld	ra,24(sp)
ffffffffc0200d78:	64a2                	ld	s1,8(sp)
ffffffffc0200d7a:	6902                	ld	s2,0(sp)
ffffffffc0200d7c:	0000b517          	auipc	a0,0xb
ffffffffc0200d80:	07450513          	addi	a0,a0,116 # ffffffffc020bdf0 <commands+0x2c0>
ffffffffc0200d84:	6105                	addi	sp,sp,32
ffffffffc0200d86:	c20ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200d8a:	0000b617          	auipc	a2,0xb
ffffffffc0200d8e:	0a660613          	addi	a2,a2,166 # ffffffffc020be30 <commands+0x300>
ffffffffc0200d92:	03200593          	li	a1,50
ffffffffc0200d96:	0000b517          	auipc	a0,0xb
ffffffffc0200d9a:	0b250513          	addi	a0,a0,178 # ffffffffc020be48 <commands+0x318>
ffffffffc0200d9e:	f00ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200da2 <idt_init>:
ffffffffc0200da2:	14005073          	csrwi	sscratch,0
ffffffffc0200da6:	00000797          	auipc	a5,0x0
ffffffffc0200daa:	4ca78793          	addi	a5,a5,1226 # ffffffffc0201270 <__alltraps>
ffffffffc0200dae:	10579073          	csrw	stvec,a5
ffffffffc0200db2:	000407b7          	lui	a5,0x40
ffffffffc0200db6:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200dba:	8082                	ret

ffffffffc0200dbc <print_regs>:
ffffffffc0200dbc:	610c                	ld	a1,0(a0)
ffffffffc0200dbe:	1141                	addi	sp,sp,-16
ffffffffc0200dc0:	e022                	sd	s0,0(sp)
ffffffffc0200dc2:	842a                	mv	s0,a0
ffffffffc0200dc4:	0000b517          	auipc	a0,0xb
ffffffffc0200dc8:	0ac50513          	addi	a0,a0,172 # ffffffffc020be70 <commands+0x340>
ffffffffc0200dcc:	e406                	sd	ra,8(sp)
ffffffffc0200dce:	bd8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dd2:	640c                	ld	a1,8(s0)
ffffffffc0200dd4:	0000b517          	auipc	a0,0xb
ffffffffc0200dd8:	0b450513          	addi	a0,a0,180 # ffffffffc020be88 <commands+0x358>
ffffffffc0200ddc:	bcaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200de0:	680c                	ld	a1,16(s0)
ffffffffc0200de2:	0000b517          	auipc	a0,0xb
ffffffffc0200de6:	0be50513          	addi	a0,a0,190 # ffffffffc020bea0 <commands+0x370>
ffffffffc0200dea:	bbcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dee:	6c0c                	ld	a1,24(s0)
ffffffffc0200df0:	0000b517          	auipc	a0,0xb
ffffffffc0200df4:	0c850513          	addi	a0,a0,200 # ffffffffc020beb8 <commands+0x388>
ffffffffc0200df8:	baeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dfc:	700c                	ld	a1,32(s0)
ffffffffc0200dfe:	0000b517          	auipc	a0,0xb
ffffffffc0200e02:	0d250513          	addi	a0,a0,210 # ffffffffc020bed0 <commands+0x3a0>
ffffffffc0200e06:	ba0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e0a:	740c                	ld	a1,40(s0)
ffffffffc0200e0c:	0000b517          	auipc	a0,0xb
ffffffffc0200e10:	0dc50513          	addi	a0,a0,220 # ffffffffc020bee8 <commands+0x3b8>
ffffffffc0200e14:	b92ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e18:	780c                	ld	a1,48(s0)
ffffffffc0200e1a:	0000b517          	auipc	a0,0xb
ffffffffc0200e1e:	0e650513          	addi	a0,a0,230 # ffffffffc020bf00 <commands+0x3d0>
ffffffffc0200e22:	b84ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e26:	7c0c                	ld	a1,56(s0)
ffffffffc0200e28:	0000b517          	auipc	a0,0xb
ffffffffc0200e2c:	0f050513          	addi	a0,a0,240 # ffffffffc020bf18 <commands+0x3e8>
ffffffffc0200e30:	b76ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e34:	602c                	ld	a1,64(s0)
ffffffffc0200e36:	0000b517          	auipc	a0,0xb
ffffffffc0200e3a:	0fa50513          	addi	a0,a0,250 # ffffffffc020bf30 <commands+0x400>
ffffffffc0200e3e:	b68ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e42:	642c                	ld	a1,72(s0)
ffffffffc0200e44:	0000b517          	auipc	a0,0xb
ffffffffc0200e48:	10450513          	addi	a0,a0,260 # ffffffffc020bf48 <commands+0x418>
ffffffffc0200e4c:	b5aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e50:	682c                	ld	a1,80(s0)
ffffffffc0200e52:	0000b517          	auipc	a0,0xb
ffffffffc0200e56:	10e50513          	addi	a0,a0,270 # ffffffffc020bf60 <commands+0x430>
ffffffffc0200e5a:	b4cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e5e:	6c2c                	ld	a1,88(s0)
ffffffffc0200e60:	0000b517          	auipc	a0,0xb
ffffffffc0200e64:	11850513          	addi	a0,a0,280 # ffffffffc020bf78 <commands+0x448>
ffffffffc0200e68:	b3eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e6c:	702c                	ld	a1,96(s0)
ffffffffc0200e6e:	0000b517          	auipc	a0,0xb
ffffffffc0200e72:	12250513          	addi	a0,a0,290 # ffffffffc020bf90 <commands+0x460>
ffffffffc0200e76:	b30ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e7a:	742c                	ld	a1,104(s0)
ffffffffc0200e7c:	0000b517          	auipc	a0,0xb
ffffffffc0200e80:	12c50513          	addi	a0,a0,300 # ffffffffc020bfa8 <commands+0x478>
ffffffffc0200e84:	b22ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e88:	782c                	ld	a1,112(s0)
ffffffffc0200e8a:	0000b517          	auipc	a0,0xb
ffffffffc0200e8e:	13650513          	addi	a0,a0,310 # ffffffffc020bfc0 <commands+0x490>
ffffffffc0200e92:	b14ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e96:	7c2c                	ld	a1,120(s0)
ffffffffc0200e98:	0000b517          	auipc	a0,0xb
ffffffffc0200e9c:	14050513          	addi	a0,a0,320 # ffffffffc020bfd8 <commands+0x4a8>
ffffffffc0200ea0:	b06ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ea4:	604c                	ld	a1,128(s0)
ffffffffc0200ea6:	0000b517          	auipc	a0,0xb
ffffffffc0200eaa:	14a50513          	addi	a0,a0,330 # ffffffffc020bff0 <commands+0x4c0>
ffffffffc0200eae:	af8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eb2:	644c                	ld	a1,136(s0)
ffffffffc0200eb4:	0000b517          	auipc	a0,0xb
ffffffffc0200eb8:	15450513          	addi	a0,a0,340 # ffffffffc020c008 <commands+0x4d8>
ffffffffc0200ebc:	aeaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ec0:	684c                	ld	a1,144(s0)
ffffffffc0200ec2:	0000b517          	auipc	a0,0xb
ffffffffc0200ec6:	15e50513          	addi	a0,a0,350 # ffffffffc020c020 <commands+0x4f0>
ffffffffc0200eca:	adcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ece:	6c4c                	ld	a1,152(s0)
ffffffffc0200ed0:	0000b517          	auipc	a0,0xb
ffffffffc0200ed4:	16850513          	addi	a0,a0,360 # ffffffffc020c038 <commands+0x508>
ffffffffc0200ed8:	aceff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200edc:	704c                	ld	a1,160(s0)
ffffffffc0200ede:	0000b517          	auipc	a0,0xb
ffffffffc0200ee2:	17250513          	addi	a0,a0,370 # ffffffffc020c050 <commands+0x520>
ffffffffc0200ee6:	ac0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eea:	744c                	ld	a1,168(s0)
ffffffffc0200eec:	0000b517          	auipc	a0,0xb
ffffffffc0200ef0:	17c50513          	addi	a0,a0,380 # ffffffffc020c068 <commands+0x538>
ffffffffc0200ef4:	ab2ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ef8:	784c                	ld	a1,176(s0)
ffffffffc0200efa:	0000b517          	auipc	a0,0xb
ffffffffc0200efe:	18650513          	addi	a0,a0,390 # ffffffffc020c080 <commands+0x550>
ffffffffc0200f02:	aa4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f06:	7c4c                	ld	a1,184(s0)
ffffffffc0200f08:	0000b517          	auipc	a0,0xb
ffffffffc0200f0c:	19050513          	addi	a0,a0,400 # ffffffffc020c098 <commands+0x568>
ffffffffc0200f10:	a96ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f14:	606c                	ld	a1,192(s0)
ffffffffc0200f16:	0000b517          	auipc	a0,0xb
ffffffffc0200f1a:	19a50513          	addi	a0,a0,410 # ffffffffc020c0b0 <commands+0x580>
ffffffffc0200f1e:	a88ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f22:	646c                	ld	a1,200(s0)
ffffffffc0200f24:	0000b517          	auipc	a0,0xb
ffffffffc0200f28:	1a450513          	addi	a0,a0,420 # ffffffffc020c0c8 <commands+0x598>
ffffffffc0200f2c:	a7aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f30:	686c                	ld	a1,208(s0)
ffffffffc0200f32:	0000b517          	auipc	a0,0xb
ffffffffc0200f36:	1ae50513          	addi	a0,a0,430 # ffffffffc020c0e0 <commands+0x5b0>
ffffffffc0200f3a:	a6cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f3e:	6c6c                	ld	a1,216(s0)
ffffffffc0200f40:	0000b517          	auipc	a0,0xb
ffffffffc0200f44:	1b850513          	addi	a0,a0,440 # ffffffffc020c0f8 <commands+0x5c8>
ffffffffc0200f48:	a5eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f4c:	706c                	ld	a1,224(s0)
ffffffffc0200f4e:	0000b517          	auipc	a0,0xb
ffffffffc0200f52:	1c250513          	addi	a0,a0,450 # ffffffffc020c110 <commands+0x5e0>
ffffffffc0200f56:	a50ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f5a:	746c                	ld	a1,232(s0)
ffffffffc0200f5c:	0000b517          	auipc	a0,0xb
ffffffffc0200f60:	1cc50513          	addi	a0,a0,460 # ffffffffc020c128 <commands+0x5f8>
ffffffffc0200f64:	a42ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f68:	786c                	ld	a1,240(s0)
ffffffffc0200f6a:	0000b517          	auipc	a0,0xb
ffffffffc0200f6e:	1d650513          	addi	a0,a0,470 # ffffffffc020c140 <commands+0x610>
ffffffffc0200f72:	a34ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f76:	7c6c                	ld	a1,248(s0)
ffffffffc0200f78:	6402                	ld	s0,0(sp)
ffffffffc0200f7a:	60a2                	ld	ra,8(sp)
ffffffffc0200f7c:	0000b517          	auipc	a0,0xb
ffffffffc0200f80:	1dc50513          	addi	a0,a0,476 # ffffffffc020c158 <commands+0x628>
ffffffffc0200f84:	0141                	addi	sp,sp,16
ffffffffc0200f86:	a20ff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200f8a <print_trapframe>:
ffffffffc0200f8a:	1141                	addi	sp,sp,-16
ffffffffc0200f8c:	e022                	sd	s0,0(sp)
ffffffffc0200f8e:	85aa                	mv	a1,a0
ffffffffc0200f90:	842a                	mv	s0,a0
ffffffffc0200f92:	0000b517          	auipc	a0,0xb
ffffffffc0200f96:	1de50513          	addi	a0,a0,478 # ffffffffc020c170 <commands+0x640>
ffffffffc0200f9a:	e406                	sd	ra,8(sp)
ffffffffc0200f9c:	a0aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fa0:	8522                	mv	a0,s0
ffffffffc0200fa2:	e1bff0ef          	jal	ra,ffffffffc0200dbc <print_regs>
ffffffffc0200fa6:	10043583          	ld	a1,256(s0)
ffffffffc0200faa:	0000b517          	auipc	a0,0xb
ffffffffc0200fae:	1de50513          	addi	a0,a0,478 # ffffffffc020c188 <commands+0x658>
ffffffffc0200fb2:	9f4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fb6:	10843583          	ld	a1,264(s0)
ffffffffc0200fba:	0000b517          	auipc	a0,0xb
ffffffffc0200fbe:	1e650513          	addi	a0,a0,486 # ffffffffc020c1a0 <commands+0x670>
ffffffffc0200fc2:	9e4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fc6:	11043583          	ld	a1,272(s0)
ffffffffc0200fca:	0000b517          	auipc	a0,0xb
ffffffffc0200fce:	1ee50513          	addi	a0,a0,494 # ffffffffc020c1b8 <commands+0x688>
ffffffffc0200fd2:	9d4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fd6:	11843583          	ld	a1,280(s0)
ffffffffc0200fda:	6402                	ld	s0,0(sp)
ffffffffc0200fdc:	60a2                	ld	ra,8(sp)
ffffffffc0200fde:	0000b517          	auipc	a0,0xb
ffffffffc0200fe2:	1ea50513          	addi	a0,a0,490 # ffffffffc020c1c8 <commands+0x698>
ffffffffc0200fe6:	0141                	addi	sp,sp,16
ffffffffc0200fe8:	9beff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200fec <interrupt_handler>:
ffffffffc0200fec:	11853783          	ld	a5,280(a0)
ffffffffc0200ff0:	472d                	li	a4,11
ffffffffc0200ff2:	0786                	slli	a5,a5,0x1
ffffffffc0200ff4:	8385                	srli	a5,a5,0x1
ffffffffc0200ff6:	06f76c63          	bltu	a4,a5,ffffffffc020106e <interrupt_handler+0x82>
ffffffffc0200ffa:	0000b717          	auipc	a4,0xb
ffffffffc0200ffe:	28670713          	addi	a4,a4,646 # ffffffffc020c280 <commands+0x750>
ffffffffc0201002:	078a                	slli	a5,a5,0x2
ffffffffc0201004:	97ba                	add	a5,a5,a4
ffffffffc0201006:	439c                	lw	a5,0(a5)
ffffffffc0201008:	97ba                	add	a5,a5,a4
ffffffffc020100a:	8782                	jr	a5
ffffffffc020100c:	0000b517          	auipc	a0,0xb
ffffffffc0201010:	23450513          	addi	a0,a0,564 # ffffffffc020c240 <commands+0x710>
ffffffffc0201014:	992ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201018:	0000b517          	auipc	a0,0xb
ffffffffc020101c:	20850513          	addi	a0,a0,520 # ffffffffc020c220 <commands+0x6f0>
ffffffffc0201020:	986ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201024:	0000b517          	auipc	a0,0xb
ffffffffc0201028:	1bc50513          	addi	a0,a0,444 # ffffffffc020c1e0 <commands+0x6b0>
ffffffffc020102c:	97aff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201030:	0000b517          	auipc	a0,0xb
ffffffffc0201034:	1d050513          	addi	a0,a0,464 # ffffffffc020c200 <commands+0x6d0>
ffffffffc0201038:	96eff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020103c:	1141                	addi	sp,sp,-16
ffffffffc020103e:	e406                	sd	ra,8(sp)
ffffffffc0201040:	d3aff0ef          	jal	ra,ffffffffc020057a <clock_set_next_event>
ffffffffc0201044:	00096717          	auipc	a4,0x96
ffffffffc0201048:	82c70713          	addi	a4,a4,-2004 # ffffffffc0296870 <ticks>
ffffffffc020104c:	631c                	ld	a5,0(a4)
ffffffffc020104e:	0785                	addi	a5,a5,1
ffffffffc0201050:	e31c                	sd	a5,0(a4)
ffffffffc0201052:	0a9060ef          	jal	ra,ffffffffc02078fa <run_timer_list>
ffffffffc0201056:	d9eff0ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc020105a:	60a2                	ld	ra,8(sp)
ffffffffc020105c:	0141                	addi	sp,sp,16
ffffffffc020105e:	76d0706f          	j	ffffffffc0208fca <dev_stdin_write>
ffffffffc0201062:	0000b517          	auipc	a0,0xb
ffffffffc0201066:	1fe50513          	addi	a0,a0,510 # ffffffffc020c260 <commands+0x730>
ffffffffc020106a:	93cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020106e:	bf31                	j	ffffffffc0200f8a <print_trapframe>

ffffffffc0201070 <exception_handler>:
ffffffffc0201070:	11853783          	ld	a5,280(a0)
ffffffffc0201074:	1101                	addi	sp,sp,-32
ffffffffc0201076:	e822                	sd	s0,16(sp)
ffffffffc0201078:	ec06                	sd	ra,24(sp)
ffffffffc020107a:	e426                	sd	s1,8(sp)
ffffffffc020107c:	e04a                	sd	s2,0(sp)
ffffffffc020107e:	473d                	li	a4,15
ffffffffc0201080:	842a                	mv	s0,a0
ffffffffc0201082:	12f76263          	bltu	a4,a5,ffffffffc02011a6 <exception_handler+0x136>
ffffffffc0201086:	0000b717          	auipc	a4,0xb
ffffffffc020108a:	3ee70713          	addi	a4,a4,1006 # ffffffffc020c474 <commands+0x944>
ffffffffc020108e:	078a                	slli	a5,a5,0x2
ffffffffc0201090:	97ba                	add	a5,a5,a4
ffffffffc0201092:	439c                	lw	a5,0(a5)
ffffffffc0201094:	97ba                	add	a5,a5,a4
ffffffffc0201096:	8782                	jr	a5
ffffffffc0201098:	0000b517          	auipc	a0,0xb
ffffffffc020109c:	37850513          	addi	a0,a0,888 # ffffffffc020c410 <commands+0x8e0>
ffffffffc02010a0:	906ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02010a4:	00096497          	auipc	s1,0x96
ffffffffc02010a8:	81c48493          	addi	s1,s1,-2020 # ffffffffc02968c0 <current>
ffffffffc02010ac:	609c                	ld	a5,0(s1)
ffffffffc02010ae:	11043903          	ld	s2,272(s0)
ffffffffc02010b2:	cbcd                	beqz	a5,ffffffffc0201164 <exception_handler+0xf4>
ffffffffc02010b4:	7788                	ld	a0,40(a5)
ffffffffc02010b6:	c55d                	beqz	a0,ffffffffc0201164 <exception_handler+0xf4>
ffffffffc02010b8:	864a                	mv	a2,s2
ffffffffc02010ba:	4581                	li	a1,0
ffffffffc02010bc:	73d020ef          	jal	ra,ffffffffc0203ff8 <do_pgfault>
ffffffffc02010c0:	862a                	mv	a2,a0
ffffffffc02010c2:	e155                	bnez	a0,ffffffffc0201166 <exception_handler+0xf6>
ffffffffc02010c4:	60e2                	ld	ra,24(sp)
ffffffffc02010c6:	6442                	ld	s0,16(sp)
ffffffffc02010c8:	64a2                	ld	s1,8(sp)
ffffffffc02010ca:	6902                	ld	s2,0(sp)
ffffffffc02010cc:	6105                	addi	sp,sp,32
ffffffffc02010ce:	8082                	ret
ffffffffc02010d0:	0000b517          	auipc	a0,0xb
ffffffffc02010d4:	2c850513          	addi	a0,a0,712 # ffffffffc020c398 <commands+0x868>
ffffffffc02010d8:	8ceff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02010dc:	10843783          	ld	a5,264(s0)
ffffffffc02010e0:	60e2                	ld	ra,24(sp)
ffffffffc02010e2:	64a2                	ld	s1,8(sp)
ffffffffc02010e4:	0791                	addi	a5,a5,4
ffffffffc02010e6:	10f43423          	sd	a5,264(s0)
ffffffffc02010ea:	6442                	ld	s0,16(sp)
ffffffffc02010ec:	6902                	ld	s2,0(sp)
ffffffffc02010ee:	6105                	addi	sp,sp,32
ffffffffc02010f0:	2210606f          	j	ffffffffc0207b10 <syscall>
ffffffffc02010f4:	0000b517          	auipc	a0,0xb
ffffffffc02010f8:	1bc50513          	addi	a0,a0,444 # ffffffffc020c2b0 <commands+0x780>
ffffffffc02010fc:	6442                	ld	s0,16(sp)
ffffffffc02010fe:	60e2                	ld	ra,24(sp)
ffffffffc0201100:	64a2                	ld	s1,8(sp)
ffffffffc0201102:	6902                	ld	s2,0(sp)
ffffffffc0201104:	6105                	addi	sp,sp,32
ffffffffc0201106:	8a0ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020110a:	0000b517          	auipc	a0,0xb
ffffffffc020110e:	1c650513          	addi	a0,a0,454 # ffffffffc020c2d0 <commands+0x7a0>
ffffffffc0201112:	b7ed                	j	ffffffffc02010fc <exception_handler+0x8c>
ffffffffc0201114:	0000b517          	auipc	a0,0xb
ffffffffc0201118:	1dc50513          	addi	a0,a0,476 # ffffffffc020c2f0 <commands+0x7c0>
ffffffffc020111c:	b7c5                	j	ffffffffc02010fc <exception_handler+0x8c>
ffffffffc020111e:	0000b517          	auipc	a0,0xb
ffffffffc0201122:	1ea50513          	addi	a0,a0,490 # ffffffffc020c308 <commands+0x7d8>
ffffffffc0201126:	bfd9                	j	ffffffffc02010fc <exception_handler+0x8c>
ffffffffc0201128:	0000b517          	auipc	a0,0xb
ffffffffc020112c:	1f050513          	addi	a0,a0,496 # ffffffffc020c318 <commands+0x7e8>
ffffffffc0201130:	b7f1                	j	ffffffffc02010fc <exception_handler+0x8c>
ffffffffc0201132:	0000b517          	auipc	a0,0xb
ffffffffc0201136:	20650513          	addi	a0,a0,518 # ffffffffc020c338 <commands+0x808>
ffffffffc020113a:	b7c9                	j	ffffffffc02010fc <exception_handler+0x8c>
ffffffffc020113c:	0000b517          	auipc	a0,0xb
ffffffffc0201140:	27c50513          	addi	a0,a0,636 # ffffffffc020c3b8 <commands+0x888>
ffffffffc0201144:	bf65                	j	ffffffffc02010fc <exception_handler+0x8c>
ffffffffc0201146:	0000b517          	auipc	a0,0xb
ffffffffc020114a:	23a50513          	addi	a0,a0,570 # ffffffffc020c380 <commands+0x850>
ffffffffc020114e:	b77d                	j	ffffffffc02010fc <exception_handler+0x8c>
ffffffffc0201150:	0000b517          	auipc	a0,0xb
ffffffffc0201154:	28850513          	addi	a0,a0,648 # ffffffffc020c3d8 <commands+0x8a8>
ffffffffc0201158:	b755                	j	ffffffffc02010fc <exception_handler+0x8c>
ffffffffc020115a:	0000b517          	auipc	a0,0xb
ffffffffc020115e:	29e50513          	addi	a0,a0,670 # ffffffffc020c3f8 <commands+0x8c8>
ffffffffc0201162:	bf69                	j	ffffffffc02010fc <exception_handler+0x8c>
ffffffffc0201164:	5675                	li	a2,-3
ffffffffc0201166:	85ca                	mv	a1,s2
ffffffffc0201168:	0000b517          	auipc	a0,0xb
ffffffffc020116c:	2c050513          	addi	a0,a0,704 # ffffffffc020c428 <commands+0x8f8>
ffffffffc0201170:	836ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0201174:	8522                	mv	a0,s0
ffffffffc0201176:	e15ff0ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc020117a:	6098                	ld	a4,0(s1)
ffffffffc020117c:	cb21                	beqz	a4,ffffffffc02011cc <exception_handler+0x15c>
ffffffffc020117e:	10043783          	ld	a5,256(s0)
ffffffffc0201182:	1007f793          	andi	a5,a5,256
ffffffffc0201186:	e3b9                	bnez	a5,ffffffffc02011cc <exception_handler+0x15c>
ffffffffc0201188:	434c                	lw	a1,4(a4)
ffffffffc020118a:	0000b517          	auipc	a0,0xb
ffffffffc020118e:	2c650513          	addi	a0,a0,710 # ffffffffc020c450 <commands+0x920>
ffffffffc0201192:	814ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0201196:	6442                	ld	s0,16(sp)
ffffffffc0201198:	60e2                	ld	ra,24(sp)
ffffffffc020119a:	64a2                	ld	s1,8(sp)
ffffffffc020119c:	6902                	ld	s2,0(sp)
ffffffffc020119e:	555d                	li	a0,-9
ffffffffc02011a0:	6105                	addi	sp,sp,32
ffffffffc02011a2:	0e60506f          	j	ffffffffc0206288 <do_exit>
ffffffffc02011a6:	8522                	mv	a0,s0
ffffffffc02011a8:	6442                	ld	s0,16(sp)
ffffffffc02011aa:	60e2                	ld	ra,24(sp)
ffffffffc02011ac:	64a2                	ld	s1,8(sp)
ffffffffc02011ae:	6902                	ld	s2,0(sp)
ffffffffc02011b0:	6105                	addi	sp,sp,32
ffffffffc02011b2:	bbe1                	j	ffffffffc0200f8a <print_trapframe>
ffffffffc02011b4:	0000b617          	auipc	a2,0xb
ffffffffc02011b8:	19c60613          	addi	a2,a2,412 # ffffffffc020c350 <commands+0x820>
ffffffffc02011bc:	0b100593          	li	a1,177
ffffffffc02011c0:	0000b517          	auipc	a0,0xb
ffffffffc02011c4:	1a850513          	addi	a0,a0,424 # ffffffffc020c368 <commands+0x838>
ffffffffc02011c8:	ad6ff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02011cc:	0000b617          	auipc	a2,0xb
ffffffffc02011d0:	29460613          	addi	a2,a2,660 # ffffffffc020c460 <commands+0x930>
ffffffffc02011d4:	0df00593          	li	a1,223
ffffffffc02011d8:	0000b517          	auipc	a0,0xb
ffffffffc02011dc:	19050513          	addi	a0,a0,400 # ffffffffc020c368 <commands+0x838>
ffffffffc02011e0:	abeff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02011e4 <trap>:
ffffffffc02011e4:	1101                	addi	sp,sp,-32
ffffffffc02011e6:	e822                	sd	s0,16(sp)
ffffffffc02011e8:	00095417          	auipc	s0,0x95
ffffffffc02011ec:	6d840413          	addi	s0,s0,1752 # ffffffffc02968c0 <current>
ffffffffc02011f0:	6018                	ld	a4,0(s0)
ffffffffc02011f2:	ec06                	sd	ra,24(sp)
ffffffffc02011f4:	e426                	sd	s1,8(sp)
ffffffffc02011f6:	e04a                	sd	s2,0(sp)
ffffffffc02011f8:	11853683          	ld	a3,280(a0)
ffffffffc02011fc:	cf1d                	beqz	a4,ffffffffc020123a <trap+0x56>
ffffffffc02011fe:	10053483          	ld	s1,256(a0)
ffffffffc0201202:	0a073903          	ld	s2,160(a4)
ffffffffc0201206:	f348                	sd	a0,160(a4)
ffffffffc0201208:	1004f493          	andi	s1,s1,256
ffffffffc020120c:	0206c463          	bltz	a3,ffffffffc0201234 <trap+0x50>
ffffffffc0201210:	e61ff0ef          	jal	ra,ffffffffc0201070 <exception_handler>
ffffffffc0201214:	601c                	ld	a5,0(s0)
ffffffffc0201216:	0b27b023          	sd	s2,160(a5) # 400a0 <_binary_bin_swap_img_size+0x383a0>
ffffffffc020121a:	e499                	bnez	s1,ffffffffc0201228 <trap+0x44>
ffffffffc020121c:	0b07a703          	lw	a4,176(a5)
ffffffffc0201220:	8b05                	andi	a4,a4,1
ffffffffc0201222:	e329                	bnez	a4,ffffffffc0201264 <trap+0x80>
ffffffffc0201224:	6f9c                	ld	a5,24(a5)
ffffffffc0201226:	eb85                	bnez	a5,ffffffffc0201256 <trap+0x72>
ffffffffc0201228:	60e2                	ld	ra,24(sp)
ffffffffc020122a:	6442                	ld	s0,16(sp)
ffffffffc020122c:	64a2                	ld	s1,8(sp)
ffffffffc020122e:	6902                	ld	s2,0(sp)
ffffffffc0201230:	6105                	addi	sp,sp,32
ffffffffc0201232:	8082                	ret
ffffffffc0201234:	db9ff0ef          	jal	ra,ffffffffc0200fec <interrupt_handler>
ffffffffc0201238:	bff1                	j	ffffffffc0201214 <trap+0x30>
ffffffffc020123a:	0006c863          	bltz	a3,ffffffffc020124a <trap+0x66>
ffffffffc020123e:	6442                	ld	s0,16(sp)
ffffffffc0201240:	60e2                	ld	ra,24(sp)
ffffffffc0201242:	64a2                	ld	s1,8(sp)
ffffffffc0201244:	6902                	ld	s2,0(sp)
ffffffffc0201246:	6105                	addi	sp,sp,32
ffffffffc0201248:	b525                	j	ffffffffc0201070 <exception_handler>
ffffffffc020124a:	6442                	ld	s0,16(sp)
ffffffffc020124c:	60e2                	ld	ra,24(sp)
ffffffffc020124e:	64a2                	ld	s1,8(sp)
ffffffffc0201250:	6902                	ld	s2,0(sp)
ffffffffc0201252:	6105                	addi	sp,sp,32
ffffffffc0201254:	bb61                	j	ffffffffc0200fec <interrupt_handler>
ffffffffc0201256:	6442                	ld	s0,16(sp)
ffffffffc0201258:	60e2                	ld	ra,24(sp)
ffffffffc020125a:	64a2                	ld	s1,8(sp)
ffffffffc020125c:	6902                	ld	s2,0(sp)
ffffffffc020125e:	6105                	addi	sp,sp,32
ffffffffc0201260:	48e0606f          	j	ffffffffc02076ee <schedule>
ffffffffc0201264:	555d                	li	a0,-9
ffffffffc0201266:	022050ef          	jal	ra,ffffffffc0206288 <do_exit>
ffffffffc020126a:	601c                	ld	a5,0(s0)
ffffffffc020126c:	bf65                	j	ffffffffc0201224 <trap+0x40>
	...

ffffffffc0201270 <__alltraps>:
ffffffffc0201270:	14011173          	csrrw	sp,sscratch,sp
ffffffffc0201274:	00011463          	bnez	sp,ffffffffc020127c <__alltraps+0xc>
ffffffffc0201278:	14002173          	csrr	sp,sscratch
ffffffffc020127c:	712d                	addi	sp,sp,-288
ffffffffc020127e:	e002                	sd	zero,0(sp)
ffffffffc0201280:	e406                	sd	ra,8(sp)
ffffffffc0201282:	ec0e                	sd	gp,24(sp)
ffffffffc0201284:	f012                	sd	tp,32(sp)
ffffffffc0201286:	f416                	sd	t0,40(sp)
ffffffffc0201288:	f81a                	sd	t1,48(sp)
ffffffffc020128a:	fc1e                	sd	t2,56(sp)
ffffffffc020128c:	e0a2                	sd	s0,64(sp)
ffffffffc020128e:	e4a6                	sd	s1,72(sp)
ffffffffc0201290:	e8aa                	sd	a0,80(sp)
ffffffffc0201292:	ecae                	sd	a1,88(sp)
ffffffffc0201294:	f0b2                	sd	a2,96(sp)
ffffffffc0201296:	f4b6                	sd	a3,104(sp)
ffffffffc0201298:	f8ba                	sd	a4,112(sp)
ffffffffc020129a:	fcbe                	sd	a5,120(sp)
ffffffffc020129c:	e142                	sd	a6,128(sp)
ffffffffc020129e:	e546                	sd	a7,136(sp)
ffffffffc02012a0:	e94a                	sd	s2,144(sp)
ffffffffc02012a2:	ed4e                	sd	s3,152(sp)
ffffffffc02012a4:	f152                	sd	s4,160(sp)
ffffffffc02012a6:	f556                	sd	s5,168(sp)
ffffffffc02012a8:	f95a                	sd	s6,176(sp)
ffffffffc02012aa:	fd5e                	sd	s7,184(sp)
ffffffffc02012ac:	e1e2                	sd	s8,192(sp)
ffffffffc02012ae:	e5e6                	sd	s9,200(sp)
ffffffffc02012b0:	e9ea                	sd	s10,208(sp)
ffffffffc02012b2:	edee                	sd	s11,216(sp)
ffffffffc02012b4:	f1f2                	sd	t3,224(sp)
ffffffffc02012b6:	f5f6                	sd	t4,232(sp)
ffffffffc02012b8:	f9fa                	sd	t5,240(sp)
ffffffffc02012ba:	fdfe                	sd	t6,248(sp)
ffffffffc02012bc:	14001473          	csrrw	s0,sscratch,zero
ffffffffc02012c0:	100024f3          	csrr	s1,sstatus
ffffffffc02012c4:	14102973          	csrr	s2,sepc
ffffffffc02012c8:	143029f3          	csrr	s3,stval
ffffffffc02012cc:	14202a73          	csrr	s4,scause
ffffffffc02012d0:	e822                	sd	s0,16(sp)
ffffffffc02012d2:	e226                	sd	s1,256(sp)
ffffffffc02012d4:	e64a                	sd	s2,264(sp)
ffffffffc02012d6:	ea4e                	sd	s3,272(sp)
ffffffffc02012d8:	ee52                	sd	s4,280(sp)
ffffffffc02012da:	850a                	mv	a0,sp
ffffffffc02012dc:	f09ff0ef          	jal	ra,ffffffffc02011e4 <trap>

ffffffffc02012e0 <__trapret>:
ffffffffc02012e0:	6492                	ld	s1,256(sp)
ffffffffc02012e2:	6932                	ld	s2,264(sp)
ffffffffc02012e4:	1004f413          	andi	s0,s1,256
ffffffffc02012e8:	e401                	bnez	s0,ffffffffc02012f0 <__trapret+0x10>
ffffffffc02012ea:	1200                	addi	s0,sp,288
ffffffffc02012ec:	14041073          	csrw	sscratch,s0
ffffffffc02012f0:	10049073          	csrw	sstatus,s1
ffffffffc02012f4:	14191073          	csrw	sepc,s2
ffffffffc02012f8:	60a2                	ld	ra,8(sp)
ffffffffc02012fa:	61e2                	ld	gp,24(sp)
ffffffffc02012fc:	7202                	ld	tp,32(sp)
ffffffffc02012fe:	72a2                	ld	t0,40(sp)
ffffffffc0201300:	7342                	ld	t1,48(sp)
ffffffffc0201302:	73e2                	ld	t2,56(sp)
ffffffffc0201304:	6406                	ld	s0,64(sp)
ffffffffc0201306:	64a6                	ld	s1,72(sp)
ffffffffc0201308:	6546                	ld	a0,80(sp)
ffffffffc020130a:	65e6                	ld	a1,88(sp)
ffffffffc020130c:	7606                	ld	a2,96(sp)
ffffffffc020130e:	76a6                	ld	a3,104(sp)
ffffffffc0201310:	7746                	ld	a4,112(sp)
ffffffffc0201312:	77e6                	ld	a5,120(sp)
ffffffffc0201314:	680a                	ld	a6,128(sp)
ffffffffc0201316:	68aa                	ld	a7,136(sp)
ffffffffc0201318:	694a                	ld	s2,144(sp)
ffffffffc020131a:	69ea                	ld	s3,152(sp)
ffffffffc020131c:	7a0a                	ld	s4,160(sp)
ffffffffc020131e:	7aaa                	ld	s5,168(sp)
ffffffffc0201320:	7b4a                	ld	s6,176(sp)
ffffffffc0201322:	7bea                	ld	s7,184(sp)
ffffffffc0201324:	6c0e                	ld	s8,192(sp)
ffffffffc0201326:	6cae                	ld	s9,200(sp)
ffffffffc0201328:	6d4e                	ld	s10,208(sp)
ffffffffc020132a:	6dee                	ld	s11,216(sp)
ffffffffc020132c:	7e0e                	ld	t3,224(sp)
ffffffffc020132e:	7eae                	ld	t4,232(sp)
ffffffffc0201330:	7f4e                	ld	t5,240(sp)
ffffffffc0201332:	7fee                	ld	t6,248(sp)
ffffffffc0201334:	6142                	ld	sp,16(sp)
ffffffffc0201336:	10200073          	sret

ffffffffc020133a <forkrets>:
ffffffffc020133a:	812a                	mv	sp,a0
ffffffffc020133c:	b755                	j	ffffffffc02012e0 <__trapret>

ffffffffc020133e <default_init>:
ffffffffc020133e:	00090797          	auipc	a5,0x90
ffffffffc0201342:	46a78793          	addi	a5,a5,1130 # ffffffffc02917a8 <free_area>
ffffffffc0201346:	e79c                	sd	a5,8(a5)
ffffffffc0201348:	e39c                	sd	a5,0(a5)
ffffffffc020134a:	0007a823          	sw	zero,16(a5)
ffffffffc020134e:	8082                	ret

ffffffffc0201350 <default_nr_free_pages>:
ffffffffc0201350:	00090517          	auipc	a0,0x90
ffffffffc0201354:	46856503          	lwu	a0,1128(a0) # ffffffffc02917b8 <free_area+0x10>
ffffffffc0201358:	8082                	ret

ffffffffc020135a <default_check>:
ffffffffc020135a:	715d                	addi	sp,sp,-80
ffffffffc020135c:	e0a2                	sd	s0,64(sp)
ffffffffc020135e:	00090417          	auipc	s0,0x90
ffffffffc0201362:	44a40413          	addi	s0,s0,1098 # ffffffffc02917a8 <free_area>
ffffffffc0201366:	641c                	ld	a5,8(s0)
ffffffffc0201368:	e486                	sd	ra,72(sp)
ffffffffc020136a:	fc26                	sd	s1,56(sp)
ffffffffc020136c:	f84a                	sd	s2,48(sp)
ffffffffc020136e:	f44e                	sd	s3,40(sp)
ffffffffc0201370:	f052                	sd	s4,32(sp)
ffffffffc0201372:	ec56                	sd	s5,24(sp)
ffffffffc0201374:	e85a                	sd	s6,16(sp)
ffffffffc0201376:	e45e                	sd	s7,8(sp)
ffffffffc0201378:	e062                	sd	s8,0(sp)
ffffffffc020137a:	2a878d63          	beq	a5,s0,ffffffffc0201634 <default_check+0x2da>
ffffffffc020137e:	4481                	li	s1,0
ffffffffc0201380:	4901                	li	s2,0
ffffffffc0201382:	ff07b703          	ld	a4,-16(a5)
ffffffffc0201386:	8b09                	andi	a4,a4,2
ffffffffc0201388:	2a070a63          	beqz	a4,ffffffffc020163c <default_check+0x2e2>
ffffffffc020138c:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201390:	679c                	ld	a5,8(a5)
ffffffffc0201392:	2905                	addiw	s2,s2,1
ffffffffc0201394:	9cb9                	addw	s1,s1,a4
ffffffffc0201396:	fe8796e3          	bne	a5,s0,ffffffffc0201382 <default_check+0x28>
ffffffffc020139a:	89a6                	mv	s3,s1
ffffffffc020139c:	6df000ef          	jal	ra,ffffffffc020227a <nr_free_pages>
ffffffffc02013a0:	6f351e63          	bne	a0,s3,ffffffffc0201a9c <default_check+0x742>
ffffffffc02013a4:	4505                	li	a0,1
ffffffffc02013a6:	657000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc02013aa:	8aaa                	mv	s5,a0
ffffffffc02013ac:	42050863          	beqz	a0,ffffffffc02017dc <default_check+0x482>
ffffffffc02013b0:	4505                	li	a0,1
ffffffffc02013b2:	64b000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc02013b6:	89aa                	mv	s3,a0
ffffffffc02013b8:	70050263          	beqz	a0,ffffffffc0201abc <default_check+0x762>
ffffffffc02013bc:	4505                	li	a0,1
ffffffffc02013be:	63f000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc02013c2:	8a2a                	mv	s4,a0
ffffffffc02013c4:	48050c63          	beqz	a0,ffffffffc020185c <default_check+0x502>
ffffffffc02013c8:	293a8a63          	beq	s5,s3,ffffffffc020165c <default_check+0x302>
ffffffffc02013cc:	28aa8863          	beq	s5,a0,ffffffffc020165c <default_check+0x302>
ffffffffc02013d0:	28a98663          	beq	s3,a0,ffffffffc020165c <default_check+0x302>
ffffffffc02013d4:	000aa783          	lw	a5,0(s5)
ffffffffc02013d8:	2a079263          	bnez	a5,ffffffffc020167c <default_check+0x322>
ffffffffc02013dc:	0009a783          	lw	a5,0(s3)
ffffffffc02013e0:	28079e63          	bnez	a5,ffffffffc020167c <default_check+0x322>
ffffffffc02013e4:	411c                	lw	a5,0(a0)
ffffffffc02013e6:	28079b63          	bnez	a5,ffffffffc020167c <default_check+0x322>
ffffffffc02013ea:	00095797          	auipc	a5,0x95
ffffffffc02013ee:	4be7b783          	ld	a5,1214(a5) # ffffffffc02968a8 <pages>
ffffffffc02013f2:	40fa8733          	sub	a4,s5,a5
ffffffffc02013f6:	0000f617          	auipc	a2,0xf
ffffffffc02013fa:	93263603          	ld	a2,-1742(a2) # ffffffffc020fd28 <nbase>
ffffffffc02013fe:	8719                	srai	a4,a4,0x6
ffffffffc0201400:	9732                	add	a4,a4,a2
ffffffffc0201402:	00095697          	auipc	a3,0x95
ffffffffc0201406:	49e6b683          	ld	a3,1182(a3) # ffffffffc02968a0 <npage>
ffffffffc020140a:	06b2                	slli	a3,a3,0xc
ffffffffc020140c:	0732                	slli	a4,a4,0xc
ffffffffc020140e:	28d77763          	bgeu	a4,a3,ffffffffc020169c <default_check+0x342>
ffffffffc0201412:	40f98733          	sub	a4,s3,a5
ffffffffc0201416:	8719                	srai	a4,a4,0x6
ffffffffc0201418:	9732                	add	a4,a4,a2
ffffffffc020141a:	0732                	slli	a4,a4,0xc
ffffffffc020141c:	4cd77063          	bgeu	a4,a3,ffffffffc02018dc <default_check+0x582>
ffffffffc0201420:	40f507b3          	sub	a5,a0,a5
ffffffffc0201424:	8799                	srai	a5,a5,0x6
ffffffffc0201426:	97b2                	add	a5,a5,a2
ffffffffc0201428:	07b2                	slli	a5,a5,0xc
ffffffffc020142a:	30d7f963          	bgeu	a5,a3,ffffffffc020173c <default_check+0x3e2>
ffffffffc020142e:	4505                	li	a0,1
ffffffffc0201430:	00043c03          	ld	s8,0(s0)
ffffffffc0201434:	00843b83          	ld	s7,8(s0)
ffffffffc0201438:	01042b03          	lw	s6,16(s0)
ffffffffc020143c:	e400                	sd	s0,8(s0)
ffffffffc020143e:	e000                	sd	s0,0(s0)
ffffffffc0201440:	00090797          	auipc	a5,0x90
ffffffffc0201444:	3607ac23          	sw	zero,888(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc0201448:	5b5000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc020144c:	2c051863          	bnez	a0,ffffffffc020171c <default_check+0x3c2>
ffffffffc0201450:	4585                	li	a1,1
ffffffffc0201452:	8556                	mv	a0,s5
ffffffffc0201454:	5e7000ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc0201458:	4585                	li	a1,1
ffffffffc020145a:	854e                	mv	a0,s3
ffffffffc020145c:	5df000ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc0201460:	4585                	li	a1,1
ffffffffc0201462:	8552                	mv	a0,s4
ffffffffc0201464:	5d7000ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc0201468:	4818                	lw	a4,16(s0)
ffffffffc020146a:	478d                	li	a5,3
ffffffffc020146c:	28f71863          	bne	a4,a5,ffffffffc02016fc <default_check+0x3a2>
ffffffffc0201470:	4505                	li	a0,1
ffffffffc0201472:	58b000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc0201476:	89aa                	mv	s3,a0
ffffffffc0201478:	26050263          	beqz	a0,ffffffffc02016dc <default_check+0x382>
ffffffffc020147c:	4505                	li	a0,1
ffffffffc020147e:	57f000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc0201482:	8aaa                	mv	s5,a0
ffffffffc0201484:	3a050c63          	beqz	a0,ffffffffc020183c <default_check+0x4e2>
ffffffffc0201488:	4505                	li	a0,1
ffffffffc020148a:	573000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc020148e:	8a2a                	mv	s4,a0
ffffffffc0201490:	38050663          	beqz	a0,ffffffffc020181c <default_check+0x4c2>
ffffffffc0201494:	4505                	li	a0,1
ffffffffc0201496:	567000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc020149a:	36051163          	bnez	a0,ffffffffc02017fc <default_check+0x4a2>
ffffffffc020149e:	4585                	li	a1,1
ffffffffc02014a0:	854e                	mv	a0,s3
ffffffffc02014a2:	599000ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc02014a6:	641c                	ld	a5,8(s0)
ffffffffc02014a8:	20878a63          	beq	a5,s0,ffffffffc02016bc <default_check+0x362>
ffffffffc02014ac:	4505                	li	a0,1
ffffffffc02014ae:	54f000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc02014b2:	30a99563          	bne	s3,a0,ffffffffc02017bc <default_check+0x462>
ffffffffc02014b6:	4505                	li	a0,1
ffffffffc02014b8:	545000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc02014bc:	2e051063          	bnez	a0,ffffffffc020179c <default_check+0x442>
ffffffffc02014c0:	481c                	lw	a5,16(s0)
ffffffffc02014c2:	2a079d63          	bnez	a5,ffffffffc020177c <default_check+0x422>
ffffffffc02014c6:	854e                	mv	a0,s3
ffffffffc02014c8:	4585                	li	a1,1
ffffffffc02014ca:	01843023          	sd	s8,0(s0)
ffffffffc02014ce:	01743423          	sd	s7,8(s0)
ffffffffc02014d2:	01642823          	sw	s6,16(s0)
ffffffffc02014d6:	565000ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc02014da:	4585                	li	a1,1
ffffffffc02014dc:	8556                	mv	a0,s5
ffffffffc02014de:	55d000ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc02014e2:	4585                	li	a1,1
ffffffffc02014e4:	8552                	mv	a0,s4
ffffffffc02014e6:	555000ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc02014ea:	4515                	li	a0,5
ffffffffc02014ec:	511000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc02014f0:	89aa                	mv	s3,a0
ffffffffc02014f2:	26050563          	beqz	a0,ffffffffc020175c <default_check+0x402>
ffffffffc02014f6:	651c                	ld	a5,8(a0)
ffffffffc02014f8:	8385                	srli	a5,a5,0x1
ffffffffc02014fa:	8b85                	andi	a5,a5,1
ffffffffc02014fc:	54079063          	bnez	a5,ffffffffc0201a3c <default_check+0x6e2>
ffffffffc0201500:	4505                	li	a0,1
ffffffffc0201502:	00043b03          	ld	s6,0(s0)
ffffffffc0201506:	00843a83          	ld	s5,8(s0)
ffffffffc020150a:	e000                	sd	s0,0(s0)
ffffffffc020150c:	e400                	sd	s0,8(s0)
ffffffffc020150e:	4ef000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc0201512:	50051563          	bnez	a0,ffffffffc0201a1c <default_check+0x6c2>
ffffffffc0201516:	08098a13          	addi	s4,s3,128
ffffffffc020151a:	8552                	mv	a0,s4
ffffffffc020151c:	458d                	li	a1,3
ffffffffc020151e:	01042b83          	lw	s7,16(s0)
ffffffffc0201522:	00090797          	auipc	a5,0x90
ffffffffc0201526:	2807ab23          	sw	zero,662(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc020152a:	511000ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc020152e:	4511                	li	a0,4
ffffffffc0201530:	4cd000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc0201534:	4c051463          	bnez	a0,ffffffffc02019fc <default_check+0x6a2>
ffffffffc0201538:	0889b783          	ld	a5,136(s3)
ffffffffc020153c:	8385                	srli	a5,a5,0x1
ffffffffc020153e:	8b85                	andi	a5,a5,1
ffffffffc0201540:	48078e63          	beqz	a5,ffffffffc02019dc <default_check+0x682>
ffffffffc0201544:	0909a703          	lw	a4,144(s3)
ffffffffc0201548:	478d                	li	a5,3
ffffffffc020154a:	48f71963          	bne	a4,a5,ffffffffc02019dc <default_check+0x682>
ffffffffc020154e:	450d                	li	a0,3
ffffffffc0201550:	4ad000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc0201554:	8c2a                	mv	s8,a0
ffffffffc0201556:	46050363          	beqz	a0,ffffffffc02019bc <default_check+0x662>
ffffffffc020155a:	4505                	li	a0,1
ffffffffc020155c:	4a1000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc0201560:	42051e63          	bnez	a0,ffffffffc020199c <default_check+0x642>
ffffffffc0201564:	418a1c63          	bne	s4,s8,ffffffffc020197c <default_check+0x622>
ffffffffc0201568:	4585                	li	a1,1
ffffffffc020156a:	854e                	mv	a0,s3
ffffffffc020156c:	4cf000ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc0201570:	458d                	li	a1,3
ffffffffc0201572:	8552                	mv	a0,s4
ffffffffc0201574:	4c7000ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc0201578:	0089b783          	ld	a5,8(s3)
ffffffffc020157c:	04098c13          	addi	s8,s3,64
ffffffffc0201580:	8385                	srli	a5,a5,0x1
ffffffffc0201582:	8b85                	andi	a5,a5,1
ffffffffc0201584:	3c078c63          	beqz	a5,ffffffffc020195c <default_check+0x602>
ffffffffc0201588:	0109a703          	lw	a4,16(s3)
ffffffffc020158c:	4785                	li	a5,1
ffffffffc020158e:	3cf71763          	bne	a4,a5,ffffffffc020195c <default_check+0x602>
ffffffffc0201592:	008a3783          	ld	a5,8(s4)
ffffffffc0201596:	8385                	srli	a5,a5,0x1
ffffffffc0201598:	8b85                	andi	a5,a5,1
ffffffffc020159a:	3a078163          	beqz	a5,ffffffffc020193c <default_check+0x5e2>
ffffffffc020159e:	010a2703          	lw	a4,16(s4)
ffffffffc02015a2:	478d                	li	a5,3
ffffffffc02015a4:	38f71c63          	bne	a4,a5,ffffffffc020193c <default_check+0x5e2>
ffffffffc02015a8:	4505                	li	a0,1
ffffffffc02015aa:	453000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc02015ae:	36a99763          	bne	s3,a0,ffffffffc020191c <default_check+0x5c2>
ffffffffc02015b2:	4585                	li	a1,1
ffffffffc02015b4:	487000ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc02015b8:	4509                	li	a0,2
ffffffffc02015ba:	443000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc02015be:	32aa1f63          	bne	s4,a0,ffffffffc02018fc <default_check+0x5a2>
ffffffffc02015c2:	4589                	li	a1,2
ffffffffc02015c4:	477000ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc02015c8:	4585                	li	a1,1
ffffffffc02015ca:	8562                	mv	a0,s8
ffffffffc02015cc:	46f000ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc02015d0:	4515                	li	a0,5
ffffffffc02015d2:	42b000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc02015d6:	89aa                	mv	s3,a0
ffffffffc02015d8:	48050263          	beqz	a0,ffffffffc0201a5c <default_check+0x702>
ffffffffc02015dc:	4505                	li	a0,1
ffffffffc02015de:	41f000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc02015e2:	2c051d63          	bnez	a0,ffffffffc02018bc <default_check+0x562>
ffffffffc02015e6:	481c                	lw	a5,16(s0)
ffffffffc02015e8:	2a079a63          	bnez	a5,ffffffffc020189c <default_check+0x542>
ffffffffc02015ec:	4595                	li	a1,5
ffffffffc02015ee:	854e                	mv	a0,s3
ffffffffc02015f0:	01742823          	sw	s7,16(s0)
ffffffffc02015f4:	01643023          	sd	s6,0(s0)
ffffffffc02015f8:	01543423          	sd	s5,8(s0)
ffffffffc02015fc:	43f000ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc0201600:	641c                	ld	a5,8(s0)
ffffffffc0201602:	00878963          	beq	a5,s0,ffffffffc0201614 <default_check+0x2ba>
ffffffffc0201606:	ff87a703          	lw	a4,-8(a5)
ffffffffc020160a:	679c                	ld	a5,8(a5)
ffffffffc020160c:	397d                	addiw	s2,s2,-1
ffffffffc020160e:	9c99                	subw	s1,s1,a4
ffffffffc0201610:	fe879be3          	bne	a5,s0,ffffffffc0201606 <default_check+0x2ac>
ffffffffc0201614:	26091463          	bnez	s2,ffffffffc020187c <default_check+0x522>
ffffffffc0201618:	46049263          	bnez	s1,ffffffffc0201a7c <default_check+0x722>
ffffffffc020161c:	60a6                	ld	ra,72(sp)
ffffffffc020161e:	6406                	ld	s0,64(sp)
ffffffffc0201620:	74e2                	ld	s1,56(sp)
ffffffffc0201622:	7942                	ld	s2,48(sp)
ffffffffc0201624:	79a2                	ld	s3,40(sp)
ffffffffc0201626:	7a02                	ld	s4,32(sp)
ffffffffc0201628:	6ae2                	ld	s5,24(sp)
ffffffffc020162a:	6b42                	ld	s6,16(sp)
ffffffffc020162c:	6ba2                	ld	s7,8(sp)
ffffffffc020162e:	6c02                	ld	s8,0(sp)
ffffffffc0201630:	6161                	addi	sp,sp,80
ffffffffc0201632:	8082                	ret
ffffffffc0201634:	4981                	li	s3,0
ffffffffc0201636:	4481                	li	s1,0
ffffffffc0201638:	4901                	li	s2,0
ffffffffc020163a:	b38d                	j	ffffffffc020139c <default_check+0x42>
ffffffffc020163c:	0000b697          	auipc	a3,0xb
ffffffffc0201640:	e7c68693          	addi	a3,a3,-388 # ffffffffc020c4b8 <commands+0x988>
ffffffffc0201644:	0000a617          	auipc	a2,0xa
ffffffffc0201648:	6fc60613          	addi	a2,a2,1788 # ffffffffc020bd40 <commands+0x210>
ffffffffc020164c:	0ef00593          	li	a1,239
ffffffffc0201650:	0000b517          	auipc	a0,0xb
ffffffffc0201654:	e7850513          	addi	a0,a0,-392 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201658:	e47fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020165c:	0000b697          	auipc	a3,0xb
ffffffffc0201660:	f0468693          	addi	a3,a3,-252 # ffffffffc020c560 <commands+0xa30>
ffffffffc0201664:	0000a617          	auipc	a2,0xa
ffffffffc0201668:	6dc60613          	addi	a2,a2,1756 # ffffffffc020bd40 <commands+0x210>
ffffffffc020166c:	0bc00593          	li	a1,188
ffffffffc0201670:	0000b517          	auipc	a0,0xb
ffffffffc0201674:	e5850513          	addi	a0,a0,-424 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201678:	e27fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020167c:	0000b697          	auipc	a3,0xb
ffffffffc0201680:	f0c68693          	addi	a3,a3,-244 # ffffffffc020c588 <commands+0xa58>
ffffffffc0201684:	0000a617          	auipc	a2,0xa
ffffffffc0201688:	6bc60613          	addi	a2,a2,1724 # ffffffffc020bd40 <commands+0x210>
ffffffffc020168c:	0bd00593          	li	a1,189
ffffffffc0201690:	0000b517          	auipc	a0,0xb
ffffffffc0201694:	e3850513          	addi	a0,a0,-456 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201698:	e07fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020169c:	0000b697          	auipc	a3,0xb
ffffffffc02016a0:	f2c68693          	addi	a3,a3,-212 # ffffffffc020c5c8 <commands+0xa98>
ffffffffc02016a4:	0000a617          	auipc	a2,0xa
ffffffffc02016a8:	69c60613          	addi	a2,a2,1692 # ffffffffc020bd40 <commands+0x210>
ffffffffc02016ac:	0bf00593          	li	a1,191
ffffffffc02016b0:	0000b517          	auipc	a0,0xb
ffffffffc02016b4:	e1850513          	addi	a0,a0,-488 # ffffffffc020c4c8 <commands+0x998>
ffffffffc02016b8:	de7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016bc:	0000b697          	auipc	a3,0xb
ffffffffc02016c0:	f9468693          	addi	a3,a3,-108 # ffffffffc020c650 <commands+0xb20>
ffffffffc02016c4:	0000a617          	auipc	a2,0xa
ffffffffc02016c8:	67c60613          	addi	a2,a2,1660 # ffffffffc020bd40 <commands+0x210>
ffffffffc02016cc:	0d800593          	li	a1,216
ffffffffc02016d0:	0000b517          	auipc	a0,0xb
ffffffffc02016d4:	df850513          	addi	a0,a0,-520 # ffffffffc020c4c8 <commands+0x998>
ffffffffc02016d8:	dc7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016dc:	0000b697          	auipc	a3,0xb
ffffffffc02016e0:	e2468693          	addi	a3,a3,-476 # ffffffffc020c500 <commands+0x9d0>
ffffffffc02016e4:	0000a617          	auipc	a2,0xa
ffffffffc02016e8:	65c60613          	addi	a2,a2,1628 # ffffffffc020bd40 <commands+0x210>
ffffffffc02016ec:	0d100593          	li	a1,209
ffffffffc02016f0:	0000b517          	auipc	a0,0xb
ffffffffc02016f4:	dd850513          	addi	a0,a0,-552 # ffffffffc020c4c8 <commands+0x998>
ffffffffc02016f8:	da7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016fc:	0000b697          	auipc	a3,0xb
ffffffffc0201700:	f4468693          	addi	a3,a3,-188 # ffffffffc020c640 <commands+0xb10>
ffffffffc0201704:	0000a617          	auipc	a2,0xa
ffffffffc0201708:	63c60613          	addi	a2,a2,1596 # ffffffffc020bd40 <commands+0x210>
ffffffffc020170c:	0cf00593          	li	a1,207
ffffffffc0201710:	0000b517          	auipc	a0,0xb
ffffffffc0201714:	db850513          	addi	a0,a0,-584 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201718:	d87fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020171c:	0000b697          	auipc	a3,0xb
ffffffffc0201720:	f0c68693          	addi	a3,a3,-244 # ffffffffc020c628 <commands+0xaf8>
ffffffffc0201724:	0000a617          	auipc	a2,0xa
ffffffffc0201728:	61c60613          	addi	a2,a2,1564 # ffffffffc020bd40 <commands+0x210>
ffffffffc020172c:	0ca00593          	li	a1,202
ffffffffc0201730:	0000b517          	auipc	a0,0xb
ffffffffc0201734:	d9850513          	addi	a0,a0,-616 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201738:	d67fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020173c:	0000b697          	auipc	a3,0xb
ffffffffc0201740:	ecc68693          	addi	a3,a3,-308 # ffffffffc020c608 <commands+0xad8>
ffffffffc0201744:	0000a617          	auipc	a2,0xa
ffffffffc0201748:	5fc60613          	addi	a2,a2,1532 # ffffffffc020bd40 <commands+0x210>
ffffffffc020174c:	0c100593          	li	a1,193
ffffffffc0201750:	0000b517          	auipc	a0,0xb
ffffffffc0201754:	d7850513          	addi	a0,a0,-648 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201758:	d47fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020175c:	0000b697          	auipc	a3,0xb
ffffffffc0201760:	f3c68693          	addi	a3,a3,-196 # ffffffffc020c698 <commands+0xb68>
ffffffffc0201764:	0000a617          	auipc	a2,0xa
ffffffffc0201768:	5dc60613          	addi	a2,a2,1500 # ffffffffc020bd40 <commands+0x210>
ffffffffc020176c:	0f700593          	li	a1,247
ffffffffc0201770:	0000b517          	auipc	a0,0xb
ffffffffc0201774:	d5850513          	addi	a0,a0,-680 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201778:	d27fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020177c:	0000b697          	auipc	a3,0xb
ffffffffc0201780:	f0c68693          	addi	a3,a3,-244 # ffffffffc020c688 <commands+0xb58>
ffffffffc0201784:	0000a617          	auipc	a2,0xa
ffffffffc0201788:	5bc60613          	addi	a2,a2,1468 # ffffffffc020bd40 <commands+0x210>
ffffffffc020178c:	0de00593          	li	a1,222
ffffffffc0201790:	0000b517          	auipc	a0,0xb
ffffffffc0201794:	d3850513          	addi	a0,a0,-712 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201798:	d07fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020179c:	0000b697          	auipc	a3,0xb
ffffffffc02017a0:	e8c68693          	addi	a3,a3,-372 # ffffffffc020c628 <commands+0xaf8>
ffffffffc02017a4:	0000a617          	auipc	a2,0xa
ffffffffc02017a8:	59c60613          	addi	a2,a2,1436 # ffffffffc020bd40 <commands+0x210>
ffffffffc02017ac:	0dc00593          	li	a1,220
ffffffffc02017b0:	0000b517          	auipc	a0,0xb
ffffffffc02017b4:	d1850513          	addi	a0,a0,-744 # ffffffffc020c4c8 <commands+0x998>
ffffffffc02017b8:	ce7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017bc:	0000b697          	auipc	a3,0xb
ffffffffc02017c0:	eac68693          	addi	a3,a3,-340 # ffffffffc020c668 <commands+0xb38>
ffffffffc02017c4:	0000a617          	auipc	a2,0xa
ffffffffc02017c8:	57c60613          	addi	a2,a2,1404 # ffffffffc020bd40 <commands+0x210>
ffffffffc02017cc:	0db00593          	li	a1,219
ffffffffc02017d0:	0000b517          	auipc	a0,0xb
ffffffffc02017d4:	cf850513          	addi	a0,a0,-776 # ffffffffc020c4c8 <commands+0x998>
ffffffffc02017d8:	cc7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017dc:	0000b697          	auipc	a3,0xb
ffffffffc02017e0:	d2468693          	addi	a3,a3,-732 # ffffffffc020c500 <commands+0x9d0>
ffffffffc02017e4:	0000a617          	auipc	a2,0xa
ffffffffc02017e8:	55c60613          	addi	a2,a2,1372 # ffffffffc020bd40 <commands+0x210>
ffffffffc02017ec:	0b800593          	li	a1,184
ffffffffc02017f0:	0000b517          	auipc	a0,0xb
ffffffffc02017f4:	cd850513          	addi	a0,a0,-808 # ffffffffc020c4c8 <commands+0x998>
ffffffffc02017f8:	ca7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017fc:	0000b697          	auipc	a3,0xb
ffffffffc0201800:	e2c68693          	addi	a3,a3,-468 # ffffffffc020c628 <commands+0xaf8>
ffffffffc0201804:	0000a617          	auipc	a2,0xa
ffffffffc0201808:	53c60613          	addi	a2,a2,1340 # ffffffffc020bd40 <commands+0x210>
ffffffffc020180c:	0d500593          	li	a1,213
ffffffffc0201810:	0000b517          	auipc	a0,0xb
ffffffffc0201814:	cb850513          	addi	a0,a0,-840 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201818:	c87fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020181c:	0000b697          	auipc	a3,0xb
ffffffffc0201820:	d2468693          	addi	a3,a3,-732 # ffffffffc020c540 <commands+0xa10>
ffffffffc0201824:	0000a617          	auipc	a2,0xa
ffffffffc0201828:	51c60613          	addi	a2,a2,1308 # ffffffffc020bd40 <commands+0x210>
ffffffffc020182c:	0d300593          	li	a1,211
ffffffffc0201830:	0000b517          	auipc	a0,0xb
ffffffffc0201834:	c9850513          	addi	a0,a0,-872 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201838:	c67fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020183c:	0000b697          	auipc	a3,0xb
ffffffffc0201840:	ce468693          	addi	a3,a3,-796 # ffffffffc020c520 <commands+0x9f0>
ffffffffc0201844:	0000a617          	auipc	a2,0xa
ffffffffc0201848:	4fc60613          	addi	a2,a2,1276 # ffffffffc020bd40 <commands+0x210>
ffffffffc020184c:	0d200593          	li	a1,210
ffffffffc0201850:	0000b517          	auipc	a0,0xb
ffffffffc0201854:	c7850513          	addi	a0,a0,-904 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201858:	c47fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020185c:	0000b697          	auipc	a3,0xb
ffffffffc0201860:	ce468693          	addi	a3,a3,-796 # ffffffffc020c540 <commands+0xa10>
ffffffffc0201864:	0000a617          	auipc	a2,0xa
ffffffffc0201868:	4dc60613          	addi	a2,a2,1244 # ffffffffc020bd40 <commands+0x210>
ffffffffc020186c:	0ba00593          	li	a1,186
ffffffffc0201870:	0000b517          	auipc	a0,0xb
ffffffffc0201874:	c5850513          	addi	a0,a0,-936 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201878:	c27fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020187c:	0000b697          	auipc	a3,0xb
ffffffffc0201880:	f6c68693          	addi	a3,a3,-148 # ffffffffc020c7e8 <commands+0xcb8>
ffffffffc0201884:	0000a617          	auipc	a2,0xa
ffffffffc0201888:	4bc60613          	addi	a2,a2,1212 # ffffffffc020bd40 <commands+0x210>
ffffffffc020188c:	12400593          	li	a1,292
ffffffffc0201890:	0000b517          	auipc	a0,0xb
ffffffffc0201894:	c3850513          	addi	a0,a0,-968 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201898:	c07fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020189c:	0000b697          	auipc	a3,0xb
ffffffffc02018a0:	dec68693          	addi	a3,a3,-532 # ffffffffc020c688 <commands+0xb58>
ffffffffc02018a4:	0000a617          	auipc	a2,0xa
ffffffffc02018a8:	49c60613          	addi	a2,a2,1180 # ffffffffc020bd40 <commands+0x210>
ffffffffc02018ac:	11900593          	li	a1,281
ffffffffc02018b0:	0000b517          	auipc	a0,0xb
ffffffffc02018b4:	c1850513          	addi	a0,a0,-1000 # ffffffffc020c4c8 <commands+0x998>
ffffffffc02018b8:	be7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018bc:	0000b697          	auipc	a3,0xb
ffffffffc02018c0:	d6c68693          	addi	a3,a3,-660 # ffffffffc020c628 <commands+0xaf8>
ffffffffc02018c4:	0000a617          	auipc	a2,0xa
ffffffffc02018c8:	47c60613          	addi	a2,a2,1148 # ffffffffc020bd40 <commands+0x210>
ffffffffc02018cc:	11700593          	li	a1,279
ffffffffc02018d0:	0000b517          	auipc	a0,0xb
ffffffffc02018d4:	bf850513          	addi	a0,a0,-1032 # ffffffffc020c4c8 <commands+0x998>
ffffffffc02018d8:	bc7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018dc:	0000b697          	auipc	a3,0xb
ffffffffc02018e0:	d0c68693          	addi	a3,a3,-756 # ffffffffc020c5e8 <commands+0xab8>
ffffffffc02018e4:	0000a617          	auipc	a2,0xa
ffffffffc02018e8:	45c60613          	addi	a2,a2,1116 # ffffffffc020bd40 <commands+0x210>
ffffffffc02018ec:	0c000593          	li	a1,192
ffffffffc02018f0:	0000b517          	auipc	a0,0xb
ffffffffc02018f4:	bd850513          	addi	a0,a0,-1064 # ffffffffc020c4c8 <commands+0x998>
ffffffffc02018f8:	ba7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018fc:	0000b697          	auipc	a3,0xb
ffffffffc0201900:	eac68693          	addi	a3,a3,-340 # ffffffffc020c7a8 <commands+0xc78>
ffffffffc0201904:	0000a617          	auipc	a2,0xa
ffffffffc0201908:	43c60613          	addi	a2,a2,1084 # ffffffffc020bd40 <commands+0x210>
ffffffffc020190c:	11100593          	li	a1,273
ffffffffc0201910:	0000b517          	auipc	a0,0xb
ffffffffc0201914:	bb850513          	addi	a0,a0,-1096 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201918:	b87fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020191c:	0000b697          	auipc	a3,0xb
ffffffffc0201920:	e6c68693          	addi	a3,a3,-404 # ffffffffc020c788 <commands+0xc58>
ffffffffc0201924:	0000a617          	auipc	a2,0xa
ffffffffc0201928:	41c60613          	addi	a2,a2,1052 # ffffffffc020bd40 <commands+0x210>
ffffffffc020192c:	10f00593          	li	a1,271
ffffffffc0201930:	0000b517          	auipc	a0,0xb
ffffffffc0201934:	b9850513          	addi	a0,a0,-1128 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201938:	b67fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020193c:	0000b697          	auipc	a3,0xb
ffffffffc0201940:	e2468693          	addi	a3,a3,-476 # ffffffffc020c760 <commands+0xc30>
ffffffffc0201944:	0000a617          	auipc	a2,0xa
ffffffffc0201948:	3fc60613          	addi	a2,a2,1020 # ffffffffc020bd40 <commands+0x210>
ffffffffc020194c:	10d00593          	li	a1,269
ffffffffc0201950:	0000b517          	auipc	a0,0xb
ffffffffc0201954:	b7850513          	addi	a0,a0,-1160 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201958:	b47fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020195c:	0000b697          	auipc	a3,0xb
ffffffffc0201960:	ddc68693          	addi	a3,a3,-548 # ffffffffc020c738 <commands+0xc08>
ffffffffc0201964:	0000a617          	auipc	a2,0xa
ffffffffc0201968:	3dc60613          	addi	a2,a2,988 # ffffffffc020bd40 <commands+0x210>
ffffffffc020196c:	10c00593          	li	a1,268
ffffffffc0201970:	0000b517          	auipc	a0,0xb
ffffffffc0201974:	b5850513          	addi	a0,a0,-1192 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201978:	b27fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020197c:	0000b697          	auipc	a3,0xb
ffffffffc0201980:	dac68693          	addi	a3,a3,-596 # ffffffffc020c728 <commands+0xbf8>
ffffffffc0201984:	0000a617          	auipc	a2,0xa
ffffffffc0201988:	3bc60613          	addi	a2,a2,956 # ffffffffc020bd40 <commands+0x210>
ffffffffc020198c:	10700593          	li	a1,263
ffffffffc0201990:	0000b517          	auipc	a0,0xb
ffffffffc0201994:	b3850513          	addi	a0,a0,-1224 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201998:	b07fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020199c:	0000b697          	auipc	a3,0xb
ffffffffc02019a0:	c8c68693          	addi	a3,a3,-884 # ffffffffc020c628 <commands+0xaf8>
ffffffffc02019a4:	0000a617          	auipc	a2,0xa
ffffffffc02019a8:	39c60613          	addi	a2,a2,924 # ffffffffc020bd40 <commands+0x210>
ffffffffc02019ac:	10600593          	li	a1,262
ffffffffc02019b0:	0000b517          	auipc	a0,0xb
ffffffffc02019b4:	b1850513          	addi	a0,a0,-1256 # ffffffffc020c4c8 <commands+0x998>
ffffffffc02019b8:	ae7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019bc:	0000b697          	auipc	a3,0xb
ffffffffc02019c0:	d4c68693          	addi	a3,a3,-692 # ffffffffc020c708 <commands+0xbd8>
ffffffffc02019c4:	0000a617          	auipc	a2,0xa
ffffffffc02019c8:	37c60613          	addi	a2,a2,892 # ffffffffc020bd40 <commands+0x210>
ffffffffc02019cc:	10500593          	li	a1,261
ffffffffc02019d0:	0000b517          	auipc	a0,0xb
ffffffffc02019d4:	af850513          	addi	a0,a0,-1288 # ffffffffc020c4c8 <commands+0x998>
ffffffffc02019d8:	ac7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019dc:	0000b697          	auipc	a3,0xb
ffffffffc02019e0:	cfc68693          	addi	a3,a3,-772 # ffffffffc020c6d8 <commands+0xba8>
ffffffffc02019e4:	0000a617          	auipc	a2,0xa
ffffffffc02019e8:	35c60613          	addi	a2,a2,860 # ffffffffc020bd40 <commands+0x210>
ffffffffc02019ec:	10400593          	li	a1,260
ffffffffc02019f0:	0000b517          	auipc	a0,0xb
ffffffffc02019f4:	ad850513          	addi	a0,a0,-1320 # ffffffffc020c4c8 <commands+0x998>
ffffffffc02019f8:	aa7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019fc:	0000b697          	auipc	a3,0xb
ffffffffc0201a00:	cc468693          	addi	a3,a3,-828 # ffffffffc020c6c0 <commands+0xb90>
ffffffffc0201a04:	0000a617          	auipc	a2,0xa
ffffffffc0201a08:	33c60613          	addi	a2,a2,828 # ffffffffc020bd40 <commands+0x210>
ffffffffc0201a0c:	10300593          	li	a1,259
ffffffffc0201a10:	0000b517          	auipc	a0,0xb
ffffffffc0201a14:	ab850513          	addi	a0,a0,-1352 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201a18:	a87fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a1c:	0000b697          	auipc	a3,0xb
ffffffffc0201a20:	c0c68693          	addi	a3,a3,-1012 # ffffffffc020c628 <commands+0xaf8>
ffffffffc0201a24:	0000a617          	auipc	a2,0xa
ffffffffc0201a28:	31c60613          	addi	a2,a2,796 # ffffffffc020bd40 <commands+0x210>
ffffffffc0201a2c:	0fd00593          	li	a1,253
ffffffffc0201a30:	0000b517          	auipc	a0,0xb
ffffffffc0201a34:	a9850513          	addi	a0,a0,-1384 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201a38:	a67fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a3c:	0000b697          	auipc	a3,0xb
ffffffffc0201a40:	c6c68693          	addi	a3,a3,-916 # ffffffffc020c6a8 <commands+0xb78>
ffffffffc0201a44:	0000a617          	auipc	a2,0xa
ffffffffc0201a48:	2fc60613          	addi	a2,a2,764 # ffffffffc020bd40 <commands+0x210>
ffffffffc0201a4c:	0f800593          	li	a1,248
ffffffffc0201a50:	0000b517          	auipc	a0,0xb
ffffffffc0201a54:	a7850513          	addi	a0,a0,-1416 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201a58:	a47fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a5c:	0000b697          	auipc	a3,0xb
ffffffffc0201a60:	d6c68693          	addi	a3,a3,-660 # ffffffffc020c7c8 <commands+0xc98>
ffffffffc0201a64:	0000a617          	auipc	a2,0xa
ffffffffc0201a68:	2dc60613          	addi	a2,a2,732 # ffffffffc020bd40 <commands+0x210>
ffffffffc0201a6c:	11600593          	li	a1,278
ffffffffc0201a70:	0000b517          	auipc	a0,0xb
ffffffffc0201a74:	a5850513          	addi	a0,a0,-1448 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201a78:	a27fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a7c:	0000b697          	auipc	a3,0xb
ffffffffc0201a80:	d7c68693          	addi	a3,a3,-644 # ffffffffc020c7f8 <commands+0xcc8>
ffffffffc0201a84:	0000a617          	auipc	a2,0xa
ffffffffc0201a88:	2bc60613          	addi	a2,a2,700 # ffffffffc020bd40 <commands+0x210>
ffffffffc0201a8c:	12500593          	li	a1,293
ffffffffc0201a90:	0000b517          	auipc	a0,0xb
ffffffffc0201a94:	a3850513          	addi	a0,a0,-1480 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201a98:	a07fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a9c:	0000b697          	auipc	a3,0xb
ffffffffc0201aa0:	a4468693          	addi	a3,a3,-1468 # ffffffffc020c4e0 <commands+0x9b0>
ffffffffc0201aa4:	0000a617          	auipc	a2,0xa
ffffffffc0201aa8:	29c60613          	addi	a2,a2,668 # ffffffffc020bd40 <commands+0x210>
ffffffffc0201aac:	0f200593          	li	a1,242
ffffffffc0201ab0:	0000b517          	auipc	a0,0xb
ffffffffc0201ab4:	a1850513          	addi	a0,a0,-1512 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201ab8:	9e7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201abc:	0000b697          	auipc	a3,0xb
ffffffffc0201ac0:	a6468693          	addi	a3,a3,-1436 # ffffffffc020c520 <commands+0x9f0>
ffffffffc0201ac4:	0000a617          	auipc	a2,0xa
ffffffffc0201ac8:	27c60613          	addi	a2,a2,636 # ffffffffc020bd40 <commands+0x210>
ffffffffc0201acc:	0b900593          	li	a1,185
ffffffffc0201ad0:	0000b517          	auipc	a0,0xb
ffffffffc0201ad4:	9f850513          	addi	a0,a0,-1544 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201ad8:	9c7fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201adc <default_free_pages>:
ffffffffc0201adc:	1141                	addi	sp,sp,-16
ffffffffc0201ade:	e406                	sd	ra,8(sp)
ffffffffc0201ae0:	14058463          	beqz	a1,ffffffffc0201c28 <default_free_pages+0x14c>
ffffffffc0201ae4:	00659693          	slli	a3,a1,0x6
ffffffffc0201ae8:	96aa                	add	a3,a3,a0
ffffffffc0201aea:	87aa                	mv	a5,a0
ffffffffc0201aec:	02d50263          	beq	a0,a3,ffffffffc0201b10 <default_free_pages+0x34>
ffffffffc0201af0:	6798                	ld	a4,8(a5)
ffffffffc0201af2:	8b05                	andi	a4,a4,1
ffffffffc0201af4:	10071a63          	bnez	a4,ffffffffc0201c08 <default_free_pages+0x12c>
ffffffffc0201af8:	6798                	ld	a4,8(a5)
ffffffffc0201afa:	8b09                	andi	a4,a4,2
ffffffffc0201afc:	10071663          	bnez	a4,ffffffffc0201c08 <default_free_pages+0x12c>
ffffffffc0201b00:	0007b423          	sd	zero,8(a5)
ffffffffc0201b04:	0007a023          	sw	zero,0(a5)
ffffffffc0201b08:	04078793          	addi	a5,a5,64
ffffffffc0201b0c:	fed792e3          	bne	a5,a3,ffffffffc0201af0 <default_free_pages+0x14>
ffffffffc0201b10:	2581                	sext.w	a1,a1
ffffffffc0201b12:	c90c                	sw	a1,16(a0)
ffffffffc0201b14:	00850893          	addi	a7,a0,8
ffffffffc0201b18:	4789                	li	a5,2
ffffffffc0201b1a:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0201b1e:	00090697          	auipc	a3,0x90
ffffffffc0201b22:	c8a68693          	addi	a3,a3,-886 # ffffffffc02917a8 <free_area>
ffffffffc0201b26:	4a98                	lw	a4,16(a3)
ffffffffc0201b28:	669c                	ld	a5,8(a3)
ffffffffc0201b2a:	01850613          	addi	a2,a0,24
ffffffffc0201b2e:	9db9                	addw	a1,a1,a4
ffffffffc0201b30:	ca8c                	sw	a1,16(a3)
ffffffffc0201b32:	0ad78463          	beq	a5,a3,ffffffffc0201bda <default_free_pages+0xfe>
ffffffffc0201b36:	fe878713          	addi	a4,a5,-24
ffffffffc0201b3a:	0006b803          	ld	a6,0(a3)
ffffffffc0201b3e:	4581                	li	a1,0
ffffffffc0201b40:	00e56a63          	bltu	a0,a4,ffffffffc0201b54 <default_free_pages+0x78>
ffffffffc0201b44:	6798                	ld	a4,8(a5)
ffffffffc0201b46:	04d70c63          	beq	a4,a3,ffffffffc0201b9e <default_free_pages+0xc2>
ffffffffc0201b4a:	87ba                	mv	a5,a4
ffffffffc0201b4c:	fe878713          	addi	a4,a5,-24
ffffffffc0201b50:	fee57ae3          	bgeu	a0,a4,ffffffffc0201b44 <default_free_pages+0x68>
ffffffffc0201b54:	c199                	beqz	a1,ffffffffc0201b5a <default_free_pages+0x7e>
ffffffffc0201b56:	0106b023          	sd	a6,0(a3)
ffffffffc0201b5a:	6398                	ld	a4,0(a5)
ffffffffc0201b5c:	e390                	sd	a2,0(a5)
ffffffffc0201b5e:	e710                	sd	a2,8(a4)
ffffffffc0201b60:	f11c                	sd	a5,32(a0)
ffffffffc0201b62:	ed18                	sd	a4,24(a0)
ffffffffc0201b64:	00d70d63          	beq	a4,a3,ffffffffc0201b7e <default_free_pages+0xa2>
ffffffffc0201b68:	ff872583          	lw	a1,-8(a4)
ffffffffc0201b6c:	fe870613          	addi	a2,a4,-24
ffffffffc0201b70:	02059813          	slli	a6,a1,0x20
ffffffffc0201b74:	01a85793          	srli	a5,a6,0x1a
ffffffffc0201b78:	97b2                	add	a5,a5,a2
ffffffffc0201b7a:	02f50c63          	beq	a0,a5,ffffffffc0201bb2 <default_free_pages+0xd6>
ffffffffc0201b7e:	711c                	ld	a5,32(a0)
ffffffffc0201b80:	00d78c63          	beq	a5,a3,ffffffffc0201b98 <default_free_pages+0xbc>
ffffffffc0201b84:	4910                	lw	a2,16(a0)
ffffffffc0201b86:	fe878693          	addi	a3,a5,-24
ffffffffc0201b8a:	02061593          	slli	a1,a2,0x20
ffffffffc0201b8e:	01a5d713          	srli	a4,a1,0x1a
ffffffffc0201b92:	972a                	add	a4,a4,a0
ffffffffc0201b94:	04e68a63          	beq	a3,a4,ffffffffc0201be8 <default_free_pages+0x10c>
ffffffffc0201b98:	60a2                	ld	ra,8(sp)
ffffffffc0201b9a:	0141                	addi	sp,sp,16
ffffffffc0201b9c:	8082                	ret
ffffffffc0201b9e:	e790                	sd	a2,8(a5)
ffffffffc0201ba0:	f114                	sd	a3,32(a0)
ffffffffc0201ba2:	6798                	ld	a4,8(a5)
ffffffffc0201ba4:	ed1c                	sd	a5,24(a0)
ffffffffc0201ba6:	02d70763          	beq	a4,a3,ffffffffc0201bd4 <default_free_pages+0xf8>
ffffffffc0201baa:	8832                	mv	a6,a2
ffffffffc0201bac:	4585                	li	a1,1
ffffffffc0201bae:	87ba                	mv	a5,a4
ffffffffc0201bb0:	bf71                	j	ffffffffc0201b4c <default_free_pages+0x70>
ffffffffc0201bb2:	491c                	lw	a5,16(a0)
ffffffffc0201bb4:	9dbd                	addw	a1,a1,a5
ffffffffc0201bb6:	feb72c23          	sw	a1,-8(a4)
ffffffffc0201bba:	57f5                	li	a5,-3
ffffffffc0201bbc:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0201bc0:	01853803          	ld	a6,24(a0)
ffffffffc0201bc4:	710c                	ld	a1,32(a0)
ffffffffc0201bc6:	8532                	mv	a0,a2
ffffffffc0201bc8:	00b83423          	sd	a1,8(a6)
ffffffffc0201bcc:	671c                	ld	a5,8(a4)
ffffffffc0201bce:	0105b023          	sd	a6,0(a1)
ffffffffc0201bd2:	b77d                	j	ffffffffc0201b80 <default_free_pages+0xa4>
ffffffffc0201bd4:	e290                	sd	a2,0(a3)
ffffffffc0201bd6:	873e                	mv	a4,a5
ffffffffc0201bd8:	bf41                	j	ffffffffc0201b68 <default_free_pages+0x8c>
ffffffffc0201bda:	60a2                	ld	ra,8(sp)
ffffffffc0201bdc:	e390                	sd	a2,0(a5)
ffffffffc0201bde:	e790                	sd	a2,8(a5)
ffffffffc0201be0:	f11c                	sd	a5,32(a0)
ffffffffc0201be2:	ed1c                	sd	a5,24(a0)
ffffffffc0201be4:	0141                	addi	sp,sp,16
ffffffffc0201be6:	8082                	ret
ffffffffc0201be8:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201bec:	ff078693          	addi	a3,a5,-16
ffffffffc0201bf0:	9e39                	addw	a2,a2,a4
ffffffffc0201bf2:	c910                	sw	a2,16(a0)
ffffffffc0201bf4:	5775                	li	a4,-3
ffffffffc0201bf6:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc0201bfa:	6398                	ld	a4,0(a5)
ffffffffc0201bfc:	679c                	ld	a5,8(a5)
ffffffffc0201bfe:	60a2                	ld	ra,8(sp)
ffffffffc0201c00:	e71c                	sd	a5,8(a4)
ffffffffc0201c02:	e398                	sd	a4,0(a5)
ffffffffc0201c04:	0141                	addi	sp,sp,16
ffffffffc0201c06:	8082                	ret
ffffffffc0201c08:	0000b697          	auipc	a3,0xb
ffffffffc0201c0c:	c0868693          	addi	a3,a3,-1016 # ffffffffc020c810 <commands+0xce0>
ffffffffc0201c10:	0000a617          	auipc	a2,0xa
ffffffffc0201c14:	13060613          	addi	a2,a2,304 # ffffffffc020bd40 <commands+0x210>
ffffffffc0201c18:	08200593          	li	a1,130
ffffffffc0201c1c:	0000b517          	auipc	a0,0xb
ffffffffc0201c20:	8ac50513          	addi	a0,a0,-1876 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201c24:	87bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201c28:	0000b697          	auipc	a3,0xb
ffffffffc0201c2c:	be068693          	addi	a3,a3,-1056 # ffffffffc020c808 <commands+0xcd8>
ffffffffc0201c30:	0000a617          	auipc	a2,0xa
ffffffffc0201c34:	11060613          	addi	a2,a2,272 # ffffffffc020bd40 <commands+0x210>
ffffffffc0201c38:	07f00593          	li	a1,127
ffffffffc0201c3c:	0000b517          	auipc	a0,0xb
ffffffffc0201c40:	88c50513          	addi	a0,a0,-1908 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201c44:	85bfe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201c48 <default_alloc_pages>:
ffffffffc0201c48:	c941                	beqz	a0,ffffffffc0201cd8 <default_alloc_pages+0x90>
ffffffffc0201c4a:	00090597          	auipc	a1,0x90
ffffffffc0201c4e:	b5e58593          	addi	a1,a1,-1186 # ffffffffc02917a8 <free_area>
ffffffffc0201c52:	0105a803          	lw	a6,16(a1)
ffffffffc0201c56:	872a                	mv	a4,a0
ffffffffc0201c58:	02081793          	slli	a5,a6,0x20
ffffffffc0201c5c:	9381                	srli	a5,a5,0x20
ffffffffc0201c5e:	00a7ee63          	bltu	a5,a0,ffffffffc0201c7a <default_alloc_pages+0x32>
ffffffffc0201c62:	87ae                	mv	a5,a1
ffffffffc0201c64:	a801                	j	ffffffffc0201c74 <default_alloc_pages+0x2c>
ffffffffc0201c66:	ff87a683          	lw	a3,-8(a5)
ffffffffc0201c6a:	02069613          	slli	a2,a3,0x20
ffffffffc0201c6e:	9201                	srli	a2,a2,0x20
ffffffffc0201c70:	00e67763          	bgeu	a2,a4,ffffffffc0201c7e <default_alloc_pages+0x36>
ffffffffc0201c74:	679c                	ld	a5,8(a5)
ffffffffc0201c76:	feb798e3          	bne	a5,a1,ffffffffc0201c66 <default_alloc_pages+0x1e>
ffffffffc0201c7a:	4501                	li	a0,0
ffffffffc0201c7c:	8082                	ret
ffffffffc0201c7e:	0007b883          	ld	a7,0(a5)
ffffffffc0201c82:	0087b303          	ld	t1,8(a5)
ffffffffc0201c86:	fe878513          	addi	a0,a5,-24
ffffffffc0201c8a:	00070e1b          	sext.w	t3,a4
ffffffffc0201c8e:	0068b423          	sd	t1,8(a7) # 10000008 <_binary_bin_sfs_img_size+0xff8ad08>
ffffffffc0201c92:	01133023          	sd	a7,0(t1)
ffffffffc0201c96:	02c77863          	bgeu	a4,a2,ffffffffc0201cc6 <default_alloc_pages+0x7e>
ffffffffc0201c9a:	071a                	slli	a4,a4,0x6
ffffffffc0201c9c:	972a                	add	a4,a4,a0
ffffffffc0201c9e:	41c686bb          	subw	a3,a3,t3
ffffffffc0201ca2:	cb14                	sw	a3,16(a4)
ffffffffc0201ca4:	00870613          	addi	a2,a4,8
ffffffffc0201ca8:	4689                	li	a3,2
ffffffffc0201caa:	40d6302f          	amoor.d	zero,a3,(a2)
ffffffffc0201cae:	0088b683          	ld	a3,8(a7)
ffffffffc0201cb2:	01870613          	addi	a2,a4,24
ffffffffc0201cb6:	0105a803          	lw	a6,16(a1)
ffffffffc0201cba:	e290                	sd	a2,0(a3)
ffffffffc0201cbc:	00c8b423          	sd	a2,8(a7)
ffffffffc0201cc0:	f314                	sd	a3,32(a4)
ffffffffc0201cc2:	01173c23          	sd	a7,24(a4)
ffffffffc0201cc6:	41c8083b          	subw	a6,a6,t3
ffffffffc0201cca:	0105a823          	sw	a6,16(a1)
ffffffffc0201cce:	5775                	li	a4,-3
ffffffffc0201cd0:	17c1                	addi	a5,a5,-16
ffffffffc0201cd2:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0201cd6:	8082                	ret
ffffffffc0201cd8:	1141                	addi	sp,sp,-16
ffffffffc0201cda:	0000b697          	auipc	a3,0xb
ffffffffc0201cde:	b2e68693          	addi	a3,a3,-1234 # ffffffffc020c808 <commands+0xcd8>
ffffffffc0201ce2:	0000a617          	auipc	a2,0xa
ffffffffc0201ce6:	05e60613          	addi	a2,a2,94 # ffffffffc020bd40 <commands+0x210>
ffffffffc0201cea:	06100593          	li	a1,97
ffffffffc0201cee:	0000a517          	auipc	a0,0xa
ffffffffc0201cf2:	7da50513          	addi	a0,a0,2010 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201cf6:	e406                	sd	ra,8(sp)
ffffffffc0201cf8:	fa6fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201cfc <default_init_memmap>:
ffffffffc0201cfc:	1141                	addi	sp,sp,-16
ffffffffc0201cfe:	e406                	sd	ra,8(sp)
ffffffffc0201d00:	c5f1                	beqz	a1,ffffffffc0201dcc <default_init_memmap+0xd0>
ffffffffc0201d02:	00659693          	slli	a3,a1,0x6
ffffffffc0201d06:	96aa                	add	a3,a3,a0
ffffffffc0201d08:	87aa                	mv	a5,a0
ffffffffc0201d0a:	00d50f63          	beq	a0,a3,ffffffffc0201d28 <default_init_memmap+0x2c>
ffffffffc0201d0e:	6798                	ld	a4,8(a5)
ffffffffc0201d10:	8b05                	andi	a4,a4,1
ffffffffc0201d12:	cf49                	beqz	a4,ffffffffc0201dac <default_init_memmap+0xb0>
ffffffffc0201d14:	0007a823          	sw	zero,16(a5)
ffffffffc0201d18:	0007b423          	sd	zero,8(a5)
ffffffffc0201d1c:	0007a023          	sw	zero,0(a5)
ffffffffc0201d20:	04078793          	addi	a5,a5,64
ffffffffc0201d24:	fed795e3          	bne	a5,a3,ffffffffc0201d0e <default_init_memmap+0x12>
ffffffffc0201d28:	2581                	sext.w	a1,a1
ffffffffc0201d2a:	c90c                	sw	a1,16(a0)
ffffffffc0201d2c:	4789                	li	a5,2
ffffffffc0201d2e:	00850713          	addi	a4,a0,8
ffffffffc0201d32:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc0201d36:	00090697          	auipc	a3,0x90
ffffffffc0201d3a:	a7268693          	addi	a3,a3,-1422 # ffffffffc02917a8 <free_area>
ffffffffc0201d3e:	4a98                	lw	a4,16(a3)
ffffffffc0201d40:	669c                	ld	a5,8(a3)
ffffffffc0201d42:	01850613          	addi	a2,a0,24
ffffffffc0201d46:	9db9                	addw	a1,a1,a4
ffffffffc0201d48:	ca8c                	sw	a1,16(a3)
ffffffffc0201d4a:	04d78a63          	beq	a5,a3,ffffffffc0201d9e <default_init_memmap+0xa2>
ffffffffc0201d4e:	fe878713          	addi	a4,a5,-24
ffffffffc0201d52:	0006b803          	ld	a6,0(a3)
ffffffffc0201d56:	4581                	li	a1,0
ffffffffc0201d58:	00e56a63          	bltu	a0,a4,ffffffffc0201d6c <default_init_memmap+0x70>
ffffffffc0201d5c:	6798                	ld	a4,8(a5)
ffffffffc0201d5e:	02d70263          	beq	a4,a3,ffffffffc0201d82 <default_init_memmap+0x86>
ffffffffc0201d62:	87ba                	mv	a5,a4
ffffffffc0201d64:	fe878713          	addi	a4,a5,-24
ffffffffc0201d68:	fee57ae3          	bgeu	a0,a4,ffffffffc0201d5c <default_init_memmap+0x60>
ffffffffc0201d6c:	c199                	beqz	a1,ffffffffc0201d72 <default_init_memmap+0x76>
ffffffffc0201d6e:	0106b023          	sd	a6,0(a3)
ffffffffc0201d72:	6398                	ld	a4,0(a5)
ffffffffc0201d74:	60a2                	ld	ra,8(sp)
ffffffffc0201d76:	e390                	sd	a2,0(a5)
ffffffffc0201d78:	e710                	sd	a2,8(a4)
ffffffffc0201d7a:	f11c                	sd	a5,32(a0)
ffffffffc0201d7c:	ed18                	sd	a4,24(a0)
ffffffffc0201d7e:	0141                	addi	sp,sp,16
ffffffffc0201d80:	8082                	ret
ffffffffc0201d82:	e790                	sd	a2,8(a5)
ffffffffc0201d84:	f114                	sd	a3,32(a0)
ffffffffc0201d86:	6798                	ld	a4,8(a5)
ffffffffc0201d88:	ed1c                	sd	a5,24(a0)
ffffffffc0201d8a:	00d70663          	beq	a4,a3,ffffffffc0201d96 <default_init_memmap+0x9a>
ffffffffc0201d8e:	8832                	mv	a6,a2
ffffffffc0201d90:	4585                	li	a1,1
ffffffffc0201d92:	87ba                	mv	a5,a4
ffffffffc0201d94:	bfc1                	j	ffffffffc0201d64 <default_init_memmap+0x68>
ffffffffc0201d96:	60a2                	ld	ra,8(sp)
ffffffffc0201d98:	e290                	sd	a2,0(a3)
ffffffffc0201d9a:	0141                	addi	sp,sp,16
ffffffffc0201d9c:	8082                	ret
ffffffffc0201d9e:	60a2                	ld	ra,8(sp)
ffffffffc0201da0:	e390                	sd	a2,0(a5)
ffffffffc0201da2:	e790                	sd	a2,8(a5)
ffffffffc0201da4:	f11c                	sd	a5,32(a0)
ffffffffc0201da6:	ed1c                	sd	a5,24(a0)
ffffffffc0201da8:	0141                	addi	sp,sp,16
ffffffffc0201daa:	8082                	ret
ffffffffc0201dac:	0000b697          	auipc	a3,0xb
ffffffffc0201db0:	a8c68693          	addi	a3,a3,-1396 # ffffffffc020c838 <commands+0xd08>
ffffffffc0201db4:	0000a617          	auipc	a2,0xa
ffffffffc0201db8:	f8c60613          	addi	a2,a2,-116 # ffffffffc020bd40 <commands+0x210>
ffffffffc0201dbc:	04800593          	li	a1,72
ffffffffc0201dc0:	0000a517          	auipc	a0,0xa
ffffffffc0201dc4:	70850513          	addi	a0,a0,1800 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201dc8:	ed6fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201dcc:	0000b697          	auipc	a3,0xb
ffffffffc0201dd0:	a3c68693          	addi	a3,a3,-1476 # ffffffffc020c808 <commands+0xcd8>
ffffffffc0201dd4:	0000a617          	auipc	a2,0xa
ffffffffc0201dd8:	f6c60613          	addi	a2,a2,-148 # ffffffffc020bd40 <commands+0x210>
ffffffffc0201ddc:	04500593          	li	a1,69
ffffffffc0201de0:	0000a517          	auipc	a0,0xa
ffffffffc0201de4:	6e850513          	addi	a0,a0,1768 # ffffffffc020c4c8 <commands+0x998>
ffffffffc0201de8:	eb6fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201dec <slob_free>:
ffffffffc0201dec:	c94d                	beqz	a0,ffffffffc0201e9e <slob_free+0xb2>
ffffffffc0201dee:	1141                	addi	sp,sp,-16
ffffffffc0201df0:	e022                	sd	s0,0(sp)
ffffffffc0201df2:	e406                	sd	ra,8(sp)
ffffffffc0201df4:	842a                	mv	s0,a0
ffffffffc0201df6:	e9c1                	bnez	a1,ffffffffc0201e86 <slob_free+0x9a>
ffffffffc0201df8:	100027f3          	csrr	a5,sstatus
ffffffffc0201dfc:	8b89                	andi	a5,a5,2
ffffffffc0201dfe:	4501                	li	a0,0
ffffffffc0201e00:	ebd9                	bnez	a5,ffffffffc0201e96 <slob_free+0xaa>
ffffffffc0201e02:	0008f617          	auipc	a2,0x8f
ffffffffc0201e06:	24e60613          	addi	a2,a2,590 # ffffffffc0291050 <slobfree>
ffffffffc0201e0a:	621c                	ld	a5,0(a2)
ffffffffc0201e0c:	873e                	mv	a4,a5
ffffffffc0201e0e:	679c                	ld	a5,8(a5)
ffffffffc0201e10:	02877a63          	bgeu	a4,s0,ffffffffc0201e44 <slob_free+0x58>
ffffffffc0201e14:	00f46463          	bltu	s0,a5,ffffffffc0201e1c <slob_free+0x30>
ffffffffc0201e18:	fef76ae3          	bltu	a4,a5,ffffffffc0201e0c <slob_free+0x20>
ffffffffc0201e1c:	400c                	lw	a1,0(s0)
ffffffffc0201e1e:	00459693          	slli	a3,a1,0x4
ffffffffc0201e22:	96a2                	add	a3,a3,s0
ffffffffc0201e24:	02d78a63          	beq	a5,a3,ffffffffc0201e58 <slob_free+0x6c>
ffffffffc0201e28:	4314                	lw	a3,0(a4)
ffffffffc0201e2a:	e41c                	sd	a5,8(s0)
ffffffffc0201e2c:	00469793          	slli	a5,a3,0x4
ffffffffc0201e30:	97ba                	add	a5,a5,a4
ffffffffc0201e32:	02f40e63          	beq	s0,a5,ffffffffc0201e6e <slob_free+0x82>
ffffffffc0201e36:	e700                	sd	s0,8(a4)
ffffffffc0201e38:	e218                	sd	a4,0(a2)
ffffffffc0201e3a:	e129                	bnez	a0,ffffffffc0201e7c <slob_free+0x90>
ffffffffc0201e3c:	60a2                	ld	ra,8(sp)
ffffffffc0201e3e:	6402                	ld	s0,0(sp)
ffffffffc0201e40:	0141                	addi	sp,sp,16
ffffffffc0201e42:	8082                	ret
ffffffffc0201e44:	fcf764e3          	bltu	a4,a5,ffffffffc0201e0c <slob_free+0x20>
ffffffffc0201e48:	fcf472e3          	bgeu	s0,a5,ffffffffc0201e0c <slob_free+0x20>
ffffffffc0201e4c:	400c                	lw	a1,0(s0)
ffffffffc0201e4e:	00459693          	slli	a3,a1,0x4
ffffffffc0201e52:	96a2                	add	a3,a3,s0
ffffffffc0201e54:	fcd79ae3          	bne	a5,a3,ffffffffc0201e28 <slob_free+0x3c>
ffffffffc0201e58:	4394                	lw	a3,0(a5)
ffffffffc0201e5a:	679c                	ld	a5,8(a5)
ffffffffc0201e5c:	9db5                	addw	a1,a1,a3
ffffffffc0201e5e:	c00c                	sw	a1,0(s0)
ffffffffc0201e60:	4314                	lw	a3,0(a4)
ffffffffc0201e62:	e41c                	sd	a5,8(s0)
ffffffffc0201e64:	00469793          	slli	a5,a3,0x4
ffffffffc0201e68:	97ba                	add	a5,a5,a4
ffffffffc0201e6a:	fcf416e3          	bne	s0,a5,ffffffffc0201e36 <slob_free+0x4a>
ffffffffc0201e6e:	401c                	lw	a5,0(s0)
ffffffffc0201e70:	640c                	ld	a1,8(s0)
ffffffffc0201e72:	e218                	sd	a4,0(a2)
ffffffffc0201e74:	9ebd                	addw	a3,a3,a5
ffffffffc0201e76:	c314                	sw	a3,0(a4)
ffffffffc0201e78:	e70c                	sd	a1,8(a4)
ffffffffc0201e7a:	d169                	beqz	a0,ffffffffc0201e3c <slob_free+0x50>
ffffffffc0201e7c:	6402                	ld	s0,0(sp)
ffffffffc0201e7e:	60a2                	ld	ra,8(sp)
ffffffffc0201e80:	0141                	addi	sp,sp,16
ffffffffc0201e82:	debfe06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0201e86:	25bd                	addiw	a1,a1,15
ffffffffc0201e88:	8191                	srli	a1,a1,0x4
ffffffffc0201e8a:	c10c                	sw	a1,0(a0)
ffffffffc0201e8c:	100027f3          	csrr	a5,sstatus
ffffffffc0201e90:	8b89                	andi	a5,a5,2
ffffffffc0201e92:	4501                	li	a0,0
ffffffffc0201e94:	d7bd                	beqz	a5,ffffffffc0201e02 <slob_free+0x16>
ffffffffc0201e96:	dddfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201e9a:	4505                	li	a0,1
ffffffffc0201e9c:	b79d                	j	ffffffffc0201e02 <slob_free+0x16>
ffffffffc0201e9e:	8082                	ret

ffffffffc0201ea0 <__slob_get_free_pages.constprop.0>:
ffffffffc0201ea0:	4785                	li	a5,1
ffffffffc0201ea2:	1141                	addi	sp,sp,-16
ffffffffc0201ea4:	00a7953b          	sllw	a0,a5,a0
ffffffffc0201ea8:	e406                	sd	ra,8(sp)
ffffffffc0201eaa:	352000ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc0201eae:	c91d                	beqz	a0,ffffffffc0201ee4 <__slob_get_free_pages.constprop.0+0x44>
ffffffffc0201eb0:	00095697          	auipc	a3,0x95
ffffffffc0201eb4:	9f86b683          	ld	a3,-1544(a3) # ffffffffc02968a8 <pages>
ffffffffc0201eb8:	8d15                	sub	a0,a0,a3
ffffffffc0201eba:	8519                	srai	a0,a0,0x6
ffffffffc0201ebc:	0000e697          	auipc	a3,0xe
ffffffffc0201ec0:	e6c6b683          	ld	a3,-404(a3) # ffffffffc020fd28 <nbase>
ffffffffc0201ec4:	9536                	add	a0,a0,a3
ffffffffc0201ec6:	00c51793          	slli	a5,a0,0xc
ffffffffc0201eca:	83b1                	srli	a5,a5,0xc
ffffffffc0201ecc:	00095717          	auipc	a4,0x95
ffffffffc0201ed0:	9d473703          	ld	a4,-1580(a4) # ffffffffc02968a0 <npage>
ffffffffc0201ed4:	0532                	slli	a0,a0,0xc
ffffffffc0201ed6:	00e7fa63          	bgeu	a5,a4,ffffffffc0201eea <__slob_get_free_pages.constprop.0+0x4a>
ffffffffc0201eda:	00095697          	auipc	a3,0x95
ffffffffc0201ede:	9de6b683          	ld	a3,-1570(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0201ee2:	9536                	add	a0,a0,a3
ffffffffc0201ee4:	60a2                	ld	ra,8(sp)
ffffffffc0201ee6:	0141                	addi	sp,sp,16
ffffffffc0201ee8:	8082                	ret
ffffffffc0201eea:	86aa                	mv	a3,a0
ffffffffc0201eec:	0000b617          	auipc	a2,0xb
ffffffffc0201ef0:	9ac60613          	addi	a2,a2,-1620 # ffffffffc020c898 <default_pmm_manager+0x38>
ffffffffc0201ef4:	07100593          	li	a1,113
ffffffffc0201ef8:	0000b517          	auipc	a0,0xb
ffffffffc0201efc:	9c850513          	addi	a0,a0,-1592 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc0201f00:	d9efe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201f04 <slob_alloc.constprop.0>:
ffffffffc0201f04:	1101                	addi	sp,sp,-32
ffffffffc0201f06:	ec06                	sd	ra,24(sp)
ffffffffc0201f08:	e822                	sd	s0,16(sp)
ffffffffc0201f0a:	e426                	sd	s1,8(sp)
ffffffffc0201f0c:	e04a                	sd	s2,0(sp)
ffffffffc0201f0e:	01050713          	addi	a4,a0,16
ffffffffc0201f12:	6785                	lui	a5,0x1
ffffffffc0201f14:	0cf77363          	bgeu	a4,a5,ffffffffc0201fda <slob_alloc.constprop.0+0xd6>
ffffffffc0201f18:	00f50493          	addi	s1,a0,15
ffffffffc0201f1c:	8091                	srli	s1,s1,0x4
ffffffffc0201f1e:	2481                	sext.w	s1,s1
ffffffffc0201f20:	10002673          	csrr	a2,sstatus
ffffffffc0201f24:	8a09                	andi	a2,a2,2
ffffffffc0201f26:	e25d                	bnez	a2,ffffffffc0201fcc <slob_alloc.constprop.0+0xc8>
ffffffffc0201f28:	0008f917          	auipc	s2,0x8f
ffffffffc0201f2c:	12890913          	addi	s2,s2,296 # ffffffffc0291050 <slobfree>
ffffffffc0201f30:	00093683          	ld	a3,0(s2)
ffffffffc0201f34:	669c                	ld	a5,8(a3)
ffffffffc0201f36:	4398                	lw	a4,0(a5)
ffffffffc0201f38:	08975e63          	bge	a4,s1,ffffffffc0201fd4 <slob_alloc.constprop.0+0xd0>
ffffffffc0201f3c:	00f68b63          	beq	a3,a5,ffffffffc0201f52 <slob_alloc.constprop.0+0x4e>
ffffffffc0201f40:	6780                	ld	s0,8(a5)
ffffffffc0201f42:	4018                	lw	a4,0(s0)
ffffffffc0201f44:	02975a63          	bge	a4,s1,ffffffffc0201f78 <slob_alloc.constprop.0+0x74>
ffffffffc0201f48:	00093683          	ld	a3,0(s2)
ffffffffc0201f4c:	87a2                	mv	a5,s0
ffffffffc0201f4e:	fef699e3          	bne	a3,a5,ffffffffc0201f40 <slob_alloc.constprop.0+0x3c>
ffffffffc0201f52:	ee31                	bnez	a2,ffffffffc0201fae <slob_alloc.constprop.0+0xaa>
ffffffffc0201f54:	4501                	li	a0,0
ffffffffc0201f56:	f4bff0ef          	jal	ra,ffffffffc0201ea0 <__slob_get_free_pages.constprop.0>
ffffffffc0201f5a:	842a                	mv	s0,a0
ffffffffc0201f5c:	cd05                	beqz	a0,ffffffffc0201f94 <slob_alloc.constprop.0+0x90>
ffffffffc0201f5e:	6585                	lui	a1,0x1
ffffffffc0201f60:	e8dff0ef          	jal	ra,ffffffffc0201dec <slob_free>
ffffffffc0201f64:	10002673          	csrr	a2,sstatus
ffffffffc0201f68:	8a09                	andi	a2,a2,2
ffffffffc0201f6a:	ee05                	bnez	a2,ffffffffc0201fa2 <slob_alloc.constprop.0+0x9e>
ffffffffc0201f6c:	00093783          	ld	a5,0(s2)
ffffffffc0201f70:	6780                	ld	s0,8(a5)
ffffffffc0201f72:	4018                	lw	a4,0(s0)
ffffffffc0201f74:	fc974ae3          	blt	a4,s1,ffffffffc0201f48 <slob_alloc.constprop.0+0x44>
ffffffffc0201f78:	04e48763          	beq	s1,a4,ffffffffc0201fc6 <slob_alloc.constprop.0+0xc2>
ffffffffc0201f7c:	00449693          	slli	a3,s1,0x4
ffffffffc0201f80:	96a2                	add	a3,a3,s0
ffffffffc0201f82:	e794                	sd	a3,8(a5)
ffffffffc0201f84:	640c                	ld	a1,8(s0)
ffffffffc0201f86:	9f05                	subw	a4,a4,s1
ffffffffc0201f88:	c298                	sw	a4,0(a3)
ffffffffc0201f8a:	e68c                	sd	a1,8(a3)
ffffffffc0201f8c:	c004                	sw	s1,0(s0)
ffffffffc0201f8e:	00f93023          	sd	a5,0(s2)
ffffffffc0201f92:	e20d                	bnez	a2,ffffffffc0201fb4 <slob_alloc.constprop.0+0xb0>
ffffffffc0201f94:	60e2                	ld	ra,24(sp)
ffffffffc0201f96:	8522                	mv	a0,s0
ffffffffc0201f98:	6442                	ld	s0,16(sp)
ffffffffc0201f9a:	64a2                	ld	s1,8(sp)
ffffffffc0201f9c:	6902                	ld	s2,0(sp)
ffffffffc0201f9e:	6105                	addi	sp,sp,32
ffffffffc0201fa0:	8082                	ret
ffffffffc0201fa2:	cd1fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201fa6:	00093783          	ld	a5,0(s2)
ffffffffc0201faa:	4605                	li	a2,1
ffffffffc0201fac:	b7d1                	j	ffffffffc0201f70 <slob_alloc.constprop.0+0x6c>
ffffffffc0201fae:	cbffe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201fb2:	b74d                	j	ffffffffc0201f54 <slob_alloc.constprop.0+0x50>
ffffffffc0201fb4:	cb9fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201fb8:	60e2                	ld	ra,24(sp)
ffffffffc0201fba:	8522                	mv	a0,s0
ffffffffc0201fbc:	6442                	ld	s0,16(sp)
ffffffffc0201fbe:	64a2                	ld	s1,8(sp)
ffffffffc0201fc0:	6902                	ld	s2,0(sp)
ffffffffc0201fc2:	6105                	addi	sp,sp,32
ffffffffc0201fc4:	8082                	ret
ffffffffc0201fc6:	6418                	ld	a4,8(s0)
ffffffffc0201fc8:	e798                	sd	a4,8(a5)
ffffffffc0201fca:	b7d1                	j	ffffffffc0201f8e <slob_alloc.constprop.0+0x8a>
ffffffffc0201fcc:	ca7fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201fd0:	4605                	li	a2,1
ffffffffc0201fd2:	bf99                	j	ffffffffc0201f28 <slob_alloc.constprop.0+0x24>
ffffffffc0201fd4:	843e                	mv	s0,a5
ffffffffc0201fd6:	87b6                	mv	a5,a3
ffffffffc0201fd8:	b745                	j	ffffffffc0201f78 <slob_alloc.constprop.0+0x74>
ffffffffc0201fda:	0000b697          	auipc	a3,0xb
ffffffffc0201fde:	8f668693          	addi	a3,a3,-1802 # ffffffffc020c8d0 <default_pmm_manager+0x70>
ffffffffc0201fe2:	0000a617          	auipc	a2,0xa
ffffffffc0201fe6:	d5e60613          	addi	a2,a2,-674 # ffffffffc020bd40 <commands+0x210>
ffffffffc0201fea:	06300593          	li	a1,99
ffffffffc0201fee:	0000b517          	auipc	a0,0xb
ffffffffc0201ff2:	90250513          	addi	a0,a0,-1790 # ffffffffc020c8f0 <default_pmm_manager+0x90>
ffffffffc0201ff6:	ca8fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201ffa <kmalloc_init>:
ffffffffc0201ffa:	1141                	addi	sp,sp,-16
ffffffffc0201ffc:	0000b517          	auipc	a0,0xb
ffffffffc0202000:	90c50513          	addi	a0,a0,-1780 # ffffffffc020c908 <default_pmm_manager+0xa8>
ffffffffc0202004:	e406                	sd	ra,8(sp)
ffffffffc0202006:	9a0fe0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020200a:	60a2                	ld	ra,8(sp)
ffffffffc020200c:	0000b517          	auipc	a0,0xb
ffffffffc0202010:	91450513          	addi	a0,a0,-1772 # ffffffffc020c920 <default_pmm_manager+0xc0>
ffffffffc0202014:	0141                	addi	sp,sp,16
ffffffffc0202016:	990fe06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc020201a <kallocated>:
ffffffffc020201a:	4501                	li	a0,0
ffffffffc020201c:	8082                	ret

ffffffffc020201e <kmalloc>:
ffffffffc020201e:	1101                	addi	sp,sp,-32
ffffffffc0202020:	e04a                	sd	s2,0(sp)
ffffffffc0202022:	6905                	lui	s2,0x1
ffffffffc0202024:	e822                	sd	s0,16(sp)
ffffffffc0202026:	ec06                	sd	ra,24(sp)
ffffffffc0202028:	e426                	sd	s1,8(sp)
ffffffffc020202a:	fef90793          	addi	a5,s2,-17 # fef <_binary_bin_swap_img_size-0x6d11>
ffffffffc020202e:	842a                	mv	s0,a0
ffffffffc0202030:	04a7f963          	bgeu	a5,a0,ffffffffc0202082 <kmalloc+0x64>
ffffffffc0202034:	4561                	li	a0,24
ffffffffc0202036:	ecfff0ef          	jal	ra,ffffffffc0201f04 <slob_alloc.constprop.0>
ffffffffc020203a:	84aa                	mv	s1,a0
ffffffffc020203c:	c929                	beqz	a0,ffffffffc020208e <kmalloc+0x70>
ffffffffc020203e:	0004079b          	sext.w	a5,s0
ffffffffc0202042:	4501                	li	a0,0
ffffffffc0202044:	00f95763          	bge	s2,a5,ffffffffc0202052 <kmalloc+0x34>
ffffffffc0202048:	6705                	lui	a4,0x1
ffffffffc020204a:	8785                	srai	a5,a5,0x1
ffffffffc020204c:	2505                	addiw	a0,a0,1
ffffffffc020204e:	fef74ee3          	blt	a4,a5,ffffffffc020204a <kmalloc+0x2c>
ffffffffc0202052:	c088                	sw	a0,0(s1)
ffffffffc0202054:	e4dff0ef          	jal	ra,ffffffffc0201ea0 <__slob_get_free_pages.constprop.0>
ffffffffc0202058:	e488                	sd	a0,8(s1)
ffffffffc020205a:	842a                	mv	s0,a0
ffffffffc020205c:	c525                	beqz	a0,ffffffffc02020c4 <kmalloc+0xa6>
ffffffffc020205e:	100027f3          	csrr	a5,sstatus
ffffffffc0202062:	8b89                	andi	a5,a5,2
ffffffffc0202064:	ef8d                	bnez	a5,ffffffffc020209e <kmalloc+0x80>
ffffffffc0202066:	00095797          	auipc	a5,0x95
ffffffffc020206a:	82278793          	addi	a5,a5,-2014 # ffffffffc0296888 <bigblocks>
ffffffffc020206e:	6398                	ld	a4,0(a5)
ffffffffc0202070:	e384                	sd	s1,0(a5)
ffffffffc0202072:	e898                	sd	a4,16(s1)
ffffffffc0202074:	60e2                	ld	ra,24(sp)
ffffffffc0202076:	8522                	mv	a0,s0
ffffffffc0202078:	6442                	ld	s0,16(sp)
ffffffffc020207a:	64a2                	ld	s1,8(sp)
ffffffffc020207c:	6902                	ld	s2,0(sp)
ffffffffc020207e:	6105                	addi	sp,sp,32
ffffffffc0202080:	8082                	ret
ffffffffc0202082:	0541                	addi	a0,a0,16
ffffffffc0202084:	e81ff0ef          	jal	ra,ffffffffc0201f04 <slob_alloc.constprop.0>
ffffffffc0202088:	01050413          	addi	s0,a0,16
ffffffffc020208c:	f565                	bnez	a0,ffffffffc0202074 <kmalloc+0x56>
ffffffffc020208e:	4401                	li	s0,0
ffffffffc0202090:	60e2                	ld	ra,24(sp)
ffffffffc0202092:	8522                	mv	a0,s0
ffffffffc0202094:	6442                	ld	s0,16(sp)
ffffffffc0202096:	64a2                	ld	s1,8(sp)
ffffffffc0202098:	6902                	ld	s2,0(sp)
ffffffffc020209a:	6105                	addi	sp,sp,32
ffffffffc020209c:	8082                	ret
ffffffffc020209e:	bd5fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02020a2:	00094797          	auipc	a5,0x94
ffffffffc02020a6:	7e678793          	addi	a5,a5,2022 # ffffffffc0296888 <bigblocks>
ffffffffc02020aa:	6398                	ld	a4,0(a5)
ffffffffc02020ac:	e384                	sd	s1,0(a5)
ffffffffc02020ae:	e898                	sd	a4,16(s1)
ffffffffc02020b0:	bbdfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02020b4:	6480                	ld	s0,8(s1)
ffffffffc02020b6:	60e2                	ld	ra,24(sp)
ffffffffc02020b8:	64a2                	ld	s1,8(sp)
ffffffffc02020ba:	8522                	mv	a0,s0
ffffffffc02020bc:	6442                	ld	s0,16(sp)
ffffffffc02020be:	6902                	ld	s2,0(sp)
ffffffffc02020c0:	6105                	addi	sp,sp,32
ffffffffc02020c2:	8082                	ret
ffffffffc02020c4:	45e1                	li	a1,24
ffffffffc02020c6:	8526                	mv	a0,s1
ffffffffc02020c8:	d25ff0ef          	jal	ra,ffffffffc0201dec <slob_free>
ffffffffc02020cc:	b765                	j	ffffffffc0202074 <kmalloc+0x56>

ffffffffc02020ce <kfree>:
ffffffffc02020ce:	c169                	beqz	a0,ffffffffc0202190 <kfree+0xc2>
ffffffffc02020d0:	1101                	addi	sp,sp,-32
ffffffffc02020d2:	e822                	sd	s0,16(sp)
ffffffffc02020d4:	ec06                	sd	ra,24(sp)
ffffffffc02020d6:	e426                	sd	s1,8(sp)
ffffffffc02020d8:	03451793          	slli	a5,a0,0x34
ffffffffc02020dc:	842a                	mv	s0,a0
ffffffffc02020de:	e3d9                	bnez	a5,ffffffffc0202164 <kfree+0x96>
ffffffffc02020e0:	100027f3          	csrr	a5,sstatus
ffffffffc02020e4:	8b89                	andi	a5,a5,2
ffffffffc02020e6:	e7d9                	bnez	a5,ffffffffc0202174 <kfree+0xa6>
ffffffffc02020e8:	00094797          	auipc	a5,0x94
ffffffffc02020ec:	7a07b783          	ld	a5,1952(a5) # ffffffffc0296888 <bigblocks>
ffffffffc02020f0:	4601                	li	a2,0
ffffffffc02020f2:	cbad                	beqz	a5,ffffffffc0202164 <kfree+0x96>
ffffffffc02020f4:	00094697          	auipc	a3,0x94
ffffffffc02020f8:	79468693          	addi	a3,a3,1940 # ffffffffc0296888 <bigblocks>
ffffffffc02020fc:	a021                	j	ffffffffc0202104 <kfree+0x36>
ffffffffc02020fe:	01048693          	addi	a3,s1,16
ffffffffc0202102:	c3a5                	beqz	a5,ffffffffc0202162 <kfree+0x94>
ffffffffc0202104:	6798                	ld	a4,8(a5)
ffffffffc0202106:	84be                	mv	s1,a5
ffffffffc0202108:	6b9c                	ld	a5,16(a5)
ffffffffc020210a:	fe871ae3          	bne	a4,s0,ffffffffc02020fe <kfree+0x30>
ffffffffc020210e:	e29c                	sd	a5,0(a3)
ffffffffc0202110:	ee2d                	bnez	a2,ffffffffc020218a <kfree+0xbc>
ffffffffc0202112:	c02007b7          	lui	a5,0xc0200
ffffffffc0202116:	4098                	lw	a4,0(s1)
ffffffffc0202118:	08f46963          	bltu	s0,a5,ffffffffc02021aa <kfree+0xdc>
ffffffffc020211c:	00094697          	auipc	a3,0x94
ffffffffc0202120:	79c6b683          	ld	a3,1948(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202124:	8c15                	sub	s0,s0,a3
ffffffffc0202126:	8031                	srli	s0,s0,0xc
ffffffffc0202128:	00094797          	auipc	a5,0x94
ffffffffc020212c:	7787b783          	ld	a5,1912(a5) # ffffffffc02968a0 <npage>
ffffffffc0202130:	06f47163          	bgeu	s0,a5,ffffffffc0202192 <kfree+0xc4>
ffffffffc0202134:	0000e517          	auipc	a0,0xe
ffffffffc0202138:	bf453503          	ld	a0,-1036(a0) # ffffffffc020fd28 <nbase>
ffffffffc020213c:	8c09                	sub	s0,s0,a0
ffffffffc020213e:	041a                	slli	s0,s0,0x6
ffffffffc0202140:	00094517          	auipc	a0,0x94
ffffffffc0202144:	76853503          	ld	a0,1896(a0) # ffffffffc02968a8 <pages>
ffffffffc0202148:	4585                	li	a1,1
ffffffffc020214a:	9522                	add	a0,a0,s0
ffffffffc020214c:	00e595bb          	sllw	a1,a1,a4
ffffffffc0202150:	0ea000ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc0202154:	6442                	ld	s0,16(sp)
ffffffffc0202156:	60e2                	ld	ra,24(sp)
ffffffffc0202158:	8526                	mv	a0,s1
ffffffffc020215a:	64a2                	ld	s1,8(sp)
ffffffffc020215c:	45e1                	li	a1,24
ffffffffc020215e:	6105                	addi	sp,sp,32
ffffffffc0202160:	b171                	j	ffffffffc0201dec <slob_free>
ffffffffc0202162:	e20d                	bnez	a2,ffffffffc0202184 <kfree+0xb6>
ffffffffc0202164:	ff040513          	addi	a0,s0,-16
ffffffffc0202168:	6442                	ld	s0,16(sp)
ffffffffc020216a:	60e2                	ld	ra,24(sp)
ffffffffc020216c:	64a2                	ld	s1,8(sp)
ffffffffc020216e:	4581                	li	a1,0
ffffffffc0202170:	6105                	addi	sp,sp,32
ffffffffc0202172:	b9ad                	j	ffffffffc0201dec <slob_free>
ffffffffc0202174:	afffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202178:	00094797          	auipc	a5,0x94
ffffffffc020217c:	7107b783          	ld	a5,1808(a5) # ffffffffc0296888 <bigblocks>
ffffffffc0202180:	4605                	li	a2,1
ffffffffc0202182:	fbad                	bnez	a5,ffffffffc02020f4 <kfree+0x26>
ffffffffc0202184:	ae9fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202188:	bff1                	j	ffffffffc0202164 <kfree+0x96>
ffffffffc020218a:	ae3fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020218e:	b751                	j	ffffffffc0202112 <kfree+0x44>
ffffffffc0202190:	8082                	ret
ffffffffc0202192:	0000a617          	auipc	a2,0xa
ffffffffc0202196:	7d660613          	addi	a2,a2,2006 # ffffffffc020c968 <default_pmm_manager+0x108>
ffffffffc020219a:	06900593          	li	a1,105
ffffffffc020219e:	0000a517          	auipc	a0,0xa
ffffffffc02021a2:	72250513          	addi	a0,a0,1826 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc02021a6:	af8fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02021aa:	86a2                	mv	a3,s0
ffffffffc02021ac:	0000a617          	auipc	a2,0xa
ffffffffc02021b0:	79460613          	addi	a2,a2,1940 # ffffffffc020c940 <default_pmm_manager+0xe0>
ffffffffc02021b4:	07700593          	li	a1,119
ffffffffc02021b8:	0000a517          	auipc	a0,0xa
ffffffffc02021bc:	70850513          	addi	a0,a0,1800 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc02021c0:	adefe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02021c4 <pa2page.part.0>:
ffffffffc02021c4:	1141                	addi	sp,sp,-16
ffffffffc02021c6:	0000a617          	auipc	a2,0xa
ffffffffc02021ca:	7a260613          	addi	a2,a2,1954 # ffffffffc020c968 <default_pmm_manager+0x108>
ffffffffc02021ce:	06900593          	li	a1,105
ffffffffc02021d2:	0000a517          	auipc	a0,0xa
ffffffffc02021d6:	6ee50513          	addi	a0,a0,1774 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc02021da:	e406                	sd	ra,8(sp)
ffffffffc02021dc:	ac2fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02021e0 <pte2page.part.0>:
ffffffffc02021e0:	1141                	addi	sp,sp,-16
ffffffffc02021e2:	0000a617          	auipc	a2,0xa
ffffffffc02021e6:	7a660613          	addi	a2,a2,1958 # ffffffffc020c988 <default_pmm_manager+0x128>
ffffffffc02021ea:	07f00593          	li	a1,127
ffffffffc02021ee:	0000a517          	auipc	a0,0xa
ffffffffc02021f2:	6d250513          	addi	a0,a0,1746 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc02021f6:	e406                	sd	ra,8(sp)
ffffffffc02021f8:	aa6fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02021fc <alloc_pages>:
ffffffffc02021fc:	100027f3          	csrr	a5,sstatus
ffffffffc0202200:	8b89                	andi	a5,a5,2
ffffffffc0202202:	e799                	bnez	a5,ffffffffc0202210 <alloc_pages+0x14>
ffffffffc0202204:	00094797          	auipc	a5,0x94
ffffffffc0202208:	6ac7b783          	ld	a5,1708(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020220c:	6f9c                	ld	a5,24(a5)
ffffffffc020220e:	8782                	jr	a5
ffffffffc0202210:	1141                	addi	sp,sp,-16
ffffffffc0202212:	e406                	sd	ra,8(sp)
ffffffffc0202214:	e022                	sd	s0,0(sp)
ffffffffc0202216:	842a                	mv	s0,a0
ffffffffc0202218:	a5bfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020221c:	00094797          	auipc	a5,0x94
ffffffffc0202220:	6947b783          	ld	a5,1684(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202224:	6f9c                	ld	a5,24(a5)
ffffffffc0202226:	8522                	mv	a0,s0
ffffffffc0202228:	9782                	jalr	a5
ffffffffc020222a:	842a                	mv	s0,a0
ffffffffc020222c:	a41fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202230:	60a2                	ld	ra,8(sp)
ffffffffc0202232:	8522                	mv	a0,s0
ffffffffc0202234:	6402                	ld	s0,0(sp)
ffffffffc0202236:	0141                	addi	sp,sp,16
ffffffffc0202238:	8082                	ret

ffffffffc020223a <free_pages>:
ffffffffc020223a:	100027f3          	csrr	a5,sstatus
ffffffffc020223e:	8b89                	andi	a5,a5,2
ffffffffc0202240:	e799                	bnez	a5,ffffffffc020224e <free_pages+0x14>
ffffffffc0202242:	00094797          	auipc	a5,0x94
ffffffffc0202246:	66e7b783          	ld	a5,1646(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020224a:	739c                	ld	a5,32(a5)
ffffffffc020224c:	8782                	jr	a5
ffffffffc020224e:	1101                	addi	sp,sp,-32
ffffffffc0202250:	ec06                	sd	ra,24(sp)
ffffffffc0202252:	e822                	sd	s0,16(sp)
ffffffffc0202254:	e426                	sd	s1,8(sp)
ffffffffc0202256:	842a                	mv	s0,a0
ffffffffc0202258:	84ae                	mv	s1,a1
ffffffffc020225a:	a19fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020225e:	00094797          	auipc	a5,0x94
ffffffffc0202262:	6527b783          	ld	a5,1618(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202266:	739c                	ld	a5,32(a5)
ffffffffc0202268:	85a6                	mv	a1,s1
ffffffffc020226a:	8522                	mv	a0,s0
ffffffffc020226c:	9782                	jalr	a5
ffffffffc020226e:	6442                	ld	s0,16(sp)
ffffffffc0202270:	60e2                	ld	ra,24(sp)
ffffffffc0202272:	64a2                	ld	s1,8(sp)
ffffffffc0202274:	6105                	addi	sp,sp,32
ffffffffc0202276:	9f7fe06f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc020227a <nr_free_pages>:
ffffffffc020227a:	100027f3          	csrr	a5,sstatus
ffffffffc020227e:	8b89                	andi	a5,a5,2
ffffffffc0202280:	e799                	bnez	a5,ffffffffc020228e <nr_free_pages+0x14>
ffffffffc0202282:	00094797          	auipc	a5,0x94
ffffffffc0202286:	62e7b783          	ld	a5,1582(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020228a:	779c                	ld	a5,40(a5)
ffffffffc020228c:	8782                	jr	a5
ffffffffc020228e:	1141                	addi	sp,sp,-16
ffffffffc0202290:	e406                	sd	ra,8(sp)
ffffffffc0202292:	e022                	sd	s0,0(sp)
ffffffffc0202294:	9dffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202298:	00094797          	auipc	a5,0x94
ffffffffc020229c:	6187b783          	ld	a5,1560(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02022a0:	779c                	ld	a5,40(a5)
ffffffffc02022a2:	9782                	jalr	a5
ffffffffc02022a4:	842a                	mv	s0,a0
ffffffffc02022a6:	9c7fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02022aa:	60a2                	ld	ra,8(sp)
ffffffffc02022ac:	8522                	mv	a0,s0
ffffffffc02022ae:	6402                	ld	s0,0(sp)
ffffffffc02022b0:	0141                	addi	sp,sp,16
ffffffffc02022b2:	8082                	ret

ffffffffc02022b4 <get_pte>:
ffffffffc02022b4:	01e5d793          	srli	a5,a1,0x1e
ffffffffc02022b8:	1ff7f793          	andi	a5,a5,511
ffffffffc02022bc:	7139                	addi	sp,sp,-64
ffffffffc02022be:	078e                	slli	a5,a5,0x3
ffffffffc02022c0:	f426                	sd	s1,40(sp)
ffffffffc02022c2:	00f504b3          	add	s1,a0,a5
ffffffffc02022c6:	6094                	ld	a3,0(s1)
ffffffffc02022c8:	f04a                	sd	s2,32(sp)
ffffffffc02022ca:	ec4e                	sd	s3,24(sp)
ffffffffc02022cc:	e852                	sd	s4,16(sp)
ffffffffc02022ce:	fc06                	sd	ra,56(sp)
ffffffffc02022d0:	f822                	sd	s0,48(sp)
ffffffffc02022d2:	e456                	sd	s5,8(sp)
ffffffffc02022d4:	e05a                	sd	s6,0(sp)
ffffffffc02022d6:	0016f793          	andi	a5,a3,1
ffffffffc02022da:	892e                	mv	s2,a1
ffffffffc02022dc:	8a32                	mv	s4,a2
ffffffffc02022de:	00094997          	auipc	s3,0x94
ffffffffc02022e2:	5c298993          	addi	s3,s3,1474 # ffffffffc02968a0 <npage>
ffffffffc02022e6:	efbd                	bnez	a5,ffffffffc0202364 <get_pte+0xb0>
ffffffffc02022e8:	14060c63          	beqz	a2,ffffffffc0202440 <get_pte+0x18c>
ffffffffc02022ec:	100027f3          	csrr	a5,sstatus
ffffffffc02022f0:	8b89                	andi	a5,a5,2
ffffffffc02022f2:	14079963          	bnez	a5,ffffffffc0202444 <get_pte+0x190>
ffffffffc02022f6:	00094797          	auipc	a5,0x94
ffffffffc02022fa:	5ba7b783          	ld	a5,1466(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02022fe:	6f9c                	ld	a5,24(a5)
ffffffffc0202300:	4505                	li	a0,1
ffffffffc0202302:	9782                	jalr	a5
ffffffffc0202304:	842a                	mv	s0,a0
ffffffffc0202306:	12040d63          	beqz	s0,ffffffffc0202440 <get_pte+0x18c>
ffffffffc020230a:	00094b17          	auipc	s6,0x94
ffffffffc020230e:	59eb0b13          	addi	s6,s6,1438 # ffffffffc02968a8 <pages>
ffffffffc0202312:	000b3503          	ld	a0,0(s6)
ffffffffc0202316:	00080ab7          	lui	s5,0x80
ffffffffc020231a:	00094997          	auipc	s3,0x94
ffffffffc020231e:	58698993          	addi	s3,s3,1414 # ffffffffc02968a0 <npage>
ffffffffc0202322:	40a40533          	sub	a0,s0,a0
ffffffffc0202326:	8519                	srai	a0,a0,0x6
ffffffffc0202328:	9556                	add	a0,a0,s5
ffffffffc020232a:	0009b703          	ld	a4,0(s3)
ffffffffc020232e:	00c51793          	slli	a5,a0,0xc
ffffffffc0202332:	4685                	li	a3,1
ffffffffc0202334:	c014                	sw	a3,0(s0)
ffffffffc0202336:	83b1                	srli	a5,a5,0xc
ffffffffc0202338:	0532                	slli	a0,a0,0xc
ffffffffc020233a:	16e7f763          	bgeu	a5,a4,ffffffffc02024a8 <get_pte+0x1f4>
ffffffffc020233e:	00094797          	auipc	a5,0x94
ffffffffc0202342:	57a7b783          	ld	a5,1402(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202346:	6605                	lui	a2,0x1
ffffffffc0202348:	4581                	li	a1,0
ffffffffc020234a:	953e                	add	a0,a0,a5
ffffffffc020234c:	50e090ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0202350:	000b3683          	ld	a3,0(s6)
ffffffffc0202354:	40d406b3          	sub	a3,s0,a3
ffffffffc0202358:	8699                	srai	a3,a3,0x6
ffffffffc020235a:	96d6                	add	a3,a3,s5
ffffffffc020235c:	06aa                	slli	a3,a3,0xa
ffffffffc020235e:	0116e693          	ori	a3,a3,17
ffffffffc0202362:	e094                	sd	a3,0(s1)
ffffffffc0202364:	77fd                	lui	a5,0xfffff
ffffffffc0202366:	068a                	slli	a3,a3,0x2
ffffffffc0202368:	0009b703          	ld	a4,0(s3)
ffffffffc020236c:	8efd                	and	a3,a3,a5
ffffffffc020236e:	00c6d793          	srli	a5,a3,0xc
ffffffffc0202372:	10e7ff63          	bgeu	a5,a4,ffffffffc0202490 <get_pte+0x1dc>
ffffffffc0202376:	00094a97          	auipc	s5,0x94
ffffffffc020237a:	542a8a93          	addi	s5,s5,1346 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020237e:	000ab403          	ld	s0,0(s5)
ffffffffc0202382:	01595793          	srli	a5,s2,0x15
ffffffffc0202386:	1ff7f793          	andi	a5,a5,511
ffffffffc020238a:	96a2                	add	a3,a3,s0
ffffffffc020238c:	00379413          	slli	s0,a5,0x3
ffffffffc0202390:	9436                	add	s0,s0,a3
ffffffffc0202392:	6014                	ld	a3,0(s0)
ffffffffc0202394:	0016f793          	andi	a5,a3,1
ffffffffc0202398:	ebad                	bnez	a5,ffffffffc020240a <get_pte+0x156>
ffffffffc020239a:	0a0a0363          	beqz	s4,ffffffffc0202440 <get_pte+0x18c>
ffffffffc020239e:	100027f3          	csrr	a5,sstatus
ffffffffc02023a2:	8b89                	andi	a5,a5,2
ffffffffc02023a4:	efcd                	bnez	a5,ffffffffc020245e <get_pte+0x1aa>
ffffffffc02023a6:	00094797          	auipc	a5,0x94
ffffffffc02023aa:	50a7b783          	ld	a5,1290(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02023ae:	6f9c                	ld	a5,24(a5)
ffffffffc02023b0:	4505                	li	a0,1
ffffffffc02023b2:	9782                	jalr	a5
ffffffffc02023b4:	84aa                	mv	s1,a0
ffffffffc02023b6:	c4c9                	beqz	s1,ffffffffc0202440 <get_pte+0x18c>
ffffffffc02023b8:	00094b17          	auipc	s6,0x94
ffffffffc02023bc:	4f0b0b13          	addi	s6,s6,1264 # ffffffffc02968a8 <pages>
ffffffffc02023c0:	000b3503          	ld	a0,0(s6)
ffffffffc02023c4:	00080a37          	lui	s4,0x80
ffffffffc02023c8:	0009b703          	ld	a4,0(s3)
ffffffffc02023cc:	40a48533          	sub	a0,s1,a0
ffffffffc02023d0:	8519                	srai	a0,a0,0x6
ffffffffc02023d2:	9552                	add	a0,a0,s4
ffffffffc02023d4:	00c51793          	slli	a5,a0,0xc
ffffffffc02023d8:	4685                	li	a3,1
ffffffffc02023da:	c094                	sw	a3,0(s1)
ffffffffc02023dc:	83b1                	srli	a5,a5,0xc
ffffffffc02023de:	0532                	slli	a0,a0,0xc
ffffffffc02023e0:	0ee7f163          	bgeu	a5,a4,ffffffffc02024c2 <get_pte+0x20e>
ffffffffc02023e4:	000ab783          	ld	a5,0(s5)
ffffffffc02023e8:	6605                	lui	a2,0x1
ffffffffc02023ea:	4581                	li	a1,0
ffffffffc02023ec:	953e                	add	a0,a0,a5
ffffffffc02023ee:	46c090ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc02023f2:	000b3683          	ld	a3,0(s6)
ffffffffc02023f6:	40d486b3          	sub	a3,s1,a3
ffffffffc02023fa:	8699                	srai	a3,a3,0x6
ffffffffc02023fc:	96d2                	add	a3,a3,s4
ffffffffc02023fe:	06aa                	slli	a3,a3,0xa
ffffffffc0202400:	0116e693          	ori	a3,a3,17
ffffffffc0202404:	e014                	sd	a3,0(s0)
ffffffffc0202406:	0009b703          	ld	a4,0(s3)
ffffffffc020240a:	068a                	slli	a3,a3,0x2
ffffffffc020240c:	757d                	lui	a0,0xfffff
ffffffffc020240e:	8ee9                	and	a3,a3,a0
ffffffffc0202410:	00c6d793          	srli	a5,a3,0xc
ffffffffc0202414:	06e7f263          	bgeu	a5,a4,ffffffffc0202478 <get_pte+0x1c4>
ffffffffc0202418:	000ab503          	ld	a0,0(s5)
ffffffffc020241c:	00c95913          	srli	s2,s2,0xc
ffffffffc0202420:	1ff97913          	andi	s2,s2,511
ffffffffc0202424:	96aa                	add	a3,a3,a0
ffffffffc0202426:	00391513          	slli	a0,s2,0x3
ffffffffc020242a:	9536                	add	a0,a0,a3
ffffffffc020242c:	70e2                	ld	ra,56(sp)
ffffffffc020242e:	7442                	ld	s0,48(sp)
ffffffffc0202430:	74a2                	ld	s1,40(sp)
ffffffffc0202432:	7902                	ld	s2,32(sp)
ffffffffc0202434:	69e2                	ld	s3,24(sp)
ffffffffc0202436:	6a42                	ld	s4,16(sp)
ffffffffc0202438:	6aa2                	ld	s5,8(sp)
ffffffffc020243a:	6b02                	ld	s6,0(sp)
ffffffffc020243c:	6121                	addi	sp,sp,64
ffffffffc020243e:	8082                	ret
ffffffffc0202440:	4501                	li	a0,0
ffffffffc0202442:	b7ed                	j	ffffffffc020242c <get_pte+0x178>
ffffffffc0202444:	82ffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202448:	00094797          	auipc	a5,0x94
ffffffffc020244c:	4687b783          	ld	a5,1128(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202450:	6f9c                	ld	a5,24(a5)
ffffffffc0202452:	4505                	li	a0,1
ffffffffc0202454:	9782                	jalr	a5
ffffffffc0202456:	842a                	mv	s0,a0
ffffffffc0202458:	815fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020245c:	b56d                	j	ffffffffc0202306 <get_pte+0x52>
ffffffffc020245e:	815fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202462:	00094797          	auipc	a5,0x94
ffffffffc0202466:	44e7b783          	ld	a5,1102(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020246a:	6f9c                	ld	a5,24(a5)
ffffffffc020246c:	4505                	li	a0,1
ffffffffc020246e:	9782                	jalr	a5
ffffffffc0202470:	84aa                	mv	s1,a0
ffffffffc0202472:	ffafe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202476:	b781                	j	ffffffffc02023b6 <get_pte+0x102>
ffffffffc0202478:	0000a617          	auipc	a2,0xa
ffffffffc020247c:	42060613          	addi	a2,a2,1056 # ffffffffc020c898 <default_pmm_manager+0x38>
ffffffffc0202480:	13200593          	li	a1,306
ffffffffc0202484:	0000a517          	auipc	a0,0xa
ffffffffc0202488:	52c50513          	addi	a0,a0,1324 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020248c:	812fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202490:	0000a617          	auipc	a2,0xa
ffffffffc0202494:	40860613          	addi	a2,a2,1032 # ffffffffc020c898 <default_pmm_manager+0x38>
ffffffffc0202498:	12500593          	li	a1,293
ffffffffc020249c:	0000a517          	auipc	a0,0xa
ffffffffc02024a0:	51450513          	addi	a0,a0,1300 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02024a4:	ffbfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02024a8:	86aa                	mv	a3,a0
ffffffffc02024aa:	0000a617          	auipc	a2,0xa
ffffffffc02024ae:	3ee60613          	addi	a2,a2,1006 # ffffffffc020c898 <default_pmm_manager+0x38>
ffffffffc02024b2:	12100593          	li	a1,289
ffffffffc02024b6:	0000a517          	auipc	a0,0xa
ffffffffc02024ba:	4fa50513          	addi	a0,a0,1274 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02024be:	fe1fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02024c2:	86aa                	mv	a3,a0
ffffffffc02024c4:	0000a617          	auipc	a2,0xa
ffffffffc02024c8:	3d460613          	addi	a2,a2,980 # ffffffffc020c898 <default_pmm_manager+0x38>
ffffffffc02024cc:	12f00593          	li	a1,303
ffffffffc02024d0:	0000a517          	auipc	a0,0xa
ffffffffc02024d4:	4e050513          	addi	a0,a0,1248 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02024d8:	fc7fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02024dc <boot_map_segment>:
ffffffffc02024dc:	6785                	lui	a5,0x1
ffffffffc02024de:	7139                	addi	sp,sp,-64
ffffffffc02024e0:	00d5c833          	xor	a6,a1,a3
ffffffffc02024e4:	17fd                	addi	a5,a5,-1
ffffffffc02024e6:	fc06                	sd	ra,56(sp)
ffffffffc02024e8:	f822                	sd	s0,48(sp)
ffffffffc02024ea:	f426                	sd	s1,40(sp)
ffffffffc02024ec:	f04a                	sd	s2,32(sp)
ffffffffc02024ee:	ec4e                	sd	s3,24(sp)
ffffffffc02024f0:	e852                	sd	s4,16(sp)
ffffffffc02024f2:	e456                	sd	s5,8(sp)
ffffffffc02024f4:	00f87833          	and	a6,a6,a5
ffffffffc02024f8:	08081563          	bnez	a6,ffffffffc0202582 <boot_map_segment+0xa6>
ffffffffc02024fc:	00f5f4b3          	and	s1,a1,a5
ffffffffc0202500:	963e                	add	a2,a2,a5
ffffffffc0202502:	94b2                	add	s1,s1,a2
ffffffffc0202504:	797d                	lui	s2,0xfffff
ffffffffc0202506:	80b1                	srli	s1,s1,0xc
ffffffffc0202508:	0125f5b3          	and	a1,a1,s2
ffffffffc020250c:	0126f6b3          	and	a3,a3,s2
ffffffffc0202510:	c0a1                	beqz	s1,ffffffffc0202550 <boot_map_segment+0x74>
ffffffffc0202512:	00176713          	ori	a4,a4,1
ffffffffc0202516:	04b2                	slli	s1,s1,0xc
ffffffffc0202518:	02071993          	slli	s3,a4,0x20
ffffffffc020251c:	8a2a                	mv	s4,a0
ffffffffc020251e:	842e                	mv	s0,a1
ffffffffc0202520:	94ae                	add	s1,s1,a1
ffffffffc0202522:	40b68933          	sub	s2,a3,a1
ffffffffc0202526:	0209d993          	srli	s3,s3,0x20
ffffffffc020252a:	6a85                	lui	s5,0x1
ffffffffc020252c:	4605                	li	a2,1
ffffffffc020252e:	85a2                	mv	a1,s0
ffffffffc0202530:	8552                	mv	a0,s4
ffffffffc0202532:	d83ff0ef          	jal	ra,ffffffffc02022b4 <get_pte>
ffffffffc0202536:	008907b3          	add	a5,s2,s0
ffffffffc020253a:	c505                	beqz	a0,ffffffffc0202562 <boot_map_segment+0x86>
ffffffffc020253c:	83b1                	srli	a5,a5,0xc
ffffffffc020253e:	07aa                	slli	a5,a5,0xa
ffffffffc0202540:	0137e7b3          	or	a5,a5,s3
ffffffffc0202544:	0017e793          	ori	a5,a5,1
ffffffffc0202548:	e11c                	sd	a5,0(a0)
ffffffffc020254a:	9456                	add	s0,s0,s5
ffffffffc020254c:	fe8490e3          	bne	s1,s0,ffffffffc020252c <boot_map_segment+0x50>
ffffffffc0202550:	70e2                	ld	ra,56(sp)
ffffffffc0202552:	7442                	ld	s0,48(sp)
ffffffffc0202554:	74a2                	ld	s1,40(sp)
ffffffffc0202556:	7902                	ld	s2,32(sp)
ffffffffc0202558:	69e2                	ld	s3,24(sp)
ffffffffc020255a:	6a42                	ld	s4,16(sp)
ffffffffc020255c:	6aa2                	ld	s5,8(sp)
ffffffffc020255e:	6121                	addi	sp,sp,64
ffffffffc0202560:	8082                	ret
ffffffffc0202562:	0000a697          	auipc	a3,0xa
ffffffffc0202566:	47668693          	addi	a3,a3,1142 # ffffffffc020c9d8 <default_pmm_manager+0x178>
ffffffffc020256a:	00009617          	auipc	a2,0x9
ffffffffc020256e:	7d660613          	addi	a2,a2,2006 # ffffffffc020bd40 <commands+0x210>
ffffffffc0202572:	09c00593          	li	a1,156
ffffffffc0202576:	0000a517          	auipc	a0,0xa
ffffffffc020257a:	43a50513          	addi	a0,a0,1082 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020257e:	f21fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202582:	0000a697          	auipc	a3,0xa
ffffffffc0202586:	43e68693          	addi	a3,a3,1086 # ffffffffc020c9c0 <default_pmm_manager+0x160>
ffffffffc020258a:	00009617          	auipc	a2,0x9
ffffffffc020258e:	7b660613          	addi	a2,a2,1974 # ffffffffc020bd40 <commands+0x210>
ffffffffc0202592:	09500593          	li	a1,149
ffffffffc0202596:	0000a517          	auipc	a0,0xa
ffffffffc020259a:	41a50513          	addi	a0,a0,1050 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020259e:	f01fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02025a2 <get_page>:
ffffffffc02025a2:	1141                	addi	sp,sp,-16
ffffffffc02025a4:	e022                	sd	s0,0(sp)
ffffffffc02025a6:	8432                	mv	s0,a2
ffffffffc02025a8:	4601                	li	a2,0
ffffffffc02025aa:	e406                	sd	ra,8(sp)
ffffffffc02025ac:	d09ff0ef          	jal	ra,ffffffffc02022b4 <get_pte>
ffffffffc02025b0:	c011                	beqz	s0,ffffffffc02025b4 <get_page+0x12>
ffffffffc02025b2:	e008                	sd	a0,0(s0)
ffffffffc02025b4:	c511                	beqz	a0,ffffffffc02025c0 <get_page+0x1e>
ffffffffc02025b6:	611c                	ld	a5,0(a0)
ffffffffc02025b8:	4501                	li	a0,0
ffffffffc02025ba:	0017f713          	andi	a4,a5,1
ffffffffc02025be:	e709                	bnez	a4,ffffffffc02025c8 <get_page+0x26>
ffffffffc02025c0:	60a2                	ld	ra,8(sp)
ffffffffc02025c2:	6402                	ld	s0,0(sp)
ffffffffc02025c4:	0141                	addi	sp,sp,16
ffffffffc02025c6:	8082                	ret
ffffffffc02025c8:	078a                	slli	a5,a5,0x2
ffffffffc02025ca:	83b1                	srli	a5,a5,0xc
ffffffffc02025cc:	00094717          	auipc	a4,0x94
ffffffffc02025d0:	2d473703          	ld	a4,724(a4) # ffffffffc02968a0 <npage>
ffffffffc02025d4:	00e7ff63          	bgeu	a5,a4,ffffffffc02025f2 <get_page+0x50>
ffffffffc02025d8:	60a2                	ld	ra,8(sp)
ffffffffc02025da:	6402                	ld	s0,0(sp)
ffffffffc02025dc:	fff80537          	lui	a0,0xfff80
ffffffffc02025e0:	97aa                	add	a5,a5,a0
ffffffffc02025e2:	079a                	slli	a5,a5,0x6
ffffffffc02025e4:	00094517          	auipc	a0,0x94
ffffffffc02025e8:	2c453503          	ld	a0,708(a0) # ffffffffc02968a8 <pages>
ffffffffc02025ec:	953e                	add	a0,a0,a5
ffffffffc02025ee:	0141                	addi	sp,sp,16
ffffffffc02025f0:	8082                	ret
ffffffffc02025f2:	bd3ff0ef          	jal	ra,ffffffffc02021c4 <pa2page.part.0>

ffffffffc02025f6 <unmap_range>:
ffffffffc02025f6:	7159                	addi	sp,sp,-112
ffffffffc02025f8:	00c5e7b3          	or	a5,a1,a2
ffffffffc02025fc:	f486                	sd	ra,104(sp)
ffffffffc02025fe:	f0a2                	sd	s0,96(sp)
ffffffffc0202600:	eca6                	sd	s1,88(sp)
ffffffffc0202602:	e8ca                	sd	s2,80(sp)
ffffffffc0202604:	e4ce                	sd	s3,72(sp)
ffffffffc0202606:	e0d2                	sd	s4,64(sp)
ffffffffc0202608:	fc56                	sd	s5,56(sp)
ffffffffc020260a:	f85a                	sd	s6,48(sp)
ffffffffc020260c:	f45e                	sd	s7,40(sp)
ffffffffc020260e:	f062                	sd	s8,32(sp)
ffffffffc0202610:	ec66                	sd	s9,24(sp)
ffffffffc0202612:	e86a                	sd	s10,16(sp)
ffffffffc0202614:	17d2                	slli	a5,a5,0x34
ffffffffc0202616:	e3ed                	bnez	a5,ffffffffc02026f8 <unmap_range+0x102>
ffffffffc0202618:	002007b7          	lui	a5,0x200
ffffffffc020261c:	842e                	mv	s0,a1
ffffffffc020261e:	0ef5ed63          	bltu	a1,a5,ffffffffc0202718 <unmap_range+0x122>
ffffffffc0202622:	8932                	mv	s2,a2
ffffffffc0202624:	0ec5fa63          	bgeu	a1,a2,ffffffffc0202718 <unmap_range+0x122>
ffffffffc0202628:	4785                	li	a5,1
ffffffffc020262a:	07fe                	slli	a5,a5,0x1f
ffffffffc020262c:	0ec7e663          	bltu	a5,a2,ffffffffc0202718 <unmap_range+0x122>
ffffffffc0202630:	89aa                	mv	s3,a0
ffffffffc0202632:	6a05                	lui	s4,0x1
ffffffffc0202634:	00094c97          	auipc	s9,0x94
ffffffffc0202638:	26cc8c93          	addi	s9,s9,620 # ffffffffc02968a0 <npage>
ffffffffc020263c:	00094c17          	auipc	s8,0x94
ffffffffc0202640:	26cc0c13          	addi	s8,s8,620 # ffffffffc02968a8 <pages>
ffffffffc0202644:	fff80bb7          	lui	s7,0xfff80
ffffffffc0202648:	00094d17          	auipc	s10,0x94
ffffffffc020264c:	268d0d13          	addi	s10,s10,616 # ffffffffc02968b0 <pmm_manager>
ffffffffc0202650:	00200b37          	lui	s6,0x200
ffffffffc0202654:	ffe00ab7          	lui	s5,0xffe00
ffffffffc0202658:	4601                	li	a2,0
ffffffffc020265a:	85a2                	mv	a1,s0
ffffffffc020265c:	854e                	mv	a0,s3
ffffffffc020265e:	c57ff0ef          	jal	ra,ffffffffc02022b4 <get_pte>
ffffffffc0202662:	84aa                	mv	s1,a0
ffffffffc0202664:	cd29                	beqz	a0,ffffffffc02026be <unmap_range+0xc8>
ffffffffc0202666:	611c                	ld	a5,0(a0)
ffffffffc0202668:	e395                	bnez	a5,ffffffffc020268c <unmap_range+0x96>
ffffffffc020266a:	9452                	add	s0,s0,s4
ffffffffc020266c:	ff2466e3          	bltu	s0,s2,ffffffffc0202658 <unmap_range+0x62>
ffffffffc0202670:	70a6                	ld	ra,104(sp)
ffffffffc0202672:	7406                	ld	s0,96(sp)
ffffffffc0202674:	64e6                	ld	s1,88(sp)
ffffffffc0202676:	6946                	ld	s2,80(sp)
ffffffffc0202678:	69a6                	ld	s3,72(sp)
ffffffffc020267a:	6a06                	ld	s4,64(sp)
ffffffffc020267c:	7ae2                	ld	s5,56(sp)
ffffffffc020267e:	7b42                	ld	s6,48(sp)
ffffffffc0202680:	7ba2                	ld	s7,40(sp)
ffffffffc0202682:	7c02                	ld	s8,32(sp)
ffffffffc0202684:	6ce2                	ld	s9,24(sp)
ffffffffc0202686:	6d42                	ld	s10,16(sp)
ffffffffc0202688:	6165                	addi	sp,sp,112
ffffffffc020268a:	8082                	ret
ffffffffc020268c:	0017f713          	andi	a4,a5,1
ffffffffc0202690:	df69                	beqz	a4,ffffffffc020266a <unmap_range+0x74>
ffffffffc0202692:	000cb703          	ld	a4,0(s9)
ffffffffc0202696:	078a                	slli	a5,a5,0x2
ffffffffc0202698:	83b1                	srli	a5,a5,0xc
ffffffffc020269a:	08e7ff63          	bgeu	a5,a4,ffffffffc0202738 <unmap_range+0x142>
ffffffffc020269e:	000c3503          	ld	a0,0(s8)
ffffffffc02026a2:	97de                	add	a5,a5,s7
ffffffffc02026a4:	079a                	slli	a5,a5,0x6
ffffffffc02026a6:	953e                	add	a0,a0,a5
ffffffffc02026a8:	411c                	lw	a5,0(a0)
ffffffffc02026aa:	fff7871b          	addiw	a4,a5,-1
ffffffffc02026ae:	c118                	sw	a4,0(a0)
ffffffffc02026b0:	cf11                	beqz	a4,ffffffffc02026cc <unmap_range+0xd6>
ffffffffc02026b2:	0004b023          	sd	zero,0(s1)
ffffffffc02026b6:	12040073          	sfence.vma	s0
ffffffffc02026ba:	9452                	add	s0,s0,s4
ffffffffc02026bc:	bf45                	j	ffffffffc020266c <unmap_range+0x76>
ffffffffc02026be:	945a                	add	s0,s0,s6
ffffffffc02026c0:	01547433          	and	s0,s0,s5
ffffffffc02026c4:	d455                	beqz	s0,ffffffffc0202670 <unmap_range+0x7a>
ffffffffc02026c6:	f92469e3          	bltu	s0,s2,ffffffffc0202658 <unmap_range+0x62>
ffffffffc02026ca:	b75d                	j	ffffffffc0202670 <unmap_range+0x7a>
ffffffffc02026cc:	100027f3          	csrr	a5,sstatus
ffffffffc02026d0:	8b89                	andi	a5,a5,2
ffffffffc02026d2:	e799                	bnez	a5,ffffffffc02026e0 <unmap_range+0xea>
ffffffffc02026d4:	000d3783          	ld	a5,0(s10)
ffffffffc02026d8:	4585                	li	a1,1
ffffffffc02026da:	739c                	ld	a5,32(a5)
ffffffffc02026dc:	9782                	jalr	a5
ffffffffc02026de:	bfd1                	j	ffffffffc02026b2 <unmap_range+0xbc>
ffffffffc02026e0:	e42a                	sd	a0,8(sp)
ffffffffc02026e2:	d90fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02026e6:	000d3783          	ld	a5,0(s10)
ffffffffc02026ea:	6522                	ld	a0,8(sp)
ffffffffc02026ec:	4585                	li	a1,1
ffffffffc02026ee:	739c                	ld	a5,32(a5)
ffffffffc02026f0:	9782                	jalr	a5
ffffffffc02026f2:	d7afe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02026f6:	bf75                	j	ffffffffc02026b2 <unmap_range+0xbc>
ffffffffc02026f8:	0000a697          	auipc	a3,0xa
ffffffffc02026fc:	2f068693          	addi	a3,a3,752 # ffffffffc020c9e8 <default_pmm_manager+0x188>
ffffffffc0202700:	00009617          	auipc	a2,0x9
ffffffffc0202704:	64060613          	addi	a2,a2,1600 # ffffffffc020bd40 <commands+0x210>
ffffffffc0202708:	15a00593          	li	a1,346
ffffffffc020270c:	0000a517          	auipc	a0,0xa
ffffffffc0202710:	2a450513          	addi	a0,a0,676 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0202714:	d8bfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202718:	0000a697          	auipc	a3,0xa
ffffffffc020271c:	30068693          	addi	a3,a3,768 # ffffffffc020ca18 <default_pmm_manager+0x1b8>
ffffffffc0202720:	00009617          	auipc	a2,0x9
ffffffffc0202724:	62060613          	addi	a2,a2,1568 # ffffffffc020bd40 <commands+0x210>
ffffffffc0202728:	15b00593          	li	a1,347
ffffffffc020272c:	0000a517          	auipc	a0,0xa
ffffffffc0202730:	28450513          	addi	a0,a0,644 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0202734:	d6bfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202738:	a8dff0ef          	jal	ra,ffffffffc02021c4 <pa2page.part.0>

ffffffffc020273c <exit_range>:
ffffffffc020273c:	7119                	addi	sp,sp,-128
ffffffffc020273e:	00c5e7b3          	or	a5,a1,a2
ffffffffc0202742:	fc86                	sd	ra,120(sp)
ffffffffc0202744:	f8a2                	sd	s0,112(sp)
ffffffffc0202746:	f4a6                	sd	s1,104(sp)
ffffffffc0202748:	f0ca                	sd	s2,96(sp)
ffffffffc020274a:	ecce                	sd	s3,88(sp)
ffffffffc020274c:	e8d2                	sd	s4,80(sp)
ffffffffc020274e:	e4d6                	sd	s5,72(sp)
ffffffffc0202750:	e0da                	sd	s6,64(sp)
ffffffffc0202752:	fc5e                	sd	s7,56(sp)
ffffffffc0202754:	f862                	sd	s8,48(sp)
ffffffffc0202756:	f466                	sd	s9,40(sp)
ffffffffc0202758:	f06a                	sd	s10,32(sp)
ffffffffc020275a:	ec6e                	sd	s11,24(sp)
ffffffffc020275c:	17d2                	slli	a5,a5,0x34
ffffffffc020275e:	20079a63          	bnez	a5,ffffffffc0202972 <exit_range+0x236>
ffffffffc0202762:	002007b7          	lui	a5,0x200
ffffffffc0202766:	24f5e463          	bltu	a1,a5,ffffffffc02029ae <exit_range+0x272>
ffffffffc020276a:	8ab2                	mv	s5,a2
ffffffffc020276c:	24c5f163          	bgeu	a1,a2,ffffffffc02029ae <exit_range+0x272>
ffffffffc0202770:	4785                	li	a5,1
ffffffffc0202772:	07fe                	slli	a5,a5,0x1f
ffffffffc0202774:	22c7ed63          	bltu	a5,a2,ffffffffc02029ae <exit_range+0x272>
ffffffffc0202778:	c00009b7          	lui	s3,0xc0000
ffffffffc020277c:	0135f9b3          	and	s3,a1,s3
ffffffffc0202780:	ffe00937          	lui	s2,0xffe00
ffffffffc0202784:	400007b7          	lui	a5,0x40000
ffffffffc0202788:	5cfd                	li	s9,-1
ffffffffc020278a:	8c2a                	mv	s8,a0
ffffffffc020278c:	0125f933          	and	s2,a1,s2
ffffffffc0202790:	99be                	add	s3,s3,a5
ffffffffc0202792:	00094d17          	auipc	s10,0x94
ffffffffc0202796:	10ed0d13          	addi	s10,s10,270 # ffffffffc02968a0 <npage>
ffffffffc020279a:	00ccdc93          	srli	s9,s9,0xc
ffffffffc020279e:	00094717          	auipc	a4,0x94
ffffffffc02027a2:	10a70713          	addi	a4,a4,266 # ffffffffc02968a8 <pages>
ffffffffc02027a6:	00094d97          	auipc	s11,0x94
ffffffffc02027aa:	10ad8d93          	addi	s11,s11,266 # ffffffffc02968b0 <pmm_manager>
ffffffffc02027ae:	c0000437          	lui	s0,0xc0000
ffffffffc02027b2:	944e                	add	s0,s0,s3
ffffffffc02027b4:	8079                	srli	s0,s0,0x1e
ffffffffc02027b6:	1ff47413          	andi	s0,s0,511
ffffffffc02027ba:	040e                	slli	s0,s0,0x3
ffffffffc02027bc:	9462                	add	s0,s0,s8
ffffffffc02027be:	00043a03          	ld	s4,0(s0) # ffffffffc0000000 <_binary_bin_sfs_img_size+0xffffffffbff8ad00>
ffffffffc02027c2:	001a7793          	andi	a5,s4,1
ffffffffc02027c6:	eb99                	bnez	a5,ffffffffc02027dc <exit_range+0xa0>
ffffffffc02027c8:	12098463          	beqz	s3,ffffffffc02028f0 <exit_range+0x1b4>
ffffffffc02027cc:	400007b7          	lui	a5,0x40000
ffffffffc02027d0:	97ce                	add	a5,a5,s3
ffffffffc02027d2:	894e                	mv	s2,s3
ffffffffc02027d4:	1159fe63          	bgeu	s3,s5,ffffffffc02028f0 <exit_range+0x1b4>
ffffffffc02027d8:	89be                	mv	s3,a5
ffffffffc02027da:	bfd1                	j	ffffffffc02027ae <exit_range+0x72>
ffffffffc02027dc:	000d3783          	ld	a5,0(s10)
ffffffffc02027e0:	0a0a                	slli	s4,s4,0x2
ffffffffc02027e2:	00ca5a13          	srli	s4,s4,0xc
ffffffffc02027e6:	1cfa7263          	bgeu	s4,a5,ffffffffc02029aa <exit_range+0x26e>
ffffffffc02027ea:	fff80637          	lui	a2,0xfff80
ffffffffc02027ee:	9652                	add	a2,a2,s4
ffffffffc02027f0:	000806b7          	lui	a3,0x80
ffffffffc02027f4:	96b2                	add	a3,a3,a2
ffffffffc02027f6:	0196f5b3          	and	a1,a3,s9
ffffffffc02027fa:	061a                	slli	a2,a2,0x6
ffffffffc02027fc:	06b2                	slli	a3,a3,0xc
ffffffffc02027fe:	18f5fa63          	bgeu	a1,a5,ffffffffc0202992 <exit_range+0x256>
ffffffffc0202802:	00094817          	auipc	a6,0x94
ffffffffc0202806:	0b680813          	addi	a6,a6,182 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020280a:	00083b03          	ld	s6,0(a6)
ffffffffc020280e:	4b85                	li	s7,1
ffffffffc0202810:	fff80e37          	lui	t3,0xfff80
ffffffffc0202814:	9b36                	add	s6,s6,a3
ffffffffc0202816:	00080337          	lui	t1,0x80
ffffffffc020281a:	6885                	lui	a7,0x1
ffffffffc020281c:	a819                	j	ffffffffc0202832 <exit_range+0xf6>
ffffffffc020281e:	4b81                	li	s7,0
ffffffffc0202820:	002007b7          	lui	a5,0x200
ffffffffc0202824:	993e                	add	s2,s2,a5
ffffffffc0202826:	08090c63          	beqz	s2,ffffffffc02028be <exit_range+0x182>
ffffffffc020282a:	09397a63          	bgeu	s2,s3,ffffffffc02028be <exit_range+0x182>
ffffffffc020282e:	0f597063          	bgeu	s2,s5,ffffffffc020290e <exit_range+0x1d2>
ffffffffc0202832:	01595493          	srli	s1,s2,0x15
ffffffffc0202836:	1ff4f493          	andi	s1,s1,511
ffffffffc020283a:	048e                	slli	s1,s1,0x3
ffffffffc020283c:	94da                	add	s1,s1,s6
ffffffffc020283e:	609c                	ld	a5,0(s1)
ffffffffc0202840:	0017f693          	andi	a3,a5,1
ffffffffc0202844:	dee9                	beqz	a3,ffffffffc020281e <exit_range+0xe2>
ffffffffc0202846:	000d3583          	ld	a1,0(s10)
ffffffffc020284a:	078a                	slli	a5,a5,0x2
ffffffffc020284c:	83b1                	srli	a5,a5,0xc
ffffffffc020284e:	14b7fe63          	bgeu	a5,a1,ffffffffc02029aa <exit_range+0x26e>
ffffffffc0202852:	97f2                	add	a5,a5,t3
ffffffffc0202854:	006786b3          	add	a3,a5,t1
ffffffffc0202858:	0196feb3          	and	t4,a3,s9
ffffffffc020285c:	00679513          	slli	a0,a5,0x6
ffffffffc0202860:	06b2                	slli	a3,a3,0xc
ffffffffc0202862:	12bef863          	bgeu	t4,a1,ffffffffc0202992 <exit_range+0x256>
ffffffffc0202866:	00083783          	ld	a5,0(a6)
ffffffffc020286a:	96be                	add	a3,a3,a5
ffffffffc020286c:	011685b3          	add	a1,a3,a7
ffffffffc0202870:	629c                	ld	a5,0(a3)
ffffffffc0202872:	8b85                	andi	a5,a5,1
ffffffffc0202874:	f7d5                	bnez	a5,ffffffffc0202820 <exit_range+0xe4>
ffffffffc0202876:	06a1                	addi	a3,a3,8
ffffffffc0202878:	fed59ce3          	bne	a1,a3,ffffffffc0202870 <exit_range+0x134>
ffffffffc020287c:	631c                	ld	a5,0(a4)
ffffffffc020287e:	953e                	add	a0,a0,a5
ffffffffc0202880:	100027f3          	csrr	a5,sstatus
ffffffffc0202884:	8b89                	andi	a5,a5,2
ffffffffc0202886:	e7d9                	bnez	a5,ffffffffc0202914 <exit_range+0x1d8>
ffffffffc0202888:	000db783          	ld	a5,0(s11)
ffffffffc020288c:	4585                	li	a1,1
ffffffffc020288e:	e032                	sd	a2,0(sp)
ffffffffc0202890:	739c                	ld	a5,32(a5)
ffffffffc0202892:	9782                	jalr	a5
ffffffffc0202894:	6602                	ld	a2,0(sp)
ffffffffc0202896:	00094817          	auipc	a6,0x94
ffffffffc020289a:	02280813          	addi	a6,a6,34 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020289e:	fff80e37          	lui	t3,0xfff80
ffffffffc02028a2:	00080337          	lui	t1,0x80
ffffffffc02028a6:	6885                	lui	a7,0x1
ffffffffc02028a8:	00094717          	auipc	a4,0x94
ffffffffc02028ac:	00070713          	mv	a4,a4
ffffffffc02028b0:	0004b023          	sd	zero,0(s1)
ffffffffc02028b4:	002007b7          	lui	a5,0x200
ffffffffc02028b8:	993e                	add	s2,s2,a5
ffffffffc02028ba:	f60918e3          	bnez	s2,ffffffffc020282a <exit_range+0xee>
ffffffffc02028be:	f00b85e3          	beqz	s7,ffffffffc02027c8 <exit_range+0x8c>
ffffffffc02028c2:	000d3783          	ld	a5,0(s10)
ffffffffc02028c6:	0efa7263          	bgeu	s4,a5,ffffffffc02029aa <exit_range+0x26e>
ffffffffc02028ca:	6308                	ld	a0,0(a4)
ffffffffc02028cc:	9532                	add	a0,a0,a2
ffffffffc02028ce:	100027f3          	csrr	a5,sstatus
ffffffffc02028d2:	8b89                	andi	a5,a5,2
ffffffffc02028d4:	efad                	bnez	a5,ffffffffc020294e <exit_range+0x212>
ffffffffc02028d6:	000db783          	ld	a5,0(s11)
ffffffffc02028da:	4585                	li	a1,1
ffffffffc02028dc:	739c                	ld	a5,32(a5)
ffffffffc02028de:	9782                	jalr	a5
ffffffffc02028e0:	00094717          	auipc	a4,0x94
ffffffffc02028e4:	fc870713          	addi	a4,a4,-56 # ffffffffc02968a8 <pages>
ffffffffc02028e8:	00043023          	sd	zero,0(s0)
ffffffffc02028ec:	ee0990e3          	bnez	s3,ffffffffc02027cc <exit_range+0x90>
ffffffffc02028f0:	70e6                	ld	ra,120(sp)
ffffffffc02028f2:	7446                	ld	s0,112(sp)
ffffffffc02028f4:	74a6                	ld	s1,104(sp)
ffffffffc02028f6:	7906                	ld	s2,96(sp)
ffffffffc02028f8:	69e6                	ld	s3,88(sp)
ffffffffc02028fa:	6a46                	ld	s4,80(sp)
ffffffffc02028fc:	6aa6                	ld	s5,72(sp)
ffffffffc02028fe:	6b06                	ld	s6,64(sp)
ffffffffc0202900:	7be2                	ld	s7,56(sp)
ffffffffc0202902:	7c42                	ld	s8,48(sp)
ffffffffc0202904:	7ca2                	ld	s9,40(sp)
ffffffffc0202906:	7d02                	ld	s10,32(sp)
ffffffffc0202908:	6de2                	ld	s11,24(sp)
ffffffffc020290a:	6109                	addi	sp,sp,128
ffffffffc020290c:	8082                	ret
ffffffffc020290e:	ea0b8fe3          	beqz	s7,ffffffffc02027cc <exit_range+0x90>
ffffffffc0202912:	bf45                	j	ffffffffc02028c2 <exit_range+0x186>
ffffffffc0202914:	e032                	sd	a2,0(sp)
ffffffffc0202916:	e42a                	sd	a0,8(sp)
ffffffffc0202918:	b5afe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020291c:	000db783          	ld	a5,0(s11)
ffffffffc0202920:	6522                	ld	a0,8(sp)
ffffffffc0202922:	4585                	li	a1,1
ffffffffc0202924:	739c                	ld	a5,32(a5)
ffffffffc0202926:	9782                	jalr	a5
ffffffffc0202928:	b44fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020292c:	6602                	ld	a2,0(sp)
ffffffffc020292e:	00094717          	auipc	a4,0x94
ffffffffc0202932:	f7a70713          	addi	a4,a4,-134 # ffffffffc02968a8 <pages>
ffffffffc0202936:	6885                	lui	a7,0x1
ffffffffc0202938:	00080337          	lui	t1,0x80
ffffffffc020293c:	fff80e37          	lui	t3,0xfff80
ffffffffc0202940:	00094817          	auipc	a6,0x94
ffffffffc0202944:	f7880813          	addi	a6,a6,-136 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202948:	0004b023          	sd	zero,0(s1)
ffffffffc020294c:	b7a5                	j	ffffffffc02028b4 <exit_range+0x178>
ffffffffc020294e:	e02a                	sd	a0,0(sp)
ffffffffc0202950:	b22fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202954:	000db783          	ld	a5,0(s11)
ffffffffc0202958:	6502                	ld	a0,0(sp)
ffffffffc020295a:	4585                	li	a1,1
ffffffffc020295c:	739c                	ld	a5,32(a5)
ffffffffc020295e:	9782                	jalr	a5
ffffffffc0202960:	b0cfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202964:	00094717          	auipc	a4,0x94
ffffffffc0202968:	f4470713          	addi	a4,a4,-188 # ffffffffc02968a8 <pages>
ffffffffc020296c:	00043023          	sd	zero,0(s0)
ffffffffc0202970:	bfb5                	j	ffffffffc02028ec <exit_range+0x1b0>
ffffffffc0202972:	0000a697          	auipc	a3,0xa
ffffffffc0202976:	07668693          	addi	a3,a3,118 # ffffffffc020c9e8 <default_pmm_manager+0x188>
ffffffffc020297a:	00009617          	auipc	a2,0x9
ffffffffc020297e:	3c660613          	addi	a2,a2,966 # ffffffffc020bd40 <commands+0x210>
ffffffffc0202982:	16f00593          	li	a1,367
ffffffffc0202986:	0000a517          	auipc	a0,0xa
ffffffffc020298a:	02a50513          	addi	a0,a0,42 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020298e:	b11fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202992:	0000a617          	auipc	a2,0xa
ffffffffc0202996:	f0660613          	addi	a2,a2,-250 # ffffffffc020c898 <default_pmm_manager+0x38>
ffffffffc020299a:	07100593          	li	a1,113
ffffffffc020299e:	0000a517          	auipc	a0,0xa
ffffffffc02029a2:	f2250513          	addi	a0,a0,-222 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc02029a6:	af9fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02029aa:	81bff0ef          	jal	ra,ffffffffc02021c4 <pa2page.part.0>
ffffffffc02029ae:	0000a697          	auipc	a3,0xa
ffffffffc02029b2:	06a68693          	addi	a3,a3,106 # ffffffffc020ca18 <default_pmm_manager+0x1b8>
ffffffffc02029b6:	00009617          	auipc	a2,0x9
ffffffffc02029ba:	38a60613          	addi	a2,a2,906 # ffffffffc020bd40 <commands+0x210>
ffffffffc02029be:	17000593          	li	a1,368
ffffffffc02029c2:	0000a517          	auipc	a0,0xa
ffffffffc02029c6:	fee50513          	addi	a0,a0,-18 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02029ca:	ad5fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02029ce <page_remove>:
ffffffffc02029ce:	7179                	addi	sp,sp,-48
ffffffffc02029d0:	4601                	li	a2,0
ffffffffc02029d2:	ec26                	sd	s1,24(sp)
ffffffffc02029d4:	f406                	sd	ra,40(sp)
ffffffffc02029d6:	f022                	sd	s0,32(sp)
ffffffffc02029d8:	84ae                	mv	s1,a1
ffffffffc02029da:	8dbff0ef          	jal	ra,ffffffffc02022b4 <get_pte>
ffffffffc02029de:	c511                	beqz	a0,ffffffffc02029ea <page_remove+0x1c>
ffffffffc02029e0:	611c                	ld	a5,0(a0)
ffffffffc02029e2:	842a                	mv	s0,a0
ffffffffc02029e4:	0017f713          	andi	a4,a5,1
ffffffffc02029e8:	e711                	bnez	a4,ffffffffc02029f4 <page_remove+0x26>
ffffffffc02029ea:	70a2                	ld	ra,40(sp)
ffffffffc02029ec:	7402                	ld	s0,32(sp)
ffffffffc02029ee:	64e2                	ld	s1,24(sp)
ffffffffc02029f0:	6145                	addi	sp,sp,48
ffffffffc02029f2:	8082                	ret
ffffffffc02029f4:	078a                	slli	a5,a5,0x2
ffffffffc02029f6:	83b1                	srli	a5,a5,0xc
ffffffffc02029f8:	00094717          	auipc	a4,0x94
ffffffffc02029fc:	ea873703          	ld	a4,-344(a4) # ffffffffc02968a0 <npage>
ffffffffc0202a00:	06e7f363          	bgeu	a5,a4,ffffffffc0202a66 <page_remove+0x98>
ffffffffc0202a04:	fff80537          	lui	a0,0xfff80
ffffffffc0202a08:	97aa                	add	a5,a5,a0
ffffffffc0202a0a:	079a                	slli	a5,a5,0x6
ffffffffc0202a0c:	00094517          	auipc	a0,0x94
ffffffffc0202a10:	e9c53503          	ld	a0,-356(a0) # ffffffffc02968a8 <pages>
ffffffffc0202a14:	953e                	add	a0,a0,a5
ffffffffc0202a16:	411c                	lw	a5,0(a0)
ffffffffc0202a18:	fff7871b          	addiw	a4,a5,-1
ffffffffc0202a1c:	c118                	sw	a4,0(a0)
ffffffffc0202a1e:	cb11                	beqz	a4,ffffffffc0202a32 <page_remove+0x64>
ffffffffc0202a20:	00043023          	sd	zero,0(s0)
ffffffffc0202a24:	12048073          	sfence.vma	s1
ffffffffc0202a28:	70a2                	ld	ra,40(sp)
ffffffffc0202a2a:	7402                	ld	s0,32(sp)
ffffffffc0202a2c:	64e2                	ld	s1,24(sp)
ffffffffc0202a2e:	6145                	addi	sp,sp,48
ffffffffc0202a30:	8082                	ret
ffffffffc0202a32:	100027f3          	csrr	a5,sstatus
ffffffffc0202a36:	8b89                	andi	a5,a5,2
ffffffffc0202a38:	eb89                	bnez	a5,ffffffffc0202a4a <page_remove+0x7c>
ffffffffc0202a3a:	00094797          	auipc	a5,0x94
ffffffffc0202a3e:	e767b783          	ld	a5,-394(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202a42:	739c                	ld	a5,32(a5)
ffffffffc0202a44:	4585                	li	a1,1
ffffffffc0202a46:	9782                	jalr	a5
ffffffffc0202a48:	bfe1                	j	ffffffffc0202a20 <page_remove+0x52>
ffffffffc0202a4a:	e42a                	sd	a0,8(sp)
ffffffffc0202a4c:	a26fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202a50:	00094797          	auipc	a5,0x94
ffffffffc0202a54:	e607b783          	ld	a5,-416(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202a58:	739c                	ld	a5,32(a5)
ffffffffc0202a5a:	6522                	ld	a0,8(sp)
ffffffffc0202a5c:	4585                	li	a1,1
ffffffffc0202a5e:	9782                	jalr	a5
ffffffffc0202a60:	a0cfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202a64:	bf75                	j	ffffffffc0202a20 <page_remove+0x52>
ffffffffc0202a66:	f5eff0ef          	jal	ra,ffffffffc02021c4 <pa2page.part.0>

ffffffffc0202a6a <page_insert>:
ffffffffc0202a6a:	7139                	addi	sp,sp,-64
ffffffffc0202a6c:	e852                	sd	s4,16(sp)
ffffffffc0202a6e:	8a32                	mv	s4,a2
ffffffffc0202a70:	f822                	sd	s0,48(sp)
ffffffffc0202a72:	4605                	li	a2,1
ffffffffc0202a74:	842e                	mv	s0,a1
ffffffffc0202a76:	85d2                	mv	a1,s4
ffffffffc0202a78:	f426                	sd	s1,40(sp)
ffffffffc0202a7a:	fc06                	sd	ra,56(sp)
ffffffffc0202a7c:	f04a                	sd	s2,32(sp)
ffffffffc0202a7e:	ec4e                	sd	s3,24(sp)
ffffffffc0202a80:	e456                	sd	s5,8(sp)
ffffffffc0202a82:	84b6                	mv	s1,a3
ffffffffc0202a84:	831ff0ef          	jal	ra,ffffffffc02022b4 <get_pte>
ffffffffc0202a88:	c961                	beqz	a0,ffffffffc0202b58 <page_insert+0xee>
ffffffffc0202a8a:	4014                	lw	a3,0(s0)
ffffffffc0202a8c:	611c                	ld	a5,0(a0)
ffffffffc0202a8e:	89aa                	mv	s3,a0
ffffffffc0202a90:	0016871b          	addiw	a4,a3,1
ffffffffc0202a94:	c018                	sw	a4,0(s0)
ffffffffc0202a96:	0017f713          	andi	a4,a5,1
ffffffffc0202a9a:	ef05                	bnez	a4,ffffffffc0202ad2 <page_insert+0x68>
ffffffffc0202a9c:	00094717          	auipc	a4,0x94
ffffffffc0202aa0:	e0c73703          	ld	a4,-500(a4) # ffffffffc02968a8 <pages>
ffffffffc0202aa4:	8c19                	sub	s0,s0,a4
ffffffffc0202aa6:	000807b7          	lui	a5,0x80
ffffffffc0202aaa:	8419                	srai	s0,s0,0x6
ffffffffc0202aac:	943e                	add	s0,s0,a5
ffffffffc0202aae:	042a                	slli	s0,s0,0xa
ffffffffc0202ab0:	8cc1                	or	s1,s1,s0
ffffffffc0202ab2:	0014e493          	ori	s1,s1,1
ffffffffc0202ab6:	0099b023          	sd	s1,0(s3) # ffffffffc0000000 <_binary_bin_sfs_img_size+0xffffffffbff8ad00>
ffffffffc0202aba:	120a0073          	sfence.vma	s4
ffffffffc0202abe:	4501                	li	a0,0
ffffffffc0202ac0:	70e2                	ld	ra,56(sp)
ffffffffc0202ac2:	7442                	ld	s0,48(sp)
ffffffffc0202ac4:	74a2                	ld	s1,40(sp)
ffffffffc0202ac6:	7902                	ld	s2,32(sp)
ffffffffc0202ac8:	69e2                	ld	s3,24(sp)
ffffffffc0202aca:	6a42                	ld	s4,16(sp)
ffffffffc0202acc:	6aa2                	ld	s5,8(sp)
ffffffffc0202ace:	6121                	addi	sp,sp,64
ffffffffc0202ad0:	8082                	ret
ffffffffc0202ad2:	078a                	slli	a5,a5,0x2
ffffffffc0202ad4:	83b1                	srli	a5,a5,0xc
ffffffffc0202ad6:	00094717          	auipc	a4,0x94
ffffffffc0202ada:	dca73703          	ld	a4,-566(a4) # ffffffffc02968a0 <npage>
ffffffffc0202ade:	06e7ff63          	bgeu	a5,a4,ffffffffc0202b5c <page_insert+0xf2>
ffffffffc0202ae2:	00094a97          	auipc	s5,0x94
ffffffffc0202ae6:	dc6a8a93          	addi	s5,s5,-570 # ffffffffc02968a8 <pages>
ffffffffc0202aea:	000ab703          	ld	a4,0(s5)
ffffffffc0202aee:	fff80937          	lui	s2,0xfff80
ffffffffc0202af2:	993e                	add	s2,s2,a5
ffffffffc0202af4:	091a                	slli	s2,s2,0x6
ffffffffc0202af6:	993a                	add	s2,s2,a4
ffffffffc0202af8:	01240c63          	beq	s0,s2,ffffffffc0202b10 <page_insert+0xa6>
ffffffffc0202afc:	00092783          	lw	a5,0(s2) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202b00:	fff7869b          	addiw	a3,a5,-1
ffffffffc0202b04:	00d92023          	sw	a3,0(s2)
ffffffffc0202b08:	c691                	beqz	a3,ffffffffc0202b14 <page_insert+0xaa>
ffffffffc0202b0a:	120a0073          	sfence.vma	s4
ffffffffc0202b0e:	bf59                	j	ffffffffc0202aa4 <page_insert+0x3a>
ffffffffc0202b10:	c014                	sw	a3,0(s0)
ffffffffc0202b12:	bf49                	j	ffffffffc0202aa4 <page_insert+0x3a>
ffffffffc0202b14:	100027f3          	csrr	a5,sstatus
ffffffffc0202b18:	8b89                	andi	a5,a5,2
ffffffffc0202b1a:	ef91                	bnez	a5,ffffffffc0202b36 <page_insert+0xcc>
ffffffffc0202b1c:	00094797          	auipc	a5,0x94
ffffffffc0202b20:	d947b783          	ld	a5,-620(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202b24:	739c                	ld	a5,32(a5)
ffffffffc0202b26:	4585                	li	a1,1
ffffffffc0202b28:	854a                	mv	a0,s2
ffffffffc0202b2a:	9782                	jalr	a5
ffffffffc0202b2c:	000ab703          	ld	a4,0(s5)
ffffffffc0202b30:	120a0073          	sfence.vma	s4
ffffffffc0202b34:	bf85                	j	ffffffffc0202aa4 <page_insert+0x3a>
ffffffffc0202b36:	93cfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202b3a:	00094797          	auipc	a5,0x94
ffffffffc0202b3e:	d767b783          	ld	a5,-650(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202b42:	739c                	ld	a5,32(a5)
ffffffffc0202b44:	4585                	li	a1,1
ffffffffc0202b46:	854a                	mv	a0,s2
ffffffffc0202b48:	9782                	jalr	a5
ffffffffc0202b4a:	922fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202b4e:	000ab703          	ld	a4,0(s5)
ffffffffc0202b52:	120a0073          	sfence.vma	s4
ffffffffc0202b56:	b7b9                	j	ffffffffc0202aa4 <page_insert+0x3a>
ffffffffc0202b58:	5571                	li	a0,-4
ffffffffc0202b5a:	b79d                	j	ffffffffc0202ac0 <page_insert+0x56>
ffffffffc0202b5c:	e68ff0ef          	jal	ra,ffffffffc02021c4 <pa2page.part.0>

ffffffffc0202b60 <pmm_init>:
ffffffffc0202b60:	0000a797          	auipc	a5,0xa
ffffffffc0202b64:	d0078793          	addi	a5,a5,-768 # ffffffffc020c860 <default_pmm_manager>
ffffffffc0202b68:	638c                	ld	a1,0(a5)
ffffffffc0202b6a:	7159                	addi	sp,sp,-112
ffffffffc0202b6c:	f85a                	sd	s6,48(sp)
ffffffffc0202b6e:	0000a517          	auipc	a0,0xa
ffffffffc0202b72:	ec250513          	addi	a0,a0,-318 # ffffffffc020ca30 <default_pmm_manager+0x1d0>
ffffffffc0202b76:	00094b17          	auipc	s6,0x94
ffffffffc0202b7a:	d3ab0b13          	addi	s6,s6,-710 # ffffffffc02968b0 <pmm_manager>
ffffffffc0202b7e:	f486                	sd	ra,104(sp)
ffffffffc0202b80:	e8ca                	sd	s2,80(sp)
ffffffffc0202b82:	e4ce                	sd	s3,72(sp)
ffffffffc0202b84:	f0a2                	sd	s0,96(sp)
ffffffffc0202b86:	eca6                	sd	s1,88(sp)
ffffffffc0202b88:	e0d2                	sd	s4,64(sp)
ffffffffc0202b8a:	fc56                	sd	s5,56(sp)
ffffffffc0202b8c:	f45e                	sd	s7,40(sp)
ffffffffc0202b8e:	f062                	sd	s8,32(sp)
ffffffffc0202b90:	ec66                	sd	s9,24(sp)
ffffffffc0202b92:	00fb3023          	sd	a5,0(s6)
ffffffffc0202b96:	e10fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b9a:	000b3783          	ld	a5,0(s6)
ffffffffc0202b9e:	00094997          	auipc	s3,0x94
ffffffffc0202ba2:	d1a98993          	addi	s3,s3,-742 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202ba6:	679c                	ld	a5,8(a5)
ffffffffc0202ba8:	9782                	jalr	a5
ffffffffc0202baa:	57f5                	li	a5,-3
ffffffffc0202bac:	07fa                	slli	a5,a5,0x1e
ffffffffc0202bae:	00f9b023          	sd	a5,0(s3)
ffffffffc0202bb2:	e97fd0ef          	jal	ra,ffffffffc0200a48 <get_memory_base>
ffffffffc0202bb6:	892a                	mv	s2,a0
ffffffffc0202bb8:	e9bfd0ef          	jal	ra,ffffffffc0200a52 <get_memory_size>
ffffffffc0202bbc:	280502e3          	beqz	a0,ffffffffc0203640 <pmm_init+0xae0>
ffffffffc0202bc0:	84aa                	mv	s1,a0
ffffffffc0202bc2:	0000a517          	auipc	a0,0xa
ffffffffc0202bc6:	ea650513          	addi	a0,a0,-346 # ffffffffc020ca68 <default_pmm_manager+0x208>
ffffffffc0202bca:	ddcfd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202bce:	00990433          	add	s0,s2,s1
ffffffffc0202bd2:	fff40693          	addi	a3,s0,-1
ffffffffc0202bd6:	864a                	mv	a2,s2
ffffffffc0202bd8:	85a6                	mv	a1,s1
ffffffffc0202bda:	0000a517          	auipc	a0,0xa
ffffffffc0202bde:	ea650513          	addi	a0,a0,-346 # ffffffffc020ca80 <default_pmm_manager+0x220>
ffffffffc0202be2:	dc4fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202be6:	c8000737          	lui	a4,0xc8000
ffffffffc0202bea:	87a2                	mv	a5,s0
ffffffffc0202bec:	5e876e63          	bltu	a4,s0,ffffffffc02031e8 <pmm_init+0x688>
ffffffffc0202bf0:	757d                	lui	a0,0xfffff
ffffffffc0202bf2:	00095617          	auipc	a2,0x95
ffffffffc0202bf6:	d1d60613          	addi	a2,a2,-739 # ffffffffc029790f <end+0xfff>
ffffffffc0202bfa:	8e69                	and	a2,a2,a0
ffffffffc0202bfc:	00094497          	auipc	s1,0x94
ffffffffc0202c00:	ca448493          	addi	s1,s1,-860 # ffffffffc02968a0 <npage>
ffffffffc0202c04:	00c7d513          	srli	a0,a5,0xc
ffffffffc0202c08:	00094b97          	auipc	s7,0x94
ffffffffc0202c0c:	ca0b8b93          	addi	s7,s7,-864 # ffffffffc02968a8 <pages>
ffffffffc0202c10:	e088                	sd	a0,0(s1)
ffffffffc0202c12:	00cbb023          	sd	a2,0(s7)
ffffffffc0202c16:	000807b7          	lui	a5,0x80
ffffffffc0202c1a:	86b2                	mv	a3,a2
ffffffffc0202c1c:	02f50863          	beq	a0,a5,ffffffffc0202c4c <pmm_init+0xec>
ffffffffc0202c20:	4781                	li	a5,0
ffffffffc0202c22:	4585                	li	a1,1
ffffffffc0202c24:	fff806b7          	lui	a3,0xfff80
ffffffffc0202c28:	00679513          	slli	a0,a5,0x6
ffffffffc0202c2c:	9532                	add	a0,a0,a2
ffffffffc0202c2e:	00850713          	addi	a4,a0,8 # fffffffffffff008 <end+0x3fd686f8>
ffffffffc0202c32:	40b7302f          	amoor.d	zero,a1,(a4)
ffffffffc0202c36:	6088                	ld	a0,0(s1)
ffffffffc0202c38:	0785                	addi	a5,a5,1
ffffffffc0202c3a:	000bb603          	ld	a2,0(s7)
ffffffffc0202c3e:	00d50733          	add	a4,a0,a3
ffffffffc0202c42:	fee7e3e3          	bltu	a5,a4,ffffffffc0202c28 <pmm_init+0xc8>
ffffffffc0202c46:	071a                	slli	a4,a4,0x6
ffffffffc0202c48:	00e606b3          	add	a3,a2,a4
ffffffffc0202c4c:	c02007b7          	lui	a5,0xc0200
ffffffffc0202c50:	3af6eae3          	bltu	a3,a5,ffffffffc0203804 <pmm_init+0xca4>
ffffffffc0202c54:	0009b583          	ld	a1,0(s3)
ffffffffc0202c58:	77fd                	lui	a5,0xfffff
ffffffffc0202c5a:	8c7d                	and	s0,s0,a5
ffffffffc0202c5c:	8e8d                	sub	a3,a3,a1
ffffffffc0202c5e:	5e86e363          	bltu	a3,s0,ffffffffc0203244 <pmm_init+0x6e4>
ffffffffc0202c62:	0000a517          	auipc	a0,0xa
ffffffffc0202c66:	e4650513          	addi	a0,a0,-442 # ffffffffc020caa8 <default_pmm_manager+0x248>
ffffffffc0202c6a:	d3cfd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202c6e:	000b3783          	ld	a5,0(s6)
ffffffffc0202c72:	7b9c                	ld	a5,48(a5)
ffffffffc0202c74:	9782                	jalr	a5
ffffffffc0202c76:	0000a517          	auipc	a0,0xa
ffffffffc0202c7a:	e4a50513          	addi	a0,a0,-438 # ffffffffc020cac0 <default_pmm_manager+0x260>
ffffffffc0202c7e:	d28fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202c82:	100027f3          	csrr	a5,sstatus
ffffffffc0202c86:	8b89                	andi	a5,a5,2
ffffffffc0202c88:	5a079363          	bnez	a5,ffffffffc020322e <pmm_init+0x6ce>
ffffffffc0202c8c:	000b3783          	ld	a5,0(s6)
ffffffffc0202c90:	4505                	li	a0,1
ffffffffc0202c92:	6f9c                	ld	a5,24(a5)
ffffffffc0202c94:	9782                	jalr	a5
ffffffffc0202c96:	842a                	mv	s0,a0
ffffffffc0202c98:	180408e3          	beqz	s0,ffffffffc0203628 <pmm_init+0xac8>
ffffffffc0202c9c:	000bb683          	ld	a3,0(s7)
ffffffffc0202ca0:	5a7d                	li	s4,-1
ffffffffc0202ca2:	6098                	ld	a4,0(s1)
ffffffffc0202ca4:	40d406b3          	sub	a3,s0,a3
ffffffffc0202ca8:	8699                	srai	a3,a3,0x6
ffffffffc0202caa:	00080437          	lui	s0,0x80
ffffffffc0202cae:	96a2                	add	a3,a3,s0
ffffffffc0202cb0:	00ca5793          	srli	a5,s4,0xc
ffffffffc0202cb4:	8ff5                	and	a5,a5,a3
ffffffffc0202cb6:	06b2                	slli	a3,a3,0xc
ffffffffc0202cb8:	30e7fde3          	bgeu	a5,a4,ffffffffc02037d2 <pmm_init+0xc72>
ffffffffc0202cbc:	0009b403          	ld	s0,0(s3)
ffffffffc0202cc0:	6605                	lui	a2,0x1
ffffffffc0202cc2:	4581                	li	a1,0
ffffffffc0202cc4:	9436                	add	s0,s0,a3
ffffffffc0202cc6:	8522                	mv	a0,s0
ffffffffc0202cc8:	393080ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0202ccc:	0009b683          	ld	a3,0(s3)
ffffffffc0202cd0:	77fd                	lui	a5,0xfffff
ffffffffc0202cd2:	0000a917          	auipc	s2,0xa
ffffffffc0202cd6:	bf190913          	addi	s2,s2,-1039 # ffffffffc020c8c3 <default_pmm_manager+0x63>
ffffffffc0202cda:	00f97933          	and	s2,s2,a5
ffffffffc0202cde:	c0200ab7          	lui	s5,0xc0200
ffffffffc0202ce2:	3fe00637          	lui	a2,0x3fe00
ffffffffc0202ce6:	964a                	add	a2,a2,s2
ffffffffc0202ce8:	4729                	li	a4,10
ffffffffc0202cea:	40da86b3          	sub	a3,s5,a3
ffffffffc0202cee:	c02005b7          	lui	a1,0xc0200
ffffffffc0202cf2:	8522                	mv	a0,s0
ffffffffc0202cf4:	fe8ff0ef          	jal	ra,ffffffffc02024dc <boot_map_segment>
ffffffffc0202cf8:	c8000637          	lui	a2,0xc8000
ffffffffc0202cfc:	41260633          	sub	a2,a2,s2
ffffffffc0202d00:	3f596ce3          	bltu	s2,s5,ffffffffc02038f8 <pmm_init+0xd98>
ffffffffc0202d04:	0009b683          	ld	a3,0(s3)
ffffffffc0202d08:	85ca                	mv	a1,s2
ffffffffc0202d0a:	4719                	li	a4,6
ffffffffc0202d0c:	40d906b3          	sub	a3,s2,a3
ffffffffc0202d10:	8522                	mv	a0,s0
ffffffffc0202d12:	00094917          	auipc	s2,0x94
ffffffffc0202d16:	b8690913          	addi	s2,s2,-1146 # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0202d1a:	fc2ff0ef          	jal	ra,ffffffffc02024dc <boot_map_segment>
ffffffffc0202d1e:	00893023          	sd	s0,0(s2)
ffffffffc0202d22:	2d5464e3          	bltu	s0,s5,ffffffffc02037ea <pmm_init+0xc8a>
ffffffffc0202d26:	0009b783          	ld	a5,0(s3)
ffffffffc0202d2a:	1a7e                	slli	s4,s4,0x3f
ffffffffc0202d2c:	8c1d                	sub	s0,s0,a5
ffffffffc0202d2e:	00c45793          	srli	a5,s0,0xc
ffffffffc0202d32:	00094717          	auipc	a4,0x94
ffffffffc0202d36:	b4873f23          	sd	s0,-1186(a4) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0202d3a:	0147ea33          	or	s4,a5,s4
ffffffffc0202d3e:	180a1073          	csrw	satp,s4
ffffffffc0202d42:	12000073          	sfence.vma
ffffffffc0202d46:	0000a517          	auipc	a0,0xa
ffffffffc0202d4a:	dba50513          	addi	a0,a0,-582 # ffffffffc020cb00 <default_pmm_manager+0x2a0>
ffffffffc0202d4e:	c58fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202d52:	0000e717          	auipc	a4,0xe
ffffffffc0202d56:	2ae70713          	addi	a4,a4,686 # ffffffffc0211000 <bootstack>
ffffffffc0202d5a:	0000e797          	auipc	a5,0xe
ffffffffc0202d5e:	2a678793          	addi	a5,a5,678 # ffffffffc0211000 <bootstack>
ffffffffc0202d62:	5cf70d63          	beq	a4,a5,ffffffffc020333c <pmm_init+0x7dc>
ffffffffc0202d66:	100027f3          	csrr	a5,sstatus
ffffffffc0202d6a:	8b89                	andi	a5,a5,2
ffffffffc0202d6c:	4a079763          	bnez	a5,ffffffffc020321a <pmm_init+0x6ba>
ffffffffc0202d70:	000b3783          	ld	a5,0(s6)
ffffffffc0202d74:	779c                	ld	a5,40(a5)
ffffffffc0202d76:	9782                	jalr	a5
ffffffffc0202d78:	842a                	mv	s0,a0
ffffffffc0202d7a:	6098                	ld	a4,0(s1)
ffffffffc0202d7c:	c80007b7          	lui	a5,0xc8000
ffffffffc0202d80:	83b1                	srli	a5,a5,0xc
ffffffffc0202d82:	08e7e3e3          	bltu	a5,a4,ffffffffc0203608 <pmm_init+0xaa8>
ffffffffc0202d86:	00093503          	ld	a0,0(s2)
ffffffffc0202d8a:	04050fe3          	beqz	a0,ffffffffc02035e8 <pmm_init+0xa88>
ffffffffc0202d8e:	03451793          	slli	a5,a0,0x34
ffffffffc0202d92:	04079be3          	bnez	a5,ffffffffc02035e8 <pmm_init+0xa88>
ffffffffc0202d96:	4601                	li	a2,0
ffffffffc0202d98:	4581                	li	a1,0
ffffffffc0202d9a:	809ff0ef          	jal	ra,ffffffffc02025a2 <get_page>
ffffffffc0202d9e:	2e0511e3          	bnez	a0,ffffffffc0203880 <pmm_init+0xd20>
ffffffffc0202da2:	100027f3          	csrr	a5,sstatus
ffffffffc0202da6:	8b89                	andi	a5,a5,2
ffffffffc0202da8:	44079e63          	bnez	a5,ffffffffc0203204 <pmm_init+0x6a4>
ffffffffc0202dac:	000b3783          	ld	a5,0(s6)
ffffffffc0202db0:	4505                	li	a0,1
ffffffffc0202db2:	6f9c                	ld	a5,24(a5)
ffffffffc0202db4:	9782                	jalr	a5
ffffffffc0202db6:	8a2a                	mv	s4,a0
ffffffffc0202db8:	00093503          	ld	a0,0(s2)
ffffffffc0202dbc:	4681                	li	a3,0
ffffffffc0202dbe:	4601                	li	a2,0
ffffffffc0202dc0:	85d2                	mv	a1,s4
ffffffffc0202dc2:	ca9ff0ef          	jal	ra,ffffffffc0202a6a <page_insert>
ffffffffc0202dc6:	26051be3          	bnez	a0,ffffffffc020383c <pmm_init+0xcdc>
ffffffffc0202dca:	00093503          	ld	a0,0(s2)
ffffffffc0202dce:	4601                	li	a2,0
ffffffffc0202dd0:	4581                	li	a1,0
ffffffffc0202dd2:	ce2ff0ef          	jal	ra,ffffffffc02022b4 <get_pte>
ffffffffc0202dd6:	280505e3          	beqz	a0,ffffffffc0203860 <pmm_init+0xd00>
ffffffffc0202dda:	611c                	ld	a5,0(a0)
ffffffffc0202ddc:	0017f713          	andi	a4,a5,1
ffffffffc0202de0:	26070ee3          	beqz	a4,ffffffffc020385c <pmm_init+0xcfc>
ffffffffc0202de4:	6098                	ld	a4,0(s1)
ffffffffc0202de6:	078a                	slli	a5,a5,0x2
ffffffffc0202de8:	83b1                	srli	a5,a5,0xc
ffffffffc0202dea:	62e7f363          	bgeu	a5,a4,ffffffffc0203410 <pmm_init+0x8b0>
ffffffffc0202dee:	000bb683          	ld	a3,0(s7)
ffffffffc0202df2:	fff80637          	lui	a2,0xfff80
ffffffffc0202df6:	97b2                	add	a5,a5,a2
ffffffffc0202df8:	079a                	slli	a5,a5,0x6
ffffffffc0202dfa:	97b6                	add	a5,a5,a3
ffffffffc0202dfc:	2afa12e3          	bne	s4,a5,ffffffffc02038a0 <pmm_init+0xd40>
ffffffffc0202e00:	000a2683          	lw	a3,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202e04:	4785                	li	a5,1
ffffffffc0202e06:	2cf699e3          	bne	a3,a5,ffffffffc02038d8 <pmm_init+0xd78>
ffffffffc0202e0a:	00093503          	ld	a0,0(s2)
ffffffffc0202e0e:	77fd                	lui	a5,0xfffff
ffffffffc0202e10:	6114                	ld	a3,0(a0)
ffffffffc0202e12:	068a                	slli	a3,a3,0x2
ffffffffc0202e14:	8efd                	and	a3,a3,a5
ffffffffc0202e16:	00c6d613          	srli	a2,a3,0xc
ffffffffc0202e1a:	2ae673e3          	bgeu	a2,a4,ffffffffc02038c0 <pmm_init+0xd60>
ffffffffc0202e1e:	0009bc03          	ld	s8,0(s3)
ffffffffc0202e22:	96e2                	add	a3,a3,s8
ffffffffc0202e24:	0006ba83          	ld	s5,0(a3) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202e28:	0a8a                	slli	s5,s5,0x2
ffffffffc0202e2a:	00fafab3          	and	s5,s5,a5
ffffffffc0202e2e:	00cad793          	srli	a5,s5,0xc
ffffffffc0202e32:	06e7f3e3          	bgeu	a5,a4,ffffffffc0203698 <pmm_init+0xb38>
ffffffffc0202e36:	4601                	li	a2,0
ffffffffc0202e38:	6585                	lui	a1,0x1
ffffffffc0202e3a:	9ae2                	add	s5,s5,s8
ffffffffc0202e3c:	c78ff0ef          	jal	ra,ffffffffc02022b4 <get_pte>
ffffffffc0202e40:	0aa1                	addi	s5,s5,8
ffffffffc0202e42:	03551be3          	bne	a0,s5,ffffffffc0203678 <pmm_init+0xb18>
ffffffffc0202e46:	100027f3          	csrr	a5,sstatus
ffffffffc0202e4a:	8b89                	andi	a5,a5,2
ffffffffc0202e4c:	3a079163          	bnez	a5,ffffffffc02031ee <pmm_init+0x68e>
ffffffffc0202e50:	000b3783          	ld	a5,0(s6)
ffffffffc0202e54:	4505                	li	a0,1
ffffffffc0202e56:	6f9c                	ld	a5,24(a5)
ffffffffc0202e58:	9782                	jalr	a5
ffffffffc0202e5a:	8c2a                	mv	s8,a0
ffffffffc0202e5c:	00093503          	ld	a0,0(s2)
ffffffffc0202e60:	46d1                	li	a3,20
ffffffffc0202e62:	6605                	lui	a2,0x1
ffffffffc0202e64:	85e2                	mv	a1,s8
ffffffffc0202e66:	c05ff0ef          	jal	ra,ffffffffc0202a6a <page_insert>
ffffffffc0202e6a:	1a0519e3          	bnez	a0,ffffffffc020381c <pmm_init+0xcbc>
ffffffffc0202e6e:	00093503          	ld	a0,0(s2)
ffffffffc0202e72:	4601                	li	a2,0
ffffffffc0202e74:	6585                	lui	a1,0x1
ffffffffc0202e76:	c3eff0ef          	jal	ra,ffffffffc02022b4 <get_pte>
ffffffffc0202e7a:	10050ce3          	beqz	a0,ffffffffc0203792 <pmm_init+0xc32>
ffffffffc0202e7e:	611c                	ld	a5,0(a0)
ffffffffc0202e80:	0107f713          	andi	a4,a5,16
ffffffffc0202e84:	0e0707e3          	beqz	a4,ffffffffc0203772 <pmm_init+0xc12>
ffffffffc0202e88:	8b91                	andi	a5,a5,4
ffffffffc0202e8a:	0c0784e3          	beqz	a5,ffffffffc0203752 <pmm_init+0xbf2>
ffffffffc0202e8e:	00093503          	ld	a0,0(s2)
ffffffffc0202e92:	611c                	ld	a5,0(a0)
ffffffffc0202e94:	8bc1                	andi	a5,a5,16
ffffffffc0202e96:	08078ee3          	beqz	a5,ffffffffc0203732 <pmm_init+0xbd2>
ffffffffc0202e9a:	000c2703          	lw	a4,0(s8)
ffffffffc0202e9e:	4785                	li	a5,1
ffffffffc0202ea0:	06f719e3          	bne	a4,a5,ffffffffc0203712 <pmm_init+0xbb2>
ffffffffc0202ea4:	4681                	li	a3,0
ffffffffc0202ea6:	6605                	lui	a2,0x1
ffffffffc0202ea8:	85d2                	mv	a1,s4
ffffffffc0202eaa:	bc1ff0ef          	jal	ra,ffffffffc0202a6a <page_insert>
ffffffffc0202eae:	040512e3          	bnez	a0,ffffffffc02036f2 <pmm_init+0xb92>
ffffffffc0202eb2:	000a2703          	lw	a4,0(s4)
ffffffffc0202eb6:	4789                	li	a5,2
ffffffffc0202eb8:	00f71de3          	bne	a4,a5,ffffffffc02036d2 <pmm_init+0xb72>
ffffffffc0202ebc:	000c2783          	lw	a5,0(s8)
ffffffffc0202ec0:	7e079963          	bnez	a5,ffffffffc02036b2 <pmm_init+0xb52>
ffffffffc0202ec4:	00093503          	ld	a0,0(s2)
ffffffffc0202ec8:	4601                	li	a2,0
ffffffffc0202eca:	6585                	lui	a1,0x1
ffffffffc0202ecc:	be8ff0ef          	jal	ra,ffffffffc02022b4 <get_pte>
ffffffffc0202ed0:	54050263          	beqz	a0,ffffffffc0203414 <pmm_init+0x8b4>
ffffffffc0202ed4:	6118                	ld	a4,0(a0)
ffffffffc0202ed6:	00177793          	andi	a5,a4,1
ffffffffc0202eda:	180781e3          	beqz	a5,ffffffffc020385c <pmm_init+0xcfc>
ffffffffc0202ede:	6094                	ld	a3,0(s1)
ffffffffc0202ee0:	00271793          	slli	a5,a4,0x2
ffffffffc0202ee4:	83b1                	srli	a5,a5,0xc
ffffffffc0202ee6:	52d7f563          	bgeu	a5,a3,ffffffffc0203410 <pmm_init+0x8b0>
ffffffffc0202eea:	000bb683          	ld	a3,0(s7)
ffffffffc0202eee:	fff80ab7          	lui	s5,0xfff80
ffffffffc0202ef2:	97d6                	add	a5,a5,s5
ffffffffc0202ef4:	079a                	slli	a5,a5,0x6
ffffffffc0202ef6:	97b6                	add	a5,a5,a3
ffffffffc0202ef8:	58fa1e63          	bne	s4,a5,ffffffffc0203494 <pmm_init+0x934>
ffffffffc0202efc:	8b41                	andi	a4,a4,16
ffffffffc0202efe:	56071b63          	bnez	a4,ffffffffc0203474 <pmm_init+0x914>
ffffffffc0202f02:	00093503          	ld	a0,0(s2)
ffffffffc0202f06:	4581                	li	a1,0
ffffffffc0202f08:	ac7ff0ef          	jal	ra,ffffffffc02029ce <page_remove>
ffffffffc0202f0c:	000a2c83          	lw	s9,0(s4)
ffffffffc0202f10:	4785                	li	a5,1
ffffffffc0202f12:	5cfc9163          	bne	s9,a5,ffffffffc02034d4 <pmm_init+0x974>
ffffffffc0202f16:	000c2783          	lw	a5,0(s8)
ffffffffc0202f1a:	58079d63          	bnez	a5,ffffffffc02034b4 <pmm_init+0x954>
ffffffffc0202f1e:	00093503          	ld	a0,0(s2)
ffffffffc0202f22:	6585                	lui	a1,0x1
ffffffffc0202f24:	aabff0ef          	jal	ra,ffffffffc02029ce <page_remove>
ffffffffc0202f28:	000a2783          	lw	a5,0(s4)
ffffffffc0202f2c:	200793e3          	bnez	a5,ffffffffc0203932 <pmm_init+0xdd2>
ffffffffc0202f30:	000c2783          	lw	a5,0(s8)
ffffffffc0202f34:	1c079fe3          	bnez	a5,ffffffffc0203912 <pmm_init+0xdb2>
ffffffffc0202f38:	00093a03          	ld	s4,0(s2)
ffffffffc0202f3c:	608c                	ld	a1,0(s1)
ffffffffc0202f3e:	000a3683          	ld	a3,0(s4)
ffffffffc0202f42:	068a                	slli	a3,a3,0x2
ffffffffc0202f44:	82b1                	srli	a3,a3,0xc
ffffffffc0202f46:	4cb6f563          	bgeu	a3,a1,ffffffffc0203410 <pmm_init+0x8b0>
ffffffffc0202f4a:	000bb503          	ld	a0,0(s7)
ffffffffc0202f4e:	96d6                	add	a3,a3,s5
ffffffffc0202f50:	069a                	slli	a3,a3,0x6
ffffffffc0202f52:	00d507b3          	add	a5,a0,a3
ffffffffc0202f56:	439c                	lw	a5,0(a5)
ffffffffc0202f58:	4f979e63          	bne	a5,s9,ffffffffc0203454 <pmm_init+0x8f4>
ffffffffc0202f5c:	8699                	srai	a3,a3,0x6
ffffffffc0202f5e:	00080637          	lui	a2,0x80
ffffffffc0202f62:	96b2                	add	a3,a3,a2
ffffffffc0202f64:	00c69713          	slli	a4,a3,0xc
ffffffffc0202f68:	8331                	srli	a4,a4,0xc
ffffffffc0202f6a:	06b2                	slli	a3,a3,0xc
ffffffffc0202f6c:	06b773e3          	bgeu	a4,a1,ffffffffc02037d2 <pmm_init+0xc72>
ffffffffc0202f70:	0009b703          	ld	a4,0(s3)
ffffffffc0202f74:	96ba                	add	a3,a3,a4
ffffffffc0202f76:	629c                	ld	a5,0(a3)
ffffffffc0202f78:	078a                	slli	a5,a5,0x2
ffffffffc0202f7a:	83b1                	srli	a5,a5,0xc
ffffffffc0202f7c:	48b7fa63          	bgeu	a5,a1,ffffffffc0203410 <pmm_init+0x8b0>
ffffffffc0202f80:	8f91                	sub	a5,a5,a2
ffffffffc0202f82:	079a                	slli	a5,a5,0x6
ffffffffc0202f84:	953e                	add	a0,a0,a5
ffffffffc0202f86:	100027f3          	csrr	a5,sstatus
ffffffffc0202f8a:	8b89                	andi	a5,a5,2
ffffffffc0202f8c:	32079463          	bnez	a5,ffffffffc02032b4 <pmm_init+0x754>
ffffffffc0202f90:	000b3783          	ld	a5,0(s6)
ffffffffc0202f94:	4585                	li	a1,1
ffffffffc0202f96:	739c                	ld	a5,32(a5)
ffffffffc0202f98:	9782                	jalr	a5
ffffffffc0202f9a:	000a3783          	ld	a5,0(s4)
ffffffffc0202f9e:	6098                	ld	a4,0(s1)
ffffffffc0202fa0:	078a                	slli	a5,a5,0x2
ffffffffc0202fa2:	83b1                	srli	a5,a5,0xc
ffffffffc0202fa4:	46e7f663          	bgeu	a5,a4,ffffffffc0203410 <pmm_init+0x8b0>
ffffffffc0202fa8:	000bb503          	ld	a0,0(s7)
ffffffffc0202fac:	fff80737          	lui	a4,0xfff80
ffffffffc0202fb0:	97ba                	add	a5,a5,a4
ffffffffc0202fb2:	079a                	slli	a5,a5,0x6
ffffffffc0202fb4:	953e                	add	a0,a0,a5
ffffffffc0202fb6:	100027f3          	csrr	a5,sstatus
ffffffffc0202fba:	8b89                	andi	a5,a5,2
ffffffffc0202fbc:	2e079063          	bnez	a5,ffffffffc020329c <pmm_init+0x73c>
ffffffffc0202fc0:	000b3783          	ld	a5,0(s6)
ffffffffc0202fc4:	4585                	li	a1,1
ffffffffc0202fc6:	739c                	ld	a5,32(a5)
ffffffffc0202fc8:	9782                	jalr	a5
ffffffffc0202fca:	00093783          	ld	a5,0(s2)
ffffffffc0202fce:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0202fd2:	12000073          	sfence.vma
ffffffffc0202fd6:	100027f3          	csrr	a5,sstatus
ffffffffc0202fda:	8b89                	andi	a5,a5,2
ffffffffc0202fdc:	2a079663          	bnez	a5,ffffffffc0203288 <pmm_init+0x728>
ffffffffc0202fe0:	000b3783          	ld	a5,0(s6)
ffffffffc0202fe4:	779c                	ld	a5,40(a5)
ffffffffc0202fe6:	9782                	jalr	a5
ffffffffc0202fe8:	8a2a                	mv	s4,a0
ffffffffc0202fea:	7d441463          	bne	s0,s4,ffffffffc02037b2 <pmm_init+0xc52>
ffffffffc0202fee:	0000a517          	auipc	a0,0xa
ffffffffc0202ff2:	e6a50513          	addi	a0,a0,-406 # ffffffffc020ce58 <default_pmm_manager+0x5f8>
ffffffffc0202ff6:	9b0fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202ffa:	100027f3          	csrr	a5,sstatus
ffffffffc0202ffe:	8b89                	andi	a5,a5,2
ffffffffc0203000:	26079a63          	bnez	a5,ffffffffc0203274 <pmm_init+0x714>
ffffffffc0203004:	000b3783          	ld	a5,0(s6)
ffffffffc0203008:	779c                	ld	a5,40(a5)
ffffffffc020300a:	9782                	jalr	a5
ffffffffc020300c:	8c2a                	mv	s8,a0
ffffffffc020300e:	6098                	ld	a4,0(s1)
ffffffffc0203010:	c0200437          	lui	s0,0xc0200
ffffffffc0203014:	7afd                	lui	s5,0xfffff
ffffffffc0203016:	00c71793          	slli	a5,a4,0xc
ffffffffc020301a:	6a05                	lui	s4,0x1
ffffffffc020301c:	02f47c63          	bgeu	s0,a5,ffffffffc0203054 <pmm_init+0x4f4>
ffffffffc0203020:	00c45793          	srli	a5,s0,0xc
ffffffffc0203024:	00093503          	ld	a0,0(s2)
ffffffffc0203028:	3ae7f763          	bgeu	a5,a4,ffffffffc02033d6 <pmm_init+0x876>
ffffffffc020302c:	0009b583          	ld	a1,0(s3)
ffffffffc0203030:	4601                	li	a2,0
ffffffffc0203032:	95a2                	add	a1,a1,s0
ffffffffc0203034:	a80ff0ef          	jal	ra,ffffffffc02022b4 <get_pte>
ffffffffc0203038:	36050f63          	beqz	a0,ffffffffc02033b6 <pmm_init+0x856>
ffffffffc020303c:	611c                	ld	a5,0(a0)
ffffffffc020303e:	078a                	slli	a5,a5,0x2
ffffffffc0203040:	0157f7b3          	and	a5,a5,s5
ffffffffc0203044:	3a879663          	bne	a5,s0,ffffffffc02033f0 <pmm_init+0x890>
ffffffffc0203048:	6098                	ld	a4,0(s1)
ffffffffc020304a:	9452                	add	s0,s0,s4
ffffffffc020304c:	00c71793          	slli	a5,a4,0xc
ffffffffc0203050:	fcf468e3          	bltu	s0,a5,ffffffffc0203020 <pmm_init+0x4c0>
ffffffffc0203054:	00093783          	ld	a5,0(s2)
ffffffffc0203058:	639c                	ld	a5,0(a5)
ffffffffc020305a:	48079d63          	bnez	a5,ffffffffc02034f4 <pmm_init+0x994>
ffffffffc020305e:	100027f3          	csrr	a5,sstatus
ffffffffc0203062:	8b89                	andi	a5,a5,2
ffffffffc0203064:	26079463          	bnez	a5,ffffffffc02032cc <pmm_init+0x76c>
ffffffffc0203068:	000b3783          	ld	a5,0(s6)
ffffffffc020306c:	4505                	li	a0,1
ffffffffc020306e:	6f9c                	ld	a5,24(a5)
ffffffffc0203070:	9782                	jalr	a5
ffffffffc0203072:	8a2a                	mv	s4,a0
ffffffffc0203074:	00093503          	ld	a0,0(s2)
ffffffffc0203078:	4699                	li	a3,6
ffffffffc020307a:	10000613          	li	a2,256
ffffffffc020307e:	85d2                	mv	a1,s4
ffffffffc0203080:	9ebff0ef          	jal	ra,ffffffffc0202a6a <page_insert>
ffffffffc0203084:	4a051863          	bnez	a0,ffffffffc0203534 <pmm_init+0x9d4>
ffffffffc0203088:	000a2703          	lw	a4,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc020308c:	4785                	li	a5,1
ffffffffc020308e:	48f71363          	bne	a4,a5,ffffffffc0203514 <pmm_init+0x9b4>
ffffffffc0203092:	00093503          	ld	a0,0(s2)
ffffffffc0203096:	6405                	lui	s0,0x1
ffffffffc0203098:	4699                	li	a3,6
ffffffffc020309a:	10040613          	addi	a2,s0,256 # 1100 <_binary_bin_swap_img_size-0x6c00>
ffffffffc020309e:	85d2                	mv	a1,s4
ffffffffc02030a0:	9cbff0ef          	jal	ra,ffffffffc0202a6a <page_insert>
ffffffffc02030a4:	38051863          	bnez	a0,ffffffffc0203434 <pmm_init+0x8d4>
ffffffffc02030a8:	000a2703          	lw	a4,0(s4)
ffffffffc02030ac:	4789                	li	a5,2
ffffffffc02030ae:	4ef71363          	bne	a4,a5,ffffffffc0203594 <pmm_init+0xa34>
ffffffffc02030b2:	0000a597          	auipc	a1,0xa
ffffffffc02030b6:	eee58593          	addi	a1,a1,-274 # ffffffffc020cfa0 <default_pmm_manager+0x740>
ffffffffc02030ba:	10000513          	li	a0,256
ffffffffc02030be:	730080ef          	jal	ra,ffffffffc020b7ee <strcpy>
ffffffffc02030c2:	10040593          	addi	a1,s0,256
ffffffffc02030c6:	10000513          	li	a0,256
ffffffffc02030ca:	736080ef          	jal	ra,ffffffffc020b800 <strcmp>
ffffffffc02030ce:	4a051363          	bnez	a0,ffffffffc0203574 <pmm_init+0xa14>
ffffffffc02030d2:	000bb683          	ld	a3,0(s7)
ffffffffc02030d6:	00080737          	lui	a4,0x80
ffffffffc02030da:	547d                	li	s0,-1
ffffffffc02030dc:	40da06b3          	sub	a3,s4,a3
ffffffffc02030e0:	8699                	srai	a3,a3,0x6
ffffffffc02030e2:	609c                	ld	a5,0(s1)
ffffffffc02030e4:	96ba                	add	a3,a3,a4
ffffffffc02030e6:	8031                	srli	s0,s0,0xc
ffffffffc02030e8:	0086f733          	and	a4,a3,s0
ffffffffc02030ec:	06b2                	slli	a3,a3,0xc
ffffffffc02030ee:	6ef77263          	bgeu	a4,a5,ffffffffc02037d2 <pmm_init+0xc72>
ffffffffc02030f2:	0009b783          	ld	a5,0(s3)
ffffffffc02030f6:	10000513          	li	a0,256
ffffffffc02030fa:	96be                	add	a3,a3,a5
ffffffffc02030fc:	10068023          	sb	zero,256(a3)
ffffffffc0203100:	6b8080ef          	jal	ra,ffffffffc020b7b8 <strlen>
ffffffffc0203104:	44051863          	bnez	a0,ffffffffc0203554 <pmm_init+0x9f4>
ffffffffc0203108:	00093a83          	ld	s5,0(s2)
ffffffffc020310c:	609c                	ld	a5,0(s1)
ffffffffc020310e:	000ab683          	ld	a3,0(s5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0203112:	068a                	slli	a3,a3,0x2
ffffffffc0203114:	82b1                	srli	a3,a3,0xc
ffffffffc0203116:	2ef6fd63          	bgeu	a3,a5,ffffffffc0203410 <pmm_init+0x8b0>
ffffffffc020311a:	8c75                	and	s0,s0,a3
ffffffffc020311c:	06b2                	slli	a3,a3,0xc
ffffffffc020311e:	6af47a63          	bgeu	s0,a5,ffffffffc02037d2 <pmm_init+0xc72>
ffffffffc0203122:	0009b403          	ld	s0,0(s3)
ffffffffc0203126:	9436                	add	s0,s0,a3
ffffffffc0203128:	100027f3          	csrr	a5,sstatus
ffffffffc020312c:	8b89                	andi	a5,a5,2
ffffffffc020312e:	1e079c63          	bnez	a5,ffffffffc0203326 <pmm_init+0x7c6>
ffffffffc0203132:	000b3783          	ld	a5,0(s6)
ffffffffc0203136:	4585                	li	a1,1
ffffffffc0203138:	8552                	mv	a0,s4
ffffffffc020313a:	739c                	ld	a5,32(a5)
ffffffffc020313c:	9782                	jalr	a5
ffffffffc020313e:	601c                	ld	a5,0(s0)
ffffffffc0203140:	6098                	ld	a4,0(s1)
ffffffffc0203142:	078a                	slli	a5,a5,0x2
ffffffffc0203144:	83b1                	srli	a5,a5,0xc
ffffffffc0203146:	2ce7f563          	bgeu	a5,a4,ffffffffc0203410 <pmm_init+0x8b0>
ffffffffc020314a:	000bb503          	ld	a0,0(s7)
ffffffffc020314e:	fff80737          	lui	a4,0xfff80
ffffffffc0203152:	97ba                	add	a5,a5,a4
ffffffffc0203154:	079a                	slli	a5,a5,0x6
ffffffffc0203156:	953e                	add	a0,a0,a5
ffffffffc0203158:	100027f3          	csrr	a5,sstatus
ffffffffc020315c:	8b89                	andi	a5,a5,2
ffffffffc020315e:	1a079863          	bnez	a5,ffffffffc020330e <pmm_init+0x7ae>
ffffffffc0203162:	000b3783          	ld	a5,0(s6)
ffffffffc0203166:	4585                	li	a1,1
ffffffffc0203168:	739c                	ld	a5,32(a5)
ffffffffc020316a:	9782                	jalr	a5
ffffffffc020316c:	000ab783          	ld	a5,0(s5)
ffffffffc0203170:	6098                	ld	a4,0(s1)
ffffffffc0203172:	078a                	slli	a5,a5,0x2
ffffffffc0203174:	83b1                	srli	a5,a5,0xc
ffffffffc0203176:	28e7fd63          	bgeu	a5,a4,ffffffffc0203410 <pmm_init+0x8b0>
ffffffffc020317a:	000bb503          	ld	a0,0(s7)
ffffffffc020317e:	fff80737          	lui	a4,0xfff80
ffffffffc0203182:	97ba                	add	a5,a5,a4
ffffffffc0203184:	079a                	slli	a5,a5,0x6
ffffffffc0203186:	953e                	add	a0,a0,a5
ffffffffc0203188:	100027f3          	csrr	a5,sstatus
ffffffffc020318c:	8b89                	andi	a5,a5,2
ffffffffc020318e:	16079463          	bnez	a5,ffffffffc02032f6 <pmm_init+0x796>
ffffffffc0203192:	000b3783          	ld	a5,0(s6)
ffffffffc0203196:	4585                	li	a1,1
ffffffffc0203198:	739c                	ld	a5,32(a5)
ffffffffc020319a:	9782                	jalr	a5
ffffffffc020319c:	00093783          	ld	a5,0(s2)
ffffffffc02031a0:	0007b023          	sd	zero,0(a5)
ffffffffc02031a4:	12000073          	sfence.vma
ffffffffc02031a8:	100027f3          	csrr	a5,sstatus
ffffffffc02031ac:	8b89                	andi	a5,a5,2
ffffffffc02031ae:	12079a63          	bnez	a5,ffffffffc02032e2 <pmm_init+0x782>
ffffffffc02031b2:	000b3783          	ld	a5,0(s6)
ffffffffc02031b6:	779c                	ld	a5,40(a5)
ffffffffc02031b8:	9782                	jalr	a5
ffffffffc02031ba:	842a                	mv	s0,a0
ffffffffc02031bc:	488c1e63          	bne	s8,s0,ffffffffc0203658 <pmm_init+0xaf8>
ffffffffc02031c0:	0000a517          	auipc	a0,0xa
ffffffffc02031c4:	e5850513          	addi	a0,a0,-424 # ffffffffc020d018 <default_pmm_manager+0x7b8>
ffffffffc02031c8:	fdffc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02031cc:	7406                	ld	s0,96(sp)
ffffffffc02031ce:	70a6                	ld	ra,104(sp)
ffffffffc02031d0:	64e6                	ld	s1,88(sp)
ffffffffc02031d2:	6946                	ld	s2,80(sp)
ffffffffc02031d4:	69a6                	ld	s3,72(sp)
ffffffffc02031d6:	6a06                	ld	s4,64(sp)
ffffffffc02031d8:	7ae2                	ld	s5,56(sp)
ffffffffc02031da:	7b42                	ld	s6,48(sp)
ffffffffc02031dc:	7ba2                	ld	s7,40(sp)
ffffffffc02031de:	7c02                	ld	s8,32(sp)
ffffffffc02031e0:	6ce2                	ld	s9,24(sp)
ffffffffc02031e2:	6165                	addi	sp,sp,112
ffffffffc02031e4:	e17fe06f          	j	ffffffffc0201ffa <kmalloc_init>
ffffffffc02031e8:	c80007b7          	lui	a5,0xc8000
ffffffffc02031ec:	b411                	j	ffffffffc0202bf0 <pmm_init+0x90>
ffffffffc02031ee:	a85fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031f2:	000b3783          	ld	a5,0(s6)
ffffffffc02031f6:	4505                	li	a0,1
ffffffffc02031f8:	6f9c                	ld	a5,24(a5)
ffffffffc02031fa:	9782                	jalr	a5
ffffffffc02031fc:	8c2a                	mv	s8,a0
ffffffffc02031fe:	a6ffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203202:	b9a9                	j	ffffffffc0202e5c <pmm_init+0x2fc>
ffffffffc0203204:	a6ffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203208:	000b3783          	ld	a5,0(s6)
ffffffffc020320c:	4505                	li	a0,1
ffffffffc020320e:	6f9c                	ld	a5,24(a5)
ffffffffc0203210:	9782                	jalr	a5
ffffffffc0203212:	8a2a                	mv	s4,a0
ffffffffc0203214:	a59fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203218:	b645                	j	ffffffffc0202db8 <pmm_init+0x258>
ffffffffc020321a:	a59fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020321e:	000b3783          	ld	a5,0(s6)
ffffffffc0203222:	779c                	ld	a5,40(a5)
ffffffffc0203224:	9782                	jalr	a5
ffffffffc0203226:	842a                	mv	s0,a0
ffffffffc0203228:	a45fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020322c:	b6b9                	j	ffffffffc0202d7a <pmm_init+0x21a>
ffffffffc020322e:	a45fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203232:	000b3783          	ld	a5,0(s6)
ffffffffc0203236:	4505                	li	a0,1
ffffffffc0203238:	6f9c                	ld	a5,24(a5)
ffffffffc020323a:	9782                	jalr	a5
ffffffffc020323c:	842a                	mv	s0,a0
ffffffffc020323e:	a2ffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203242:	bc99                	j	ffffffffc0202c98 <pmm_init+0x138>
ffffffffc0203244:	6705                	lui	a4,0x1
ffffffffc0203246:	177d                	addi	a4,a4,-1
ffffffffc0203248:	96ba                	add	a3,a3,a4
ffffffffc020324a:	8ff5                	and	a5,a5,a3
ffffffffc020324c:	00c7d713          	srli	a4,a5,0xc
ffffffffc0203250:	1ca77063          	bgeu	a4,a0,ffffffffc0203410 <pmm_init+0x8b0>
ffffffffc0203254:	000b3683          	ld	a3,0(s6)
ffffffffc0203258:	fff80537          	lui	a0,0xfff80
ffffffffc020325c:	972a                	add	a4,a4,a0
ffffffffc020325e:	6a94                	ld	a3,16(a3)
ffffffffc0203260:	8c1d                	sub	s0,s0,a5
ffffffffc0203262:	00671513          	slli	a0,a4,0x6
ffffffffc0203266:	00c45593          	srli	a1,s0,0xc
ffffffffc020326a:	9532                	add	a0,a0,a2
ffffffffc020326c:	9682                	jalr	a3
ffffffffc020326e:	0009b583          	ld	a1,0(s3)
ffffffffc0203272:	bac5                	j	ffffffffc0202c62 <pmm_init+0x102>
ffffffffc0203274:	9fffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203278:	000b3783          	ld	a5,0(s6)
ffffffffc020327c:	779c                	ld	a5,40(a5)
ffffffffc020327e:	9782                	jalr	a5
ffffffffc0203280:	8c2a                	mv	s8,a0
ffffffffc0203282:	9ebfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203286:	b361                	j	ffffffffc020300e <pmm_init+0x4ae>
ffffffffc0203288:	9ebfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020328c:	000b3783          	ld	a5,0(s6)
ffffffffc0203290:	779c                	ld	a5,40(a5)
ffffffffc0203292:	9782                	jalr	a5
ffffffffc0203294:	8a2a                	mv	s4,a0
ffffffffc0203296:	9d7fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020329a:	bb81                	j	ffffffffc0202fea <pmm_init+0x48a>
ffffffffc020329c:	e42a                	sd	a0,8(sp)
ffffffffc020329e:	9d5fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02032a2:	000b3783          	ld	a5,0(s6)
ffffffffc02032a6:	6522                	ld	a0,8(sp)
ffffffffc02032a8:	4585                	li	a1,1
ffffffffc02032aa:	739c                	ld	a5,32(a5)
ffffffffc02032ac:	9782                	jalr	a5
ffffffffc02032ae:	9bffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02032b2:	bb21                	j	ffffffffc0202fca <pmm_init+0x46a>
ffffffffc02032b4:	e42a                	sd	a0,8(sp)
ffffffffc02032b6:	9bdfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02032ba:	000b3783          	ld	a5,0(s6)
ffffffffc02032be:	6522                	ld	a0,8(sp)
ffffffffc02032c0:	4585                	li	a1,1
ffffffffc02032c2:	739c                	ld	a5,32(a5)
ffffffffc02032c4:	9782                	jalr	a5
ffffffffc02032c6:	9a7fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02032ca:	b9c1                	j	ffffffffc0202f9a <pmm_init+0x43a>
ffffffffc02032cc:	9a7fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02032d0:	000b3783          	ld	a5,0(s6)
ffffffffc02032d4:	4505                	li	a0,1
ffffffffc02032d6:	6f9c                	ld	a5,24(a5)
ffffffffc02032d8:	9782                	jalr	a5
ffffffffc02032da:	8a2a                	mv	s4,a0
ffffffffc02032dc:	991fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02032e0:	bb51                	j	ffffffffc0203074 <pmm_init+0x514>
ffffffffc02032e2:	991fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02032e6:	000b3783          	ld	a5,0(s6)
ffffffffc02032ea:	779c                	ld	a5,40(a5)
ffffffffc02032ec:	9782                	jalr	a5
ffffffffc02032ee:	842a                	mv	s0,a0
ffffffffc02032f0:	97dfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02032f4:	b5e1                	j	ffffffffc02031bc <pmm_init+0x65c>
ffffffffc02032f6:	e42a                	sd	a0,8(sp)
ffffffffc02032f8:	97bfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02032fc:	000b3783          	ld	a5,0(s6)
ffffffffc0203300:	6522                	ld	a0,8(sp)
ffffffffc0203302:	4585                	li	a1,1
ffffffffc0203304:	739c                	ld	a5,32(a5)
ffffffffc0203306:	9782                	jalr	a5
ffffffffc0203308:	965fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020330c:	bd41                	j	ffffffffc020319c <pmm_init+0x63c>
ffffffffc020330e:	e42a                	sd	a0,8(sp)
ffffffffc0203310:	963fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203314:	000b3783          	ld	a5,0(s6)
ffffffffc0203318:	6522                	ld	a0,8(sp)
ffffffffc020331a:	4585                	li	a1,1
ffffffffc020331c:	739c                	ld	a5,32(a5)
ffffffffc020331e:	9782                	jalr	a5
ffffffffc0203320:	94dfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203324:	b5a1                	j	ffffffffc020316c <pmm_init+0x60c>
ffffffffc0203326:	94dfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020332a:	000b3783          	ld	a5,0(s6)
ffffffffc020332e:	4585                	li	a1,1
ffffffffc0203330:	8552                	mv	a0,s4
ffffffffc0203332:	739c                	ld	a5,32(a5)
ffffffffc0203334:	9782                	jalr	a5
ffffffffc0203336:	937fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020333a:	b511                	j	ffffffffc020313e <pmm_init+0x5de>
ffffffffc020333c:	00010417          	auipc	s0,0x10
ffffffffc0203340:	cc440413          	addi	s0,s0,-828 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc0203344:	00010797          	auipc	a5,0x10
ffffffffc0203348:	cbc78793          	addi	a5,a5,-836 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc020334c:	a0f41de3          	bne	s0,a5,ffffffffc0202d66 <pmm_init+0x206>
ffffffffc0203350:	4581                	li	a1,0
ffffffffc0203352:	6605                	lui	a2,0x1
ffffffffc0203354:	8522                	mv	a0,s0
ffffffffc0203356:	504080ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc020335a:	0000d597          	auipc	a1,0xd
ffffffffc020335e:	ca658593          	addi	a1,a1,-858 # ffffffffc0210000 <bootstackguard>
ffffffffc0203362:	0000e797          	auipc	a5,0xe
ffffffffc0203366:	c8078ea3          	sb	zero,-867(a5) # ffffffffc0210fff <bootstackguard+0xfff>
ffffffffc020336a:	0000d797          	auipc	a5,0xd
ffffffffc020336e:	c8078b23          	sb	zero,-874(a5) # ffffffffc0210000 <bootstackguard>
ffffffffc0203372:	00093503          	ld	a0,0(s2)
ffffffffc0203376:	2555ec63          	bltu	a1,s5,ffffffffc02035ce <pmm_init+0xa6e>
ffffffffc020337a:	0009b683          	ld	a3,0(s3)
ffffffffc020337e:	4701                	li	a4,0
ffffffffc0203380:	6605                	lui	a2,0x1
ffffffffc0203382:	40d586b3          	sub	a3,a1,a3
ffffffffc0203386:	956ff0ef          	jal	ra,ffffffffc02024dc <boot_map_segment>
ffffffffc020338a:	00093503          	ld	a0,0(s2)
ffffffffc020338e:	23546363          	bltu	s0,s5,ffffffffc02035b4 <pmm_init+0xa54>
ffffffffc0203392:	0009b683          	ld	a3,0(s3)
ffffffffc0203396:	4701                	li	a4,0
ffffffffc0203398:	6605                	lui	a2,0x1
ffffffffc020339a:	40d406b3          	sub	a3,s0,a3
ffffffffc020339e:	85a2                	mv	a1,s0
ffffffffc02033a0:	93cff0ef          	jal	ra,ffffffffc02024dc <boot_map_segment>
ffffffffc02033a4:	12000073          	sfence.vma
ffffffffc02033a8:	00009517          	auipc	a0,0x9
ffffffffc02033ac:	78050513          	addi	a0,a0,1920 # ffffffffc020cb28 <default_pmm_manager+0x2c8>
ffffffffc02033b0:	df7fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02033b4:	ba4d                	j	ffffffffc0202d66 <pmm_init+0x206>
ffffffffc02033b6:	0000a697          	auipc	a3,0xa
ffffffffc02033ba:	ac268693          	addi	a3,a3,-1342 # ffffffffc020ce78 <default_pmm_manager+0x618>
ffffffffc02033be:	00009617          	auipc	a2,0x9
ffffffffc02033c2:	98260613          	addi	a2,a2,-1662 # ffffffffc020bd40 <commands+0x210>
ffffffffc02033c6:	28d00593          	li	a1,653
ffffffffc02033ca:	00009517          	auipc	a0,0x9
ffffffffc02033ce:	5e650513          	addi	a0,a0,1510 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02033d2:	8ccfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033d6:	86a2                	mv	a3,s0
ffffffffc02033d8:	00009617          	auipc	a2,0x9
ffffffffc02033dc:	4c060613          	addi	a2,a2,1216 # ffffffffc020c898 <default_pmm_manager+0x38>
ffffffffc02033e0:	28d00593          	li	a1,653
ffffffffc02033e4:	00009517          	auipc	a0,0x9
ffffffffc02033e8:	5cc50513          	addi	a0,a0,1484 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02033ec:	8b2fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033f0:	0000a697          	auipc	a3,0xa
ffffffffc02033f4:	ac868693          	addi	a3,a3,-1336 # ffffffffc020ceb8 <default_pmm_manager+0x658>
ffffffffc02033f8:	00009617          	auipc	a2,0x9
ffffffffc02033fc:	94860613          	addi	a2,a2,-1720 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203400:	28e00593          	li	a1,654
ffffffffc0203404:	00009517          	auipc	a0,0x9
ffffffffc0203408:	5ac50513          	addi	a0,a0,1452 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020340c:	892fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203410:	db5fe0ef          	jal	ra,ffffffffc02021c4 <pa2page.part.0>
ffffffffc0203414:	0000a697          	auipc	a3,0xa
ffffffffc0203418:	8cc68693          	addi	a3,a3,-1844 # ffffffffc020cce0 <default_pmm_manager+0x480>
ffffffffc020341c:	00009617          	auipc	a2,0x9
ffffffffc0203420:	92460613          	addi	a2,a2,-1756 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203424:	26a00593          	li	a1,618
ffffffffc0203428:	00009517          	auipc	a0,0x9
ffffffffc020342c:	58850513          	addi	a0,a0,1416 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203430:	86efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203434:	0000a697          	auipc	a3,0xa
ffffffffc0203438:	b0c68693          	addi	a3,a3,-1268 # ffffffffc020cf40 <default_pmm_manager+0x6e0>
ffffffffc020343c:	00009617          	auipc	a2,0x9
ffffffffc0203440:	90460613          	addi	a2,a2,-1788 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203444:	29700593          	li	a1,663
ffffffffc0203448:	00009517          	auipc	a0,0x9
ffffffffc020344c:	56850513          	addi	a0,a0,1384 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203450:	84efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203454:	0000a697          	auipc	a3,0xa
ffffffffc0203458:	9ac68693          	addi	a3,a3,-1620 # ffffffffc020ce00 <default_pmm_manager+0x5a0>
ffffffffc020345c:	00009617          	auipc	a2,0x9
ffffffffc0203460:	8e460613          	addi	a2,a2,-1820 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203464:	27600593          	li	a1,630
ffffffffc0203468:	00009517          	auipc	a0,0x9
ffffffffc020346c:	54850513          	addi	a0,a0,1352 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203470:	82efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203474:	0000a697          	auipc	a3,0xa
ffffffffc0203478:	95c68693          	addi	a3,a3,-1700 # ffffffffc020cdd0 <default_pmm_manager+0x570>
ffffffffc020347c:	00009617          	auipc	a2,0x9
ffffffffc0203480:	8c460613          	addi	a2,a2,-1852 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203484:	26c00593          	li	a1,620
ffffffffc0203488:	00009517          	auipc	a0,0x9
ffffffffc020348c:	52850513          	addi	a0,a0,1320 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203490:	80efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203494:	00009697          	auipc	a3,0x9
ffffffffc0203498:	7ac68693          	addi	a3,a3,1964 # ffffffffc020cc40 <default_pmm_manager+0x3e0>
ffffffffc020349c:	00009617          	auipc	a2,0x9
ffffffffc02034a0:	8a460613          	addi	a2,a2,-1884 # ffffffffc020bd40 <commands+0x210>
ffffffffc02034a4:	26b00593          	li	a1,619
ffffffffc02034a8:	00009517          	auipc	a0,0x9
ffffffffc02034ac:	50850513          	addi	a0,a0,1288 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02034b0:	feffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034b4:	0000a697          	auipc	a3,0xa
ffffffffc02034b8:	90468693          	addi	a3,a3,-1788 # ffffffffc020cdb8 <default_pmm_manager+0x558>
ffffffffc02034bc:	00009617          	auipc	a2,0x9
ffffffffc02034c0:	88460613          	addi	a2,a2,-1916 # ffffffffc020bd40 <commands+0x210>
ffffffffc02034c4:	27000593          	li	a1,624
ffffffffc02034c8:	00009517          	auipc	a0,0x9
ffffffffc02034cc:	4e850513          	addi	a0,a0,1256 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02034d0:	fcffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034d4:	00009697          	auipc	a3,0x9
ffffffffc02034d8:	78468693          	addi	a3,a3,1924 # ffffffffc020cc58 <default_pmm_manager+0x3f8>
ffffffffc02034dc:	00009617          	auipc	a2,0x9
ffffffffc02034e0:	86460613          	addi	a2,a2,-1948 # ffffffffc020bd40 <commands+0x210>
ffffffffc02034e4:	26f00593          	li	a1,623
ffffffffc02034e8:	00009517          	auipc	a0,0x9
ffffffffc02034ec:	4c850513          	addi	a0,a0,1224 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02034f0:	faffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034f4:	0000a697          	auipc	a3,0xa
ffffffffc02034f8:	9dc68693          	addi	a3,a3,-1572 # ffffffffc020ced0 <default_pmm_manager+0x670>
ffffffffc02034fc:	00009617          	auipc	a2,0x9
ffffffffc0203500:	84460613          	addi	a2,a2,-1980 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203504:	29100593          	li	a1,657
ffffffffc0203508:	00009517          	auipc	a0,0x9
ffffffffc020350c:	4a850513          	addi	a0,a0,1192 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203510:	f8ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203514:	0000a697          	auipc	a3,0xa
ffffffffc0203518:	a1468693          	addi	a3,a3,-1516 # ffffffffc020cf28 <default_pmm_manager+0x6c8>
ffffffffc020351c:	00009617          	auipc	a2,0x9
ffffffffc0203520:	82460613          	addi	a2,a2,-2012 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203524:	29600593          	li	a1,662
ffffffffc0203528:	00009517          	auipc	a0,0x9
ffffffffc020352c:	48850513          	addi	a0,a0,1160 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203530:	f6ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203534:	0000a697          	auipc	a3,0xa
ffffffffc0203538:	9b468693          	addi	a3,a3,-1612 # ffffffffc020cee8 <default_pmm_manager+0x688>
ffffffffc020353c:	00009617          	auipc	a2,0x9
ffffffffc0203540:	80460613          	addi	a2,a2,-2044 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203544:	29500593          	li	a1,661
ffffffffc0203548:	00009517          	auipc	a0,0x9
ffffffffc020354c:	46850513          	addi	a0,a0,1128 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203550:	f4ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203554:	0000a697          	auipc	a3,0xa
ffffffffc0203558:	a9c68693          	addi	a3,a3,-1380 # ffffffffc020cff0 <default_pmm_manager+0x790>
ffffffffc020355c:	00008617          	auipc	a2,0x8
ffffffffc0203560:	7e460613          	addi	a2,a2,2020 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203564:	29f00593          	li	a1,671
ffffffffc0203568:	00009517          	auipc	a0,0x9
ffffffffc020356c:	44850513          	addi	a0,a0,1096 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203570:	f2ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203574:	0000a697          	auipc	a3,0xa
ffffffffc0203578:	a4468693          	addi	a3,a3,-1468 # ffffffffc020cfb8 <default_pmm_manager+0x758>
ffffffffc020357c:	00008617          	auipc	a2,0x8
ffffffffc0203580:	7c460613          	addi	a2,a2,1988 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203584:	29c00593          	li	a1,668
ffffffffc0203588:	00009517          	auipc	a0,0x9
ffffffffc020358c:	42850513          	addi	a0,a0,1064 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203590:	f0ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203594:	0000a697          	auipc	a3,0xa
ffffffffc0203598:	9f468693          	addi	a3,a3,-1548 # ffffffffc020cf88 <default_pmm_manager+0x728>
ffffffffc020359c:	00008617          	auipc	a2,0x8
ffffffffc02035a0:	7a460613          	addi	a2,a2,1956 # ffffffffc020bd40 <commands+0x210>
ffffffffc02035a4:	29800593          	li	a1,664
ffffffffc02035a8:	00009517          	auipc	a0,0x9
ffffffffc02035ac:	40850513          	addi	a0,a0,1032 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02035b0:	eeffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035b4:	86a2                	mv	a3,s0
ffffffffc02035b6:	00009617          	auipc	a2,0x9
ffffffffc02035ba:	38a60613          	addi	a2,a2,906 # ffffffffc020c940 <default_pmm_manager+0xe0>
ffffffffc02035be:	0dc00593          	li	a1,220
ffffffffc02035c2:	00009517          	auipc	a0,0x9
ffffffffc02035c6:	3ee50513          	addi	a0,a0,1006 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02035ca:	ed5fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035ce:	86ae                	mv	a3,a1
ffffffffc02035d0:	00009617          	auipc	a2,0x9
ffffffffc02035d4:	37060613          	addi	a2,a2,880 # ffffffffc020c940 <default_pmm_manager+0xe0>
ffffffffc02035d8:	0db00593          	li	a1,219
ffffffffc02035dc:	00009517          	auipc	a0,0x9
ffffffffc02035e0:	3d450513          	addi	a0,a0,980 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02035e4:	ebbfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035e8:	00009697          	auipc	a3,0x9
ffffffffc02035ec:	58868693          	addi	a3,a3,1416 # ffffffffc020cb70 <default_pmm_manager+0x310>
ffffffffc02035f0:	00008617          	auipc	a2,0x8
ffffffffc02035f4:	75060613          	addi	a2,a2,1872 # ffffffffc020bd40 <commands+0x210>
ffffffffc02035f8:	24f00593          	li	a1,591
ffffffffc02035fc:	00009517          	auipc	a0,0x9
ffffffffc0203600:	3b450513          	addi	a0,a0,948 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203604:	e9bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203608:	00009697          	auipc	a3,0x9
ffffffffc020360c:	54868693          	addi	a3,a3,1352 # ffffffffc020cb50 <default_pmm_manager+0x2f0>
ffffffffc0203610:	00008617          	auipc	a2,0x8
ffffffffc0203614:	73060613          	addi	a2,a2,1840 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203618:	24e00593          	li	a1,590
ffffffffc020361c:	00009517          	auipc	a0,0x9
ffffffffc0203620:	39450513          	addi	a0,a0,916 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203624:	e7bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203628:	00009617          	auipc	a2,0x9
ffffffffc020362c:	4b860613          	addi	a2,a2,1208 # ffffffffc020cae0 <default_pmm_manager+0x280>
ffffffffc0203630:	0aa00593          	li	a1,170
ffffffffc0203634:	00009517          	auipc	a0,0x9
ffffffffc0203638:	37c50513          	addi	a0,a0,892 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020363c:	e63fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203640:	00009617          	auipc	a2,0x9
ffffffffc0203644:	40860613          	addi	a2,a2,1032 # ffffffffc020ca48 <default_pmm_manager+0x1e8>
ffffffffc0203648:	06500593          	li	a1,101
ffffffffc020364c:	00009517          	auipc	a0,0x9
ffffffffc0203650:	36450513          	addi	a0,a0,868 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203654:	e4bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203658:	00009697          	auipc	a3,0x9
ffffffffc020365c:	7d868693          	addi	a3,a3,2008 # ffffffffc020ce30 <default_pmm_manager+0x5d0>
ffffffffc0203660:	00008617          	auipc	a2,0x8
ffffffffc0203664:	6e060613          	addi	a2,a2,1760 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203668:	2a800593          	li	a1,680
ffffffffc020366c:	00009517          	auipc	a0,0x9
ffffffffc0203670:	34450513          	addi	a0,a0,836 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203674:	e2bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203678:	00009697          	auipc	a3,0x9
ffffffffc020367c:	5f868693          	addi	a3,a3,1528 # ffffffffc020cc70 <default_pmm_manager+0x410>
ffffffffc0203680:	00008617          	auipc	a2,0x8
ffffffffc0203684:	6c060613          	addi	a2,a2,1728 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203688:	25d00593          	li	a1,605
ffffffffc020368c:	00009517          	auipc	a0,0x9
ffffffffc0203690:	32450513          	addi	a0,a0,804 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203694:	e0bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203698:	86d6                	mv	a3,s5
ffffffffc020369a:	00009617          	auipc	a2,0x9
ffffffffc020369e:	1fe60613          	addi	a2,a2,510 # ffffffffc020c898 <default_pmm_manager+0x38>
ffffffffc02036a2:	25c00593          	li	a1,604
ffffffffc02036a6:	00009517          	auipc	a0,0x9
ffffffffc02036aa:	30a50513          	addi	a0,a0,778 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02036ae:	df1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036b2:	00009697          	auipc	a3,0x9
ffffffffc02036b6:	70668693          	addi	a3,a3,1798 # ffffffffc020cdb8 <default_pmm_manager+0x558>
ffffffffc02036ba:	00008617          	auipc	a2,0x8
ffffffffc02036be:	68660613          	addi	a2,a2,1670 # ffffffffc020bd40 <commands+0x210>
ffffffffc02036c2:	26900593          	li	a1,617
ffffffffc02036c6:	00009517          	auipc	a0,0x9
ffffffffc02036ca:	2ea50513          	addi	a0,a0,746 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02036ce:	dd1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036d2:	00009697          	auipc	a3,0x9
ffffffffc02036d6:	6ce68693          	addi	a3,a3,1742 # ffffffffc020cda0 <default_pmm_manager+0x540>
ffffffffc02036da:	00008617          	auipc	a2,0x8
ffffffffc02036de:	66660613          	addi	a2,a2,1638 # ffffffffc020bd40 <commands+0x210>
ffffffffc02036e2:	26800593          	li	a1,616
ffffffffc02036e6:	00009517          	auipc	a0,0x9
ffffffffc02036ea:	2ca50513          	addi	a0,a0,714 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02036ee:	db1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036f2:	00009697          	auipc	a3,0x9
ffffffffc02036f6:	67e68693          	addi	a3,a3,1662 # ffffffffc020cd70 <default_pmm_manager+0x510>
ffffffffc02036fa:	00008617          	auipc	a2,0x8
ffffffffc02036fe:	64660613          	addi	a2,a2,1606 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203702:	26700593          	li	a1,615
ffffffffc0203706:	00009517          	auipc	a0,0x9
ffffffffc020370a:	2aa50513          	addi	a0,a0,682 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020370e:	d91fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203712:	00009697          	auipc	a3,0x9
ffffffffc0203716:	64668693          	addi	a3,a3,1606 # ffffffffc020cd58 <default_pmm_manager+0x4f8>
ffffffffc020371a:	00008617          	auipc	a2,0x8
ffffffffc020371e:	62660613          	addi	a2,a2,1574 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203722:	26500593          	li	a1,613
ffffffffc0203726:	00009517          	auipc	a0,0x9
ffffffffc020372a:	28a50513          	addi	a0,a0,650 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020372e:	d71fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203732:	00009697          	auipc	a3,0x9
ffffffffc0203736:	60668693          	addi	a3,a3,1542 # ffffffffc020cd38 <default_pmm_manager+0x4d8>
ffffffffc020373a:	00008617          	auipc	a2,0x8
ffffffffc020373e:	60660613          	addi	a2,a2,1542 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203742:	26400593          	li	a1,612
ffffffffc0203746:	00009517          	auipc	a0,0x9
ffffffffc020374a:	26a50513          	addi	a0,a0,618 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020374e:	d51fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203752:	00009697          	auipc	a3,0x9
ffffffffc0203756:	5d668693          	addi	a3,a3,1494 # ffffffffc020cd28 <default_pmm_manager+0x4c8>
ffffffffc020375a:	00008617          	auipc	a2,0x8
ffffffffc020375e:	5e660613          	addi	a2,a2,1510 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203762:	26300593          	li	a1,611
ffffffffc0203766:	00009517          	auipc	a0,0x9
ffffffffc020376a:	24a50513          	addi	a0,a0,586 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020376e:	d31fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203772:	00009697          	auipc	a3,0x9
ffffffffc0203776:	5a668693          	addi	a3,a3,1446 # ffffffffc020cd18 <default_pmm_manager+0x4b8>
ffffffffc020377a:	00008617          	auipc	a2,0x8
ffffffffc020377e:	5c660613          	addi	a2,a2,1478 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203782:	26200593          	li	a1,610
ffffffffc0203786:	00009517          	auipc	a0,0x9
ffffffffc020378a:	22a50513          	addi	a0,a0,554 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020378e:	d11fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203792:	00009697          	auipc	a3,0x9
ffffffffc0203796:	54e68693          	addi	a3,a3,1358 # ffffffffc020cce0 <default_pmm_manager+0x480>
ffffffffc020379a:	00008617          	auipc	a2,0x8
ffffffffc020379e:	5a660613          	addi	a2,a2,1446 # ffffffffc020bd40 <commands+0x210>
ffffffffc02037a2:	26100593          	li	a1,609
ffffffffc02037a6:	00009517          	auipc	a0,0x9
ffffffffc02037aa:	20a50513          	addi	a0,a0,522 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02037ae:	cf1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037b2:	00009697          	auipc	a3,0x9
ffffffffc02037b6:	67e68693          	addi	a3,a3,1662 # ffffffffc020ce30 <default_pmm_manager+0x5d0>
ffffffffc02037ba:	00008617          	auipc	a2,0x8
ffffffffc02037be:	58660613          	addi	a2,a2,1414 # ffffffffc020bd40 <commands+0x210>
ffffffffc02037c2:	27e00593          	li	a1,638
ffffffffc02037c6:	00009517          	auipc	a0,0x9
ffffffffc02037ca:	1ea50513          	addi	a0,a0,490 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02037ce:	cd1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037d2:	00009617          	auipc	a2,0x9
ffffffffc02037d6:	0c660613          	addi	a2,a2,198 # ffffffffc020c898 <default_pmm_manager+0x38>
ffffffffc02037da:	07100593          	li	a1,113
ffffffffc02037de:	00009517          	auipc	a0,0x9
ffffffffc02037e2:	0e250513          	addi	a0,a0,226 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc02037e6:	cb9fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037ea:	86a2                	mv	a3,s0
ffffffffc02037ec:	00009617          	auipc	a2,0x9
ffffffffc02037f0:	15460613          	addi	a2,a2,340 # ffffffffc020c940 <default_pmm_manager+0xe0>
ffffffffc02037f4:	0ca00593          	li	a1,202
ffffffffc02037f8:	00009517          	auipc	a0,0x9
ffffffffc02037fc:	1b850513          	addi	a0,a0,440 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203800:	c9ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203804:	00009617          	auipc	a2,0x9
ffffffffc0203808:	13c60613          	addi	a2,a2,316 # ffffffffc020c940 <default_pmm_manager+0xe0>
ffffffffc020380c:	08100593          	li	a1,129
ffffffffc0203810:	00009517          	auipc	a0,0x9
ffffffffc0203814:	1a050513          	addi	a0,a0,416 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203818:	c87fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020381c:	00009697          	auipc	a3,0x9
ffffffffc0203820:	48468693          	addi	a3,a3,1156 # ffffffffc020cca0 <default_pmm_manager+0x440>
ffffffffc0203824:	00008617          	auipc	a2,0x8
ffffffffc0203828:	51c60613          	addi	a2,a2,1308 # ffffffffc020bd40 <commands+0x210>
ffffffffc020382c:	26000593          	li	a1,608
ffffffffc0203830:	00009517          	auipc	a0,0x9
ffffffffc0203834:	18050513          	addi	a0,a0,384 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203838:	c67fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020383c:	00009697          	auipc	a3,0x9
ffffffffc0203840:	3a468693          	addi	a3,a3,932 # ffffffffc020cbe0 <default_pmm_manager+0x380>
ffffffffc0203844:	00008617          	auipc	a2,0x8
ffffffffc0203848:	4fc60613          	addi	a2,a2,1276 # ffffffffc020bd40 <commands+0x210>
ffffffffc020384c:	25400593          	li	a1,596
ffffffffc0203850:	00009517          	auipc	a0,0x9
ffffffffc0203854:	16050513          	addi	a0,a0,352 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203858:	c47fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020385c:	985fe0ef          	jal	ra,ffffffffc02021e0 <pte2page.part.0>
ffffffffc0203860:	00009697          	auipc	a3,0x9
ffffffffc0203864:	3b068693          	addi	a3,a3,944 # ffffffffc020cc10 <default_pmm_manager+0x3b0>
ffffffffc0203868:	00008617          	auipc	a2,0x8
ffffffffc020386c:	4d860613          	addi	a2,a2,1240 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203870:	25700593          	li	a1,599
ffffffffc0203874:	00009517          	auipc	a0,0x9
ffffffffc0203878:	13c50513          	addi	a0,a0,316 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020387c:	c23fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203880:	00009697          	auipc	a3,0x9
ffffffffc0203884:	33068693          	addi	a3,a3,816 # ffffffffc020cbb0 <default_pmm_manager+0x350>
ffffffffc0203888:	00008617          	auipc	a2,0x8
ffffffffc020388c:	4b860613          	addi	a2,a2,1208 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203890:	25000593          	li	a1,592
ffffffffc0203894:	00009517          	auipc	a0,0x9
ffffffffc0203898:	11c50513          	addi	a0,a0,284 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020389c:	c03fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038a0:	00009697          	auipc	a3,0x9
ffffffffc02038a4:	3a068693          	addi	a3,a3,928 # ffffffffc020cc40 <default_pmm_manager+0x3e0>
ffffffffc02038a8:	00008617          	auipc	a2,0x8
ffffffffc02038ac:	49860613          	addi	a2,a2,1176 # ffffffffc020bd40 <commands+0x210>
ffffffffc02038b0:	25800593          	li	a1,600
ffffffffc02038b4:	00009517          	auipc	a0,0x9
ffffffffc02038b8:	0fc50513          	addi	a0,a0,252 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02038bc:	be3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038c0:	00009617          	auipc	a2,0x9
ffffffffc02038c4:	fd860613          	addi	a2,a2,-40 # ffffffffc020c898 <default_pmm_manager+0x38>
ffffffffc02038c8:	25b00593          	li	a1,603
ffffffffc02038cc:	00009517          	auipc	a0,0x9
ffffffffc02038d0:	0e450513          	addi	a0,a0,228 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02038d4:	bcbfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038d8:	00009697          	auipc	a3,0x9
ffffffffc02038dc:	38068693          	addi	a3,a3,896 # ffffffffc020cc58 <default_pmm_manager+0x3f8>
ffffffffc02038e0:	00008617          	auipc	a2,0x8
ffffffffc02038e4:	46060613          	addi	a2,a2,1120 # ffffffffc020bd40 <commands+0x210>
ffffffffc02038e8:	25900593          	li	a1,601
ffffffffc02038ec:	00009517          	auipc	a0,0x9
ffffffffc02038f0:	0c450513          	addi	a0,a0,196 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc02038f4:	babfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038f8:	86ca                	mv	a3,s2
ffffffffc02038fa:	00009617          	auipc	a2,0x9
ffffffffc02038fe:	04660613          	addi	a2,a2,70 # ffffffffc020c940 <default_pmm_manager+0xe0>
ffffffffc0203902:	0c600593          	li	a1,198
ffffffffc0203906:	00009517          	auipc	a0,0x9
ffffffffc020390a:	0aa50513          	addi	a0,a0,170 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020390e:	b91fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203912:	00009697          	auipc	a3,0x9
ffffffffc0203916:	4a668693          	addi	a3,a3,1190 # ffffffffc020cdb8 <default_pmm_manager+0x558>
ffffffffc020391a:	00008617          	auipc	a2,0x8
ffffffffc020391e:	42660613          	addi	a2,a2,1062 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203922:	27400593          	li	a1,628
ffffffffc0203926:	00009517          	auipc	a0,0x9
ffffffffc020392a:	08a50513          	addi	a0,a0,138 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020392e:	b71fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203932:	00009697          	auipc	a3,0x9
ffffffffc0203936:	4b668693          	addi	a3,a3,1206 # ffffffffc020cde8 <default_pmm_manager+0x588>
ffffffffc020393a:	00008617          	auipc	a2,0x8
ffffffffc020393e:	40660613          	addi	a2,a2,1030 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203942:	27300593          	li	a1,627
ffffffffc0203946:	00009517          	auipc	a0,0x9
ffffffffc020394a:	06a50513          	addi	a0,a0,106 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc020394e:	b51fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203952 <copy_range>:
ffffffffc0203952:	7159                	addi	sp,sp,-112
ffffffffc0203954:	00d667b3          	or	a5,a2,a3
ffffffffc0203958:	f486                	sd	ra,104(sp)
ffffffffc020395a:	f0a2                	sd	s0,96(sp)
ffffffffc020395c:	eca6                	sd	s1,88(sp)
ffffffffc020395e:	e8ca                	sd	s2,80(sp)
ffffffffc0203960:	e4ce                	sd	s3,72(sp)
ffffffffc0203962:	e0d2                	sd	s4,64(sp)
ffffffffc0203964:	fc56                	sd	s5,56(sp)
ffffffffc0203966:	f85a                	sd	s6,48(sp)
ffffffffc0203968:	f45e                	sd	s7,40(sp)
ffffffffc020396a:	f062                	sd	s8,32(sp)
ffffffffc020396c:	ec66                	sd	s9,24(sp)
ffffffffc020396e:	e86a                	sd	s10,16(sp)
ffffffffc0203970:	e46e                	sd	s11,8(sp)
ffffffffc0203972:	17d2                	slli	a5,a5,0x34
ffffffffc0203974:	20079f63          	bnez	a5,ffffffffc0203b92 <copy_range+0x240>
ffffffffc0203978:	002007b7          	lui	a5,0x200
ffffffffc020397c:	8432                	mv	s0,a2
ffffffffc020397e:	1af66263          	bltu	a2,a5,ffffffffc0203b22 <copy_range+0x1d0>
ffffffffc0203982:	8936                	mv	s2,a3
ffffffffc0203984:	18d67f63          	bgeu	a2,a3,ffffffffc0203b22 <copy_range+0x1d0>
ffffffffc0203988:	4785                	li	a5,1
ffffffffc020398a:	07fe                	slli	a5,a5,0x1f
ffffffffc020398c:	18d7eb63          	bltu	a5,a3,ffffffffc0203b22 <copy_range+0x1d0>
ffffffffc0203990:	5b7d                	li	s6,-1
ffffffffc0203992:	8aaa                	mv	s5,a0
ffffffffc0203994:	89ae                	mv	s3,a1
ffffffffc0203996:	6a05                	lui	s4,0x1
ffffffffc0203998:	00093c17          	auipc	s8,0x93
ffffffffc020399c:	f08c0c13          	addi	s8,s8,-248 # ffffffffc02968a0 <npage>
ffffffffc02039a0:	00093b97          	auipc	s7,0x93
ffffffffc02039a4:	f08b8b93          	addi	s7,s7,-248 # ffffffffc02968a8 <pages>
ffffffffc02039a8:	00cb5b13          	srli	s6,s6,0xc
ffffffffc02039ac:	00093c97          	auipc	s9,0x93
ffffffffc02039b0:	f04c8c93          	addi	s9,s9,-252 # ffffffffc02968b0 <pmm_manager>
ffffffffc02039b4:	4601                	li	a2,0
ffffffffc02039b6:	85a2                	mv	a1,s0
ffffffffc02039b8:	854e                	mv	a0,s3
ffffffffc02039ba:	8fbfe0ef          	jal	ra,ffffffffc02022b4 <get_pte>
ffffffffc02039be:	84aa                	mv	s1,a0
ffffffffc02039c0:	0e050c63          	beqz	a0,ffffffffc0203ab8 <copy_range+0x166>
ffffffffc02039c4:	611c                	ld	a5,0(a0)
ffffffffc02039c6:	8b85                	andi	a5,a5,1
ffffffffc02039c8:	e785                	bnez	a5,ffffffffc02039f0 <copy_range+0x9e>
ffffffffc02039ca:	9452                	add	s0,s0,s4
ffffffffc02039cc:	ff2464e3          	bltu	s0,s2,ffffffffc02039b4 <copy_range+0x62>
ffffffffc02039d0:	4501                	li	a0,0
ffffffffc02039d2:	70a6                	ld	ra,104(sp)
ffffffffc02039d4:	7406                	ld	s0,96(sp)
ffffffffc02039d6:	64e6                	ld	s1,88(sp)
ffffffffc02039d8:	6946                	ld	s2,80(sp)
ffffffffc02039da:	69a6                	ld	s3,72(sp)
ffffffffc02039dc:	6a06                	ld	s4,64(sp)
ffffffffc02039de:	7ae2                	ld	s5,56(sp)
ffffffffc02039e0:	7b42                	ld	s6,48(sp)
ffffffffc02039e2:	7ba2                	ld	s7,40(sp)
ffffffffc02039e4:	7c02                	ld	s8,32(sp)
ffffffffc02039e6:	6ce2                	ld	s9,24(sp)
ffffffffc02039e8:	6d42                	ld	s10,16(sp)
ffffffffc02039ea:	6da2                	ld	s11,8(sp)
ffffffffc02039ec:	6165                	addi	sp,sp,112
ffffffffc02039ee:	8082                	ret
ffffffffc02039f0:	4605                	li	a2,1
ffffffffc02039f2:	85a2                	mv	a1,s0
ffffffffc02039f4:	8556                	mv	a0,s5
ffffffffc02039f6:	8bffe0ef          	jal	ra,ffffffffc02022b4 <get_pte>
ffffffffc02039fa:	c56d                	beqz	a0,ffffffffc0203ae4 <copy_range+0x192>
ffffffffc02039fc:	609c                	ld	a5,0(s1)
ffffffffc02039fe:	0017f713          	andi	a4,a5,1
ffffffffc0203a02:	01f7f493          	andi	s1,a5,31
ffffffffc0203a06:	16070a63          	beqz	a4,ffffffffc0203b7a <copy_range+0x228>
ffffffffc0203a0a:	000c3683          	ld	a3,0(s8)
ffffffffc0203a0e:	078a                	slli	a5,a5,0x2
ffffffffc0203a10:	00c7d713          	srli	a4,a5,0xc
ffffffffc0203a14:	14d77763          	bgeu	a4,a3,ffffffffc0203b62 <copy_range+0x210>
ffffffffc0203a18:	000bb783          	ld	a5,0(s7)
ffffffffc0203a1c:	fff806b7          	lui	a3,0xfff80
ffffffffc0203a20:	9736                	add	a4,a4,a3
ffffffffc0203a22:	071a                	slli	a4,a4,0x6
ffffffffc0203a24:	00e78db3          	add	s11,a5,a4
ffffffffc0203a28:	10002773          	csrr	a4,sstatus
ffffffffc0203a2c:	8b09                	andi	a4,a4,2
ffffffffc0203a2e:	e345                	bnez	a4,ffffffffc0203ace <copy_range+0x17c>
ffffffffc0203a30:	000cb703          	ld	a4,0(s9)
ffffffffc0203a34:	4505                	li	a0,1
ffffffffc0203a36:	6f18                	ld	a4,24(a4)
ffffffffc0203a38:	9702                	jalr	a4
ffffffffc0203a3a:	8d2a                	mv	s10,a0
ffffffffc0203a3c:	0c0d8363          	beqz	s11,ffffffffc0203b02 <copy_range+0x1b0>
ffffffffc0203a40:	100d0163          	beqz	s10,ffffffffc0203b42 <copy_range+0x1f0>
ffffffffc0203a44:	000bb703          	ld	a4,0(s7)
ffffffffc0203a48:	000805b7          	lui	a1,0x80
ffffffffc0203a4c:	000c3603          	ld	a2,0(s8)
ffffffffc0203a50:	40ed86b3          	sub	a3,s11,a4
ffffffffc0203a54:	8699                	srai	a3,a3,0x6
ffffffffc0203a56:	96ae                	add	a3,a3,a1
ffffffffc0203a58:	0166f7b3          	and	a5,a3,s6
ffffffffc0203a5c:	06b2                	slli	a3,a3,0xc
ffffffffc0203a5e:	08c7f663          	bgeu	a5,a2,ffffffffc0203aea <copy_range+0x198>
ffffffffc0203a62:	40ed07b3          	sub	a5,s10,a4
ffffffffc0203a66:	00093717          	auipc	a4,0x93
ffffffffc0203a6a:	e5270713          	addi	a4,a4,-430 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0203a6e:	6308                	ld	a0,0(a4)
ffffffffc0203a70:	8799                	srai	a5,a5,0x6
ffffffffc0203a72:	97ae                	add	a5,a5,a1
ffffffffc0203a74:	0167f733          	and	a4,a5,s6
ffffffffc0203a78:	00a685b3          	add	a1,a3,a0
ffffffffc0203a7c:	07b2                	slli	a5,a5,0xc
ffffffffc0203a7e:	06c77563          	bgeu	a4,a2,ffffffffc0203ae8 <copy_range+0x196>
ffffffffc0203a82:	6605                	lui	a2,0x1
ffffffffc0203a84:	953e                	add	a0,a0,a5
ffffffffc0203a86:	627070ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc0203a8a:	86a6                	mv	a3,s1
ffffffffc0203a8c:	8622                	mv	a2,s0
ffffffffc0203a8e:	85ea                	mv	a1,s10
ffffffffc0203a90:	8556                	mv	a0,s5
ffffffffc0203a92:	fd9fe0ef          	jal	ra,ffffffffc0202a6a <page_insert>
ffffffffc0203a96:	d915                	beqz	a0,ffffffffc02039ca <copy_range+0x78>
ffffffffc0203a98:	00009697          	auipc	a3,0x9
ffffffffc0203a9c:	5c068693          	addi	a3,a3,1472 # ffffffffc020d058 <default_pmm_manager+0x7f8>
ffffffffc0203aa0:	00008617          	auipc	a2,0x8
ffffffffc0203aa4:	2a060613          	addi	a2,a2,672 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203aa8:	1ec00593          	li	a1,492
ffffffffc0203aac:	00009517          	auipc	a0,0x9
ffffffffc0203ab0:	f0450513          	addi	a0,a0,-252 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203ab4:	9ebfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ab8:	00200637          	lui	a2,0x200
ffffffffc0203abc:	9432                	add	s0,s0,a2
ffffffffc0203abe:	ffe00637          	lui	a2,0xffe00
ffffffffc0203ac2:	8c71                	and	s0,s0,a2
ffffffffc0203ac4:	f00406e3          	beqz	s0,ffffffffc02039d0 <copy_range+0x7e>
ffffffffc0203ac8:	ef2466e3          	bltu	s0,s2,ffffffffc02039b4 <copy_range+0x62>
ffffffffc0203acc:	b711                	j	ffffffffc02039d0 <copy_range+0x7e>
ffffffffc0203ace:	9a4fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203ad2:	000cb703          	ld	a4,0(s9)
ffffffffc0203ad6:	4505                	li	a0,1
ffffffffc0203ad8:	6f18                	ld	a4,24(a4)
ffffffffc0203ada:	9702                	jalr	a4
ffffffffc0203adc:	8d2a                	mv	s10,a0
ffffffffc0203ade:	98efd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203ae2:	bfa9                	j	ffffffffc0203a3c <copy_range+0xea>
ffffffffc0203ae4:	5571                	li	a0,-4
ffffffffc0203ae6:	b5f5                	j	ffffffffc02039d2 <copy_range+0x80>
ffffffffc0203ae8:	86be                	mv	a3,a5
ffffffffc0203aea:	00009617          	auipc	a2,0x9
ffffffffc0203aee:	dae60613          	addi	a2,a2,-594 # ffffffffc020c898 <default_pmm_manager+0x38>
ffffffffc0203af2:	07100593          	li	a1,113
ffffffffc0203af6:	00009517          	auipc	a0,0x9
ffffffffc0203afa:	dca50513          	addi	a0,a0,-566 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc0203afe:	9a1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b02:	00009697          	auipc	a3,0x9
ffffffffc0203b06:	53668693          	addi	a3,a3,1334 # ffffffffc020d038 <default_pmm_manager+0x7d8>
ffffffffc0203b0a:	00008617          	auipc	a2,0x8
ffffffffc0203b0e:	23660613          	addi	a2,a2,566 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203b12:	1ce00593          	li	a1,462
ffffffffc0203b16:	00009517          	auipc	a0,0x9
ffffffffc0203b1a:	e9a50513          	addi	a0,a0,-358 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203b1e:	981fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b22:	00009697          	auipc	a3,0x9
ffffffffc0203b26:	ef668693          	addi	a3,a3,-266 # ffffffffc020ca18 <default_pmm_manager+0x1b8>
ffffffffc0203b2a:	00008617          	auipc	a2,0x8
ffffffffc0203b2e:	21660613          	addi	a2,a2,534 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203b32:	1b600593          	li	a1,438
ffffffffc0203b36:	00009517          	auipc	a0,0x9
ffffffffc0203b3a:	e7a50513          	addi	a0,a0,-390 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203b3e:	961fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b42:	00009697          	auipc	a3,0x9
ffffffffc0203b46:	50668693          	addi	a3,a3,1286 # ffffffffc020d048 <default_pmm_manager+0x7e8>
ffffffffc0203b4a:	00008617          	auipc	a2,0x8
ffffffffc0203b4e:	1f660613          	addi	a2,a2,502 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203b52:	1cf00593          	li	a1,463
ffffffffc0203b56:	00009517          	auipc	a0,0x9
ffffffffc0203b5a:	e5a50513          	addi	a0,a0,-422 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203b5e:	941fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b62:	00009617          	auipc	a2,0x9
ffffffffc0203b66:	e0660613          	addi	a2,a2,-506 # ffffffffc020c968 <default_pmm_manager+0x108>
ffffffffc0203b6a:	06900593          	li	a1,105
ffffffffc0203b6e:	00009517          	auipc	a0,0x9
ffffffffc0203b72:	d5250513          	addi	a0,a0,-686 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc0203b76:	929fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b7a:	00009617          	auipc	a2,0x9
ffffffffc0203b7e:	e0e60613          	addi	a2,a2,-498 # ffffffffc020c988 <default_pmm_manager+0x128>
ffffffffc0203b82:	07f00593          	li	a1,127
ffffffffc0203b86:	00009517          	auipc	a0,0x9
ffffffffc0203b8a:	d3a50513          	addi	a0,a0,-710 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc0203b8e:	911fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b92:	00009697          	auipc	a3,0x9
ffffffffc0203b96:	e5668693          	addi	a3,a3,-426 # ffffffffc020c9e8 <default_pmm_manager+0x188>
ffffffffc0203b9a:	00008617          	auipc	a2,0x8
ffffffffc0203b9e:	1a660613          	addi	a2,a2,422 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203ba2:	1b500593          	li	a1,437
ffffffffc0203ba6:	00009517          	auipc	a0,0x9
ffffffffc0203baa:	e0a50513          	addi	a0,a0,-502 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203bae:	8f1fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203bb2 <pgdir_alloc_page>:
ffffffffc0203bb2:	7179                	addi	sp,sp,-48
ffffffffc0203bb4:	ec26                	sd	s1,24(sp)
ffffffffc0203bb6:	e84a                	sd	s2,16(sp)
ffffffffc0203bb8:	e052                	sd	s4,0(sp)
ffffffffc0203bba:	f406                	sd	ra,40(sp)
ffffffffc0203bbc:	f022                	sd	s0,32(sp)
ffffffffc0203bbe:	e44e                	sd	s3,8(sp)
ffffffffc0203bc0:	8a2a                	mv	s4,a0
ffffffffc0203bc2:	84ae                	mv	s1,a1
ffffffffc0203bc4:	8932                	mv	s2,a2
ffffffffc0203bc6:	100027f3          	csrr	a5,sstatus
ffffffffc0203bca:	8b89                	andi	a5,a5,2
ffffffffc0203bcc:	00093997          	auipc	s3,0x93
ffffffffc0203bd0:	ce498993          	addi	s3,s3,-796 # ffffffffc02968b0 <pmm_manager>
ffffffffc0203bd4:	ef8d                	bnez	a5,ffffffffc0203c0e <pgdir_alloc_page+0x5c>
ffffffffc0203bd6:	0009b783          	ld	a5,0(s3)
ffffffffc0203bda:	4505                	li	a0,1
ffffffffc0203bdc:	6f9c                	ld	a5,24(a5)
ffffffffc0203bde:	9782                	jalr	a5
ffffffffc0203be0:	842a                	mv	s0,a0
ffffffffc0203be2:	cc09                	beqz	s0,ffffffffc0203bfc <pgdir_alloc_page+0x4a>
ffffffffc0203be4:	86ca                	mv	a3,s2
ffffffffc0203be6:	8626                	mv	a2,s1
ffffffffc0203be8:	85a2                	mv	a1,s0
ffffffffc0203bea:	8552                	mv	a0,s4
ffffffffc0203bec:	e7ffe0ef          	jal	ra,ffffffffc0202a6a <page_insert>
ffffffffc0203bf0:	e915                	bnez	a0,ffffffffc0203c24 <pgdir_alloc_page+0x72>
ffffffffc0203bf2:	4018                	lw	a4,0(s0)
ffffffffc0203bf4:	fc04                	sd	s1,56(s0)
ffffffffc0203bf6:	4785                	li	a5,1
ffffffffc0203bf8:	04f71e63          	bne	a4,a5,ffffffffc0203c54 <pgdir_alloc_page+0xa2>
ffffffffc0203bfc:	70a2                	ld	ra,40(sp)
ffffffffc0203bfe:	8522                	mv	a0,s0
ffffffffc0203c00:	7402                	ld	s0,32(sp)
ffffffffc0203c02:	64e2                	ld	s1,24(sp)
ffffffffc0203c04:	6942                	ld	s2,16(sp)
ffffffffc0203c06:	69a2                	ld	s3,8(sp)
ffffffffc0203c08:	6a02                	ld	s4,0(sp)
ffffffffc0203c0a:	6145                	addi	sp,sp,48
ffffffffc0203c0c:	8082                	ret
ffffffffc0203c0e:	864fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203c12:	0009b783          	ld	a5,0(s3)
ffffffffc0203c16:	4505                	li	a0,1
ffffffffc0203c18:	6f9c                	ld	a5,24(a5)
ffffffffc0203c1a:	9782                	jalr	a5
ffffffffc0203c1c:	842a                	mv	s0,a0
ffffffffc0203c1e:	84efd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203c22:	b7c1                	j	ffffffffc0203be2 <pgdir_alloc_page+0x30>
ffffffffc0203c24:	100027f3          	csrr	a5,sstatus
ffffffffc0203c28:	8b89                	andi	a5,a5,2
ffffffffc0203c2a:	eb89                	bnez	a5,ffffffffc0203c3c <pgdir_alloc_page+0x8a>
ffffffffc0203c2c:	0009b783          	ld	a5,0(s3)
ffffffffc0203c30:	8522                	mv	a0,s0
ffffffffc0203c32:	4585                	li	a1,1
ffffffffc0203c34:	739c                	ld	a5,32(a5)
ffffffffc0203c36:	4401                	li	s0,0
ffffffffc0203c38:	9782                	jalr	a5
ffffffffc0203c3a:	b7c9                	j	ffffffffc0203bfc <pgdir_alloc_page+0x4a>
ffffffffc0203c3c:	836fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203c40:	0009b783          	ld	a5,0(s3)
ffffffffc0203c44:	8522                	mv	a0,s0
ffffffffc0203c46:	4585                	li	a1,1
ffffffffc0203c48:	739c                	ld	a5,32(a5)
ffffffffc0203c4a:	4401                	li	s0,0
ffffffffc0203c4c:	9782                	jalr	a5
ffffffffc0203c4e:	81efd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203c52:	b76d                	j	ffffffffc0203bfc <pgdir_alloc_page+0x4a>
ffffffffc0203c54:	00009697          	auipc	a3,0x9
ffffffffc0203c58:	41468693          	addi	a3,a3,1044 # ffffffffc020d068 <default_pmm_manager+0x808>
ffffffffc0203c5c:	00008617          	auipc	a2,0x8
ffffffffc0203c60:	0e460613          	addi	a2,a2,228 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203c64:	23500593          	li	a1,565
ffffffffc0203c68:	00009517          	auipc	a0,0x9
ffffffffc0203c6c:	d4850513          	addi	a0,a0,-696 # ffffffffc020c9b0 <default_pmm_manager+0x150>
ffffffffc0203c70:	82ffc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203c74 <check_vma_overlap.part.0>:
ffffffffc0203c74:	1141                	addi	sp,sp,-16
ffffffffc0203c76:	00009697          	auipc	a3,0x9
ffffffffc0203c7a:	40a68693          	addi	a3,a3,1034 # ffffffffc020d080 <default_pmm_manager+0x820>
ffffffffc0203c7e:	00008617          	auipc	a2,0x8
ffffffffc0203c82:	0c260613          	addi	a2,a2,194 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203c86:	07400593          	li	a1,116
ffffffffc0203c8a:	00009517          	auipc	a0,0x9
ffffffffc0203c8e:	41650513          	addi	a0,a0,1046 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc0203c92:	e406                	sd	ra,8(sp)
ffffffffc0203c94:	80bfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203c98 <mm_create>:
ffffffffc0203c98:	1141                	addi	sp,sp,-16
ffffffffc0203c9a:	05800513          	li	a0,88
ffffffffc0203c9e:	e022                	sd	s0,0(sp)
ffffffffc0203ca0:	e406                	sd	ra,8(sp)
ffffffffc0203ca2:	b7cfe0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0203ca6:	842a                	mv	s0,a0
ffffffffc0203ca8:	c115                	beqz	a0,ffffffffc0203ccc <mm_create+0x34>
ffffffffc0203caa:	e408                	sd	a0,8(s0)
ffffffffc0203cac:	e008                	sd	a0,0(s0)
ffffffffc0203cae:	00053823          	sd	zero,16(a0)
ffffffffc0203cb2:	00053c23          	sd	zero,24(a0)
ffffffffc0203cb6:	02052023          	sw	zero,32(a0)
ffffffffc0203cba:	02053423          	sd	zero,40(a0)
ffffffffc0203cbe:	02052823          	sw	zero,48(a0)
ffffffffc0203cc2:	4585                	li	a1,1
ffffffffc0203cc4:	03850513          	addi	a0,a0,56
ffffffffc0203cc8:	233000ef          	jal	ra,ffffffffc02046fa <sem_init>
ffffffffc0203ccc:	60a2                	ld	ra,8(sp)
ffffffffc0203cce:	8522                	mv	a0,s0
ffffffffc0203cd0:	6402                	ld	s0,0(sp)
ffffffffc0203cd2:	0141                	addi	sp,sp,16
ffffffffc0203cd4:	8082                	ret

ffffffffc0203cd6 <find_vma>:
ffffffffc0203cd6:	86aa                	mv	a3,a0
ffffffffc0203cd8:	c505                	beqz	a0,ffffffffc0203d00 <find_vma+0x2a>
ffffffffc0203cda:	6908                	ld	a0,16(a0)
ffffffffc0203cdc:	c501                	beqz	a0,ffffffffc0203ce4 <find_vma+0xe>
ffffffffc0203cde:	651c                	ld	a5,8(a0)
ffffffffc0203ce0:	02f5f263          	bgeu	a1,a5,ffffffffc0203d04 <find_vma+0x2e>
ffffffffc0203ce4:	669c                	ld	a5,8(a3)
ffffffffc0203ce6:	00f68d63          	beq	a3,a5,ffffffffc0203d00 <find_vma+0x2a>
ffffffffc0203cea:	fe87b703          	ld	a4,-24(a5) # 1fffe8 <_binary_bin_sfs_img_size+0x18ace8>
ffffffffc0203cee:	00e5e663          	bltu	a1,a4,ffffffffc0203cfa <find_vma+0x24>
ffffffffc0203cf2:	ff07b703          	ld	a4,-16(a5)
ffffffffc0203cf6:	00e5ec63          	bltu	a1,a4,ffffffffc0203d0e <find_vma+0x38>
ffffffffc0203cfa:	679c                	ld	a5,8(a5)
ffffffffc0203cfc:	fef697e3          	bne	a3,a5,ffffffffc0203cea <find_vma+0x14>
ffffffffc0203d00:	4501                	li	a0,0
ffffffffc0203d02:	8082                	ret
ffffffffc0203d04:	691c                	ld	a5,16(a0)
ffffffffc0203d06:	fcf5ffe3          	bgeu	a1,a5,ffffffffc0203ce4 <find_vma+0xe>
ffffffffc0203d0a:	ea88                	sd	a0,16(a3)
ffffffffc0203d0c:	8082                	ret
ffffffffc0203d0e:	fe078513          	addi	a0,a5,-32
ffffffffc0203d12:	ea88                	sd	a0,16(a3)
ffffffffc0203d14:	8082                	ret

ffffffffc0203d16 <insert_vma_struct>:
ffffffffc0203d16:	6590                	ld	a2,8(a1)
ffffffffc0203d18:	0105b803          	ld	a6,16(a1) # 80010 <_binary_bin_sfs_img_size+0xad10>
ffffffffc0203d1c:	1141                	addi	sp,sp,-16
ffffffffc0203d1e:	e406                	sd	ra,8(sp)
ffffffffc0203d20:	87aa                	mv	a5,a0
ffffffffc0203d22:	01066763          	bltu	a2,a6,ffffffffc0203d30 <insert_vma_struct+0x1a>
ffffffffc0203d26:	a085                	j	ffffffffc0203d86 <insert_vma_struct+0x70>
ffffffffc0203d28:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203d2c:	04e66863          	bltu	a2,a4,ffffffffc0203d7c <insert_vma_struct+0x66>
ffffffffc0203d30:	86be                	mv	a3,a5
ffffffffc0203d32:	679c                	ld	a5,8(a5)
ffffffffc0203d34:	fef51ae3          	bne	a0,a5,ffffffffc0203d28 <insert_vma_struct+0x12>
ffffffffc0203d38:	02a68463          	beq	a3,a0,ffffffffc0203d60 <insert_vma_struct+0x4a>
ffffffffc0203d3c:	ff06b703          	ld	a4,-16(a3)
ffffffffc0203d40:	fe86b883          	ld	a7,-24(a3)
ffffffffc0203d44:	08e8f163          	bgeu	a7,a4,ffffffffc0203dc6 <insert_vma_struct+0xb0>
ffffffffc0203d48:	04e66f63          	bltu	a2,a4,ffffffffc0203da6 <insert_vma_struct+0x90>
ffffffffc0203d4c:	00f50a63          	beq	a0,a5,ffffffffc0203d60 <insert_vma_struct+0x4a>
ffffffffc0203d50:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203d54:	05076963          	bltu	a4,a6,ffffffffc0203da6 <insert_vma_struct+0x90>
ffffffffc0203d58:	ff07b603          	ld	a2,-16(a5)
ffffffffc0203d5c:	02c77363          	bgeu	a4,a2,ffffffffc0203d82 <insert_vma_struct+0x6c>
ffffffffc0203d60:	5118                	lw	a4,32(a0)
ffffffffc0203d62:	e188                	sd	a0,0(a1)
ffffffffc0203d64:	02058613          	addi	a2,a1,32
ffffffffc0203d68:	e390                	sd	a2,0(a5)
ffffffffc0203d6a:	e690                	sd	a2,8(a3)
ffffffffc0203d6c:	60a2                	ld	ra,8(sp)
ffffffffc0203d6e:	f59c                	sd	a5,40(a1)
ffffffffc0203d70:	f194                	sd	a3,32(a1)
ffffffffc0203d72:	0017079b          	addiw	a5,a4,1
ffffffffc0203d76:	d11c                	sw	a5,32(a0)
ffffffffc0203d78:	0141                	addi	sp,sp,16
ffffffffc0203d7a:	8082                	ret
ffffffffc0203d7c:	fca690e3          	bne	a3,a0,ffffffffc0203d3c <insert_vma_struct+0x26>
ffffffffc0203d80:	bfd1                	j	ffffffffc0203d54 <insert_vma_struct+0x3e>
ffffffffc0203d82:	ef3ff0ef          	jal	ra,ffffffffc0203c74 <check_vma_overlap.part.0>
ffffffffc0203d86:	00009697          	auipc	a3,0x9
ffffffffc0203d8a:	32a68693          	addi	a3,a3,810 # ffffffffc020d0b0 <default_pmm_manager+0x850>
ffffffffc0203d8e:	00008617          	auipc	a2,0x8
ffffffffc0203d92:	fb260613          	addi	a2,a2,-78 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203d96:	07a00593          	li	a1,122
ffffffffc0203d9a:	00009517          	auipc	a0,0x9
ffffffffc0203d9e:	30650513          	addi	a0,a0,774 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc0203da2:	efcfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203da6:	00009697          	auipc	a3,0x9
ffffffffc0203daa:	34a68693          	addi	a3,a3,842 # ffffffffc020d0f0 <default_pmm_manager+0x890>
ffffffffc0203dae:	00008617          	auipc	a2,0x8
ffffffffc0203db2:	f9260613          	addi	a2,a2,-110 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203db6:	07300593          	li	a1,115
ffffffffc0203dba:	00009517          	auipc	a0,0x9
ffffffffc0203dbe:	2e650513          	addi	a0,a0,742 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc0203dc2:	edcfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203dc6:	00009697          	auipc	a3,0x9
ffffffffc0203dca:	30a68693          	addi	a3,a3,778 # ffffffffc020d0d0 <default_pmm_manager+0x870>
ffffffffc0203dce:	00008617          	auipc	a2,0x8
ffffffffc0203dd2:	f7260613          	addi	a2,a2,-142 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203dd6:	07200593          	li	a1,114
ffffffffc0203dda:	00009517          	auipc	a0,0x9
ffffffffc0203dde:	2c650513          	addi	a0,a0,710 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc0203de2:	ebcfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203de6 <mm_destroy>:
ffffffffc0203de6:	591c                	lw	a5,48(a0)
ffffffffc0203de8:	1141                	addi	sp,sp,-16
ffffffffc0203dea:	e406                	sd	ra,8(sp)
ffffffffc0203dec:	e022                	sd	s0,0(sp)
ffffffffc0203dee:	e78d                	bnez	a5,ffffffffc0203e18 <mm_destroy+0x32>
ffffffffc0203df0:	842a                	mv	s0,a0
ffffffffc0203df2:	6508                	ld	a0,8(a0)
ffffffffc0203df4:	00a40c63          	beq	s0,a0,ffffffffc0203e0c <mm_destroy+0x26>
ffffffffc0203df8:	6118                	ld	a4,0(a0)
ffffffffc0203dfa:	651c                	ld	a5,8(a0)
ffffffffc0203dfc:	1501                	addi	a0,a0,-32
ffffffffc0203dfe:	e71c                	sd	a5,8(a4)
ffffffffc0203e00:	e398                	sd	a4,0(a5)
ffffffffc0203e02:	accfe0ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0203e06:	6408                	ld	a0,8(s0)
ffffffffc0203e08:	fea418e3          	bne	s0,a0,ffffffffc0203df8 <mm_destroy+0x12>
ffffffffc0203e0c:	8522                	mv	a0,s0
ffffffffc0203e0e:	6402                	ld	s0,0(sp)
ffffffffc0203e10:	60a2                	ld	ra,8(sp)
ffffffffc0203e12:	0141                	addi	sp,sp,16
ffffffffc0203e14:	abafe06f          	j	ffffffffc02020ce <kfree>
ffffffffc0203e18:	00009697          	auipc	a3,0x9
ffffffffc0203e1c:	2f868693          	addi	a3,a3,760 # ffffffffc020d110 <default_pmm_manager+0x8b0>
ffffffffc0203e20:	00008617          	auipc	a2,0x8
ffffffffc0203e24:	f2060613          	addi	a2,a2,-224 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203e28:	09e00593          	li	a1,158
ffffffffc0203e2c:	00009517          	auipc	a0,0x9
ffffffffc0203e30:	27450513          	addi	a0,a0,628 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc0203e34:	e6afc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203e38 <mm_map>:
ffffffffc0203e38:	7139                	addi	sp,sp,-64
ffffffffc0203e3a:	f822                	sd	s0,48(sp)
ffffffffc0203e3c:	6405                	lui	s0,0x1
ffffffffc0203e3e:	147d                	addi	s0,s0,-1
ffffffffc0203e40:	77fd                	lui	a5,0xfffff
ffffffffc0203e42:	9622                	add	a2,a2,s0
ffffffffc0203e44:	962e                	add	a2,a2,a1
ffffffffc0203e46:	f426                	sd	s1,40(sp)
ffffffffc0203e48:	fc06                	sd	ra,56(sp)
ffffffffc0203e4a:	00f5f4b3          	and	s1,a1,a5
ffffffffc0203e4e:	f04a                	sd	s2,32(sp)
ffffffffc0203e50:	ec4e                	sd	s3,24(sp)
ffffffffc0203e52:	e852                	sd	s4,16(sp)
ffffffffc0203e54:	e456                	sd	s5,8(sp)
ffffffffc0203e56:	002005b7          	lui	a1,0x200
ffffffffc0203e5a:	00f67433          	and	s0,a2,a5
ffffffffc0203e5e:	06b4e363          	bltu	s1,a1,ffffffffc0203ec4 <mm_map+0x8c>
ffffffffc0203e62:	0684f163          	bgeu	s1,s0,ffffffffc0203ec4 <mm_map+0x8c>
ffffffffc0203e66:	4785                	li	a5,1
ffffffffc0203e68:	07fe                	slli	a5,a5,0x1f
ffffffffc0203e6a:	0487ed63          	bltu	a5,s0,ffffffffc0203ec4 <mm_map+0x8c>
ffffffffc0203e6e:	89aa                	mv	s3,a0
ffffffffc0203e70:	cd21                	beqz	a0,ffffffffc0203ec8 <mm_map+0x90>
ffffffffc0203e72:	85a6                	mv	a1,s1
ffffffffc0203e74:	8ab6                	mv	s5,a3
ffffffffc0203e76:	8a3a                	mv	s4,a4
ffffffffc0203e78:	e5fff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0203e7c:	c501                	beqz	a0,ffffffffc0203e84 <mm_map+0x4c>
ffffffffc0203e7e:	651c                	ld	a5,8(a0)
ffffffffc0203e80:	0487e263          	bltu	a5,s0,ffffffffc0203ec4 <mm_map+0x8c>
ffffffffc0203e84:	03000513          	li	a0,48
ffffffffc0203e88:	996fe0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0203e8c:	892a                	mv	s2,a0
ffffffffc0203e8e:	5571                	li	a0,-4
ffffffffc0203e90:	02090163          	beqz	s2,ffffffffc0203eb2 <mm_map+0x7a>
ffffffffc0203e94:	854e                	mv	a0,s3
ffffffffc0203e96:	00993423          	sd	s1,8(s2)
ffffffffc0203e9a:	00893823          	sd	s0,16(s2)
ffffffffc0203e9e:	01592c23          	sw	s5,24(s2)
ffffffffc0203ea2:	85ca                	mv	a1,s2
ffffffffc0203ea4:	e73ff0ef          	jal	ra,ffffffffc0203d16 <insert_vma_struct>
ffffffffc0203ea8:	4501                	li	a0,0
ffffffffc0203eaa:	000a0463          	beqz	s4,ffffffffc0203eb2 <mm_map+0x7a>
ffffffffc0203eae:	012a3023          	sd	s2,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0203eb2:	70e2                	ld	ra,56(sp)
ffffffffc0203eb4:	7442                	ld	s0,48(sp)
ffffffffc0203eb6:	74a2                	ld	s1,40(sp)
ffffffffc0203eb8:	7902                	ld	s2,32(sp)
ffffffffc0203eba:	69e2                	ld	s3,24(sp)
ffffffffc0203ebc:	6a42                	ld	s4,16(sp)
ffffffffc0203ebe:	6aa2                	ld	s5,8(sp)
ffffffffc0203ec0:	6121                	addi	sp,sp,64
ffffffffc0203ec2:	8082                	ret
ffffffffc0203ec4:	5575                	li	a0,-3
ffffffffc0203ec6:	b7f5                	j	ffffffffc0203eb2 <mm_map+0x7a>
ffffffffc0203ec8:	00009697          	auipc	a3,0x9
ffffffffc0203ecc:	26068693          	addi	a3,a3,608 # ffffffffc020d128 <default_pmm_manager+0x8c8>
ffffffffc0203ed0:	00008617          	auipc	a2,0x8
ffffffffc0203ed4:	e7060613          	addi	a2,a2,-400 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203ed8:	0b300593          	li	a1,179
ffffffffc0203edc:	00009517          	auipc	a0,0x9
ffffffffc0203ee0:	1c450513          	addi	a0,a0,452 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc0203ee4:	dbafc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203ee8 <dup_mmap>:
ffffffffc0203ee8:	7139                	addi	sp,sp,-64
ffffffffc0203eea:	fc06                	sd	ra,56(sp)
ffffffffc0203eec:	f822                	sd	s0,48(sp)
ffffffffc0203eee:	f426                	sd	s1,40(sp)
ffffffffc0203ef0:	f04a                	sd	s2,32(sp)
ffffffffc0203ef2:	ec4e                	sd	s3,24(sp)
ffffffffc0203ef4:	e852                	sd	s4,16(sp)
ffffffffc0203ef6:	e456                	sd	s5,8(sp)
ffffffffc0203ef8:	c52d                	beqz	a0,ffffffffc0203f62 <dup_mmap+0x7a>
ffffffffc0203efa:	892a                	mv	s2,a0
ffffffffc0203efc:	84ae                	mv	s1,a1
ffffffffc0203efe:	842e                	mv	s0,a1
ffffffffc0203f00:	e595                	bnez	a1,ffffffffc0203f2c <dup_mmap+0x44>
ffffffffc0203f02:	a085                	j	ffffffffc0203f62 <dup_mmap+0x7a>
ffffffffc0203f04:	854a                	mv	a0,s2
ffffffffc0203f06:	0155b423          	sd	s5,8(a1) # 200008 <_binary_bin_sfs_img_size+0x18ad08>
ffffffffc0203f0a:	0145b823          	sd	s4,16(a1)
ffffffffc0203f0e:	0135ac23          	sw	s3,24(a1)
ffffffffc0203f12:	e05ff0ef          	jal	ra,ffffffffc0203d16 <insert_vma_struct>
ffffffffc0203f16:	ff043683          	ld	a3,-16(s0) # ff0 <_binary_bin_swap_img_size-0x6d10>
ffffffffc0203f1a:	fe843603          	ld	a2,-24(s0)
ffffffffc0203f1e:	6c8c                	ld	a1,24(s1)
ffffffffc0203f20:	01893503          	ld	a0,24(s2)
ffffffffc0203f24:	4701                	li	a4,0
ffffffffc0203f26:	a2dff0ef          	jal	ra,ffffffffc0203952 <copy_range>
ffffffffc0203f2a:	e105                	bnez	a0,ffffffffc0203f4a <dup_mmap+0x62>
ffffffffc0203f2c:	6000                	ld	s0,0(s0)
ffffffffc0203f2e:	02848863          	beq	s1,s0,ffffffffc0203f5e <dup_mmap+0x76>
ffffffffc0203f32:	03000513          	li	a0,48
ffffffffc0203f36:	fe843a83          	ld	s5,-24(s0)
ffffffffc0203f3a:	ff043a03          	ld	s4,-16(s0)
ffffffffc0203f3e:	ff842983          	lw	s3,-8(s0)
ffffffffc0203f42:	8dcfe0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0203f46:	85aa                	mv	a1,a0
ffffffffc0203f48:	fd55                	bnez	a0,ffffffffc0203f04 <dup_mmap+0x1c>
ffffffffc0203f4a:	5571                	li	a0,-4
ffffffffc0203f4c:	70e2                	ld	ra,56(sp)
ffffffffc0203f4e:	7442                	ld	s0,48(sp)
ffffffffc0203f50:	74a2                	ld	s1,40(sp)
ffffffffc0203f52:	7902                	ld	s2,32(sp)
ffffffffc0203f54:	69e2                	ld	s3,24(sp)
ffffffffc0203f56:	6a42                	ld	s4,16(sp)
ffffffffc0203f58:	6aa2                	ld	s5,8(sp)
ffffffffc0203f5a:	6121                	addi	sp,sp,64
ffffffffc0203f5c:	8082                	ret
ffffffffc0203f5e:	4501                	li	a0,0
ffffffffc0203f60:	b7f5                	j	ffffffffc0203f4c <dup_mmap+0x64>
ffffffffc0203f62:	00009697          	auipc	a3,0x9
ffffffffc0203f66:	1d668693          	addi	a3,a3,470 # ffffffffc020d138 <default_pmm_manager+0x8d8>
ffffffffc0203f6a:	00008617          	auipc	a2,0x8
ffffffffc0203f6e:	dd660613          	addi	a2,a2,-554 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203f72:	0cf00593          	li	a1,207
ffffffffc0203f76:	00009517          	auipc	a0,0x9
ffffffffc0203f7a:	12a50513          	addi	a0,a0,298 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc0203f7e:	d20fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203f82 <exit_mmap>:
ffffffffc0203f82:	1101                	addi	sp,sp,-32
ffffffffc0203f84:	ec06                	sd	ra,24(sp)
ffffffffc0203f86:	e822                	sd	s0,16(sp)
ffffffffc0203f88:	e426                	sd	s1,8(sp)
ffffffffc0203f8a:	e04a                	sd	s2,0(sp)
ffffffffc0203f8c:	c531                	beqz	a0,ffffffffc0203fd8 <exit_mmap+0x56>
ffffffffc0203f8e:	591c                	lw	a5,48(a0)
ffffffffc0203f90:	84aa                	mv	s1,a0
ffffffffc0203f92:	e3b9                	bnez	a5,ffffffffc0203fd8 <exit_mmap+0x56>
ffffffffc0203f94:	6500                	ld	s0,8(a0)
ffffffffc0203f96:	01853903          	ld	s2,24(a0)
ffffffffc0203f9a:	02850663          	beq	a0,s0,ffffffffc0203fc6 <exit_mmap+0x44>
ffffffffc0203f9e:	ff043603          	ld	a2,-16(s0)
ffffffffc0203fa2:	fe843583          	ld	a1,-24(s0)
ffffffffc0203fa6:	854a                	mv	a0,s2
ffffffffc0203fa8:	e4efe0ef          	jal	ra,ffffffffc02025f6 <unmap_range>
ffffffffc0203fac:	6400                	ld	s0,8(s0)
ffffffffc0203fae:	fe8498e3          	bne	s1,s0,ffffffffc0203f9e <exit_mmap+0x1c>
ffffffffc0203fb2:	6400                	ld	s0,8(s0)
ffffffffc0203fb4:	00848c63          	beq	s1,s0,ffffffffc0203fcc <exit_mmap+0x4a>
ffffffffc0203fb8:	ff043603          	ld	a2,-16(s0)
ffffffffc0203fbc:	fe843583          	ld	a1,-24(s0)
ffffffffc0203fc0:	854a                	mv	a0,s2
ffffffffc0203fc2:	f7afe0ef          	jal	ra,ffffffffc020273c <exit_range>
ffffffffc0203fc6:	6400                	ld	s0,8(s0)
ffffffffc0203fc8:	fe8498e3          	bne	s1,s0,ffffffffc0203fb8 <exit_mmap+0x36>
ffffffffc0203fcc:	60e2                	ld	ra,24(sp)
ffffffffc0203fce:	6442                	ld	s0,16(sp)
ffffffffc0203fd0:	64a2                	ld	s1,8(sp)
ffffffffc0203fd2:	6902                	ld	s2,0(sp)
ffffffffc0203fd4:	6105                	addi	sp,sp,32
ffffffffc0203fd6:	8082                	ret
ffffffffc0203fd8:	00009697          	auipc	a3,0x9
ffffffffc0203fdc:	18068693          	addi	a3,a3,384 # ffffffffc020d158 <default_pmm_manager+0x8f8>
ffffffffc0203fe0:	00008617          	auipc	a2,0x8
ffffffffc0203fe4:	d6060613          	addi	a2,a2,-672 # ffffffffc020bd40 <commands+0x210>
ffffffffc0203fe8:	0e800593          	li	a1,232
ffffffffc0203fec:	00009517          	auipc	a0,0x9
ffffffffc0203ff0:	0b450513          	addi	a0,a0,180 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc0203ff4:	caafc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203ff8 <do_pgfault>:
ffffffffc0203ff8:	7179                	addi	sp,sp,-48
ffffffffc0203ffa:	f406                	sd	ra,40(sp)
ffffffffc0203ffc:	f022                	sd	s0,32(sp)
ffffffffc0203ffe:	ec26                	sd	s1,24(sp)
ffffffffc0204000:	e84a                	sd	s2,16(sp)
ffffffffc0204002:	e44e                	sd	s3,8(sp)
ffffffffc0204004:	c16d                	beqz	a0,ffffffffc02040e6 <do_pgfault+0xee>
ffffffffc0204006:	85b2                	mv	a1,a2
ffffffffc0204008:	84aa                	mv	s1,a0
ffffffffc020400a:	8432                	mv	s0,a2
ffffffffc020400c:	ccbff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0204010:	892a                	mv	s2,a0
ffffffffc0204012:	c971                	beqz	a0,ffffffffc02040e6 <do_pgfault+0xee>
ffffffffc0204014:	651c                	ld	a5,8(a0)
ffffffffc0204016:	0cf46863          	bltu	s0,a5,ffffffffc02040e6 <do_pgfault+0xee>
ffffffffc020401a:	75fd                	lui	a1,0xfffff
ffffffffc020401c:	6c88                	ld	a0,24(s1)
ffffffffc020401e:	8c6d                	and	s0,s0,a1
ffffffffc0204020:	4605                	li	a2,1
ffffffffc0204022:	85a2                	mv	a1,s0
ffffffffc0204024:	a90fe0ef          	jal	ra,ffffffffc02022b4 <get_pte>
ffffffffc0204028:	c169                	beqz	a0,ffffffffc02040ea <do_pgfault+0xf2>
ffffffffc020402a:	611c                	ld	a5,0(a0)
ffffffffc020402c:	8b85                	andi	a5,a5,1
ffffffffc020402e:	e7d9                	bnez	a5,ffffffffc02040bc <do_pgfault+0xc4>
ffffffffc0204030:	01892783          	lw	a5,24(s2)
ffffffffc0204034:	49c5                	li	s3,17
ffffffffc0204036:	0017f713          	andi	a4,a5,1
ffffffffc020403a:	c311                	beqz	a4,ffffffffc020403e <do_pgfault+0x46>
ffffffffc020403c:	49cd                	li	s3,19
ffffffffc020403e:	0027f713          	andi	a4,a5,2
ffffffffc0204042:	c311                	beqz	a4,ffffffffc0204046 <do_pgfault+0x4e>
ffffffffc0204044:	49dd                	li	s3,23
ffffffffc0204046:	8b91                	andi	a5,a5,4
ffffffffc0204048:	e7bd                	bnez	a5,ffffffffc02040b6 <do_pgfault+0xbe>
ffffffffc020404a:	4505                	li	a0,1
ffffffffc020404c:	9b0fe0ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc0204050:	892a                	mv	s2,a0
ffffffffc0204052:	cd41                	beqz	a0,ffffffffc02040ea <do_pgfault+0xf2>
ffffffffc0204054:	00093797          	auipc	a5,0x93
ffffffffc0204058:	8547b783          	ld	a5,-1964(a5) # ffffffffc02968a8 <pages>
ffffffffc020405c:	40f507b3          	sub	a5,a0,a5
ffffffffc0204060:	8799                	srai	a5,a5,0x6
ffffffffc0204062:	0000c517          	auipc	a0,0xc
ffffffffc0204066:	cc653503          	ld	a0,-826(a0) # ffffffffc020fd28 <nbase>
ffffffffc020406a:	97aa                	add	a5,a5,a0
ffffffffc020406c:	00c79713          	slli	a4,a5,0xc
ffffffffc0204070:	8331                	srli	a4,a4,0xc
ffffffffc0204072:	00093697          	auipc	a3,0x93
ffffffffc0204076:	82e6b683          	ld	a3,-2002(a3) # ffffffffc02968a0 <npage>
ffffffffc020407a:	07b2                	slli	a5,a5,0xc
ffffffffc020407c:	06d77963          	bgeu	a4,a3,ffffffffc02040ee <do_pgfault+0xf6>
ffffffffc0204080:	00093517          	auipc	a0,0x93
ffffffffc0204084:	83853503          	ld	a0,-1992(a0) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0204088:	6605                	lui	a2,0x1
ffffffffc020408a:	4581                	li	a1,0
ffffffffc020408c:	953e                	add	a0,a0,a5
ffffffffc020408e:	7cc070ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0204092:	6c88                	ld	a0,24(s1)
ffffffffc0204094:	86ce                	mv	a3,s3
ffffffffc0204096:	8622                	mv	a2,s0
ffffffffc0204098:	85ca                	mv	a1,s2
ffffffffc020409a:	9d1fe0ef          	jal	ra,ffffffffc0202a6a <page_insert>
ffffffffc020409e:	84aa                	mv	s1,a0
ffffffffc02040a0:	e51d                	bnez	a0,ffffffffc02040ce <do_pgfault+0xd6>
ffffffffc02040a2:	02893c23          	sd	s0,56(s2)
ffffffffc02040a6:	70a2                	ld	ra,40(sp)
ffffffffc02040a8:	7402                	ld	s0,32(sp)
ffffffffc02040aa:	6942                	ld	s2,16(sp)
ffffffffc02040ac:	69a2                	ld	s3,8(sp)
ffffffffc02040ae:	8526                	mv	a0,s1
ffffffffc02040b0:	64e2                	ld	s1,24(sp)
ffffffffc02040b2:	6145                	addi	sp,sp,48
ffffffffc02040b4:	8082                	ret
ffffffffc02040b6:	0089e993          	ori	s3,s3,8
ffffffffc02040ba:	bf41                	j	ffffffffc020404a <do_pgfault+0x52>
ffffffffc02040bc:	70a2                	ld	ra,40(sp)
ffffffffc02040be:	7402                	ld	s0,32(sp)
ffffffffc02040c0:	4481                	li	s1,0
ffffffffc02040c2:	6942                	ld	s2,16(sp)
ffffffffc02040c4:	69a2                	ld	s3,8(sp)
ffffffffc02040c6:	8526                	mv	a0,s1
ffffffffc02040c8:	64e2                	ld	s1,24(sp)
ffffffffc02040ca:	6145                	addi	sp,sp,48
ffffffffc02040cc:	8082                	ret
ffffffffc02040ce:	854a                	mv	a0,s2
ffffffffc02040d0:	4585                	li	a1,1
ffffffffc02040d2:	968fe0ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc02040d6:	70a2                	ld	ra,40(sp)
ffffffffc02040d8:	7402                	ld	s0,32(sp)
ffffffffc02040da:	6942                	ld	s2,16(sp)
ffffffffc02040dc:	69a2                	ld	s3,8(sp)
ffffffffc02040de:	8526                	mv	a0,s1
ffffffffc02040e0:	64e2                	ld	s1,24(sp)
ffffffffc02040e2:	6145                	addi	sp,sp,48
ffffffffc02040e4:	8082                	ret
ffffffffc02040e6:	54f5                	li	s1,-3
ffffffffc02040e8:	bf7d                	j	ffffffffc02040a6 <do_pgfault+0xae>
ffffffffc02040ea:	54f1                	li	s1,-4
ffffffffc02040ec:	bf6d                	j	ffffffffc02040a6 <do_pgfault+0xae>
ffffffffc02040ee:	86be                	mv	a3,a5
ffffffffc02040f0:	00008617          	auipc	a2,0x8
ffffffffc02040f4:	7a860613          	addi	a2,a2,1960 # ffffffffc020c898 <default_pmm_manager+0x38>
ffffffffc02040f8:	07100593          	li	a1,113
ffffffffc02040fc:	00008517          	auipc	a0,0x8
ffffffffc0204100:	7c450513          	addi	a0,a0,1988 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc0204104:	b9afc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204108 <vmm_init>:
ffffffffc0204108:	7139                	addi	sp,sp,-64
ffffffffc020410a:	05800513          	li	a0,88
ffffffffc020410e:	fc06                	sd	ra,56(sp)
ffffffffc0204110:	f822                	sd	s0,48(sp)
ffffffffc0204112:	f426                	sd	s1,40(sp)
ffffffffc0204114:	f04a                	sd	s2,32(sp)
ffffffffc0204116:	ec4e                	sd	s3,24(sp)
ffffffffc0204118:	e852                	sd	s4,16(sp)
ffffffffc020411a:	e456                	sd	s5,8(sp)
ffffffffc020411c:	f03fd0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0204120:	2e050963          	beqz	a0,ffffffffc0204412 <vmm_init+0x30a>
ffffffffc0204124:	e508                	sd	a0,8(a0)
ffffffffc0204126:	e108                	sd	a0,0(a0)
ffffffffc0204128:	00053823          	sd	zero,16(a0)
ffffffffc020412c:	00053c23          	sd	zero,24(a0)
ffffffffc0204130:	02052023          	sw	zero,32(a0)
ffffffffc0204134:	02053423          	sd	zero,40(a0)
ffffffffc0204138:	02052823          	sw	zero,48(a0)
ffffffffc020413c:	84aa                	mv	s1,a0
ffffffffc020413e:	4585                	li	a1,1
ffffffffc0204140:	03850513          	addi	a0,a0,56
ffffffffc0204144:	5b6000ef          	jal	ra,ffffffffc02046fa <sem_init>
ffffffffc0204148:	03200413          	li	s0,50
ffffffffc020414c:	a811                	j	ffffffffc0204160 <vmm_init+0x58>
ffffffffc020414e:	e500                	sd	s0,8(a0)
ffffffffc0204150:	e91c                	sd	a5,16(a0)
ffffffffc0204152:	00052c23          	sw	zero,24(a0)
ffffffffc0204156:	146d                	addi	s0,s0,-5
ffffffffc0204158:	8526                	mv	a0,s1
ffffffffc020415a:	bbdff0ef          	jal	ra,ffffffffc0203d16 <insert_vma_struct>
ffffffffc020415e:	c80d                	beqz	s0,ffffffffc0204190 <vmm_init+0x88>
ffffffffc0204160:	03000513          	li	a0,48
ffffffffc0204164:	ebbfd0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0204168:	85aa                	mv	a1,a0
ffffffffc020416a:	00240793          	addi	a5,s0,2
ffffffffc020416e:	f165                	bnez	a0,ffffffffc020414e <vmm_init+0x46>
ffffffffc0204170:	00009697          	auipc	a3,0x9
ffffffffc0204174:	18068693          	addi	a3,a3,384 # ffffffffc020d2f0 <default_pmm_manager+0xa90>
ffffffffc0204178:	00008617          	auipc	a2,0x8
ffffffffc020417c:	bc860613          	addi	a2,a2,-1080 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204180:	16400593          	li	a1,356
ffffffffc0204184:	00009517          	auipc	a0,0x9
ffffffffc0204188:	f1c50513          	addi	a0,a0,-228 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc020418c:	b12fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204190:	03700413          	li	s0,55
ffffffffc0204194:	1f900913          	li	s2,505
ffffffffc0204198:	a819                	j	ffffffffc02041ae <vmm_init+0xa6>
ffffffffc020419a:	e500                	sd	s0,8(a0)
ffffffffc020419c:	e91c                	sd	a5,16(a0)
ffffffffc020419e:	00052c23          	sw	zero,24(a0)
ffffffffc02041a2:	0415                	addi	s0,s0,5
ffffffffc02041a4:	8526                	mv	a0,s1
ffffffffc02041a6:	b71ff0ef          	jal	ra,ffffffffc0203d16 <insert_vma_struct>
ffffffffc02041aa:	03240a63          	beq	s0,s2,ffffffffc02041de <vmm_init+0xd6>
ffffffffc02041ae:	03000513          	li	a0,48
ffffffffc02041b2:	e6dfd0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc02041b6:	85aa                	mv	a1,a0
ffffffffc02041b8:	00240793          	addi	a5,s0,2
ffffffffc02041bc:	fd79                	bnez	a0,ffffffffc020419a <vmm_init+0x92>
ffffffffc02041be:	00009697          	auipc	a3,0x9
ffffffffc02041c2:	13268693          	addi	a3,a3,306 # ffffffffc020d2f0 <default_pmm_manager+0xa90>
ffffffffc02041c6:	00008617          	auipc	a2,0x8
ffffffffc02041ca:	b7a60613          	addi	a2,a2,-1158 # ffffffffc020bd40 <commands+0x210>
ffffffffc02041ce:	16b00593          	li	a1,363
ffffffffc02041d2:	00009517          	auipc	a0,0x9
ffffffffc02041d6:	ece50513          	addi	a0,a0,-306 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc02041da:	ac4fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041de:	649c                	ld	a5,8(s1)
ffffffffc02041e0:	471d                	li	a4,7
ffffffffc02041e2:	1fb00593          	li	a1,507
ffffffffc02041e6:	16f48663          	beq	s1,a5,ffffffffc0204352 <vmm_init+0x24a>
ffffffffc02041ea:	fe87b603          	ld	a2,-24(a5)
ffffffffc02041ee:	ffe70693          	addi	a3,a4,-2
ffffffffc02041f2:	10d61063          	bne	a2,a3,ffffffffc02042f2 <vmm_init+0x1ea>
ffffffffc02041f6:	ff07b683          	ld	a3,-16(a5)
ffffffffc02041fa:	0ed71c63          	bne	a4,a3,ffffffffc02042f2 <vmm_init+0x1ea>
ffffffffc02041fe:	0715                	addi	a4,a4,5
ffffffffc0204200:	679c                	ld	a5,8(a5)
ffffffffc0204202:	feb712e3          	bne	a4,a1,ffffffffc02041e6 <vmm_init+0xde>
ffffffffc0204206:	4a1d                	li	s4,7
ffffffffc0204208:	4415                	li	s0,5
ffffffffc020420a:	1f900a93          	li	s5,505
ffffffffc020420e:	85a2                	mv	a1,s0
ffffffffc0204210:	8526                	mv	a0,s1
ffffffffc0204212:	ac5ff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0204216:	892a                	mv	s2,a0
ffffffffc0204218:	16050d63          	beqz	a0,ffffffffc0204392 <vmm_init+0x28a>
ffffffffc020421c:	00140593          	addi	a1,s0,1
ffffffffc0204220:	8526                	mv	a0,s1
ffffffffc0204222:	ab5ff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0204226:	89aa                	mv	s3,a0
ffffffffc0204228:	14050563          	beqz	a0,ffffffffc0204372 <vmm_init+0x26a>
ffffffffc020422c:	85d2                	mv	a1,s4
ffffffffc020422e:	8526                	mv	a0,s1
ffffffffc0204230:	aa7ff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0204234:	16051f63          	bnez	a0,ffffffffc02043b2 <vmm_init+0x2aa>
ffffffffc0204238:	00340593          	addi	a1,s0,3
ffffffffc020423c:	8526                	mv	a0,s1
ffffffffc020423e:	a99ff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0204242:	1a051863          	bnez	a0,ffffffffc02043f2 <vmm_init+0x2ea>
ffffffffc0204246:	00440593          	addi	a1,s0,4
ffffffffc020424a:	8526                	mv	a0,s1
ffffffffc020424c:	a8bff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0204250:	18051163          	bnez	a0,ffffffffc02043d2 <vmm_init+0x2ca>
ffffffffc0204254:	00893783          	ld	a5,8(s2)
ffffffffc0204258:	0a879d63          	bne	a5,s0,ffffffffc0204312 <vmm_init+0x20a>
ffffffffc020425c:	01093783          	ld	a5,16(s2)
ffffffffc0204260:	0b479963          	bne	a5,s4,ffffffffc0204312 <vmm_init+0x20a>
ffffffffc0204264:	0089b783          	ld	a5,8(s3)
ffffffffc0204268:	0c879563          	bne	a5,s0,ffffffffc0204332 <vmm_init+0x22a>
ffffffffc020426c:	0109b783          	ld	a5,16(s3)
ffffffffc0204270:	0d479163          	bne	a5,s4,ffffffffc0204332 <vmm_init+0x22a>
ffffffffc0204274:	0415                	addi	s0,s0,5
ffffffffc0204276:	0a15                	addi	s4,s4,5
ffffffffc0204278:	f9541be3          	bne	s0,s5,ffffffffc020420e <vmm_init+0x106>
ffffffffc020427c:	4411                	li	s0,4
ffffffffc020427e:	597d                	li	s2,-1
ffffffffc0204280:	85a2                	mv	a1,s0
ffffffffc0204282:	8526                	mv	a0,s1
ffffffffc0204284:	a53ff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0204288:	0004059b          	sext.w	a1,s0
ffffffffc020428c:	c90d                	beqz	a0,ffffffffc02042be <vmm_init+0x1b6>
ffffffffc020428e:	6914                	ld	a3,16(a0)
ffffffffc0204290:	6510                	ld	a2,8(a0)
ffffffffc0204292:	00009517          	auipc	a0,0x9
ffffffffc0204296:	fe650513          	addi	a0,a0,-26 # ffffffffc020d278 <default_pmm_manager+0xa18>
ffffffffc020429a:	f0dfb0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020429e:	00009697          	auipc	a3,0x9
ffffffffc02042a2:	00268693          	addi	a3,a3,2 # ffffffffc020d2a0 <default_pmm_manager+0xa40>
ffffffffc02042a6:	00008617          	auipc	a2,0x8
ffffffffc02042aa:	a9a60613          	addi	a2,a2,-1382 # ffffffffc020bd40 <commands+0x210>
ffffffffc02042ae:	19100593          	li	a1,401
ffffffffc02042b2:	00009517          	auipc	a0,0x9
ffffffffc02042b6:	dee50513          	addi	a0,a0,-530 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc02042ba:	9e4fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02042be:	147d                	addi	s0,s0,-1
ffffffffc02042c0:	fd2410e3          	bne	s0,s2,ffffffffc0204280 <vmm_init+0x178>
ffffffffc02042c4:	8526                	mv	a0,s1
ffffffffc02042c6:	b21ff0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc02042ca:	00009517          	auipc	a0,0x9
ffffffffc02042ce:	fee50513          	addi	a0,a0,-18 # ffffffffc020d2b8 <default_pmm_manager+0xa58>
ffffffffc02042d2:	ed5fb0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02042d6:	7442                	ld	s0,48(sp)
ffffffffc02042d8:	70e2                	ld	ra,56(sp)
ffffffffc02042da:	74a2                	ld	s1,40(sp)
ffffffffc02042dc:	7902                	ld	s2,32(sp)
ffffffffc02042de:	69e2                	ld	s3,24(sp)
ffffffffc02042e0:	6a42                	ld	s4,16(sp)
ffffffffc02042e2:	6aa2                	ld	s5,8(sp)
ffffffffc02042e4:	00009517          	auipc	a0,0x9
ffffffffc02042e8:	ff450513          	addi	a0,a0,-12 # ffffffffc020d2d8 <default_pmm_manager+0xa78>
ffffffffc02042ec:	6121                	addi	sp,sp,64
ffffffffc02042ee:	eb9fb06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02042f2:	00009697          	auipc	a3,0x9
ffffffffc02042f6:	e9e68693          	addi	a3,a3,-354 # ffffffffc020d190 <default_pmm_manager+0x930>
ffffffffc02042fa:	00008617          	auipc	a2,0x8
ffffffffc02042fe:	a4660613          	addi	a2,a2,-1466 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204302:	17500593          	li	a1,373
ffffffffc0204306:	00009517          	auipc	a0,0x9
ffffffffc020430a:	d9a50513          	addi	a0,a0,-614 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc020430e:	990fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204312:	00009697          	auipc	a3,0x9
ffffffffc0204316:	f0668693          	addi	a3,a3,-250 # ffffffffc020d218 <default_pmm_manager+0x9b8>
ffffffffc020431a:	00008617          	auipc	a2,0x8
ffffffffc020431e:	a2660613          	addi	a2,a2,-1498 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204322:	18600593          	li	a1,390
ffffffffc0204326:	00009517          	auipc	a0,0x9
ffffffffc020432a:	d7a50513          	addi	a0,a0,-646 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc020432e:	970fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204332:	00009697          	auipc	a3,0x9
ffffffffc0204336:	f1668693          	addi	a3,a3,-234 # ffffffffc020d248 <default_pmm_manager+0x9e8>
ffffffffc020433a:	00008617          	auipc	a2,0x8
ffffffffc020433e:	a0660613          	addi	a2,a2,-1530 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204342:	18700593          	li	a1,391
ffffffffc0204346:	00009517          	auipc	a0,0x9
ffffffffc020434a:	d5a50513          	addi	a0,a0,-678 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc020434e:	950fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204352:	00009697          	auipc	a3,0x9
ffffffffc0204356:	e2668693          	addi	a3,a3,-474 # ffffffffc020d178 <default_pmm_manager+0x918>
ffffffffc020435a:	00008617          	auipc	a2,0x8
ffffffffc020435e:	9e660613          	addi	a2,a2,-1562 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204362:	17300593          	li	a1,371
ffffffffc0204366:	00009517          	auipc	a0,0x9
ffffffffc020436a:	d3a50513          	addi	a0,a0,-710 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc020436e:	930fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204372:	00009697          	auipc	a3,0x9
ffffffffc0204376:	e6668693          	addi	a3,a3,-410 # ffffffffc020d1d8 <default_pmm_manager+0x978>
ffffffffc020437a:	00008617          	auipc	a2,0x8
ffffffffc020437e:	9c660613          	addi	a2,a2,-1594 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204382:	17e00593          	li	a1,382
ffffffffc0204386:	00009517          	auipc	a0,0x9
ffffffffc020438a:	d1a50513          	addi	a0,a0,-742 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc020438e:	910fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204392:	00009697          	auipc	a3,0x9
ffffffffc0204396:	e3668693          	addi	a3,a3,-458 # ffffffffc020d1c8 <default_pmm_manager+0x968>
ffffffffc020439a:	00008617          	auipc	a2,0x8
ffffffffc020439e:	9a660613          	addi	a2,a2,-1626 # ffffffffc020bd40 <commands+0x210>
ffffffffc02043a2:	17c00593          	li	a1,380
ffffffffc02043a6:	00009517          	auipc	a0,0x9
ffffffffc02043aa:	cfa50513          	addi	a0,a0,-774 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc02043ae:	8f0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02043b2:	00009697          	auipc	a3,0x9
ffffffffc02043b6:	e3668693          	addi	a3,a3,-458 # ffffffffc020d1e8 <default_pmm_manager+0x988>
ffffffffc02043ba:	00008617          	auipc	a2,0x8
ffffffffc02043be:	98660613          	addi	a2,a2,-1658 # ffffffffc020bd40 <commands+0x210>
ffffffffc02043c2:	18000593          	li	a1,384
ffffffffc02043c6:	00009517          	auipc	a0,0x9
ffffffffc02043ca:	cda50513          	addi	a0,a0,-806 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc02043ce:	8d0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02043d2:	00009697          	auipc	a3,0x9
ffffffffc02043d6:	e3668693          	addi	a3,a3,-458 # ffffffffc020d208 <default_pmm_manager+0x9a8>
ffffffffc02043da:	00008617          	auipc	a2,0x8
ffffffffc02043de:	96660613          	addi	a2,a2,-1690 # ffffffffc020bd40 <commands+0x210>
ffffffffc02043e2:	18400593          	li	a1,388
ffffffffc02043e6:	00009517          	auipc	a0,0x9
ffffffffc02043ea:	cba50513          	addi	a0,a0,-838 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc02043ee:	8b0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02043f2:	00009697          	auipc	a3,0x9
ffffffffc02043f6:	e0668693          	addi	a3,a3,-506 # ffffffffc020d1f8 <default_pmm_manager+0x998>
ffffffffc02043fa:	00008617          	auipc	a2,0x8
ffffffffc02043fe:	94660613          	addi	a2,a2,-1722 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204402:	18200593          	li	a1,386
ffffffffc0204406:	00009517          	auipc	a0,0x9
ffffffffc020440a:	c9a50513          	addi	a0,a0,-870 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc020440e:	890fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204412:	00009697          	auipc	a3,0x9
ffffffffc0204416:	d1668693          	addi	a3,a3,-746 # ffffffffc020d128 <default_pmm_manager+0x8c8>
ffffffffc020441a:	00008617          	auipc	a2,0x8
ffffffffc020441e:	92660613          	addi	a2,a2,-1754 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204422:	15c00593          	li	a1,348
ffffffffc0204426:	00009517          	auipc	a0,0x9
ffffffffc020442a:	c7a50513          	addi	a0,a0,-902 # ffffffffc020d0a0 <default_pmm_manager+0x840>
ffffffffc020442e:	870fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204432 <user_mem_check>:
ffffffffc0204432:	7179                	addi	sp,sp,-48
ffffffffc0204434:	f022                	sd	s0,32(sp)
ffffffffc0204436:	f406                	sd	ra,40(sp)
ffffffffc0204438:	ec26                	sd	s1,24(sp)
ffffffffc020443a:	e84a                	sd	s2,16(sp)
ffffffffc020443c:	e44e                	sd	s3,8(sp)
ffffffffc020443e:	e052                	sd	s4,0(sp)
ffffffffc0204440:	842e                	mv	s0,a1
ffffffffc0204442:	c135                	beqz	a0,ffffffffc02044a6 <user_mem_check+0x74>
ffffffffc0204444:	002007b7          	lui	a5,0x200
ffffffffc0204448:	04f5e663          	bltu	a1,a5,ffffffffc0204494 <user_mem_check+0x62>
ffffffffc020444c:	00c584b3          	add	s1,a1,a2
ffffffffc0204450:	0495f263          	bgeu	a1,s1,ffffffffc0204494 <user_mem_check+0x62>
ffffffffc0204454:	4785                	li	a5,1
ffffffffc0204456:	07fe                	slli	a5,a5,0x1f
ffffffffc0204458:	0297ee63          	bltu	a5,s1,ffffffffc0204494 <user_mem_check+0x62>
ffffffffc020445c:	892a                	mv	s2,a0
ffffffffc020445e:	89b6                	mv	s3,a3
ffffffffc0204460:	6a05                	lui	s4,0x1
ffffffffc0204462:	a821                	j	ffffffffc020447a <user_mem_check+0x48>
ffffffffc0204464:	0027f693          	andi	a3,a5,2
ffffffffc0204468:	9752                	add	a4,a4,s4
ffffffffc020446a:	8ba1                	andi	a5,a5,8
ffffffffc020446c:	c685                	beqz	a3,ffffffffc0204494 <user_mem_check+0x62>
ffffffffc020446e:	c399                	beqz	a5,ffffffffc0204474 <user_mem_check+0x42>
ffffffffc0204470:	02e46263          	bltu	s0,a4,ffffffffc0204494 <user_mem_check+0x62>
ffffffffc0204474:	6900                	ld	s0,16(a0)
ffffffffc0204476:	04947663          	bgeu	s0,s1,ffffffffc02044c2 <user_mem_check+0x90>
ffffffffc020447a:	85a2                	mv	a1,s0
ffffffffc020447c:	854a                	mv	a0,s2
ffffffffc020447e:	859ff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0204482:	c909                	beqz	a0,ffffffffc0204494 <user_mem_check+0x62>
ffffffffc0204484:	6518                	ld	a4,8(a0)
ffffffffc0204486:	00e46763          	bltu	s0,a4,ffffffffc0204494 <user_mem_check+0x62>
ffffffffc020448a:	4d1c                	lw	a5,24(a0)
ffffffffc020448c:	fc099ce3          	bnez	s3,ffffffffc0204464 <user_mem_check+0x32>
ffffffffc0204490:	8b85                	andi	a5,a5,1
ffffffffc0204492:	f3ed                	bnez	a5,ffffffffc0204474 <user_mem_check+0x42>
ffffffffc0204494:	4501                	li	a0,0
ffffffffc0204496:	70a2                	ld	ra,40(sp)
ffffffffc0204498:	7402                	ld	s0,32(sp)
ffffffffc020449a:	64e2                	ld	s1,24(sp)
ffffffffc020449c:	6942                	ld	s2,16(sp)
ffffffffc020449e:	69a2                	ld	s3,8(sp)
ffffffffc02044a0:	6a02                	ld	s4,0(sp)
ffffffffc02044a2:	6145                	addi	sp,sp,48
ffffffffc02044a4:	8082                	ret
ffffffffc02044a6:	c02007b7          	lui	a5,0xc0200
ffffffffc02044aa:	4501                	li	a0,0
ffffffffc02044ac:	fef5e5e3          	bltu	a1,a5,ffffffffc0204496 <user_mem_check+0x64>
ffffffffc02044b0:	962e                	add	a2,a2,a1
ffffffffc02044b2:	fec5f2e3          	bgeu	a1,a2,ffffffffc0204496 <user_mem_check+0x64>
ffffffffc02044b6:	c8000537          	lui	a0,0xc8000
ffffffffc02044ba:	0505                	addi	a0,a0,1
ffffffffc02044bc:	00a63533          	sltu	a0,a2,a0
ffffffffc02044c0:	bfd9                	j	ffffffffc0204496 <user_mem_check+0x64>
ffffffffc02044c2:	4505                	li	a0,1
ffffffffc02044c4:	bfc9                	j	ffffffffc0204496 <user_mem_check+0x64>

ffffffffc02044c6 <copy_from_user>:
ffffffffc02044c6:	1101                	addi	sp,sp,-32
ffffffffc02044c8:	e822                	sd	s0,16(sp)
ffffffffc02044ca:	e426                	sd	s1,8(sp)
ffffffffc02044cc:	8432                	mv	s0,a2
ffffffffc02044ce:	84b6                	mv	s1,a3
ffffffffc02044d0:	e04a                	sd	s2,0(sp)
ffffffffc02044d2:	86ba                	mv	a3,a4
ffffffffc02044d4:	892e                	mv	s2,a1
ffffffffc02044d6:	8626                	mv	a2,s1
ffffffffc02044d8:	85a2                	mv	a1,s0
ffffffffc02044da:	ec06                	sd	ra,24(sp)
ffffffffc02044dc:	f57ff0ef          	jal	ra,ffffffffc0204432 <user_mem_check>
ffffffffc02044e0:	c519                	beqz	a0,ffffffffc02044ee <copy_from_user+0x28>
ffffffffc02044e2:	8626                	mv	a2,s1
ffffffffc02044e4:	85a2                	mv	a1,s0
ffffffffc02044e6:	854a                	mv	a0,s2
ffffffffc02044e8:	3c4070ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc02044ec:	4505                	li	a0,1
ffffffffc02044ee:	60e2                	ld	ra,24(sp)
ffffffffc02044f0:	6442                	ld	s0,16(sp)
ffffffffc02044f2:	64a2                	ld	s1,8(sp)
ffffffffc02044f4:	6902                	ld	s2,0(sp)
ffffffffc02044f6:	6105                	addi	sp,sp,32
ffffffffc02044f8:	8082                	ret

ffffffffc02044fa <copy_to_user>:
ffffffffc02044fa:	1101                	addi	sp,sp,-32
ffffffffc02044fc:	e822                	sd	s0,16(sp)
ffffffffc02044fe:	8436                	mv	s0,a3
ffffffffc0204500:	e04a                	sd	s2,0(sp)
ffffffffc0204502:	4685                	li	a3,1
ffffffffc0204504:	8932                	mv	s2,a2
ffffffffc0204506:	8622                	mv	a2,s0
ffffffffc0204508:	e426                	sd	s1,8(sp)
ffffffffc020450a:	ec06                	sd	ra,24(sp)
ffffffffc020450c:	84ae                	mv	s1,a1
ffffffffc020450e:	f25ff0ef          	jal	ra,ffffffffc0204432 <user_mem_check>
ffffffffc0204512:	c519                	beqz	a0,ffffffffc0204520 <copy_to_user+0x26>
ffffffffc0204514:	8622                	mv	a2,s0
ffffffffc0204516:	85ca                	mv	a1,s2
ffffffffc0204518:	8526                	mv	a0,s1
ffffffffc020451a:	392070ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc020451e:	4505                	li	a0,1
ffffffffc0204520:	60e2                	ld	ra,24(sp)
ffffffffc0204522:	6442                	ld	s0,16(sp)
ffffffffc0204524:	64a2                	ld	s1,8(sp)
ffffffffc0204526:	6902                	ld	s2,0(sp)
ffffffffc0204528:	6105                	addi	sp,sp,32
ffffffffc020452a:	8082                	ret

ffffffffc020452c <copy_string>:
ffffffffc020452c:	7139                	addi	sp,sp,-64
ffffffffc020452e:	ec4e                	sd	s3,24(sp)
ffffffffc0204530:	6985                	lui	s3,0x1
ffffffffc0204532:	99b2                	add	s3,s3,a2
ffffffffc0204534:	77fd                	lui	a5,0xfffff
ffffffffc0204536:	00f9f9b3          	and	s3,s3,a5
ffffffffc020453a:	f426                	sd	s1,40(sp)
ffffffffc020453c:	f04a                	sd	s2,32(sp)
ffffffffc020453e:	e852                	sd	s4,16(sp)
ffffffffc0204540:	e456                	sd	s5,8(sp)
ffffffffc0204542:	fc06                	sd	ra,56(sp)
ffffffffc0204544:	f822                	sd	s0,48(sp)
ffffffffc0204546:	84b2                	mv	s1,a2
ffffffffc0204548:	8aaa                	mv	s5,a0
ffffffffc020454a:	8a2e                	mv	s4,a1
ffffffffc020454c:	8936                	mv	s2,a3
ffffffffc020454e:	40c989b3          	sub	s3,s3,a2
ffffffffc0204552:	a015                	j	ffffffffc0204576 <copy_string+0x4a>
ffffffffc0204554:	27e070ef          	jal	ra,ffffffffc020b7d2 <strnlen>
ffffffffc0204558:	87aa                	mv	a5,a0
ffffffffc020455a:	85a6                	mv	a1,s1
ffffffffc020455c:	8552                	mv	a0,s4
ffffffffc020455e:	8622                	mv	a2,s0
ffffffffc0204560:	0487e363          	bltu	a5,s0,ffffffffc02045a6 <copy_string+0x7a>
ffffffffc0204564:	0329f763          	bgeu	s3,s2,ffffffffc0204592 <copy_string+0x66>
ffffffffc0204568:	344070ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc020456c:	9a22                	add	s4,s4,s0
ffffffffc020456e:	94a2                	add	s1,s1,s0
ffffffffc0204570:	40890933          	sub	s2,s2,s0
ffffffffc0204574:	6985                	lui	s3,0x1
ffffffffc0204576:	4681                	li	a3,0
ffffffffc0204578:	85a6                	mv	a1,s1
ffffffffc020457a:	8556                	mv	a0,s5
ffffffffc020457c:	844a                	mv	s0,s2
ffffffffc020457e:	0129f363          	bgeu	s3,s2,ffffffffc0204584 <copy_string+0x58>
ffffffffc0204582:	844e                	mv	s0,s3
ffffffffc0204584:	8622                	mv	a2,s0
ffffffffc0204586:	eadff0ef          	jal	ra,ffffffffc0204432 <user_mem_check>
ffffffffc020458a:	87aa                	mv	a5,a0
ffffffffc020458c:	85a2                	mv	a1,s0
ffffffffc020458e:	8526                	mv	a0,s1
ffffffffc0204590:	f3f1                	bnez	a5,ffffffffc0204554 <copy_string+0x28>
ffffffffc0204592:	4501                	li	a0,0
ffffffffc0204594:	70e2                	ld	ra,56(sp)
ffffffffc0204596:	7442                	ld	s0,48(sp)
ffffffffc0204598:	74a2                	ld	s1,40(sp)
ffffffffc020459a:	7902                	ld	s2,32(sp)
ffffffffc020459c:	69e2                	ld	s3,24(sp)
ffffffffc020459e:	6a42                	ld	s4,16(sp)
ffffffffc02045a0:	6aa2                	ld	s5,8(sp)
ffffffffc02045a2:	6121                	addi	sp,sp,64
ffffffffc02045a4:	8082                	ret
ffffffffc02045a6:	00178613          	addi	a2,a5,1 # fffffffffffff001 <end+0x3fd686f1>
ffffffffc02045aa:	302070ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc02045ae:	4505                	li	a0,1
ffffffffc02045b0:	b7d5                	j	ffffffffc0204594 <copy_string+0x68>

ffffffffc02045b2 <__down.constprop.0>:
ffffffffc02045b2:	715d                	addi	sp,sp,-80
ffffffffc02045b4:	e0a2                	sd	s0,64(sp)
ffffffffc02045b6:	e486                	sd	ra,72(sp)
ffffffffc02045b8:	fc26                	sd	s1,56(sp)
ffffffffc02045ba:	842a                	mv	s0,a0
ffffffffc02045bc:	100027f3          	csrr	a5,sstatus
ffffffffc02045c0:	8b89                	andi	a5,a5,2
ffffffffc02045c2:	ebb1                	bnez	a5,ffffffffc0204616 <__down.constprop.0+0x64>
ffffffffc02045c4:	411c                	lw	a5,0(a0)
ffffffffc02045c6:	00f05a63          	blez	a5,ffffffffc02045da <__down.constprop.0+0x28>
ffffffffc02045ca:	37fd                	addiw	a5,a5,-1
ffffffffc02045cc:	c11c                	sw	a5,0(a0)
ffffffffc02045ce:	4501                	li	a0,0
ffffffffc02045d0:	60a6                	ld	ra,72(sp)
ffffffffc02045d2:	6406                	ld	s0,64(sp)
ffffffffc02045d4:	74e2                	ld	s1,56(sp)
ffffffffc02045d6:	6161                	addi	sp,sp,80
ffffffffc02045d8:	8082                	ret
ffffffffc02045da:	00850413          	addi	s0,a0,8 # ffffffffc8000008 <end+0x7d696f8>
ffffffffc02045de:	0024                	addi	s1,sp,8
ffffffffc02045e0:	10000613          	li	a2,256
ffffffffc02045e4:	85a6                	mv	a1,s1
ffffffffc02045e6:	8522                	mv	a0,s0
ffffffffc02045e8:	2d8000ef          	jal	ra,ffffffffc02048c0 <wait_current_set>
ffffffffc02045ec:	102030ef          	jal	ra,ffffffffc02076ee <schedule>
ffffffffc02045f0:	100027f3          	csrr	a5,sstatus
ffffffffc02045f4:	8b89                	andi	a5,a5,2
ffffffffc02045f6:	efb9                	bnez	a5,ffffffffc0204654 <__down.constprop.0+0xa2>
ffffffffc02045f8:	8526                	mv	a0,s1
ffffffffc02045fa:	19c000ef          	jal	ra,ffffffffc0204796 <wait_in_queue>
ffffffffc02045fe:	e531                	bnez	a0,ffffffffc020464a <__down.constprop.0+0x98>
ffffffffc0204600:	4542                	lw	a0,16(sp)
ffffffffc0204602:	10000793          	li	a5,256
ffffffffc0204606:	fcf515e3          	bne	a0,a5,ffffffffc02045d0 <__down.constprop.0+0x1e>
ffffffffc020460a:	60a6                	ld	ra,72(sp)
ffffffffc020460c:	6406                	ld	s0,64(sp)
ffffffffc020460e:	74e2                	ld	s1,56(sp)
ffffffffc0204610:	4501                	li	a0,0
ffffffffc0204612:	6161                	addi	sp,sp,80
ffffffffc0204614:	8082                	ret
ffffffffc0204616:	e5cfc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020461a:	401c                	lw	a5,0(s0)
ffffffffc020461c:	00f05c63          	blez	a5,ffffffffc0204634 <__down.constprop.0+0x82>
ffffffffc0204620:	37fd                	addiw	a5,a5,-1
ffffffffc0204622:	c01c                	sw	a5,0(s0)
ffffffffc0204624:	e48fc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0204628:	60a6                	ld	ra,72(sp)
ffffffffc020462a:	6406                	ld	s0,64(sp)
ffffffffc020462c:	74e2                	ld	s1,56(sp)
ffffffffc020462e:	4501                	li	a0,0
ffffffffc0204630:	6161                	addi	sp,sp,80
ffffffffc0204632:	8082                	ret
ffffffffc0204634:	0421                	addi	s0,s0,8
ffffffffc0204636:	0024                	addi	s1,sp,8
ffffffffc0204638:	10000613          	li	a2,256
ffffffffc020463c:	85a6                	mv	a1,s1
ffffffffc020463e:	8522                	mv	a0,s0
ffffffffc0204640:	280000ef          	jal	ra,ffffffffc02048c0 <wait_current_set>
ffffffffc0204644:	e28fc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0204648:	b755                	j	ffffffffc02045ec <__down.constprop.0+0x3a>
ffffffffc020464a:	85a6                	mv	a1,s1
ffffffffc020464c:	8522                	mv	a0,s0
ffffffffc020464e:	0ee000ef          	jal	ra,ffffffffc020473c <wait_queue_del>
ffffffffc0204652:	b77d                	j	ffffffffc0204600 <__down.constprop.0+0x4e>
ffffffffc0204654:	e1efc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0204658:	8526                	mv	a0,s1
ffffffffc020465a:	13c000ef          	jal	ra,ffffffffc0204796 <wait_in_queue>
ffffffffc020465e:	e501                	bnez	a0,ffffffffc0204666 <__down.constprop.0+0xb4>
ffffffffc0204660:	e0cfc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0204664:	bf71                	j	ffffffffc0204600 <__down.constprop.0+0x4e>
ffffffffc0204666:	85a6                	mv	a1,s1
ffffffffc0204668:	8522                	mv	a0,s0
ffffffffc020466a:	0d2000ef          	jal	ra,ffffffffc020473c <wait_queue_del>
ffffffffc020466e:	bfcd                	j	ffffffffc0204660 <__down.constprop.0+0xae>

ffffffffc0204670 <__up.constprop.0>:
ffffffffc0204670:	1101                	addi	sp,sp,-32
ffffffffc0204672:	e822                	sd	s0,16(sp)
ffffffffc0204674:	ec06                	sd	ra,24(sp)
ffffffffc0204676:	e426                	sd	s1,8(sp)
ffffffffc0204678:	e04a                	sd	s2,0(sp)
ffffffffc020467a:	842a                	mv	s0,a0
ffffffffc020467c:	100027f3          	csrr	a5,sstatus
ffffffffc0204680:	8b89                	andi	a5,a5,2
ffffffffc0204682:	4901                	li	s2,0
ffffffffc0204684:	eba1                	bnez	a5,ffffffffc02046d4 <__up.constprop.0+0x64>
ffffffffc0204686:	00840493          	addi	s1,s0,8
ffffffffc020468a:	8526                	mv	a0,s1
ffffffffc020468c:	0ee000ef          	jal	ra,ffffffffc020477a <wait_queue_first>
ffffffffc0204690:	85aa                	mv	a1,a0
ffffffffc0204692:	cd0d                	beqz	a0,ffffffffc02046cc <__up.constprop.0+0x5c>
ffffffffc0204694:	6118                	ld	a4,0(a0)
ffffffffc0204696:	10000793          	li	a5,256
ffffffffc020469a:	0ec72703          	lw	a4,236(a4)
ffffffffc020469e:	02f71f63          	bne	a4,a5,ffffffffc02046dc <__up.constprop.0+0x6c>
ffffffffc02046a2:	4685                	li	a3,1
ffffffffc02046a4:	10000613          	li	a2,256
ffffffffc02046a8:	8526                	mv	a0,s1
ffffffffc02046aa:	0fa000ef          	jal	ra,ffffffffc02047a4 <wakeup_wait>
ffffffffc02046ae:	00091863          	bnez	s2,ffffffffc02046be <__up.constprop.0+0x4e>
ffffffffc02046b2:	60e2                	ld	ra,24(sp)
ffffffffc02046b4:	6442                	ld	s0,16(sp)
ffffffffc02046b6:	64a2                	ld	s1,8(sp)
ffffffffc02046b8:	6902                	ld	s2,0(sp)
ffffffffc02046ba:	6105                	addi	sp,sp,32
ffffffffc02046bc:	8082                	ret
ffffffffc02046be:	6442                	ld	s0,16(sp)
ffffffffc02046c0:	60e2                	ld	ra,24(sp)
ffffffffc02046c2:	64a2                	ld	s1,8(sp)
ffffffffc02046c4:	6902                	ld	s2,0(sp)
ffffffffc02046c6:	6105                	addi	sp,sp,32
ffffffffc02046c8:	da4fc06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc02046cc:	401c                	lw	a5,0(s0)
ffffffffc02046ce:	2785                	addiw	a5,a5,1
ffffffffc02046d0:	c01c                	sw	a5,0(s0)
ffffffffc02046d2:	bff1                	j	ffffffffc02046ae <__up.constprop.0+0x3e>
ffffffffc02046d4:	d9efc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02046d8:	4905                	li	s2,1
ffffffffc02046da:	b775                	j	ffffffffc0204686 <__up.constprop.0+0x16>
ffffffffc02046dc:	00009697          	auipc	a3,0x9
ffffffffc02046e0:	c2468693          	addi	a3,a3,-988 # ffffffffc020d300 <default_pmm_manager+0xaa0>
ffffffffc02046e4:	00007617          	auipc	a2,0x7
ffffffffc02046e8:	65c60613          	addi	a2,a2,1628 # ffffffffc020bd40 <commands+0x210>
ffffffffc02046ec:	45e5                	li	a1,25
ffffffffc02046ee:	00009517          	auipc	a0,0x9
ffffffffc02046f2:	c3a50513          	addi	a0,a0,-966 # ffffffffc020d328 <default_pmm_manager+0xac8>
ffffffffc02046f6:	da9fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02046fa <sem_init>:
ffffffffc02046fa:	c10c                	sw	a1,0(a0)
ffffffffc02046fc:	0521                	addi	a0,a0,8
ffffffffc02046fe:	a825                	j	ffffffffc0204736 <wait_queue_init>

ffffffffc0204700 <up>:
ffffffffc0204700:	f71ff06f          	j	ffffffffc0204670 <__up.constprop.0>

ffffffffc0204704 <down>:
ffffffffc0204704:	1141                	addi	sp,sp,-16
ffffffffc0204706:	e406                	sd	ra,8(sp)
ffffffffc0204708:	eabff0ef          	jal	ra,ffffffffc02045b2 <__down.constprop.0>
ffffffffc020470c:	2501                	sext.w	a0,a0
ffffffffc020470e:	e501                	bnez	a0,ffffffffc0204716 <down+0x12>
ffffffffc0204710:	60a2                	ld	ra,8(sp)
ffffffffc0204712:	0141                	addi	sp,sp,16
ffffffffc0204714:	8082                	ret
ffffffffc0204716:	00009697          	auipc	a3,0x9
ffffffffc020471a:	c2268693          	addi	a3,a3,-990 # ffffffffc020d338 <default_pmm_manager+0xad8>
ffffffffc020471e:	00007617          	auipc	a2,0x7
ffffffffc0204722:	62260613          	addi	a2,a2,1570 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204726:	04000593          	li	a1,64
ffffffffc020472a:	00009517          	auipc	a0,0x9
ffffffffc020472e:	bfe50513          	addi	a0,a0,-1026 # ffffffffc020d328 <default_pmm_manager+0xac8>
ffffffffc0204732:	d6dfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204736 <wait_queue_init>:
ffffffffc0204736:	e508                	sd	a0,8(a0)
ffffffffc0204738:	e108                	sd	a0,0(a0)
ffffffffc020473a:	8082                	ret

ffffffffc020473c <wait_queue_del>:
ffffffffc020473c:	7198                	ld	a4,32(a1)
ffffffffc020473e:	01858793          	addi	a5,a1,24 # fffffffffffff018 <end+0x3fd68708>
ffffffffc0204742:	00e78b63          	beq	a5,a4,ffffffffc0204758 <wait_queue_del+0x1c>
ffffffffc0204746:	6994                	ld	a3,16(a1)
ffffffffc0204748:	00a69863          	bne	a3,a0,ffffffffc0204758 <wait_queue_del+0x1c>
ffffffffc020474c:	6d94                	ld	a3,24(a1)
ffffffffc020474e:	e698                	sd	a4,8(a3)
ffffffffc0204750:	e314                	sd	a3,0(a4)
ffffffffc0204752:	f19c                	sd	a5,32(a1)
ffffffffc0204754:	ed9c                	sd	a5,24(a1)
ffffffffc0204756:	8082                	ret
ffffffffc0204758:	1141                	addi	sp,sp,-16
ffffffffc020475a:	00009697          	auipc	a3,0x9
ffffffffc020475e:	c3e68693          	addi	a3,a3,-962 # ffffffffc020d398 <default_pmm_manager+0xb38>
ffffffffc0204762:	00007617          	auipc	a2,0x7
ffffffffc0204766:	5de60613          	addi	a2,a2,1502 # ffffffffc020bd40 <commands+0x210>
ffffffffc020476a:	45f1                	li	a1,28
ffffffffc020476c:	00009517          	auipc	a0,0x9
ffffffffc0204770:	c1450513          	addi	a0,a0,-1004 # ffffffffc020d380 <default_pmm_manager+0xb20>
ffffffffc0204774:	e406                	sd	ra,8(sp)
ffffffffc0204776:	d29fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020477a <wait_queue_first>:
ffffffffc020477a:	651c                	ld	a5,8(a0)
ffffffffc020477c:	00f50563          	beq	a0,a5,ffffffffc0204786 <wait_queue_first+0xc>
ffffffffc0204780:	fe878513          	addi	a0,a5,-24
ffffffffc0204784:	8082                	ret
ffffffffc0204786:	4501                	li	a0,0
ffffffffc0204788:	8082                	ret

ffffffffc020478a <wait_queue_empty>:
ffffffffc020478a:	651c                	ld	a5,8(a0)
ffffffffc020478c:	40a78533          	sub	a0,a5,a0
ffffffffc0204790:	00153513          	seqz	a0,a0
ffffffffc0204794:	8082                	ret

ffffffffc0204796 <wait_in_queue>:
ffffffffc0204796:	711c                	ld	a5,32(a0)
ffffffffc0204798:	0561                	addi	a0,a0,24
ffffffffc020479a:	40a78533          	sub	a0,a5,a0
ffffffffc020479e:	00a03533          	snez	a0,a0
ffffffffc02047a2:	8082                	ret

ffffffffc02047a4 <wakeup_wait>:
ffffffffc02047a4:	e689                	bnez	a3,ffffffffc02047ae <wakeup_wait+0xa>
ffffffffc02047a6:	6188                	ld	a0,0(a1)
ffffffffc02047a8:	c590                	sw	a2,8(a1)
ffffffffc02047aa:	6930206f          	j	ffffffffc020763c <wakeup_proc>
ffffffffc02047ae:	7198                	ld	a4,32(a1)
ffffffffc02047b0:	01858793          	addi	a5,a1,24
ffffffffc02047b4:	00e78e63          	beq	a5,a4,ffffffffc02047d0 <wakeup_wait+0x2c>
ffffffffc02047b8:	6994                	ld	a3,16(a1)
ffffffffc02047ba:	00d51b63          	bne	a0,a3,ffffffffc02047d0 <wakeup_wait+0x2c>
ffffffffc02047be:	6d94                	ld	a3,24(a1)
ffffffffc02047c0:	6188                	ld	a0,0(a1)
ffffffffc02047c2:	e698                	sd	a4,8(a3)
ffffffffc02047c4:	e314                	sd	a3,0(a4)
ffffffffc02047c6:	f19c                	sd	a5,32(a1)
ffffffffc02047c8:	ed9c                	sd	a5,24(a1)
ffffffffc02047ca:	c590                	sw	a2,8(a1)
ffffffffc02047cc:	6710206f          	j	ffffffffc020763c <wakeup_proc>
ffffffffc02047d0:	1141                	addi	sp,sp,-16
ffffffffc02047d2:	00009697          	auipc	a3,0x9
ffffffffc02047d6:	bc668693          	addi	a3,a3,-1082 # ffffffffc020d398 <default_pmm_manager+0xb38>
ffffffffc02047da:	00007617          	auipc	a2,0x7
ffffffffc02047de:	56660613          	addi	a2,a2,1382 # ffffffffc020bd40 <commands+0x210>
ffffffffc02047e2:	45f1                	li	a1,28
ffffffffc02047e4:	00009517          	auipc	a0,0x9
ffffffffc02047e8:	b9c50513          	addi	a0,a0,-1124 # ffffffffc020d380 <default_pmm_manager+0xb20>
ffffffffc02047ec:	e406                	sd	ra,8(sp)
ffffffffc02047ee:	cb1fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02047f2 <wakeup_queue>:
ffffffffc02047f2:	651c                	ld	a5,8(a0)
ffffffffc02047f4:	0ca78563          	beq	a5,a0,ffffffffc02048be <wakeup_queue+0xcc>
ffffffffc02047f8:	1101                	addi	sp,sp,-32
ffffffffc02047fa:	e822                	sd	s0,16(sp)
ffffffffc02047fc:	e426                	sd	s1,8(sp)
ffffffffc02047fe:	e04a                	sd	s2,0(sp)
ffffffffc0204800:	ec06                	sd	ra,24(sp)
ffffffffc0204802:	84aa                	mv	s1,a0
ffffffffc0204804:	892e                	mv	s2,a1
ffffffffc0204806:	fe878413          	addi	s0,a5,-24
ffffffffc020480a:	e23d                	bnez	a2,ffffffffc0204870 <wakeup_queue+0x7e>
ffffffffc020480c:	6008                	ld	a0,0(s0)
ffffffffc020480e:	01242423          	sw	s2,8(s0)
ffffffffc0204812:	62b020ef          	jal	ra,ffffffffc020763c <wakeup_proc>
ffffffffc0204816:	701c                	ld	a5,32(s0)
ffffffffc0204818:	01840713          	addi	a4,s0,24
ffffffffc020481c:	02e78463          	beq	a5,a4,ffffffffc0204844 <wakeup_queue+0x52>
ffffffffc0204820:	6818                	ld	a4,16(s0)
ffffffffc0204822:	02e49163          	bne	s1,a4,ffffffffc0204844 <wakeup_queue+0x52>
ffffffffc0204826:	02f48f63          	beq	s1,a5,ffffffffc0204864 <wakeup_queue+0x72>
ffffffffc020482a:	fe87b503          	ld	a0,-24(a5)
ffffffffc020482e:	ff27a823          	sw	s2,-16(a5)
ffffffffc0204832:	fe878413          	addi	s0,a5,-24
ffffffffc0204836:	607020ef          	jal	ra,ffffffffc020763c <wakeup_proc>
ffffffffc020483a:	701c                	ld	a5,32(s0)
ffffffffc020483c:	01840713          	addi	a4,s0,24
ffffffffc0204840:	fee790e3          	bne	a5,a4,ffffffffc0204820 <wakeup_queue+0x2e>
ffffffffc0204844:	00009697          	auipc	a3,0x9
ffffffffc0204848:	b5468693          	addi	a3,a3,-1196 # ffffffffc020d398 <default_pmm_manager+0xb38>
ffffffffc020484c:	00007617          	auipc	a2,0x7
ffffffffc0204850:	4f460613          	addi	a2,a2,1268 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204854:	02200593          	li	a1,34
ffffffffc0204858:	00009517          	auipc	a0,0x9
ffffffffc020485c:	b2850513          	addi	a0,a0,-1240 # ffffffffc020d380 <default_pmm_manager+0xb20>
ffffffffc0204860:	c3ffb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204864:	60e2                	ld	ra,24(sp)
ffffffffc0204866:	6442                	ld	s0,16(sp)
ffffffffc0204868:	64a2                	ld	s1,8(sp)
ffffffffc020486a:	6902                	ld	s2,0(sp)
ffffffffc020486c:	6105                	addi	sp,sp,32
ffffffffc020486e:	8082                	ret
ffffffffc0204870:	6798                	ld	a4,8(a5)
ffffffffc0204872:	02f70763          	beq	a4,a5,ffffffffc02048a0 <wakeup_queue+0xae>
ffffffffc0204876:	6814                	ld	a3,16(s0)
ffffffffc0204878:	02d49463          	bne	s1,a3,ffffffffc02048a0 <wakeup_queue+0xae>
ffffffffc020487c:	6c14                	ld	a3,24(s0)
ffffffffc020487e:	6008                	ld	a0,0(s0)
ffffffffc0204880:	e698                	sd	a4,8(a3)
ffffffffc0204882:	e314                	sd	a3,0(a4)
ffffffffc0204884:	f01c                	sd	a5,32(s0)
ffffffffc0204886:	ec1c                	sd	a5,24(s0)
ffffffffc0204888:	01242423          	sw	s2,8(s0)
ffffffffc020488c:	5b1020ef          	jal	ra,ffffffffc020763c <wakeup_proc>
ffffffffc0204890:	6480                	ld	s0,8(s1)
ffffffffc0204892:	fc8489e3          	beq	s1,s0,ffffffffc0204864 <wakeup_queue+0x72>
ffffffffc0204896:	6418                	ld	a4,8(s0)
ffffffffc0204898:	87a2                	mv	a5,s0
ffffffffc020489a:	1421                	addi	s0,s0,-24
ffffffffc020489c:	fce79de3          	bne	a5,a4,ffffffffc0204876 <wakeup_queue+0x84>
ffffffffc02048a0:	00009697          	auipc	a3,0x9
ffffffffc02048a4:	af868693          	addi	a3,a3,-1288 # ffffffffc020d398 <default_pmm_manager+0xb38>
ffffffffc02048a8:	00007617          	auipc	a2,0x7
ffffffffc02048ac:	49860613          	addi	a2,a2,1176 # ffffffffc020bd40 <commands+0x210>
ffffffffc02048b0:	45f1                	li	a1,28
ffffffffc02048b2:	00009517          	auipc	a0,0x9
ffffffffc02048b6:	ace50513          	addi	a0,a0,-1330 # ffffffffc020d380 <default_pmm_manager+0xb20>
ffffffffc02048ba:	be5fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02048be:	8082                	ret

ffffffffc02048c0 <wait_current_set>:
ffffffffc02048c0:	00092797          	auipc	a5,0x92
ffffffffc02048c4:	0007b783          	ld	a5,0(a5) # ffffffffc02968c0 <current>
ffffffffc02048c8:	c39d                	beqz	a5,ffffffffc02048ee <wait_current_set+0x2e>
ffffffffc02048ca:	01858713          	addi	a4,a1,24
ffffffffc02048ce:	800006b7          	lui	a3,0x80000
ffffffffc02048d2:	ed98                	sd	a4,24(a1)
ffffffffc02048d4:	e19c                	sd	a5,0(a1)
ffffffffc02048d6:	c594                	sw	a3,8(a1)
ffffffffc02048d8:	4685                	li	a3,1
ffffffffc02048da:	c394                	sw	a3,0(a5)
ffffffffc02048dc:	0ec7a623          	sw	a2,236(a5)
ffffffffc02048e0:	611c                	ld	a5,0(a0)
ffffffffc02048e2:	e988                	sd	a0,16(a1)
ffffffffc02048e4:	e118                	sd	a4,0(a0)
ffffffffc02048e6:	e798                	sd	a4,8(a5)
ffffffffc02048e8:	f188                	sd	a0,32(a1)
ffffffffc02048ea:	ed9c                	sd	a5,24(a1)
ffffffffc02048ec:	8082                	ret
ffffffffc02048ee:	1141                	addi	sp,sp,-16
ffffffffc02048f0:	00009697          	auipc	a3,0x9
ffffffffc02048f4:	ae868693          	addi	a3,a3,-1304 # ffffffffc020d3d8 <default_pmm_manager+0xb78>
ffffffffc02048f8:	00007617          	auipc	a2,0x7
ffffffffc02048fc:	44860613          	addi	a2,a2,1096 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204900:	07400593          	li	a1,116
ffffffffc0204904:	00009517          	auipc	a0,0x9
ffffffffc0204908:	a7c50513          	addi	a0,a0,-1412 # ffffffffc020d380 <default_pmm_manager+0xb20>
ffffffffc020490c:	e406                	sd	ra,8(sp)
ffffffffc020490e:	b91fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204912 <get_fd_array.part.0>:
ffffffffc0204912:	1141                	addi	sp,sp,-16
ffffffffc0204914:	00009697          	auipc	a3,0x9
ffffffffc0204918:	ad468693          	addi	a3,a3,-1324 # ffffffffc020d3e8 <default_pmm_manager+0xb88>
ffffffffc020491c:	00007617          	auipc	a2,0x7
ffffffffc0204920:	42460613          	addi	a2,a2,1060 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204924:	45d1                	li	a1,20
ffffffffc0204926:	00009517          	auipc	a0,0x9
ffffffffc020492a:	af250513          	addi	a0,a0,-1294 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc020492e:	e406                	sd	ra,8(sp)
ffffffffc0204930:	b6ffb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204934 <fd_array_alloc>:
ffffffffc0204934:	00092797          	auipc	a5,0x92
ffffffffc0204938:	f8c7b783          	ld	a5,-116(a5) # ffffffffc02968c0 <current>
ffffffffc020493c:	1487b783          	ld	a5,328(a5)
ffffffffc0204940:	1141                	addi	sp,sp,-16
ffffffffc0204942:	e406                	sd	ra,8(sp)
ffffffffc0204944:	c3a5                	beqz	a5,ffffffffc02049a4 <fd_array_alloc+0x70>
ffffffffc0204946:	4b98                	lw	a4,16(a5)
ffffffffc0204948:	04e05e63          	blez	a4,ffffffffc02049a4 <fd_array_alloc+0x70>
ffffffffc020494c:	775d                	lui	a4,0xffff7
ffffffffc020494e:	ad970713          	addi	a4,a4,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0204952:	679c                	ld	a5,8(a5)
ffffffffc0204954:	02e50863          	beq	a0,a4,ffffffffc0204984 <fd_array_alloc+0x50>
ffffffffc0204958:	04700713          	li	a4,71
ffffffffc020495c:	04a76263          	bltu	a4,a0,ffffffffc02049a0 <fd_array_alloc+0x6c>
ffffffffc0204960:	00351713          	slli	a4,a0,0x3
ffffffffc0204964:	40a70533          	sub	a0,a4,a0
ffffffffc0204968:	050e                	slli	a0,a0,0x3
ffffffffc020496a:	97aa                	add	a5,a5,a0
ffffffffc020496c:	4398                	lw	a4,0(a5)
ffffffffc020496e:	e71d                	bnez	a4,ffffffffc020499c <fd_array_alloc+0x68>
ffffffffc0204970:	5b88                	lw	a0,48(a5)
ffffffffc0204972:	e91d                	bnez	a0,ffffffffc02049a8 <fd_array_alloc+0x74>
ffffffffc0204974:	4705                	li	a4,1
ffffffffc0204976:	c398                	sw	a4,0(a5)
ffffffffc0204978:	0207b423          	sd	zero,40(a5)
ffffffffc020497c:	e19c                	sd	a5,0(a1)
ffffffffc020497e:	60a2                	ld	ra,8(sp)
ffffffffc0204980:	0141                	addi	sp,sp,16
ffffffffc0204982:	8082                	ret
ffffffffc0204984:	6685                	lui	a3,0x1
ffffffffc0204986:	fc068693          	addi	a3,a3,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc020498a:	96be                	add	a3,a3,a5
ffffffffc020498c:	4398                	lw	a4,0(a5)
ffffffffc020498e:	d36d                	beqz	a4,ffffffffc0204970 <fd_array_alloc+0x3c>
ffffffffc0204990:	03878793          	addi	a5,a5,56
ffffffffc0204994:	fef69ce3          	bne	a3,a5,ffffffffc020498c <fd_array_alloc+0x58>
ffffffffc0204998:	5529                	li	a0,-22
ffffffffc020499a:	b7d5                	j	ffffffffc020497e <fd_array_alloc+0x4a>
ffffffffc020499c:	5545                	li	a0,-15
ffffffffc020499e:	b7c5                	j	ffffffffc020497e <fd_array_alloc+0x4a>
ffffffffc02049a0:	5575                	li	a0,-3
ffffffffc02049a2:	bff1                	j	ffffffffc020497e <fd_array_alloc+0x4a>
ffffffffc02049a4:	f6fff0ef          	jal	ra,ffffffffc0204912 <get_fd_array.part.0>
ffffffffc02049a8:	00009697          	auipc	a3,0x9
ffffffffc02049ac:	a8068693          	addi	a3,a3,-1408 # ffffffffc020d428 <default_pmm_manager+0xbc8>
ffffffffc02049b0:	00007617          	auipc	a2,0x7
ffffffffc02049b4:	39060613          	addi	a2,a2,912 # ffffffffc020bd40 <commands+0x210>
ffffffffc02049b8:	03b00593          	li	a1,59
ffffffffc02049bc:	00009517          	auipc	a0,0x9
ffffffffc02049c0:	a5c50513          	addi	a0,a0,-1444 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc02049c4:	adbfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02049c8 <fd_array_free>:
ffffffffc02049c8:	411c                	lw	a5,0(a0)
ffffffffc02049ca:	1141                	addi	sp,sp,-16
ffffffffc02049cc:	e022                	sd	s0,0(sp)
ffffffffc02049ce:	e406                	sd	ra,8(sp)
ffffffffc02049d0:	4705                	li	a4,1
ffffffffc02049d2:	842a                	mv	s0,a0
ffffffffc02049d4:	04e78063          	beq	a5,a4,ffffffffc0204a14 <fd_array_free+0x4c>
ffffffffc02049d8:	470d                	li	a4,3
ffffffffc02049da:	04e79563          	bne	a5,a4,ffffffffc0204a24 <fd_array_free+0x5c>
ffffffffc02049de:	591c                	lw	a5,48(a0)
ffffffffc02049e0:	c38d                	beqz	a5,ffffffffc0204a02 <fd_array_free+0x3a>
ffffffffc02049e2:	00009697          	auipc	a3,0x9
ffffffffc02049e6:	a4668693          	addi	a3,a3,-1466 # ffffffffc020d428 <default_pmm_manager+0xbc8>
ffffffffc02049ea:	00007617          	auipc	a2,0x7
ffffffffc02049ee:	35660613          	addi	a2,a2,854 # ffffffffc020bd40 <commands+0x210>
ffffffffc02049f2:	04500593          	li	a1,69
ffffffffc02049f6:	00009517          	auipc	a0,0x9
ffffffffc02049fa:	a2250513          	addi	a0,a0,-1502 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc02049fe:	aa1fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204a02:	7408                	ld	a0,40(s0)
ffffffffc0204a04:	2af030ef          	jal	ra,ffffffffc02084b2 <vfs_close>
ffffffffc0204a08:	60a2                	ld	ra,8(sp)
ffffffffc0204a0a:	00042023          	sw	zero,0(s0)
ffffffffc0204a0e:	6402                	ld	s0,0(sp)
ffffffffc0204a10:	0141                	addi	sp,sp,16
ffffffffc0204a12:	8082                	ret
ffffffffc0204a14:	591c                	lw	a5,48(a0)
ffffffffc0204a16:	f7f1                	bnez	a5,ffffffffc02049e2 <fd_array_free+0x1a>
ffffffffc0204a18:	60a2                	ld	ra,8(sp)
ffffffffc0204a1a:	00042023          	sw	zero,0(s0)
ffffffffc0204a1e:	6402                	ld	s0,0(sp)
ffffffffc0204a20:	0141                	addi	sp,sp,16
ffffffffc0204a22:	8082                	ret
ffffffffc0204a24:	00009697          	auipc	a3,0x9
ffffffffc0204a28:	a3c68693          	addi	a3,a3,-1476 # ffffffffc020d460 <default_pmm_manager+0xc00>
ffffffffc0204a2c:	00007617          	auipc	a2,0x7
ffffffffc0204a30:	31460613          	addi	a2,a2,788 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204a34:	04400593          	li	a1,68
ffffffffc0204a38:	00009517          	auipc	a0,0x9
ffffffffc0204a3c:	9e050513          	addi	a0,a0,-1568 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc0204a40:	a5ffb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204a44 <fd_array_release>:
ffffffffc0204a44:	4118                	lw	a4,0(a0)
ffffffffc0204a46:	1141                	addi	sp,sp,-16
ffffffffc0204a48:	e406                	sd	ra,8(sp)
ffffffffc0204a4a:	4685                	li	a3,1
ffffffffc0204a4c:	3779                	addiw	a4,a4,-2
ffffffffc0204a4e:	04e6e063          	bltu	a3,a4,ffffffffc0204a8e <fd_array_release+0x4a>
ffffffffc0204a52:	5918                	lw	a4,48(a0)
ffffffffc0204a54:	00e05d63          	blez	a4,ffffffffc0204a6e <fd_array_release+0x2a>
ffffffffc0204a58:	fff7069b          	addiw	a3,a4,-1
ffffffffc0204a5c:	d914                	sw	a3,48(a0)
ffffffffc0204a5e:	c681                	beqz	a3,ffffffffc0204a66 <fd_array_release+0x22>
ffffffffc0204a60:	60a2                	ld	ra,8(sp)
ffffffffc0204a62:	0141                	addi	sp,sp,16
ffffffffc0204a64:	8082                	ret
ffffffffc0204a66:	60a2                	ld	ra,8(sp)
ffffffffc0204a68:	0141                	addi	sp,sp,16
ffffffffc0204a6a:	f5fff06f          	j	ffffffffc02049c8 <fd_array_free>
ffffffffc0204a6e:	00009697          	auipc	a3,0x9
ffffffffc0204a72:	a6268693          	addi	a3,a3,-1438 # ffffffffc020d4d0 <default_pmm_manager+0xc70>
ffffffffc0204a76:	00007617          	auipc	a2,0x7
ffffffffc0204a7a:	2ca60613          	addi	a2,a2,714 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204a7e:	05600593          	li	a1,86
ffffffffc0204a82:	00009517          	auipc	a0,0x9
ffffffffc0204a86:	99650513          	addi	a0,a0,-1642 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc0204a8a:	a15fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204a8e:	00009697          	auipc	a3,0x9
ffffffffc0204a92:	a0a68693          	addi	a3,a3,-1526 # ffffffffc020d498 <default_pmm_manager+0xc38>
ffffffffc0204a96:	00007617          	auipc	a2,0x7
ffffffffc0204a9a:	2aa60613          	addi	a2,a2,682 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204a9e:	05500593          	li	a1,85
ffffffffc0204aa2:	00009517          	auipc	a0,0x9
ffffffffc0204aa6:	97650513          	addi	a0,a0,-1674 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc0204aaa:	9f5fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204aae <fd_array_open.part.0>:
ffffffffc0204aae:	1141                	addi	sp,sp,-16
ffffffffc0204ab0:	00009697          	auipc	a3,0x9
ffffffffc0204ab4:	a3868693          	addi	a3,a3,-1480 # ffffffffc020d4e8 <default_pmm_manager+0xc88>
ffffffffc0204ab8:	00007617          	auipc	a2,0x7
ffffffffc0204abc:	28860613          	addi	a2,a2,648 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204ac0:	05f00593          	li	a1,95
ffffffffc0204ac4:	00009517          	auipc	a0,0x9
ffffffffc0204ac8:	95450513          	addi	a0,a0,-1708 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc0204acc:	e406                	sd	ra,8(sp)
ffffffffc0204ace:	9d1fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204ad2 <fd_array_init>:
ffffffffc0204ad2:	4781                	li	a5,0
ffffffffc0204ad4:	04800713          	li	a4,72
ffffffffc0204ad8:	cd1c                	sw	a5,24(a0)
ffffffffc0204ada:	02052823          	sw	zero,48(a0)
ffffffffc0204ade:	00052023          	sw	zero,0(a0)
ffffffffc0204ae2:	2785                	addiw	a5,a5,1
ffffffffc0204ae4:	03850513          	addi	a0,a0,56
ffffffffc0204ae8:	fee798e3          	bne	a5,a4,ffffffffc0204ad8 <fd_array_init+0x6>
ffffffffc0204aec:	8082                	ret

ffffffffc0204aee <fd_array_close>:
ffffffffc0204aee:	4118                	lw	a4,0(a0)
ffffffffc0204af0:	1141                	addi	sp,sp,-16
ffffffffc0204af2:	e406                	sd	ra,8(sp)
ffffffffc0204af4:	e022                	sd	s0,0(sp)
ffffffffc0204af6:	4789                	li	a5,2
ffffffffc0204af8:	04f71a63          	bne	a4,a5,ffffffffc0204b4c <fd_array_close+0x5e>
ffffffffc0204afc:	591c                	lw	a5,48(a0)
ffffffffc0204afe:	842a                	mv	s0,a0
ffffffffc0204b00:	02f05663          	blez	a5,ffffffffc0204b2c <fd_array_close+0x3e>
ffffffffc0204b04:	37fd                	addiw	a5,a5,-1
ffffffffc0204b06:	470d                	li	a4,3
ffffffffc0204b08:	c118                	sw	a4,0(a0)
ffffffffc0204b0a:	d91c                	sw	a5,48(a0)
ffffffffc0204b0c:	0007871b          	sext.w	a4,a5
ffffffffc0204b10:	c709                	beqz	a4,ffffffffc0204b1a <fd_array_close+0x2c>
ffffffffc0204b12:	60a2                	ld	ra,8(sp)
ffffffffc0204b14:	6402                	ld	s0,0(sp)
ffffffffc0204b16:	0141                	addi	sp,sp,16
ffffffffc0204b18:	8082                	ret
ffffffffc0204b1a:	7508                	ld	a0,40(a0)
ffffffffc0204b1c:	197030ef          	jal	ra,ffffffffc02084b2 <vfs_close>
ffffffffc0204b20:	60a2                	ld	ra,8(sp)
ffffffffc0204b22:	00042023          	sw	zero,0(s0)
ffffffffc0204b26:	6402                	ld	s0,0(sp)
ffffffffc0204b28:	0141                	addi	sp,sp,16
ffffffffc0204b2a:	8082                	ret
ffffffffc0204b2c:	00009697          	auipc	a3,0x9
ffffffffc0204b30:	9a468693          	addi	a3,a3,-1628 # ffffffffc020d4d0 <default_pmm_manager+0xc70>
ffffffffc0204b34:	00007617          	auipc	a2,0x7
ffffffffc0204b38:	20c60613          	addi	a2,a2,524 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204b3c:	06800593          	li	a1,104
ffffffffc0204b40:	00009517          	auipc	a0,0x9
ffffffffc0204b44:	8d850513          	addi	a0,a0,-1832 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc0204b48:	957fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204b4c:	00009697          	auipc	a3,0x9
ffffffffc0204b50:	8f468693          	addi	a3,a3,-1804 # ffffffffc020d440 <default_pmm_manager+0xbe0>
ffffffffc0204b54:	00007617          	auipc	a2,0x7
ffffffffc0204b58:	1ec60613          	addi	a2,a2,492 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204b5c:	06700593          	li	a1,103
ffffffffc0204b60:	00009517          	auipc	a0,0x9
ffffffffc0204b64:	8b850513          	addi	a0,a0,-1864 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc0204b68:	937fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204b6c <fd_array_dup>:
ffffffffc0204b6c:	7179                	addi	sp,sp,-48
ffffffffc0204b6e:	e84a                	sd	s2,16(sp)
ffffffffc0204b70:	00052903          	lw	s2,0(a0)
ffffffffc0204b74:	f406                	sd	ra,40(sp)
ffffffffc0204b76:	f022                	sd	s0,32(sp)
ffffffffc0204b78:	ec26                	sd	s1,24(sp)
ffffffffc0204b7a:	e44e                	sd	s3,8(sp)
ffffffffc0204b7c:	4785                	li	a5,1
ffffffffc0204b7e:	04f91663          	bne	s2,a5,ffffffffc0204bca <fd_array_dup+0x5e>
ffffffffc0204b82:	0005a983          	lw	s3,0(a1)
ffffffffc0204b86:	4789                	li	a5,2
ffffffffc0204b88:	04f99163          	bne	s3,a5,ffffffffc0204bca <fd_array_dup+0x5e>
ffffffffc0204b8c:	7584                	ld	s1,40(a1)
ffffffffc0204b8e:	699c                	ld	a5,16(a1)
ffffffffc0204b90:	7194                	ld	a3,32(a1)
ffffffffc0204b92:	6598                	ld	a4,8(a1)
ffffffffc0204b94:	842a                	mv	s0,a0
ffffffffc0204b96:	e91c                	sd	a5,16(a0)
ffffffffc0204b98:	f114                	sd	a3,32(a0)
ffffffffc0204b9a:	e518                	sd	a4,8(a0)
ffffffffc0204b9c:	8526                	mv	a0,s1
ffffffffc0204b9e:	072030ef          	jal	ra,ffffffffc0207c10 <inode_ref_inc>
ffffffffc0204ba2:	8526                	mv	a0,s1
ffffffffc0204ba4:	078030ef          	jal	ra,ffffffffc0207c1c <inode_open_inc>
ffffffffc0204ba8:	401c                	lw	a5,0(s0)
ffffffffc0204baa:	f404                	sd	s1,40(s0)
ffffffffc0204bac:	03279f63          	bne	a5,s2,ffffffffc0204bea <fd_array_dup+0x7e>
ffffffffc0204bb0:	cc8d                	beqz	s1,ffffffffc0204bea <fd_array_dup+0x7e>
ffffffffc0204bb2:	581c                	lw	a5,48(s0)
ffffffffc0204bb4:	01342023          	sw	s3,0(s0)
ffffffffc0204bb8:	70a2                	ld	ra,40(sp)
ffffffffc0204bba:	2785                	addiw	a5,a5,1
ffffffffc0204bbc:	d81c                	sw	a5,48(s0)
ffffffffc0204bbe:	7402                	ld	s0,32(sp)
ffffffffc0204bc0:	64e2                	ld	s1,24(sp)
ffffffffc0204bc2:	6942                	ld	s2,16(sp)
ffffffffc0204bc4:	69a2                	ld	s3,8(sp)
ffffffffc0204bc6:	6145                	addi	sp,sp,48
ffffffffc0204bc8:	8082                	ret
ffffffffc0204bca:	00009697          	auipc	a3,0x9
ffffffffc0204bce:	94e68693          	addi	a3,a3,-1714 # ffffffffc020d518 <default_pmm_manager+0xcb8>
ffffffffc0204bd2:	00007617          	auipc	a2,0x7
ffffffffc0204bd6:	16e60613          	addi	a2,a2,366 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204bda:	07300593          	li	a1,115
ffffffffc0204bde:	00009517          	auipc	a0,0x9
ffffffffc0204be2:	83a50513          	addi	a0,a0,-1990 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc0204be6:	8b9fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204bea:	ec5ff0ef          	jal	ra,ffffffffc0204aae <fd_array_open.part.0>

ffffffffc0204bee <file_testfd>:
ffffffffc0204bee:	04700793          	li	a5,71
ffffffffc0204bf2:	04a7e263          	bltu	a5,a0,ffffffffc0204c36 <file_testfd+0x48>
ffffffffc0204bf6:	00092797          	auipc	a5,0x92
ffffffffc0204bfa:	cca7b783          	ld	a5,-822(a5) # ffffffffc02968c0 <current>
ffffffffc0204bfe:	1487b783          	ld	a5,328(a5)
ffffffffc0204c02:	cf85                	beqz	a5,ffffffffc0204c3a <file_testfd+0x4c>
ffffffffc0204c04:	4b98                	lw	a4,16(a5)
ffffffffc0204c06:	02e05a63          	blez	a4,ffffffffc0204c3a <file_testfd+0x4c>
ffffffffc0204c0a:	6798                	ld	a4,8(a5)
ffffffffc0204c0c:	00351793          	slli	a5,a0,0x3
ffffffffc0204c10:	8f89                	sub	a5,a5,a0
ffffffffc0204c12:	078e                	slli	a5,a5,0x3
ffffffffc0204c14:	97ba                	add	a5,a5,a4
ffffffffc0204c16:	4394                	lw	a3,0(a5)
ffffffffc0204c18:	4709                	li	a4,2
ffffffffc0204c1a:	00e69e63          	bne	a3,a4,ffffffffc0204c36 <file_testfd+0x48>
ffffffffc0204c1e:	4f98                	lw	a4,24(a5)
ffffffffc0204c20:	00a71b63          	bne	a4,a0,ffffffffc0204c36 <file_testfd+0x48>
ffffffffc0204c24:	c199                	beqz	a1,ffffffffc0204c2a <file_testfd+0x3c>
ffffffffc0204c26:	6788                	ld	a0,8(a5)
ffffffffc0204c28:	c901                	beqz	a0,ffffffffc0204c38 <file_testfd+0x4a>
ffffffffc0204c2a:	4505                	li	a0,1
ffffffffc0204c2c:	c611                	beqz	a2,ffffffffc0204c38 <file_testfd+0x4a>
ffffffffc0204c2e:	6b88                	ld	a0,16(a5)
ffffffffc0204c30:	00a03533          	snez	a0,a0
ffffffffc0204c34:	8082                	ret
ffffffffc0204c36:	4501                	li	a0,0
ffffffffc0204c38:	8082                	ret
ffffffffc0204c3a:	1141                	addi	sp,sp,-16
ffffffffc0204c3c:	e406                	sd	ra,8(sp)
ffffffffc0204c3e:	cd5ff0ef          	jal	ra,ffffffffc0204912 <get_fd_array.part.0>

ffffffffc0204c42 <file_open>:
ffffffffc0204c42:	711d                	addi	sp,sp,-96
ffffffffc0204c44:	ec86                	sd	ra,88(sp)
ffffffffc0204c46:	e8a2                	sd	s0,80(sp)
ffffffffc0204c48:	e4a6                	sd	s1,72(sp)
ffffffffc0204c4a:	e0ca                	sd	s2,64(sp)
ffffffffc0204c4c:	fc4e                	sd	s3,56(sp)
ffffffffc0204c4e:	f852                	sd	s4,48(sp)
ffffffffc0204c50:	0035f793          	andi	a5,a1,3
ffffffffc0204c54:	470d                	li	a4,3
ffffffffc0204c56:	0ce78163          	beq	a5,a4,ffffffffc0204d18 <file_open+0xd6>
ffffffffc0204c5a:	078e                	slli	a5,a5,0x3
ffffffffc0204c5c:	00009717          	auipc	a4,0x9
ffffffffc0204c60:	b2c70713          	addi	a4,a4,-1236 # ffffffffc020d788 <CSWTCH.79>
ffffffffc0204c64:	892a                	mv	s2,a0
ffffffffc0204c66:	00009697          	auipc	a3,0x9
ffffffffc0204c6a:	b0a68693          	addi	a3,a3,-1270 # ffffffffc020d770 <CSWTCH.78>
ffffffffc0204c6e:	755d                	lui	a0,0xffff7
ffffffffc0204c70:	96be                	add	a3,a3,a5
ffffffffc0204c72:	84ae                	mv	s1,a1
ffffffffc0204c74:	97ba                	add	a5,a5,a4
ffffffffc0204c76:	858a                	mv	a1,sp
ffffffffc0204c78:	ad950513          	addi	a0,a0,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0204c7c:	0006ba03          	ld	s4,0(a3)
ffffffffc0204c80:	0007b983          	ld	s3,0(a5)
ffffffffc0204c84:	cb1ff0ef          	jal	ra,ffffffffc0204934 <fd_array_alloc>
ffffffffc0204c88:	842a                	mv	s0,a0
ffffffffc0204c8a:	c911                	beqz	a0,ffffffffc0204c9e <file_open+0x5c>
ffffffffc0204c8c:	60e6                	ld	ra,88(sp)
ffffffffc0204c8e:	8522                	mv	a0,s0
ffffffffc0204c90:	6446                	ld	s0,80(sp)
ffffffffc0204c92:	64a6                	ld	s1,72(sp)
ffffffffc0204c94:	6906                	ld	s2,64(sp)
ffffffffc0204c96:	79e2                	ld	s3,56(sp)
ffffffffc0204c98:	7a42                	ld	s4,48(sp)
ffffffffc0204c9a:	6125                	addi	sp,sp,96
ffffffffc0204c9c:	8082                	ret
ffffffffc0204c9e:	0030                	addi	a2,sp,8
ffffffffc0204ca0:	85a6                	mv	a1,s1
ffffffffc0204ca2:	854a                	mv	a0,s2
ffffffffc0204ca4:	668030ef          	jal	ra,ffffffffc020830c <vfs_open>
ffffffffc0204ca8:	842a                	mv	s0,a0
ffffffffc0204caa:	e13d                	bnez	a0,ffffffffc0204d10 <file_open+0xce>
ffffffffc0204cac:	6782                	ld	a5,0(sp)
ffffffffc0204cae:	0204f493          	andi	s1,s1,32
ffffffffc0204cb2:	6422                	ld	s0,8(sp)
ffffffffc0204cb4:	0207b023          	sd	zero,32(a5)
ffffffffc0204cb8:	c885                	beqz	s1,ffffffffc0204ce8 <file_open+0xa6>
ffffffffc0204cba:	c03d                	beqz	s0,ffffffffc0204d20 <file_open+0xde>
ffffffffc0204cbc:	783c                	ld	a5,112(s0)
ffffffffc0204cbe:	c3ad                	beqz	a5,ffffffffc0204d20 <file_open+0xde>
ffffffffc0204cc0:	779c                	ld	a5,40(a5)
ffffffffc0204cc2:	cfb9                	beqz	a5,ffffffffc0204d20 <file_open+0xde>
ffffffffc0204cc4:	8522                	mv	a0,s0
ffffffffc0204cc6:	00009597          	auipc	a1,0x9
ffffffffc0204cca:	8da58593          	addi	a1,a1,-1830 # ffffffffc020d5a0 <default_pmm_manager+0xd40>
ffffffffc0204cce:	75b020ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0204cd2:	783c                	ld	a5,112(s0)
ffffffffc0204cd4:	6522                	ld	a0,8(sp)
ffffffffc0204cd6:	080c                	addi	a1,sp,16
ffffffffc0204cd8:	779c                	ld	a5,40(a5)
ffffffffc0204cda:	9782                	jalr	a5
ffffffffc0204cdc:	842a                	mv	s0,a0
ffffffffc0204cde:	e515                	bnez	a0,ffffffffc0204d0a <file_open+0xc8>
ffffffffc0204ce0:	6782                	ld	a5,0(sp)
ffffffffc0204ce2:	7722                	ld	a4,40(sp)
ffffffffc0204ce4:	6422                	ld	s0,8(sp)
ffffffffc0204ce6:	f398                	sd	a4,32(a5)
ffffffffc0204ce8:	4394                	lw	a3,0(a5)
ffffffffc0204cea:	f780                	sd	s0,40(a5)
ffffffffc0204cec:	0147b423          	sd	s4,8(a5)
ffffffffc0204cf0:	0137b823          	sd	s3,16(a5)
ffffffffc0204cf4:	4705                	li	a4,1
ffffffffc0204cf6:	02e69363          	bne	a3,a4,ffffffffc0204d1c <file_open+0xda>
ffffffffc0204cfa:	c00d                	beqz	s0,ffffffffc0204d1c <file_open+0xda>
ffffffffc0204cfc:	5b98                	lw	a4,48(a5)
ffffffffc0204cfe:	4689                	li	a3,2
ffffffffc0204d00:	4f80                	lw	s0,24(a5)
ffffffffc0204d02:	2705                	addiw	a4,a4,1
ffffffffc0204d04:	c394                	sw	a3,0(a5)
ffffffffc0204d06:	db98                	sw	a4,48(a5)
ffffffffc0204d08:	b751                	j	ffffffffc0204c8c <file_open+0x4a>
ffffffffc0204d0a:	6522                	ld	a0,8(sp)
ffffffffc0204d0c:	7a6030ef          	jal	ra,ffffffffc02084b2 <vfs_close>
ffffffffc0204d10:	6502                	ld	a0,0(sp)
ffffffffc0204d12:	cb7ff0ef          	jal	ra,ffffffffc02049c8 <fd_array_free>
ffffffffc0204d16:	bf9d                	j	ffffffffc0204c8c <file_open+0x4a>
ffffffffc0204d18:	5475                	li	s0,-3
ffffffffc0204d1a:	bf8d                	j	ffffffffc0204c8c <file_open+0x4a>
ffffffffc0204d1c:	d93ff0ef          	jal	ra,ffffffffc0204aae <fd_array_open.part.0>
ffffffffc0204d20:	00009697          	auipc	a3,0x9
ffffffffc0204d24:	83068693          	addi	a3,a3,-2000 # ffffffffc020d550 <default_pmm_manager+0xcf0>
ffffffffc0204d28:	00007617          	auipc	a2,0x7
ffffffffc0204d2c:	01860613          	addi	a2,a2,24 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204d30:	0b500593          	li	a1,181
ffffffffc0204d34:	00008517          	auipc	a0,0x8
ffffffffc0204d38:	6e450513          	addi	a0,a0,1764 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc0204d3c:	f62fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204d40 <file_close>:
ffffffffc0204d40:	04700713          	li	a4,71
ffffffffc0204d44:	04a76563          	bltu	a4,a0,ffffffffc0204d8e <file_close+0x4e>
ffffffffc0204d48:	00092717          	auipc	a4,0x92
ffffffffc0204d4c:	b7873703          	ld	a4,-1160(a4) # ffffffffc02968c0 <current>
ffffffffc0204d50:	14873703          	ld	a4,328(a4)
ffffffffc0204d54:	1141                	addi	sp,sp,-16
ffffffffc0204d56:	e406                	sd	ra,8(sp)
ffffffffc0204d58:	cf0d                	beqz	a4,ffffffffc0204d92 <file_close+0x52>
ffffffffc0204d5a:	4b14                	lw	a3,16(a4)
ffffffffc0204d5c:	02d05b63          	blez	a3,ffffffffc0204d92 <file_close+0x52>
ffffffffc0204d60:	6718                	ld	a4,8(a4)
ffffffffc0204d62:	87aa                	mv	a5,a0
ffffffffc0204d64:	050e                	slli	a0,a0,0x3
ffffffffc0204d66:	8d1d                	sub	a0,a0,a5
ffffffffc0204d68:	050e                	slli	a0,a0,0x3
ffffffffc0204d6a:	953a                	add	a0,a0,a4
ffffffffc0204d6c:	4114                	lw	a3,0(a0)
ffffffffc0204d6e:	4709                	li	a4,2
ffffffffc0204d70:	00e69b63          	bne	a3,a4,ffffffffc0204d86 <file_close+0x46>
ffffffffc0204d74:	4d18                	lw	a4,24(a0)
ffffffffc0204d76:	00f71863          	bne	a4,a5,ffffffffc0204d86 <file_close+0x46>
ffffffffc0204d7a:	d75ff0ef          	jal	ra,ffffffffc0204aee <fd_array_close>
ffffffffc0204d7e:	60a2                	ld	ra,8(sp)
ffffffffc0204d80:	4501                	li	a0,0
ffffffffc0204d82:	0141                	addi	sp,sp,16
ffffffffc0204d84:	8082                	ret
ffffffffc0204d86:	60a2                	ld	ra,8(sp)
ffffffffc0204d88:	5575                	li	a0,-3
ffffffffc0204d8a:	0141                	addi	sp,sp,16
ffffffffc0204d8c:	8082                	ret
ffffffffc0204d8e:	5575                	li	a0,-3
ffffffffc0204d90:	8082                	ret
ffffffffc0204d92:	b81ff0ef          	jal	ra,ffffffffc0204912 <get_fd_array.part.0>

ffffffffc0204d96 <file_read>:
ffffffffc0204d96:	715d                	addi	sp,sp,-80
ffffffffc0204d98:	e486                	sd	ra,72(sp)
ffffffffc0204d9a:	e0a2                	sd	s0,64(sp)
ffffffffc0204d9c:	fc26                	sd	s1,56(sp)
ffffffffc0204d9e:	f84a                	sd	s2,48(sp)
ffffffffc0204da0:	f44e                	sd	s3,40(sp)
ffffffffc0204da2:	f052                	sd	s4,32(sp)
ffffffffc0204da4:	0006b023          	sd	zero,0(a3)
ffffffffc0204da8:	04700793          	li	a5,71
ffffffffc0204dac:	0aa7e463          	bltu	a5,a0,ffffffffc0204e54 <file_read+0xbe>
ffffffffc0204db0:	00092797          	auipc	a5,0x92
ffffffffc0204db4:	b107b783          	ld	a5,-1264(a5) # ffffffffc02968c0 <current>
ffffffffc0204db8:	1487b783          	ld	a5,328(a5)
ffffffffc0204dbc:	cfd1                	beqz	a5,ffffffffc0204e58 <file_read+0xc2>
ffffffffc0204dbe:	4b98                	lw	a4,16(a5)
ffffffffc0204dc0:	08e05c63          	blez	a4,ffffffffc0204e58 <file_read+0xc2>
ffffffffc0204dc4:	6780                	ld	s0,8(a5)
ffffffffc0204dc6:	00351793          	slli	a5,a0,0x3
ffffffffc0204dca:	8f89                	sub	a5,a5,a0
ffffffffc0204dcc:	078e                	slli	a5,a5,0x3
ffffffffc0204dce:	943e                	add	s0,s0,a5
ffffffffc0204dd0:	00042983          	lw	s3,0(s0)
ffffffffc0204dd4:	4789                	li	a5,2
ffffffffc0204dd6:	06f99f63          	bne	s3,a5,ffffffffc0204e54 <file_read+0xbe>
ffffffffc0204dda:	4c1c                	lw	a5,24(s0)
ffffffffc0204ddc:	06a79c63          	bne	a5,a0,ffffffffc0204e54 <file_read+0xbe>
ffffffffc0204de0:	641c                	ld	a5,8(s0)
ffffffffc0204de2:	cbad                	beqz	a5,ffffffffc0204e54 <file_read+0xbe>
ffffffffc0204de4:	581c                	lw	a5,48(s0)
ffffffffc0204de6:	8a36                	mv	s4,a3
ffffffffc0204de8:	7014                	ld	a3,32(s0)
ffffffffc0204dea:	2785                	addiw	a5,a5,1
ffffffffc0204dec:	850a                	mv	a0,sp
ffffffffc0204dee:	d81c                	sw	a5,48(s0)
ffffffffc0204df0:	726000ef          	jal	ra,ffffffffc0205516 <iobuf_init>
ffffffffc0204df4:	02843903          	ld	s2,40(s0)
ffffffffc0204df8:	84aa                	mv	s1,a0
ffffffffc0204dfa:	06090163          	beqz	s2,ffffffffc0204e5c <file_read+0xc6>
ffffffffc0204dfe:	07093783          	ld	a5,112(s2)
ffffffffc0204e02:	cfa9                	beqz	a5,ffffffffc0204e5c <file_read+0xc6>
ffffffffc0204e04:	6f9c                	ld	a5,24(a5)
ffffffffc0204e06:	cbb9                	beqz	a5,ffffffffc0204e5c <file_read+0xc6>
ffffffffc0204e08:	00008597          	auipc	a1,0x8
ffffffffc0204e0c:	7f058593          	addi	a1,a1,2032 # ffffffffc020d5f8 <default_pmm_manager+0xd98>
ffffffffc0204e10:	854a                	mv	a0,s2
ffffffffc0204e12:	617020ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0204e16:	07093783          	ld	a5,112(s2)
ffffffffc0204e1a:	7408                	ld	a0,40(s0)
ffffffffc0204e1c:	85a6                	mv	a1,s1
ffffffffc0204e1e:	6f9c                	ld	a5,24(a5)
ffffffffc0204e20:	9782                	jalr	a5
ffffffffc0204e22:	689c                	ld	a5,16(s1)
ffffffffc0204e24:	6c94                	ld	a3,24(s1)
ffffffffc0204e26:	4018                	lw	a4,0(s0)
ffffffffc0204e28:	84aa                	mv	s1,a0
ffffffffc0204e2a:	8f95                	sub	a5,a5,a3
ffffffffc0204e2c:	03370063          	beq	a4,s3,ffffffffc0204e4c <file_read+0xb6>
ffffffffc0204e30:	00fa3023          	sd	a5,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0204e34:	8522                	mv	a0,s0
ffffffffc0204e36:	c0fff0ef          	jal	ra,ffffffffc0204a44 <fd_array_release>
ffffffffc0204e3a:	60a6                	ld	ra,72(sp)
ffffffffc0204e3c:	6406                	ld	s0,64(sp)
ffffffffc0204e3e:	7942                	ld	s2,48(sp)
ffffffffc0204e40:	79a2                	ld	s3,40(sp)
ffffffffc0204e42:	7a02                	ld	s4,32(sp)
ffffffffc0204e44:	8526                	mv	a0,s1
ffffffffc0204e46:	74e2                	ld	s1,56(sp)
ffffffffc0204e48:	6161                	addi	sp,sp,80
ffffffffc0204e4a:	8082                	ret
ffffffffc0204e4c:	7018                	ld	a4,32(s0)
ffffffffc0204e4e:	973e                	add	a4,a4,a5
ffffffffc0204e50:	f018                	sd	a4,32(s0)
ffffffffc0204e52:	bff9                	j	ffffffffc0204e30 <file_read+0x9a>
ffffffffc0204e54:	54f5                	li	s1,-3
ffffffffc0204e56:	b7d5                	j	ffffffffc0204e3a <file_read+0xa4>
ffffffffc0204e58:	abbff0ef          	jal	ra,ffffffffc0204912 <get_fd_array.part.0>
ffffffffc0204e5c:	00008697          	auipc	a3,0x8
ffffffffc0204e60:	74c68693          	addi	a3,a3,1868 # ffffffffc020d5a8 <default_pmm_manager+0xd48>
ffffffffc0204e64:	00007617          	auipc	a2,0x7
ffffffffc0204e68:	edc60613          	addi	a2,a2,-292 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204e6c:	0de00593          	li	a1,222
ffffffffc0204e70:	00008517          	auipc	a0,0x8
ffffffffc0204e74:	5a850513          	addi	a0,a0,1448 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc0204e78:	e26fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204e7c <file_write>:
ffffffffc0204e7c:	715d                	addi	sp,sp,-80
ffffffffc0204e7e:	e486                	sd	ra,72(sp)
ffffffffc0204e80:	e0a2                	sd	s0,64(sp)
ffffffffc0204e82:	fc26                	sd	s1,56(sp)
ffffffffc0204e84:	f84a                	sd	s2,48(sp)
ffffffffc0204e86:	f44e                	sd	s3,40(sp)
ffffffffc0204e88:	f052                	sd	s4,32(sp)
ffffffffc0204e8a:	0006b023          	sd	zero,0(a3)
ffffffffc0204e8e:	04700793          	li	a5,71
ffffffffc0204e92:	0aa7e463          	bltu	a5,a0,ffffffffc0204f3a <file_write+0xbe>
ffffffffc0204e96:	00092797          	auipc	a5,0x92
ffffffffc0204e9a:	a2a7b783          	ld	a5,-1494(a5) # ffffffffc02968c0 <current>
ffffffffc0204e9e:	1487b783          	ld	a5,328(a5)
ffffffffc0204ea2:	cfd1                	beqz	a5,ffffffffc0204f3e <file_write+0xc2>
ffffffffc0204ea4:	4b98                	lw	a4,16(a5)
ffffffffc0204ea6:	08e05c63          	blez	a4,ffffffffc0204f3e <file_write+0xc2>
ffffffffc0204eaa:	6780                	ld	s0,8(a5)
ffffffffc0204eac:	00351793          	slli	a5,a0,0x3
ffffffffc0204eb0:	8f89                	sub	a5,a5,a0
ffffffffc0204eb2:	078e                	slli	a5,a5,0x3
ffffffffc0204eb4:	943e                	add	s0,s0,a5
ffffffffc0204eb6:	00042983          	lw	s3,0(s0)
ffffffffc0204eba:	4789                	li	a5,2
ffffffffc0204ebc:	06f99f63          	bne	s3,a5,ffffffffc0204f3a <file_write+0xbe>
ffffffffc0204ec0:	4c1c                	lw	a5,24(s0)
ffffffffc0204ec2:	06a79c63          	bne	a5,a0,ffffffffc0204f3a <file_write+0xbe>
ffffffffc0204ec6:	681c                	ld	a5,16(s0)
ffffffffc0204ec8:	cbad                	beqz	a5,ffffffffc0204f3a <file_write+0xbe>
ffffffffc0204eca:	581c                	lw	a5,48(s0)
ffffffffc0204ecc:	8a36                	mv	s4,a3
ffffffffc0204ece:	7014                	ld	a3,32(s0)
ffffffffc0204ed0:	2785                	addiw	a5,a5,1
ffffffffc0204ed2:	850a                	mv	a0,sp
ffffffffc0204ed4:	d81c                	sw	a5,48(s0)
ffffffffc0204ed6:	640000ef          	jal	ra,ffffffffc0205516 <iobuf_init>
ffffffffc0204eda:	02843903          	ld	s2,40(s0)
ffffffffc0204ede:	84aa                	mv	s1,a0
ffffffffc0204ee0:	06090163          	beqz	s2,ffffffffc0204f42 <file_write+0xc6>
ffffffffc0204ee4:	07093783          	ld	a5,112(s2)
ffffffffc0204ee8:	cfa9                	beqz	a5,ffffffffc0204f42 <file_write+0xc6>
ffffffffc0204eea:	739c                	ld	a5,32(a5)
ffffffffc0204eec:	cbb9                	beqz	a5,ffffffffc0204f42 <file_write+0xc6>
ffffffffc0204eee:	00008597          	auipc	a1,0x8
ffffffffc0204ef2:	76258593          	addi	a1,a1,1890 # ffffffffc020d650 <default_pmm_manager+0xdf0>
ffffffffc0204ef6:	854a                	mv	a0,s2
ffffffffc0204ef8:	531020ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0204efc:	07093783          	ld	a5,112(s2)
ffffffffc0204f00:	7408                	ld	a0,40(s0)
ffffffffc0204f02:	85a6                	mv	a1,s1
ffffffffc0204f04:	739c                	ld	a5,32(a5)
ffffffffc0204f06:	9782                	jalr	a5
ffffffffc0204f08:	689c                	ld	a5,16(s1)
ffffffffc0204f0a:	6c94                	ld	a3,24(s1)
ffffffffc0204f0c:	4018                	lw	a4,0(s0)
ffffffffc0204f0e:	84aa                	mv	s1,a0
ffffffffc0204f10:	8f95                	sub	a5,a5,a3
ffffffffc0204f12:	03370063          	beq	a4,s3,ffffffffc0204f32 <file_write+0xb6>
ffffffffc0204f16:	00fa3023          	sd	a5,0(s4)
ffffffffc0204f1a:	8522                	mv	a0,s0
ffffffffc0204f1c:	b29ff0ef          	jal	ra,ffffffffc0204a44 <fd_array_release>
ffffffffc0204f20:	60a6                	ld	ra,72(sp)
ffffffffc0204f22:	6406                	ld	s0,64(sp)
ffffffffc0204f24:	7942                	ld	s2,48(sp)
ffffffffc0204f26:	79a2                	ld	s3,40(sp)
ffffffffc0204f28:	7a02                	ld	s4,32(sp)
ffffffffc0204f2a:	8526                	mv	a0,s1
ffffffffc0204f2c:	74e2                	ld	s1,56(sp)
ffffffffc0204f2e:	6161                	addi	sp,sp,80
ffffffffc0204f30:	8082                	ret
ffffffffc0204f32:	7018                	ld	a4,32(s0)
ffffffffc0204f34:	973e                	add	a4,a4,a5
ffffffffc0204f36:	f018                	sd	a4,32(s0)
ffffffffc0204f38:	bff9                	j	ffffffffc0204f16 <file_write+0x9a>
ffffffffc0204f3a:	54f5                	li	s1,-3
ffffffffc0204f3c:	b7d5                	j	ffffffffc0204f20 <file_write+0xa4>
ffffffffc0204f3e:	9d5ff0ef          	jal	ra,ffffffffc0204912 <get_fd_array.part.0>
ffffffffc0204f42:	00008697          	auipc	a3,0x8
ffffffffc0204f46:	6be68693          	addi	a3,a3,1726 # ffffffffc020d600 <default_pmm_manager+0xda0>
ffffffffc0204f4a:	00007617          	auipc	a2,0x7
ffffffffc0204f4e:	df660613          	addi	a2,a2,-522 # ffffffffc020bd40 <commands+0x210>
ffffffffc0204f52:	0f800593          	li	a1,248
ffffffffc0204f56:	00008517          	auipc	a0,0x8
ffffffffc0204f5a:	4c250513          	addi	a0,a0,1218 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc0204f5e:	d40fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204f62 <file_seek>:
ffffffffc0204f62:	7139                	addi	sp,sp,-64
ffffffffc0204f64:	fc06                	sd	ra,56(sp)
ffffffffc0204f66:	f822                	sd	s0,48(sp)
ffffffffc0204f68:	f426                	sd	s1,40(sp)
ffffffffc0204f6a:	f04a                	sd	s2,32(sp)
ffffffffc0204f6c:	04700793          	li	a5,71
ffffffffc0204f70:	08a7e863          	bltu	a5,a0,ffffffffc0205000 <file_seek+0x9e>
ffffffffc0204f74:	00092797          	auipc	a5,0x92
ffffffffc0204f78:	94c7b783          	ld	a5,-1716(a5) # ffffffffc02968c0 <current>
ffffffffc0204f7c:	1487b783          	ld	a5,328(a5)
ffffffffc0204f80:	cfdd                	beqz	a5,ffffffffc020503e <file_seek+0xdc>
ffffffffc0204f82:	4b98                	lw	a4,16(a5)
ffffffffc0204f84:	0ae05d63          	blez	a4,ffffffffc020503e <file_seek+0xdc>
ffffffffc0204f88:	6780                	ld	s0,8(a5)
ffffffffc0204f8a:	00351793          	slli	a5,a0,0x3
ffffffffc0204f8e:	8f89                	sub	a5,a5,a0
ffffffffc0204f90:	078e                	slli	a5,a5,0x3
ffffffffc0204f92:	943e                	add	s0,s0,a5
ffffffffc0204f94:	4018                	lw	a4,0(s0)
ffffffffc0204f96:	4789                	li	a5,2
ffffffffc0204f98:	06f71463          	bne	a4,a5,ffffffffc0205000 <file_seek+0x9e>
ffffffffc0204f9c:	4c1c                	lw	a5,24(s0)
ffffffffc0204f9e:	06a79163          	bne	a5,a0,ffffffffc0205000 <file_seek+0x9e>
ffffffffc0204fa2:	581c                	lw	a5,48(s0)
ffffffffc0204fa4:	4685                	li	a3,1
ffffffffc0204fa6:	892e                	mv	s2,a1
ffffffffc0204fa8:	2785                	addiw	a5,a5,1
ffffffffc0204faa:	d81c                	sw	a5,48(s0)
ffffffffc0204fac:	02d60063          	beq	a2,a3,ffffffffc0204fcc <file_seek+0x6a>
ffffffffc0204fb0:	06e60063          	beq	a2,a4,ffffffffc0205010 <file_seek+0xae>
ffffffffc0204fb4:	54f5                	li	s1,-3
ffffffffc0204fb6:	ce11                	beqz	a2,ffffffffc0204fd2 <file_seek+0x70>
ffffffffc0204fb8:	8522                	mv	a0,s0
ffffffffc0204fba:	a8bff0ef          	jal	ra,ffffffffc0204a44 <fd_array_release>
ffffffffc0204fbe:	70e2                	ld	ra,56(sp)
ffffffffc0204fc0:	7442                	ld	s0,48(sp)
ffffffffc0204fc2:	7902                	ld	s2,32(sp)
ffffffffc0204fc4:	8526                	mv	a0,s1
ffffffffc0204fc6:	74a2                	ld	s1,40(sp)
ffffffffc0204fc8:	6121                	addi	sp,sp,64
ffffffffc0204fca:	8082                	ret
ffffffffc0204fcc:	701c                	ld	a5,32(s0)
ffffffffc0204fce:	00f58933          	add	s2,a1,a5
ffffffffc0204fd2:	7404                	ld	s1,40(s0)
ffffffffc0204fd4:	c4bd                	beqz	s1,ffffffffc0205042 <file_seek+0xe0>
ffffffffc0204fd6:	78bc                	ld	a5,112(s1)
ffffffffc0204fd8:	c7ad                	beqz	a5,ffffffffc0205042 <file_seek+0xe0>
ffffffffc0204fda:	6fbc                	ld	a5,88(a5)
ffffffffc0204fdc:	c3bd                	beqz	a5,ffffffffc0205042 <file_seek+0xe0>
ffffffffc0204fde:	8526                	mv	a0,s1
ffffffffc0204fe0:	00008597          	auipc	a1,0x8
ffffffffc0204fe4:	6c858593          	addi	a1,a1,1736 # ffffffffc020d6a8 <default_pmm_manager+0xe48>
ffffffffc0204fe8:	441020ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0204fec:	78bc                	ld	a5,112(s1)
ffffffffc0204fee:	7408                	ld	a0,40(s0)
ffffffffc0204ff0:	85ca                	mv	a1,s2
ffffffffc0204ff2:	6fbc                	ld	a5,88(a5)
ffffffffc0204ff4:	9782                	jalr	a5
ffffffffc0204ff6:	84aa                	mv	s1,a0
ffffffffc0204ff8:	f161                	bnez	a0,ffffffffc0204fb8 <file_seek+0x56>
ffffffffc0204ffa:	03243023          	sd	s2,32(s0)
ffffffffc0204ffe:	bf6d                	j	ffffffffc0204fb8 <file_seek+0x56>
ffffffffc0205000:	70e2                	ld	ra,56(sp)
ffffffffc0205002:	7442                	ld	s0,48(sp)
ffffffffc0205004:	54f5                	li	s1,-3
ffffffffc0205006:	7902                	ld	s2,32(sp)
ffffffffc0205008:	8526                	mv	a0,s1
ffffffffc020500a:	74a2                	ld	s1,40(sp)
ffffffffc020500c:	6121                	addi	sp,sp,64
ffffffffc020500e:	8082                	ret
ffffffffc0205010:	7404                	ld	s1,40(s0)
ffffffffc0205012:	c8a1                	beqz	s1,ffffffffc0205062 <file_seek+0x100>
ffffffffc0205014:	78bc                	ld	a5,112(s1)
ffffffffc0205016:	c7b1                	beqz	a5,ffffffffc0205062 <file_seek+0x100>
ffffffffc0205018:	779c                	ld	a5,40(a5)
ffffffffc020501a:	c7a1                	beqz	a5,ffffffffc0205062 <file_seek+0x100>
ffffffffc020501c:	8526                	mv	a0,s1
ffffffffc020501e:	00008597          	auipc	a1,0x8
ffffffffc0205022:	58258593          	addi	a1,a1,1410 # ffffffffc020d5a0 <default_pmm_manager+0xd40>
ffffffffc0205026:	403020ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc020502a:	78bc                	ld	a5,112(s1)
ffffffffc020502c:	7408                	ld	a0,40(s0)
ffffffffc020502e:	858a                	mv	a1,sp
ffffffffc0205030:	779c                	ld	a5,40(a5)
ffffffffc0205032:	9782                	jalr	a5
ffffffffc0205034:	84aa                	mv	s1,a0
ffffffffc0205036:	f149                	bnez	a0,ffffffffc0204fb8 <file_seek+0x56>
ffffffffc0205038:	67e2                	ld	a5,24(sp)
ffffffffc020503a:	993e                	add	s2,s2,a5
ffffffffc020503c:	bf59                	j	ffffffffc0204fd2 <file_seek+0x70>
ffffffffc020503e:	8d5ff0ef          	jal	ra,ffffffffc0204912 <get_fd_array.part.0>
ffffffffc0205042:	00008697          	auipc	a3,0x8
ffffffffc0205046:	61668693          	addi	a3,a3,1558 # ffffffffc020d658 <default_pmm_manager+0xdf8>
ffffffffc020504a:	00007617          	auipc	a2,0x7
ffffffffc020504e:	cf660613          	addi	a2,a2,-778 # ffffffffc020bd40 <commands+0x210>
ffffffffc0205052:	11a00593          	li	a1,282
ffffffffc0205056:	00008517          	auipc	a0,0x8
ffffffffc020505a:	3c250513          	addi	a0,a0,962 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc020505e:	c40fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205062:	00008697          	auipc	a3,0x8
ffffffffc0205066:	4ee68693          	addi	a3,a3,1262 # ffffffffc020d550 <default_pmm_manager+0xcf0>
ffffffffc020506a:	00007617          	auipc	a2,0x7
ffffffffc020506e:	cd660613          	addi	a2,a2,-810 # ffffffffc020bd40 <commands+0x210>
ffffffffc0205072:	11200593          	li	a1,274
ffffffffc0205076:	00008517          	auipc	a0,0x8
ffffffffc020507a:	3a250513          	addi	a0,a0,930 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc020507e:	c20fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205082 <file_fstat>:
ffffffffc0205082:	1101                	addi	sp,sp,-32
ffffffffc0205084:	ec06                	sd	ra,24(sp)
ffffffffc0205086:	e822                	sd	s0,16(sp)
ffffffffc0205088:	e426                	sd	s1,8(sp)
ffffffffc020508a:	e04a                	sd	s2,0(sp)
ffffffffc020508c:	04700793          	li	a5,71
ffffffffc0205090:	06a7ef63          	bltu	a5,a0,ffffffffc020510e <file_fstat+0x8c>
ffffffffc0205094:	00092797          	auipc	a5,0x92
ffffffffc0205098:	82c7b783          	ld	a5,-2004(a5) # ffffffffc02968c0 <current>
ffffffffc020509c:	1487b783          	ld	a5,328(a5)
ffffffffc02050a0:	cfd9                	beqz	a5,ffffffffc020513e <file_fstat+0xbc>
ffffffffc02050a2:	4b98                	lw	a4,16(a5)
ffffffffc02050a4:	08e05d63          	blez	a4,ffffffffc020513e <file_fstat+0xbc>
ffffffffc02050a8:	6780                	ld	s0,8(a5)
ffffffffc02050aa:	00351793          	slli	a5,a0,0x3
ffffffffc02050ae:	8f89                	sub	a5,a5,a0
ffffffffc02050b0:	078e                	slli	a5,a5,0x3
ffffffffc02050b2:	943e                	add	s0,s0,a5
ffffffffc02050b4:	4018                	lw	a4,0(s0)
ffffffffc02050b6:	4789                	li	a5,2
ffffffffc02050b8:	04f71b63          	bne	a4,a5,ffffffffc020510e <file_fstat+0x8c>
ffffffffc02050bc:	4c1c                	lw	a5,24(s0)
ffffffffc02050be:	04a79863          	bne	a5,a0,ffffffffc020510e <file_fstat+0x8c>
ffffffffc02050c2:	581c                	lw	a5,48(s0)
ffffffffc02050c4:	02843903          	ld	s2,40(s0)
ffffffffc02050c8:	2785                	addiw	a5,a5,1
ffffffffc02050ca:	d81c                	sw	a5,48(s0)
ffffffffc02050cc:	04090963          	beqz	s2,ffffffffc020511e <file_fstat+0x9c>
ffffffffc02050d0:	07093783          	ld	a5,112(s2)
ffffffffc02050d4:	c7a9                	beqz	a5,ffffffffc020511e <file_fstat+0x9c>
ffffffffc02050d6:	779c                	ld	a5,40(a5)
ffffffffc02050d8:	c3b9                	beqz	a5,ffffffffc020511e <file_fstat+0x9c>
ffffffffc02050da:	84ae                	mv	s1,a1
ffffffffc02050dc:	854a                	mv	a0,s2
ffffffffc02050de:	00008597          	auipc	a1,0x8
ffffffffc02050e2:	4c258593          	addi	a1,a1,1218 # ffffffffc020d5a0 <default_pmm_manager+0xd40>
ffffffffc02050e6:	343020ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc02050ea:	07093783          	ld	a5,112(s2)
ffffffffc02050ee:	7408                	ld	a0,40(s0)
ffffffffc02050f0:	85a6                	mv	a1,s1
ffffffffc02050f2:	779c                	ld	a5,40(a5)
ffffffffc02050f4:	9782                	jalr	a5
ffffffffc02050f6:	87aa                	mv	a5,a0
ffffffffc02050f8:	8522                	mv	a0,s0
ffffffffc02050fa:	843e                	mv	s0,a5
ffffffffc02050fc:	949ff0ef          	jal	ra,ffffffffc0204a44 <fd_array_release>
ffffffffc0205100:	60e2                	ld	ra,24(sp)
ffffffffc0205102:	8522                	mv	a0,s0
ffffffffc0205104:	6442                	ld	s0,16(sp)
ffffffffc0205106:	64a2                	ld	s1,8(sp)
ffffffffc0205108:	6902                	ld	s2,0(sp)
ffffffffc020510a:	6105                	addi	sp,sp,32
ffffffffc020510c:	8082                	ret
ffffffffc020510e:	5475                	li	s0,-3
ffffffffc0205110:	60e2                	ld	ra,24(sp)
ffffffffc0205112:	8522                	mv	a0,s0
ffffffffc0205114:	6442                	ld	s0,16(sp)
ffffffffc0205116:	64a2                	ld	s1,8(sp)
ffffffffc0205118:	6902                	ld	s2,0(sp)
ffffffffc020511a:	6105                	addi	sp,sp,32
ffffffffc020511c:	8082                	ret
ffffffffc020511e:	00008697          	auipc	a3,0x8
ffffffffc0205122:	43268693          	addi	a3,a3,1074 # ffffffffc020d550 <default_pmm_manager+0xcf0>
ffffffffc0205126:	00007617          	auipc	a2,0x7
ffffffffc020512a:	c1a60613          	addi	a2,a2,-998 # ffffffffc020bd40 <commands+0x210>
ffffffffc020512e:	12c00593          	li	a1,300
ffffffffc0205132:	00008517          	auipc	a0,0x8
ffffffffc0205136:	2e650513          	addi	a0,a0,742 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc020513a:	b64fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020513e:	fd4ff0ef          	jal	ra,ffffffffc0204912 <get_fd_array.part.0>

ffffffffc0205142 <file_fsync>:
ffffffffc0205142:	1101                	addi	sp,sp,-32
ffffffffc0205144:	ec06                	sd	ra,24(sp)
ffffffffc0205146:	e822                	sd	s0,16(sp)
ffffffffc0205148:	e426                	sd	s1,8(sp)
ffffffffc020514a:	04700793          	li	a5,71
ffffffffc020514e:	06a7e863          	bltu	a5,a0,ffffffffc02051be <file_fsync+0x7c>
ffffffffc0205152:	00091797          	auipc	a5,0x91
ffffffffc0205156:	76e7b783          	ld	a5,1902(a5) # ffffffffc02968c0 <current>
ffffffffc020515a:	1487b783          	ld	a5,328(a5)
ffffffffc020515e:	c7d9                	beqz	a5,ffffffffc02051ec <file_fsync+0xaa>
ffffffffc0205160:	4b98                	lw	a4,16(a5)
ffffffffc0205162:	08e05563          	blez	a4,ffffffffc02051ec <file_fsync+0xaa>
ffffffffc0205166:	6780                	ld	s0,8(a5)
ffffffffc0205168:	00351793          	slli	a5,a0,0x3
ffffffffc020516c:	8f89                	sub	a5,a5,a0
ffffffffc020516e:	078e                	slli	a5,a5,0x3
ffffffffc0205170:	943e                	add	s0,s0,a5
ffffffffc0205172:	4018                	lw	a4,0(s0)
ffffffffc0205174:	4789                	li	a5,2
ffffffffc0205176:	04f71463          	bne	a4,a5,ffffffffc02051be <file_fsync+0x7c>
ffffffffc020517a:	4c1c                	lw	a5,24(s0)
ffffffffc020517c:	04a79163          	bne	a5,a0,ffffffffc02051be <file_fsync+0x7c>
ffffffffc0205180:	581c                	lw	a5,48(s0)
ffffffffc0205182:	7404                	ld	s1,40(s0)
ffffffffc0205184:	2785                	addiw	a5,a5,1
ffffffffc0205186:	d81c                	sw	a5,48(s0)
ffffffffc0205188:	c0b1                	beqz	s1,ffffffffc02051cc <file_fsync+0x8a>
ffffffffc020518a:	78bc                	ld	a5,112(s1)
ffffffffc020518c:	c3a1                	beqz	a5,ffffffffc02051cc <file_fsync+0x8a>
ffffffffc020518e:	7b9c                	ld	a5,48(a5)
ffffffffc0205190:	cf95                	beqz	a5,ffffffffc02051cc <file_fsync+0x8a>
ffffffffc0205192:	00008597          	auipc	a1,0x8
ffffffffc0205196:	56e58593          	addi	a1,a1,1390 # ffffffffc020d700 <default_pmm_manager+0xea0>
ffffffffc020519a:	8526                	mv	a0,s1
ffffffffc020519c:	28d020ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc02051a0:	78bc                	ld	a5,112(s1)
ffffffffc02051a2:	7408                	ld	a0,40(s0)
ffffffffc02051a4:	7b9c                	ld	a5,48(a5)
ffffffffc02051a6:	9782                	jalr	a5
ffffffffc02051a8:	87aa                	mv	a5,a0
ffffffffc02051aa:	8522                	mv	a0,s0
ffffffffc02051ac:	843e                	mv	s0,a5
ffffffffc02051ae:	897ff0ef          	jal	ra,ffffffffc0204a44 <fd_array_release>
ffffffffc02051b2:	60e2                	ld	ra,24(sp)
ffffffffc02051b4:	8522                	mv	a0,s0
ffffffffc02051b6:	6442                	ld	s0,16(sp)
ffffffffc02051b8:	64a2                	ld	s1,8(sp)
ffffffffc02051ba:	6105                	addi	sp,sp,32
ffffffffc02051bc:	8082                	ret
ffffffffc02051be:	5475                	li	s0,-3
ffffffffc02051c0:	60e2                	ld	ra,24(sp)
ffffffffc02051c2:	8522                	mv	a0,s0
ffffffffc02051c4:	6442                	ld	s0,16(sp)
ffffffffc02051c6:	64a2                	ld	s1,8(sp)
ffffffffc02051c8:	6105                	addi	sp,sp,32
ffffffffc02051ca:	8082                	ret
ffffffffc02051cc:	00008697          	auipc	a3,0x8
ffffffffc02051d0:	4e468693          	addi	a3,a3,1252 # ffffffffc020d6b0 <default_pmm_manager+0xe50>
ffffffffc02051d4:	00007617          	auipc	a2,0x7
ffffffffc02051d8:	b6c60613          	addi	a2,a2,-1172 # ffffffffc020bd40 <commands+0x210>
ffffffffc02051dc:	13a00593          	li	a1,314
ffffffffc02051e0:	00008517          	auipc	a0,0x8
ffffffffc02051e4:	23850513          	addi	a0,a0,568 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc02051e8:	ab6fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02051ec:	f26ff0ef          	jal	ra,ffffffffc0204912 <get_fd_array.part.0>

ffffffffc02051f0 <file_getdirentry>:
ffffffffc02051f0:	715d                	addi	sp,sp,-80
ffffffffc02051f2:	e486                	sd	ra,72(sp)
ffffffffc02051f4:	e0a2                	sd	s0,64(sp)
ffffffffc02051f6:	fc26                	sd	s1,56(sp)
ffffffffc02051f8:	f84a                	sd	s2,48(sp)
ffffffffc02051fa:	f44e                	sd	s3,40(sp)
ffffffffc02051fc:	04700793          	li	a5,71
ffffffffc0205200:	0aa7e063          	bltu	a5,a0,ffffffffc02052a0 <file_getdirentry+0xb0>
ffffffffc0205204:	00091797          	auipc	a5,0x91
ffffffffc0205208:	6bc7b783          	ld	a5,1724(a5) # ffffffffc02968c0 <current>
ffffffffc020520c:	1487b783          	ld	a5,328(a5)
ffffffffc0205210:	c3e9                	beqz	a5,ffffffffc02052d2 <file_getdirentry+0xe2>
ffffffffc0205212:	4b98                	lw	a4,16(a5)
ffffffffc0205214:	0ae05f63          	blez	a4,ffffffffc02052d2 <file_getdirentry+0xe2>
ffffffffc0205218:	6780                	ld	s0,8(a5)
ffffffffc020521a:	00351793          	slli	a5,a0,0x3
ffffffffc020521e:	8f89                	sub	a5,a5,a0
ffffffffc0205220:	078e                	slli	a5,a5,0x3
ffffffffc0205222:	943e                	add	s0,s0,a5
ffffffffc0205224:	4018                	lw	a4,0(s0)
ffffffffc0205226:	4789                	li	a5,2
ffffffffc0205228:	06f71c63          	bne	a4,a5,ffffffffc02052a0 <file_getdirentry+0xb0>
ffffffffc020522c:	4c1c                	lw	a5,24(s0)
ffffffffc020522e:	06a79963          	bne	a5,a0,ffffffffc02052a0 <file_getdirentry+0xb0>
ffffffffc0205232:	581c                	lw	a5,48(s0)
ffffffffc0205234:	6194                	ld	a3,0(a1)
ffffffffc0205236:	84ae                	mv	s1,a1
ffffffffc0205238:	2785                	addiw	a5,a5,1
ffffffffc020523a:	10000613          	li	a2,256
ffffffffc020523e:	d81c                	sw	a5,48(s0)
ffffffffc0205240:	05a1                	addi	a1,a1,8
ffffffffc0205242:	850a                	mv	a0,sp
ffffffffc0205244:	2d2000ef          	jal	ra,ffffffffc0205516 <iobuf_init>
ffffffffc0205248:	02843983          	ld	s3,40(s0)
ffffffffc020524c:	892a                	mv	s2,a0
ffffffffc020524e:	06098263          	beqz	s3,ffffffffc02052b2 <file_getdirentry+0xc2>
ffffffffc0205252:	0709b783          	ld	a5,112(s3) # 1070 <_binary_bin_swap_img_size-0x6c90>
ffffffffc0205256:	cfb1                	beqz	a5,ffffffffc02052b2 <file_getdirentry+0xc2>
ffffffffc0205258:	63bc                	ld	a5,64(a5)
ffffffffc020525a:	cfa1                	beqz	a5,ffffffffc02052b2 <file_getdirentry+0xc2>
ffffffffc020525c:	854e                	mv	a0,s3
ffffffffc020525e:	00008597          	auipc	a1,0x8
ffffffffc0205262:	50258593          	addi	a1,a1,1282 # ffffffffc020d760 <default_pmm_manager+0xf00>
ffffffffc0205266:	1c3020ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc020526a:	0709b783          	ld	a5,112(s3)
ffffffffc020526e:	7408                	ld	a0,40(s0)
ffffffffc0205270:	85ca                	mv	a1,s2
ffffffffc0205272:	63bc                	ld	a5,64(a5)
ffffffffc0205274:	9782                	jalr	a5
ffffffffc0205276:	89aa                	mv	s3,a0
ffffffffc0205278:	e909                	bnez	a0,ffffffffc020528a <file_getdirentry+0x9a>
ffffffffc020527a:	609c                	ld	a5,0(s1)
ffffffffc020527c:	01093683          	ld	a3,16(s2)
ffffffffc0205280:	01893703          	ld	a4,24(s2)
ffffffffc0205284:	97b6                	add	a5,a5,a3
ffffffffc0205286:	8f99                	sub	a5,a5,a4
ffffffffc0205288:	e09c                	sd	a5,0(s1)
ffffffffc020528a:	8522                	mv	a0,s0
ffffffffc020528c:	fb8ff0ef          	jal	ra,ffffffffc0204a44 <fd_array_release>
ffffffffc0205290:	60a6                	ld	ra,72(sp)
ffffffffc0205292:	6406                	ld	s0,64(sp)
ffffffffc0205294:	74e2                	ld	s1,56(sp)
ffffffffc0205296:	7942                	ld	s2,48(sp)
ffffffffc0205298:	854e                	mv	a0,s3
ffffffffc020529a:	79a2                	ld	s3,40(sp)
ffffffffc020529c:	6161                	addi	sp,sp,80
ffffffffc020529e:	8082                	ret
ffffffffc02052a0:	60a6                	ld	ra,72(sp)
ffffffffc02052a2:	6406                	ld	s0,64(sp)
ffffffffc02052a4:	59f5                	li	s3,-3
ffffffffc02052a6:	74e2                	ld	s1,56(sp)
ffffffffc02052a8:	7942                	ld	s2,48(sp)
ffffffffc02052aa:	854e                	mv	a0,s3
ffffffffc02052ac:	79a2                	ld	s3,40(sp)
ffffffffc02052ae:	6161                	addi	sp,sp,80
ffffffffc02052b0:	8082                	ret
ffffffffc02052b2:	00008697          	auipc	a3,0x8
ffffffffc02052b6:	45668693          	addi	a3,a3,1110 # ffffffffc020d708 <default_pmm_manager+0xea8>
ffffffffc02052ba:	00007617          	auipc	a2,0x7
ffffffffc02052be:	a8660613          	addi	a2,a2,-1402 # ffffffffc020bd40 <commands+0x210>
ffffffffc02052c2:	14a00593          	li	a1,330
ffffffffc02052c6:	00008517          	auipc	a0,0x8
ffffffffc02052ca:	15250513          	addi	a0,a0,338 # ffffffffc020d418 <default_pmm_manager+0xbb8>
ffffffffc02052ce:	9d0fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02052d2:	e40ff0ef          	jal	ra,ffffffffc0204912 <get_fd_array.part.0>

ffffffffc02052d6 <file_dup>:
ffffffffc02052d6:	04700713          	li	a4,71
ffffffffc02052da:	06a76463          	bltu	a4,a0,ffffffffc0205342 <file_dup+0x6c>
ffffffffc02052de:	00091717          	auipc	a4,0x91
ffffffffc02052e2:	5e273703          	ld	a4,1506(a4) # ffffffffc02968c0 <current>
ffffffffc02052e6:	14873703          	ld	a4,328(a4)
ffffffffc02052ea:	1101                	addi	sp,sp,-32
ffffffffc02052ec:	ec06                	sd	ra,24(sp)
ffffffffc02052ee:	e822                	sd	s0,16(sp)
ffffffffc02052f0:	cb39                	beqz	a4,ffffffffc0205346 <file_dup+0x70>
ffffffffc02052f2:	4b14                	lw	a3,16(a4)
ffffffffc02052f4:	04d05963          	blez	a3,ffffffffc0205346 <file_dup+0x70>
ffffffffc02052f8:	6700                	ld	s0,8(a4)
ffffffffc02052fa:	00351713          	slli	a4,a0,0x3
ffffffffc02052fe:	8f09                	sub	a4,a4,a0
ffffffffc0205300:	070e                	slli	a4,a4,0x3
ffffffffc0205302:	943a                	add	s0,s0,a4
ffffffffc0205304:	4014                	lw	a3,0(s0)
ffffffffc0205306:	4709                	li	a4,2
ffffffffc0205308:	02e69863          	bne	a3,a4,ffffffffc0205338 <file_dup+0x62>
ffffffffc020530c:	4c18                	lw	a4,24(s0)
ffffffffc020530e:	02a71563          	bne	a4,a0,ffffffffc0205338 <file_dup+0x62>
ffffffffc0205312:	852e                	mv	a0,a1
ffffffffc0205314:	002c                	addi	a1,sp,8
ffffffffc0205316:	e1eff0ef          	jal	ra,ffffffffc0204934 <fd_array_alloc>
ffffffffc020531a:	c509                	beqz	a0,ffffffffc0205324 <file_dup+0x4e>
ffffffffc020531c:	60e2                	ld	ra,24(sp)
ffffffffc020531e:	6442                	ld	s0,16(sp)
ffffffffc0205320:	6105                	addi	sp,sp,32
ffffffffc0205322:	8082                	ret
ffffffffc0205324:	6522                	ld	a0,8(sp)
ffffffffc0205326:	85a2                	mv	a1,s0
ffffffffc0205328:	845ff0ef          	jal	ra,ffffffffc0204b6c <fd_array_dup>
ffffffffc020532c:	67a2                	ld	a5,8(sp)
ffffffffc020532e:	60e2                	ld	ra,24(sp)
ffffffffc0205330:	6442                	ld	s0,16(sp)
ffffffffc0205332:	4f88                	lw	a0,24(a5)
ffffffffc0205334:	6105                	addi	sp,sp,32
ffffffffc0205336:	8082                	ret
ffffffffc0205338:	60e2                	ld	ra,24(sp)
ffffffffc020533a:	6442                	ld	s0,16(sp)
ffffffffc020533c:	5575                	li	a0,-3
ffffffffc020533e:	6105                	addi	sp,sp,32
ffffffffc0205340:	8082                	ret
ffffffffc0205342:	5575                	li	a0,-3
ffffffffc0205344:	8082                	ret
ffffffffc0205346:	dccff0ef          	jal	ra,ffffffffc0204912 <get_fd_array.part.0>

ffffffffc020534a <fs_init>:
ffffffffc020534a:	1141                	addi	sp,sp,-16
ffffffffc020534c:	e406                	sd	ra,8(sp)
ffffffffc020534e:	2f9020ef          	jal	ra,ffffffffc0207e46 <vfs_init>
ffffffffc0205352:	7d0030ef          	jal	ra,ffffffffc0208b22 <dev_init>
ffffffffc0205356:	60a2                	ld	ra,8(sp)
ffffffffc0205358:	0141                	addi	sp,sp,16
ffffffffc020535a:	1200406f          	j	ffffffffc020947a <sfs_init>

ffffffffc020535e <fs_cleanup>:
ffffffffc020535e:	53b0206f          	j	ffffffffc0208098 <vfs_cleanup>

ffffffffc0205362 <lock_files>:
ffffffffc0205362:	0561                	addi	a0,a0,24
ffffffffc0205364:	ba0ff06f          	j	ffffffffc0204704 <down>

ffffffffc0205368 <unlock_files>:
ffffffffc0205368:	0561                	addi	a0,a0,24
ffffffffc020536a:	b96ff06f          	j	ffffffffc0204700 <up>

ffffffffc020536e <files_create>:
ffffffffc020536e:	1141                	addi	sp,sp,-16
ffffffffc0205370:	6505                	lui	a0,0x1
ffffffffc0205372:	e022                	sd	s0,0(sp)
ffffffffc0205374:	e406                	sd	ra,8(sp)
ffffffffc0205376:	ca9fc0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc020537a:	842a                	mv	s0,a0
ffffffffc020537c:	cd19                	beqz	a0,ffffffffc020539a <files_create+0x2c>
ffffffffc020537e:	03050793          	addi	a5,a0,48 # 1030 <_binary_bin_swap_img_size-0x6cd0>
ffffffffc0205382:	00043023          	sd	zero,0(s0)
ffffffffc0205386:	0561                	addi	a0,a0,24
ffffffffc0205388:	e41c                	sd	a5,8(s0)
ffffffffc020538a:	00042823          	sw	zero,16(s0)
ffffffffc020538e:	4585                	li	a1,1
ffffffffc0205390:	b6aff0ef          	jal	ra,ffffffffc02046fa <sem_init>
ffffffffc0205394:	6408                	ld	a0,8(s0)
ffffffffc0205396:	f3cff0ef          	jal	ra,ffffffffc0204ad2 <fd_array_init>
ffffffffc020539a:	60a2                	ld	ra,8(sp)
ffffffffc020539c:	8522                	mv	a0,s0
ffffffffc020539e:	6402                	ld	s0,0(sp)
ffffffffc02053a0:	0141                	addi	sp,sp,16
ffffffffc02053a2:	8082                	ret

ffffffffc02053a4 <files_destroy>:
ffffffffc02053a4:	7179                	addi	sp,sp,-48
ffffffffc02053a6:	f406                	sd	ra,40(sp)
ffffffffc02053a8:	f022                	sd	s0,32(sp)
ffffffffc02053aa:	ec26                	sd	s1,24(sp)
ffffffffc02053ac:	e84a                	sd	s2,16(sp)
ffffffffc02053ae:	e44e                	sd	s3,8(sp)
ffffffffc02053b0:	c52d                	beqz	a0,ffffffffc020541a <files_destroy+0x76>
ffffffffc02053b2:	491c                	lw	a5,16(a0)
ffffffffc02053b4:	89aa                	mv	s3,a0
ffffffffc02053b6:	e3b5                	bnez	a5,ffffffffc020541a <files_destroy+0x76>
ffffffffc02053b8:	6108                	ld	a0,0(a0)
ffffffffc02053ba:	c119                	beqz	a0,ffffffffc02053c0 <files_destroy+0x1c>
ffffffffc02053bc:	123020ef          	jal	ra,ffffffffc0207cde <inode_ref_dec>
ffffffffc02053c0:	0089b403          	ld	s0,8(s3)
ffffffffc02053c4:	6485                	lui	s1,0x1
ffffffffc02053c6:	fc048493          	addi	s1,s1,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc02053ca:	94a2                	add	s1,s1,s0
ffffffffc02053cc:	4909                	li	s2,2
ffffffffc02053ce:	401c                	lw	a5,0(s0)
ffffffffc02053d0:	03278063          	beq	a5,s2,ffffffffc02053f0 <files_destroy+0x4c>
ffffffffc02053d4:	e39d                	bnez	a5,ffffffffc02053fa <files_destroy+0x56>
ffffffffc02053d6:	03840413          	addi	s0,s0,56
ffffffffc02053da:	fe849ae3          	bne	s1,s0,ffffffffc02053ce <files_destroy+0x2a>
ffffffffc02053de:	7402                	ld	s0,32(sp)
ffffffffc02053e0:	70a2                	ld	ra,40(sp)
ffffffffc02053e2:	64e2                	ld	s1,24(sp)
ffffffffc02053e4:	6942                	ld	s2,16(sp)
ffffffffc02053e6:	854e                	mv	a0,s3
ffffffffc02053e8:	69a2                	ld	s3,8(sp)
ffffffffc02053ea:	6145                	addi	sp,sp,48
ffffffffc02053ec:	ce3fc06f          	j	ffffffffc02020ce <kfree>
ffffffffc02053f0:	8522                	mv	a0,s0
ffffffffc02053f2:	efcff0ef          	jal	ra,ffffffffc0204aee <fd_array_close>
ffffffffc02053f6:	401c                	lw	a5,0(s0)
ffffffffc02053f8:	bff1                	j	ffffffffc02053d4 <files_destroy+0x30>
ffffffffc02053fa:	00008697          	auipc	a3,0x8
ffffffffc02053fe:	3e668693          	addi	a3,a3,998 # ffffffffc020d7e0 <CSWTCH.79+0x58>
ffffffffc0205402:	00007617          	auipc	a2,0x7
ffffffffc0205406:	93e60613          	addi	a2,a2,-1730 # ffffffffc020bd40 <commands+0x210>
ffffffffc020540a:	03d00593          	li	a1,61
ffffffffc020540e:	00008517          	auipc	a0,0x8
ffffffffc0205412:	3c250513          	addi	a0,a0,962 # ffffffffc020d7d0 <CSWTCH.79+0x48>
ffffffffc0205416:	888fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020541a:	00008697          	auipc	a3,0x8
ffffffffc020541e:	38668693          	addi	a3,a3,902 # ffffffffc020d7a0 <CSWTCH.79+0x18>
ffffffffc0205422:	00007617          	auipc	a2,0x7
ffffffffc0205426:	91e60613          	addi	a2,a2,-1762 # ffffffffc020bd40 <commands+0x210>
ffffffffc020542a:	03300593          	li	a1,51
ffffffffc020542e:	00008517          	auipc	a0,0x8
ffffffffc0205432:	3a250513          	addi	a0,a0,930 # ffffffffc020d7d0 <CSWTCH.79+0x48>
ffffffffc0205436:	868fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020543a <dup_files>:
ffffffffc020543a:	7179                	addi	sp,sp,-48
ffffffffc020543c:	f406                	sd	ra,40(sp)
ffffffffc020543e:	f022                	sd	s0,32(sp)
ffffffffc0205440:	ec26                	sd	s1,24(sp)
ffffffffc0205442:	e84a                	sd	s2,16(sp)
ffffffffc0205444:	e44e                	sd	s3,8(sp)
ffffffffc0205446:	e052                	sd	s4,0(sp)
ffffffffc0205448:	c52d                	beqz	a0,ffffffffc02054b2 <dup_files+0x78>
ffffffffc020544a:	842e                	mv	s0,a1
ffffffffc020544c:	c1bd                	beqz	a1,ffffffffc02054b2 <dup_files+0x78>
ffffffffc020544e:	491c                	lw	a5,16(a0)
ffffffffc0205450:	84aa                	mv	s1,a0
ffffffffc0205452:	e3c1                	bnez	a5,ffffffffc02054d2 <dup_files+0x98>
ffffffffc0205454:	499c                	lw	a5,16(a1)
ffffffffc0205456:	06f05e63          	blez	a5,ffffffffc02054d2 <dup_files+0x98>
ffffffffc020545a:	6188                	ld	a0,0(a1)
ffffffffc020545c:	e088                	sd	a0,0(s1)
ffffffffc020545e:	c119                	beqz	a0,ffffffffc0205464 <dup_files+0x2a>
ffffffffc0205460:	7b0020ef          	jal	ra,ffffffffc0207c10 <inode_ref_inc>
ffffffffc0205464:	6400                	ld	s0,8(s0)
ffffffffc0205466:	6905                	lui	s2,0x1
ffffffffc0205468:	fc090913          	addi	s2,s2,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc020546c:	6484                	ld	s1,8(s1)
ffffffffc020546e:	9922                	add	s2,s2,s0
ffffffffc0205470:	4989                	li	s3,2
ffffffffc0205472:	4a05                	li	s4,1
ffffffffc0205474:	a039                	j	ffffffffc0205482 <dup_files+0x48>
ffffffffc0205476:	03840413          	addi	s0,s0,56
ffffffffc020547a:	03848493          	addi	s1,s1,56
ffffffffc020547e:	02890163          	beq	s2,s0,ffffffffc02054a0 <dup_files+0x66>
ffffffffc0205482:	401c                	lw	a5,0(s0)
ffffffffc0205484:	ff3799e3          	bne	a5,s3,ffffffffc0205476 <dup_files+0x3c>
ffffffffc0205488:	0144a023          	sw	s4,0(s1)
ffffffffc020548c:	85a2                	mv	a1,s0
ffffffffc020548e:	8526                	mv	a0,s1
ffffffffc0205490:	03840413          	addi	s0,s0,56
ffffffffc0205494:	ed8ff0ef          	jal	ra,ffffffffc0204b6c <fd_array_dup>
ffffffffc0205498:	03848493          	addi	s1,s1,56
ffffffffc020549c:	fe8913e3          	bne	s2,s0,ffffffffc0205482 <dup_files+0x48>
ffffffffc02054a0:	70a2                	ld	ra,40(sp)
ffffffffc02054a2:	7402                	ld	s0,32(sp)
ffffffffc02054a4:	64e2                	ld	s1,24(sp)
ffffffffc02054a6:	6942                	ld	s2,16(sp)
ffffffffc02054a8:	69a2                	ld	s3,8(sp)
ffffffffc02054aa:	6a02                	ld	s4,0(sp)
ffffffffc02054ac:	4501                	li	a0,0
ffffffffc02054ae:	6145                	addi	sp,sp,48
ffffffffc02054b0:	8082                	ret
ffffffffc02054b2:	00008697          	auipc	a3,0x8
ffffffffc02054b6:	c8668693          	addi	a3,a3,-890 # ffffffffc020d138 <default_pmm_manager+0x8d8>
ffffffffc02054ba:	00007617          	auipc	a2,0x7
ffffffffc02054be:	88660613          	addi	a2,a2,-1914 # ffffffffc020bd40 <commands+0x210>
ffffffffc02054c2:	05300593          	li	a1,83
ffffffffc02054c6:	00008517          	auipc	a0,0x8
ffffffffc02054ca:	30a50513          	addi	a0,a0,778 # ffffffffc020d7d0 <CSWTCH.79+0x48>
ffffffffc02054ce:	fd1fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02054d2:	00008697          	auipc	a3,0x8
ffffffffc02054d6:	32668693          	addi	a3,a3,806 # ffffffffc020d7f8 <CSWTCH.79+0x70>
ffffffffc02054da:	00007617          	auipc	a2,0x7
ffffffffc02054de:	86660613          	addi	a2,a2,-1946 # ffffffffc020bd40 <commands+0x210>
ffffffffc02054e2:	05400593          	li	a1,84
ffffffffc02054e6:	00008517          	auipc	a0,0x8
ffffffffc02054ea:	2ea50513          	addi	a0,a0,746 # ffffffffc020d7d0 <CSWTCH.79+0x48>
ffffffffc02054ee:	fb1fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02054f2 <iobuf_skip.part.0>:
ffffffffc02054f2:	1141                	addi	sp,sp,-16
ffffffffc02054f4:	00008697          	auipc	a3,0x8
ffffffffc02054f8:	33468693          	addi	a3,a3,820 # ffffffffc020d828 <CSWTCH.79+0xa0>
ffffffffc02054fc:	00007617          	auipc	a2,0x7
ffffffffc0205500:	84460613          	addi	a2,a2,-1980 # ffffffffc020bd40 <commands+0x210>
ffffffffc0205504:	04a00593          	li	a1,74
ffffffffc0205508:	00008517          	auipc	a0,0x8
ffffffffc020550c:	33850513          	addi	a0,a0,824 # ffffffffc020d840 <CSWTCH.79+0xb8>
ffffffffc0205510:	e406                	sd	ra,8(sp)
ffffffffc0205512:	f8dfa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205516 <iobuf_init>:
ffffffffc0205516:	e10c                	sd	a1,0(a0)
ffffffffc0205518:	e514                	sd	a3,8(a0)
ffffffffc020551a:	ed10                	sd	a2,24(a0)
ffffffffc020551c:	e910                	sd	a2,16(a0)
ffffffffc020551e:	8082                	ret

ffffffffc0205520 <iobuf_move>:
ffffffffc0205520:	7179                	addi	sp,sp,-48
ffffffffc0205522:	ec26                	sd	s1,24(sp)
ffffffffc0205524:	6d04                	ld	s1,24(a0)
ffffffffc0205526:	f022                	sd	s0,32(sp)
ffffffffc0205528:	e84a                	sd	s2,16(sp)
ffffffffc020552a:	e44e                	sd	s3,8(sp)
ffffffffc020552c:	f406                	sd	ra,40(sp)
ffffffffc020552e:	842a                	mv	s0,a0
ffffffffc0205530:	8932                	mv	s2,a2
ffffffffc0205532:	852e                	mv	a0,a1
ffffffffc0205534:	89ba                	mv	s3,a4
ffffffffc0205536:	00967363          	bgeu	a2,s1,ffffffffc020553c <iobuf_move+0x1c>
ffffffffc020553a:	84b2                	mv	s1,a2
ffffffffc020553c:	c495                	beqz	s1,ffffffffc0205568 <iobuf_move+0x48>
ffffffffc020553e:	600c                	ld	a1,0(s0)
ffffffffc0205540:	c681                	beqz	a3,ffffffffc0205548 <iobuf_move+0x28>
ffffffffc0205542:	87ae                	mv	a5,a1
ffffffffc0205544:	85aa                	mv	a1,a0
ffffffffc0205546:	853e                	mv	a0,a5
ffffffffc0205548:	8626                	mv	a2,s1
ffffffffc020554a:	322060ef          	jal	ra,ffffffffc020b86c <memmove>
ffffffffc020554e:	6c1c                	ld	a5,24(s0)
ffffffffc0205550:	0297ea63          	bltu	a5,s1,ffffffffc0205584 <iobuf_move+0x64>
ffffffffc0205554:	6014                	ld	a3,0(s0)
ffffffffc0205556:	6418                	ld	a4,8(s0)
ffffffffc0205558:	8f85                	sub	a5,a5,s1
ffffffffc020555a:	96a6                	add	a3,a3,s1
ffffffffc020555c:	9726                	add	a4,a4,s1
ffffffffc020555e:	e014                	sd	a3,0(s0)
ffffffffc0205560:	e418                	sd	a4,8(s0)
ffffffffc0205562:	ec1c                	sd	a5,24(s0)
ffffffffc0205564:	40990933          	sub	s2,s2,s1
ffffffffc0205568:	00098463          	beqz	s3,ffffffffc0205570 <iobuf_move+0x50>
ffffffffc020556c:	0099b023          	sd	s1,0(s3)
ffffffffc0205570:	4501                	li	a0,0
ffffffffc0205572:	00091b63          	bnez	s2,ffffffffc0205588 <iobuf_move+0x68>
ffffffffc0205576:	70a2                	ld	ra,40(sp)
ffffffffc0205578:	7402                	ld	s0,32(sp)
ffffffffc020557a:	64e2                	ld	s1,24(sp)
ffffffffc020557c:	6942                	ld	s2,16(sp)
ffffffffc020557e:	69a2                	ld	s3,8(sp)
ffffffffc0205580:	6145                	addi	sp,sp,48
ffffffffc0205582:	8082                	ret
ffffffffc0205584:	f6fff0ef          	jal	ra,ffffffffc02054f2 <iobuf_skip.part.0>
ffffffffc0205588:	5571                	li	a0,-4
ffffffffc020558a:	b7f5                	j	ffffffffc0205576 <iobuf_move+0x56>

ffffffffc020558c <iobuf_skip>:
ffffffffc020558c:	6d1c                	ld	a5,24(a0)
ffffffffc020558e:	00b7eb63          	bltu	a5,a1,ffffffffc02055a4 <iobuf_skip+0x18>
ffffffffc0205592:	6114                	ld	a3,0(a0)
ffffffffc0205594:	6518                	ld	a4,8(a0)
ffffffffc0205596:	8f8d                	sub	a5,a5,a1
ffffffffc0205598:	96ae                	add	a3,a3,a1
ffffffffc020559a:	95ba                	add	a1,a1,a4
ffffffffc020559c:	e114                	sd	a3,0(a0)
ffffffffc020559e:	e50c                	sd	a1,8(a0)
ffffffffc02055a0:	ed1c                	sd	a5,24(a0)
ffffffffc02055a2:	8082                	ret
ffffffffc02055a4:	1141                	addi	sp,sp,-16
ffffffffc02055a6:	e406                	sd	ra,8(sp)
ffffffffc02055a8:	f4bff0ef          	jal	ra,ffffffffc02054f2 <iobuf_skip.part.0>

ffffffffc02055ac <copy_path>:
ffffffffc02055ac:	7139                	addi	sp,sp,-64
ffffffffc02055ae:	f04a                	sd	s2,32(sp)
ffffffffc02055b0:	00091917          	auipc	s2,0x91
ffffffffc02055b4:	31090913          	addi	s2,s2,784 # ffffffffc02968c0 <current>
ffffffffc02055b8:	00093703          	ld	a4,0(s2)
ffffffffc02055bc:	ec4e                	sd	s3,24(sp)
ffffffffc02055be:	89aa                	mv	s3,a0
ffffffffc02055c0:	6505                	lui	a0,0x1
ffffffffc02055c2:	f426                	sd	s1,40(sp)
ffffffffc02055c4:	e852                	sd	s4,16(sp)
ffffffffc02055c6:	fc06                	sd	ra,56(sp)
ffffffffc02055c8:	f822                	sd	s0,48(sp)
ffffffffc02055ca:	e456                	sd	s5,8(sp)
ffffffffc02055cc:	02873a03          	ld	s4,40(a4)
ffffffffc02055d0:	84ae                	mv	s1,a1
ffffffffc02055d2:	a4dfc0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc02055d6:	c141                	beqz	a0,ffffffffc0205656 <copy_path+0xaa>
ffffffffc02055d8:	842a                	mv	s0,a0
ffffffffc02055da:	040a0563          	beqz	s4,ffffffffc0205624 <copy_path+0x78>
ffffffffc02055de:	038a0a93          	addi	s5,s4,56
ffffffffc02055e2:	8556                	mv	a0,s5
ffffffffc02055e4:	920ff0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc02055e8:	00093783          	ld	a5,0(s2)
ffffffffc02055ec:	cba1                	beqz	a5,ffffffffc020563c <copy_path+0x90>
ffffffffc02055ee:	43dc                	lw	a5,4(a5)
ffffffffc02055f0:	6685                	lui	a3,0x1
ffffffffc02055f2:	8626                	mv	a2,s1
ffffffffc02055f4:	04fa2823          	sw	a5,80(s4)
ffffffffc02055f8:	85a2                	mv	a1,s0
ffffffffc02055fa:	8552                	mv	a0,s4
ffffffffc02055fc:	f31fe0ef          	jal	ra,ffffffffc020452c <copy_string>
ffffffffc0205600:	c529                	beqz	a0,ffffffffc020564a <copy_path+0x9e>
ffffffffc0205602:	8556                	mv	a0,s5
ffffffffc0205604:	8fcff0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0205608:	040a2823          	sw	zero,80(s4)
ffffffffc020560c:	0089b023          	sd	s0,0(s3)
ffffffffc0205610:	4501                	li	a0,0
ffffffffc0205612:	70e2                	ld	ra,56(sp)
ffffffffc0205614:	7442                	ld	s0,48(sp)
ffffffffc0205616:	74a2                	ld	s1,40(sp)
ffffffffc0205618:	7902                	ld	s2,32(sp)
ffffffffc020561a:	69e2                	ld	s3,24(sp)
ffffffffc020561c:	6a42                	ld	s4,16(sp)
ffffffffc020561e:	6aa2                	ld	s5,8(sp)
ffffffffc0205620:	6121                	addi	sp,sp,64
ffffffffc0205622:	8082                	ret
ffffffffc0205624:	85aa                	mv	a1,a0
ffffffffc0205626:	6685                	lui	a3,0x1
ffffffffc0205628:	8626                	mv	a2,s1
ffffffffc020562a:	4501                	li	a0,0
ffffffffc020562c:	f01fe0ef          	jal	ra,ffffffffc020452c <copy_string>
ffffffffc0205630:	fd71                	bnez	a0,ffffffffc020560c <copy_path+0x60>
ffffffffc0205632:	8522                	mv	a0,s0
ffffffffc0205634:	a9bfc0ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0205638:	5575                	li	a0,-3
ffffffffc020563a:	bfe1                	j	ffffffffc0205612 <copy_path+0x66>
ffffffffc020563c:	6685                	lui	a3,0x1
ffffffffc020563e:	8626                	mv	a2,s1
ffffffffc0205640:	85a2                	mv	a1,s0
ffffffffc0205642:	8552                	mv	a0,s4
ffffffffc0205644:	ee9fe0ef          	jal	ra,ffffffffc020452c <copy_string>
ffffffffc0205648:	fd4d                	bnez	a0,ffffffffc0205602 <copy_path+0x56>
ffffffffc020564a:	8556                	mv	a0,s5
ffffffffc020564c:	8b4ff0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0205650:	040a2823          	sw	zero,80(s4)
ffffffffc0205654:	bff9                	j	ffffffffc0205632 <copy_path+0x86>
ffffffffc0205656:	5571                	li	a0,-4
ffffffffc0205658:	bf6d                	j	ffffffffc0205612 <copy_path+0x66>

ffffffffc020565a <sysfile_open>:
ffffffffc020565a:	7179                	addi	sp,sp,-48
ffffffffc020565c:	872a                	mv	a4,a0
ffffffffc020565e:	ec26                	sd	s1,24(sp)
ffffffffc0205660:	0028                	addi	a0,sp,8
ffffffffc0205662:	84ae                	mv	s1,a1
ffffffffc0205664:	85ba                	mv	a1,a4
ffffffffc0205666:	f022                	sd	s0,32(sp)
ffffffffc0205668:	f406                	sd	ra,40(sp)
ffffffffc020566a:	f43ff0ef          	jal	ra,ffffffffc02055ac <copy_path>
ffffffffc020566e:	842a                	mv	s0,a0
ffffffffc0205670:	e909                	bnez	a0,ffffffffc0205682 <sysfile_open+0x28>
ffffffffc0205672:	6522                	ld	a0,8(sp)
ffffffffc0205674:	85a6                	mv	a1,s1
ffffffffc0205676:	dccff0ef          	jal	ra,ffffffffc0204c42 <file_open>
ffffffffc020567a:	842a                	mv	s0,a0
ffffffffc020567c:	6522                	ld	a0,8(sp)
ffffffffc020567e:	a51fc0ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0205682:	70a2                	ld	ra,40(sp)
ffffffffc0205684:	8522                	mv	a0,s0
ffffffffc0205686:	7402                	ld	s0,32(sp)
ffffffffc0205688:	64e2                	ld	s1,24(sp)
ffffffffc020568a:	6145                	addi	sp,sp,48
ffffffffc020568c:	8082                	ret

ffffffffc020568e <sysfile_close>:
ffffffffc020568e:	eb2ff06f          	j	ffffffffc0204d40 <file_close>

ffffffffc0205692 <sysfile_read>:
ffffffffc0205692:	7159                	addi	sp,sp,-112
ffffffffc0205694:	f0a2                	sd	s0,96(sp)
ffffffffc0205696:	f486                	sd	ra,104(sp)
ffffffffc0205698:	eca6                	sd	s1,88(sp)
ffffffffc020569a:	e8ca                	sd	s2,80(sp)
ffffffffc020569c:	e4ce                	sd	s3,72(sp)
ffffffffc020569e:	e0d2                	sd	s4,64(sp)
ffffffffc02056a0:	fc56                	sd	s5,56(sp)
ffffffffc02056a2:	f85a                	sd	s6,48(sp)
ffffffffc02056a4:	f45e                	sd	s7,40(sp)
ffffffffc02056a6:	f062                	sd	s8,32(sp)
ffffffffc02056a8:	ec66                	sd	s9,24(sp)
ffffffffc02056aa:	4401                	li	s0,0
ffffffffc02056ac:	ee19                	bnez	a2,ffffffffc02056ca <sysfile_read+0x38>
ffffffffc02056ae:	70a6                	ld	ra,104(sp)
ffffffffc02056b0:	8522                	mv	a0,s0
ffffffffc02056b2:	7406                	ld	s0,96(sp)
ffffffffc02056b4:	64e6                	ld	s1,88(sp)
ffffffffc02056b6:	6946                	ld	s2,80(sp)
ffffffffc02056b8:	69a6                	ld	s3,72(sp)
ffffffffc02056ba:	6a06                	ld	s4,64(sp)
ffffffffc02056bc:	7ae2                	ld	s5,56(sp)
ffffffffc02056be:	7b42                	ld	s6,48(sp)
ffffffffc02056c0:	7ba2                	ld	s7,40(sp)
ffffffffc02056c2:	7c02                	ld	s8,32(sp)
ffffffffc02056c4:	6ce2                	ld	s9,24(sp)
ffffffffc02056c6:	6165                	addi	sp,sp,112
ffffffffc02056c8:	8082                	ret
ffffffffc02056ca:	00091c97          	auipc	s9,0x91
ffffffffc02056ce:	1f6c8c93          	addi	s9,s9,502 # ffffffffc02968c0 <current>
ffffffffc02056d2:	000cb783          	ld	a5,0(s9)
ffffffffc02056d6:	84b2                	mv	s1,a2
ffffffffc02056d8:	8b2e                	mv	s6,a1
ffffffffc02056da:	4601                	li	a2,0
ffffffffc02056dc:	4585                	li	a1,1
ffffffffc02056de:	0287b903          	ld	s2,40(a5)
ffffffffc02056e2:	8aaa                	mv	s5,a0
ffffffffc02056e4:	d0aff0ef          	jal	ra,ffffffffc0204bee <file_testfd>
ffffffffc02056e8:	c959                	beqz	a0,ffffffffc020577e <sysfile_read+0xec>
ffffffffc02056ea:	6505                	lui	a0,0x1
ffffffffc02056ec:	933fc0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc02056f0:	89aa                	mv	s3,a0
ffffffffc02056f2:	c941                	beqz	a0,ffffffffc0205782 <sysfile_read+0xf0>
ffffffffc02056f4:	4b81                	li	s7,0
ffffffffc02056f6:	6a05                	lui	s4,0x1
ffffffffc02056f8:	03890c13          	addi	s8,s2,56
ffffffffc02056fc:	0744ec63          	bltu	s1,s4,ffffffffc0205774 <sysfile_read+0xe2>
ffffffffc0205700:	e452                	sd	s4,8(sp)
ffffffffc0205702:	6605                	lui	a2,0x1
ffffffffc0205704:	0034                	addi	a3,sp,8
ffffffffc0205706:	85ce                	mv	a1,s3
ffffffffc0205708:	8556                	mv	a0,s5
ffffffffc020570a:	e8cff0ef          	jal	ra,ffffffffc0204d96 <file_read>
ffffffffc020570e:	66a2                	ld	a3,8(sp)
ffffffffc0205710:	842a                	mv	s0,a0
ffffffffc0205712:	ca9d                	beqz	a3,ffffffffc0205748 <sysfile_read+0xb6>
ffffffffc0205714:	00090c63          	beqz	s2,ffffffffc020572c <sysfile_read+0x9a>
ffffffffc0205718:	8562                	mv	a0,s8
ffffffffc020571a:	febfe0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc020571e:	000cb783          	ld	a5,0(s9)
ffffffffc0205722:	cfa1                	beqz	a5,ffffffffc020577a <sysfile_read+0xe8>
ffffffffc0205724:	43dc                	lw	a5,4(a5)
ffffffffc0205726:	66a2                	ld	a3,8(sp)
ffffffffc0205728:	04f92823          	sw	a5,80(s2)
ffffffffc020572c:	864e                	mv	a2,s3
ffffffffc020572e:	85da                	mv	a1,s6
ffffffffc0205730:	854a                	mv	a0,s2
ffffffffc0205732:	dc9fe0ef          	jal	ra,ffffffffc02044fa <copy_to_user>
ffffffffc0205736:	c50d                	beqz	a0,ffffffffc0205760 <sysfile_read+0xce>
ffffffffc0205738:	67a2                	ld	a5,8(sp)
ffffffffc020573a:	04f4e663          	bltu	s1,a5,ffffffffc0205786 <sysfile_read+0xf4>
ffffffffc020573e:	9b3e                	add	s6,s6,a5
ffffffffc0205740:	8c9d                	sub	s1,s1,a5
ffffffffc0205742:	9bbe                	add	s7,s7,a5
ffffffffc0205744:	02091263          	bnez	s2,ffffffffc0205768 <sysfile_read+0xd6>
ffffffffc0205748:	e401                	bnez	s0,ffffffffc0205750 <sysfile_read+0xbe>
ffffffffc020574a:	67a2                	ld	a5,8(sp)
ffffffffc020574c:	c391                	beqz	a5,ffffffffc0205750 <sysfile_read+0xbe>
ffffffffc020574e:	f4dd                	bnez	s1,ffffffffc02056fc <sysfile_read+0x6a>
ffffffffc0205750:	854e                	mv	a0,s3
ffffffffc0205752:	97dfc0ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0205756:	f40b8ce3          	beqz	s7,ffffffffc02056ae <sysfile_read+0x1c>
ffffffffc020575a:	000b841b          	sext.w	s0,s7
ffffffffc020575e:	bf81                	j	ffffffffc02056ae <sysfile_read+0x1c>
ffffffffc0205760:	e011                	bnez	s0,ffffffffc0205764 <sysfile_read+0xd2>
ffffffffc0205762:	5475                	li	s0,-3
ffffffffc0205764:	fe0906e3          	beqz	s2,ffffffffc0205750 <sysfile_read+0xbe>
ffffffffc0205768:	8562                	mv	a0,s8
ffffffffc020576a:	f97fe0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc020576e:	04092823          	sw	zero,80(s2)
ffffffffc0205772:	bfd9                	j	ffffffffc0205748 <sysfile_read+0xb6>
ffffffffc0205774:	e426                	sd	s1,8(sp)
ffffffffc0205776:	8626                	mv	a2,s1
ffffffffc0205778:	b771                	j	ffffffffc0205704 <sysfile_read+0x72>
ffffffffc020577a:	66a2                	ld	a3,8(sp)
ffffffffc020577c:	bf45                	j	ffffffffc020572c <sysfile_read+0x9a>
ffffffffc020577e:	5475                	li	s0,-3
ffffffffc0205780:	b73d                	j	ffffffffc02056ae <sysfile_read+0x1c>
ffffffffc0205782:	5471                	li	s0,-4
ffffffffc0205784:	b72d                	j	ffffffffc02056ae <sysfile_read+0x1c>
ffffffffc0205786:	00008697          	auipc	a3,0x8
ffffffffc020578a:	0ca68693          	addi	a3,a3,202 # ffffffffc020d850 <CSWTCH.79+0xc8>
ffffffffc020578e:	00006617          	auipc	a2,0x6
ffffffffc0205792:	5b260613          	addi	a2,a2,1458 # ffffffffc020bd40 <commands+0x210>
ffffffffc0205796:	05500593          	li	a1,85
ffffffffc020579a:	00008517          	auipc	a0,0x8
ffffffffc020579e:	0c650513          	addi	a0,a0,198 # ffffffffc020d860 <CSWTCH.79+0xd8>
ffffffffc02057a2:	cfdfa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02057a6 <sysfile_write>:
ffffffffc02057a6:	7159                	addi	sp,sp,-112
ffffffffc02057a8:	e8ca                	sd	s2,80(sp)
ffffffffc02057aa:	f486                	sd	ra,104(sp)
ffffffffc02057ac:	f0a2                	sd	s0,96(sp)
ffffffffc02057ae:	eca6                	sd	s1,88(sp)
ffffffffc02057b0:	e4ce                	sd	s3,72(sp)
ffffffffc02057b2:	e0d2                	sd	s4,64(sp)
ffffffffc02057b4:	fc56                	sd	s5,56(sp)
ffffffffc02057b6:	f85a                	sd	s6,48(sp)
ffffffffc02057b8:	f45e                	sd	s7,40(sp)
ffffffffc02057ba:	f062                	sd	s8,32(sp)
ffffffffc02057bc:	ec66                	sd	s9,24(sp)
ffffffffc02057be:	4901                	li	s2,0
ffffffffc02057c0:	ee19                	bnez	a2,ffffffffc02057de <sysfile_write+0x38>
ffffffffc02057c2:	70a6                	ld	ra,104(sp)
ffffffffc02057c4:	7406                	ld	s0,96(sp)
ffffffffc02057c6:	64e6                	ld	s1,88(sp)
ffffffffc02057c8:	69a6                	ld	s3,72(sp)
ffffffffc02057ca:	6a06                	ld	s4,64(sp)
ffffffffc02057cc:	7ae2                	ld	s5,56(sp)
ffffffffc02057ce:	7b42                	ld	s6,48(sp)
ffffffffc02057d0:	7ba2                	ld	s7,40(sp)
ffffffffc02057d2:	7c02                	ld	s8,32(sp)
ffffffffc02057d4:	6ce2                	ld	s9,24(sp)
ffffffffc02057d6:	854a                	mv	a0,s2
ffffffffc02057d8:	6946                	ld	s2,80(sp)
ffffffffc02057da:	6165                	addi	sp,sp,112
ffffffffc02057dc:	8082                	ret
ffffffffc02057de:	00091c17          	auipc	s8,0x91
ffffffffc02057e2:	0e2c0c13          	addi	s8,s8,226 # ffffffffc02968c0 <current>
ffffffffc02057e6:	000c3783          	ld	a5,0(s8)
ffffffffc02057ea:	8432                	mv	s0,a2
ffffffffc02057ec:	89ae                	mv	s3,a1
ffffffffc02057ee:	4605                	li	a2,1
ffffffffc02057f0:	4581                	li	a1,0
ffffffffc02057f2:	7784                	ld	s1,40(a5)
ffffffffc02057f4:	8baa                	mv	s7,a0
ffffffffc02057f6:	bf8ff0ef          	jal	ra,ffffffffc0204bee <file_testfd>
ffffffffc02057fa:	cd59                	beqz	a0,ffffffffc0205898 <sysfile_write+0xf2>
ffffffffc02057fc:	6505                	lui	a0,0x1
ffffffffc02057fe:	821fc0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0205802:	8a2a                	mv	s4,a0
ffffffffc0205804:	cd41                	beqz	a0,ffffffffc020589c <sysfile_write+0xf6>
ffffffffc0205806:	4c81                	li	s9,0
ffffffffc0205808:	6a85                	lui	s5,0x1
ffffffffc020580a:	03848b13          	addi	s6,s1,56
ffffffffc020580e:	05546a63          	bltu	s0,s5,ffffffffc0205862 <sysfile_write+0xbc>
ffffffffc0205812:	e456                	sd	s5,8(sp)
ffffffffc0205814:	c8a9                	beqz	s1,ffffffffc0205866 <sysfile_write+0xc0>
ffffffffc0205816:	855a                	mv	a0,s6
ffffffffc0205818:	eedfe0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc020581c:	000c3783          	ld	a5,0(s8)
ffffffffc0205820:	c399                	beqz	a5,ffffffffc0205826 <sysfile_write+0x80>
ffffffffc0205822:	43dc                	lw	a5,4(a5)
ffffffffc0205824:	c8bc                	sw	a5,80(s1)
ffffffffc0205826:	66a2                	ld	a3,8(sp)
ffffffffc0205828:	4701                	li	a4,0
ffffffffc020582a:	864e                	mv	a2,s3
ffffffffc020582c:	85d2                	mv	a1,s4
ffffffffc020582e:	8526                	mv	a0,s1
ffffffffc0205830:	c97fe0ef          	jal	ra,ffffffffc02044c6 <copy_from_user>
ffffffffc0205834:	c139                	beqz	a0,ffffffffc020587a <sysfile_write+0xd4>
ffffffffc0205836:	855a                	mv	a0,s6
ffffffffc0205838:	ec9fe0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc020583c:	0404a823          	sw	zero,80(s1)
ffffffffc0205840:	6622                	ld	a2,8(sp)
ffffffffc0205842:	0034                	addi	a3,sp,8
ffffffffc0205844:	85d2                	mv	a1,s4
ffffffffc0205846:	855e                	mv	a0,s7
ffffffffc0205848:	e34ff0ef          	jal	ra,ffffffffc0204e7c <file_write>
ffffffffc020584c:	67a2                	ld	a5,8(sp)
ffffffffc020584e:	892a                	mv	s2,a0
ffffffffc0205850:	ef85                	bnez	a5,ffffffffc0205888 <sysfile_write+0xe2>
ffffffffc0205852:	8552                	mv	a0,s4
ffffffffc0205854:	87bfc0ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0205858:	f60c85e3          	beqz	s9,ffffffffc02057c2 <sysfile_write+0x1c>
ffffffffc020585c:	000c891b          	sext.w	s2,s9
ffffffffc0205860:	b78d                	j	ffffffffc02057c2 <sysfile_write+0x1c>
ffffffffc0205862:	e422                	sd	s0,8(sp)
ffffffffc0205864:	f8cd                	bnez	s1,ffffffffc0205816 <sysfile_write+0x70>
ffffffffc0205866:	66a2                	ld	a3,8(sp)
ffffffffc0205868:	4701                	li	a4,0
ffffffffc020586a:	864e                	mv	a2,s3
ffffffffc020586c:	85d2                	mv	a1,s4
ffffffffc020586e:	4501                	li	a0,0
ffffffffc0205870:	c57fe0ef          	jal	ra,ffffffffc02044c6 <copy_from_user>
ffffffffc0205874:	f571                	bnez	a0,ffffffffc0205840 <sysfile_write+0x9a>
ffffffffc0205876:	5975                	li	s2,-3
ffffffffc0205878:	bfe9                	j	ffffffffc0205852 <sysfile_write+0xac>
ffffffffc020587a:	855a                	mv	a0,s6
ffffffffc020587c:	e85fe0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0205880:	5975                	li	s2,-3
ffffffffc0205882:	0404a823          	sw	zero,80(s1)
ffffffffc0205886:	b7f1                	j	ffffffffc0205852 <sysfile_write+0xac>
ffffffffc0205888:	00f46c63          	bltu	s0,a5,ffffffffc02058a0 <sysfile_write+0xfa>
ffffffffc020588c:	99be                	add	s3,s3,a5
ffffffffc020588e:	8c1d                	sub	s0,s0,a5
ffffffffc0205890:	9cbe                	add	s9,s9,a5
ffffffffc0205892:	f161                	bnez	a0,ffffffffc0205852 <sysfile_write+0xac>
ffffffffc0205894:	fc2d                	bnez	s0,ffffffffc020580e <sysfile_write+0x68>
ffffffffc0205896:	bf75                	j	ffffffffc0205852 <sysfile_write+0xac>
ffffffffc0205898:	5975                	li	s2,-3
ffffffffc020589a:	b725                	j	ffffffffc02057c2 <sysfile_write+0x1c>
ffffffffc020589c:	5971                	li	s2,-4
ffffffffc020589e:	b715                	j	ffffffffc02057c2 <sysfile_write+0x1c>
ffffffffc02058a0:	00008697          	auipc	a3,0x8
ffffffffc02058a4:	fb068693          	addi	a3,a3,-80 # ffffffffc020d850 <CSWTCH.79+0xc8>
ffffffffc02058a8:	00006617          	auipc	a2,0x6
ffffffffc02058ac:	49860613          	addi	a2,a2,1176 # ffffffffc020bd40 <commands+0x210>
ffffffffc02058b0:	08a00593          	li	a1,138
ffffffffc02058b4:	00008517          	auipc	a0,0x8
ffffffffc02058b8:	fac50513          	addi	a0,a0,-84 # ffffffffc020d860 <CSWTCH.79+0xd8>
ffffffffc02058bc:	be3fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02058c0 <sysfile_seek>:
ffffffffc02058c0:	ea2ff06f          	j	ffffffffc0204f62 <file_seek>

ffffffffc02058c4 <sysfile_fstat>:
ffffffffc02058c4:	715d                	addi	sp,sp,-80
ffffffffc02058c6:	f44e                	sd	s3,40(sp)
ffffffffc02058c8:	00091997          	auipc	s3,0x91
ffffffffc02058cc:	ff898993          	addi	s3,s3,-8 # ffffffffc02968c0 <current>
ffffffffc02058d0:	0009b703          	ld	a4,0(s3)
ffffffffc02058d4:	fc26                	sd	s1,56(sp)
ffffffffc02058d6:	84ae                	mv	s1,a1
ffffffffc02058d8:	858a                	mv	a1,sp
ffffffffc02058da:	e0a2                	sd	s0,64(sp)
ffffffffc02058dc:	f84a                	sd	s2,48(sp)
ffffffffc02058de:	e486                	sd	ra,72(sp)
ffffffffc02058e0:	02873903          	ld	s2,40(a4)
ffffffffc02058e4:	f052                	sd	s4,32(sp)
ffffffffc02058e6:	f9cff0ef          	jal	ra,ffffffffc0205082 <file_fstat>
ffffffffc02058ea:	842a                	mv	s0,a0
ffffffffc02058ec:	e91d                	bnez	a0,ffffffffc0205922 <sysfile_fstat+0x5e>
ffffffffc02058ee:	04090363          	beqz	s2,ffffffffc0205934 <sysfile_fstat+0x70>
ffffffffc02058f2:	03890a13          	addi	s4,s2,56
ffffffffc02058f6:	8552                	mv	a0,s4
ffffffffc02058f8:	e0dfe0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc02058fc:	0009b783          	ld	a5,0(s3)
ffffffffc0205900:	c3b9                	beqz	a5,ffffffffc0205946 <sysfile_fstat+0x82>
ffffffffc0205902:	43dc                	lw	a5,4(a5)
ffffffffc0205904:	02000693          	li	a3,32
ffffffffc0205908:	860a                	mv	a2,sp
ffffffffc020590a:	04f92823          	sw	a5,80(s2)
ffffffffc020590e:	85a6                	mv	a1,s1
ffffffffc0205910:	854a                	mv	a0,s2
ffffffffc0205912:	be9fe0ef          	jal	ra,ffffffffc02044fa <copy_to_user>
ffffffffc0205916:	c121                	beqz	a0,ffffffffc0205956 <sysfile_fstat+0x92>
ffffffffc0205918:	8552                	mv	a0,s4
ffffffffc020591a:	de7fe0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc020591e:	04092823          	sw	zero,80(s2)
ffffffffc0205922:	60a6                	ld	ra,72(sp)
ffffffffc0205924:	8522                	mv	a0,s0
ffffffffc0205926:	6406                	ld	s0,64(sp)
ffffffffc0205928:	74e2                	ld	s1,56(sp)
ffffffffc020592a:	7942                	ld	s2,48(sp)
ffffffffc020592c:	79a2                	ld	s3,40(sp)
ffffffffc020592e:	7a02                	ld	s4,32(sp)
ffffffffc0205930:	6161                	addi	sp,sp,80
ffffffffc0205932:	8082                	ret
ffffffffc0205934:	02000693          	li	a3,32
ffffffffc0205938:	860a                	mv	a2,sp
ffffffffc020593a:	85a6                	mv	a1,s1
ffffffffc020593c:	bbffe0ef          	jal	ra,ffffffffc02044fa <copy_to_user>
ffffffffc0205940:	f16d                	bnez	a0,ffffffffc0205922 <sysfile_fstat+0x5e>
ffffffffc0205942:	5475                	li	s0,-3
ffffffffc0205944:	bff9                	j	ffffffffc0205922 <sysfile_fstat+0x5e>
ffffffffc0205946:	02000693          	li	a3,32
ffffffffc020594a:	860a                	mv	a2,sp
ffffffffc020594c:	85a6                	mv	a1,s1
ffffffffc020594e:	854a                	mv	a0,s2
ffffffffc0205950:	babfe0ef          	jal	ra,ffffffffc02044fa <copy_to_user>
ffffffffc0205954:	f171                	bnez	a0,ffffffffc0205918 <sysfile_fstat+0x54>
ffffffffc0205956:	8552                	mv	a0,s4
ffffffffc0205958:	da9fe0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc020595c:	5475                	li	s0,-3
ffffffffc020595e:	04092823          	sw	zero,80(s2)
ffffffffc0205962:	b7c1                	j	ffffffffc0205922 <sysfile_fstat+0x5e>

ffffffffc0205964 <sysfile_fsync>:
ffffffffc0205964:	fdeff06f          	j	ffffffffc0205142 <file_fsync>

ffffffffc0205968 <sysfile_getcwd>:
ffffffffc0205968:	715d                	addi	sp,sp,-80
ffffffffc020596a:	f44e                	sd	s3,40(sp)
ffffffffc020596c:	00091997          	auipc	s3,0x91
ffffffffc0205970:	f5498993          	addi	s3,s3,-172 # ffffffffc02968c0 <current>
ffffffffc0205974:	0009b783          	ld	a5,0(s3)
ffffffffc0205978:	f84a                	sd	s2,48(sp)
ffffffffc020597a:	e486                	sd	ra,72(sp)
ffffffffc020597c:	e0a2                	sd	s0,64(sp)
ffffffffc020597e:	fc26                	sd	s1,56(sp)
ffffffffc0205980:	f052                	sd	s4,32(sp)
ffffffffc0205982:	0287b903          	ld	s2,40(a5)
ffffffffc0205986:	cda9                	beqz	a1,ffffffffc02059e0 <sysfile_getcwd+0x78>
ffffffffc0205988:	842e                	mv	s0,a1
ffffffffc020598a:	84aa                	mv	s1,a0
ffffffffc020598c:	04090363          	beqz	s2,ffffffffc02059d2 <sysfile_getcwd+0x6a>
ffffffffc0205990:	03890a13          	addi	s4,s2,56
ffffffffc0205994:	8552                	mv	a0,s4
ffffffffc0205996:	d6ffe0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc020599a:	0009b783          	ld	a5,0(s3)
ffffffffc020599e:	c781                	beqz	a5,ffffffffc02059a6 <sysfile_getcwd+0x3e>
ffffffffc02059a0:	43dc                	lw	a5,4(a5)
ffffffffc02059a2:	04f92823          	sw	a5,80(s2)
ffffffffc02059a6:	4685                	li	a3,1
ffffffffc02059a8:	8622                	mv	a2,s0
ffffffffc02059aa:	85a6                	mv	a1,s1
ffffffffc02059ac:	854a                	mv	a0,s2
ffffffffc02059ae:	a85fe0ef          	jal	ra,ffffffffc0204432 <user_mem_check>
ffffffffc02059b2:	e90d                	bnez	a0,ffffffffc02059e4 <sysfile_getcwd+0x7c>
ffffffffc02059b4:	5475                	li	s0,-3
ffffffffc02059b6:	8552                	mv	a0,s4
ffffffffc02059b8:	d49fe0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc02059bc:	04092823          	sw	zero,80(s2)
ffffffffc02059c0:	60a6                	ld	ra,72(sp)
ffffffffc02059c2:	8522                	mv	a0,s0
ffffffffc02059c4:	6406                	ld	s0,64(sp)
ffffffffc02059c6:	74e2                	ld	s1,56(sp)
ffffffffc02059c8:	7942                	ld	s2,48(sp)
ffffffffc02059ca:	79a2                	ld	s3,40(sp)
ffffffffc02059cc:	7a02                	ld	s4,32(sp)
ffffffffc02059ce:	6161                	addi	sp,sp,80
ffffffffc02059d0:	8082                	ret
ffffffffc02059d2:	862e                	mv	a2,a1
ffffffffc02059d4:	4685                	li	a3,1
ffffffffc02059d6:	85aa                	mv	a1,a0
ffffffffc02059d8:	4501                	li	a0,0
ffffffffc02059da:	a59fe0ef          	jal	ra,ffffffffc0204432 <user_mem_check>
ffffffffc02059de:	ed09                	bnez	a0,ffffffffc02059f8 <sysfile_getcwd+0x90>
ffffffffc02059e0:	5475                	li	s0,-3
ffffffffc02059e2:	bff9                	j	ffffffffc02059c0 <sysfile_getcwd+0x58>
ffffffffc02059e4:	8622                	mv	a2,s0
ffffffffc02059e6:	4681                	li	a3,0
ffffffffc02059e8:	85a6                	mv	a1,s1
ffffffffc02059ea:	850a                	mv	a0,sp
ffffffffc02059ec:	b2bff0ef          	jal	ra,ffffffffc0205516 <iobuf_init>
ffffffffc02059f0:	5df020ef          	jal	ra,ffffffffc02087ce <vfs_getcwd>
ffffffffc02059f4:	842a                	mv	s0,a0
ffffffffc02059f6:	b7c1                	j	ffffffffc02059b6 <sysfile_getcwd+0x4e>
ffffffffc02059f8:	8622                	mv	a2,s0
ffffffffc02059fa:	4681                	li	a3,0
ffffffffc02059fc:	85a6                	mv	a1,s1
ffffffffc02059fe:	850a                	mv	a0,sp
ffffffffc0205a00:	b17ff0ef          	jal	ra,ffffffffc0205516 <iobuf_init>
ffffffffc0205a04:	5cb020ef          	jal	ra,ffffffffc02087ce <vfs_getcwd>
ffffffffc0205a08:	842a                	mv	s0,a0
ffffffffc0205a0a:	bf5d                	j	ffffffffc02059c0 <sysfile_getcwd+0x58>

ffffffffc0205a0c <sysfile_getdirentry>:
ffffffffc0205a0c:	7139                	addi	sp,sp,-64
ffffffffc0205a0e:	e852                	sd	s4,16(sp)
ffffffffc0205a10:	00091a17          	auipc	s4,0x91
ffffffffc0205a14:	eb0a0a13          	addi	s4,s4,-336 # ffffffffc02968c0 <current>
ffffffffc0205a18:	000a3703          	ld	a4,0(s4)
ffffffffc0205a1c:	ec4e                	sd	s3,24(sp)
ffffffffc0205a1e:	89aa                	mv	s3,a0
ffffffffc0205a20:	10800513          	li	a0,264
ffffffffc0205a24:	f426                	sd	s1,40(sp)
ffffffffc0205a26:	f04a                	sd	s2,32(sp)
ffffffffc0205a28:	fc06                	sd	ra,56(sp)
ffffffffc0205a2a:	f822                	sd	s0,48(sp)
ffffffffc0205a2c:	e456                	sd	s5,8(sp)
ffffffffc0205a2e:	7704                	ld	s1,40(a4)
ffffffffc0205a30:	892e                	mv	s2,a1
ffffffffc0205a32:	decfc0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0205a36:	c169                	beqz	a0,ffffffffc0205af8 <sysfile_getdirentry+0xec>
ffffffffc0205a38:	842a                	mv	s0,a0
ffffffffc0205a3a:	c8c1                	beqz	s1,ffffffffc0205aca <sysfile_getdirentry+0xbe>
ffffffffc0205a3c:	03848a93          	addi	s5,s1,56
ffffffffc0205a40:	8556                	mv	a0,s5
ffffffffc0205a42:	cc3fe0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc0205a46:	000a3783          	ld	a5,0(s4)
ffffffffc0205a4a:	c399                	beqz	a5,ffffffffc0205a50 <sysfile_getdirentry+0x44>
ffffffffc0205a4c:	43dc                	lw	a5,4(a5)
ffffffffc0205a4e:	c8bc                	sw	a5,80(s1)
ffffffffc0205a50:	4705                	li	a4,1
ffffffffc0205a52:	46a1                	li	a3,8
ffffffffc0205a54:	864a                	mv	a2,s2
ffffffffc0205a56:	85a2                	mv	a1,s0
ffffffffc0205a58:	8526                	mv	a0,s1
ffffffffc0205a5a:	a6dfe0ef          	jal	ra,ffffffffc02044c6 <copy_from_user>
ffffffffc0205a5e:	e505                	bnez	a0,ffffffffc0205a86 <sysfile_getdirentry+0x7a>
ffffffffc0205a60:	8556                	mv	a0,s5
ffffffffc0205a62:	c9ffe0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0205a66:	59f5                	li	s3,-3
ffffffffc0205a68:	0404a823          	sw	zero,80(s1)
ffffffffc0205a6c:	8522                	mv	a0,s0
ffffffffc0205a6e:	e60fc0ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0205a72:	70e2                	ld	ra,56(sp)
ffffffffc0205a74:	7442                	ld	s0,48(sp)
ffffffffc0205a76:	74a2                	ld	s1,40(sp)
ffffffffc0205a78:	7902                	ld	s2,32(sp)
ffffffffc0205a7a:	6a42                	ld	s4,16(sp)
ffffffffc0205a7c:	6aa2                	ld	s5,8(sp)
ffffffffc0205a7e:	854e                	mv	a0,s3
ffffffffc0205a80:	69e2                	ld	s3,24(sp)
ffffffffc0205a82:	6121                	addi	sp,sp,64
ffffffffc0205a84:	8082                	ret
ffffffffc0205a86:	8556                	mv	a0,s5
ffffffffc0205a88:	c79fe0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0205a8c:	854e                	mv	a0,s3
ffffffffc0205a8e:	85a2                	mv	a1,s0
ffffffffc0205a90:	0404a823          	sw	zero,80(s1)
ffffffffc0205a94:	f5cff0ef          	jal	ra,ffffffffc02051f0 <file_getdirentry>
ffffffffc0205a98:	89aa                	mv	s3,a0
ffffffffc0205a9a:	f969                	bnez	a0,ffffffffc0205a6c <sysfile_getdirentry+0x60>
ffffffffc0205a9c:	8556                	mv	a0,s5
ffffffffc0205a9e:	c67fe0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc0205aa2:	000a3783          	ld	a5,0(s4)
ffffffffc0205aa6:	c399                	beqz	a5,ffffffffc0205aac <sysfile_getdirentry+0xa0>
ffffffffc0205aa8:	43dc                	lw	a5,4(a5)
ffffffffc0205aaa:	c8bc                	sw	a5,80(s1)
ffffffffc0205aac:	10800693          	li	a3,264
ffffffffc0205ab0:	8622                	mv	a2,s0
ffffffffc0205ab2:	85ca                	mv	a1,s2
ffffffffc0205ab4:	8526                	mv	a0,s1
ffffffffc0205ab6:	a45fe0ef          	jal	ra,ffffffffc02044fa <copy_to_user>
ffffffffc0205aba:	e111                	bnez	a0,ffffffffc0205abe <sysfile_getdirentry+0xb2>
ffffffffc0205abc:	59f5                	li	s3,-3
ffffffffc0205abe:	8556                	mv	a0,s5
ffffffffc0205ac0:	c41fe0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0205ac4:	0404a823          	sw	zero,80(s1)
ffffffffc0205ac8:	b755                	j	ffffffffc0205a6c <sysfile_getdirentry+0x60>
ffffffffc0205aca:	85aa                	mv	a1,a0
ffffffffc0205acc:	4705                	li	a4,1
ffffffffc0205ace:	46a1                	li	a3,8
ffffffffc0205ad0:	864a                	mv	a2,s2
ffffffffc0205ad2:	4501                	li	a0,0
ffffffffc0205ad4:	9f3fe0ef          	jal	ra,ffffffffc02044c6 <copy_from_user>
ffffffffc0205ad8:	cd11                	beqz	a0,ffffffffc0205af4 <sysfile_getdirentry+0xe8>
ffffffffc0205ada:	854e                	mv	a0,s3
ffffffffc0205adc:	85a2                	mv	a1,s0
ffffffffc0205ade:	f12ff0ef          	jal	ra,ffffffffc02051f0 <file_getdirentry>
ffffffffc0205ae2:	89aa                	mv	s3,a0
ffffffffc0205ae4:	f541                	bnez	a0,ffffffffc0205a6c <sysfile_getdirentry+0x60>
ffffffffc0205ae6:	10800693          	li	a3,264
ffffffffc0205aea:	8622                	mv	a2,s0
ffffffffc0205aec:	85ca                	mv	a1,s2
ffffffffc0205aee:	a0dfe0ef          	jal	ra,ffffffffc02044fa <copy_to_user>
ffffffffc0205af2:	fd2d                	bnez	a0,ffffffffc0205a6c <sysfile_getdirentry+0x60>
ffffffffc0205af4:	59f5                	li	s3,-3
ffffffffc0205af6:	bf9d                	j	ffffffffc0205a6c <sysfile_getdirentry+0x60>
ffffffffc0205af8:	59f1                	li	s3,-4
ffffffffc0205afa:	bfa5                	j	ffffffffc0205a72 <sysfile_getdirentry+0x66>

ffffffffc0205afc <sysfile_dup>:
ffffffffc0205afc:	fdaff06f          	j	ffffffffc02052d6 <file_dup>

ffffffffc0205b00 <kernel_thread_entry>:
ffffffffc0205b00:	8526                	mv	a0,s1
ffffffffc0205b02:	9402                	jalr	s0
ffffffffc0205b04:	784000ef          	jal	ra,ffffffffc0206288 <do_exit>

ffffffffc0205b08 <alloc_proc>:
ffffffffc0205b08:	7179                	addi	sp,sp,-48
ffffffffc0205b0a:	15000513          	li	a0,336
ffffffffc0205b0e:	f022                	sd	s0,32(sp)
ffffffffc0205b10:	f406                	sd	ra,40(sp)
ffffffffc0205b12:	ec26                	sd	s1,24(sp)
ffffffffc0205b14:	e84a                	sd	s2,16(sp)
ffffffffc0205b16:	e44e                	sd	s3,8(sp)
ffffffffc0205b18:	e052                	sd	s4,0(sp)
ffffffffc0205b1a:	d04fc0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0205b1e:	842a                	mv	s0,a0
ffffffffc0205b20:	c17d                	beqz	a0,ffffffffc0205c06 <alloc_proc+0xfe>
ffffffffc0205b22:	59fd                	li	s3,-1
ffffffffc0205b24:	1982                	slli	s3,s3,0x20
ffffffffc0205b26:	03050913          	addi	s2,a0,48
ffffffffc0205b2a:	07000613          	li	a2,112
ffffffffc0205b2e:	4581                	li	a1,0
ffffffffc0205b30:	01353023          	sd	s3,0(a0)
ffffffffc0205b34:	00052423          	sw	zero,8(a0)
ffffffffc0205b38:	00053823          	sd	zero,16(a0)
ffffffffc0205b3c:	00053c23          	sd	zero,24(a0)
ffffffffc0205b40:	02053023          	sd	zero,32(a0)
ffffffffc0205b44:	02053423          	sd	zero,40(a0)
ffffffffc0205b48:	854a                	mv	a0,s2
ffffffffc0205b4a:	511050ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0205b4e:	00091a17          	auipc	s4,0x91
ffffffffc0205b52:	d42a0a13          	addi	s4,s4,-702 # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0205b56:	000a3783          	ld	a5,0(s4)
ffffffffc0205b5a:	0b440493          	addi	s1,s0,180
ffffffffc0205b5e:	4641                	li	a2,16
ffffffffc0205b60:	4581                	li	a1,0
ffffffffc0205b62:	f45c                	sd	a5,168(s0)
ffffffffc0205b64:	0a043023          	sd	zero,160(s0)
ffffffffc0205b68:	0a042823          	sw	zero,176(s0)
ffffffffc0205b6c:	8526                	mv	a0,s1
ffffffffc0205b6e:	4ed050ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0205b72:	0c840713          	addi	a4,s0,200
ffffffffc0205b76:	0d840793          	addi	a5,s0,216
ffffffffc0205b7a:	07000613          	li	a2,112
ffffffffc0205b7e:	4581                	li	a1,0
ffffffffc0205b80:	e878                	sd	a4,208(s0)
ffffffffc0205b82:	e478                	sd	a4,200(s0)
ffffffffc0205b84:	f07c                	sd	a5,224(s0)
ffffffffc0205b86:	ec7c                	sd	a5,216(s0)
ffffffffc0205b88:	0e043423          	sd	zero,232(s0)
ffffffffc0205b8c:	0e043823          	sd	zero,240(s0)
ffffffffc0205b90:	0e043c23          	sd	zero,248(s0)
ffffffffc0205b94:	10043023          	sd	zero,256(s0)
ffffffffc0205b98:	01343023          	sd	s3,0(s0)
ffffffffc0205b9c:	00042423          	sw	zero,8(s0)
ffffffffc0205ba0:	00043823          	sd	zero,16(s0)
ffffffffc0205ba4:	00043c23          	sd	zero,24(s0)
ffffffffc0205ba8:	02043023          	sd	zero,32(s0)
ffffffffc0205bac:	02043423          	sd	zero,40(s0)
ffffffffc0205bb0:	854a                	mv	a0,s2
ffffffffc0205bb2:	4a9050ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0205bb6:	000a3783          	ld	a5,0(s4)
ffffffffc0205bba:	0a043023          	sd	zero,160(s0)
ffffffffc0205bbe:	0a042823          	sw	zero,176(s0)
ffffffffc0205bc2:	f45c                	sd	a5,168(s0)
ffffffffc0205bc4:	463d                	li	a2,15
ffffffffc0205bc6:	4581                	li	a1,0
ffffffffc0205bc8:	8526                	mv	a0,s1
ffffffffc0205bca:	491050ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0205bce:	11040793          	addi	a5,s0,272
ffffffffc0205bd2:	0e042623          	sw	zero,236(s0)
ffffffffc0205bd6:	0e043c23          	sd	zero,248(s0)
ffffffffc0205bda:	10043023          	sd	zero,256(s0)
ffffffffc0205bde:	0e043823          	sd	zero,240(s0)
ffffffffc0205be2:	10043423          	sd	zero,264(s0)
ffffffffc0205be6:	10f43c23          	sd	a5,280(s0)
ffffffffc0205bea:	10f43823          	sd	a5,272(s0)
ffffffffc0205bee:	12042023          	sw	zero,288(s0)
ffffffffc0205bf2:	12043423          	sd	zero,296(s0)
ffffffffc0205bf6:	12043823          	sd	zero,304(s0)
ffffffffc0205bfa:	12043c23          	sd	zero,312(s0)
ffffffffc0205bfe:	14043023          	sd	zero,320(s0)
ffffffffc0205c02:	14043423          	sd	zero,328(s0)
ffffffffc0205c06:	70a2                	ld	ra,40(sp)
ffffffffc0205c08:	8522                	mv	a0,s0
ffffffffc0205c0a:	7402                	ld	s0,32(sp)
ffffffffc0205c0c:	64e2                	ld	s1,24(sp)
ffffffffc0205c0e:	6942                	ld	s2,16(sp)
ffffffffc0205c10:	69a2                	ld	s3,8(sp)
ffffffffc0205c12:	6a02                	ld	s4,0(sp)
ffffffffc0205c14:	6145                	addi	sp,sp,48
ffffffffc0205c16:	8082                	ret

ffffffffc0205c18 <forkret>:
ffffffffc0205c18:	00091797          	auipc	a5,0x91
ffffffffc0205c1c:	ca87b783          	ld	a5,-856(a5) # ffffffffc02968c0 <current>
ffffffffc0205c20:	73c8                	ld	a0,160(a5)
ffffffffc0205c22:	f18fb06f          	j	ffffffffc020133a <forkrets>

ffffffffc0205c26 <pa2page.part.0>:
ffffffffc0205c26:	1141                	addi	sp,sp,-16
ffffffffc0205c28:	00007617          	auipc	a2,0x7
ffffffffc0205c2c:	d4060613          	addi	a2,a2,-704 # ffffffffc020c968 <default_pmm_manager+0x108>
ffffffffc0205c30:	06900593          	li	a1,105
ffffffffc0205c34:	00007517          	auipc	a0,0x7
ffffffffc0205c38:	c8c50513          	addi	a0,a0,-884 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc0205c3c:	e406                	sd	ra,8(sp)
ffffffffc0205c3e:	861fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205c42 <put_pgdir.isra.0>:
ffffffffc0205c42:	1141                	addi	sp,sp,-16
ffffffffc0205c44:	e406                	sd	ra,8(sp)
ffffffffc0205c46:	c02007b7          	lui	a5,0xc0200
ffffffffc0205c4a:	02f56e63          	bltu	a0,a5,ffffffffc0205c86 <put_pgdir.isra.0+0x44>
ffffffffc0205c4e:	00091697          	auipc	a3,0x91
ffffffffc0205c52:	c6a6b683          	ld	a3,-918(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205c56:	8d15                	sub	a0,a0,a3
ffffffffc0205c58:	8131                	srli	a0,a0,0xc
ffffffffc0205c5a:	00091797          	auipc	a5,0x91
ffffffffc0205c5e:	c467b783          	ld	a5,-954(a5) # ffffffffc02968a0 <npage>
ffffffffc0205c62:	02f57f63          	bgeu	a0,a5,ffffffffc0205ca0 <put_pgdir.isra.0+0x5e>
ffffffffc0205c66:	0000a697          	auipc	a3,0xa
ffffffffc0205c6a:	0c26b683          	ld	a3,194(a3) # ffffffffc020fd28 <nbase>
ffffffffc0205c6e:	60a2                	ld	ra,8(sp)
ffffffffc0205c70:	8d15                	sub	a0,a0,a3
ffffffffc0205c72:	00091797          	auipc	a5,0x91
ffffffffc0205c76:	c367b783          	ld	a5,-970(a5) # ffffffffc02968a8 <pages>
ffffffffc0205c7a:	051a                	slli	a0,a0,0x6
ffffffffc0205c7c:	4585                	li	a1,1
ffffffffc0205c7e:	953e                	add	a0,a0,a5
ffffffffc0205c80:	0141                	addi	sp,sp,16
ffffffffc0205c82:	db8fc06f          	j	ffffffffc020223a <free_pages>
ffffffffc0205c86:	86aa                	mv	a3,a0
ffffffffc0205c88:	00007617          	auipc	a2,0x7
ffffffffc0205c8c:	cb860613          	addi	a2,a2,-840 # ffffffffc020c940 <default_pmm_manager+0xe0>
ffffffffc0205c90:	07700593          	li	a1,119
ffffffffc0205c94:	00007517          	auipc	a0,0x7
ffffffffc0205c98:	c2c50513          	addi	a0,a0,-980 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc0205c9c:	803fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205ca0:	f87ff0ef          	jal	ra,ffffffffc0205c26 <pa2page.part.0>

ffffffffc0205ca4 <user_mem_store_bytes>:
ffffffffc0205ca4:	caf9                	beqz	a3,ffffffffc0205d7a <user_mem_store_bytes+0xd6>
ffffffffc0205ca6:	7159                	addi	sp,sp,-112
ffffffffc0205ca8:	e0d2                	sd	s4,64(sp)
ffffffffc0205caa:	fc56                	sd	s5,56(sp)
ffffffffc0205cac:	5a7d                	li	s4,-1
ffffffffc0205cae:	6a85                	lui	s5,0x1
ffffffffc0205cb0:	f0a2                	sd	s0,96(sp)
ffffffffc0205cb2:	eca6                	sd	s1,88(sp)
ffffffffc0205cb4:	e8ca                	sd	s2,80(sp)
ffffffffc0205cb6:	e4ce                	sd	s3,72(sp)
ffffffffc0205cb8:	f85a                	sd	s6,48(sp)
ffffffffc0205cba:	f45e                	sd	s7,40(sp)
ffffffffc0205cbc:	f062                	sd	s8,32(sp)
ffffffffc0205cbe:	ec66                	sd	s9,24(sp)
ffffffffc0205cc0:	e86a                	sd	s10,16(sp)
ffffffffc0205cc2:	f486                	sd	ra,104(sp)
ffffffffc0205cc4:	e46e                	sd	s11,8(sp)
ffffffffc0205cc6:	8436                	mv	s0,a3
ffffffffc0205cc8:	84aa                	mv	s1,a0
ffffffffc0205cca:	892e                	mv	s2,a1
ffffffffc0205ccc:	89b2                	mv	s3,a2
ffffffffc0205cce:	4d01                	li	s10,0
ffffffffc0205cd0:	00091c97          	auipc	s9,0x91
ffffffffc0205cd4:	bd0c8c93          	addi	s9,s9,-1072 # ffffffffc02968a0 <npage>
ffffffffc0205cd8:	0000ac17          	auipc	s8,0xa
ffffffffc0205cdc:	050c0c13          	addi	s8,s8,80 # ffffffffc020fd28 <nbase>
ffffffffc0205ce0:	fffa8b93          	addi	s7,s5,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0205ce4:	00ca5a13          	srli	s4,s4,0xc
ffffffffc0205ce8:	00091b17          	auipc	s6,0x91
ffffffffc0205cec:	bd0b0b13          	addi	s6,s6,-1072 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205cf0:	a899                	j	ffffffffc0205d46 <user_mem_store_bytes+0xa2>
ffffffffc0205cf2:	611c                	ld	a5,0(a0)
ffffffffc0205cf4:	0017f713          	andi	a4,a5,1
ffffffffc0205cf8:	cf39                	beqz	a4,ffffffffc0205d56 <user_mem_store_bytes+0xb2>
ffffffffc0205cfa:	000cb703          	ld	a4,0(s9)
ffffffffc0205cfe:	078a                	slli	a5,a5,0x2
ffffffffc0205d00:	83b1                	srli	a5,a5,0xc
ffffffffc0205d02:	08e7fa63          	bgeu	a5,a4,ffffffffc0205d96 <user_mem_store_bytes+0xf2>
ffffffffc0205d06:	017df533          	and	a0,s11,s7
ffffffffc0205d0a:	40aa86b3          	sub	a3,s5,a0
ffffffffc0205d0e:	41a40633          	sub	a2,s0,s10
ffffffffc0205d12:	000c3583          	ld	a1,0(s8)
ffffffffc0205d16:	00c6f363          	bgeu	a3,a2,ffffffffc0205d1c <user_mem_store_bytes+0x78>
ffffffffc0205d1a:	8636                	mv	a2,a3
ffffffffc0205d1c:	40b786b3          	sub	a3,a5,a1
ffffffffc0205d20:	069a                	slli	a3,a3,0x6
ffffffffc0205d22:	8699                	srai	a3,a3,0x6
ffffffffc0205d24:	96ae                	add	a3,a3,a1
ffffffffc0205d26:	0146f7b3          	and	a5,a3,s4
ffffffffc0205d2a:	06b2                	slli	a3,a3,0xc
ffffffffc0205d2c:	04e7f963          	bgeu	a5,a4,ffffffffc0205d7e <user_mem_store_bytes+0xda>
ffffffffc0205d30:	000b3783          	ld	a5,0(s6)
ffffffffc0205d34:	01a985b3          	add	a1,s3,s10
ffffffffc0205d38:	9d32                	add	s10,s10,a2
ffffffffc0205d3a:	96be                	add	a3,a3,a5
ffffffffc0205d3c:	9536                	add	a0,a0,a3
ffffffffc0205d3e:	36f050ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc0205d42:	028d7a63          	bgeu	s10,s0,ffffffffc0205d76 <user_mem_store_bytes+0xd2>
ffffffffc0205d46:	01a90db3          	add	s11,s2,s10
ffffffffc0205d4a:	4601                	li	a2,0
ffffffffc0205d4c:	85ee                	mv	a1,s11
ffffffffc0205d4e:	8526                	mv	a0,s1
ffffffffc0205d50:	d64fc0ef          	jal	ra,ffffffffc02022b4 <get_pte>
ffffffffc0205d54:	fd59                	bnez	a0,ffffffffc0205cf2 <user_mem_store_bytes+0x4e>
ffffffffc0205d56:	5575                	li	a0,-3
ffffffffc0205d58:	70a6                	ld	ra,104(sp)
ffffffffc0205d5a:	7406                	ld	s0,96(sp)
ffffffffc0205d5c:	64e6                	ld	s1,88(sp)
ffffffffc0205d5e:	6946                	ld	s2,80(sp)
ffffffffc0205d60:	69a6                	ld	s3,72(sp)
ffffffffc0205d62:	6a06                	ld	s4,64(sp)
ffffffffc0205d64:	7ae2                	ld	s5,56(sp)
ffffffffc0205d66:	7b42                	ld	s6,48(sp)
ffffffffc0205d68:	7ba2                	ld	s7,40(sp)
ffffffffc0205d6a:	7c02                	ld	s8,32(sp)
ffffffffc0205d6c:	6ce2                	ld	s9,24(sp)
ffffffffc0205d6e:	6d42                	ld	s10,16(sp)
ffffffffc0205d70:	6da2                	ld	s11,8(sp)
ffffffffc0205d72:	6165                	addi	sp,sp,112
ffffffffc0205d74:	8082                	ret
ffffffffc0205d76:	4501                	li	a0,0
ffffffffc0205d78:	b7c5                	j	ffffffffc0205d58 <user_mem_store_bytes+0xb4>
ffffffffc0205d7a:	4501                	li	a0,0
ffffffffc0205d7c:	8082                	ret
ffffffffc0205d7e:	00007617          	auipc	a2,0x7
ffffffffc0205d82:	b1a60613          	addi	a2,a2,-1254 # ffffffffc020c898 <default_pmm_manager+0x38>
ffffffffc0205d86:	07100593          	li	a1,113
ffffffffc0205d8a:	00007517          	auipc	a0,0x7
ffffffffc0205d8e:	b3650513          	addi	a0,a0,-1226 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc0205d92:	f0cfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205d96:	00007617          	auipc	a2,0x7
ffffffffc0205d9a:	bd260613          	addi	a2,a2,-1070 # ffffffffc020c968 <default_pmm_manager+0x108>
ffffffffc0205d9e:	06900593          	li	a1,105
ffffffffc0205da2:	00007517          	auipc	a0,0x7
ffffffffc0205da6:	b1e50513          	addi	a0,a0,-1250 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc0205daa:	ef4fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205dae <proc_run>:
ffffffffc0205dae:	7179                	addi	sp,sp,-48
ffffffffc0205db0:	f026                	sd	s1,32(sp)
ffffffffc0205db2:	00091497          	auipc	s1,0x91
ffffffffc0205db6:	b0e48493          	addi	s1,s1,-1266 # ffffffffc02968c0 <current>
ffffffffc0205dba:	6098                	ld	a4,0(s1)
ffffffffc0205dbc:	f406                	sd	ra,40(sp)
ffffffffc0205dbe:	ec4a                	sd	s2,24(sp)
ffffffffc0205dc0:	02a70963          	beq	a4,a0,ffffffffc0205df2 <proc_run+0x44>
ffffffffc0205dc4:	100027f3          	csrr	a5,sstatus
ffffffffc0205dc8:	8b89                	andi	a5,a5,2
ffffffffc0205dca:	4901                	li	s2,0
ffffffffc0205dcc:	ef95                	bnez	a5,ffffffffc0205e08 <proc_run+0x5a>
ffffffffc0205dce:	755c                	ld	a5,168(a0)
ffffffffc0205dd0:	56fd                	li	a3,-1
ffffffffc0205dd2:	16fe                	slli	a3,a3,0x3f
ffffffffc0205dd4:	83b1                	srli	a5,a5,0xc
ffffffffc0205dd6:	e088                	sd	a0,0(s1)
ffffffffc0205dd8:	8fd5                	or	a5,a5,a3
ffffffffc0205dda:	18079073          	csrw	satp,a5
ffffffffc0205dde:	12000073          	sfence.vma
ffffffffc0205de2:	03050593          	addi	a1,a0,48
ffffffffc0205de6:	03070513          	addi	a0,a4,48
ffffffffc0205dea:	6ae010ef          	jal	ra,ffffffffc0207498 <switch_to>
ffffffffc0205dee:	00091763          	bnez	s2,ffffffffc0205dfc <proc_run+0x4e>
ffffffffc0205df2:	70a2                	ld	ra,40(sp)
ffffffffc0205df4:	7482                	ld	s1,32(sp)
ffffffffc0205df6:	6962                	ld	s2,24(sp)
ffffffffc0205df8:	6145                	addi	sp,sp,48
ffffffffc0205dfa:	8082                	ret
ffffffffc0205dfc:	70a2                	ld	ra,40(sp)
ffffffffc0205dfe:	7482                	ld	s1,32(sp)
ffffffffc0205e00:	6962                	ld	s2,24(sp)
ffffffffc0205e02:	6145                	addi	sp,sp,48
ffffffffc0205e04:	e69fa06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0205e08:	e42a                	sd	a0,8(sp)
ffffffffc0205e0a:	e69fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205e0e:	6098                	ld	a4,0(s1)
ffffffffc0205e10:	6522                	ld	a0,8(sp)
ffffffffc0205e12:	4905                	li	s2,1
ffffffffc0205e14:	bf6d                	j	ffffffffc0205dce <proc_run+0x20>

ffffffffc0205e16 <do_fork>:
ffffffffc0205e16:	7119                	addi	sp,sp,-128
ffffffffc0205e18:	e8d2                	sd	s4,80(sp)
ffffffffc0205e1a:	00091a17          	auipc	s4,0x91
ffffffffc0205e1e:	abea0a13          	addi	s4,s4,-1346 # ffffffffc02968d8 <nr_process>
ffffffffc0205e22:	000a2703          	lw	a4,0(s4)
ffffffffc0205e26:	fc86                	sd	ra,120(sp)
ffffffffc0205e28:	f8a2                	sd	s0,112(sp)
ffffffffc0205e2a:	f4a6                	sd	s1,104(sp)
ffffffffc0205e2c:	f0ca                	sd	s2,96(sp)
ffffffffc0205e2e:	ecce                	sd	s3,88(sp)
ffffffffc0205e30:	e4d6                	sd	s5,72(sp)
ffffffffc0205e32:	e0da                	sd	s6,64(sp)
ffffffffc0205e34:	fc5e                	sd	s7,56(sp)
ffffffffc0205e36:	f862                	sd	s8,48(sp)
ffffffffc0205e38:	f466                	sd	s9,40(sp)
ffffffffc0205e3a:	f06a                	sd	s10,32(sp)
ffffffffc0205e3c:	ec6e                	sd	s11,24(sp)
ffffffffc0205e3e:	6785                	lui	a5,0x1
ffffffffc0205e40:	36f75563          	bge	a4,a5,ffffffffc02061aa <do_fork+0x394>
ffffffffc0205e44:	892a                	mv	s2,a0
ffffffffc0205e46:	89ae                	mv	s3,a1
ffffffffc0205e48:	8432                	mv	s0,a2
ffffffffc0205e4a:	cbfff0ef          	jal	ra,ffffffffc0205b08 <alloc_proc>
ffffffffc0205e4e:	84aa                	mv	s1,a0
ffffffffc0205e50:	34050263          	beqz	a0,ffffffffc0206194 <do_fork+0x37e>
ffffffffc0205e54:	100027f3          	csrr	a5,sstatus
ffffffffc0205e58:	8b89                	andi	a5,a5,2
ffffffffc0205e5a:	00091c17          	auipc	s8,0x91
ffffffffc0205e5e:	a66c0c13          	addi	s8,s8,-1434 # ffffffffc02968c0 <current>
ffffffffc0205e62:	2c079c63          	bnez	a5,ffffffffc020613a <do_fork+0x324>
ffffffffc0205e66:	000c3783          	ld	a5,0(s8)
ffffffffc0205e6a:	f11c                	sd	a5,32(a0)
ffffffffc0205e6c:	4509                	li	a0,2
ffffffffc0205e6e:	b8efc0ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc0205e72:	30050e63          	beqz	a0,ffffffffc020618e <do_fork+0x378>
ffffffffc0205e76:	00091b97          	auipc	s7,0x91
ffffffffc0205e7a:	a32b8b93          	addi	s7,s7,-1486 # ffffffffc02968a8 <pages>
ffffffffc0205e7e:	000bb683          	ld	a3,0(s7)
ffffffffc0205e82:	00091b17          	auipc	s6,0x91
ffffffffc0205e86:	a1eb0b13          	addi	s6,s6,-1506 # ffffffffc02968a0 <npage>
ffffffffc0205e8a:	0000aa97          	auipc	s5,0xa
ffffffffc0205e8e:	e9eaba83          	ld	s5,-354(s5) # ffffffffc020fd28 <nbase>
ffffffffc0205e92:	40d506b3          	sub	a3,a0,a3
ffffffffc0205e96:	8699                	srai	a3,a3,0x6
ffffffffc0205e98:	5d7d                	li	s10,-1
ffffffffc0205e9a:	000b3783          	ld	a5,0(s6)
ffffffffc0205e9e:	96d6                	add	a3,a3,s5
ffffffffc0205ea0:	00cd5d13          	srli	s10,s10,0xc
ffffffffc0205ea4:	01a6f733          	and	a4,a3,s10
ffffffffc0205ea8:	06b2                	slli	a3,a3,0xc
ffffffffc0205eaa:	32f77f63          	bgeu	a4,a5,ffffffffc02061e8 <do_fork+0x3d2>
ffffffffc0205eae:	000c3883          	ld	a7,0(s8)
ffffffffc0205eb2:	00091c97          	auipc	s9,0x91
ffffffffc0205eb6:	a06c8c93          	addi	s9,s9,-1530 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205eba:	000cb703          	ld	a4,0(s9)
ffffffffc0205ebe:	0288bd83          	ld	s11,40(a7) # 1028 <_binary_bin_swap_img_size-0x6cd8>
ffffffffc0205ec2:	96ba                	add	a3,a3,a4
ffffffffc0205ec4:	e894                	sd	a3,16(s1)
ffffffffc0205ec6:	020d8a63          	beqz	s11,ffffffffc0205efa <do_fork+0xe4>
ffffffffc0205eca:	10097713          	andi	a4,s2,256
ffffffffc0205ece:	1e070663          	beqz	a4,ffffffffc02060ba <do_fork+0x2a4>
ffffffffc0205ed2:	030da683          	lw	a3,48(s11)
ffffffffc0205ed6:	018db703          	ld	a4,24(s11)
ffffffffc0205eda:	c0200637          	lui	a2,0xc0200
ffffffffc0205ede:	2685                	addiw	a3,a3,1
ffffffffc0205ee0:	02dda823          	sw	a3,48(s11)
ffffffffc0205ee4:	03b4b423          	sd	s11,40(s1)
ffffffffc0205ee8:	2ec76363          	bltu	a4,a2,ffffffffc02061ce <do_fork+0x3b8>
ffffffffc0205eec:	000cb783          	ld	a5,0(s9)
ffffffffc0205ef0:	000c3883          	ld	a7,0(s8)
ffffffffc0205ef4:	6894                	ld	a3,16(s1)
ffffffffc0205ef6:	8f1d                	sub	a4,a4,a5
ffffffffc0205ef8:	f4d8                	sd	a4,168(s1)
ffffffffc0205efa:	6789                	lui	a5,0x2
ffffffffc0205efc:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0205f00:	96be                	add	a3,a3,a5
ffffffffc0205f02:	f0d4                	sd	a3,160(s1)
ffffffffc0205f04:	87b6                	mv	a5,a3
ffffffffc0205f06:	12040813          	addi	a6,s0,288
ffffffffc0205f0a:	6008                	ld	a0,0(s0)
ffffffffc0205f0c:	640c                	ld	a1,8(s0)
ffffffffc0205f0e:	6810                	ld	a2,16(s0)
ffffffffc0205f10:	6c18                	ld	a4,24(s0)
ffffffffc0205f12:	e388                	sd	a0,0(a5)
ffffffffc0205f14:	e78c                	sd	a1,8(a5)
ffffffffc0205f16:	eb90                	sd	a2,16(a5)
ffffffffc0205f18:	ef98                	sd	a4,24(a5)
ffffffffc0205f1a:	02040413          	addi	s0,s0,32
ffffffffc0205f1e:	02078793          	addi	a5,a5,32
ffffffffc0205f22:	ff0414e3          	bne	s0,a6,ffffffffc0205f0a <do_fork+0xf4>
ffffffffc0205f26:	0406b823          	sd	zero,80(a3)
ffffffffc0205f2a:	14098e63          	beqz	s3,ffffffffc0206086 <do_fork+0x270>
ffffffffc0205f2e:	1488b403          	ld	s0,328(a7)
ffffffffc0205f32:	00000797          	auipc	a5,0x0
ffffffffc0205f36:	ce678793          	addi	a5,a5,-794 # ffffffffc0205c18 <forkret>
ffffffffc0205f3a:	0136b823          	sd	s3,16(a3)
ffffffffc0205f3e:	f89c                	sd	a5,48(s1)
ffffffffc0205f40:	fc94                	sd	a3,56(s1)
ffffffffc0205f42:	2c040b63          	beqz	s0,ffffffffc0206218 <do_fork+0x402>
ffffffffc0205f46:	00b95913          	srli	s2,s2,0xb
ffffffffc0205f4a:	00197913          	andi	s2,s2,1
ffffffffc0205f4e:	12090e63          	beqz	s2,ffffffffc020608a <do_fork+0x274>
ffffffffc0205f52:	481c                	lw	a5,16(s0)
ffffffffc0205f54:	2785                	addiw	a5,a5,1
ffffffffc0205f56:	c81c                	sw	a5,16(s0)
ffffffffc0205f58:	1484b423          	sd	s0,328(s1)
ffffffffc0205f5c:	100027f3          	csrr	a5,sstatus
ffffffffc0205f60:	8b89                	andi	a5,a5,2
ffffffffc0205f62:	22079b63          	bnez	a5,ffffffffc0206198 <do_fork+0x382>
ffffffffc0205f66:	4901                	li	s2,0
ffffffffc0205f68:	0008b817          	auipc	a6,0x8b
ffffffffc0205f6c:	0f080813          	addi	a6,a6,240 # ffffffffc0291058 <last_pid.1>
ffffffffc0205f70:	00082783          	lw	a5,0(a6)
ffffffffc0205f74:	6709                	lui	a4,0x2
ffffffffc0205f76:	0017851b          	addiw	a0,a5,1
ffffffffc0205f7a:	00a82023          	sw	a0,0(a6)
ffffffffc0205f7e:	08e55d63          	bge	a0,a4,ffffffffc0206018 <do_fork+0x202>
ffffffffc0205f82:	0008b317          	auipc	t1,0x8b
ffffffffc0205f86:	0da30313          	addi	t1,t1,218 # ffffffffc029105c <next_safe.0>
ffffffffc0205f8a:	00032783          	lw	a5,0(t1)
ffffffffc0205f8e:	00090417          	auipc	s0,0x90
ffffffffc0205f92:	83240413          	addi	s0,s0,-1998 # ffffffffc02957c0 <proc_list>
ffffffffc0205f96:	08f55963          	bge	a0,a5,ffffffffc0206028 <do_fork+0x212>
ffffffffc0205f9a:	c0c8                	sw	a0,4(s1)
ffffffffc0205f9c:	45a9                	li	a1,10
ffffffffc0205f9e:	2501                	sext.w	a0,a0
ffffffffc0205fa0:	386050ef          	jal	ra,ffffffffc020b326 <hash32>
ffffffffc0205fa4:	02051793          	slli	a5,a0,0x20
ffffffffc0205fa8:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0205fac:	0008c797          	auipc	a5,0x8c
ffffffffc0205fb0:	81478793          	addi	a5,a5,-2028 # ffffffffc02917c0 <hash_list>
ffffffffc0205fb4:	953e                	add	a0,a0,a5
ffffffffc0205fb6:	650c                	ld	a1,8(a0)
ffffffffc0205fb8:	7094                	ld	a3,32(s1)
ffffffffc0205fba:	0d848793          	addi	a5,s1,216
ffffffffc0205fbe:	e19c                	sd	a5,0(a1)
ffffffffc0205fc0:	6410                	ld	a2,8(s0)
ffffffffc0205fc2:	e51c                	sd	a5,8(a0)
ffffffffc0205fc4:	7af8                	ld	a4,240(a3)
ffffffffc0205fc6:	0c848793          	addi	a5,s1,200
ffffffffc0205fca:	f0ec                	sd	a1,224(s1)
ffffffffc0205fcc:	ece8                	sd	a0,216(s1)
ffffffffc0205fce:	e21c                	sd	a5,0(a2)
ffffffffc0205fd0:	e41c                	sd	a5,8(s0)
ffffffffc0205fd2:	e8f0                	sd	a2,208(s1)
ffffffffc0205fd4:	e4e0                	sd	s0,200(s1)
ffffffffc0205fd6:	0e04bc23          	sd	zero,248(s1)
ffffffffc0205fda:	10e4b023          	sd	a4,256(s1)
ffffffffc0205fde:	c311                	beqz	a4,ffffffffc0205fe2 <do_fork+0x1cc>
ffffffffc0205fe0:	ff64                	sd	s1,248(a4)
ffffffffc0205fe2:	000a2783          	lw	a5,0(s4)
ffffffffc0205fe6:	fae4                	sd	s1,240(a3)
ffffffffc0205fe8:	2785                	addiw	a5,a5,1
ffffffffc0205fea:	00fa2023          	sw	a5,0(s4)
ffffffffc0205fee:	14091e63          	bnez	s2,ffffffffc020614a <do_fork+0x334>
ffffffffc0205ff2:	8526                	mv	a0,s1
ffffffffc0205ff4:	648010ef          	jal	ra,ffffffffc020763c <wakeup_proc>
ffffffffc0205ff8:	40c8                	lw	a0,4(s1)
ffffffffc0205ffa:	70e6                	ld	ra,120(sp)
ffffffffc0205ffc:	7446                	ld	s0,112(sp)
ffffffffc0205ffe:	74a6                	ld	s1,104(sp)
ffffffffc0206000:	7906                	ld	s2,96(sp)
ffffffffc0206002:	69e6                	ld	s3,88(sp)
ffffffffc0206004:	6a46                	ld	s4,80(sp)
ffffffffc0206006:	6aa6                	ld	s5,72(sp)
ffffffffc0206008:	6b06                	ld	s6,64(sp)
ffffffffc020600a:	7be2                	ld	s7,56(sp)
ffffffffc020600c:	7c42                	ld	s8,48(sp)
ffffffffc020600e:	7ca2                	ld	s9,40(sp)
ffffffffc0206010:	7d02                	ld	s10,32(sp)
ffffffffc0206012:	6de2                	ld	s11,24(sp)
ffffffffc0206014:	6109                	addi	sp,sp,128
ffffffffc0206016:	8082                	ret
ffffffffc0206018:	4785                	li	a5,1
ffffffffc020601a:	00f82023          	sw	a5,0(a6)
ffffffffc020601e:	4505                	li	a0,1
ffffffffc0206020:	0008b317          	auipc	t1,0x8b
ffffffffc0206024:	03c30313          	addi	t1,t1,60 # ffffffffc029105c <next_safe.0>
ffffffffc0206028:	0008f417          	auipc	s0,0x8f
ffffffffc020602c:	79840413          	addi	s0,s0,1944 # ffffffffc02957c0 <proc_list>
ffffffffc0206030:	00843e03          	ld	t3,8(s0)
ffffffffc0206034:	6789                	lui	a5,0x2
ffffffffc0206036:	00f32023          	sw	a5,0(t1)
ffffffffc020603a:	86aa                	mv	a3,a0
ffffffffc020603c:	4581                	li	a1,0
ffffffffc020603e:	6e89                	lui	t4,0x2
ffffffffc0206040:	168e0063          	beq	t3,s0,ffffffffc02061a0 <do_fork+0x38a>
ffffffffc0206044:	88ae                	mv	a7,a1
ffffffffc0206046:	87f2                	mv	a5,t3
ffffffffc0206048:	6609                	lui	a2,0x2
ffffffffc020604a:	a811                	j	ffffffffc020605e <do_fork+0x248>
ffffffffc020604c:	00e6d663          	bge	a3,a4,ffffffffc0206058 <do_fork+0x242>
ffffffffc0206050:	00c75463          	bge	a4,a2,ffffffffc0206058 <do_fork+0x242>
ffffffffc0206054:	863a                	mv	a2,a4
ffffffffc0206056:	4885                	li	a7,1
ffffffffc0206058:	679c                	ld	a5,8(a5)
ffffffffc020605a:	00878d63          	beq	a5,s0,ffffffffc0206074 <do_fork+0x25e>
ffffffffc020605e:	f3c7a703          	lw	a4,-196(a5) # 1f3c <_binary_bin_swap_img_size-0x5dc4>
ffffffffc0206062:	fed715e3          	bne	a4,a3,ffffffffc020604c <do_fork+0x236>
ffffffffc0206066:	2685                	addiw	a3,a3,1
ffffffffc0206068:	0ec6d463          	bge	a3,a2,ffffffffc0206150 <do_fork+0x33a>
ffffffffc020606c:	679c                	ld	a5,8(a5)
ffffffffc020606e:	4585                	li	a1,1
ffffffffc0206070:	fe8797e3          	bne	a5,s0,ffffffffc020605e <do_fork+0x248>
ffffffffc0206074:	c581                	beqz	a1,ffffffffc020607c <do_fork+0x266>
ffffffffc0206076:	00d82023          	sw	a3,0(a6)
ffffffffc020607a:	8536                	mv	a0,a3
ffffffffc020607c:	f0088fe3          	beqz	a7,ffffffffc0205f9a <do_fork+0x184>
ffffffffc0206080:	00c32023          	sw	a2,0(t1)
ffffffffc0206084:	bf19                	j	ffffffffc0205f9a <do_fork+0x184>
ffffffffc0206086:	89b6                	mv	s3,a3
ffffffffc0206088:	b55d                	j	ffffffffc0205f2e <do_fork+0x118>
ffffffffc020608a:	ae4ff0ef          	jal	ra,ffffffffc020536e <files_create>
ffffffffc020608e:	892a                	mv	s2,a0
ffffffffc0206090:	c911                	beqz	a0,ffffffffc02060a4 <do_fork+0x28e>
ffffffffc0206092:	85a2                	mv	a1,s0
ffffffffc0206094:	ba6ff0ef          	jal	ra,ffffffffc020543a <dup_files>
ffffffffc0206098:	844a                	mv	s0,s2
ffffffffc020609a:	ea050ce3          	beqz	a0,ffffffffc0205f52 <do_fork+0x13c>
ffffffffc020609e:	854a                	mv	a0,s2
ffffffffc02060a0:	b04ff0ef          	jal	ra,ffffffffc02053a4 <files_destroy>
ffffffffc02060a4:	1484b503          	ld	a0,328(s1)
ffffffffc02060a8:	cd45                	beqz	a0,ffffffffc0206160 <do_fork+0x34a>
ffffffffc02060aa:	491c                	lw	a5,16(a0)
ffffffffc02060ac:	fff7871b          	addiw	a4,a5,-1
ffffffffc02060b0:	c918                	sw	a4,16(a0)
ffffffffc02060b2:	e75d                	bnez	a4,ffffffffc0206160 <do_fork+0x34a>
ffffffffc02060b4:	af0ff0ef          	jal	ra,ffffffffc02053a4 <files_destroy>
ffffffffc02060b8:	a065                	j	ffffffffc0206160 <do_fork+0x34a>
ffffffffc02060ba:	bdffd0ef          	jal	ra,ffffffffc0203c98 <mm_create>
ffffffffc02060be:	e02a                	sd	a0,0(sp)
ffffffffc02060c0:	c145                	beqz	a0,ffffffffc0206160 <do_fork+0x34a>
ffffffffc02060c2:	4505                	li	a0,1
ffffffffc02060c4:	938fc0ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc02060c8:	c949                	beqz	a0,ffffffffc020615a <do_fork+0x344>
ffffffffc02060ca:	000bb683          	ld	a3,0(s7)
ffffffffc02060ce:	000b3703          	ld	a4,0(s6)
ffffffffc02060d2:	40d506b3          	sub	a3,a0,a3
ffffffffc02060d6:	8699                	srai	a3,a3,0x6
ffffffffc02060d8:	96d6                	add	a3,a3,s5
ffffffffc02060da:	01a6fd33          	and	s10,a3,s10
ffffffffc02060de:	06b2                	slli	a3,a3,0xc
ffffffffc02060e0:	10ed7463          	bgeu	s10,a4,ffffffffc02061e8 <do_fork+0x3d2>
ffffffffc02060e4:	000cbd03          	ld	s10,0(s9)
ffffffffc02060e8:	6605                	lui	a2,0x1
ffffffffc02060ea:	00090597          	auipc	a1,0x90
ffffffffc02060ee:	7ae5b583          	ld	a1,1966(a1) # ffffffffc0296898 <boot_pgdir_va>
ffffffffc02060f2:	9d36                	add	s10,s10,a3
ffffffffc02060f4:	856a                	mv	a0,s10
ffffffffc02060f6:	7b6050ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc02060fa:	6782                	ld	a5,0(sp)
ffffffffc02060fc:	038d8713          	addi	a4,s11,56
ffffffffc0206100:	853a                	mv	a0,a4
ffffffffc0206102:	01a7bc23          	sd	s10,24(a5)
ffffffffc0206106:	e43a                	sd	a4,8(sp)
ffffffffc0206108:	dfcfe0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc020610c:	000c3683          	ld	a3,0(s8)
ffffffffc0206110:	6722                	ld	a4,8(sp)
ffffffffc0206112:	c681                	beqz	a3,ffffffffc020611a <do_fork+0x304>
ffffffffc0206114:	42d4                	lw	a3,4(a3)
ffffffffc0206116:	04dda823          	sw	a3,80(s11)
ffffffffc020611a:	6502                	ld	a0,0(sp)
ffffffffc020611c:	85ee                	mv	a1,s11
ffffffffc020611e:	e43a                	sd	a4,8(sp)
ffffffffc0206120:	dc9fd0ef          	jal	ra,ffffffffc0203ee8 <dup_mmap>
ffffffffc0206124:	6722                	ld	a4,8(sp)
ffffffffc0206126:	8d2a                	mv	s10,a0
ffffffffc0206128:	853a                	mv	a0,a4
ffffffffc020612a:	dd6fe0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc020612e:	040da823          	sw	zero,80(s11)
ffffffffc0206132:	080d1163          	bnez	s10,ffffffffc02061b4 <do_fork+0x39e>
ffffffffc0206136:	6d82                	ld	s11,0(sp)
ffffffffc0206138:	bb69                	j	ffffffffc0205ed2 <do_fork+0xbc>
ffffffffc020613a:	b39fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020613e:	000c3783          	ld	a5,0(s8)
ffffffffc0206142:	f09c                	sd	a5,32(s1)
ffffffffc0206144:	b29fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0206148:	b315                	j	ffffffffc0205e6c <do_fork+0x56>
ffffffffc020614a:	b23fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020614e:	b555                	j	ffffffffc0205ff2 <do_fork+0x1dc>
ffffffffc0206150:	01d6c363          	blt	a3,t4,ffffffffc0206156 <do_fork+0x340>
ffffffffc0206154:	4685                	li	a3,1
ffffffffc0206156:	4585                	li	a1,1
ffffffffc0206158:	b5e5                	j	ffffffffc0206040 <do_fork+0x22a>
ffffffffc020615a:	6502                	ld	a0,0(sp)
ffffffffc020615c:	c8bfd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc0206160:	6894                	ld	a3,16(s1)
ffffffffc0206162:	c02007b7          	lui	a5,0xc0200
ffffffffc0206166:	08f6ed63          	bltu	a3,a5,ffffffffc0206200 <do_fork+0x3ea>
ffffffffc020616a:	000cb783          	ld	a5,0(s9)
ffffffffc020616e:	000b3703          	ld	a4,0(s6)
ffffffffc0206172:	40f687b3          	sub	a5,a3,a5
ffffffffc0206176:	83b1                	srli	a5,a5,0xc
ffffffffc0206178:	04e7f963          	bgeu	a5,a4,ffffffffc02061ca <do_fork+0x3b4>
ffffffffc020617c:	000bb503          	ld	a0,0(s7)
ffffffffc0206180:	415787b3          	sub	a5,a5,s5
ffffffffc0206184:	079a                	slli	a5,a5,0x6
ffffffffc0206186:	4589                	li	a1,2
ffffffffc0206188:	953e                	add	a0,a0,a5
ffffffffc020618a:	8b0fc0ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc020618e:	8526                	mv	a0,s1
ffffffffc0206190:	f3ffb0ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0206194:	5571                	li	a0,-4
ffffffffc0206196:	b595                	j	ffffffffc0205ffa <do_fork+0x1e4>
ffffffffc0206198:	adbfa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020619c:	4905                	li	s2,1
ffffffffc020619e:	b3e9                	j	ffffffffc0205f68 <do_fork+0x152>
ffffffffc02061a0:	c599                	beqz	a1,ffffffffc02061ae <do_fork+0x398>
ffffffffc02061a2:	00d82023          	sw	a3,0(a6)
ffffffffc02061a6:	8536                	mv	a0,a3
ffffffffc02061a8:	bbcd                	j	ffffffffc0205f9a <do_fork+0x184>
ffffffffc02061aa:	556d                	li	a0,-5
ffffffffc02061ac:	b5b9                	j	ffffffffc0205ffa <do_fork+0x1e4>
ffffffffc02061ae:	00082503          	lw	a0,0(a6)
ffffffffc02061b2:	b3e5                	j	ffffffffc0205f9a <do_fork+0x184>
ffffffffc02061b4:	6402                	ld	s0,0(sp)
ffffffffc02061b6:	8522                	mv	a0,s0
ffffffffc02061b8:	dcbfd0ef          	jal	ra,ffffffffc0203f82 <exit_mmap>
ffffffffc02061bc:	6c08                	ld	a0,24(s0)
ffffffffc02061be:	a85ff0ef          	jal	ra,ffffffffc0205c42 <put_pgdir.isra.0>
ffffffffc02061c2:	8522                	mv	a0,s0
ffffffffc02061c4:	c23fd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc02061c8:	bf61                	j	ffffffffc0206160 <do_fork+0x34a>
ffffffffc02061ca:	a5dff0ef          	jal	ra,ffffffffc0205c26 <pa2page.part.0>
ffffffffc02061ce:	86ba                	mv	a3,a4
ffffffffc02061d0:	00006617          	auipc	a2,0x6
ffffffffc02061d4:	77060613          	addi	a2,a2,1904 # ffffffffc020c940 <default_pmm_manager+0xe0>
ffffffffc02061d8:	1c400593          	li	a1,452
ffffffffc02061dc:	00007517          	auipc	a0,0x7
ffffffffc02061e0:	69c50513          	addi	a0,a0,1692 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc02061e4:	abafa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02061e8:	00006617          	auipc	a2,0x6
ffffffffc02061ec:	6b060613          	addi	a2,a2,1712 # ffffffffc020c898 <default_pmm_manager+0x38>
ffffffffc02061f0:	07100593          	li	a1,113
ffffffffc02061f4:	00006517          	auipc	a0,0x6
ffffffffc02061f8:	6cc50513          	addi	a0,a0,1740 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc02061fc:	aa2fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206200:	00006617          	auipc	a2,0x6
ffffffffc0206204:	74060613          	addi	a2,a2,1856 # ffffffffc020c940 <default_pmm_manager+0xe0>
ffffffffc0206208:	07700593          	li	a1,119
ffffffffc020620c:	00006517          	auipc	a0,0x6
ffffffffc0206210:	6b450513          	addi	a0,a0,1716 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc0206214:	a8afa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206218:	00007697          	auipc	a3,0x7
ffffffffc020621c:	67868693          	addi	a3,a3,1656 # ffffffffc020d890 <CSWTCH.79+0x108>
ffffffffc0206220:	00006617          	auipc	a2,0x6
ffffffffc0206224:	b2060613          	addi	a2,a2,-1248 # ffffffffc020bd40 <commands+0x210>
ffffffffc0206228:	1e400593          	li	a1,484
ffffffffc020622c:	00007517          	auipc	a0,0x7
ffffffffc0206230:	64c50513          	addi	a0,a0,1612 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc0206234:	a6afa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206238 <kernel_thread>:
ffffffffc0206238:	7129                	addi	sp,sp,-320
ffffffffc020623a:	fa22                	sd	s0,304(sp)
ffffffffc020623c:	f626                	sd	s1,296(sp)
ffffffffc020623e:	f24a                	sd	s2,288(sp)
ffffffffc0206240:	84ae                	mv	s1,a1
ffffffffc0206242:	892a                	mv	s2,a0
ffffffffc0206244:	8432                	mv	s0,a2
ffffffffc0206246:	4581                	li	a1,0
ffffffffc0206248:	12000613          	li	a2,288
ffffffffc020624c:	850a                	mv	a0,sp
ffffffffc020624e:	fe06                	sd	ra,312(sp)
ffffffffc0206250:	60a050ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0206254:	e0ca                	sd	s2,64(sp)
ffffffffc0206256:	e4a6                	sd	s1,72(sp)
ffffffffc0206258:	100027f3          	csrr	a5,sstatus
ffffffffc020625c:	edd7f793          	andi	a5,a5,-291
ffffffffc0206260:	1207e793          	ori	a5,a5,288
ffffffffc0206264:	e23e                	sd	a5,256(sp)
ffffffffc0206266:	860a                	mv	a2,sp
ffffffffc0206268:	10046513          	ori	a0,s0,256
ffffffffc020626c:	00000797          	auipc	a5,0x0
ffffffffc0206270:	89478793          	addi	a5,a5,-1900 # ffffffffc0205b00 <kernel_thread_entry>
ffffffffc0206274:	4581                	li	a1,0
ffffffffc0206276:	e63e                	sd	a5,264(sp)
ffffffffc0206278:	b9fff0ef          	jal	ra,ffffffffc0205e16 <do_fork>
ffffffffc020627c:	70f2                	ld	ra,312(sp)
ffffffffc020627e:	7452                	ld	s0,304(sp)
ffffffffc0206280:	74b2                	ld	s1,296(sp)
ffffffffc0206282:	7912                	ld	s2,288(sp)
ffffffffc0206284:	6131                	addi	sp,sp,320
ffffffffc0206286:	8082                	ret

ffffffffc0206288 <do_exit>:
ffffffffc0206288:	7179                	addi	sp,sp,-48
ffffffffc020628a:	f022                	sd	s0,32(sp)
ffffffffc020628c:	00090417          	auipc	s0,0x90
ffffffffc0206290:	63440413          	addi	s0,s0,1588 # ffffffffc02968c0 <current>
ffffffffc0206294:	601c                	ld	a5,0(s0)
ffffffffc0206296:	f406                	sd	ra,40(sp)
ffffffffc0206298:	ec26                	sd	s1,24(sp)
ffffffffc020629a:	e84a                	sd	s2,16(sp)
ffffffffc020629c:	e44e                	sd	s3,8(sp)
ffffffffc020629e:	e052                	sd	s4,0(sp)
ffffffffc02062a0:	00090717          	auipc	a4,0x90
ffffffffc02062a4:	62873703          	ld	a4,1576(a4) # ffffffffc02968c8 <idleproc>
ffffffffc02062a8:	0ee78763          	beq	a5,a4,ffffffffc0206396 <do_exit+0x10e>
ffffffffc02062ac:	00090497          	auipc	s1,0x90
ffffffffc02062b0:	62448493          	addi	s1,s1,1572 # ffffffffc02968d0 <initproc>
ffffffffc02062b4:	6098                	ld	a4,0(s1)
ffffffffc02062b6:	10e78763          	beq	a5,a4,ffffffffc02063c4 <do_exit+0x13c>
ffffffffc02062ba:	0287b983          	ld	s3,40(a5)
ffffffffc02062be:	892a                	mv	s2,a0
ffffffffc02062c0:	02098e63          	beqz	s3,ffffffffc02062fc <do_exit+0x74>
ffffffffc02062c4:	00090797          	auipc	a5,0x90
ffffffffc02062c8:	5cc7b783          	ld	a5,1484(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc02062cc:	577d                	li	a4,-1
ffffffffc02062ce:	177e                	slli	a4,a4,0x3f
ffffffffc02062d0:	83b1                	srli	a5,a5,0xc
ffffffffc02062d2:	8fd9                	or	a5,a5,a4
ffffffffc02062d4:	18079073          	csrw	satp,a5
ffffffffc02062d8:	0309a783          	lw	a5,48(s3)
ffffffffc02062dc:	fff7871b          	addiw	a4,a5,-1
ffffffffc02062e0:	02e9a823          	sw	a4,48(s3)
ffffffffc02062e4:	c769                	beqz	a4,ffffffffc02063ae <do_exit+0x126>
ffffffffc02062e6:	601c                	ld	a5,0(s0)
ffffffffc02062e8:	1487b503          	ld	a0,328(a5)
ffffffffc02062ec:	0207b423          	sd	zero,40(a5)
ffffffffc02062f0:	c511                	beqz	a0,ffffffffc02062fc <do_exit+0x74>
ffffffffc02062f2:	491c                	lw	a5,16(a0)
ffffffffc02062f4:	fff7871b          	addiw	a4,a5,-1
ffffffffc02062f8:	c918                	sw	a4,16(a0)
ffffffffc02062fa:	cb59                	beqz	a4,ffffffffc0206390 <do_exit+0x108>
ffffffffc02062fc:	601c                	ld	a5,0(s0)
ffffffffc02062fe:	470d                	li	a4,3
ffffffffc0206300:	c398                	sw	a4,0(a5)
ffffffffc0206302:	0f27a423          	sw	s2,232(a5)
ffffffffc0206306:	100027f3          	csrr	a5,sstatus
ffffffffc020630a:	8b89                	andi	a5,a5,2
ffffffffc020630c:	4a01                	li	s4,0
ffffffffc020630e:	e7f9                	bnez	a5,ffffffffc02063dc <do_exit+0x154>
ffffffffc0206310:	6018                	ld	a4,0(s0)
ffffffffc0206312:	800007b7          	lui	a5,0x80000
ffffffffc0206316:	0785                	addi	a5,a5,1
ffffffffc0206318:	7308                	ld	a0,32(a4)
ffffffffc020631a:	0ec52703          	lw	a4,236(a0)
ffffffffc020631e:	0cf70363          	beq	a4,a5,ffffffffc02063e4 <do_exit+0x15c>
ffffffffc0206322:	6018                	ld	a4,0(s0)
ffffffffc0206324:	7b7c                	ld	a5,240(a4)
ffffffffc0206326:	c3a1                	beqz	a5,ffffffffc0206366 <do_exit+0xde>
ffffffffc0206328:	800009b7          	lui	s3,0x80000
ffffffffc020632c:	490d                	li	s2,3
ffffffffc020632e:	0985                	addi	s3,s3,1
ffffffffc0206330:	a021                	j	ffffffffc0206338 <do_exit+0xb0>
ffffffffc0206332:	6018                	ld	a4,0(s0)
ffffffffc0206334:	7b7c                	ld	a5,240(a4)
ffffffffc0206336:	cb85                	beqz	a5,ffffffffc0206366 <do_exit+0xde>
ffffffffc0206338:	1007b683          	ld	a3,256(a5) # ffffffff80000100 <_binary_bin_sfs_img_size+0xffffffff7ff8ae00>
ffffffffc020633c:	6088                	ld	a0,0(s1)
ffffffffc020633e:	fb74                	sd	a3,240(a4)
ffffffffc0206340:	7978                	ld	a4,240(a0)
ffffffffc0206342:	0e07bc23          	sd	zero,248(a5)
ffffffffc0206346:	10e7b023          	sd	a4,256(a5)
ffffffffc020634a:	c311                	beqz	a4,ffffffffc020634e <do_exit+0xc6>
ffffffffc020634c:	ff7c                	sd	a5,248(a4)
ffffffffc020634e:	4398                	lw	a4,0(a5)
ffffffffc0206350:	f388                	sd	a0,32(a5)
ffffffffc0206352:	f97c                	sd	a5,240(a0)
ffffffffc0206354:	fd271fe3          	bne	a4,s2,ffffffffc0206332 <do_exit+0xaa>
ffffffffc0206358:	0ec52783          	lw	a5,236(a0)
ffffffffc020635c:	fd379be3          	bne	a5,s3,ffffffffc0206332 <do_exit+0xaa>
ffffffffc0206360:	2dc010ef          	jal	ra,ffffffffc020763c <wakeup_proc>
ffffffffc0206364:	b7f9                	j	ffffffffc0206332 <do_exit+0xaa>
ffffffffc0206366:	020a1263          	bnez	s4,ffffffffc020638a <do_exit+0x102>
ffffffffc020636a:	384010ef          	jal	ra,ffffffffc02076ee <schedule>
ffffffffc020636e:	601c                	ld	a5,0(s0)
ffffffffc0206370:	00007617          	auipc	a2,0x7
ffffffffc0206374:	55860613          	addi	a2,a2,1368 # ffffffffc020d8c8 <CSWTCH.79+0x140>
ffffffffc0206378:	2bc00593          	li	a1,700
ffffffffc020637c:	43d4                	lw	a3,4(a5)
ffffffffc020637e:	00007517          	auipc	a0,0x7
ffffffffc0206382:	4fa50513          	addi	a0,a0,1274 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc0206386:	918fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020638a:	8e3fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020638e:	bff1                	j	ffffffffc020636a <do_exit+0xe2>
ffffffffc0206390:	814ff0ef          	jal	ra,ffffffffc02053a4 <files_destroy>
ffffffffc0206394:	b7a5                	j	ffffffffc02062fc <do_exit+0x74>
ffffffffc0206396:	00007617          	auipc	a2,0x7
ffffffffc020639a:	51260613          	addi	a2,a2,1298 # ffffffffc020d8a8 <CSWTCH.79+0x120>
ffffffffc020639e:	28700593          	li	a1,647
ffffffffc02063a2:	00007517          	auipc	a0,0x7
ffffffffc02063a6:	4d650513          	addi	a0,a0,1238 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc02063aa:	8f4fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02063ae:	854e                	mv	a0,s3
ffffffffc02063b0:	bd3fd0ef          	jal	ra,ffffffffc0203f82 <exit_mmap>
ffffffffc02063b4:	0189b503          	ld	a0,24(s3) # ffffffff80000018 <_binary_bin_sfs_img_size+0xffffffff7ff8ad18>
ffffffffc02063b8:	88bff0ef          	jal	ra,ffffffffc0205c42 <put_pgdir.isra.0>
ffffffffc02063bc:	854e                	mv	a0,s3
ffffffffc02063be:	a29fd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc02063c2:	b715                	j	ffffffffc02062e6 <do_exit+0x5e>
ffffffffc02063c4:	00007617          	auipc	a2,0x7
ffffffffc02063c8:	4f460613          	addi	a2,a2,1268 # ffffffffc020d8b8 <CSWTCH.79+0x130>
ffffffffc02063cc:	28b00593          	li	a1,651
ffffffffc02063d0:	00007517          	auipc	a0,0x7
ffffffffc02063d4:	4a850513          	addi	a0,a0,1192 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc02063d8:	8c6fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02063dc:	897fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02063e0:	4a05                	li	s4,1
ffffffffc02063e2:	b73d                	j	ffffffffc0206310 <do_exit+0x88>
ffffffffc02063e4:	258010ef          	jal	ra,ffffffffc020763c <wakeup_proc>
ffffffffc02063e8:	bf2d                	j	ffffffffc0206322 <do_exit+0x9a>

ffffffffc02063ea <do_wait.part.0>:
ffffffffc02063ea:	715d                	addi	sp,sp,-80
ffffffffc02063ec:	f84a                	sd	s2,48(sp)
ffffffffc02063ee:	f44e                	sd	s3,40(sp)
ffffffffc02063f0:	80000937          	lui	s2,0x80000
ffffffffc02063f4:	6989                	lui	s3,0x2
ffffffffc02063f6:	fc26                	sd	s1,56(sp)
ffffffffc02063f8:	f052                	sd	s4,32(sp)
ffffffffc02063fa:	ec56                	sd	s5,24(sp)
ffffffffc02063fc:	e85a                	sd	s6,16(sp)
ffffffffc02063fe:	e45e                	sd	s7,8(sp)
ffffffffc0206400:	e486                	sd	ra,72(sp)
ffffffffc0206402:	e0a2                	sd	s0,64(sp)
ffffffffc0206404:	84aa                	mv	s1,a0
ffffffffc0206406:	8a2e                	mv	s4,a1
ffffffffc0206408:	00090b97          	auipc	s7,0x90
ffffffffc020640c:	4b8b8b93          	addi	s7,s7,1208 # ffffffffc02968c0 <current>
ffffffffc0206410:	00050b1b          	sext.w	s6,a0
ffffffffc0206414:	fff50a9b          	addiw	s5,a0,-1
ffffffffc0206418:	19f9                	addi	s3,s3,-2
ffffffffc020641a:	0905                	addi	s2,s2,1
ffffffffc020641c:	ccbd                	beqz	s1,ffffffffc020649a <do_wait.part.0+0xb0>
ffffffffc020641e:	0359e863          	bltu	s3,s5,ffffffffc020644e <do_wait.part.0+0x64>
ffffffffc0206422:	45a9                	li	a1,10
ffffffffc0206424:	855a                	mv	a0,s6
ffffffffc0206426:	701040ef          	jal	ra,ffffffffc020b326 <hash32>
ffffffffc020642a:	02051793          	slli	a5,a0,0x20
ffffffffc020642e:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0206432:	0008b797          	auipc	a5,0x8b
ffffffffc0206436:	38e78793          	addi	a5,a5,910 # ffffffffc02917c0 <hash_list>
ffffffffc020643a:	953e                	add	a0,a0,a5
ffffffffc020643c:	842a                	mv	s0,a0
ffffffffc020643e:	a029                	j	ffffffffc0206448 <do_wait.part.0+0x5e>
ffffffffc0206440:	f2c42783          	lw	a5,-212(s0)
ffffffffc0206444:	02978163          	beq	a5,s1,ffffffffc0206466 <do_wait.part.0+0x7c>
ffffffffc0206448:	6400                	ld	s0,8(s0)
ffffffffc020644a:	fe851be3          	bne	a0,s0,ffffffffc0206440 <do_wait.part.0+0x56>
ffffffffc020644e:	5579                	li	a0,-2
ffffffffc0206450:	60a6                	ld	ra,72(sp)
ffffffffc0206452:	6406                	ld	s0,64(sp)
ffffffffc0206454:	74e2                	ld	s1,56(sp)
ffffffffc0206456:	7942                	ld	s2,48(sp)
ffffffffc0206458:	79a2                	ld	s3,40(sp)
ffffffffc020645a:	7a02                	ld	s4,32(sp)
ffffffffc020645c:	6ae2                	ld	s5,24(sp)
ffffffffc020645e:	6b42                	ld	s6,16(sp)
ffffffffc0206460:	6ba2                	ld	s7,8(sp)
ffffffffc0206462:	6161                	addi	sp,sp,80
ffffffffc0206464:	8082                	ret
ffffffffc0206466:	000bb683          	ld	a3,0(s7)
ffffffffc020646a:	f4843783          	ld	a5,-184(s0)
ffffffffc020646e:	fed790e3          	bne	a5,a3,ffffffffc020644e <do_wait.part.0+0x64>
ffffffffc0206472:	f2842703          	lw	a4,-216(s0)
ffffffffc0206476:	478d                	li	a5,3
ffffffffc0206478:	0ef70b63          	beq	a4,a5,ffffffffc020656e <do_wait.part.0+0x184>
ffffffffc020647c:	4785                	li	a5,1
ffffffffc020647e:	c29c                	sw	a5,0(a3)
ffffffffc0206480:	0f26a623          	sw	s2,236(a3)
ffffffffc0206484:	26a010ef          	jal	ra,ffffffffc02076ee <schedule>
ffffffffc0206488:	000bb783          	ld	a5,0(s7)
ffffffffc020648c:	0b07a783          	lw	a5,176(a5)
ffffffffc0206490:	8b85                	andi	a5,a5,1
ffffffffc0206492:	d7c9                	beqz	a5,ffffffffc020641c <do_wait.part.0+0x32>
ffffffffc0206494:	555d                	li	a0,-9
ffffffffc0206496:	df3ff0ef          	jal	ra,ffffffffc0206288 <do_exit>
ffffffffc020649a:	000bb683          	ld	a3,0(s7)
ffffffffc020649e:	7ae0                	ld	s0,240(a3)
ffffffffc02064a0:	d45d                	beqz	s0,ffffffffc020644e <do_wait.part.0+0x64>
ffffffffc02064a2:	470d                	li	a4,3
ffffffffc02064a4:	a021                	j	ffffffffc02064ac <do_wait.part.0+0xc2>
ffffffffc02064a6:	10043403          	ld	s0,256(s0)
ffffffffc02064aa:	d869                	beqz	s0,ffffffffc020647c <do_wait.part.0+0x92>
ffffffffc02064ac:	401c                	lw	a5,0(s0)
ffffffffc02064ae:	fee79ce3          	bne	a5,a4,ffffffffc02064a6 <do_wait.part.0+0xbc>
ffffffffc02064b2:	00090797          	auipc	a5,0x90
ffffffffc02064b6:	4167b783          	ld	a5,1046(a5) # ffffffffc02968c8 <idleproc>
ffffffffc02064ba:	0c878963          	beq	a5,s0,ffffffffc020658c <do_wait.part.0+0x1a2>
ffffffffc02064be:	00090797          	auipc	a5,0x90
ffffffffc02064c2:	4127b783          	ld	a5,1042(a5) # ffffffffc02968d0 <initproc>
ffffffffc02064c6:	0cf40363          	beq	s0,a5,ffffffffc020658c <do_wait.part.0+0x1a2>
ffffffffc02064ca:	000a0663          	beqz	s4,ffffffffc02064d6 <do_wait.part.0+0xec>
ffffffffc02064ce:	0e842783          	lw	a5,232(s0)
ffffffffc02064d2:	00fa2023          	sw	a5,0(s4)
ffffffffc02064d6:	100027f3          	csrr	a5,sstatus
ffffffffc02064da:	8b89                	andi	a5,a5,2
ffffffffc02064dc:	4581                	li	a1,0
ffffffffc02064de:	e7c1                	bnez	a5,ffffffffc0206566 <do_wait.part.0+0x17c>
ffffffffc02064e0:	6c70                	ld	a2,216(s0)
ffffffffc02064e2:	7074                	ld	a3,224(s0)
ffffffffc02064e4:	10043703          	ld	a4,256(s0)
ffffffffc02064e8:	7c7c                	ld	a5,248(s0)
ffffffffc02064ea:	e614                	sd	a3,8(a2)
ffffffffc02064ec:	e290                	sd	a2,0(a3)
ffffffffc02064ee:	6470                	ld	a2,200(s0)
ffffffffc02064f0:	6874                	ld	a3,208(s0)
ffffffffc02064f2:	e614                	sd	a3,8(a2)
ffffffffc02064f4:	e290                	sd	a2,0(a3)
ffffffffc02064f6:	c319                	beqz	a4,ffffffffc02064fc <do_wait.part.0+0x112>
ffffffffc02064f8:	ff7c                	sd	a5,248(a4)
ffffffffc02064fa:	7c7c                	ld	a5,248(s0)
ffffffffc02064fc:	c3b5                	beqz	a5,ffffffffc0206560 <do_wait.part.0+0x176>
ffffffffc02064fe:	10e7b023          	sd	a4,256(a5)
ffffffffc0206502:	00090717          	auipc	a4,0x90
ffffffffc0206506:	3d670713          	addi	a4,a4,982 # ffffffffc02968d8 <nr_process>
ffffffffc020650a:	431c                	lw	a5,0(a4)
ffffffffc020650c:	37fd                	addiw	a5,a5,-1
ffffffffc020650e:	c31c                	sw	a5,0(a4)
ffffffffc0206510:	e5a9                	bnez	a1,ffffffffc020655a <do_wait.part.0+0x170>
ffffffffc0206512:	6814                	ld	a3,16(s0)
ffffffffc0206514:	c02007b7          	lui	a5,0xc0200
ffffffffc0206518:	04f6ee63          	bltu	a3,a5,ffffffffc0206574 <do_wait.part.0+0x18a>
ffffffffc020651c:	00090797          	auipc	a5,0x90
ffffffffc0206520:	39c7b783          	ld	a5,924(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206524:	8e9d                	sub	a3,a3,a5
ffffffffc0206526:	82b1                	srli	a3,a3,0xc
ffffffffc0206528:	00090797          	auipc	a5,0x90
ffffffffc020652c:	3787b783          	ld	a5,888(a5) # ffffffffc02968a0 <npage>
ffffffffc0206530:	06f6fa63          	bgeu	a3,a5,ffffffffc02065a4 <do_wait.part.0+0x1ba>
ffffffffc0206534:	00009517          	auipc	a0,0x9
ffffffffc0206538:	7f453503          	ld	a0,2036(a0) # ffffffffc020fd28 <nbase>
ffffffffc020653c:	8e89                	sub	a3,a3,a0
ffffffffc020653e:	069a                	slli	a3,a3,0x6
ffffffffc0206540:	00090517          	auipc	a0,0x90
ffffffffc0206544:	36853503          	ld	a0,872(a0) # ffffffffc02968a8 <pages>
ffffffffc0206548:	9536                	add	a0,a0,a3
ffffffffc020654a:	4589                	li	a1,2
ffffffffc020654c:	ceffb0ef          	jal	ra,ffffffffc020223a <free_pages>
ffffffffc0206550:	8522                	mv	a0,s0
ffffffffc0206552:	b7dfb0ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0206556:	4501                	li	a0,0
ffffffffc0206558:	bde5                	j	ffffffffc0206450 <do_wait.part.0+0x66>
ffffffffc020655a:	f12fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020655e:	bf55                	j	ffffffffc0206512 <do_wait.part.0+0x128>
ffffffffc0206560:	701c                	ld	a5,32(s0)
ffffffffc0206562:	fbf8                	sd	a4,240(a5)
ffffffffc0206564:	bf79                	j	ffffffffc0206502 <do_wait.part.0+0x118>
ffffffffc0206566:	f0cfa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020656a:	4585                	li	a1,1
ffffffffc020656c:	bf95                	j	ffffffffc02064e0 <do_wait.part.0+0xf6>
ffffffffc020656e:	f2840413          	addi	s0,s0,-216
ffffffffc0206572:	b781                	j	ffffffffc02064b2 <do_wait.part.0+0xc8>
ffffffffc0206574:	00006617          	auipc	a2,0x6
ffffffffc0206578:	3cc60613          	addi	a2,a2,972 # ffffffffc020c940 <default_pmm_manager+0xe0>
ffffffffc020657c:	07700593          	li	a1,119
ffffffffc0206580:	00006517          	auipc	a0,0x6
ffffffffc0206584:	34050513          	addi	a0,a0,832 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc0206588:	f17f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020658c:	00007617          	auipc	a2,0x7
ffffffffc0206590:	35c60613          	addi	a2,a2,860 # ffffffffc020d8e8 <CSWTCH.79+0x160>
ffffffffc0206594:	4d100593          	li	a1,1233
ffffffffc0206598:	00007517          	auipc	a0,0x7
ffffffffc020659c:	2e050513          	addi	a0,a0,736 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc02065a0:	efff90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02065a4:	e82ff0ef          	jal	ra,ffffffffc0205c26 <pa2page.part.0>

ffffffffc02065a8 <init_main>:
ffffffffc02065a8:	1101                	addi	sp,sp,-32
ffffffffc02065aa:	00007517          	auipc	a0,0x7
ffffffffc02065ae:	35e50513          	addi	a0,a0,862 # ffffffffc020d908 <CSWTCH.79+0x180>
ffffffffc02065b2:	ec06                	sd	ra,24(sp)
ffffffffc02065b4:	e822                	sd	s0,16(sp)
ffffffffc02065b6:	e426                	sd	s1,8(sp)
ffffffffc02065b8:	e04a                	sd	s2,0(sp)
ffffffffc02065ba:	0a5010ef          	jal	ra,ffffffffc0207e5e <vfs_set_bootfs>
ffffffffc02065be:	12051e63          	bnez	a0,ffffffffc02066fa <init_main+0x152>
ffffffffc02065c2:	4581                	li	a1,0
ffffffffc02065c4:	00007517          	auipc	a0,0x7
ffffffffc02065c8:	36c50513          	addi	a0,a0,876 # ffffffffc020d930 <CSWTCH.79+0x1a8>
ffffffffc02065cc:	88eff0ef          	jal	ra,ffffffffc020565a <sysfile_open>
ffffffffc02065d0:	842a                	mv	s0,a0
ffffffffc02065d2:	4585                	li	a1,1
ffffffffc02065d4:	00007517          	auipc	a0,0x7
ffffffffc02065d8:	36450513          	addi	a0,a0,868 # ffffffffc020d938 <CSWTCH.79+0x1b0>
ffffffffc02065dc:	87eff0ef          	jal	ra,ffffffffc020565a <sysfile_open>
ffffffffc02065e0:	84aa                	mv	s1,a0
ffffffffc02065e2:	4585                	li	a1,1
ffffffffc02065e4:	00007517          	auipc	a0,0x7
ffffffffc02065e8:	35450513          	addi	a0,a0,852 # ffffffffc020d938 <CSWTCH.79+0x1b0>
ffffffffc02065ec:	86eff0ef          	jal	ra,ffffffffc020565a <sysfile_open>
ffffffffc02065f0:	892a                	mv	s2,a0
ffffffffc02065f2:	86aa                	mv	a3,a0
ffffffffc02065f4:	8626                	mv	a2,s1
ffffffffc02065f6:	85a2                	mv	a1,s0
ffffffffc02065f8:	00007517          	auipc	a0,0x7
ffffffffc02065fc:	34850513          	addi	a0,a0,840 # ffffffffc020d940 <CSWTCH.79+0x1b8>
ffffffffc0206600:	ba7f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206604:	e045                	bnez	s0,ffffffffc02066a4 <init_main+0xfc>
ffffffffc0206606:	4785                	li	a5,1
ffffffffc0206608:	08f49e63          	bne	s1,a5,ffffffffc02066a4 <init_main+0xfc>
ffffffffc020660c:	4789                	li	a5,2
ffffffffc020660e:	08f91b63          	bne	s2,a5,ffffffffc02066a4 <init_main+0xfc>
ffffffffc0206612:	c69fb0ef          	jal	ra,ffffffffc020227a <nr_free_pages>
ffffffffc0206616:	a05fb0ef          	jal	ra,ffffffffc020201a <kallocated>
ffffffffc020661a:	4601                	li	a2,0
ffffffffc020661c:	4581                	li	a1,0
ffffffffc020661e:	00001517          	auipc	a0,0x1
ffffffffc0206622:	a6c50513          	addi	a0,a0,-1428 # ffffffffc020708a <user_main>
ffffffffc0206626:	c13ff0ef          	jal	ra,ffffffffc0206238 <kernel_thread>
ffffffffc020662a:	00a04563          	bgtz	a0,ffffffffc0206634 <init_main+0x8c>
ffffffffc020662e:	a855                	j	ffffffffc02066e2 <init_main+0x13a>
ffffffffc0206630:	0be010ef          	jal	ra,ffffffffc02076ee <schedule>
ffffffffc0206634:	4581                	li	a1,0
ffffffffc0206636:	4501                	li	a0,0
ffffffffc0206638:	db3ff0ef          	jal	ra,ffffffffc02063ea <do_wait.part.0>
ffffffffc020663c:	d975                	beqz	a0,ffffffffc0206630 <init_main+0x88>
ffffffffc020663e:	d21fe0ef          	jal	ra,ffffffffc020535e <fs_cleanup>
ffffffffc0206642:	00007517          	auipc	a0,0x7
ffffffffc0206646:	3a650513          	addi	a0,a0,934 # ffffffffc020d9e8 <CSWTCH.79+0x260>
ffffffffc020664a:	b5df90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020664e:	00090797          	auipc	a5,0x90
ffffffffc0206652:	2827b783          	ld	a5,642(a5) # ffffffffc02968d0 <initproc>
ffffffffc0206656:	7bf8                	ld	a4,240(a5)
ffffffffc0206658:	e72d                	bnez	a4,ffffffffc02066c2 <init_main+0x11a>
ffffffffc020665a:	7ff8                	ld	a4,248(a5)
ffffffffc020665c:	e33d                	bnez	a4,ffffffffc02066c2 <init_main+0x11a>
ffffffffc020665e:	1007b703          	ld	a4,256(a5)
ffffffffc0206662:	e325                	bnez	a4,ffffffffc02066c2 <init_main+0x11a>
ffffffffc0206664:	00090697          	auipc	a3,0x90
ffffffffc0206668:	2746a683          	lw	a3,628(a3) # ffffffffc02968d8 <nr_process>
ffffffffc020666c:	4709                	li	a4,2
ffffffffc020666e:	0ee69363          	bne	a3,a4,ffffffffc0206754 <init_main+0x1ac>
ffffffffc0206672:	0008f717          	auipc	a4,0x8f
ffffffffc0206676:	14e70713          	addi	a4,a4,334 # ffffffffc02957c0 <proc_list>
ffffffffc020667a:	6714                	ld	a3,8(a4)
ffffffffc020667c:	0c878793          	addi	a5,a5,200
ffffffffc0206680:	0ad79a63          	bne	a5,a3,ffffffffc0206734 <init_main+0x18c>
ffffffffc0206684:	6318                	ld	a4,0(a4)
ffffffffc0206686:	08e79763          	bne	a5,a4,ffffffffc0206714 <init_main+0x16c>
ffffffffc020668a:	00007517          	auipc	a0,0x7
ffffffffc020668e:	44650513          	addi	a0,a0,1094 # ffffffffc020dad0 <CSWTCH.79+0x348>
ffffffffc0206692:	b15f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206696:	60e2                	ld	ra,24(sp)
ffffffffc0206698:	6442                	ld	s0,16(sp)
ffffffffc020669a:	64a2                	ld	s1,8(sp)
ffffffffc020669c:	6902                	ld	s2,0(sp)
ffffffffc020669e:	4501                	li	a0,0
ffffffffc02066a0:	6105                	addi	sp,sp,32
ffffffffc02066a2:	8082                	ret
ffffffffc02066a4:	87ca                	mv	a5,s2
ffffffffc02066a6:	8726                	mv	a4,s1
ffffffffc02066a8:	86a2                	mv	a3,s0
ffffffffc02066aa:	00007617          	auipc	a2,0x7
ffffffffc02066ae:	2d660613          	addi	a2,a2,726 # ffffffffc020d980 <CSWTCH.79+0x1f8>
ffffffffc02066b2:	53e00593          	li	a1,1342
ffffffffc02066b6:	00007517          	auipc	a0,0x7
ffffffffc02066ba:	1c250513          	addi	a0,a0,450 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc02066be:	de1f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02066c2:	00007697          	auipc	a3,0x7
ffffffffc02066c6:	34e68693          	addi	a3,a3,846 # ffffffffc020da10 <CSWTCH.79+0x288>
ffffffffc02066ca:	00005617          	auipc	a2,0x5
ffffffffc02066ce:	67660613          	addi	a2,a2,1654 # ffffffffc020bd40 <commands+0x210>
ffffffffc02066d2:	55300593          	li	a1,1363
ffffffffc02066d6:	00007517          	auipc	a0,0x7
ffffffffc02066da:	1a250513          	addi	a0,a0,418 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc02066de:	dc1f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02066e2:	00007617          	auipc	a2,0x7
ffffffffc02066e6:	2e660613          	addi	a2,a2,742 # ffffffffc020d9c8 <CSWTCH.79+0x240>
ffffffffc02066ea:	54700593          	li	a1,1351
ffffffffc02066ee:	00007517          	auipc	a0,0x7
ffffffffc02066f2:	18a50513          	addi	a0,a0,394 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc02066f6:	da9f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02066fa:	86aa                	mv	a3,a0
ffffffffc02066fc:	00007617          	auipc	a2,0x7
ffffffffc0206700:	21460613          	addi	a2,a2,532 # ffffffffc020d910 <CSWTCH.79+0x188>
ffffffffc0206704:	53200593          	li	a1,1330
ffffffffc0206708:	00007517          	auipc	a0,0x7
ffffffffc020670c:	17050513          	addi	a0,a0,368 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc0206710:	d8ff90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206714:	00007697          	auipc	a3,0x7
ffffffffc0206718:	38c68693          	addi	a3,a3,908 # ffffffffc020daa0 <CSWTCH.79+0x318>
ffffffffc020671c:	00005617          	auipc	a2,0x5
ffffffffc0206720:	62460613          	addi	a2,a2,1572 # ffffffffc020bd40 <commands+0x210>
ffffffffc0206724:	55600593          	li	a1,1366
ffffffffc0206728:	00007517          	auipc	a0,0x7
ffffffffc020672c:	15050513          	addi	a0,a0,336 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc0206730:	d6ff90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206734:	00007697          	auipc	a3,0x7
ffffffffc0206738:	33c68693          	addi	a3,a3,828 # ffffffffc020da70 <CSWTCH.79+0x2e8>
ffffffffc020673c:	00005617          	auipc	a2,0x5
ffffffffc0206740:	60460613          	addi	a2,a2,1540 # ffffffffc020bd40 <commands+0x210>
ffffffffc0206744:	55500593          	li	a1,1365
ffffffffc0206748:	00007517          	auipc	a0,0x7
ffffffffc020674c:	13050513          	addi	a0,a0,304 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc0206750:	d4ff90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206754:	00007697          	auipc	a3,0x7
ffffffffc0206758:	30c68693          	addi	a3,a3,780 # ffffffffc020da60 <CSWTCH.79+0x2d8>
ffffffffc020675c:	00005617          	auipc	a2,0x5
ffffffffc0206760:	5e460613          	addi	a2,a2,1508 # ffffffffc020bd40 <commands+0x210>
ffffffffc0206764:	55400593          	li	a1,1364
ffffffffc0206768:	00007517          	auipc	a0,0x7
ffffffffc020676c:	11050513          	addi	a0,a0,272 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc0206770:	d2ff90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206774 <do_execve>:
ffffffffc0206774:	d7010113          	addi	sp,sp,-656
ffffffffc0206778:	25513c23          	sd	s5,600(sp)
ffffffffc020677c:	00090a97          	auipc	s5,0x90
ffffffffc0206780:	144a8a93          	addi	s5,s5,324 # ffffffffc02968c0 <current>
ffffffffc0206784:	000ab783          	ld	a5,0(s5)
ffffffffc0206788:	28813023          	sd	s0,640(sp)
ffffffffc020678c:	842e                	mv	s0,a1
ffffffffc020678e:	26913c23          	sd	s1,632(sp)
ffffffffc0206792:	27313423          	sd	s3,616(sp)
ffffffffc0206796:	27413023          	sd	s4,608(sp)
ffffffffc020679a:	85aa                	mv	a1,a0
ffffffffc020679c:	fff40a1b          	addiw	s4,s0,-1
ffffffffc02067a0:	84aa                	mv	s1,a0
ffffffffc02067a2:	89b2                	mv	s3,a2
ffffffffc02067a4:	00007517          	auipc	a0,0x7
ffffffffc02067a8:	34c50513          	addi	a0,a0,844 # ffffffffc020daf0 <CSWTCH.79+0x368>
ffffffffc02067ac:	8622                	mv	a2,s0
ffffffffc02067ae:	27213823          	sd	s2,624(sp)
ffffffffc02067b2:	28113423          	sd	ra,648(sp)
ffffffffc02067b6:	0287b903          	ld	s2,40(a5)
ffffffffc02067ba:	25613823          	sd	s6,592(sp)
ffffffffc02067be:	25713423          	sd	s7,584(sp)
ffffffffc02067c2:	25813023          	sd	s8,576(sp)
ffffffffc02067c6:	23913c23          	sd	s9,568(sp)
ffffffffc02067ca:	23a13823          	sd	s10,560(sp)
ffffffffc02067ce:	23b13423          	sd	s11,552(sp)
ffffffffc02067d2:	cc52                	sw	s4,24(sp)
ffffffffc02067d4:	9d3f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02067d8:	0004069b          	sext.w	a3,s0
ffffffffc02067dc:	000a071b          	sext.w	a4,s4
ffffffffc02067e0:	47fd                	li	a5,31
ffffffffc02067e2:	e0b6                	sd	a3,64(sp)
ffffffffc02067e4:	7ce7e963          	bltu	a5,a4,ffffffffc0206fb6 <do_execve+0x842>
ffffffffc02067e8:	4641                	li	a2,16
ffffffffc02067ea:	4581                	li	a1,0
ffffffffc02067ec:	0928                	addi	a0,sp,152
ffffffffc02067ee:	06c050ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc02067f2:	00090c63          	beqz	s2,ffffffffc020680a <do_execve+0x96>
ffffffffc02067f6:	03890513          	addi	a0,s2,56 # ffffffff80000038 <_binary_bin_sfs_img_size+0xffffffff7ff8ad38>
ffffffffc02067fa:	f0bfd0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc02067fe:	000ab783          	ld	a5,0(s5)
ffffffffc0206802:	c781                	beqz	a5,ffffffffc020680a <do_execve+0x96>
ffffffffc0206804:	43dc                	lw	a5,4(a5)
ffffffffc0206806:	04f92823          	sw	a5,80(s2)
ffffffffc020680a:	28048963          	beqz	s1,ffffffffc0206a9c <do_execve+0x328>
ffffffffc020680e:	46c1                	li	a3,16
ffffffffc0206810:	8626                	mv	a2,s1
ffffffffc0206812:	092c                	addi	a1,sp,152
ffffffffc0206814:	854a                	mv	a0,s2
ffffffffc0206816:	d17fd0ef          	jal	ra,ffffffffc020452c <copy_string>
ffffffffc020681a:	7a050463          	beqz	a0,ffffffffc0206fc2 <do_execve+0x84e>
ffffffffc020681e:	00341793          	slli	a5,s0,0x3
ffffffffc0206822:	4681                	li	a3,0
ffffffffc0206824:	863e                	mv	a2,a5
ffffffffc0206826:	85ce                	mv	a1,s3
ffffffffc0206828:	854a                	mv	a0,s2
ffffffffc020682a:	f03e                	sd	a5,32(sp)
ffffffffc020682c:	c07fd0ef          	jal	ra,ffffffffc0204432 <user_mem_check>
ffffffffc0206830:	78050763          	beqz	a0,ffffffffc0206fbe <do_execve+0x84a>
ffffffffc0206834:	12010b13          	addi	s6,sp,288
ffffffffc0206838:	8a5a                	mv	s4,s6
ffffffffc020683a:	4b81                	li	s7,0
ffffffffc020683c:	6505                	lui	a0,0x1
ffffffffc020683e:	fe0fb0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0206842:	84aa                	mv	s1,a0
ffffffffc0206844:	1c050063          	beqz	a0,ffffffffc0206a04 <do_execve+0x290>
ffffffffc0206848:	0009b603          	ld	a2,0(s3) # 2000 <_binary_bin_swap_img_size-0x5d00>
ffffffffc020684c:	85aa                	mv	a1,a0
ffffffffc020684e:	6685                	lui	a3,0x1
ffffffffc0206850:	854a                	mv	a0,s2
ffffffffc0206852:	cdbfd0ef          	jal	ra,ffffffffc020452c <copy_string>
ffffffffc0206856:	22050e63          	beqz	a0,ffffffffc0206a92 <do_execve+0x31e>
ffffffffc020685a:	009a3023          	sd	s1,0(s4)
ffffffffc020685e:	2b85                	addiw	s7,s7,1
ffffffffc0206860:	0a21                	addi	s4,s4,8
ffffffffc0206862:	09a1                	addi	s3,s3,8
ffffffffc0206864:	fd741ce3          	bne	s0,s7,ffffffffc020683c <do_execve+0xc8>
ffffffffc0206868:	7d92                	ld	s11,288(sp)
ffffffffc020686a:	16090263          	beqz	s2,ffffffffc02069ce <do_execve+0x25a>
ffffffffc020686e:	03890513          	addi	a0,s2,56
ffffffffc0206872:	e8ffd0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0206876:	85ee                	mv	a1,s11
ffffffffc0206878:	04092823          	sw	zero,80(s2)
ffffffffc020687c:	00007517          	auipc	a0,0x7
ffffffffc0206880:	2f450513          	addi	a0,a0,756 # ffffffffc020db70 <CSWTCH.79+0x3e8>
ffffffffc0206884:	923f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206888:	4581                	li	a1,0
ffffffffc020688a:	856e                	mv	a0,s11
ffffffffc020688c:	bb6fe0ef          	jal	ra,ffffffffc0204c42 <file_open>
ffffffffc0206890:	84aa                	mv	s1,a0
ffffffffc0206892:	78054c63          	bltz	a0,ffffffffc020702a <do_execve+0x8b6>
ffffffffc0206896:	85aa                	mv	a1,a0
ffffffffc0206898:	00007517          	auipc	a0,0x7
ffffffffc020689c:	31850513          	addi	a0,a0,792 # ffffffffc020dbb0 <CSWTCH.79+0x428>
ffffffffc02068a0:	907f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02068a4:	00007517          	auipc	a0,0x7
ffffffffc02068a8:	48450513          	addi	a0,a0,1156 # ffffffffc020dd28 <CSWTCH.79+0x5a0>
ffffffffc02068ac:	8fbf90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02068b0:	00090797          	auipc	a5,0x90
ffffffffc02068b4:	fe07b783          	ld	a5,-32(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc02068b8:	577d                	li	a4,-1
ffffffffc02068ba:	177e                	slli	a4,a4,0x3f
ffffffffc02068bc:	83b1                	srli	a5,a5,0xc
ffffffffc02068be:	8fd9                	or	a5,a5,a4
ffffffffc02068c0:	18079073          	csrw	satp,a5
ffffffffc02068c4:	03092783          	lw	a5,48(s2)
ffffffffc02068c8:	fff7871b          	addiw	a4,a5,-1
ffffffffc02068cc:	02e92823          	sw	a4,48(s2)
ffffffffc02068d0:	1e070263          	beqz	a4,ffffffffc0206ab4 <do_execve+0x340>
ffffffffc02068d4:	000ab783          	ld	a5,0(s5)
ffffffffc02068d8:	0207b423          	sd	zero,40(a5)
ffffffffc02068dc:	85a6                	mv	a1,s1
ffffffffc02068de:	00007517          	auipc	a0,0x7
ffffffffc02068e2:	42250513          	addi	a0,a0,1058 # ffffffffc020dd00 <CSWTCH.79+0x578>
ffffffffc02068e6:	8c1f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02068ea:	000ab783          	ld	a5,0(s5)
ffffffffc02068ee:	779c                	ld	a5,40(a5)
ffffffffc02068f0:	78079163          	bnez	a5,ffffffffc0207072 <do_execve+0x8fe>
ffffffffc02068f4:	ba4fd0ef          	jal	ra,ffffffffc0203c98 <mm_create>
ffffffffc02068f8:	89aa                	mv	s3,a0
ffffffffc02068fa:	10050363          	beqz	a0,ffffffffc0206a00 <do_execve+0x28c>
ffffffffc02068fe:	4505                	li	a0,1
ffffffffc0206900:	8fdfb0ef          	jal	ra,ffffffffc02021fc <alloc_pages>
ffffffffc0206904:	0e050b63          	beqz	a0,ffffffffc02069fa <do_execve+0x286>
ffffffffc0206908:	00090c17          	auipc	s8,0x90
ffffffffc020690c:	fa0c0c13          	addi	s8,s8,-96 # ffffffffc02968a8 <pages>
ffffffffc0206910:	000c3683          	ld	a3,0(s8)
ffffffffc0206914:	00009717          	auipc	a4,0x9
ffffffffc0206918:	41473703          	ld	a4,1044(a4) # ffffffffc020fd28 <nbase>
ffffffffc020691c:	00090c97          	auipc	s9,0x90
ffffffffc0206920:	f84c8c93          	addi	s9,s9,-124 # ffffffffc02968a0 <npage>
ffffffffc0206924:	40d506b3          	sub	a3,a0,a3
ffffffffc0206928:	8699                	srai	a3,a3,0x6
ffffffffc020692a:	96ba                	add	a3,a3,a4
ffffffffc020692c:	e83a                	sd	a4,16(sp)
ffffffffc020692e:	000cb783          	ld	a5,0(s9)
ffffffffc0206932:	577d                	li	a4,-1
ffffffffc0206934:	8331                	srli	a4,a4,0xc
ffffffffc0206936:	e43a                	sd	a4,8(sp)
ffffffffc0206938:	8f75                	and	a4,a4,a3
ffffffffc020693a:	06b2                	slli	a3,a3,0xc
ffffffffc020693c:	6cf77b63          	bgeu	a4,a5,ffffffffc0207012 <do_execve+0x89e>
ffffffffc0206940:	00090797          	auipc	a5,0x90
ffffffffc0206944:	f7878793          	addi	a5,a5,-136 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206948:	0007b903          	ld	s2,0(a5)
ffffffffc020694c:	6605                	lui	a2,0x1
ffffffffc020694e:	00090597          	auipc	a1,0x90
ffffffffc0206952:	f4a5b583          	ld	a1,-182(a1) # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0206956:	9936                	add	s2,s2,a3
ffffffffc0206958:	854a                	mv	a0,s2
ffffffffc020695a:	753040ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc020695e:	4601                	li	a2,0
ffffffffc0206960:	0129bc23          	sd	s2,24(s3)
ffffffffc0206964:	4581                	li	a1,0
ffffffffc0206966:	8526                	mv	a0,s1
ffffffffc0206968:	f59fe0ef          	jal	ra,ffffffffc02058c0 <sysfile_seek>
ffffffffc020696c:	8a2a                	mv	s4,a0
ffffffffc020696e:	14050e63          	beqz	a0,ffffffffc0206aca <do_execve+0x356>
ffffffffc0206972:	0189b503          	ld	a0,24(s3)
ffffffffc0206976:	accff0ef          	jal	ra,ffffffffc0205c42 <put_pgdir.isra.0>
ffffffffc020697a:	854e                	mv	a0,s3
ffffffffc020697c:	c6afd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc0206980:	85d2                	mv	a1,s4
ffffffffc0206982:	00007517          	auipc	a0,0x7
ffffffffc0206986:	31e50513          	addi	a0,a0,798 # ffffffffc020dca0 <CSWTCH.79+0x518>
ffffffffc020698a:	81df90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020698e:	84d2                	mv	s1,s4
ffffffffc0206990:	85a6                	mv	a1,s1
ffffffffc0206992:	00007517          	auipc	a0,0x7
ffffffffc0206996:	34e50513          	addi	a0,a0,846 # ffffffffc020dce0 <CSWTCH.79+0x558>
ffffffffc020699a:	80df90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020699e:	7702                	ld	a4,32(sp)
ffffffffc02069a0:	fff40793          	addi	a5,s0,-1
ffffffffc02069a4:	ff0b0413          	addi	s0,s6,-16
ffffffffc02069a8:	943a                	add	s0,s0,a4
ffffffffc02069aa:	6762                	ld	a4,24(sp)
ffffffffc02069ac:	078e                	slli	a5,a5,0x3
ffffffffc02069ae:	9b3e                	add	s6,s6,a5
ffffffffc02069b0:	02071693          	slli	a3,a4,0x20
ffffffffc02069b4:	01d6d713          	srli	a4,a3,0x1d
ffffffffc02069b8:	8c19                	sub	s0,s0,a4
ffffffffc02069ba:	000b3503          	ld	a0,0(s6)
ffffffffc02069be:	1b61                	addi	s6,s6,-8
ffffffffc02069c0:	f0efb0ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc02069c4:	fe8b1be3          	bne	s6,s0,ffffffffc02069ba <do_execve+0x246>
ffffffffc02069c8:	8526                	mv	a0,s1
ffffffffc02069ca:	8bfff0ef          	jal	ra,ffffffffc0206288 <do_exit>
ffffffffc02069ce:	85ee                	mv	a1,s11
ffffffffc02069d0:	00007517          	auipc	a0,0x7
ffffffffc02069d4:	1a050513          	addi	a0,a0,416 # ffffffffc020db70 <CSWTCH.79+0x3e8>
ffffffffc02069d8:	fcef90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02069dc:	4581                	li	a1,0
ffffffffc02069de:	856e                	mv	a0,s11
ffffffffc02069e0:	a62fe0ef          	jal	ra,ffffffffc0204c42 <file_open>
ffffffffc02069e4:	84aa                	mv	s1,a0
ffffffffc02069e6:	64054263          	bltz	a0,ffffffffc020702a <do_execve+0x8b6>
ffffffffc02069ea:	85aa                	mv	a1,a0
ffffffffc02069ec:	00007517          	auipc	a0,0x7
ffffffffc02069f0:	1c450513          	addi	a0,a0,452 # ffffffffc020dbb0 <CSWTCH.79+0x428>
ffffffffc02069f4:	fb2f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02069f8:	b5d5                	j	ffffffffc02068dc <do_execve+0x168>
ffffffffc02069fa:	854e                	mv	a0,s3
ffffffffc02069fc:	beafd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc0206a00:	5a71                	li	s4,-4
ffffffffc0206a02:	bfbd                	j	ffffffffc0206980 <do_execve+0x20c>
ffffffffc0206a04:	5a71                	li	s4,-4
ffffffffc0206a06:	020b8963          	beqz	s7,ffffffffc0206a38 <do_execve+0x2c4>
ffffffffc0206a0a:	ff0b0693          	addi	a3,s6,-16
ffffffffc0206a0e:	fffb8793          	addi	a5,s7,-1
ffffffffc0206a12:	003b9713          	slli	a4,s7,0x3
ffffffffc0206a16:	3bfd                	addiw	s7,s7,-1
ffffffffc0206a18:	9736                	add	a4,a4,a3
ffffffffc0206a1a:	020b9693          	slli	a3,s7,0x20
ffffffffc0206a1e:	078e                	slli	a5,a5,0x3
ffffffffc0206a20:	01d6db93          	srli	s7,a3,0x1d
ffffffffc0206a24:	9b3e                	add	s6,s6,a5
ffffffffc0206a26:	41770bb3          	sub	s7,a4,s7
ffffffffc0206a2a:	000b3503          	ld	a0,0(s6)
ffffffffc0206a2e:	1b61                	addi	s6,s6,-8
ffffffffc0206a30:	e9efb0ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0206a34:	ff6b9be3          	bne	s7,s6,ffffffffc0206a2a <do_execve+0x2b6>
ffffffffc0206a38:	85d2                	mv	a1,s4
ffffffffc0206a3a:	00007517          	auipc	a0,0x7
ffffffffc0206a3e:	10e50513          	addi	a0,a0,270 # ffffffffc020db48 <CSWTCH.79+0x3c0>
ffffffffc0206a42:	f64f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206a46:	00090863          	beqz	s2,ffffffffc0206a56 <do_execve+0x2e2>
ffffffffc0206a4a:	03890513          	addi	a0,s2,56
ffffffffc0206a4e:	cb3fd0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0206a52:	04092823          	sw	zero,80(s2)
ffffffffc0206a56:	28813083          	ld	ra,648(sp)
ffffffffc0206a5a:	28013403          	ld	s0,640(sp)
ffffffffc0206a5e:	27813483          	ld	s1,632(sp)
ffffffffc0206a62:	27013903          	ld	s2,624(sp)
ffffffffc0206a66:	26813983          	ld	s3,616(sp)
ffffffffc0206a6a:	25813a83          	ld	s5,600(sp)
ffffffffc0206a6e:	25013b03          	ld	s6,592(sp)
ffffffffc0206a72:	24813b83          	ld	s7,584(sp)
ffffffffc0206a76:	24013c03          	ld	s8,576(sp)
ffffffffc0206a7a:	23813c83          	ld	s9,568(sp)
ffffffffc0206a7e:	23013d03          	ld	s10,560(sp)
ffffffffc0206a82:	22813d83          	ld	s11,552(sp)
ffffffffc0206a86:	8552                	mv	a0,s4
ffffffffc0206a88:	26013a03          	ld	s4,608(sp)
ffffffffc0206a8c:	29010113          	addi	sp,sp,656
ffffffffc0206a90:	8082                	ret
ffffffffc0206a92:	8526                	mv	a0,s1
ffffffffc0206a94:	e3afb0ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0206a98:	5a75                	li	s4,-3
ffffffffc0206a9a:	b7b5                	j	ffffffffc0206a06 <do_execve+0x292>
ffffffffc0206a9c:	000ab783          	ld	a5,0(s5)
ffffffffc0206aa0:	00007617          	auipc	a2,0x7
ffffffffc0206aa4:	07860613          	addi	a2,a2,120 # ffffffffc020db18 <CSWTCH.79+0x390>
ffffffffc0206aa8:	45c1                	li	a1,16
ffffffffc0206aaa:	43d4                	lw	a3,4(a5)
ffffffffc0206aac:	0928                	addi	a0,sp,152
ffffffffc0206aae:	4bd040ef          	jal	ra,ffffffffc020b76a <snprintf>
ffffffffc0206ab2:	b3b5                	j	ffffffffc020681e <do_execve+0xaa>
ffffffffc0206ab4:	854a                	mv	a0,s2
ffffffffc0206ab6:	cccfd0ef          	jal	ra,ffffffffc0203f82 <exit_mmap>
ffffffffc0206aba:	01893503          	ld	a0,24(s2)
ffffffffc0206abe:	984ff0ef          	jal	ra,ffffffffc0205c42 <put_pgdir.isra.0>
ffffffffc0206ac2:	854a                	mv	a0,s2
ffffffffc0206ac4:	b22fd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc0206ac8:	b531                	j	ffffffffc02068d4 <do_execve+0x160>
ffffffffc0206aca:	04000613          	li	a2,64
ffffffffc0206ace:	118c                	addi	a1,sp,224
ffffffffc0206ad0:	8526                	mv	a0,s1
ffffffffc0206ad2:	bc1fe0ef          	jal	ra,ffffffffc0205692 <sysfile_read>
ffffffffc0206ad6:	04000793          	li	a5,64
ffffffffc0206ada:	00f50863          	beq	a0,a5,ffffffffc0206aea <do_execve+0x376>
ffffffffc0206ade:	00050a1b          	sext.w	s4,a0
ffffffffc0206ae2:	e80548e3          	bltz	a0,ffffffffc0206972 <do_execve+0x1fe>
ffffffffc0206ae6:	5a7d                	li	s4,-1
ffffffffc0206ae8:	b569                	j	ffffffffc0206972 <do_execve+0x1fe>
ffffffffc0206aea:	570e                	lw	a4,224(sp)
ffffffffc0206aec:	464c47b7          	lui	a5,0x464c4
ffffffffc0206af0:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644f27f>
ffffffffc0206af4:	38f71563          	bne	a4,a5,ffffffffc0206e7e <do_execve+0x70a>
ffffffffc0206af8:	11815783          	lhu	a5,280(sp)
ffffffffc0206afc:	f402                	sd	zero,40(sp)
ffffffffc0206afe:	ec82                	sd	zero,88(sp)
ffffffffc0206b00:	16078b63          	beqz	a5,ffffffffc0206c76 <do_execve+0x502>
ffffffffc0206b04:	e04e                	sd	s3,0(sp)
ffffffffc0206b06:	f4ee                	sd	s11,104(sp)
ffffffffc0206b08:	f0d2                	sd	s4,96(sp)
ffffffffc0206b0a:	e8a2                	sd	s0,80(sp)
ffffffffc0206b0c:	6592                	ld	a1,256(sp)
ffffffffc0206b0e:	77a2                	ld	a5,40(sp)
ffffffffc0206b10:	4601                	li	a2,0
ffffffffc0206b12:	8526                	mv	a0,s1
ffffffffc0206b14:	95be                	add	a1,a1,a5
ffffffffc0206b16:	dabfe0ef          	jal	ra,ffffffffc02058c0 <sysfile_seek>
ffffffffc0206b1a:	842a                	mv	s0,a0
ffffffffc0206b1c:	12051063          	bnez	a0,ffffffffc0206c3c <do_execve+0x4c8>
ffffffffc0206b20:	03800613          	li	a2,56
ffffffffc0206b24:	112c                	addi	a1,sp,168
ffffffffc0206b26:	8526                	mv	a0,s1
ffffffffc0206b28:	b6bfe0ef          	jal	ra,ffffffffc0205692 <sysfile_read>
ffffffffc0206b2c:	03800793          	li	a5,56
ffffffffc0206b30:	10f50a63          	beq	a0,a5,ffffffffc0206c44 <do_execve+0x4d0>
ffffffffc0206b34:	6982                	ld	s3,0(sp)
ffffffffc0206b36:	6446                	ld	s0,80(sp)
ffffffffc0206b38:	0005091b          	sext.w	s2,a0
ffffffffc0206b3c:	00054363          	bltz	a0,ffffffffc0206b42 <do_execve+0x3ce>
ffffffffc0206b40:	597d                	li	s2,-1
ffffffffc0206b42:	854e                	mv	a0,s3
ffffffffc0206b44:	c3efd0ef          	jal	ra,ffffffffc0203f82 <exit_mmap>
ffffffffc0206b48:	0189b503          	ld	a0,24(s3)
ffffffffc0206b4c:	8a4a                	mv	s4,s2
ffffffffc0206b4e:	8f4ff0ef          	jal	ra,ffffffffc0205c42 <put_pgdir.isra.0>
ffffffffc0206b52:	854e                	mv	a0,s3
ffffffffc0206b54:	a92fd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc0206b58:	b525                	j	ffffffffc0206980 <do_execve+0x20c>
ffffffffc0206b5a:	57ba                	lw	a5,172(sp)
ffffffffc0206b5c:	4745                	li	a4,17
ffffffffc0206b5e:	e4ba                	sd	a4,72(sp)
ffffffffc0206b60:	0047f693          	andi	a3,a5,4
ffffffffc0206b64:	c681                	beqz	a3,ffffffffc0206b6c <do_execve+0x3f8>
ffffffffc0206b66:	474d                	li	a4,19
ffffffffc0206b68:	4685                	li	a3,1
ffffffffc0206b6a:	e4ba                	sd	a4,72(sp)
ffffffffc0206b6c:	0027f713          	andi	a4,a5,2
ffffffffc0206b70:	c709                	beqz	a4,ffffffffc0206b7a <do_execve+0x406>
ffffffffc0206b72:	475d                	li	a4,23
ffffffffc0206b74:	0026e693          	ori	a3,a3,2
ffffffffc0206b78:	e4ba                	sd	a4,72(sp)
ffffffffc0206b7a:	8b85                	andi	a5,a5,1
ffffffffc0206b7c:	c799                	beqz	a5,ffffffffc0206b8a <do_execve+0x416>
ffffffffc0206b7e:	67a6                	ld	a5,72(sp)
ffffffffc0206b80:	0046e693          	ori	a3,a3,4
ffffffffc0206b84:	0087e793          	ori	a5,a5,8
ffffffffc0206b88:	e4be                	sd	a5,72(sp)
ffffffffc0206b8a:	75ea                	ld	a1,184(sp)
ffffffffc0206b8c:	6502                	ld	a0,0(sp)
ffffffffc0206b8e:	4701                	li	a4,0
ffffffffc0206b90:	aa8fd0ef          	jal	ra,ffffffffc0203e38 <mm_map>
ffffffffc0206b94:	842a                	mv	s0,a0
ffffffffc0206b96:	e15d                	bnez	a0,ffffffffc0206c3c <do_execve+0x4c8>
ffffffffc0206b98:	796a                	ld	s2,184(sp)
ffffffffc0206b9a:	67ae                	ld	a5,200(sp)
ffffffffc0206b9c:	76fd                	lui	a3,0xfffff
ffffffffc0206b9e:	00d97db3          	and	s11,s2,a3
ffffffffc0206ba2:	00f909b3          	add	s3,s2,a5
ffffffffc0206ba6:	45397263          	bgeu	s2,s3,ffffffffc0206fea <do_execve+0x876>
ffffffffc0206baa:	5471                	li	s0,-4
ffffffffc0206bac:	8a6e                	mv	s4,s11
ffffffffc0206bae:	8d4a                	mv	s10,s2
ffffffffc0206bb0:	a015                	j	ffffffffc0206bd4 <do_execve+0x460>
ffffffffc0206bb2:	7742                	ld	a4,48(sp)
ffffffffc0206bb4:	77e2                	ld	a5,56(sp)
ffffffffc0206bb6:	414d0a33          	sub	s4,s10,s4
ffffffffc0206bba:	866e                	mv	a2,s11
ffffffffc0206bbc:	00f705b3          	add	a1,a4,a5
ffffffffc0206bc0:	95d2                	add	a1,a1,s4
ffffffffc0206bc2:	8526                	mv	a0,s1
ffffffffc0206bc4:	acffe0ef          	jal	ra,ffffffffc0205692 <sysfile_read>
ffffffffc0206bc8:	f6ad96e3          	bne	s11,a0,ffffffffc0206b34 <do_execve+0x3c0>
ffffffffc0206bcc:	9d6e                	add	s10,s10,s11
ffffffffc0206bce:	2f3d7363          	bgeu	s10,s3,ffffffffc0206eb4 <do_execve+0x740>
ffffffffc0206bd2:	8a5e                	mv	s4,s7
ffffffffc0206bd4:	6782                	ld	a5,0(sp)
ffffffffc0206bd6:	6626                	ld	a2,72(sp)
ffffffffc0206bd8:	85d2                	mv	a1,s4
ffffffffc0206bda:	6f88                	ld	a0,24(a5)
ffffffffc0206bdc:	fd7fc0ef          	jal	ra,ffffffffc0203bb2 <pgdir_alloc_page>
ffffffffc0206be0:	892a                	mv	s2,a0
ffffffffc0206be2:	2a050763          	beqz	a0,ffffffffc0206e90 <do_execve+0x71c>
ffffffffc0206be6:	6785                	lui	a5,0x1
ffffffffc0206be8:	00fa0bb3          	add	s7,s4,a5
ffffffffc0206bec:	41ab8db3          	sub	s11,s7,s10
ffffffffc0206bf0:	0179f463          	bgeu	s3,s7,ffffffffc0206bf8 <do_execve+0x484>
ffffffffc0206bf4:	41a98db3          	sub	s11,s3,s10
ffffffffc0206bf8:	000c3583          	ld	a1,0(s8)
ffffffffc0206bfc:	67c2                	ld	a5,16(sp)
ffffffffc0206bfe:	000cb603          	ld	a2,0(s9)
ffffffffc0206c02:	40b905b3          	sub	a1,s2,a1
ffffffffc0206c06:	8599                	srai	a1,a1,0x6
ffffffffc0206c08:	95be                	add	a1,a1,a5
ffffffffc0206c0a:	67a2                	ld	a5,8(sp)
ffffffffc0206c0c:	00f5f533          	and	a0,a1,a5
ffffffffc0206c10:	00c59793          	slli	a5,a1,0xc
ffffffffc0206c14:	f83e                	sd	a5,48(sp)
ffffffffc0206c16:	3ec57d63          	bgeu	a0,a2,ffffffffc0207010 <do_execve+0x89c>
ffffffffc0206c1a:	75ca                	ld	a1,176(sp)
ffffffffc0206c1c:	736a                	ld	t1,184(sp)
ffffffffc0206c1e:	00090797          	auipc	a5,0x90
ffffffffc0206c22:	c9a78793          	addi	a5,a5,-870 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206c26:	639c                	ld	a5,0(a5)
ffffffffc0206c28:	406585b3          	sub	a1,a1,t1
ffffffffc0206c2c:	4601                	li	a2,0
ffffffffc0206c2e:	8526                	mv	a0,s1
ffffffffc0206c30:	95ea                	add	a1,a1,s10
ffffffffc0206c32:	fc3e                	sd	a5,56(sp)
ffffffffc0206c34:	c8dfe0ef          	jal	ra,ffffffffc02058c0 <sysfile_seek>
ffffffffc0206c38:	842a                	mv	s0,a0
ffffffffc0206c3a:	dd25                	beqz	a0,ffffffffc0206bb2 <do_execve+0x43e>
ffffffffc0206c3c:	8922                	mv	s2,s0
ffffffffc0206c3e:	6982                	ld	s3,0(sp)
ffffffffc0206c40:	6446                	ld	s0,80(sp)
ffffffffc0206c42:	b701                	j	ffffffffc0206b42 <do_execve+0x3ce>
ffffffffc0206c44:	57aa                	lw	a5,168(sp)
ffffffffc0206c46:	4705                	li	a4,1
ffffffffc0206c48:	00e79863          	bne	a5,a4,ffffffffc0206c58 <do_execve+0x4e4>
ffffffffc0206c4c:	664e                	ld	a2,208(sp)
ffffffffc0206c4e:	67ae                	ld	a5,200(sp)
ffffffffc0206c50:	38f66963          	bltu	a2,a5,ffffffffc0206fe2 <do_execve+0x86e>
ffffffffc0206c54:	f00613e3          	bnez	a2,ffffffffc0206b5a <do_execve+0x3e6>
ffffffffc0206c58:	6766                	ld	a4,88(sp)
ffffffffc0206c5a:	76a2                	ld	a3,40(sp)
ffffffffc0206c5c:	11815783          	lhu	a5,280(sp)
ffffffffc0206c60:	2705                	addiw	a4,a4,1
ffffffffc0206c62:	03868693          	addi	a3,a3,56 # fffffffffffff038 <end+0x3fd68728>
ffffffffc0206c66:	ecba                	sd	a4,88(sp)
ffffffffc0206c68:	f436                	sd	a3,40(sp)
ffffffffc0206c6a:	eaf761e3          	bltu	a4,a5,ffffffffc0206b0c <do_execve+0x398>
ffffffffc0206c6e:	6982                	ld	s3,0(sp)
ffffffffc0206c70:	7da6                	ld	s11,104(sp)
ffffffffc0206c72:	7a06                	ld	s4,96(sp)
ffffffffc0206c74:	6446                	ld	s0,80(sp)
ffffffffc0206c76:	8526                	mv	a0,s1
ffffffffc0206c78:	8c8fe0ef          	jal	ra,ffffffffc0204d40 <file_close>
ffffffffc0206c7c:	4701                	li	a4,0
ffffffffc0206c7e:	46ad                	li	a3,11
ffffffffc0206c80:	00100637          	lui	a2,0x100
ffffffffc0206c84:	7ff005b7          	lui	a1,0x7ff00
ffffffffc0206c88:	854e                	mv	a0,s3
ffffffffc0206c8a:	9aefd0ef          	jal	ra,ffffffffc0203e38 <mm_map>
ffffffffc0206c8e:	892a                	mv	s2,a0
ffffffffc0206c90:	ea0519e3          	bnez	a0,ffffffffc0206b42 <do_execve+0x3ce>
ffffffffc0206c94:	7ffffbb7          	lui	s7,0x7ffff
ffffffffc0206c98:	797d                	lui	s2,0xfffff
ffffffffc0206c9a:	7fff74b7          	lui	s1,0x7fff7
ffffffffc0206c9e:	0189b503          	ld	a0,24(s3)
ffffffffc0206ca2:	465d                	li	a2,23
ffffffffc0206ca4:	85de                	mv	a1,s7
ffffffffc0206ca6:	f0dfc0ef          	jal	ra,ffffffffc0203bb2 <pgdir_alloc_page>
ffffffffc0206caa:	3a050463          	beqz	a0,ffffffffc0207052 <do_execve+0x8de>
ffffffffc0206cae:	9bca                	add	s7,s7,s2
ffffffffc0206cb0:	fe9b97e3          	bne	s7,s1,ffffffffc0206c9e <do_execve+0x52a>
ffffffffc0206cb4:	6c06                	ld	s8,64(sp)
ffffffffc0206cb6:	12810b93          	addi	s7,sp,296
ffffffffc0206cba:	856e                	mv	a0,s11
ffffffffc0206cbc:	4481                	li	s1,0
ffffffffc0206cbe:	4901                	li	s2,0
ffffffffc0206cc0:	a021                	j	ffffffffc0206cc8 <do_execve+0x554>
ffffffffc0206cc2:	000bb503          	ld	a0,0(s7) # 7ffff000 <_binary_bin_sfs_img_size+0x7ff89d00>
ffffffffc0206cc6:	0ba1                	addi	s7,s7,8
ffffffffc0206cc8:	6585                	lui	a1,0x1
ffffffffc0206cca:	309040ef          	jal	ra,ffffffffc020b7d2 <strnlen>
ffffffffc0206cce:	00150793          	addi	a5,a0,1
ffffffffc0206cd2:	2905                	addiw	s2,s2,1
ffffffffc0206cd4:	9cbd                	addw	s1,s1,a5
ffffffffc0206cd6:	ff8966e3          	bltu	s2,s8,ffffffffc0206cc2 <do_execve+0x54e>
ffffffffc0206cda:	02049793          	slli	a5,s1,0x20
ffffffffc0206cde:	9381                	srli	a5,a5,0x20
ffffffffc0206ce0:	079d                	addi	a5,a5,7
ffffffffc0206ce2:	80000737          	lui	a4,0x80000
ffffffffc0206ce6:	9be1                	andi	a5,a5,-8
ffffffffc0206ce8:	40f707bb          	subw	a5,a4,a5
ffffffffc0206cec:	7702                	ld	a4,32(sp)
ffffffffc0206cee:	1782                	slli	a5,a5,0x20
ffffffffc0206cf0:	9381                	srli	a5,a5,0x20
ffffffffc0206cf2:	00870c13          	addi	s8,a4,8 # ffffffff80000008 <_binary_bin_sfs_img_size+0xffffffff7ff8ad08>
ffffffffc0206cf6:	41878c33          	sub	s8,a5,s8
ffffffffc0206cfa:	ff0c7713          	andi	a4,s8,-16
ffffffffc0206cfe:	e43a                	sd	a4,8(sp)
ffffffffc0206d00:	ff070c93          	addi	s9,a4,-16
ffffffffc0206d04:	7ff00737          	lui	a4,0x7ff00
ffffffffc0206d08:	2eece863          	bltu	s9,a4,ffffffffc0206ff8 <do_execve+0x884>
ffffffffc0206d0c:	fcbe                	sd	a5,120(sp)
ffffffffc0206d0e:	416c07b3          	sub	a5,s8,s6
ffffffffc0206d12:	e03e                	sd	a5,0(sp)
ffffffffc0206d14:	87a2                	mv	a5,s0
ffffffffc0206d16:	6906                	ld	s2,64(sp)
ffffffffc0206d18:	846e                	mv	s0,s11
ffffffffc0206d1a:	4b81                	li	s7,0
ffffffffc0206d1c:	8dda                	mv	s11,s6
ffffffffc0206d1e:	8d3e                	mv	s10,a5
ffffffffc0206d20:	a019                	j	ffffffffc0206d26 <do_execve+0x5b2>
ffffffffc0206d22:	000db403          	ld	s0,0(s11)
ffffffffc0206d26:	6585                	lui	a1,0x1
ffffffffc0206d28:	8522                	mv	a0,s0
ffffffffc0206d2a:	2a9040ef          	jal	ra,ffffffffc020b7d2 <strnlen>
ffffffffc0206d2e:	84aa                	mv	s1,a0
ffffffffc0206d30:	75e6                	ld	a1,120(sp)
ffffffffc0206d32:	0189b503          	ld	a0,24(s3)
ffffffffc0206d36:	0485                	addi	s1,s1,1
ffffffffc0206d38:	86a6                	mv	a3,s1
ffffffffc0206d3a:	8622                	mv	a2,s0
ffffffffc0206d3c:	f69fe0ef          	jal	ra,ffffffffc0205ca4 <user_mem_store_bytes>
ffffffffc0206d40:	2a051963          	bnez	a0,ffffffffc0206ff2 <do_execve+0x87e>
ffffffffc0206d44:	6782                	ld	a5,0(sp)
ffffffffc0206d46:	0189b503          	ld	a0,24(s3)
ffffffffc0206d4a:	46a1                	li	a3,8
ffffffffc0206d4c:	18b0                	addi	a2,sp,120
ffffffffc0206d4e:	01b785b3          	add	a1,a5,s11
ffffffffc0206d52:	f53fe0ef          	jal	ra,ffffffffc0205ca4 <user_mem_store_bytes>
ffffffffc0206d56:	28051e63          	bnez	a0,ffffffffc0206ff2 <do_execve+0x87e>
ffffffffc0206d5a:	77e6                	ld	a5,120(sp)
ffffffffc0206d5c:	2b85                	addiw	s7,s7,1
ffffffffc0206d5e:	0da1                	addi	s11,s11,8
ffffffffc0206d60:	94be                	add	s1,s1,a5
ffffffffc0206d62:	fca6                	sd	s1,120(sp)
ffffffffc0206d64:	fb2befe3          	bltu	s7,s2,ffffffffc0206d22 <do_execve+0x5ae>
ffffffffc0206d68:	7782                	ld	a5,32(sp)
ffffffffc0206d6a:	0189b503          	ld	a0,24(s3)
ffffffffc0206d6e:	46a1                	li	a3,8
ffffffffc0206d70:	0110                	addi	a2,sp,128
ffffffffc0206d72:	00fc05b3          	add	a1,s8,a5
ffffffffc0206d76:	e102                	sd	zero,128(sp)
ffffffffc0206d78:	f2dfe0ef          	jal	ra,ffffffffc0205ca4 <user_mem_store_bytes>
ffffffffc0206d7c:	846a                	mv	s0,s10
ffffffffc0206d7e:	892a                	mv	s2,a0
ffffffffc0206d80:	dc0511e3          	bnez	a0,ffffffffc0206b42 <do_execve+0x3ce>
ffffffffc0206d84:	0189b503          	ld	a0,24(s3)
ffffffffc0206d88:	46a1                	li	a3,8
ffffffffc0206d8a:	0130                	addi	a2,sp,136
ffffffffc0206d8c:	85e6                	mv	a1,s9
ffffffffc0206d8e:	e56a                	sd	s10,136(sp)
ffffffffc0206d90:	f15fe0ef          	jal	ra,ffffffffc0205ca4 <user_mem_store_bytes>
ffffffffc0206d94:	892a                	mv	s2,a0
ffffffffc0206d96:	da0516e3          	bnez	a0,ffffffffc0206b42 <do_execve+0x3ce>
ffffffffc0206d9a:	67a2                	ld	a5,8(sp)
ffffffffc0206d9c:	0189b503          	ld	a0,24(s3)
ffffffffc0206da0:	46a1                	li	a3,8
ffffffffc0206da2:	0910                	addi	a2,sp,144
ffffffffc0206da4:	ff878593          	addi	a1,a5,-8
ffffffffc0206da8:	e962                	sd	s8,144(sp)
ffffffffc0206daa:	efbfe0ef          	jal	ra,ffffffffc0205ca4 <user_mem_store_bytes>
ffffffffc0206dae:	892a                	mv	s2,a0
ffffffffc0206db0:	d80519e3          	bnez	a0,ffffffffc0206b42 <do_execve+0x3ce>
ffffffffc0206db4:	0309a783          	lw	a5,48(s3)
ffffffffc0206db8:	000ab703          	ld	a4,0(s5)
ffffffffc0206dbc:	0189b683          	ld	a3,24(s3)
ffffffffc0206dc0:	2785                	addiw	a5,a5,1
ffffffffc0206dc2:	02f9a823          	sw	a5,48(s3)
ffffffffc0206dc6:	03373423          	sd	s3,40(a4) # 7ff00028 <_binary_bin_sfs_img_size+0x7fe8ad28>
ffffffffc0206dca:	c02007b7          	lui	a5,0xc0200
ffffffffc0206dce:	26f6e663          	bltu	a3,a5,ffffffffc020703a <do_execve+0x8c6>
ffffffffc0206dd2:	00090797          	auipc	a5,0x90
ffffffffc0206dd6:	ae678793          	addi	a5,a5,-1306 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206dda:	639c                	ld	a5,0(a5)
ffffffffc0206ddc:	8e9d                	sub	a3,a3,a5
ffffffffc0206dde:	f754                	sd	a3,168(a4)
ffffffffc0206de0:	577d                	li	a4,-1
ffffffffc0206de2:	00c6d793          	srli	a5,a3,0xc
ffffffffc0206de6:	177e                	slli	a4,a4,0x3f
ffffffffc0206de8:	8fd9                	or	a5,a5,a4
ffffffffc0206dea:	18079073          	csrw	satp,a5
ffffffffc0206dee:	12000073          	sfence.vma
ffffffffc0206df2:	000ab783          	ld	a5,0(s5)
ffffffffc0206df6:	12000613          	li	a2,288
ffffffffc0206dfa:	4581                	li	a1,0
ffffffffc0206dfc:	73c4                	ld	s1,160(a5)
ffffffffc0206dfe:	8526                	mv	a0,s1
ffffffffc0206e00:	25b040ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0206e04:	77ee                	ld	a5,248(sp)
ffffffffc0206e06:	05a4b823          	sd	s10,80(s1) # 7fff7050 <_binary_bin_sfs_img_size+0x7ff81d50>
ffffffffc0206e0a:	0194b823          	sd	s9,16(s1)
ffffffffc0206e0e:	0584bc23          	sd	s8,88(s1)
ffffffffc0206e12:	0604b023          	sd	zero,96(s1)
ffffffffc0206e16:	10f4b423          	sd	a5,264(s1)
ffffffffc0206e1a:	100027f3          	csrr	a5,sstatus
ffffffffc0206e1e:	edf7f793          	andi	a5,a5,-289
ffffffffc0206e22:	0207e793          	ori	a5,a5,32
ffffffffc0206e26:	10f4b023          	sd	a5,256(s1)
ffffffffc0206e2a:	7702                	ld	a4,32(sp)
ffffffffc0206e2c:	ff0b0793          	addi	a5,s6,-16
ffffffffc0206e30:	147d                	addi	s0,s0,-1
ffffffffc0206e32:	97ba                	add	a5,a5,a4
ffffffffc0206e34:	6762                	ld	a4,24(sp)
ffffffffc0206e36:	040e                	slli	s0,s0,0x3
ffffffffc0206e38:	9b22                	add	s6,s6,s0
ffffffffc0206e3a:	02071693          	slli	a3,a4,0x20
ffffffffc0206e3e:	01d6d713          	srli	a4,a3,0x1d
ffffffffc0206e42:	40e78433          	sub	s0,a5,a4
ffffffffc0206e46:	000b3503          	ld	a0,0(s6)
ffffffffc0206e4a:	1b61                	addi	s6,s6,-8
ffffffffc0206e4c:	a82fb0ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0206e50:	fe8b1be3          	bne	s6,s0,ffffffffc0206e46 <do_execve+0x6d2>
ffffffffc0206e54:	000ab403          	ld	s0,0(s5)
ffffffffc0206e58:	4641                	li	a2,16
ffffffffc0206e5a:	4581                	li	a1,0
ffffffffc0206e5c:	0b440413          	addi	s0,s0,180
ffffffffc0206e60:	8522                	mv	a0,s0
ffffffffc0206e62:	1f9040ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0206e66:	463d                	li	a2,15
ffffffffc0206e68:	092c                	addi	a1,sp,152
ffffffffc0206e6a:	8522                	mv	a0,s0
ffffffffc0206e6c:	241040ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc0206e70:	00007517          	auipc	a0,0x7
ffffffffc0206e74:	e5850513          	addi	a0,a0,-424 # ffffffffc020dcc8 <CSWTCH.79+0x540>
ffffffffc0206e78:	b2ef90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206e7c:	bee9                	j	ffffffffc0206a56 <do_execve+0x2e2>
ffffffffc0206e7e:	0189b503          	ld	a0,24(s3)
ffffffffc0206e82:	5a61                	li	s4,-8
ffffffffc0206e84:	dbffe0ef          	jal	ra,ffffffffc0205c42 <put_pgdir.isra.0>
ffffffffc0206e88:	854e                	mv	a0,s3
ffffffffc0206e8a:	f5dfc0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc0206e8e:	bccd                	j	ffffffffc0206980 <do_execve+0x20c>
ffffffffc0206e90:	8922                	mv	s2,s0
ffffffffc0206e92:	6982                	ld	s3,0(sp)
ffffffffc0206e94:	7a06                	ld	s4,96(sp)
ffffffffc0206e96:	6446                	ld	s0,80(sp)
ffffffffc0206e98:	854e                	mv	a0,s3
ffffffffc0206e9a:	8e8fd0ef          	jal	ra,ffffffffc0203f82 <exit_mmap>
ffffffffc0206e9e:	0189b503          	ld	a0,24(s3)
ffffffffc0206ea2:	da1fe0ef          	jal	ra,ffffffffc0205c42 <put_pgdir.isra.0>
ffffffffc0206ea6:	854e                	mv	a0,s3
ffffffffc0206ea8:	f3ffc0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc0206eac:	f6090fe3          	beqz	s2,ffffffffc0206e2a <do_execve+0x6b6>
ffffffffc0206eb0:	8a4a                	mv	s4,s2
ffffffffc0206eb2:	b4f9                	j	ffffffffc0206980 <do_execve+0x20c>
ffffffffc0206eb4:	7a6a                	ld	s4,184(sp)
ffffffffc0206eb6:	f84a                	sd	s2,48(sp)
ffffffffc0206eb8:	896a                	mv	s2,s10
ffffffffc0206eba:	66ce                	ld	a3,208(sp)
ffffffffc0206ebc:	9a36                	add	s4,s4,a3
ffffffffc0206ebe:	09797463          	bgeu	s2,s7,ffffffffc0206f46 <do_execve+0x7d2>
ffffffffc0206ec2:	d92a0be3          	beq	s4,s2,ffffffffc0206c58 <do_execve+0x4e4>
ffffffffc0206ec6:	6785                	lui	a5,0x1
ffffffffc0206ec8:	00f90533          	add	a0,s2,a5
ffffffffc0206ecc:	41750533          	sub	a0,a0,s7
ffffffffc0206ed0:	412a09b3          	sub	s3,s4,s2
ffffffffc0206ed4:	017a6463          	bltu	s4,s7,ffffffffc0206edc <do_execve+0x768>
ffffffffc0206ed8:	412b89b3          	sub	s3,s7,s2
ffffffffc0206edc:	77c2                	ld	a5,48(sp)
ffffffffc0206ede:	000c3683          	ld	a3,0(s8)
ffffffffc0206ee2:	000cb603          	ld	a2,0(s9)
ffffffffc0206ee6:	40d786b3          	sub	a3,a5,a3
ffffffffc0206eea:	67c2                	ld	a5,16(sp)
ffffffffc0206eec:	8699                	srai	a3,a3,0x6
ffffffffc0206eee:	96be                	add	a3,a3,a5
ffffffffc0206ef0:	67a2                	ld	a5,8(sp)
ffffffffc0206ef2:	00f6f5b3          	and	a1,a3,a5
ffffffffc0206ef6:	06b2                	slli	a3,a3,0xc
ffffffffc0206ef8:	10c5fd63          	bgeu	a1,a2,ffffffffc0207012 <do_execve+0x89e>
ffffffffc0206efc:	00090797          	auipc	a5,0x90
ffffffffc0206f00:	9bc78793          	addi	a5,a5,-1604 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206f04:	0007b883          	ld	a7,0(a5)
ffffffffc0206f08:	864e                	mv	a2,s3
ffffffffc0206f0a:	4581                	li	a1,0
ffffffffc0206f0c:	96c6                	add	a3,a3,a7
ffffffffc0206f0e:	9536                	add	a0,a0,a3
ffffffffc0206f10:	14b040ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0206f14:	012987b3          	add	a5,s3,s2
ffffffffc0206f18:	037a7463          	bgeu	s4,s7,ffffffffc0206f40 <do_execve+0x7cc>
ffffffffc0206f1c:	d2fa0ee3          	beq	s4,a5,ffffffffc0206c58 <do_execve+0x4e4>
ffffffffc0206f20:	00007697          	auipc	a3,0x7
ffffffffc0206f24:	ce068693          	addi	a3,a3,-800 # ffffffffc020dc00 <CSWTCH.79+0x478>
ffffffffc0206f28:	00005617          	auipc	a2,0x5
ffffffffc0206f2c:	e1860613          	addi	a2,a2,-488 # ffffffffc020bd40 <commands+0x210>
ffffffffc0206f30:	38d00593          	li	a1,909
ffffffffc0206f34:	00007517          	auipc	a0,0x7
ffffffffc0206f38:	94450513          	addi	a0,a0,-1724 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc0206f3c:	d62f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f40:	ff7790e3          	bne	a5,s7,ffffffffc0206f20 <do_execve+0x7ac>
ffffffffc0206f44:	895e                	mv	s2,s7
ffffffffc0206f46:	d14979e3          	bgeu	s2,s4,ffffffffc0206c58 <do_execve+0x4e4>
ffffffffc0206f4a:	6982                	ld	s3,0(sp)
ffffffffc0206f4c:	6da6                	ld	s11,72(sp)
ffffffffc0206f4e:	6d42                	ld	s10,16(sp)
ffffffffc0206f50:	f822                	sd	s0,48(sp)
ffffffffc0206f52:	a0b1                	j	ffffffffc0206f9e <do_execve+0x82a>
ffffffffc0206f54:	6785                	lui	a5,0x1
ffffffffc0206f56:	41790533          	sub	a0,s2,s7
ffffffffc0206f5a:	9bbe                	add	s7,s7,a5
ffffffffc0206f5c:	412b8633          	sub	a2,s7,s2
ffffffffc0206f60:	017a7463          	bgeu	s4,s7,ffffffffc0206f68 <do_execve+0x7f4>
ffffffffc0206f64:	412a0633          	sub	a2,s4,s2
ffffffffc0206f68:	000c3783          	ld	a5,0(s8)
ffffffffc0206f6c:	6722                	ld	a4,8(sp)
ffffffffc0206f6e:	000cb683          	ld	a3,0(s9)
ffffffffc0206f72:	40f407b3          	sub	a5,s0,a5
ffffffffc0206f76:	8799                	srai	a5,a5,0x6
ffffffffc0206f78:	97ea                	add	a5,a5,s10
ffffffffc0206f7a:	00e7f5b3          	and	a1,a5,a4
ffffffffc0206f7e:	07b2                	slli	a5,a5,0xc
ffffffffc0206f80:	08d5f863          	bgeu	a1,a3,ffffffffc0207010 <do_execve+0x89c>
ffffffffc0206f84:	00090717          	auipc	a4,0x90
ffffffffc0206f88:	93470713          	addi	a4,a4,-1740 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206f8c:	6314                	ld	a3,0(a4)
ffffffffc0206f8e:	9932                	add	s2,s2,a2
ffffffffc0206f90:	4581                	li	a1,0
ffffffffc0206f92:	97b6                	add	a5,a5,a3
ffffffffc0206f94:	953e                	add	a0,a0,a5
ffffffffc0206f96:	0c5040ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0206f9a:	03497063          	bgeu	s2,s4,ffffffffc0206fba <do_execve+0x846>
ffffffffc0206f9e:	0189b503          	ld	a0,24(s3)
ffffffffc0206fa2:	866e                	mv	a2,s11
ffffffffc0206fa4:	85de                	mv	a1,s7
ffffffffc0206fa6:	c0dfc0ef          	jal	ra,ffffffffc0203bb2 <pgdir_alloc_page>
ffffffffc0206faa:	842a                	mv	s0,a0
ffffffffc0206fac:	f545                	bnez	a0,ffffffffc0206f54 <do_execve+0x7e0>
ffffffffc0206fae:	7942                	ld	s2,48(sp)
ffffffffc0206fb0:	7a06                	ld	s4,96(sp)
ffffffffc0206fb2:	6446                	ld	s0,80(sp)
ffffffffc0206fb4:	b5d5                	j	ffffffffc0206e98 <do_execve+0x724>
ffffffffc0206fb6:	5a75                	li	s4,-3
ffffffffc0206fb8:	bc79                	j	ffffffffc0206a56 <do_execve+0x2e2>
ffffffffc0206fba:	f822                	sd	s0,48(sp)
ffffffffc0206fbc:	b971                	j	ffffffffc0206c58 <do_execve+0x4e4>
ffffffffc0206fbe:	5a75                	li	s4,-3
ffffffffc0206fc0:	bca5                	j	ffffffffc0206a38 <do_execve+0x2c4>
ffffffffc0206fc2:	00007517          	auipc	a0,0x7
ffffffffc0206fc6:	b6650513          	addi	a0,a0,-1178 # ffffffffc020db28 <CSWTCH.79+0x3a0>
ffffffffc0206fca:	9dcf90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206fce:	fe0904e3          	beqz	s2,ffffffffc0206fb6 <do_execve+0x842>
ffffffffc0206fd2:	03890513          	addi	a0,s2,56 # fffffffffffff038 <end+0x3fd68728>
ffffffffc0206fd6:	f2afd0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0206fda:	5a75                	li	s4,-3
ffffffffc0206fdc:	04092823          	sw	zero,80(s2)
ffffffffc0206fe0:	bc9d                	j	ffffffffc0206a56 <do_execve+0x2e2>
ffffffffc0206fe2:	6982                	ld	s3,0(sp)
ffffffffc0206fe4:	6446                	ld	s0,80(sp)
ffffffffc0206fe6:	5961                	li	s2,-8
ffffffffc0206fe8:	bea9                	j	ffffffffc0206b42 <do_execve+0x3ce>
ffffffffc0206fea:	8a4a                	mv	s4,s2
ffffffffc0206fec:	8bee                	mv	s7,s11
ffffffffc0206fee:	5471                	li	s0,-4
ffffffffc0206ff0:	b5e9                	j	ffffffffc0206eba <do_execve+0x746>
ffffffffc0206ff2:	892a                	mv	s2,a0
ffffffffc0206ff4:	846a                	mv	s0,s10
ffffffffc0206ff6:	b6b1                	j	ffffffffc0206b42 <do_execve+0x3ce>
ffffffffc0206ff8:	854e                	mv	a0,s3
ffffffffc0206ffa:	f89fc0ef          	jal	ra,ffffffffc0203f82 <exit_mmap>
ffffffffc0206ffe:	0189b503          	ld	a0,24(s3)
ffffffffc0207002:	5a71                	li	s4,-4
ffffffffc0207004:	c3ffe0ef          	jal	ra,ffffffffc0205c42 <put_pgdir.isra.0>
ffffffffc0207008:	854e                	mv	a0,s3
ffffffffc020700a:	dddfc0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc020700e:	ba8d                	j	ffffffffc0206980 <do_execve+0x20c>
ffffffffc0207010:	86be                	mv	a3,a5
ffffffffc0207012:	00006617          	auipc	a2,0x6
ffffffffc0207016:	88660613          	addi	a2,a2,-1914 # ffffffffc020c898 <default_pmm_manager+0x38>
ffffffffc020701a:	07100593          	li	a1,113
ffffffffc020701e:	00006517          	auipc	a0,0x6
ffffffffc0207022:	8a250513          	addi	a0,a0,-1886 # ffffffffc020c8c0 <default_pmm_manager+0x60>
ffffffffc0207026:	c78f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020702a:	85a6                	mv	a1,s1
ffffffffc020702c:	00007517          	auipc	a0,0x7
ffffffffc0207030:	b5c50513          	addi	a0,a0,-1188 # ffffffffc020db88 <CSWTCH.79+0x400>
ffffffffc0207034:	972f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207038:	baa1                	j	ffffffffc0206990 <do_execve+0x21c>
ffffffffc020703a:	00006617          	auipc	a2,0x6
ffffffffc020703e:	90660613          	addi	a2,a2,-1786 # ffffffffc020c940 <default_pmm_manager+0xe0>
ffffffffc0207042:	3ec00593          	li	a1,1004
ffffffffc0207046:	00007517          	auipc	a0,0x7
ffffffffc020704a:	83250513          	addi	a0,a0,-1998 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc020704e:	c50f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207052:	00007697          	auipc	a3,0x7
ffffffffc0207056:	bee68693          	addi	a3,a3,-1042 # ffffffffc020dc40 <CSWTCH.79+0x4b8>
ffffffffc020705a:	00005617          	auipc	a2,0x5
ffffffffc020705e:	ce660613          	addi	a2,a2,-794 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207062:	3ae00593          	li	a1,942
ffffffffc0207066:	00007517          	auipc	a0,0x7
ffffffffc020706a:	81250513          	addi	a0,a0,-2030 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc020706e:	c30f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207072:	00007617          	auipc	a2,0x7
ffffffffc0207076:	b6660613          	addi	a2,a2,-1178 # ffffffffc020dbd8 <CSWTCH.79+0x450>
ffffffffc020707a:	30b00593          	li	a1,779
ffffffffc020707e:	00006517          	auipc	a0,0x6
ffffffffc0207082:	7fa50513          	addi	a0,a0,2042 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc0207086:	c18f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020708a <user_main>:
ffffffffc020708a:	7179                	addi	sp,sp,-48
ffffffffc020708c:	e84a                	sd	s2,16(sp)
ffffffffc020708e:	00090917          	auipc	s2,0x90
ffffffffc0207092:	83290913          	addi	s2,s2,-1998 # ffffffffc02968c0 <current>
ffffffffc0207096:	00093783          	ld	a5,0(s2)
ffffffffc020709a:	00007617          	auipc	a2,0x7
ffffffffc020709e:	cb660613          	addi	a2,a2,-842 # ffffffffc020dd50 <CSWTCH.79+0x5c8>
ffffffffc02070a2:	00007517          	auipc	a0,0x7
ffffffffc02070a6:	cb650513          	addi	a0,a0,-842 # ffffffffc020dd58 <CSWTCH.79+0x5d0>
ffffffffc02070aa:	43cc                	lw	a1,4(a5)
ffffffffc02070ac:	00007797          	auipc	a5,0x7
ffffffffc02070b0:	c9c78793          	addi	a5,a5,-868 # ffffffffc020dd48 <CSWTCH.79+0x5c0>
ffffffffc02070b4:	e03e                	sd	a5,0(sp)
ffffffffc02070b6:	f406                	sd	ra,40(sp)
ffffffffc02070b8:	f022                	sd	s0,32(sp)
ffffffffc02070ba:	ec26                	sd	s1,24(sp)
ffffffffc02070bc:	e402                	sd	zero,8(sp)
ffffffffc02070be:	8e8f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02070c2:	6782                	ld	a5,0(sp)
ffffffffc02070c4:	cfb9                	beqz	a5,ffffffffc0207122 <user_main+0x98>
ffffffffc02070c6:	003c                	addi	a5,sp,8
ffffffffc02070c8:	4401                	li	s0,0
ffffffffc02070ca:	6398                	ld	a4,0(a5)
ffffffffc02070cc:	0405                	addi	s0,s0,1
ffffffffc02070ce:	07a1                	addi	a5,a5,8
ffffffffc02070d0:	ff6d                	bnez	a4,ffffffffc02070ca <user_main+0x40>
ffffffffc02070d2:	00093783          	ld	a5,0(s2)
ffffffffc02070d6:	12000613          	li	a2,288
ffffffffc02070da:	6b84                	ld	s1,16(a5)
ffffffffc02070dc:	73cc                	ld	a1,160(a5)
ffffffffc02070de:	6789                	lui	a5,0x2
ffffffffc02070e0:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc02070e4:	94be                	add	s1,s1,a5
ffffffffc02070e6:	8526                	mv	a0,s1
ffffffffc02070e8:	7c4040ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc02070ec:	00093783          	ld	a5,0(s2)
ffffffffc02070f0:	860a                	mv	a2,sp
ffffffffc02070f2:	0004059b          	sext.w	a1,s0
ffffffffc02070f6:	f3c4                	sd	s1,160(a5)
ffffffffc02070f8:	00007517          	auipc	a0,0x7
ffffffffc02070fc:	c5850513          	addi	a0,a0,-936 # ffffffffc020dd50 <CSWTCH.79+0x5c8>
ffffffffc0207100:	e74ff0ef          	jal	ra,ffffffffc0206774 <do_execve>
ffffffffc0207104:	8126                	mv	sp,s1
ffffffffc0207106:	9dafa06f          	j	ffffffffc02012e0 <__trapret>
ffffffffc020710a:	00007617          	auipc	a2,0x7
ffffffffc020710e:	c7660613          	addi	a2,a2,-906 # ffffffffc020dd80 <CSWTCH.79+0x5f8>
ffffffffc0207112:	52800593          	li	a1,1320
ffffffffc0207116:	00006517          	auipc	a0,0x6
ffffffffc020711a:	76250513          	addi	a0,a0,1890 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc020711e:	b80f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207122:	4401                	li	s0,0
ffffffffc0207124:	b77d                	j	ffffffffc02070d2 <user_main+0x48>

ffffffffc0207126 <do_yield>:
ffffffffc0207126:	0008f797          	auipc	a5,0x8f
ffffffffc020712a:	79a7b783          	ld	a5,1946(a5) # ffffffffc02968c0 <current>
ffffffffc020712e:	4705                	li	a4,1
ffffffffc0207130:	ef98                	sd	a4,24(a5)
ffffffffc0207132:	4501                	li	a0,0
ffffffffc0207134:	8082                	ret

ffffffffc0207136 <do_wait>:
ffffffffc0207136:	1101                	addi	sp,sp,-32
ffffffffc0207138:	e822                	sd	s0,16(sp)
ffffffffc020713a:	e426                	sd	s1,8(sp)
ffffffffc020713c:	ec06                	sd	ra,24(sp)
ffffffffc020713e:	842e                	mv	s0,a1
ffffffffc0207140:	84aa                	mv	s1,a0
ffffffffc0207142:	c999                	beqz	a1,ffffffffc0207158 <do_wait+0x22>
ffffffffc0207144:	0008f797          	auipc	a5,0x8f
ffffffffc0207148:	77c7b783          	ld	a5,1916(a5) # ffffffffc02968c0 <current>
ffffffffc020714c:	7788                	ld	a0,40(a5)
ffffffffc020714e:	4685                	li	a3,1
ffffffffc0207150:	4611                	li	a2,4
ffffffffc0207152:	ae0fd0ef          	jal	ra,ffffffffc0204432 <user_mem_check>
ffffffffc0207156:	c909                	beqz	a0,ffffffffc0207168 <do_wait+0x32>
ffffffffc0207158:	85a2                	mv	a1,s0
ffffffffc020715a:	6442                	ld	s0,16(sp)
ffffffffc020715c:	60e2                	ld	ra,24(sp)
ffffffffc020715e:	8526                	mv	a0,s1
ffffffffc0207160:	64a2                	ld	s1,8(sp)
ffffffffc0207162:	6105                	addi	sp,sp,32
ffffffffc0207164:	a86ff06f          	j	ffffffffc02063ea <do_wait.part.0>
ffffffffc0207168:	60e2                	ld	ra,24(sp)
ffffffffc020716a:	6442                	ld	s0,16(sp)
ffffffffc020716c:	64a2                	ld	s1,8(sp)
ffffffffc020716e:	5575                	li	a0,-3
ffffffffc0207170:	6105                	addi	sp,sp,32
ffffffffc0207172:	8082                	ret

ffffffffc0207174 <do_kill>:
ffffffffc0207174:	1141                	addi	sp,sp,-16
ffffffffc0207176:	6789                	lui	a5,0x2
ffffffffc0207178:	e406                	sd	ra,8(sp)
ffffffffc020717a:	e022                	sd	s0,0(sp)
ffffffffc020717c:	fff5071b          	addiw	a4,a0,-1
ffffffffc0207180:	17f9                	addi	a5,a5,-2
ffffffffc0207182:	02e7e963          	bltu	a5,a4,ffffffffc02071b4 <do_kill+0x40>
ffffffffc0207186:	842a                	mv	s0,a0
ffffffffc0207188:	45a9                	li	a1,10
ffffffffc020718a:	2501                	sext.w	a0,a0
ffffffffc020718c:	19a040ef          	jal	ra,ffffffffc020b326 <hash32>
ffffffffc0207190:	02051793          	slli	a5,a0,0x20
ffffffffc0207194:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0207198:	0008a797          	auipc	a5,0x8a
ffffffffc020719c:	62878793          	addi	a5,a5,1576 # ffffffffc02917c0 <hash_list>
ffffffffc02071a0:	953e                	add	a0,a0,a5
ffffffffc02071a2:	87aa                	mv	a5,a0
ffffffffc02071a4:	a029                	j	ffffffffc02071ae <do_kill+0x3a>
ffffffffc02071a6:	f2c7a703          	lw	a4,-212(a5)
ffffffffc02071aa:	00870b63          	beq	a4,s0,ffffffffc02071c0 <do_kill+0x4c>
ffffffffc02071ae:	679c                	ld	a5,8(a5)
ffffffffc02071b0:	fef51be3          	bne	a0,a5,ffffffffc02071a6 <do_kill+0x32>
ffffffffc02071b4:	5475                	li	s0,-3
ffffffffc02071b6:	60a2                	ld	ra,8(sp)
ffffffffc02071b8:	8522                	mv	a0,s0
ffffffffc02071ba:	6402                	ld	s0,0(sp)
ffffffffc02071bc:	0141                	addi	sp,sp,16
ffffffffc02071be:	8082                	ret
ffffffffc02071c0:	fd87a703          	lw	a4,-40(a5)
ffffffffc02071c4:	00177693          	andi	a3,a4,1
ffffffffc02071c8:	e295                	bnez	a3,ffffffffc02071ec <do_kill+0x78>
ffffffffc02071ca:	4bd4                	lw	a3,20(a5)
ffffffffc02071cc:	00176713          	ori	a4,a4,1
ffffffffc02071d0:	fce7ac23          	sw	a4,-40(a5)
ffffffffc02071d4:	4401                	li	s0,0
ffffffffc02071d6:	fe06d0e3          	bgez	a3,ffffffffc02071b6 <do_kill+0x42>
ffffffffc02071da:	f2878513          	addi	a0,a5,-216
ffffffffc02071de:	45e000ef          	jal	ra,ffffffffc020763c <wakeup_proc>
ffffffffc02071e2:	60a2                	ld	ra,8(sp)
ffffffffc02071e4:	8522                	mv	a0,s0
ffffffffc02071e6:	6402                	ld	s0,0(sp)
ffffffffc02071e8:	0141                	addi	sp,sp,16
ffffffffc02071ea:	8082                	ret
ffffffffc02071ec:	545d                	li	s0,-9
ffffffffc02071ee:	b7e1                	j	ffffffffc02071b6 <do_kill+0x42>

ffffffffc02071f0 <proc_init>:
ffffffffc02071f0:	1101                	addi	sp,sp,-32
ffffffffc02071f2:	e426                	sd	s1,8(sp)
ffffffffc02071f4:	0008e797          	auipc	a5,0x8e
ffffffffc02071f8:	5cc78793          	addi	a5,a5,1484 # ffffffffc02957c0 <proc_list>
ffffffffc02071fc:	ec06                	sd	ra,24(sp)
ffffffffc02071fe:	e822                	sd	s0,16(sp)
ffffffffc0207200:	e04a                	sd	s2,0(sp)
ffffffffc0207202:	0008a497          	auipc	s1,0x8a
ffffffffc0207206:	5be48493          	addi	s1,s1,1470 # ffffffffc02917c0 <hash_list>
ffffffffc020720a:	e79c                	sd	a5,8(a5)
ffffffffc020720c:	e39c                	sd	a5,0(a5)
ffffffffc020720e:	0008e717          	auipc	a4,0x8e
ffffffffc0207212:	5b270713          	addi	a4,a4,1458 # ffffffffc02957c0 <proc_list>
ffffffffc0207216:	87a6                	mv	a5,s1
ffffffffc0207218:	e79c                	sd	a5,8(a5)
ffffffffc020721a:	e39c                	sd	a5,0(a5)
ffffffffc020721c:	07c1                	addi	a5,a5,16
ffffffffc020721e:	fef71de3          	bne	a4,a5,ffffffffc0207218 <proc_init+0x28>
ffffffffc0207222:	8e7fe0ef          	jal	ra,ffffffffc0205b08 <alloc_proc>
ffffffffc0207226:	0008f917          	auipc	s2,0x8f
ffffffffc020722a:	6a290913          	addi	s2,s2,1698 # ffffffffc02968c8 <idleproc>
ffffffffc020722e:	00a93023          	sd	a0,0(s2)
ffffffffc0207232:	842a                	mv	s0,a0
ffffffffc0207234:	12050a63          	beqz	a0,ffffffffc0207368 <proc_init+0x178>
ffffffffc0207238:	4789                	li	a5,2
ffffffffc020723a:	e11c                	sd	a5,0(a0)
ffffffffc020723c:	0000a797          	auipc	a5,0xa
ffffffffc0207240:	dc478793          	addi	a5,a5,-572 # ffffffffc0211000 <bootstack>
ffffffffc0207244:	e91c                	sd	a5,16(a0)
ffffffffc0207246:	4785                	li	a5,1
ffffffffc0207248:	ed1c                	sd	a5,24(a0)
ffffffffc020724a:	924fe0ef          	jal	ra,ffffffffc020536e <files_create>
ffffffffc020724e:	14a43423          	sd	a0,328(s0)
ffffffffc0207252:	0e050f63          	beqz	a0,ffffffffc0207350 <proc_init+0x160>
ffffffffc0207256:	00093403          	ld	s0,0(s2)
ffffffffc020725a:	4641                	li	a2,16
ffffffffc020725c:	4581                	li	a1,0
ffffffffc020725e:	14843703          	ld	a4,328(s0)
ffffffffc0207262:	0b440413          	addi	s0,s0,180
ffffffffc0207266:	8522                	mv	a0,s0
ffffffffc0207268:	4b1c                	lw	a5,16(a4)
ffffffffc020726a:	2785                	addiw	a5,a5,1
ffffffffc020726c:	cb1c                	sw	a5,16(a4)
ffffffffc020726e:	5ec040ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0207272:	463d                	li	a2,15
ffffffffc0207274:	00007597          	auipc	a1,0x7
ffffffffc0207278:	b6c58593          	addi	a1,a1,-1172 # ffffffffc020dde0 <CSWTCH.79+0x658>
ffffffffc020727c:	8522                	mv	a0,s0
ffffffffc020727e:	62e040ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc0207282:	0008f717          	auipc	a4,0x8f
ffffffffc0207286:	65670713          	addi	a4,a4,1622 # ffffffffc02968d8 <nr_process>
ffffffffc020728a:	431c                	lw	a5,0(a4)
ffffffffc020728c:	00093683          	ld	a3,0(s2)
ffffffffc0207290:	6605                	lui	a2,0x1
ffffffffc0207292:	2785                	addiw	a5,a5,1
ffffffffc0207294:	80060613          	addi	a2,a2,-2048 # 800 <_binary_bin_swap_img_size-0x7500>
ffffffffc0207298:	4581                	li	a1,0
ffffffffc020729a:	fffff517          	auipc	a0,0xfffff
ffffffffc020729e:	30e50513          	addi	a0,a0,782 # ffffffffc02065a8 <init_main>
ffffffffc02072a2:	c31c                	sw	a5,0(a4)
ffffffffc02072a4:	0008f797          	auipc	a5,0x8f
ffffffffc02072a8:	60d7be23          	sd	a3,1564(a5) # ffffffffc02968c0 <current>
ffffffffc02072ac:	f8dfe0ef          	jal	ra,ffffffffc0206238 <kernel_thread>
ffffffffc02072b0:	842a                	mv	s0,a0
ffffffffc02072b2:	08a05363          	blez	a0,ffffffffc0207338 <proc_init+0x148>
ffffffffc02072b6:	6789                	lui	a5,0x2
ffffffffc02072b8:	fff5071b          	addiw	a4,a0,-1
ffffffffc02072bc:	17f9                	addi	a5,a5,-2
ffffffffc02072be:	2501                	sext.w	a0,a0
ffffffffc02072c0:	02e7e363          	bltu	a5,a4,ffffffffc02072e6 <proc_init+0xf6>
ffffffffc02072c4:	45a9                	li	a1,10
ffffffffc02072c6:	060040ef          	jal	ra,ffffffffc020b326 <hash32>
ffffffffc02072ca:	02051793          	slli	a5,a0,0x20
ffffffffc02072ce:	01c7d693          	srli	a3,a5,0x1c
ffffffffc02072d2:	96a6                	add	a3,a3,s1
ffffffffc02072d4:	87b6                	mv	a5,a3
ffffffffc02072d6:	a029                	j	ffffffffc02072e0 <proc_init+0xf0>
ffffffffc02072d8:	f2c7a703          	lw	a4,-212(a5) # 1f2c <_binary_bin_swap_img_size-0x5dd4>
ffffffffc02072dc:	04870b63          	beq	a4,s0,ffffffffc0207332 <proc_init+0x142>
ffffffffc02072e0:	679c                	ld	a5,8(a5)
ffffffffc02072e2:	fef69be3          	bne	a3,a5,ffffffffc02072d8 <proc_init+0xe8>
ffffffffc02072e6:	4781                	li	a5,0
ffffffffc02072e8:	0b478493          	addi	s1,a5,180
ffffffffc02072ec:	4641                	li	a2,16
ffffffffc02072ee:	4581                	li	a1,0
ffffffffc02072f0:	0008f417          	auipc	s0,0x8f
ffffffffc02072f4:	5e040413          	addi	s0,s0,1504 # ffffffffc02968d0 <initproc>
ffffffffc02072f8:	8526                	mv	a0,s1
ffffffffc02072fa:	e01c                	sd	a5,0(s0)
ffffffffc02072fc:	55e040ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0207300:	463d                	li	a2,15
ffffffffc0207302:	00007597          	auipc	a1,0x7
ffffffffc0207306:	b0658593          	addi	a1,a1,-1274 # ffffffffc020de08 <CSWTCH.79+0x680>
ffffffffc020730a:	8526                	mv	a0,s1
ffffffffc020730c:	5a0040ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc0207310:	00093783          	ld	a5,0(s2)
ffffffffc0207314:	c7d1                	beqz	a5,ffffffffc02073a0 <proc_init+0x1b0>
ffffffffc0207316:	43dc                	lw	a5,4(a5)
ffffffffc0207318:	e7c1                	bnez	a5,ffffffffc02073a0 <proc_init+0x1b0>
ffffffffc020731a:	601c                	ld	a5,0(s0)
ffffffffc020731c:	c3b5                	beqz	a5,ffffffffc0207380 <proc_init+0x190>
ffffffffc020731e:	43d8                	lw	a4,4(a5)
ffffffffc0207320:	4785                	li	a5,1
ffffffffc0207322:	04f71f63          	bne	a4,a5,ffffffffc0207380 <proc_init+0x190>
ffffffffc0207326:	60e2                	ld	ra,24(sp)
ffffffffc0207328:	6442                	ld	s0,16(sp)
ffffffffc020732a:	64a2                	ld	s1,8(sp)
ffffffffc020732c:	6902                	ld	s2,0(sp)
ffffffffc020732e:	6105                	addi	sp,sp,32
ffffffffc0207330:	8082                	ret
ffffffffc0207332:	f2878793          	addi	a5,a5,-216
ffffffffc0207336:	bf4d                	j	ffffffffc02072e8 <proc_init+0xf8>
ffffffffc0207338:	00007617          	auipc	a2,0x7
ffffffffc020733c:	ab060613          	addi	a2,a2,-1360 # ffffffffc020dde8 <CSWTCH.79+0x660>
ffffffffc0207340:	58000593          	li	a1,1408
ffffffffc0207344:	00006517          	auipc	a0,0x6
ffffffffc0207348:	53450513          	addi	a0,a0,1332 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc020734c:	952f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207350:	00007617          	auipc	a2,0x7
ffffffffc0207354:	a6860613          	addi	a2,a2,-1432 # ffffffffc020ddb8 <CSWTCH.79+0x630>
ffffffffc0207358:	57400593          	li	a1,1396
ffffffffc020735c:	00006517          	auipc	a0,0x6
ffffffffc0207360:	51c50513          	addi	a0,a0,1308 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc0207364:	93af90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207368:	00007617          	auipc	a2,0x7
ffffffffc020736c:	a3860613          	addi	a2,a2,-1480 # ffffffffc020dda0 <CSWTCH.79+0x618>
ffffffffc0207370:	56a00593          	li	a1,1386
ffffffffc0207374:	00006517          	auipc	a0,0x6
ffffffffc0207378:	50450513          	addi	a0,a0,1284 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc020737c:	922f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207380:	00007697          	auipc	a3,0x7
ffffffffc0207384:	ab868693          	addi	a3,a3,-1352 # ffffffffc020de38 <CSWTCH.79+0x6b0>
ffffffffc0207388:	00005617          	auipc	a2,0x5
ffffffffc020738c:	9b860613          	addi	a2,a2,-1608 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207390:	58700593          	li	a1,1415
ffffffffc0207394:	00006517          	auipc	a0,0x6
ffffffffc0207398:	4e450513          	addi	a0,a0,1252 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc020739c:	902f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02073a0:	00007697          	auipc	a3,0x7
ffffffffc02073a4:	a7068693          	addi	a3,a3,-1424 # ffffffffc020de10 <CSWTCH.79+0x688>
ffffffffc02073a8:	00005617          	auipc	a2,0x5
ffffffffc02073ac:	99860613          	addi	a2,a2,-1640 # ffffffffc020bd40 <commands+0x210>
ffffffffc02073b0:	58600593          	li	a1,1414
ffffffffc02073b4:	00006517          	auipc	a0,0x6
ffffffffc02073b8:	4c450513          	addi	a0,a0,1220 # ffffffffc020d878 <CSWTCH.79+0xf0>
ffffffffc02073bc:	8e2f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02073c0 <cpu_idle>:
ffffffffc02073c0:	1141                	addi	sp,sp,-16
ffffffffc02073c2:	e022                	sd	s0,0(sp)
ffffffffc02073c4:	e406                	sd	ra,8(sp)
ffffffffc02073c6:	0008f417          	auipc	s0,0x8f
ffffffffc02073ca:	4fa40413          	addi	s0,s0,1274 # ffffffffc02968c0 <current>
ffffffffc02073ce:	6018                	ld	a4,0(s0)
ffffffffc02073d0:	6f1c                	ld	a5,24(a4)
ffffffffc02073d2:	dffd                	beqz	a5,ffffffffc02073d0 <cpu_idle+0x10>
ffffffffc02073d4:	31a000ef          	jal	ra,ffffffffc02076ee <schedule>
ffffffffc02073d8:	bfdd                	j	ffffffffc02073ce <cpu_idle+0xe>

ffffffffc02073da <lab6_set_priority>:
ffffffffc02073da:	1141                	addi	sp,sp,-16
ffffffffc02073dc:	e022                	sd	s0,0(sp)
ffffffffc02073de:	85aa                	mv	a1,a0
ffffffffc02073e0:	842a                	mv	s0,a0
ffffffffc02073e2:	00007517          	auipc	a0,0x7
ffffffffc02073e6:	a7e50513          	addi	a0,a0,-1410 # ffffffffc020de60 <CSWTCH.79+0x6d8>
ffffffffc02073ea:	e406                	sd	ra,8(sp)
ffffffffc02073ec:	dbbf80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02073f0:	0008f797          	auipc	a5,0x8f
ffffffffc02073f4:	4d07b783          	ld	a5,1232(a5) # ffffffffc02968c0 <current>
ffffffffc02073f8:	e801                	bnez	s0,ffffffffc0207408 <lab6_set_priority+0x2e>
ffffffffc02073fa:	60a2                	ld	ra,8(sp)
ffffffffc02073fc:	6402                	ld	s0,0(sp)
ffffffffc02073fe:	4705                	li	a4,1
ffffffffc0207400:	14e7a223          	sw	a4,324(a5)
ffffffffc0207404:	0141                	addi	sp,sp,16
ffffffffc0207406:	8082                	ret
ffffffffc0207408:	60a2                	ld	ra,8(sp)
ffffffffc020740a:	1487a223          	sw	s0,324(a5)
ffffffffc020740e:	6402                	ld	s0,0(sp)
ffffffffc0207410:	0141                	addi	sp,sp,16
ffffffffc0207412:	8082                	ret

ffffffffc0207414 <do_sleep>:
ffffffffc0207414:	c539                	beqz	a0,ffffffffc0207462 <do_sleep+0x4e>
ffffffffc0207416:	7179                	addi	sp,sp,-48
ffffffffc0207418:	f022                	sd	s0,32(sp)
ffffffffc020741a:	f406                	sd	ra,40(sp)
ffffffffc020741c:	842a                	mv	s0,a0
ffffffffc020741e:	100027f3          	csrr	a5,sstatus
ffffffffc0207422:	8b89                	andi	a5,a5,2
ffffffffc0207424:	e3a9                	bnez	a5,ffffffffc0207466 <do_sleep+0x52>
ffffffffc0207426:	0008f797          	auipc	a5,0x8f
ffffffffc020742a:	49a7b783          	ld	a5,1178(a5) # ffffffffc02968c0 <current>
ffffffffc020742e:	0818                	addi	a4,sp,16
ffffffffc0207430:	c02a                	sw	a0,0(sp)
ffffffffc0207432:	ec3a                	sd	a4,24(sp)
ffffffffc0207434:	e83a                	sd	a4,16(sp)
ffffffffc0207436:	e43e                	sd	a5,8(sp)
ffffffffc0207438:	4705                	li	a4,1
ffffffffc020743a:	c398                	sw	a4,0(a5)
ffffffffc020743c:	80000737          	lui	a4,0x80000
ffffffffc0207440:	840a                	mv	s0,sp
ffffffffc0207442:	0709                	addi	a4,a4,2
ffffffffc0207444:	0ee7a623          	sw	a4,236(a5)
ffffffffc0207448:	8522                	mv	a0,s0
ffffffffc020744a:	364000ef          	jal	ra,ffffffffc02077ae <add_timer>
ffffffffc020744e:	2a0000ef          	jal	ra,ffffffffc02076ee <schedule>
ffffffffc0207452:	8522                	mv	a0,s0
ffffffffc0207454:	422000ef          	jal	ra,ffffffffc0207876 <del_timer>
ffffffffc0207458:	70a2                	ld	ra,40(sp)
ffffffffc020745a:	7402                	ld	s0,32(sp)
ffffffffc020745c:	4501                	li	a0,0
ffffffffc020745e:	6145                	addi	sp,sp,48
ffffffffc0207460:	8082                	ret
ffffffffc0207462:	4501                	li	a0,0
ffffffffc0207464:	8082                	ret
ffffffffc0207466:	80df90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020746a:	0008f797          	auipc	a5,0x8f
ffffffffc020746e:	4567b783          	ld	a5,1110(a5) # ffffffffc02968c0 <current>
ffffffffc0207472:	0818                	addi	a4,sp,16
ffffffffc0207474:	c022                	sw	s0,0(sp)
ffffffffc0207476:	e43e                	sd	a5,8(sp)
ffffffffc0207478:	ec3a                	sd	a4,24(sp)
ffffffffc020747a:	e83a                	sd	a4,16(sp)
ffffffffc020747c:	4705                	li	a4,1
ffffffffc020747e:	c398                	sw	a4,0(a5)
ffffffffc0207480:	80000737          	lui	a4,0x80000
ffffffffc0207484:	0709                	addi	a4,a4,2
ffffffffc0207486:	840a                	mv	s0,sp
ffffffffc0207488:	8522                	mv	a0,s0
ffffffffc020748a:	0ee7a623          	sw	a4,236(a5)
ffffffffc020748e:	320000ef          	jal	ra,ffffffffc02077ae <add_timer>
ffffffffc0207492:	fdaf90ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0207496:	bf65                	j	ffffffffc020744e <do_sleep+0x3a>

ffffffffc0207498 <switch_to>:
ffffffffc0207498:	00153023          	sd	ra,0(a0)
ffffffffc020749c:	00253423          	sd	sp,8(a0)
ffffffffc02074a0:	e900                	sd	s0,16(a0)
ffffffffc02074a2:	ed04                	sd	s1,24(a0)
ffffffffc02074a4:	03253023          	sd	s2,32(a0)
ffffffffc02074a8:	03353423          	sd	s3,40(a0)
ffffffffc02074ac:	03453823          	sd	s4,48(a0)
ffffffffc02074b0:	03553c23          	sd	s5,56(a0)
ffffffffc02074b4:	05653023          	sd	s6,64(a0)
ffffffffc02074b8:	05753423          	sd	s7,72(a0)
ffffffffc02074bc:	05853823          	sd	s8,80(a0)
ffffffffc02074c0:	05953c23          	sd	s9,88(a0)
ffffffffc02074c4:	07a53023          	sd	s10,96(a0)
ffffffffc02074c8:	07b53423          	sd	s11,104(a0)
ffffffffc02074cc:	0005b083          	ld	ra,0(a1)
ffffffffc02074d0:	0085b103          	ld	sp,8(a1)
ffffffffc02074d4:	6980                	ld	s0,16(a1)
ffffffffc02074d6:	6d84                	ld	s1,24(a1)
ffffffffc02074d8:	0205b903          	ld	s2,32(a1)
ffffffffc02074dc:	0285b983          	ld	s3,40(a1)
ffffffffc02074e0:	0305ba03          	ld	s4,48(a1)
ffffffffc02074e4:	0385ba83          	ld	s5,56(a1)
ffffffffc02074e8:	0405bb03          	ld	s6,64(a1)
ffffffffc02074ec:	0485bb83          	ld	s7,72(a1)
ffffffffc02074f0:	0505bc03          	ld	s8,80(a1)
ffffffffc02074f4:	0585bc83          	ld	s9,88(a1)
ffffffffc02074f8:	0605bd03          	ld	s10,96(a1)
ffffffffc02074fc:	0685bd83          	ld	s11,104(a1)
ffffffffc0207500:	8082                	ret

ffffffffc0207502 <RR_init>:
ffffffffc0207502:	e508                	sd	a0,8(a0)
ffffffffc0207504:	e108                	sd	a0,0(a0)
ffffffffc0207506:	00052823          	sw	zero,16(a0)
ffffffffc020750a:	8082                	ret

ffffffffc020750c <RR_pick_next>:
ffffffffc020750c:	651c                	ld	a5,8(a0)
ffffffffc020750e:	00f50563          	beq	a0,a5,ffffffffc0207518 <RR_pick_next+0xc>
ffffffffc0207512:	ef078513          	addi	a0,a5,-272
ffffffffc0207516:	8082                	ret
ffffffffc0207518:	4501                	li	a0,0
ffffffffc020751a:	8082                	ret

ffffffffc020751c <RR_proc_tick>:
ffffffffc020751c:	1205a783          	lw	a5,288(a1)
ffffffffc0207520:	00f05563          	blez	a5,ffffffffc020752a <RR_proc_tick+0xe>
ffffffffc0207524:	37fd                	addiw	a5,a5,-1
ffffffffc0207526:	12f5a023          	sw	a5,288(a1)
ffffffffc020752a:	e399                	bnez	a5,ffffffffc0207530 <RR_proc_tick+0x14>
ffffffffc020752c:	4785                	li	a5,1
ffffffffc020752e:	ed9c                	sd	a5,24(a1)
ffffffffc0207530:	8082                	ret

ffffffffc0207532 <RR_dequeue>:
ffffffffc0207532:	1185b703          	ld	a4,280(a1)
ffffffffc0207536:	11058793          	addi	a5,a1,272
ffffffffc020753a:	02e78363          	beq	a5,a4,ffffffffc0207560 <RR_dequeue+0x2e>
ffffffffc020753e:	1085b683          	ld	a3,264(a1)
ffffffffc0207542:	00a69f63          	bne	a3,a0,ffffffffc0207560 <RR_dequeue+0x2e>
ffffffffc0207546:	1105b503          	ld	a0,272(a1)
ffffffffc020754a:	4a90                	lw	a2,16(a3)
ffffffffc020754c:	e518                	sd	a4,8(a0)
ffffffffc020754e:	e308                	sd	a0,0(a4)
ffffffffc0207550:	10f5bc23          	sd	a5,280(a1)
ffffffffc0207554:	10f5b823          	sd	a5,272(a1)
ffffffffc0207558:	fff6079b          	addiw	a5,a2,-1
ffffffffc020755c:	ca9c                	sw	a5,16(a3)
ffffffffc020755e:	8082                	ret
ffffffffc0207560:	1141                	addi	sp,sp,-16
ffffffffc0207562:	00007697          	auipc	a3,0x7
ffffffffc0207566:	91668693          	addi	a3,a3,-1770 # ffffffffc020de78 <CSWTCH.79+0x6f0>
ffffffffc020756a:	00004617          	auipc	a2,0x4
ffffffffc020756e:	7d660613          	addi	a2,a2,2006 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207572:	03c00593          	li	a1,60
ffffffffc0207576:	00007517          	auipc	a0,0x7
ffffffffc020757a:	93a50513          	addi	a0,a0,-1734 # ffffffffc020deb0 <CSWTCH.79+0x728>
ffffffffc020757e:	e406                	sd	ra,8(sp)
ffffffffc0207580:	f1ff80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207584 <RR_enqueue>:
ffffffffc0207584:	1185b703          	ld	a4,280(a1)
ffffffffc0207588:	11058793          	addi	a5,a1,272
ffffffffc020758c:	02e79d63          	bne	a5,a4,ffffffffc02075c6 <RR_enqueue+0x42>
ffffffffc0207590:	6118                	ld	a4,0(a0)
ffffffffc0207592:	1205a683          	lw	a3,288(a1)
ffffffffc0207596:	e11c                	sd	a5,0(a0)
ffffffffc0207598:	e71c                	sd	a5,8(a4)
ffffffffc020759a:	10a5bc23          	sd	a0,280(a1)
ffffffffc020759e:	10e5b823          	sd	a4,272(a1)
ffffffffc02075a2:	495c                	lw	a5,20(a0)
ffffffffc02075a4:	ea89                	bnez	a3,ffffffffc02075b6 <RR_enqueue+0x32>
ffffffffc02075a6:	12f5a023          	sw	a5,288(a1)
ffffffffc02075aa:	491c                	lw	a5,16(a0)
ffffffffc02075ac:	10a5b423          	sd	a0,264(a1)
ffffffffc02075b0:	2785                	addiw	a5,a5,1
ffffffffc02075b2:	c91c                	sw	a5,16(a0)
ffffffffc02075b4:	8082                	ret
ffffffffc02075b6:	fed7c8e3          	blt	a5,a3,ffffffffc02075a6 <RR_enqueue+0x22>
ffffffffc02075ba:	491c                	lw	a5,16(a0)
ffffffffc02075bc:	10a5b423          	sd	a0,264(a1)
ffffffffc02075c0:	2785                	addiw	a5,a5,1
ffffffffc02075c2:	c91c                	sw	a5,16(a0)
ffffffffc02075c4:	8082                	ret
ffffffffc02075c6:	1141                	addi	sp,sp,-16
ffffffffc02075c8:	00007697          	auipc	a3,0x7
ffffffffc02075cc:	90868693          	addi	a3,a3,-1784 # ffffffffc020ded0 <CSWTCH.79+0x748>
ffffffffc02075d0:	00004617          	auipc	a2,0x4
ffffffffc02075d4:	77060613          	addi	a2,a2,1904 # ffffffffc020bd40 <commands+0x210>
ffffffffc02075d8:	02800593          	li	a1,40
ffffffffc02075dc:	00007517          	auipc	a0,0x7
ffffffffc02075e0:	8d450513          	addi	a0,a0,-1836 # ffffffffc020deb0 <CSWTCH.79+0x728>
ffffffffc02075e4:	e406                	sd	ra,8(sp)
ffffffffc02075e6:	eb9f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02075ea <sched_init>:
ffffffffc02075ea:	1141                	addi	sp,sp,-16
ffffffffc02075ec:	0008a717          	auipc	a4,0x8a
ffffffffc02075f0:	a3470713          	addi	a4,a4,-1484 # ffffffffc0291020 <default_sched_class>
ffffffffc02075f4:	e022                	sd	s0,0(sp)
ffffffffc02075f6:	e406                	sd	ra,8(sp)
ffffffffc02075f8:	0008e797          	auipc	a5,0x8e
ffffffffc02075fc:	1f878793          	addi	a5,a5,504 # ffffffffc02957f0 <timer_list>
ffffffffc0207600:	6714                	ld	a3,8(a4)
ffffffffc0207602:	0008e517          	auipc	a0,0x8e
ffffffffc0207606:	1ce50513          	addi	a0,a0,462 # ffffffffc02957d0 <__rq>
ffffffffc020760a:	e79c                	sd	a5,8(a5)
ffffffffc020760c:	e39c                	sd	a5,0(a5)
ffffffffc020760e:	4795                	li	a5,5
ffffffffc0207610:	c95c                	sw	a5,20(a0)
ffffffffc0207612:	0008f417          	auipc	s0,0x8f
ffffffffc0207616:	2d640413          	addi	s0,s0,726 # ffffffffc02968e8 <sched_class>
ffffffffc020761a:	0008f797          	auipc	a5,0x8f
ffffffffc020761e:	2ca7b323          	sd	a0,710(a5) # ffffffffc02968e0 <rq>
ffffffffc0207622:	e018                	sd	a4,0(s0)
ffffffffc0207624:	9682                	jalr	a3
ffffffffc0207626:	601c                	ld	a5,0(s0)
ffffffffc0207628:	6402                	ld	s0,0(sp)
ffffffffc020762a:	60a2                	ld	ra,8(sp)
ffffffffc020762c:	638c                	ld	a1,0(a5)
ffffffffc020762e:	00007517          	auipc	a0,0x7
ffffffffc0207632:	8d250513          	addi	a0,a0,-1838 # ffffffffc020df00 <CSWTCH.79+0x778>
ffffffffc0207636:	0141                	addi	sp,sp,16
ffffffffc0207638:	b6ff806f          	j	ffffffffc02001a6 <cprintf>

ffffffffc020763c <wakeup_proc>:
ffffffffc020763c:	4118                	lw	a4,0(a0)
ffffffffc020763e:	1101                	addi	sp,sp,-32
ffffffffc0207640:	ec06                	sd	ra,24(sp)
ffffffffc0207642:	e822                	sd	s0,16(sp)
ffffffffc0207644:	e426                	sd	s1,8(sp)
ffffffffc0207646:	478d                	li	a5,3
ffffffffc0207648:	08f70363          	beq	a4,a5,ffffffffc02076ce <wakeup_proc+0x92>
ffffffffc020764c:	842a                	mv	s0,a0
ffffffffc020764e:	100027f3          	csrr	a5,sstatus
ffffffffc0207652:	8b89                	andi	a5,a5,2
ffffffffc0207654:	4481                	li	s1,0
ffffffffc0207656:	e7bd                	bnez	a5,ffffffffc02076c4 <wakeup_proc+0x88>
ffffffffc0207658:	4789                	li	a5,2
ffffffffc020765a:	04f70863          	beq	a4,a5,ffffffffc02076aa <wakeup_proc+0x6e>
ffffffffc020765e:	c01c                	sw	a5,0(s0)
ffffffffc0207660:	0e042623          	sw	zero,236(s0)
ffffffffc0207664:	0008f797          	auipc	a5,0x8f
ffffffffc0207668:	25c7b783          	ld	a5,604(a5) # ffffffffc02968c0 <current>
ffffffffc020766c:	02878363          	beq	a5,s0,ffffffffc0207692 <wakeup_proc+0x56>
ffffffffc0207670:	0008f797          	auipc	a5,0x8f
ffffffffc0207674:	2587b783          	ld	a5,600(a5) # ffffffffc02968c8 <idleproc>
ffffffffc0207678:	00f40d63          	beq	s0,a5,ffffffffc0207692 <wakeup_proc+0x56>
ffffffffc020767c:	0008f797          	auipc	a5,0x8f
ffffffffc0207680:	26c7b783          	ld	a5,620(a5) # ffffffffc02968e8 <sched_class>
ffffffffc0207684:	6b9c                	ld	a5,16(a5)
ffffffffc0207686:	85a2                	mv	a1,s0
ffffffffc0207688:	0008f517          	auipc	a0,0x8f
ffffffffc020768c:	25853503          	ld	a0,600(a0) # ffffffffc02968e0 <rq>
ffffffffc0207690:	9782                	jalr	a5
ffffffffc0207692:	e491                	bnez	s1,ffffffffc020769e <wakeup_proc+0x62>
ffffffffc0207694:	60e2                	ld	ra,24(sp)
ffffffffc0207696:	6442                	ld	s0,16(sp)
ffffffffc0207698:	64a2                	ld	s1,8(sp)
ffffffffc020769a:	6105                	addi	sp,sp,32
ffffffffc020769c:	8082                	ret
ffffffffc020769e:	6442                	ld	s0,16(sp)
ffffffffc02076a0:	60e2                	ld	ra,24(sp)
ffffffffc02076a2:	64a2                	ld	s1,8(sp)
ffffffffc02076a4:	6105                	addi	sp,sp,32
ffffffffc02076a6:	dc6f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc02076aa:	00007617          	auipc	a2,0x7
ffffffffc02076ae:	8a660613          	addi	a2,a2,-1882 # ffffffffc020df50 <CSWTCH.79+0x7c8>
ffffffffc02076b2:	05200593          	li	a1,82
ffffffffc02076b6:	00007517          	auipc	a0,0x7
ffffffffc02076ba:	88250513          	addi	a0,a0,-1918 # ffffffffc020df38 <CSWTCH.79+0x7b0>
ffffffffc02076be:	e49f80ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc02076c2:	bfc1                	j	ffffffffc0207692 <wakeup_proc+0x56>
ffffffffc02076c4:	daef90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02076c8:	4018                	lw	a4,0(s0)
ffffffffc02076ca:	4485                	li	s1,1
ffffffffc02076cc:	b771                	j	ffffffffc0207658 <wakeup_proc+0x1c>
ffffffffc02076ce:	00007697          	auipc	a3,0x7
ffffffffc02076d2:	84a68693          	addi	a3,a3,-1974 # ffffffffc020df18 <CSWTCH.79+0x790>
ffffffffc02076d6:	00004617          	auipc	a2,0x4
ffffffffc02076da:	66a60613          	addi	a2,a2,1642 # ffffffffc020bd40 <commands+0x210>
ffffffffc02076de:	04300593          	li	a1,67
ffffffffc02076e2:	00007517          	auipc	a0,0x7
ffffffffc02076e6:	85650513          	addi	a0,a0,-1962 # ffffffffc020df38 <CSWTCH.79+0x7b0>
ffffffffc02076ea:	db5f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02076ee <schedule>:
ffffffffc02076ee:	7179                	addi	sp,sp,-48
ffffffffc02076f0:	f406                	sd	ra,40(sp)
ffffffffc02076f2:	f022                	sd	s0,32(sp)
ffffffffc02076f4:	ec26                	sd	s1,24(sp)
ffffffffc02076f6:	e84a                	sd	s2,16(sp)
ffffffffc02076f8:	e44e                	sd	s3,8(sp)
ffffffffc02076fa:	e052                	sd	s4,0(sp)
ffffffffc02076fc:	100027f3          	csrr	a5,sstatus
ffffffffc0207700:	8b89                	andi	a5,a5,2
ffffffffc0207702:	4a01                	li	s4,0
ffffffffc0207704:	e3cd                	bnez	a5,ffffffffc02077a6 <schedule+0xb8>
ffffffffc0207706:	0008f497          	auipc	s1,0x8f
ffffffffc020770a:	1ba48493          	addi	s1,s1,442 # ffffffffc02968c0 <current>
ffffffffc020770e:	608c                	ld	a1,0(s1)
ffffffffc0207710:	0008f997          	auipc	s3,0x8f
ffffffffc0207714:	1d898993          	addi	s3,s3,472 # ffffffffc02968e8 <sched_class>
ffffffffc0207718:	0008f917          	auipc	s2,0x8f
ffffffffc020771c:	1c890913          	addi	s2,s2,456 # ffffffffc02968e0 <rq>
ffffffffc0207720:	4194                	lw	a3,0(a1)
ffffffffc0207722:	0005bc23          	sd	zero,24(a1)
ffffffffc0207726:	4709                	li	a4,2
ffffffffc0207728:	0009b783          	ld	a5,0(s3)
ffffffffc020772c:	00093503          	ld	a0,0(s2)
ffffffffc0207730:	04e68e63          	beq	a3,a4,ffffffffc020778c <schedule+0x9e>
ffffffffc0207734:	739c                	ld	a5,32(a5)
ffffffffc0207736:	9782                	jalr	a5
ffffffffc0207738:	842a                	mv	s0,a0
ffffffffc020773a:	c521                	beqz	a0,ffffffffc0207782 <schedule+0x94>
ffffffffc020773c:	0009b783          	ld	a5,0(s3)
ffffffffc0207740:	00093503          	ld	a0,0(s2)
ffffffffc0207744:	85a2                	mv	a1,s0
ffffffffc0207746:	6f9c                	ld	a5,24(a5)
ffffffffc0207748:	9782                	jalr	a5
ffffffffc020774a:	441c                	lw	a5,8(s0)
ffffffffc020774c:	6098                	ld	a4,0(s1)
ffffffffc020774e:	2785                	addiw	a5,a5,1
ffffffffc0207750:	c41c                	sw	a5,8(s0)
ffffffffc0207752:	00870563          	beq	a4,s0,ffffffffc020775c <schedule+0x6e>
ffffffffc0207756:	8522                	mv	a0,s0
ffffffffc0207758:	e56fe0ef          	jal	ra,ffffffffc0205dae <proc_run>
ffffffffc020775c:	000a1a63          	bnez	s4,ffffffffc0207770 <schedule+0x82>
ffffffffc0207760:	70a2                	ld	ra,40(sp)
ffffffffc0207762:	7402                	ld	s0,32(sp)
ffffffffc0207764:	64e2                	ld	s1,24(sp)
ffffffffc0207766:	6942                	ld	s2,16(sp)
ffffffffc0207768:	69a2                	ld	s3,8(sp)
ffffffffc020776a:	6a02                	ld	s4,0(sp)
ffffffffc020776c:	6145                	addi	sp,sp,48
ffffffffc020776e:	8082                	ret
ffffffffc0207770:	7402                	ld	s0,32(sp)
ffffffffc0207772:	70a2                	ld	ra,40(sp)
ffffffffc0207774:	64e2                	ld	s1,24(sp)
ffffffffc0207776:	6942                	ld	s2,16(sp)
ffffffffc0207778:	69a2                	ld	s3,8(sp)
ffffffffc020777a:	6a02                	ld	s4,0(sp)
ffffffffc020777c:	6145                	addi	sp,sp,48
ffffffffc020777e:	ceef906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207782:	0008f417          	auipc	s0,0x8f
ffffffffc0207786:	14643403          	ld	s0,326(s0) # ffffffffc02968c8 <idleproc>
ffffffffc020778a:	b7c1                	j	ffffffffc020774a <schedule+0x5c>
ffffffffc020778c:	0008f717          	auipc	a4,0x8f
ffffffffc0207790:	13c73703          	ld	a4,316(a4) # ffffffffc02968c8 <idleproc>
ffffffffc0207794:	fae580e3          	beq	a1,a4,ffffffffc0207734 <schedule+0x46>
ffffffffc0207798:	6b9c                	ld	a5,16(a5)
ffffffffc020779a:	9782                	jalr	a5
ffffffffc020779c:	0009b783          	ld	a5,0(s3)
ffffffffc02077a0:	00093503          	ld	a0,0(s2)
ffffffffc02077a4:	bf41                	j	ffffffffc0207734 <schedule+0x46>
ffffffffc02077a6:	cccf90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02077aa:	4a05                	li	s4,1
ffffffffc02077ac:	bfa9                	j	ffffffffc0207706 <schedule+0x18>

ffffffffc02077ae <add_timer>:
ffffffffc02077ae:	1141                	addi	sp,sp,-16
ffffffffc02077b0:	e022                	sd	s0,0(sp)
ffffffffc02077b2:	e406                	sd	ra,8(sp)
ffffffffc02077b4:	842a                	mv	s0,a0
ffffffffc02077b6:	100027f3          	csrr	a5,sstatus
ffffffffc02077ba:	8b89                	andi	a5,a5,2
ffffffffc02077bc:	4501                	li	a0,0
ffffffffc02077be:	eba5                	bnez	a5,ffffffffc020782e <add_timer+0x80>
ffffffffc02077c0:	401c                	lw	a5,0(s0)
ffffffffc02077c2:	cbb5                	beqz	a5,ffffffffc0207836 <add_timer+0x88>
ffffffffc02077c4:	6418                	ld	a4,8(s0)
ffffffffc02077c6:	cb25                	beqz	a4,ffffffffc0207836 <add_timer+0x88>
ffffffffc02077c8:	6c18                	ld	a4,24(s0)
ffffffffc02077ca:	01040593          	addi	a1,s0,16
ffffffffc02077ce:	08e59463          	bne	a1,a4,ffffffffc0207856 <add_timer+0xa8>
ffffffffc02077d2:	0008e617          	auipc	a2,0x8e
ffffffffc02077d6:	01e60613          	addi	a2,a2,30 # ffffffffc02957f0 <timer_list>
ffffffffc02077da:	6618                	ld	a4,8(a2)
ffffffffc02077dc:	00c71863          	bne	a4,a2,ffffffffc02077ec <add_timer+0x3e>
ffffffffc02077e0:	a80d                	j	ffffffffc0207812 <add_timer+0x64>
ffffffffc02077e2:	6718                	ld	a4,8(a4)
ffffffffc02077e4:	9f95                	subw	a5,a5,a3
ffffffffc02077e6:	c01c                	sw	a5,0(s0)
ffffffffc02077e8:	02c70563          	beq	a4,a2,ffffffffc0207812 <add_timer+0x64>
ffffffffc02077ec:	ff072683          	lw	a3,-16(a4)
ffffffffc02077f0:	fed7f9e3          	bgeu	a5,a3,ffffffffc02077e2 <add_timer+0x34>
ffffffffc02077f4:	40f687bb          	subw	a5,a3,a5
ffffffffc02077f8:	fef72823          	sw	a5,-16(a4)
ffffffffc02077fc:	631c                	ld	a5,0(a4)
ffffffffc02077fe:	e30c                	sd	a1,0(a4)
ffffffffc0207800:	e78c                	sd	a1,8(a5)
ffffffffc0207802:	ec18                	sd	a4,24(s0)
ffffffffc0207804:	e81c                	sd	a5,16(s0)
ffffffffc0207806:	c105                	beqz	a0,ffffffffc0207826 <add_timer+0x78>
ffffffffc0207808:	6402                	ld	s0,0(sp)
ffffffffc020780a:	60a2                	ld	ra,8(sp)
ffffffffc020780c:	0141                	addi	sp,sp,16
ffffffffc020780e:	c5ef906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207812:	0008e717          	auipc	a4,0x8e
ffffffffc0207816:	fde70713          	addi	a4,a4,-34 # ffffffffc02957f0 <timer_list>
ffffffffc020781a:	631c                	ld	a5,0(a4)
ffffffffc020781c:	e30c                	sd	a1,0(a4)
ffffffffc020781e:	e78c                	sd	a1,8(a5)
ffffffffc0207820:	ec18                	sd	a4,24(s0)
ffffffffc0207822:	e81c                	sd	a5,16(s0)
ffffffffc0207824:	f175                	bnez	a0,ffffffffc0207808 <add_timer+0x5a>
ffffffffc0207826:	60a2                	ld	ra,8(sp)
ffffffffc0207828:	6402                	ld	s0,0(sp)
ffffffffc020782a:	0141                	addi	sp,sp,16
ffffffffc020782c:	8082                	ret
ffffffffc020782e:	c44f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207832:	4505                	li	a0,1
ffffffffc0207834:	b771                	j	ffffffffc02077c0 <add_timer+0x12>
ffffffffc0207836:	00006697          	auipc	a3,0x6
ffffffffc020783a:	73a68693          	addi	a3,a3,1850 # ffffffffc020df70 <CSWTCH.79+0x7e8>
ffffffffc020783e:	00004617          	auipc	a2,0x4
ffffffffc0207842:	50260613          	addi	a2,a2,1282 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207846:	07a00593          	li	a1,122
ffffffffc020784a:	00006517          	auipc	a0,0x6
ffffffffc020784e:	6ee50513          	addi	a0,a0,1774 # ffffffffc020df38 <CSWTCH.79+0x7b0>
ffffffffc0207852:	c4df80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207856:	00006697          	auipc	a3,0x6
ffffffffc020785a:	74a68693          	addi	a3,a3,1866 # ffffffffc020dfa0 <CSWTCH.79+0x818>
ffffffffc020785e:	00004617          	auipc	a2,0x4
ffffffffc0207862:	4e260613          	addi	a2,a2,1250 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207866:	07b00593          	li	a1,123
ffffffffc020786a:	00006517          	auipc	a0,0x6
ffffffffc020786e:	6ce50513          	addi	a0,a0,1742 # ffffffffc020df38 <CSWTCH.79+0x7b0>
ffffffffc0207872:	c2df80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207876 <del_timer>:
ffffffffc0207876:	1101                	addi	sp,sp,-32
ffffffffc0207878:	e822                	sd	s0,16(sp)
ffffffffc020787a:	ec06                	sd	ra,24(sp)
ffffffffc020787c:	e426                	sd	s1,8(sp)
ffffffffc020787e:	842a                	mv	s0,a0
ffffffffc0207880:	100027f3          	csrr	a5,sstatus
ffffffffc0207884:	8b89                	andi	a5,a5,2
ffffffffc0207886:	01050493          	addi	s1,a0,16
ffffffffc020788a:	eb9d                	bnez	a5,ffffffffc02078c0 <del_timer+0x4a>
ffffffffc020788c:	6d1c                	ld	a5,24(a0)
ffffffffc020788e:	02978463          	beq	a5,s1,ffffffffc02078b6 <del_timer+0x40>
ffffffffc0207892:	4114                	lw	a3,0(a0)
ffffffffc0207894:	6918                	ld	a4,16(a0)
ffffffffc0207896:	ce81                	beqz	a3,ffffffffc02078ae <del_timer+0x38>
ffffffffc0207898:	0008e617          	auipc	a2,0x8e
ffffffffc020789c:	f5860613          	addi	a2,a2,-168 # ffffffffc02957f0 <timer_list>
ffffffffc02078a0:	00c78763          	beq	a5,a2,ffffffffc02078ae <del_timer+0x38>
ffffffffc02078a4:	ff07a603          	lw	a2,-16(a5)
ffffffffc02078a8:	9eb1                	addw	a3,a3,a2
ffffffffc02078aa:	fed7a823          	sw	a3,-16(a5)
ffffffffc02078ae:	e71c                	sd	a5,8(a4)
ffffffffc02078b0:	e398                	sd	a4,0(a5)
ffffffffc02078b2:	ec04                	sd	s1,24(s0)
ffffffffc02078b4:	e804                	sd	s1,16(s0)
ffffffffc02078b6:	60e2                	ld	ra,24(sp)
ffffffffc02078b8:	6442                	ld	s0,16(sp)
ffffffffc02078ba:	64a2                	ld	s1,8(sp)
ffffffffc02078bc:	6105                	addi	sp,sp,32
ffffffffc02078be:	8082                	ret
ffffffffc02078c0:	bb2f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02078c4:	6c1c                	ld	a5,24(s0)
ffffffffc02078c6:	02978463          	beq	a5,s1,ffffffffc02078ee <del_timer+0x78>
ffffffffc02078ca:	4014                	lw	a3,0(s0)
ffffffffc02078cc:	6818                	ld	a4,16(s0)
ffffffffc02078ce:	ce81                	beqz	a3,ffffffffc02078e6 <del_timer+0x70>
ffffffffc02078d0:	0008e617          	auipc	a2,0x8e
ffffffffc02078d4:	f2060613          	addi	a2,a2,-224 # ffffffffc02957f0 <timer_list>
ffffffffc02078d8:	00c78763          	beq	a5,a2,ffffffffc02078e6 <del_timer+0x70>
ffffffffc02078dc:	ff07a603          	lw	a2,-16(a5)
ffffffffc02078e0:	9eb1                	addw	a3,a3,a2
ffffffffc02078e2:	fed7a823          	sw	a3,-16(a5)
ffffffffc02078e6:	e71c                	sd	a5,8(a4)
ffffffffc02078e8:	e398                	sd	a4,0(a5)
ffffffffc02078ea:	ec04                	sd	s1,24(s0)
ffffffffc02078ec:	e804                	sd	s1,16(s0)
ffffffffc02078ee:	6442                	ld	s0,16(sp)
ffffffffc02078f0:	60e2                	ld	ra,24(sp)
ffffffffc02078f2:	64a2                	ld	s1,8(sp)
ffffffffc02078f4:	6105                	addi	sp,sp,32
ffffffffc02078f6:	b76f906f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc02078fa <run_timer_list>:
ffffffffc02078fa:	7139                	addi	sp,sp,-64
ffffffffc02078fc:	fc06                	sd	ra,56(sp)
ffffffffc02078fe:	f822                	sd	s0,48(sp)
ffffffffc0207900:	f426                	sd	s1,40(sp)
ffffffffc0207902:	f04a                	sd	s2,32(sp)
ffffffffc0207904:	ec4e                	sd	s3,24(sp)
ffffffffc0207906:	e852                	sd	s4,16(sp)
ffffffffc0207908:	e456                	sd	s5,8(sp)
ffffffffc020790a:	e05a                	sd	s6,0(sp)
ffffffffc020790c:	100027f3          	csrr	a5,sstatus
ffffffffc0207910:	8b89                	andi	a5,a5,2
ffffffffc0207912:	4b01                	li	s6,0
ffffffffc0207914:	efe9                	bnez	a5,ffffffffc02079ee <run_timer_list+0xf4>
ffffffffc0207916:	0008e997          	auipc	s3,0x8e
ffffffffc020791a:	eda98993          	addi	s3,s3,-294 # ffffffffc02957f0 <timer_list>
ffffffffc020791e:	0089b403          	ld	s0,8(s3)
ffffffffc0207922:	07340a63          	beq	s0,s3,ffffffffc0207996 <run_timer_list+0x9c>
ffffffffc0207926:	ff042783          	lw	a5,-16(s0)
ffffffffc020792a:	ff040913          	addi	s2,s0,-16
ffffffffc020792e:	0e078763          	beqz	a5,ffffffffc0207a1c <run_timer_list+0x122>
ffffffffc0207932:	fff7871b          	addiw	a4,a5,-1
ffffffffc0207936:	fee42823          	sw	a4,-16(s0)
ffffffffc020793a:	ef31                	bnez	a4,ffffffffc0207996 <run_timer_list+0x9c>
ffffffffc020793c:	00006a97          	auipc	s5,0x6
ffffffffc0207940:	6cca8a93          	addi	s5,s5,1740 # ffffffffc020e008 <CSWTCH.79+0x880>
ffffffffc0207944:	00006a17          	auipc	s4,0x6
ffffffffc0207948:	5f4a0a13          	addi	s4,s4,1524 # ffffffffc020df38 <CSWTCH.79+0x7b0>
ffffffffc020794c:	a005                	j	ffffffffc020796c <run_timer_list+0x72>
ffffffffc020794e:	0a07d763          	bgez	a5,ffffffffc02079fc <run_timer_list+0x102>
ffffffffc0207952:	8526                	mv	a0,s1
ffffffffc0207954:	ce9ff0ef          	jal	ra,ffffffffc020763c <wakeup_proc>
ffffffffc0207958:	854a                	mv	a0,s2
ffffffffc020795a:	f1dff0ef          	jal	ra,ffffffffc0207876 <del_timer>
ffffffffc020795e:	03340c63          	beq	s0,s3,ffffffffc0207996 <run_timer_list+0x9c>
ffffffffc0207962:	ff042783          	lw	a5,-16(s0)
ffffffffc0207966:	ff040913          	addi	s2,s0,-16
ffffffffc020796a:	e795                	bnez	a5,ffffffffc0207996 <run_timer_list+0x9c>
ffffffffc020796c:	00893483          	ld	s1,8(s2)
ffffffffc0207970:	6400                	ld	s0,8(s0)
ffffffffc0207972:	0ec4a783          	lw	a5,236(s1)
ffffffffc0207976:	ffe1                	bnez	a5,ffffffffc020794e <run_timer_list+0x54>
ffffffffc0207978:	40d4                	lw	a3,4(s1)
ffffffffc020797a:	8656                	mv	a2,s5
ffffffffc020797c:	0ba00593          	li	a1,186
ffffffffc0207980:	8552                	mv	a0,s4
ffffffffc0207982:	b85f80ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc0207986:	8526                	mv	a0,s1
ffffffffc0207988:	cb5ff0ef          	jal	ra,ffffffffc020763c <wakeup_proc>
ffffffffc020798c:	854a                	mv	a0,s2
ffffffffc020798e:	ee9ff0ef          	jal	ra,ffffffffc0207876 <del_timer>
ffffffffc0207992:	fd3418e3          	bne	s0,s3,ffffffffc0207962 <run_timer_list+0x68>
ffffffffc0207996:	0008f597          	auipc	a1,0x8f
ffffffffc020799a:	f2a5b583          	ld	a1,-214(a1) # ffffffffc02968c0 <current>
ffffffffc020799e:	c18d                	beqz	a1,ffffffffc02079c0 <run_timer_list+0xc6>
ffffffffc02079a0:	0008f797          	auipc	a5,0x8f
ffffffffc02079a4:	f287b783          	ld	a5,-216(a5) # ffffffffc02968c8 <idleproc>
ffffffffc02079a8:	04f58763          	beq	a1,a5,ffffffffc02079f6 <run_timer_list+0xfc>
ffffffffc02079ac:	0008f797          	auipc	a5,0x8f
ffffffffc02079b0:	f3c7b783          	ld	a5,-196(a5) # ffffffffc02968e8 <sched_class>
ffffffffc02079b4:	779c                	ld	a5,40(a5)
ffffffffc02079b6:	0008f517          	auipc	a0,0x8f
ffffffffc02079ba:	f2a53503          	ld	a0,-214(a0) # ffffffffc02968e0 <rq>
ffffffffc02079be:	9782                	jalr	a5
ffffffffc02079c0:	000b1c63          	bnez	s6,ffffffffc02079d8 <run_timer_list+0xde>
ffffffffc02079c4:	70e2                	ld	ra,56(sp)
ffffffffc02079c6:	7442                	ld	s0,48(sp)
ffffffffc02079c8:	74a2                	ld	s1,40(sp)
ffffffffc02079ca:	7902                	ld	s2,32(sp)
ffffffffc02079cc:	69e2                	ld	s3,24(sp)
ffffffffc02079ce:	6a42                	ld	s4,16(sp)
ffffffffc02079d0:	6aa2                	ld	s5,8(sp)
ffffffffc02079d2:	6b02                	ld	s6,0(sp)
ffffffffc02079d4:	6121                	addi	sp,sp,64
ffffffffc02079d6:	8082                	ret
ffffffffc02079d8:	7442                	ld	s0,48(sp)
ffffffffc02079da:	70e2                	ld	ra,56(sp)
ffffffffc02079dc:	74a2                	ld	s1,40(sp)
ffffffffc02079de:	7902                	ld	s2,32(sp)
ffffffffc02079e0:	69e2                	ld	s3,24(sp)
ffffffffc02079e2:	6a42                	ld	s4,16(sp)
ffffffffc02079e4:	6aa2                	ld	s5,8(sp)
ffffffffc02079e6:	6b02                	ld	s6,0(sp)
ffffffffc02079e8:	6121                	addi	sp,sp,64
ffffffffc02079ea:	a82f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc02079ee:	a84f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02079f2:	4b05                	li	s6,1
ffffffffc02079f4:	b70d                	j	ffffffffc0207916 <run_timer_list+0x1c>
ffffffffc02079f6:	4785                	li	a5,1
ffffffffc02079f8:	ed9c                	sd	a5,24(a1)
ffffffffc02079fa:	b7d9                	j	ffffffffc02079c0 <run_timer_list+0xc6>
ffffffffc02079fc:	00006697          	auipc	a3,0x6
ffffffffc0207a00:	5e468693          	addi	a3,a3,1508 # ffffffffc020dfe0 <CSWTCH.79+0x858>
ffffffffc0207a04:	00004617          	auipc	a2,0x4
ffffffffc0207a08:	33c60613          	addi	a2,a2,828 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207a0c:	0b600593          	li	a1,182
ffffffffc0207a10:	00006517          	auipc	a0,0x6
ffffffffc0207a14:	52850513          	addi	a0,a0,1320 # ffffffffc020df38 <CSWTCH.79+0x7b0>
ffffffffc0207a18:	a87f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207a1c:	00006697          	auipc	a3,0x6
ffffffffc0207a20:	5ac68693          	addi	a3,a3,1452 # ffffffffc020dfc8 <CSWTCH.79+0x840>
ffffffffc0207a24:	00004617          	auipc	a2,0x4
ffffffffc0207a28:	31c60613          	addi	a2,a2,796 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207a2c:	0ae00593          	li	a1,174
ffffffffc0207a30:	00006517          	auipc	a0,0x6
ffffffffc0207a34:	50850513          	addi	a0,a0,1288 # ffffffffc020df38 <CSWTCH.79+0x7b0>
ffffffffc0207a38:	a67f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207a3c <sys_getpid>:
ffffffffc0207a3c:	0008f797          	auipc	a5,0x8f
ffffffffc0207a40:	e847b783          	ld	a5,-380(a5) # ffffffffc02968c0 <current>
ffffffffc0207a44:	43c8                	lw	a0,4(a5)
ffffffffc0207a46:	8082                	ret

ffffffffc0207a48 <sys_pgdir>:
ffffffffc0207a48:	4501                	li	a0,0
ffffffffc0207a4a:	8082                	ret

ffffffffc0207a4c <sys_gettime>:
ffffffffc0207a4c:	0008f797          	auipc	a5,0x8f
ffffffffc0207a50:	e247b783          	ld	a5,-476(a5) # ffffffffc0296870 <ticks>
ffffffffc0207a54:	0027951b          	slliw	a0,a5,0x2
ffffffffc0207a58:	9d3d                	addw	a0,a0,a5
ffffffffc0207a5a:	0015151b          	slliw	a0,a0,0x1
ffffffffc0207a5e:	8082                	ret

ffffffffc0207a60 <sys_lab6_set_priority>:
ffffffffc0207a60:	4108                	lw	a0,0(a0)
ffffffffc0207a62:	1141                	addi	sp,sp,-16
ffffffffc0207a64:	e406                	sd	ra,8(sp)
ffffffffc0207a66:	975ff0ef          	jal	ra,ffffffffc02073da <lab6_set_priority>
ffffffffc0207a6a:	60a2                	ld	ra,8(sp)
ffffffffc0207a6c:	4501                	li	a0,0
ffffffffc0207a6e:	0141                	addi	sp,sp,16
ffffffffc0207a70:	8082                	ret

ffffffffc0207a72 <sys_dup>:
ffffffffc0207a72:	450c                	lw	a1,8(a0)
ffffffffc0207a74:	4108                	lw	a0,0(a0)
ffffffffc0207a76:	886fe06f          	j	ffffffffc0205afc <sysfile_dup>

ffffffffc0207a7a <sys_getdirentry>:
ffffffffc0207a7a:	650c                	ld	a1,8(a0)
ffffffffc0207a7c:	4108                	lw	a0,0(a0)
ffffffffc0207a7e:	f8ffd06f          	j	ffffffffc0205a0c <sysfile_getdirentry>

ffffffffc0207a82 <sys_getcwd>:
ffffffffc0207a82:	650c                	ld	a1,8(a0)
ffffffffc0207a84:	6108                	ld	a0,0(a0)
ffffffffc0207a86:	ee3fd06f          	j	ffffffffc0205968 <sysfile_getcwd>

ffffffffc0207a8a <sys_fsync>:
ffffffffc0207a8a:	4108                	lw	a0,0(a0)
ffffffffc0207a8c:	ed9fd06f          	j	ffffffffc0205964 <sysfile_fsync>

ffffffffc0207a90 <sys_fstat>:
ffffffffc0207a90:	650c                	ld	a1,8(a0)
ffffffffc0207a92:	4108                	lw	a0,0(a0)
ffffffffc0207a94:	e31fd06f          	j	ffffffffc02058c4 <sysfile_fstat>

ffffffffc0207a98 <sys_seek>:
ffffffffc0207a98:	4910                	lw	a2,16(a0)
ffffffffc0207a9a:	650c                	ld	a1,8(a0)
ffffffffc0207a9c:	4108                	lw	a0,0(a0)
ffffffffc0207a9e:	e23fd06f          	j	ffffffffc02058c0 <sysfile_seek>

ffffffffc0207aa2 <sys_write>:
ffffffffc0207aa2:	6910                	ld	a2,16(a0)
ffffffffc0207aa4:	650c                	ld	a1,8(a0)
ffffffffc0207aa6:	4108                	lw	a0,0(a0)
ffffffffc0207aa8:	cfffd06f          	j	ffffffffc02057a6 <sysfile_write>

ffffffffc0207aac <sys_read>:
ffffffffc0207aac:	6910                	ld	a2,16(a0)
ffffffffc0207aae:	650c                	ld	a1,8(a0)
ffffffffc0207ab0:	4108                	lw	a0,0(a0)
ffffffffc0207ab2:	be1fd06f          	j	ffffffffc0205692 <sysfile_read>

ffffffffc0207ab6 <sys_close>:
ffffffffc0207ab6:	4108                	lw	a0,0(a0)
ffffffffc0207ab8:	bd7fd06f          	j	ffffffffc020568e <sysfile_close>

ffffffffc0207abc <sys_open>:
ffffffffc0207abc:	450c                	lw	a1,8(a0)
ffffffffc0207abe:	6108                	ld	a0,0(a0)
ffffffffc0207ac0:	b9bfd06f          	j	ffffffffc020565a <sysfile_open>

ffffffffc0207ac4 <sys_putc>:
ffffffffc0207ac4:	4108                	lw	a0,0(a0)
ffffffffc0207ac6:	1141                	addi	sp,sp,-16
ffffffffc0207ac8:	e406                	sd	ra,8(sp)
ffffffffc0207aca:	f18f80ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0207ace:	60a2                	ld	ra,8(sp)
ffffffffc0207ad0:	4501                	li	a0,0
ffffffffc0207ad2:	0141                	addi	sp,sp,16
ffffffffc0207ad4:	8082                	ret

ffffffffc0207ad6 <sys_kill>:
ffffffffc0207ad6:	4108                	lw	a0,0(a0)
ffffffffc0207ad8:	e9cff06f          	j	ffffffffc0207174 <do_kill>

ffffffffc0207adc <sys_sleep>:
ffffffffc0207adc:	4108                	lw	a0,0(a0)
ffffffffc0207ade:	937ff06f          	j	ffffffffc0207414 <do_sleep>

ffffffffc0207ae2 <sys_yield>:
ffffffffc0207ae2:	e44ff06f          	j	ffffffffc0207126 <do_yield>

ffffffffc0207ae6 <sys_exec>:
ffffffffc0207ae6:	6910                	ld	a2,16(a0)
ffffffffc0207ae8:	450c                	lw	a1,8(a0)
ffffffffc0207aea:	6108                	ld	a0,0(a0)
ffffffffc0207aec:	c89fe06f          	j	ffffffffc0206774 <do_execve>

ffffffffc0207af0 <sys_wait>:
ffffffffc0207af0:	650c                	ld	a1,8(a0)
ffffffffc0207af2:	4108                	lw	a0,0(a0)
ffffffffc0207af4:	e42ff06f          	j	ffffffffc0207136 <do_wait>

ffffffffc0207af8 <sys_fork>:
ffffffffc0207af8:	0008f797          	auipc	a5,0x8f
ffffffffc0207afc:	dc87b783          	ld	a5,-568(a5) # ffffffffc02968c0 <current>
ffffffffc0207b00:	73d0                	ld	a2,160(a5)
ffffffffc0207b02:	4501                	li	a0,0
ffffffffc0207b04:	6a0c                	ld	a1,16(a2)
ffffffffc0207b06:	b10fe06f          	j	ffffffffc0205e16 <do_fork>

ffffffffc0207b0a <sys_exit>:
ffffffffc0207b0a:	4108                	lw	a0,0(a0)
ffffffffc0207b0c:	f7cfe06f          	j	ffffffffc0206288 <do_exit>

ffffffffc0207b10 <syscall>:
ffffffffc0207b10:	715d                	addi	sp,sp,-80
ffffffffc0207b12:	fc26                	sd	s1,56(sp)
ffffffffc0207b14:	0008f497          	auipc	s1,0x8f
ffffffffc0207b18:	dac48493          	addi	s1,s1,-596 # ffffffffc02968c0 <current>
ffffffffc0207b1c:	6098                	ld	a4,0(s1)
ffffffffc0207b1e:	e0a2                	sd	s0,64(sp)
ffffffffc0207b20:	f84a                	sd	s2,48(sp)
ffffffffc0207b22:	7340                	ld	s0,160(a4)
ffffffffc0207b24:	e486                	sd	ra,72(sp)
ffffffffc0207b26:	0ff00793          	li	a5,255
ffffffffc0207b2a:	05042903          	lw	s2,80(s0)
ffffffffc0207b2e:	0327ee63          	bltu	a5,s2,ffffffffc0207b6a <syscall+0x5a>
ffffffffc0207b32:	00391713          	slli	a4,s2,0x3
ffffffffc0207b36:	00006797          	auipc	a5,0x6
ffffffffc0207b3a:	53a78793          	addi	a5,a5,1338 # ffffffffc020e070 <syscalls>
ffffffffc0207b3e:	97ba                	add	a5,a5,a4
ffffffffc0207b40:	639c                	ld	a5,0(a5)
ffffffffc0207b42:	c785                	beqz	a5,ffffffffc0207b6a <syscall+0x5a>
ffffffffc0207b44:	6c28                	ld	a0,88(s0)
ffffffffc0207b46:	702c                	ld	a1,96(s0)
ffffffffc0207b48:	7430                	ld	a2,104(s0)
ffffffffc0207b4a:	7834                	ld	a3,112(s0)
ffffffffc0207b4c:	7c38                	ld	a4,120(s0)
ffffffffc0207b4e:	e42a                	sd	a0,8(sp)
ffffffffc0207b50:	e82e                	sd	a1,16(sp)
ffffffffc0207b52:	ec32                	sd	a2,24(sp)
ffffffffc0207b54:	f036                	sd	a3,32(sp)
ffffffffc0207b56:	f43a                	sd	a4,40(sp)
ffffffffc0207b58:	0028                	addi	a0,sp,8
ffffffffc0207b5a:	9782                	jalr	a5
ffffffffc0207b5c:	60a6                	ld	ra,72(sp)
ffffffffc0207b5e:	e828                	sd	a0,80(s0)
ffffffffc0207b60:	6406                	ld	s0,64(sp)
ffffffffc0207b62:	74e2                	ld	s1,56(sp)
ffffffffc0207b64:	7942                	ld	s2,48(sp)
ffffffffc0207b66:	6161                	addi	sp,sp,80
ffffffffc0207b68:	8082                	ret
ffffffffc0207b6a:	8522                	mv	a0,s0
ffffffffc0207b6c:	c1ef90ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc0207b70:	609c                	ld	a5,0(s1)
ffffffffc0207b72:	86ca                	mv	a3,s2
ffffffffc0207b74:	00006617          	auipc	a2,0x6
ffffffffc0207b78:	4b460613          	addi	a2,a2,1204 # ffffffffc020e028 <CSWTCH.79+0x8a0>
ffffffffc0207b7c:	43d8                	lw	a4,4(a5)
ffffffffc0207b7e:	0d800593          	li	a1,216
ffffffffc0207b82:	0b478793          	addi	a5,a5,180
ffffffffc0207b86:	00006517          	auipc	a0,0x6
ffffffffc0207b8a:	4d250513          	addi	a0,a0,1234 # ffffffffc020e058 <CSWTCH.79+0x8d0>
ffffffffc0207b8e:	911f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207b92 <__alloc_inode>:
ffffffffc0207b92:	1141                	addi	sp,sp,-16
ffffffffc0207b94:	e022                	sd	s0,0(sp)
ffffffffc0207b96:	842a                	mv	s0,a0
ffffffffc0207b98:	07800513          	li	a0,120
ffffffffc0207b9c:	e406                	sd	ra,8(sp)
ffffffffc0207b9e:	c80fa0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0207ba2:	c111                	beqz	a0,ffffffffc0207ba6 <__alloc_inode+0x14>
ffffffffc0207ba4:	cd20                	sw	s0,88(a0)
ffffffffc0207ba6:	60a2                	ld	ra,8(sp)
ffffffffc0207ba8:	6402                	ld	s0,0(sp)
ffffffffc0207baa:	0141                	addi	sp,sp,16
ffffffffc0207bac:	8082                	ret

ffffffffc0207bae <inode_init>:
ffffffffc0207bae:	4785                	li	a5,1
ffffffffc0207bb0:	06052023          	sw	zero,96(a0)
ffffffffc0207bb4:	f92c                	sd	a1,112(a0)
ffffffffc0207bb6:	f530                	sd	a2,104(a0)
ffffffffc0207bb8:	cd7c                	sw	a5,92(a0)
ffffffffc0207bba:	8082                	ret

ffffffffc0207bbc <inode_kill>:
ffffffffc0207bbc:	4d78                	lw	a4,92(a0)
ffffffffc0207bbe:	1141                	addi	sp,sp,-16
ffffffffc0207bc0:	e406                	sd	ra,8(sp)
ffffffffc0207bc2:	e719                	bnez	a4,ffffffffc0207bd0 <inode_kill+0x14>
ffffffffc0207bc4:	513c                	lw	a5,96(a0)
ffffffffc0207bc6:	e78d                	bnez	a5,ffffffffc0207bf0 <inode_kill+0x34>
ffffffffc0207bc8:	60a2                	ld	ra,8(sp)
ffffffffc0207bca:	0141                	addi	sp,sp,16
ffffffffc0207bcc:	d02fa06f          	j	ffffffffc02020ce <kfree>
ffffffffc0207bd0:	00007697          	auipc	a3,0x7
ffffffffc0207bd4:	ca068693          	addi	a3,a3,-864 # ffffffffc020e870 <syscalls+0x800>
ffffffffc0207bd8:	00004617          	auipc	a2,0x4
ffffffffc0207bdc:	16860613          	addi	a2,a2,360 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207be0:	02900593          	li	a1,41
ffffffffc0207be4:	00007517          	auipc	a0,0x7
ffffffffc0207be8:	cac50513          	addi	a0,a0,-852 # ffffffffc020e890 <syscalls+0x820>
ffffffffc0207bec:	8b3f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207bf0:	00007697          	auipc	a3,0x7
ffffffffc0207bf4:	cb868693          	addi	a3,a3,-840 # ffffffffc020e8a8 <syscalls+0x838>
ffffffffc0207bf8:	00004617          	auipc	a2,0x4
ffffffffc0207bfc:	14860613          	addi	a2,a2,328 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207c00:	02a00593          	li	a1,42
ffffffffc0207c04:	00007517          	auipc	a0,0x7
ffffffffc0207c08:	c8c50513          	addi	a0,a0,-884 # ffffffffc020e890 <syscalls+0x820>
ffffffffc0207c0c:	893f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207c10 <inode_ref_inc>:
ffffffffc0207c10:	4d7c                	lw	a5,92(a0)
ffffffffc0207c12:	2785                	addiw	a5,a5,1
ffffffffc0207c14:	cd7c                	sw	a5,92(a0)
ffffffffc0207c16:	0007851b          	sext.w	a0,a5
ffffffffc0207c1a:	8082                	ret

ffffffffc0207c1c <inode_open_inc>:
ffffffffc0207c1c:	513c                	lw	a5,96(a0)
ffffffffc0207c1e:	2785                	addiw	a5,a5,1
ffffffffc0207c20:	d13c                	sw	a5,96(a0)
ffffffffc0207c22:	0007851b          	sext.w	a0,a5
ffffffffc0207c26:	8082                	ret

ffffffffc0207c28 <inode_check>:
ffffffffc0207c28:	1141                	addi	sp,sp,-16
ffffffffc0207c2a:	e406                	sd	ra,8(sp)
ffffffffc0207c2c:	c90d                	beqz	a0,ffffffffc0207c5e <inode_check+0x36>
ffffffffc0207c2e:	793c                	ld	a5,112(a0)
ffffffffc0207c30:	c79d                	beqz	a5,ffffffffc0207c5e <inode_check+0x36>
ffffffffc0207c32:	6398                	ld	a4,0(a5)
ffffffffc0207c34:	4625d7b7          	lui	a5,0x4625d
ffffffffc0207c38:	0786                	slli	a5,a5,0x1
ffffffffc0207c3a:	47678793          	addi	a5,a5,1142 # 4625d476 <_binary_bin_sfs_img_size+0x461e8176>
ffffffffc0207c3e:	08f71063          	bne	a4,a5,ffffffffc0207cbe <inode_check+0x96>
ffffffffc0207c42:	4d78                	lw	a4,92(a0)
ffffffffc0207c44:	513c                	lw	a5,96(a0)
ffffffffc0207c46:	04f74c63          	blt	a4,a5,ffffffffc0207c9e <inode_check+0x76>
ffffffffc0207c4a:	0407ca63          	bltz	a5,ffffffffc0207c9e <inode_check+0x76>
ffffffffc0207c4e:	66c1                	lui	a3,0x10
ffffffffc0207c50:	02d75763          	bge	a4,a3,ffffffffc0207c7e <inode_check+0x56>
ffffffffc0207c54:	02d7d563          	bge	a5,a3,ffffffffc0207c7e <inode_check+0x56>
ffffffffc0207c58:	60a2                	ld	ra,8(sp)
ffffffffc0207c5a:	0141                	addi	sp,sp,16
ffffffffc0207c5c:	8082                	ret
ffffffffc0207c5e:	00007697          	auipc	a3,0x7
ffffffffc0207c62:	c6a68693          	addi	a3,a3,-918 # ffffffffc020e8c8 <syscalls+0x858>
ffffffffc0207c66:	00004617          	auipc	a2,0x4
ffffffffc0207c6a:	0da60613          	addi	a2,a2,218 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207c6e:	06e00593          	li	a1,110
ffffffffc0207c72:	00007517          	auipc	a0,0x7
ffffffffc0207c76:	c1e50513          	addi	a0,a0,-994 # ffffffffc020e890 <syscalls+0x820>
ffffffffc0207c7a:	825f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207c7e:	00007697          	auipc	a3,0x7
ffffffffc0207c82:	cca68693          	addi	a3,a3,-822 # ffffffffc020e948 <syscalls+0x8d8>
ffffffffc0207c86:	00004617          	auipc	a2,0x4
ffffffffc0207c8a:	0ba60613          	addi	a2,a2,186 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207c8e:	07200593          	li	a1,114
ffffffffc0207c92:	00007517          	auipc	a0,0x7
ffffffffc0207c96:	bfe50513          	addi	a0,a0,-1026 # ffffffffc020e890 <syscalls+0x820>
ffffffffc0207c9a:	805f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207c9e:	00007697          	auipc	a3,0x7
ffffffffc0207ca2:	c7a68693          	addi	a3,a3,-902 # ffffffffc020e918 <syscalls+0x8a8>
ffffffffc0207ca6:	00004617          	auipc	a2,0x4
ffffffffc0207caa:	09a60613          	addi	a2,a2,154 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207cae:	07100593          	li	a1,113
ffffffffc0207cb2:	00007517          	auipc	a0,0x7
ffffffffc0207cb6:	bde50513          	addi	a0,a0,-1058 # ffffffffc020e890 <syscalls+0x820>
ffffffffc0207cba:	fe4f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207cbe:	00007697          	auipc	a3,0x7
ffffffffc0207cc2:	c3268693          	addi	a3,a3,-974 # ffffffffc020e8f0 <syscalls+0x880>
ffffffffc0207cc6:	00004617          	auipc	a2,0x4
ffffffffc0207cca:	07a60613          	addi	a2,a2,122 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207cce:	06f00593          	li	a1,111
ffffffffc0207cd2:	00007517          	auipc	a0,0x7
ffffffffc0207cd6:	bbe50513          	addi	a0,a0,-1090 # ffffffffc020e890 <syscalls+0x820>
ffffffffc0207cda:	fc4f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207cde <inode_ref_dec>:
ffffffffc0207cde:	4d7c                	lw	a5,92(a0)
ffffffffc0207ce0:	1101                	addi	sp,sp,-32
ffffffffc0207ce2:	ec06                	sd	ra,24(sp)
ffffffffc0207ce4:	e822                	sd	s0,16(sp)
ffffffffc0207ce6:	e426                	sd	s1,8(sp)
ffffffffc0207ce8:	e04a                	sd	s2,0(sp)
ffffffffc0207cea:	06f05e63          	blez	a5,ffffffffc0207d66 <inode_ref_dec+0x88>
ffffffffc0207cee:	fff7849b          	addiw	s1,a5,-1
ffffffffc0207cf2:	cd64                	sw	s1,92(a0)
ffffffffc0207cf4:	842a                	mv	s0,a0
ffffffffc0207cf6:	e09d                	bnez	s1,ffffffffc0207d1c <inode_ref_dec+0x3e>
ffffffffc0207cf8:	793c                	ld	a5,112(a0)
ffffffffc0207cfa:	c7b1                	beqz	a5,ffffffffc0207d46 <inode_ref_dec+0x68>
ffffffffc0207cfc:	0487b903          	ld	s2,72(a5)
ffffffffc0207d00:	04090363          	beqz	s2,ffffffffc0207d46 <inode_ref_dec+0x68>
ffffffffc0207d04:	00007597          	auipc	a1,0x7
ffffffffc0207d08:	cf458593          	addi	a1,a1,-780 # ffffffffc020e9f8 <syscalls+0x988>
ffffffffc0207d0c:	f1dff0ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0207d10:	8522                	mv	a0,s0
ffffffffc0207d12:	9902                	jalr	s2
ffffffffc0207d14:	c501                	beqz	a0,ffffffffc0207d1c <inode_ref_dec+0x3e>
ffffffffc0207d16:	57c5                	li	a5,-15
ffffffffc0207d18:	00f51963          	bne	a0,a5,ffffffffc0207d2a <inode_ref_dec+0x4c>
ffffffffc0207d1c:	60e2                	ld	ra,24(sp)
ffffffffc0207d1e:	6442                	ld	s0,16(sp)
ffffffffc0207d20:	6902                	ld	s2,0(sp)
ffffffffc0207d22:	8526                	mv	a0,s1
ffffffffc0207d24:	64a2                	ld	s1,8(sp)
ffffffffc0207d26:	6105                	addi	sp,sp,32
ffffffffc0207d28:	8082                	ret
ffffffffc0207d2a:	85aa                	mv	a1,a0
ffffffffc0207d2c:	00007517          	auipc	a0,0x7
ffffffffc0207d30:	cd450513          	addi	a0,a0,-812 # ffffffffc020ea00 <syscalls+0x990>
ffffffffc0207d34:	c72f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207d38:	60e2                	ld	ra,24(sp)
ffffffffc0207d3a:	6442                	ld	s0,16(sp)
ffffffffc0207d3c:	6902                	ld	s2,0(sp)
ffffffffc0207d3e:	8526                	mv	a0,s1
ffffffffc0207d40:	64a2                	ld	s1,8(sp)
ffffffffc0207d42:	6105                	addi	sp,sp,32
ffffffffc0207d44:	8082                	ret
ffffffffc0207d46:	00007697          	auipc	a3,0x7
ffffffffc0207d4a:	c6268693          	addi	a3,a3,-926 # ffffffffc020e9a8 <syscalls+0x938>
ffffffffc0207d4e:	00004617          	auipc	a2,0x4
ffffffffc0207d52:	ff260613          	addi	a2,a2,-14 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207d56:	04400593          	li	a1,68
ffffffffc0207d5a:	00007517          	auipc	a0,0x7
ffffffffc0207d5e:	b3650513          	addi	a0,a0,-1226 # ffffffffc020e890 <syscalls+0x820>
ffffffffc0207d62:	f3cf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207d66:	00007697          	auipc	a3,0x7
ffffffffc0207d6a:	c2268693          	addi	a3,a3,-990 # ffffffffc020e988 <syscalls+0x918>
ffffffffc0207d6e:	00004617          	auipc	a2,0x4
ffffffffc0207d72:	fd260613          	addi	a2,a2,-46 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207d76:	03f00593          	li	a1,63
ffffffffc0207d7a:	00007517          	auipc	a0,0x7
ffffffffc0207d7e:	b1650513          	addi	a0,a0,-1258 # ffffffffc020e890 <syscalls+0x820>
ffffffffc0207d82:	f1cf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207d86 <inode_open_dec>:
ffffffffc0207d86:	513c                	lw	a5,96(a0)
ffffffffc0207d88:	1101                	addi	sp,sp,-32
ffffffffc0207d8a:	ec06                	sd	ra,24(sp)
ffffffffc0207d8c:	e822                	sd	s0,16(sp)
ffffffffc0207d8e:	e426                	sd	s1,8(sp)
ffffffffc0207d90:	e04a                	sd	s2,0(sp)
ffffffffc0207d92:	06f05b63          	blez	a5,ffffffffc0207e08 <inode_open_dec+0x82>
ffffffffc0207d96:	fff7849b          	addiw	s1,a5,-1
ffffffffc0207d9a:	d124                	sw	s1,96(a0)
ffffffffc0207d9c:	842a                	mv	s0,a0
ffffffffc0207d9e:	e085                	bnez	s1,ffffffffc0207dbe <inode_open_dec+0x38>
ffffffffc0207da0:	793c                	ld	a5,112(a0)
ffffffffc0207da2:	c3b9                	beqz	a5,ffffffffc0207de8 <inode_open_dec+0x62>
ffffffffc0207da4:	0107b903          	ld	s2,16(a5)
ffffffffc0207da8:	04090063          	beqz	s2,ffffffffc0207de8 <inode_open_dec+0x62>
ffffffffc0207dac:	00007597          	auipc	a1,0x7
ffffffffc0207db0:	ce458593          	addi	a1,a1,-796 # ffffffffc020ea90 <syscalls+0xa20>
ffffffffc0207db4:	e75ff0ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0207db8:	8522                	mv	a0,s0
ffffffffc0207dba:	9902                	jalr	s2
ffffffffc0207dbc:	e901                	bnez	a0,ffffffffc0207dcc <inode_open_dec+0x46>
ffffffffc0207dbe:	60e2                	ld	ra,24(sp)
ffffffffc0207dc0:	6442                	ld	s0,16(sp)
ffffffffc0207dc2:	6902                	ld	s2,0(sp)
ffffffffc0207dc4:	8526                	mv	a0,s1
ffffffffc0207dc6:	64a2                	ld	s1,8(sp)
ffffffffc0207dc8:	6105                	addi	sp,sp,32
ffffffffc0207dca:	8082                	ret
ffffffffc0207dcc:	85aa                	mv	a1,a0
ffffffffc0207dce:	00007517          	auipc	a0,0x7
ffffffffc0207dd2:	cca50513          	addi	a0,a0,-822 # ffffffffc020ea98 <syscalls+0xa28>
ffffffffc0207dd6:	bd0f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207dda:	60e2                	ld	ra,24(sp)
ffffffffc0207ddc:	6442                	ld	s0,16(sp)
ffffffffc0207dde:	6902                	ld	s2,0(sp)
ffffffffc0207de0:	8526                	mv	a0,s1
ffffffffc0207de2:	64a2                	ld	s1,8(sp)
ffffffffc0207de4:	6105                	addi	sp,sp,32
ffffffffc0207de6:	8082                	ret
ffffffffc0207de8:	00007697          	auipc	a3,0x7
ffffffffc0207dec:	c5868693          	addi	a3,a3,-936 # ffffffffc020ea40 <syscalls+0x9d0>
ffffffffc0207df0:	00004617          	auipc	a2,0x4
ffffffffc0207df4:	f5060613          	addi	a2,a2,-176 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207df8:	06100593          	li	a1,97
ffffffffc0207dfc:	00007517          	auipc	a0,0x7
ffffffffc0207e00:	a9450513          	addi	a0,a0,-1388 # ffffffffc020e890 <syscalls+0x820>
ffffffffc0207e04:	e9af80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207e08:	00007697          	auipc	a3,0x7
ffffffffc0207e0c:	c1868693          	addi	a3,a3,-1000 # ffffffffc020ea20 <syscalls+0x9b0>
ffffffffc0207e10:	00004617          	auipc	a2,0x4
ffffffffc0207e14:	f3060613          	addi	a2,a2,-208 # ffffffffc020bd40 <commands+0x210>
ffffffffc0207e18:	05c00593          	li	a1,92
ffffffffc0207e1c:	00007517          	auipc	a0,0x7
ffffffffc0207e20:	a7450513          	addi	a0,a0,-1420 # ffffffffc020e890 <syscalls+0x820>
ffffffffc0207e24:	e7af80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207e28 <__alloc_fs>:
ffffffffc0207e28:	1141                	addi	sp,sp,-16
ffffffffc0207e2a:	e022                	sd	s0,0(sp)
ffffffffc0207e2c:	842a                	mv	s0,a0
ffffffffc0207e2e:	0d800513          	li	a0,216
ffffffffc0207e32:	e406                	sd	ra,8(sp)
ffffffffc0207e34:	9eafa0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0207e38:	c119                	beqz	a0,ffffffffc0207e3e <__alloc_fs+0x16>
ffffffffc0207e3a:	0a852823          	sw	s0,176(a0)
ffffffffc0207e3e:	60a2                	ld	ra,8(sp)
ffffffffc0207e40:	6402                	ld	s0,0(sp)
ffffffffc0207e42:	0141                	addi	sp,sp,16
ffffffffc0207e44:	8082                	ret

ffffffffc0207e46 <vfs_init>:
ffffffffc0207e46:	1141                	addi	sp,sp,-16
ffffffffc0207e48:	4585                	li	a1,1
ffffffffc0207e4a:	0008e517          	auipc	a0,0x8e
ffffffffc0207e4e:	9b650513          	addi	a0,a0,-1610 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207e52:	e406                	sd	ra,8(sp)
ffffffffc0207e54:	8a7fc0ef          	jal	ra,ffffffffc02046fa <sem_init>
ffffffffc0207e58:	60a2                	ld	ra,8(sp)
ffffffffc0207e5a:	0141                	addi	sp,sp,16
ffffffffc0207e5c:	a40d                	j	ffffffffc020807e <vfs_devlist_init>

ffffffffc0207e5e <vfs_set_bootfs>:
ffffffffc0207e5e:	7179                	addi	sp,sp,-48
ffffffffc0207e60:	f022                	sd	s0,32(sp)
ffffffffc0207e62:	f406                	sd	ra,40(sp)
ffffffffc0207e64:	ec26                	sd	s1,24(sp)
ffffffffc0207e66:	e402                	sd	zero,8(sp)
ffffffffc0207e68:	842a                	mv	s0,a0
ffffffffc0207e6a:	c915                	beqz	a0,ffffffffc0207e9e <vfs_set_bootfs+0x40>
ffffffffc0207e6c:	03a00593          	li	a1,58
ffffffffc0207e70:	1d5030ef          	jal	ra,ffffffffc020b844 <strchr>
ffffffffc0207e74:	c135                	beqz	a0,ffffffffc0207ed8 <vfs_set_bootfs+0x7a>
ffffffffc0207e76:	00154783          	lbu	a5,1(a0)
ffffffffc0207e7a:	efb9                	bnez	a5,ffffffffc0207ed8 <vfs_set_bootfs+0x7a>
ffffffffc0207e7c:	8522                	mv	a0,s0
ffffffffc0207e7e:	11f000ef          	jal	ra,ffffffffc020879c <vfs_chdir>
ffffffffc0207e82:	842a                	mv	s0,a0
ffffffffc0207e84:	c519                	beqz	a0,ffffffffc0207e92 <vfs_set_bootfs+0x34>
ffffffffc0207e86:	70a2                	ld	ra,40(sp)
ffffffffc0207e88:	8522                	mv	a0,s0
ffffffffc0207e8a:	7402                	ld	s0,32(sp)
ffffffffc0207e8c:	64e2                	ld	s1,24(sp)
ffffffffc0207e8e:	6145                	addi	sp,sp,48
ffffffffc0207e90:	8082                	ret
ffffffffc0207e92:	0028                	addi	a0,sp,8
ffffffffc0207e94:	013000ef          	jal	ra,ffffffffc02086a6 <vfs_get_curdir>
ffffffffc0207e98:	842a                	mv	s0,a0
ffffffffc0207e9a:	f575                	bnez	a0,ffffffffc0207e86 <vfs_set_bootfs+0x28>
ffffffffc0207e9c:	6422                	ld	s0,8(sp)
ffffffffc0207e9e:	0008e517          	auipc	a0,0x8e
ffffffffc0207ea2:	96250513          	addi	a0,a0,-1694 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207ea6:	85ffc0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc0207eaa:	0008f797          	auipc	a5,0x8f
ffffffffc0207eae:	a4678793          	addi	a5,a5,-1466 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207eb2:	6384                	ld	s1,0(a5)
ffffffffc0207eb4:	0008e517          	auipc	a0,0x8e
ffffffffc0207eb8:	94c50513          	addi	a0,a0,-1716 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207ebc:	e380                	sd	s0,0(a5)
ffffffffc0207ebe:	4401                	li	s0,0
ffffffffc0207ec0:	841fc0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0207ec4:	d0e9                	beqz	s1,ffffffffc0207e86 <vfs_set_bootfs+0x28>
ffffffffc0207ec6:	8526                	mv	a0,s1
ffffffffc0207ec8:	e17ff0ef          	jal	ra,ffffffffc0207cde <inode_ref_dec>
ffffffffc0207ecc:	70a2                	ld	ra,40(sp)
ffffffffc0207ece:	8522                	mv	a0,s0
ffffffffc0207ed0:	7402                	ld	s0,32(sp)
ffffffffc0207ed2:	64e2                	ld	s1,24(sp)
ffffffffc0207ed4:	6145                	addi	sp,sp,48
ffffffffc0207ed6:	8082                	ret
ffffffffc0207ed8:	5475                	li	s0,-3
ffffffffc0207eda:	b775                	j	ffffffffc0207e86 <vfs_set_bootfs+0x28>

ffffffffc0207edc <vfs_get_bootfs>:
ffffffffc0207edc:	1101                	addi	sp,sp,-32
ffffffffc0207ede:	e426                	sd	s1,8(sp)
ffffffffc0207ee0:	0008f497          	auipc	s1,0x8f
ffffffffc0207ee4:	a1048493          	addi	s1,s1,-1520 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207ee8:	609c                	ld	a5,0(s1)
ffffffffc0207eea:	ec06                	sd	ra,24(sp)
ffffffffc0207eec:	e822                	sd	s0,16(sp)
ffffffffc0207eee:	c3a1                	beqz	a5,ffffffffc0207f2e <vfs_get_bootfs+0x52>
ffffffffc0207ef0:	842a                	mv	s0,a0
ffffffffc0207ef2:	0008e517          	auipc	a0,0x8e
ffffffffc0207ef6:	90e50513          	addi	a0,a0,-1778 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207efa:	80bfc0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc0207efe:	6084                	ld	s1,0(s1)
ffffffffc0207f00:	c08d                	beqz	s1,ffffffffc0207f22 <vfs_get_bootfs+0x46>
ffffffffc0207f02:	8526                	mv	a0,s1
ffffffffc0207f04:	d0dff0ef          	jal	ra,ffffffffc0207c10 <inode_ref_inc>
ffffffffc0207f08:	0008e517          	auipc	a0,0x8e
ffffffffc0207f0c:	8f850513          	addi	a0,a0,-1800 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207f10:	ff0fc0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0207f14:	4501                	li	a0,0
ffffffffc0207f16:	e004                	sd	s1,0(s0)
ffffffffc0207f18:	60e2                	ld	ra,24(sp)
ffffffffc0207f1a:	6442                	ld	s0,16(sp)
ffffffffc0207f1c:	64a2                	ld	s1,8(sp)
ffffffffc0207f1e:	6105                	addi	sp,sp,32
ffffffffc0207f20:	8082                	ret
ffffffffc0207f22:	0008e517          	auipc	a0,0x8e
ffffffffc0207f26:	8de50513          	addi	a0,a0,-1826 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207f2a:	fd6fc0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0207f2e:	5541                	li	a0,-16
ffffffffc0207f30:	b7e5                	j	ffffffffc0207f18 <vfs_get_bootfs+0x3c>

ffffffffc0207f32 <vfs_do_add>:
ffffffffc0207f32:	7139                	addi	sp,sp,-64
ffffffffc0207f34:	fc06                	sd	ra,56(sp)
ffffffffc0207f36:	f822                	sd	s0,48(sp)
ffffffffc0207f38:	f426                	sd	s1,40(sp)
ffffffffc0207f3a:	f04a                	sd	s2,32(sp)
ffffffffc0207f3c:	ec4e                	sd	s3,24(sp)
ffffffffc0207f3e:	e852                	sd	s4,16(sp)
ffffffffc0207f40:	e456                	sd	s5,8(sp)
ffffffffc0207f42:	e05a                	sd	s6,0(sp)
ffffffffc0207f44:	0e050b63          	beqz	a0,ffffffffc020803a <vfs_do_add+0x108>
ffffffffc0207f48:	842a                	mv	s0,a0
ffffffffc0207f4a:	8a2e                	mv	s4,a1
ffffffffc0207f4c:	8b32                	mv	s6,a2
ffffffffc0207f4e:	8ab6                	mv	s5,a3
ffffffffc0207f50:	c5cd                	beqz	a1,ffffffffc0207ffa <vfs_do_add+0xc8>
ffffffffc0207f52:	4db8                	lw	a4,88(a1)
ffffffffc0207f54:	6785                	lui	a5,0x1
ffffffffc0207f56:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207f5a:	0af71163          	bne	a4,a5,ffffffffc0207ffc <vfs_do_add+0xca>
ffffffffc0207f5e:	8522                	mv	a0,s0
ffffffffc0207f60:	059030ef          	jal	ra,ffffffffc020b7b8 <strlen>
ffffffffc0207f64:	47fd                	li	a5,31
ffffffffc0207f66:	0ca7e663          	bltu	a5,a0,ffffffffc0208032 <vfs_do_add+0x100>
ffffffffc0207f6a:	8522                	mv	a0,s0
ffffffffc0207f6c:	a88f80ef          	jal	ra,ffffffffc02001f4 <strdup>
ffffffffc0207f70:	84aa                	mv	s1,a0
ffffffffc0207f72:	c171                	beqz	a0,ffffffffc0208036 <vfs_do_add+0x104>
ffffffffc0207f74:	03000513          	li	a0,48
ffffffffc0207f78:	8a6fa0ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0207f7c:	89aa                	mv	s3,a0
ffffffffc0207f7e:	c92d                	beqz	a0,ffffffffc0207ff0 <vfs_do_add+0xbe>
ffffffffc0207f80:	0008e517          	auipc	a0,0x8e
ffffffffc0207f84:	8a850513          	addi	a0,a0,-1880 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207f88:	0008e917          	auipc	s2,0x8e
ffffffffc0207f8c:	89090913          	addi	s2,s2,-1904 # ffffffffc0295818 <vdev_list>
ffffffffc0207f90:	f74fc0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc0207f94:	844a                	mv	s0,s2
ffffffffc0207f96:	a039                	j	ffffffffc0207fa4 <vfs_do_add+0x72>
ffffffffc0207f98:	fe043503          	ld	a0,-32(s0)
ffffffffc0207f9c:	85a6                	mv	a1,s1
ffffffffc0207f9e:	063030ef          	jal	ra,ffffffffc020b800 <strcmp>
ffffffffc0207fa2:	cd2d                	beqz	a0,ffffffffc020801c <vfs_do_add+0xea>
ffffffffc0207fa4:	6400                	ld	s0,8(s0)
ffffffffc0207fa6:	ff2419e3          	bne	s0,s2,ffffffffc0207f98 <vfs_do_add+0x66>
ffffffffc0207faa:	6418                	ld	a4,8(s0)
ffffffffc0207fac:	02098793          	addi	a5,s3,32
ffffffffc0207fb0:	0099b023          	sd	s1,0(s3)
ffffffffc0207fb4:	0149b423          	sd	s4,8(s3)
ffffffffc0207fb8:	0159bc23          	sd	s5,24(s3)
ffffffffc0207fbc:	0169b823          	sd	s6,16(s3)
ffffffffc0207fc0:	e31c                	sd	a5,0(a4)
ffffffffc0207fc2:	0289b023          	sd	s0,32(s3)
ffffffffc0207fc6:	02e9b423          	sd	a4,40(s3)
ffffffffc0207fca:	0008e517          	auipc	a0,0x8e
ffffffffc0207fce:	85e50513          	addi	a0,a0,-1954 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207fd2:	e41c                	sd	a5,8(s0)
ffffffffc0207fd4:	4401                	li	s0,0
ffffffffc0207fd6:	f2afc0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0207fda:	70e2                	ld	ra,56(sp)
ffffffffc0207fdc:	8522                	mv	a0,s0
ffffffffc0207fde:	7442                	ld	s0,48(sp)
ffffffffc0207fe0:	74a2                	ld	s1,40(sp)
ffffffffc0207fe2:	7902                	ld	s2,32(sp)
ffffffffc0207fe4:	69e2                	ld	s3,24(sp)
ffffffffc0207fe6:	6a42                	ld	s4,16(sp)
ffffffffc0207fe8:	6aa2                	ld	s5,8(sp)
ffffffffc0207fea:	6b02                	ld	s6,0(sp)
ffffffffc0207fec:	6121                	addi	sp,sp,64
ffffffffc0207fee:	8082                	ret
ffffffffc0207ff0:	5471                	li	s0,-4
ffffffffc0207ff2:	8526                	mv	a0,s1
ffffffffc0207ff4:	8dafa0ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0207ff8:	b7cd                	j	ffffffffc0207fda <vfs_do_add+0xa8>
ffffffffc0207ffa:	d2b5                	beqz	a3,ffffffffc0207f5e <vfs_do_add+0x2c>
ffffffffc0207ffc:	00007697          	auipc	a3,0x7
ffffffffc0208000:	ae468693          	addi	a3,a3,-1308 # ffffffffc020eae0 <syscalls+0xa70>
ffffffffc0208004:	00004617          	auipc	a2,0x4
ffffffffc0208008:	d3c60613          	addi	a2,a2,-708 # ffffffffc020bd40 <commands+0x210>
ffffffffc020800c:	08f00593          	li	a1,143
ffffffffc0208010:	00007517          	auipc	a0,0x7
ffffffffc0208014:	ab850513          	addi	a0,a0,-1352 # ffffffffc020eac8 <syscalls+0xa58>
ffffffffc0208018:	c86f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020801c:	0008e517          	auipc	a0,0x8e
ffffffffc0208020:	80c50513          	addi	a0,a0,-2036 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0208024:	edcfc0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0208028:	854e                	mv	a0,s3
ffffffffc020802a:	8a4fa0ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc020802e:	5425                	li	s0,-23
ffffffffc0208030:	b7c9                	j	ffffffffc0207ff2 <vfs_do_add+0xc0>
ffffffffc0208032:	5451                	li	s0,-12
ffffffffc0208034:	b75d                	j	ffffffffc0207fda <vfs_do_add+0xa8>
ffffffffc0208036:	5471                	li	s0,-4
ffffffffc0208038:	b74d                	j	ffffffffc0207fda <vfs_do_add+0xa8>
ffffffffc020803a:	00007697          	auipc	a3,0x7
ffffffffc020803e:	a7e68693          	addi	a3,a3,-1410 # ffffffffc020eab8 <syscalls+0xa48>
ffffffffc0208042:	00004617          	auipc	a2,0x4
ffffffffc0208046:	cfe60613          	addi	a2,a2,-770 # ffffffffc020bd40 <commands+0x210>
ffffffffc020804a:	08e00593          	li	a1,142
ffffffffc020804e:	00007517          	auipc	a0,0x7
ffffffffc0208052:	a7a50513          	addi	a0,a0,-1414 # ffffffffc020eac8 <syscalls+0xa58>
ffffffffc0208056:	c48f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020805a <find_mount.part.0>:
ffffffffc020805a:	1141                	addi	sp,sp,-16
ffffffffc020805c:	00007697          	auipc	a3,0x7
ffffffffc0208060:	a5c68693          	addi	a3,a3,-1444 # ffffffffc020eab8 <syscalls+0xa48>
ffffffffc0208064:	00004617          	auipc	a2,0x4
ffffffffc0208068:	cdc60613          	addi	a2,a2,-804 # ffffffffc020bd40 <commands+0x210>
ffffffffc020806c:	0cd00593          	li	a1,205
ffffffffc0208070:	00007517          	auipc	a0,0x7
ffffffffc0208074:	a5850513          	addi	a0,a0,-1448 # ffffffffc020eac8 <syscalls+0xa58>
ffffffffc0208078:	e406                	sd	ra,8(sp)
ffffffffc020807a:	c24f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020807e <vfs_devlist_init>:
ffffffffc020807e:	0008d797          	auipc	a5,0x8d
ffffffffc0208082:	79a78793          	addi	a5,a5,1946 # ffffffffc0295818 <vdev_list>
ffffffffc0208086:	4585                	li	a1,1
ffffffffc0208088:	0008d517          	auipc	a0,0x8d
ffffffffc020808c:	7a050513          	addi	a0,a0,1952 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0208090:	e79c                	sd	a5,8(a5)
ffffffffc0208092:	e39c                	sd	a5,0(a5)
ffffffffc0208094:	e66fc06f          	j	ffffffffc02046fa <sem_init>

ffffffffc0208098 <vfs_cleanup>:
ffffffffc0208098:	1101                	addi	sp,sp,-32
ffffffffc020809a:	e426                	sd	s1,8(sp)
ffffffffc020809c:	0008d497          	auipc	s1,0x8d
ffffffffc02080a0:	77c48493          	addi	s1,s1,1916 # ffffffffc0295818 <vdev_list>
ffffffffc02080a4:	649c                	ld	a5,8(s1)
ffffffffc02080a6:	ec06                	sd	ra,24(sp)
ffffffffc02080a8:	e822                	sd	s0,16(sp)
ffffffffc02080aa:	02978e63          	beq	a5,s1,ffffffffc02080e6 <vfs_cleanup+0x4e>
ffffffffc02080ae:	0008d517          	auipc	a0,0x8d
ffffffffc02080b2:	77a50513          	addi	a0,a0,1914 # ffffffffc0295828 <vdev_list_sem>
ffffffffc02080b6:	e4efc0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc02080ba:	6480                	ld	s0,8(s1)
ffffffffc02080bc:	00940b63          	beq	s0,s1,ffffffffc02080d2 <vfs_cleanup+0x3a>
ffffffffc02080c0:	ff043783          	ld	a5,-16(s0)
ffffffffc02080c4:	853e                	mv	a0,a5
ffffffffc02080c6:	c399                	beqz	a5,ffffffffc02080cc <vfs_cleanup+0x34>
ffffffffc02080c8:	6bfc                	ld	a5,208(a5)
ffffffffc02080ca:	9782                	jalr	a5
ffffffffc02080cc:	6400                	ld	s0,8(s0)
ffffffffc02080ce:	fe9419e3          	bne	s0,s1,ffffffffc02080c0 <vfs_cleanup+0x28>
ffffffffc02080d2:	6442                	ld	s0,16(sp)
ffffffffc02080d4:	60e2                	ld	ra,24(sp)
ffffffffc02080d6:	64a2                	ld	s1,8(sp)
ffffffffc02080d8:	0008d517          	auipc	a0,0x8d
ffffffffc02080dc:	75050513          	addi	a0,a0,1872 # ffffffffc0295828 <vdev_list_sem>
ffffffffc02080e0:	6105                	addi	sp,sp,32
ffffffffc02080e2:	e1efc06f          	j	ffffffffc0204700 <up>
ffffffffc02080e6:	60e2                	ld	ra,24(sp)
ffffffffc02080e8:	6442                	ld	s0,16(sp)
ffffffffc02080ea:	64a2                	ld	s1,8(sp)
ffffffffc02080ec:	6105                	addi	sp,sp,32
ffffffffc02080ee:	8082                	ret

ffffffffc02080f0 <vfs_get_root>:
ffffffffc02080f0:	7179                	addi	sp,sp,-48
ffffffffc02080f2:	f406                	sd	ra,40(sp)
ffffffffc02080f4:	f022                	sd	s0,32(sp)
ffffffffc02080f6:	ec26                	sd	s1,24(sp)
ffffffffc02080f8:	e84a                	sd	s2,16(sp)
ffffffffc02080fa:	e44e                	sd	s3,8(sp)
ffffffffc02080fc:	e052                	sd	s4,0(sp)
ffffffffc02080fe:	c541                	beqz	a0,ffffffffc0208186 <vfs_get_root+0x96>
ffffffffc0208100:	0008d917          	auipc	s2,0x8d
ffffffffc0208104:	71890913          	addi	s2,s2,1816 # ffffffffc0295818 <vdev_list>
ffffffffc0208108:	00893783          	ld	a5,8(s2)
ffffffffc020810c:	07278b63          	beq	a5,s2,ffffffffc0208182 <vfs_get_root+0x92>
ffffffffc0208110:	89aa                	mv	s3,a0
ffffffffc0208112:	0008d517          	auipc	a0,0x8d
ffffffffc0208116:	71650513          	addi	a0,a0,1814 # ffffffffc0295828 <vdev_list_sem>
ffffffffc020811a:	8a2e                	mv	s4,a1
ffffffffc020811c:	844a                	mv	s0,s2
ffffffffc020811e:	de6fc0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc0208122:	a801                	j	ffffffffc0208132 <vfs_get_root+0x42>
ffffffffc0208124:	fe043583          	ld	a1,-32(s0)
ffffffffc0208128:	854e                	mv	a0,s3
ffffffffc020812a:	6d6030ef          	jal	ra,ffffffffc020b800 <strcmp>
ffffffffc020812e:	84aa                	mv	s1,a0
ffffffffc0208130:	c505                	beqz	a0,ffffffffc0208158 <vfs_get_root+0x68>
ffffffffc0208132:	6400                	ld	s0,8(s0)
ffffffffc0208134:	ff2418e3          	bne	s0,s2,ffffffffc0208124 <vfs_get_root+0x34>
ffffffffc0208138:	54cd                	li	s1,-13
ffffffffc020813a:	0008d517          	auipc	a0,0x8d
ffffffffc020813e:	6ee50513          	addi	a0,a0,1774 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0208142:	dbefc0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0208146:	70a2                	ld	ra,40(sp)
ffffffffc0208148:	7402                	ld	s0,32(sp)
ffffffffc020814a:	6942                	ld	s2,16(sp)
ffffffffc020814c:	69a2                	ld	s3,8(sp)
ffffffffc020814e:	6a02                	ld	s4,0(sp)
ffffffffc0208150:	8526                	mv	a0,s1
ffffffffc0208152:	64e2                	ld	s1,24(sp)
ffffffffc0208154:	6145                	addi	sp,sp,48
ffffffffc0208156:	8082                	ret
ffffffffc0208158:	ff043503          	ld	a0,-16(s0)
ffffffffc020815c:	c519                	beqz	a0,ffffffffc020816a <vfs_get_root+0x7a>
ffffffffc020815e:	617c                	ld	a5,192(a0)
ffffffffc0208160:	9782                	jalr	a5
ffffffffc0208162:	c519                	beqz	a0,ffffffffc0208170 <vfs_get_root+0x80>
ffffffffc0208164:	00aa3023          	sd	a0,0(s4)
ffffffffc0208168:	bfc9                	j	ffffffffc020813a <vfs_get_root+0x4a>
ffffffffc020816a:	ff843783          	ld	a5,-8(s0)
ffffffffc020816e:	c399                	beqz	a5,ffffffffc0208174 <vfs_get_root+0x84>
ffffffffc0208170:	54c9                	li	s1,-14
ffffffffc0208172:	b7e1                	j	ffffffffc020813a <vfs_get_root+0x4a>
ffffffffc0208174:	fe843503          	ld	a0,-24(s0)
ffffffffc0208178:	a99ff0ef          	jal	ra,ffffffffc0207c10 <inode_ref_inc>
ffffffffc020817c:	fe843503          	ld	a0,-24(s0)
ffffffffc0208180:	b7cd                	j	ffffffffc0208162 <vfs_get_root+0x72>
ffffffffc0208182:	54cd                	li	s1,-13
ffffffffc0208184:	b7c9                	j	ffffffffc0208146 <vfs_get_root+0x56>
ffffffffc0208186:	00007697          	auipc	a3,0x7
ffffffffc020818a:	93268693          	addi	a3,a3,-1742 # ffffffffc020eab8 <syscalls+0xa48>
ffffffffc020818e:	00004617          	auipc	a2,0x4
ffffffffc0208192:	bb260613          	addi	a2,a2,-1102 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208196:	04500593          	li	a1,69
ffffffffc020819a:	00007517          	auipc	a0,0x7
ffffffffc020819e:	92e50513          	addi	a0,a0,-1746 # ffffffffc020eac8 <syscalls+0xa58>
ffffffffc02081a2:	afcf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02081a6 <vfs_get_devname>:
ffffffffc02081a6:	0008d697          	auipc	a3,0x8d
ffffffffc02081aa:	67268693          	addi	a3,a3,1650 # ffffffffc0295818 <vdev_list>
ffffffffc02081ae:	87b6                	mv	a5,a3
ffffffffc02081b0:	e511                	bnez	a0,ffffffffc02081bc <vfs_get_devname+0x16>
ffffffffc02081b2:	a829                	j	ffffffffc02081cc <vfs_get_devname+0x26>
ffffffffc02081b4:	ff07b703          	ld	a4,-16(a5)
ffffffffc02081b8:	00a70763          	beq	a4,a0,ffffffffc02081c6 <vfs_get_devname+0x20>
ffffffffc02081bc:	679c                	ld	a5,8(a5)
ffffffffc02081be:	fed79be3          	bne	a5,a3,ffffffffc02081b4 <vfs_get_devname+0xe>
ffffffffc02081c2:	4501                	li	a0,0
ffffffffc02081c4:	8082                	ret
ffffffffc02081c6:	fe07b503          	ld	a0,-32(a5)
ffffffffc02081ca:	8082                	ret
ffffffffc02081cc:	1141                	addi	sp,sp,-16
ffffffffc02081ce:	00007697          	auipc	a3,0x7
ffffffffc02081d2:	97268693          	addi	a3,a3,-1678 # ffffffffc020eb40 <syscalls+0xad0>
ffffffffc02081d6:	00004617          	auipc	a2,0x4
ffffffffc02081da:	b6a60613          	addi	a2,a2,-1174 # ffffffffc020bd40 <commands+0x210>
ffffffffc02081de:	06a00593          	li	a1,106
ffffffffc02081e2:	00007517          	auipc	a0,0x7
ffffffffc02081e6:	8e650513          	addi	a0,a0,-1818 # ffffffffc020eac8 <syscalls+0xa58>
ffffffffc02081ea:	e406                	sd	ra,8(sp)
ffffffffc02081ec:	ab2f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02081f0 <vfs_add_dev>:
ffffffffc02081f0:	86b2                	mv	a3,a2
ffffffffc02081f2:	4601                	li	a2,0
ffffffffc02081f4:	d3fff06f          	j	ffffffffc0207f32 <vfs_do_add>

ffffffffc02081f8 <vfs_mount>:
ffffffffc02081f8:	7179                	addi	sp,sp,-48
ffffffffc02081fa:	e84a                	sd	s2,16(sp)
ffffffffc02081fc:	892a                	mv	s2,a0
ffffffffc02081fe:	0008d517          	auipc	a0,0x8d
ffffffffc0208202:	62a50513          	addi	a0,a0,1578 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0208206:	e44e                	sd	s3,8(sp)
ffffffffc0208208:	f406                	sd	ra,40(sp)
ffffffffc020820a:	f022                	sd	s0,32(sp)
ffffffffc020820c:	ec26                	sd	s1,24(sp)
ffffffffc020820e:	89ae                	mv	s3,a1
ffffffffc0208210:	cf4fc0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc0208214:	08090a63          	beqz	s2,ffffffffc02082a8 <vfs_mount+0xb0>
ffffffffc0208218:	0008d497          	auipc	s1,0x8d
ffffffffc020821c:	60048493          	addi	s1,s1,1536 # ffffffffc0295818 <vdev_list>
ffffffffc0208220:	6480                	ld	s0,8(s1)
ffffffffc0208222:	00941663          	bne	s0,s1,ffffffffc020822e <vfs_mount+0x36>
ffffffffc0208226:	a8ad                	j	ffffffffc02082a0 <vfs_mount+0xa8>
ffffffffc0208228:	6400                	ld	s0,8(s0)
ffffffffc020822a:	06940b63          	beq	s0,s1,ffffffffc02082a0 <vfs_mount+0xa8>
ffffffffc020822e:	ff843783          	ld	a5,-8(s0)
ffffffffc0208232:	dbfd                	beqz	a5,ffffffffc0208228 <vfs_mount+0x30>
ffffffffc0208234:	fe043503          	ld	a0,-32(s0)
ffffffffc0208238:	85ca                	mv	a1,s2
ffffffffc020823a:	5c6030ef          	jal	ra,ffffffffc020b800 <strcmp>
ffffffffc020823e:	f56d                	bnez	a0,ffffffffc0208228 <vfs_mount+0x30>
ffffffffc0208240:	ff043783          	ld	a5,-16(s0)
ffffffffc0208244:	e3a5                	bnez	a5,ffffffffc02082a4 <vfs_mount+0xac>
ffffffffc0208246:	fe043783          	ld	a5,-32(s0)
ffffffffc020824a:	c3c9                	beqz	a5,ffffffffc02082cc <vfs_mount+0xd4>
ffffffffc020824c:	ff843783          	ld	a5,-8(s0)
ffffffffc0208250:	cfb5                	beqz	a5,ffffffffc02082cc <vfs_mount+0xd4>
ffffffffc0208252:	fe843503          	ld	a0,-24(s0)
ffffffffc0208256:	c939                	beqz	a0,ffffffffc02082ac <vfs_mount+0xb4>
ffffffffc0208258:	4d38                	lw	a4,88(a0)
ffffffffc020825a:	6785                	lui	a5,0x1
ffffffffc020825c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208260:	04f71663          	bne	a4,a5,ffffffffc02082ac <vfs_mount+0xb4>
ffffffffc0208264:	ff040593          	addi	a1,s0,-16
ffffffffc0208268:	9982                	jalr	s3
ffffffffc020826a:	84aa                	mv	s1,a0
ffffffffc020826c:	ed01                	bnez	a0,ffffffffc0208284 <vfs_mount+0x8c>
ffffffffc020826e:	ff043783          	ld	a5,-16(s0)
ffffffffc0208272:	cfad                	beqz	a5,ffffffffc02082ec <vfs_mount+0xf4>
ffffffffc0208274:	fe043583          	ld	a1,-32(s0)
ffffffffc0208278:	00007517          	auipc	a0,0x7
ffffffffc020827c:	95850513          	addi	a0,a0,-1704 # ffffffffc020ebd0 <syscalls+0xb60>
ffffffffc0208280:	f27f70ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0208284:	0008d517          	auipc	a0,0x8d
ffffffffc0208288:	5a450513          	addi	a0,a0,1444 # ffffffffc0295828 <vdev_list_sem>
ffffffffc020828c:	c74fc0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0208290:	70a2                	ld	ra,40(sp)
ffffffffc0208292:	7402                	ld	s0,32(sp)
ffffffffc0208294:	6942                	ld	s2,16(sp)
ffffffffc0208296:	69a2                	ld	s3,8(sp)
ffffffffc0208298:	8526                	mv	a0,s1
ffffffffc020829a:	64e2                	ld	s1,24(sp)
ffffffffc020829c:	6145                	addi	sp,sp,48
ffffffffc020829e:	8082                	ret
ffffffffc02082a0:	54cd                	li	s1,-13
ffffffffc02082a2:	b7cd                	j	ffffffffc0208284 <vfs_mount+0x8c>
ffffffffc02082a4:	54c5                	li	s1,-15
ffffffffc02082a6:	bff9                	j	ffffffffc0208284 <vfs_mount+0x8c>
ffffffffc02082a8:	db3ff0ef          	jal	ra,ffffffffc020805a <find_mount.part.0>
ffffffffc02082ac:	00007697          	auipc	a3,0x7
ffffffffc02082b0:	8d468693          	addi	a3,a3,-1836 # ffffffffc020eb80 <syscalls+0xb10>
ffffffffc02082b4:	00004617          	auipc	a2,0x4
ffffffffc02082b8:	a8c60613          	addi	a2,a2,-1396 # ffffffffc020bd40 <commands+0x210>
ffffffffc02082bc:	0ed00593          	li	a1,237
ffffffffc02082c0:	00007517          	auipc	a0,0x7
ffffffffc02082c4:	80850513          	addi	a0,a0,-2040 # ffffffffc020eac8 <syscalls+0xa58>
ffffffffc02082c8:	9d6f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02082cc:	00007697          	auipc	a3,0x7
ffffffffc02082d0:	88468693          	addi	a3,a3,-1916 # ffffffffc020eb50 <syscalls+0xae0>
ffffffffc02082d4:	00004617          	auipc	a2,0x4
ffffffffc02082d8:	a6c60613          	addi	a2,a2,-1428 # ffffffffc020bd40 <commands+0x210>
ffffffffc02082dc:	0eb00593          	li	a1,235
ffffffffc02082e0:	00006517          	auipc	a0,0x6
ffffffffc02082e4:	7e850513          	addi	a0,a0,2024 # ffffffffc020eac8 <syscalls+0xa58>
ffffffffc02082e8:	9b6f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02082ec:	00007697          	auipc	a3,0x7
ffffffffc02082f0:	8cc68693          	addi	a3,a3,-1844 # ffffffffc020ebb8 <syscalls+0xb48>
ffffffffc02082f4:	00004617          	auipc	a2,0x4
ffffffffc02082f8:	a4c60613          	addi	a2,a2,-1460 # ffffffffc020bd40 <commands+0x210>
ffffffffc02082fc:	0ef00593          	li	a1,239
ffffffffc0208300:	00006517          	auipc	a0,0x6
ffffffffc0208304:	7c850513          	addi	a0,a0,1992 # ffffffffc020eac8 <syscalls+0xa58>
ffffffffc0208308:	996f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020830c <vfs_open>:
ffffffffc020830c:	711d                	addi	sp,sp,-96
ffffffffc020830e:	e4a6                	sd	s1,72(sp)
ffffffffc0208310:	e0ca                	sd	s2,64(sp)
ffffffffc0208312:	fc4e                	sd	s3,56(sp)
ffffffffc0208314:	ec86                	sd	ra,88(sp)
ffffffffc0208316:	e8a2                	sd	s0,80(sp)
ffffffffc0208318:	f852                	sd	s4,48(sp)
ffffffffc020831a:	f456                	sd	s5,40(sp)
ffffffffc020831c:	0035f793          	andi	a5,a1,3
ffffffffc0208320:	84ae                	mv	s1,a1
ffffffffc0208322:	892a                	mv	s2,a0
ffffffffc0208324:	89b2                	mv	s3,a2
ffffffffc0208326:	0e078663          	beqz	a5,ffffffffc0208412 <vfs_open+0x106>
ffffffffc020832a:	470d                	li	a4,3
ffffffffc020832c:	0105fa93          	andi	s5,a1,16
ffffffffc0208330:	0ce78f63          	beq	a5,a4,ffffffffc020840e <vfs_open+0x102>
ffffffffc0208334:	002c                	addi	a1,sp,8
ffffffffc0208336:	854a                	mv	a0,s2
ffffffffc0208338:	2ae000ef          	jal	ra,ffffffffc02085e6 <vfs_lookup>
ffffffffc020833c:	842a                	mv	s0,a0
ffffffffc020833e:	0044fa13          	andi	s4,s1,4
ffffffffc0208342:	e159                	bnez	a0,ffffffffc02083c8 <vfs_open+0xbc>
ffffffffc0208344:	00c4f793          	andi	a5,s1,12
ffffffffc0208348:	4731                	li	a4,12
ffffffffc020834a:	0ee78263          	beq	a5,a4,ffffffffc020842e <vfs_open+0x122>
ffffffffc020834e:	6422                	ld	s0,8(sp)
ffffffffc0208350:	12040163          	beqz	s0,ffffffffc0208472 <vfs_open+0x166>
ffffffffc0208354:	783c                	ld	a5,112(s0)
ffffffffc0208356:	cff1                	beqz	a5,ffffffffc0208432 <vfs_open+0x126>
ffffffffc0208358:	679c                	ld	a5,8(a5)
ffffffffc020835a:	cfe1                	beqz	a5,ffffffffc0208432 <vfs_open+0x126>
ffffffffc020835c:	8522                	mv	a0,s0
ffffffffc020835e:	00007597          	auipc	a1,0x7
ffffffffc0208362:	95258593          	addi	a1,a1,-1710 # ffffffffc020ecb0 <syscalls+0xc40>
ffffffffc0208366:	8c3ff0ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc020836a:	783c                	ld	a5,112(s0)
ffffffffc020836c:	6522                	ld	a0,8(sp)
ffffffffc020836e:	85a6                	mv	a1,s1
ffffffffc0208370:	679c                	ld	a5,8(a5)
ffffffffc0208372:	9782                	jalr	a5
ffffffffc0208374:	842a                	mv	s0,a0
ffffffffc0208376:	6522                	ld	a0,8(sp)
ffffffffc0208378:	e845                	bnez	s0,ffffffffc0208428 <vfs_open+0x11c>
ffffffffc020837a:	015a6a33          	or	s4,s4,s5
ffffffffc020837e:	89fff0ef          	jal	ra,ffffffffc0207c1c <inode_open_inc>
ffffffffc0208382:	020a0663          	beqz	s4,ffffffffc02083ae <vfs_open+0xa2>
ffffffffc0208386:	64a2                	ld	s1,8(sp)
ffffffffc0208388:	c4e9                	beqz	s1,ffffffffc0208452 <vfs_open+0x146>
ffffffffc020838a:	78bc                	ld	a5,112(s1)
ffffffffc020838c:	c3f9                	beqz	a5,ffffffffc0208452 <vfs_open+0x146>
ffffffffc020838e:	73bc                	ld	a5,96(a5)
ffffffffc0208390:	c3e9                	beqz	a5,ffffffffc0208452 <vfs_open+0x146>
ffffffffc0208392:	00007597          	auipc	a1,0x7
ffffffffc0208396:	97e58593          	addi	a1,a1,-1666 # ffffffffc020ed10 <syscalls+0xca0>
ffffffffc020839a:	8526                	mv	a0,s1
ffffffffc020839c:	88dff0ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc02083a0:	78bc                	ld	a5,112(s1)
ffffffffc02083a2:	6522                	ld	a0,8(sp)
ffffffffc02083a4:	4581                	li	a1,0
ffffffffc02083a6:	73bc                	ld	a5,96(a5)
ffffffffc02083a8:	9782                	jalr	a5
ffffffffc02083aa:	87aa                	mv	a5,a0
ffffffffc02083ac:	e92d                	bnez	a0,ffffffffc020841e <vfs_open+0x112>
ffffffffc02083ae:	67a2                	ld	a5,8(sp)
ffffffffc02083b0:	00f9b023          	sd	a5,0(s3)
ffffffffc02083b4:	60e6                	ld	ra,88(sp)
ffffffffc02083b6:	8522                	mv	a0,s0
ffffffffc02083b8:	6446                	ld	s0,80(sp)
ffffffffc02083ba:	64a6                	ld	s1,72(sp)
ffffffffc02083bc:	6906                	ld	s2,64(sp)
ffffffffc02083be:	79e2                	ld	s3,56(sp)
ffffffffc02083c0:	7a42                	ld	s4,48(sp)
ffffffffc02083c2:	7aa2                	ld	s5,40(sp)
ffffffffc02083c4:	6125                	addi	sp,sp,96
ffffffffc02083c6:	8082                	ret
ffffffffc02083c8:	57c1                	li	a5,-16
ffffffffc02083ca:	fef515e3          	bne	a0,a5,ffffffffc02083b4 <vfs_open+0xa8>
ffffffffc02083ce:	fe0a03e3          	beqz	s4,ffffffffc02083b4 <vfs_open+0xa8>
ffffffffc02083d2:	0810                	addi	a2,sp,16
ffffffffc02083d4:	082c                	addi	a1,sp,24
ffffffffc02083d6:	854a                	mv	a0,s2
ffffffffc02083d8:	2a4000ef          	jal	ra,ffffffffc020867c <vfs_lookup_parent>
ffffffffc02083dc:	842a                	mv	s0,a0
ffffffffc02083de:	f979                	bnez	a0,ffffffffc02083b4 <vfs_open+0xa8>
ffffffffc02083e0:	6462                	ld	s0,24(sp)
ffffffffc02083e2:	c845                	beqz	s0,ffffffffc0208492 <vfs_open+0x186>
ffffffffc02083e4:	783c                	ld	a5,112(s0)
ffffffffc02083e6:	c7d5                	beqz	a5,ffffffffc0208492 <vfs_open+0x186>
ffffffffc02083e8:	77bc                	ld	a5,104(a5)
ffffffffc02083ea:	c7c5                	beqz	a5,ffffffffc0208492 <vfs_open+0x186>
ffffffffc02083ec:	8522                	mv	a0,s0
ffffffffc02083ee:	00007597          	auipc	a1,0x7
ffffffffc02083f2:	85a58593          	addi	a1,a1,-1958 # ffffffffc020ec48 <syscalls+0xbd8>
ffffffffc02083f6:	833ff0ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc02083fa:	783c                	ld	a5,112(s0)
ffffffffc02083fc:	65c2                	ld	a1,16(sp)
ffffffffc02083fe:	6562                	ld	a0,24(sp)
ffffffffc0208400:	77bc                	ld	a5,104(a5)
ffffffffc0208402:	4034d613          	srai	a2,s1,0x3
ffffffffc0208406:	0034                	addi	a3,sp,8
ffffffffc0208408:	8a05                	andi	a2,a2,1
ffffffffc020840a:	9782                	jalr	a5
ffffffffc020840c:	b789                	j	ffffffffc020834e <vfs_open+0x42>
ffffffffc020840e:	5475                	li	s0,-3
ffffffffc0208410:	b755                	j	ffffffffc02083b4 <vfs_open+0xa8>
ffffffffc0208412:	0105fa93          	andi	s5,a1,16
ffffffffc0208416:	5475                	li	s0,-3
ffffffffc0208418:	f80a9ee3          	bnez	s5,ffffffffc02083b4 <vfs_open+0xa8>
ffffffffc020841c:	bf21                	j	ffffffffc0208334 <vfs_open+0x28>
ffffffffc020841e:	6522                	ld	a0,8(sp)
ffffffffc0208420:	843e                	mv	s0,a5
ffffffffc0208422:	965ff0ef          	jal	ra,ffffffffc0207d86 <inode_open_dec>
ffffffffc0208426:	6522                	ld	a0,8(sp)
ffffffffc0208428:	8b7ff0ef          	jal	ra,ffffffffc0207cde <inode_ref_dec>
ffffffffc020842c:	b761                	j	ffffffffc02083b4 <vfs_open+0xa8>
ffffffffc020842e:	5425                	li	s0,-23
ffffffffc0208430:	b751                	j	ffffffffc02083b4 <vfs_open+0xa8>
ffffffffc0208432:	00007697          	auipc	a3,0x7
ffffffffc0208436:	82e68693          	addi	a3,a3,-2002 # ffffffffc020ec60 <syscalls+0xbf0>
ffffffffc020843a:	00004617          	auipc	a2,0x4
ffffffffc020843e:	90660613          	addi	a2,a2,-1786 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208442:	03300593          	li	a1,51
ffffffffc0208446:	00006517          	auipc	a0,0x6
ffffffffc020844a:	7ea50513          	addi	a0,a0,2026 # ffffffffc020ec30 <syscalls+0xbc0>
ffffffffc020844e:	850f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208452:	00007697          	auipc	a3,0x7
ffffffffc0208456:	86668693          	addi	a3,a3,-1946 # ffffffffc020ecb8 <syscalls+0xc48>
ffffffffc020845a:	00004617          	auipc	a2,0x4
ffffffffc020845e:	8e660613          	addi	a2,a2,-1818 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208462:	03a00593          	li	a1,58
ffffffffc0208466:	00006517          	auipc	a0,0x6
ffffffffc020846a:	7ca50513          	addi	a0,a0,1994 # ffffffffc020ec30 <syscalls+0xbc0>
ffffffffc020846e:	830f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208472:	00006697          	auipc	a3,0x6
ffffffffc0208476:	7de68693          	addi	a3,a3,2014 # ffffffffc020ec50 <syscalls+0xbe0>
ffffffffc020847a:	00004617          	auipc	a2,0x4
ffffffffc020847e:	8c660613          	addi	a2,a2,-1850 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208482:	03100593          	li	a1,49
ffffffffc0208486:	00006517          	auipc	a0,0x6
ffffffffc020848a:	7aa50513          	addi	a0,a0,1962 # ffffffffc020ec30 <syscalls+0xbc0>
ffffffffc020848e:	810f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208492:	00006697          	auipc	a3,0x6
ffffffffc0208496:	74e68693          	addi	a3,a3,1870 # ffffffffc020ebe0 <syscalls+0xb70>
ffffffffc020849a:	00004617          	auipc	a2,0x4
ffffffffc020849e:	8a660613          	addi	a2,a2,-1882 # ffffffffc020bd40 <commands+0x210>
ffffffffc02084a2:	02c00593          	li	a1,44
ffffffffc02084a6:	00006517          	auipc	a0,0x6
ffffffffc02084aa:	78a50513          	addi	a0,a0,1930 # ffffffffc020ec30 <syscalls+0xbc0>
ffffffffc02084ae:	ff1f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02084b2 <vfs_close>:
ffffffffc02084b2:	1141                	addi	sp,sp,-16
ffffffffc02084b4:	e406                	sd	ra,8(sp)
ffffffffc02084b6:	e022                	sd	s0,0(sp)
ffffffffc02084b8:	842a                	mv	s0,a0
ffffffffc02084ba:	8cdff0ef          	jal	ra,ffffffffc0207d86 <inode_open_dec>
ffffffffc02084be:	8522                	mv	a0,s0
ffffffffc02084c0:	81fff0ef          	jal	ra,ffffffffc0207cde <inode_ref_dec>
ffffffffc02084c4:	60a2                	ld	ra,8(sp)
ffffffffc02084c6:	6402                	ld	s0,0(sp)
ffffffffc02084c8:	4501                	li	a0,0
ffffffffc02084ca:	0141                	addi	sp,sp,16
ffffffffc02084cc:	8082                	ret

ffffffffc02084ce <get_device>:
ffffffffc02084ce:	7179                	addi	sp,sp,-48
ffffffffc02084d0:	ec26                	sd	s1,24(sp)
ffffffffc02084d2:	e84a                	sd	s2,16(sp)
ffffffffc02084d4:	f406                	sd	ra,40(sp)
ffffffffc02084d6:	f022                	sd	s0,32(sp)
ffffffffc02084d8:	00054303          	lbu	t1,0(a0)
ffffffffc02084dc:	892e                	mv	s2,a1
ffffffffc02084de:	84b2                	mv	s1,a2
ffffffffc02084e0:	02030463          	beqz	t1,ffffffffc0208508 <get_device+0x3a>
ffffffffc02084e4:	00150413          	addi	s0,a0,1
ffffffffc02084e8:	86a2                	mv	a3,s0
ffffffffc02084ea:	879a                	mv	a5,t1
ffffffffc02084ec:	4701                	li	a4,0
ffffffffc02084ee:	03a00813          	li	a6,58
ffffffffc02084f2:	02f00893          	li	a7,47
ffffffffc02084f6:	03078263          	beq	a5,a6,ffffffffc020851a <get_device+0x4c>
ffffffffc02084fa:	05178963          	beq	a5,a7,ffffffffc020854c <get_device+0x7e>
ffffffffc02084fe:	0006c783          	lbu	a5,0(a3)
ffffffffc0208502:	2705                	addiw	a4,a4,1
ffffffffc0208504:	0685                	addi	a3,a3,1
ffffffffc0208506:	fbe5                	bnez	a5,ffffffffc02084f6 <get_device+0x28>
ffffffffc0208508:	7402                	ld	s0,32(sp)
ffffffffc020850a:	00a93023          	sd	a0,0(s2)
ffffffffc020850e:	70a2                	ld	ra,40(sp)
ffffffffc0208510:	6942                	ld	s2,16(sp)
ffffffffc0208512:	8526                	mv	a0,s1
ffffffffc0208514:	64e2                	ld	s1,24(sp)
ffffffffc0208516:	6145                	addi	sp,sp,48
ffffffffc0208518:	a279                	j	ffffffffc02086a6 <vfs_get_curdir>
ffffffffc020851a:	cb15                	beqz	a4,ffffffffc020854e <get_device+0x80>
ffffffffc020851c:	00e507b3          	add	a5,a0,a4
ffffffffc0208520:	0705                	addi	a4,a4,1
ffffffffc0208522:	00078023          	sb	zero,0(a5)
ffffffffc0208526:	972a                	add	a4,a4,a0
ffffffffc0208528:	02f00613          	li	a2,47
ffffffffc020852c:	00074783          	lbu	a5,0(a4)
ffffffffc0208530:	86ba                	mv	a3,a4
ffffffffc0208532:	0705                	addi	a4,a4,1
ffffffffc0208534:	fec78ce3          	beq	a5,a2,ffffffffc020852c <get_device+0x5e>
ffffffffc0208538:	7402                	ld	s0,32(sp)
ffffffffc020853a:	70a2                	ld	ra,40(sp)
ffffffffc020853c:	00d93023          	sd	a3,0(s2)
ffffffffc0208540:	85a6                	mv	a1,s1
ffffffffc0208542:	6942                	ld	s2,16(sp)
ffffffffc0208544:	64e2                	ld	s1,24(sp)
ffffffffc0208546:	6145                	addi	sp,sp,48
ffffffffc0208548:	ba9ff06f          	j	ffffffffc02080f0 <vfs_get_root>
ffffffffc020854c:	ff55                	bnez	a4,ffffffffc0208508 <get_device+0x3a>
ffffffffc020854e:	02f00793          	li	a5,47
ffffffffc0208552:	04f30563          	beq	t1,a5,ffffffffc020859c <get_device+0xce>
ffffffffc0208556:	03a00793          	li	a5,58
ffffffffc020855a:	06f31663          	bne	t1,a5,ffffffffc02085c6 <get_device+0xf8>
ffffffffc020855e:	0028                	addi	a0,sp,8
ffffffffc0208560:	146000ef          	jal	ra,ffffffffc02086a6 <vfs_get_curdir>
ffffffffc0208564:	e515                	bnez	a0,ffffffffc0208590 <get_device+0xc2>
ffffffffc0208566:	67a2                	ld	a5,8(sp)
ffffffffc0208568:	77a8                	ld	a0,104(a5)
ffffffffc020856a:	cd15                	beqz	a0,ffffffffc02085a6 <get_device+0xd8>
ffffffffc020856c:	617c                	ld	a5,192(a0)
ffffffffc020856e:	9782                	jalr	a5
ffffffffc0208570:	87aa                	mv	a5,a0
ffffffffc0208572:	6522                	ld	a0,8(sp)
ffffffffc0208574:	e09c                	sd	a5,0(s1)
ffffffffc0208576:	f68ff0ef          	jal	ra,ffffffffc0207cde <inode_ref_dec>
ffffffffc020857a:	02f00713          	li	a4,47
ffffffffc020857e:	a011                	j	ffffffffc0208582 <get_device+0xb4>
ffffffffc0208580:	0405                	addi	s0,s0,1
ffffffffc0208582:	00044783          	lbu	a5,0(s0)
ffffffffc0208586:	fee78de3          	beq	a5,a4,ffffffffc0208580 <get_device+0xb2>
ffffffffc020858a:	00893023          	sd	s0,0(s2)
ffffffffc020858e:	4501                	li	a0,0
ffffffffc0208590:	70a2                	ld	ra,40(sp)
ffffffffc0208592:	7402                	ld	s0,32(sp)
ffffffffc0208594:	64e2                	ld	s1,24(sp)
ffffffffc0208596:	6942                	ld	s2,16(sp)
ffffffffc0208598:	6145                	addi	sp,sp,48
ffffffffc020859a:	8082                	ret
ffffffffc020859c:	8526                	mv	a0,s1
ffffffffc020859e:	93fff0ef          	jal	ra,ffffffffc0207edc <vfs_get_bootfs>
ffffffffc02085a2:	dd61                	beqz	a0,ffffffffc020857a <get_device+0xac>
ffffffffc02085a4:	b7f5                	j	ffffffffc0208590 <get_device+0xc2>
ffffffffc02085a6:	00006697          	auipc	a3,0x6
ffffffffc02085aa:	7a268693          	addi	a3,a3,1954 # ffffffffc020ed48 <syscalls+0xcd8>
ffffffffc02085ae:	00003617          	auipc	a2,0x3
ffffffffc02085b2:	79260613          	addi	a2,a2,1938 # ffffffffc020bd40 <commands+0x210>
ffffffffc02085b6:	03900593          	li	a1,57
ffffffffc02085ba:	00006517          	auipc	a0,0x6
ffffffffc02085be:	77650513          	addi	a0,a0,1910 # ffffffffc020ed30 <syscalls+0xcc0>
ffffffffc02085c2:	eddf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02085c6:	00006697          	auipc	a3,0x6
ffffffffc02085ca:	75a68693          	addi	a3,a3,1882 # ffffffffc020ed20 <syscalls+0xcb0>
ffffffffc02085ce:	00003617          	auipc	a2,0x3
ffffffffc02085d2:	77260613          	addi	a2,a2,1906 # ffffffffc020bd40 <commands+0x210>
ffffffffc02085d6:	03300593          	li	a1,51
ffffffffc02085da:	00006517          	auipc	a0,0x6
ffffffffc02085de:	75650513          	addi	a0,a0,1878 # ffffffffc020ed30 <syscalls+0xcc0>
ffffffffc02085e2:	ebdf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02085e6 <vfs_lookup>:
ffffffffc02085e6:	7139                	addi	sp,sp,-64
ffffffffc02085e8:	f426                	sd	s1,40(sp)
ffffffffc02085ea:	0830                	addi	a2,sp,24
ffffffffc02085ec:	84ae                	mv	s1,a1
ffffffffc02085ee:	002c                	addi	a1,sp,8
ffffffffc02085f0:	f822                	sd	s0,48(sp)
ffffffffc02085f2:	fc06                	sd	ra,56(sp)
ffffffffc02085f4:	f04a                	sd	s2,32(sp)
ffffffffc02085f6:	e42a                	sd	a0,8(sp)
ffffffffc02085f8:	ed7ff0ef          	jal	ra,ffffffffc02084ce <get_device>
ffffffffc02085fc:	842a                	mv	s0,a0
ffffffffc02085fe:	ed1d                	bnez	a0,ffffffffc020863c <vfs_lookup+0x56>
ffffffffc0208600:	67a2                	ld	a5,8(sp)
ffffffffc0208602:	6962                	ld	s2,24(sp)
ffffffffc0208604:	0007c783          	lbu	a5,0(a5)
ffffffffc0208608:	c3a9                	beqz	a5,ffffffffc020864a <vfs_lookup+0x64>
ffffffffc020860a:	04090963          	beqz	s2,ffffffffc020865c <vfs_lookup+0x76>
ffffffffc020860e:	07093783          	ld	a5,112(s2)
ffffffffc0208612:	c7a9                	beqz	a5,ffffffffc020865c <vfs_lookup+0x76>
ffffffffc0208614:	7bbc                	ld	a5,112(a5)
ffffffffc0208616:	c3b9                	beqz	a5,ffffffffc020865c <vfs_lookup+0x76>
ffffffffc0208618:	854a                	mv	a0,s2
ffffffffc020861a:	00006597          	auipc	a1,0x6
ffffffffc020861e:	79658593          	addi	a1,a1,1942 # ffffffffc020edb0 <syscalls+0xd40>
ffffffffc0208622:	e06ff0ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0208626:	07093783          	ld	a5,112(s2)
ffffffffc020862a:	65a2                	ld	a1,8(sp)
ffffffffc020862c:	6562                	ld	a0,24(sp)
ffffffffc020862e:	7bbc                	ld	a5,112(a5)
ffffffffc0208630:	8626                	mv	a2,s1
ffffffffc0208632:	9782                	jalr	a5
ffffffffc0208634:	842a                	mv	s0,a0
ffffffffc0208636:	6562                	ld	a0,24(sp)
ffffffffc0208638:	ea6ff0ef          	jal	ra,ffffffffc0207cde <inode_ref_dec>
ffffffffc020863c:	70e2                	ld	ra,56(sp)
ffffffffc020863e:	8522                	mv	a0,s0
ffffffffc0208640:	7442                	ld	s0,48(sp)
ffffffffc0208642:	74a2                	ld	s1,40(sp)
ffffffffc0208644:	7902                	ld	s2,32(sp)
ffffffffc0208646:	6121                	addi	sp,sp,64
ffffffffc0208648:	8082                	ret
ffffffffc020864a:	70e2                	ld	ra,56(sp)
ffffffffc020864c:	8522                	mv	a0,s0
ffffffffc020864e:	7442                	ld	s0,48(sp)
ffffffffc0208650:	0124b023          	sd	s2,0(s1)
ffffffffc0208654:	74a2                	ld	s1,40(sp)
ffffffffc0208656:	7902                	ld	s2,32(sp)
ffffffffc0208658:	6121                	addi	sp,sp,64
ffffffffc020865a:	8082                	ret
ffffffffc020865c:	00006697          	auipc	a3,0x6
ffffffffc0208660:	70468693          	addi	a3,a3,1796 # ffffffffc020ed60 <syscalls+0xcf0>
ffffffffc0208664:	00003617          	auipc	a2,0x3
ffffffffc0208668:	6dc60613          	addi	a2,a2,1756 # ffffffffc020bd40 <commands+0x210>
ffffffffc020866c:	04f00593          	li	a1,79
ffffffffc0208670:	00006517          	auipc	a0,0x6
ffffffffc0208674:	6c050513          	addi	a0,a0,1728 # ffffffffc020ed30 <syscalls+0xcc0>
ffffffffc0208678:	e27f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020867c <vfs_lookup_parent>:
ffffffffc020867c:	7139                	addi	sp,sp,-64
ffffffffc020867e:	f822                	sd	s0,48(sp)
ffffffffc0208680:	f426                	sd	s1,40(sp)
ffffffffc0208682:	842e                	mv	s0,a1
ffffffffc0208684:	84b2                	mv	s1,a2
ffffffffc0208686:	002c                	addi	a1,sp,8
ffffffffc0208688:	0830                	addi	a2,sp,24
ffffffffc020868a:	fc06                	sd	ra,56(sp)
ffffffffc020868c:	e42a                	sd	a0,8(sp)
ffffffffc020868e:	e41ff0ef          	jal	ra,ffffffffc02084ce <get_device>
ffffffffc0208692:	e509                	bnez	a0,ffffffffc020869c <vfs_lookup_parent+0x20>
ffffffffc0208694:	67a2                	ld	a5,8(sp)
ffffffffc0208696:	e09c                	sd	a5,0(s1)
ffffffffc0208698:	67e2                	ld	a5,24(sp)
ffffffffc020869a:	e01c                	sd	a5,0(s0)
ffffffffc020869c:	70e2                	ld	ra,56(sp)
ffffffffc020869e:	7442                	ld	s0,48(sp)
ffffffffc02086a0:	74a2                	ld	s1,40(sp)
ffffffffc02086a2:	6121                	addi	sp,sp,64
ffffffffc02086a4:	8082                	ret

ffffffffc02086a6 <vfs_get_curdir>:
ffffffffc02086a6:	0008e797          	auipc	a5,0x8e
ffffffffc02086aa:	21a7b783          	ld	a5,538(a5) # ffffffffc02968c0 <current>
ffffffffc02086ae:	1487b783          	ld	a5,328(a5)
ffffffffc02086b2:	1101                	addi	sp,sp,-32
ffffffffc02086b4:	e426                	sd	s1,8(sp)
ffffffffc02086b6:	6384                	ld	s1,0(a5)
ffffffffc02086b8:	ec06                	sd	ra,24(sp)
ffffffffc02086ba:	e822                	sd	s0,16(sp)
ffffffffc02086bc:	cc81                	beqz	s1,ffffffffc02086d4 <vfs_get_curdir+0x2e>
ffffffffc02086be:	842a                	mv	s0,a0
ffffffffc02086c0:	8526                	mv	a0,s1
ffffffffc02086c2:	d4eff0ef          	jal	ra,ffffffffc0207c10 <inode_ref_inc>
ffffffffc02086c6:	4501                	li	a0,0
ffffffffc02086c8:	e004                	sd	s1,0(s0)
ffffffffc02086ca:	60e2                	ld	ra,24(sp)
ffffffffc02086cc:	6442                	ld	s0,16(sp)
ffffffffc02086ce:	64a2                	ld	s1,8(sp)
ffffffffc02086d0:	6105                	addi	sp,sp,32
ffffffffc02086d2:	8082                	ret
ffffffffc02086d4:	5541                	li	a0,-16
ffffffffc02086d6:	bfd5                	j	ffffffffc02086ca <vfs_get_curdir+0x24>

ffffffffc02086d8 <vfs_set_curdir>:
ffffffffc02086d8:	7139                	addi	sp,sp,-64
ffffffffc02086da:	f04a                	sd	s2,32(sp)
ffffffffc02086dc:	0008e917          	auipc	s2,0x8e
ffffffffc02086e0:	1e490913          	addi	s2,s2,484 # ffffffffc02968c0 <current>
ffffffffc02086e4:	00093783          	ld	a5,0(s2)
ffffffffc02086e8:	f822                	sd	s0,48(sp)
ffffffffc02086ea:	842a                	mv	s0,a0
ffffffffc02086ec:	1487b503          	ld	a0,328(a5)
ffffffffc02086f0:	ec4e                	sd	s3,24(sp)
ffffffffc02086f2:	fc06                	sd	ra,56(sp)
ffffffffc02086f4:	f426                	sd	s1,40(sp)
ffffffffc02086f6:	c6dfc0ef          	jal	ra,ffffffffc0205362 <lock_files>
ffffffffc02086fa:	00093783          	ld	a5,0(s2)
ffffffffc02086fe:	1487b503          	ld	a0,328(a5)
ffffffffc0208702:	00053983          	ld	s3,0(a0)
ffffffffc0208706:	07340963          	beq	s0,s3,ffffffffc0208778 <vfs_set_curdir+0xa0>
ffffffffc020870a:	cc39                	beqz	s0,ffffffffc0208768 <vfs_set_curdir+0x90>
ffffffffc020870c:	783c                	ld	a5,112(s0)
ffffffffc020870e:	c7bd                	beqz	a5,ffffffffc020877c <vfs_set_curdir+0xa4>
ffffffffc0208710:	6bbc                	ld	a5,80(a5)
ffffffffc0208712:	c7ad                	beqz	a5,ffffffffc020877c <vfs_set_curdir+0xa4>
ffffffffc0208714:	00006597          	auipc	a1,0x6
ffffffffc0208718:	70c58593          	addi	a1,a1,1804 # ffffffffc020ee20 <syscalls+0xdb0>
ffffffffc020871c:	8522                	mv	a0,s0
ffffffffc020871e:	d0aff0ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0208722:	783c                	ld	a5,112(s0)
ffffffffc0208724:	006c                	addi	a1,sp,12
ffffffffc0208726:	8522                	mv	a0,s0
ffffffffc0208728:	6bbc                	ld	a5,80(a5)
ffffffffc020872a:	9782                	jalr	a5
ffffffffc020872c:	84aa                	mv	s1,a0
ffffffffc020872e:	e901                	bnez	a0,ffffffffc020873e <vfs_set_curdir+0x66>
ffffffffc0208730:	47b2                	lw	a5,12(sp)
ffffffffc0208732:	669d                	lui	a3,0x7
ffffffffc0208734:	6709                	lui	a4,0x2
ffffffffc0208736:	8ff5                	and	a5,a5,a3
ffffffffc0208738:	54b9                	li	s1,-18
ffffffffc020873a:	02e78063          	beq	a5,a4,ffffffffc020875a <vfs_set_curdir+0x82>
ffffffffc020873e:	00093783          	ld	a5,0(s2)
ffffffffc0208742:	1487b503          	ld	a0,328(a5)
ffffffffc0208746:	c23fc0ef          	jal	ra,ffffffffc0205368 <unlock_files>
ffffffffc020874a:	70e2                	ld	ra,56(sp)
ffffffffc020874c:	7442                	ld	s0,48(sp)
ffffffffc020874e:	7902                	ld	s2,32(sp)
ffffffffc0208750:	69e2                	ld	s3,24(sp)
ffffffffc0208752:	8526                	mv	a0,s1
ffffffffc0208754:	74a2                	ld	s1,40(sp)
ffffffffc0208756:	6121                	addi	sp,sp,64
ffffffffc0208758:	8082                	ret
ffffffffc020875a:	8522                	mv	a0,s0
ffffffffc020875c:	cb4ff0ef          	jal	ra,ffffffffc0207c10 <inode_ref_inc>
ffffffffc0208760:	00093783          	ld	a5,0(s2)
ffffffffc0208764:	1487b503          	ld	a0,328(a5)
ffffffffc0208768:	e100                	sd	s0,0(a0)
ffffffffc020876a:	4481                	li	s1,0
ffffffffc020876c:	fc098de3          	beqz	s3,ffffffffc0208746 <vfs_set_curdir+0x6e>
ffffffffc0208770:	854e                	mv	a0,s3
ffffffffc0208772:	d6cff0ef          	jal	ra,ffffffffc0207cde <inode_ref_dec>
ffffffffc0208776:	b7e1                	j	ffffffffc020873e <vfs_set_curdir+0x66>
ffffffffc0208778:	4481                	li	s1,0
ffffffffc020877a:	b7f1                	j	ffffffffc0208746 <vfs_set_curdir+0x6e>
ffffffffc020877c:	00006697          	auipc	a3,0x6
ffffffffc0208780:	63c68693          	addi	a3,a3,1596 # ffffffffc020edb8 <syscalls+0xd48>
ffffffffc0208784:	00003617          	auipc	a2,0x3
ffffffffc0208788:	5bc60613          	addi	a2,a2,1468 # ffffffffc020bd40 <commands+0x210>
ffffffffc020878c:	04300593          	li	a1,67
ffffffffc0208790:	00006517          	auipc	a0,0x6
ffffffffc0208794:	67850513          	addi	a0,a0,1656 # ffffffffc020ee08 <syscalls+0xd98>
ffffffffc0208798:	d07f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020879c <vfs_chdir>:
ffffffffc020879c:	1101                	addi	sp,sp,-32
ffffffffc020879e:	002c                	addi	a1,sp,8
ffffffffc02087a0:	e822                	sd	s0,16(sp)
ffffffffc02087a2:	ec06                	sd	ra,24(sp)
ffffffffc02087a4:	e43ff0ef          	jal	ra,ffffffffc02085e6 <vfs_lookup>
ffffffffc02087a8:	842a                	mv	s0,a0
ffffffffc02087aa:	c511                	beqz	a0,ffffffffc02087b6 <vfs_chdir+0x1a>
ffffffffc02087ac:	60e2                	ld	ra,24(sp)
ffffffffc02087ae:	8522                	mv	a0,s0
ffffffffc02087b0:	6442                	ld	s0,16(sp)
ffffffffc02087b2:	6105                	addi	sp,sp,32
ffffffffc02087b4:	8082                	ret
ffffffffc02087b6:	6522                	ld	a0,8(sp)
ffffffffc02087b8:	f21ff0ef          	jal	ra,ffffffffc02086d8 <vfs_set_curdir>
ffffffffc02087bc:	842a                	mv	s0,a0
ffffffffc02087be:	6522                	ld	a0,8(sp)
ffffffffc02087c0:	d1eff0ef          	jal	ra,ffffffffc0207cde <inode_ref_dec>
ffffffffc02087c4:	60e2                	ld	ra,24(sp)
ffffffffc02087c6:	8522                	mv	a0,s0
ffffffffc02087c8:	6442                	ld	s0,16(sp)
ffffffffc02087ca:	6105                	addi	sp,sp,32
ffffffffc02087cc:	8082                	ret

ffffffffc02087ce <vfs_getcwd>:
ffffffffc02087ce:	0008e797          	auipc	a5,0x8e
ffffffffc02087d2:	0f27b783          	ld	a5,242(a5) # ffffffffc02968c0 <current>
ffffffffc02087d6:	1487b783          	ld	a5,328(a5)
ffffffffc02087da:	7179                	addi	sp,sp,-48
ffffffffc02087dc:	ec26                	sd	s1,24(sp)
ffffffffc02087de:	6384                	ld	s1,0(a5)
ffffffffc02087e0:	f406                	sd	ra,40(sp)
ffffffffc02087e2:	f022                	sd	s0,32(sp)
ffffffffc02087e4:	e84a                	sd	s2,16(sp)
ffffffffc02087e6:	ccbd                	beqz	s1,ffffffffc0208864 <vfs_getcwd+0x96>
ffffffffc02087e8:	892a                	mv	s2,a0
ffffffffc02087ea:	8526                	mv	a0,s1
ffffffffc02087ec:	c24ff0ef          	jal	ra,ffffffffc0207c10 <inode_ref_inc>
ffffffffc02087f0:	74a8                	ld	a0,104(s1)
ffffffffc02087f2:	c93d                	beqz	a0,ffffffffc0208868 <vfs_getcwd+0x9a>
ffffffffc02087f4:	9b3ff0ef          	jal	ra,ffffffffc02081a6 <vfs_get_devname>
ffffffffc02087f8:	842a                	mv	s0,a0
ffffffffc02087fa:	7bf020ef          	jal	ra,ffffffffc020b7b8 <strlen>
ffffffffc02087fe:	862a                	mv	a2,a0
ffffffffc0208800:	85a2                	mv	a1,s0
ffffffffc0208802:	4701                	li	a4,0
ffffffffc0208804:	4685                	li	a3,1
ffffffffc0208806:	854a                	mv	a0,s2
ffffffffc0208808:	d19fc0ef          	jal	ra,ffffffffc0205520 <iobuf_move>
ffffffffc020880c:	842a                	mv	s0,a0
ffffffffc020880e:	c919                	beqz	a0,ffffffffc0208824 <vfs_getcwd+0x56>
ffffffffc0208810:	8526                	mv	a0,s1
ffffffffc0208812:	cccff0ef          	jal	ra,ffffffffc0207cde <inode_ref_dec>
ffffffffc0208816:	70a2                	ld	ra,40(sp)
ffffffffc0208818:	8522                	mv	a0,s0
ffffffffc020881a:	7402                	ld	s0,32(sp)
ffffffffc020881c:	64e2                	ld	s1,24(sp)
ffffffffc020881e:	6942                	ld	s2,16(sp)
ffffffffc0208820:	6145                	addi	sp,sp,48
ffffffffc0208822:	8082                	ret
ffffffffc0208824:	03a00793          	li	a5,58
ffffffffc0208828:	4701                	li	a4,0
ffffffffc020882a:	4685                	li	a3,1
ffffffffc020882c:	4605                	li	a2,1
ffffffffc020882e:	00f10593          	addi	a1,sp,15
ffffffffc0208832:	854a                	mv	a0,s2
ffffffffc0208834:	00f107a3          	sb	a5,15(sp)
ffffffffc0208838:	ce9fc0ef          	jal	ra,ffffffffc0205520 <iobuf_move>
ffffffffc020883c:	842a                	mv	s0,a0
ffffffffc020883e:	f969                	bnez	a0,ffffffffc0208810 <vfs_getcwd+0x42>
ffffffffc0208840:	78bc                	ld	a5,112(s1)
ffffffffc0208842:	c3b9                	beqz	a5,ffffffffc0208888 <vfs_getcwd+0xba>
ffffffffc0208844:	7f9c                	ld	a5,56(a5)
ffffffffc0208846:	c3a9                	beqz	a5,ffffffffc0208888 <vfs_getcwd+0xba>
ffffffffc0208848:	00006597          	auipc	a1,0x6
ffffffffc020884c:	63858593          	addi	a1,a1,1592 # ffffffffc020ee80 <syscalls+0xe10>
ffffffffc0208850:	8526                	mv	a0,s1
ffffffffc0208852:	bd6ff0ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0208856:	78bc                	ld	a5,112(s1)
ffffffffc0208858:	85ca                	mv	a1,s2
ffffffffc020885a:	8526                	mv	a0,s1
ffffffffc020885c:	7f9c                	ld	a5,56(a5)
ffffffffc020885e:	9782                	jalr	a5
ffffffffc0208860:	842a                	mv	s0,a0
ffffffffc0208862:	b77d                	j	ffffffffc0208810 <vfs_getcwd+0x42>
ffffffffc0208864:	5441                	li	s0,-16
ffffffffc0208866:	bf45                	j	ffffffffc0208816 <vfs_getcwd+0x48>
ffffffffc0208868:	00006697          	auipc	a3,0x6
ffffffffc020886c:	4e068693          	addi	a3,a3,1248 # ffffffffc020ed48 <syscalls+0xcd8>
ffffffffc0208870:	00003617          	auipc	a2,0x3
ffffffffc0208874:	4d060613          	addi	a2,a2,1232 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208878:	06e00593          	li	a1,110
ffffffffc020887c:	00006517          	auipc	a0,0x6
ffffffffc0208880:	58c50513          	addi	a0,a0,1420 # ffffffffc020ee08 <syscalls+0xd98>
ffffffffc0208884:	c1bf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208888:	00006697          	auipc	a3,0x6
ffffffffc020888c:	5a068693          	addi	a3,a3,1440 # ffffffffc020ee28 <syscalls+0xdb8>
ffffffffc0208890:	00003617          	auipc	a2,0x3
ffffffffc0208894:	4b060613          	addi	a2,a2,1200 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208898:	07800593          	li	a1,120
ffffffffc020889c:	00006517          	auipc	a0,0x6
ffffffffc02088a0:	56c50513          	addi	a0,a0,1388 # ffffffffc020ee08 <syscalls+0xd98>
ffffffffc02088a4:	bfbf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02088a8 <dev_lookup>:
ffffffffc02088a8:	0005c783          	lbu	a5,0(a1)
ffffffffc02088ac:	e385                	bnez	a5,ffffffffc02088cc <dev_lookup+0x24>
ffffffffc02088ae:	1101                	addi	sp,sp,-32
ffffffffc02088b0:	e822                	sd	s0,16(sp)
ffffffffc02088b2:	e426                	sd	s1,8(sp)
ffffffffc02088b4:	ec06                	sd	ra,24(sp)
ffffffffc02088b6:	84aa                	mv	s1,a0
ffffffffc02088b8:	8432                	mv	s0,a2
ffffffffc02088ba:	b56ff0ef          	jal	ra,ffffffffc0207c10 <inode_ref_inc>
ffffffffc02088be:	60e2                	ld	ra,24(sp)
ffffffffc02088c0:	e004                	sd	s1,0(s0)
ffffffffc02088c2:	6442                	ld	s0,16(sp)
ffffffffc02088c4:	64a2                	ld	s1,8(sp)
ffffffffc02088c6:	4501                	li	a0,0
ffffffffc02088c8:	6105                	addi	sp,sp,32
ffffffffc02088ca:	8082                	ret
ffffffffc02088cc:	5541                	li	a0,-16
ffffffffc02088ce:	8082                	ret

ffffffffc02088d0 <dev_fstat>:
ffffffffc02088d0:	1101                	addi	sp,sp,-32
ffffffffc02088d2:	e426                	sd	s1,8(sp)
ffffffffc02088d4:	84ae                	mv	s1,a1
ffffffffc02088d6:	e822                	sd	s0,16(sp)
ffffffffc02088d8:	02000613          	li	a2,32
ffffffffc02088dc:	842a                	mv	s0,a0
ffffffffc02088de:	4581                	li	a1,0
ffffffffc02088e0:	8526                	mv	a0,s1
ffffffffc02088e2:	ec06                	sd	ra,24(sp)
ffffffffc02088e4:	777020ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc02088e8:	c429                	beqz	s0,ffffffffc0208932 <dev_fstat+0x62>
ffffffffc02088ea:	783c                	ld	a5,112(s0)
ffffffffc02088ec:	c3b9                	beqz	a5,ffffffffc0208932 <dev_fstat+0x62>
ffffffffc02088ee:	6bbc                	ld	a5,80(a5)
ffffffffc02088f0:	c3a9                	beqz	a5,ffffffffc0208932 <dev_fstat+0x62>
ffffffffc02088f2:	00006597          	auipc	a1,0x6
ffffffffc02088f6:	52e58593          	addi	a1,a1,1326 # ffffffffc020ee20 <syscalls+0xdb0>
ffffffffc02088fa:	8522                	mv	a0,s0
ffffffffc02088fc:	b2cff0ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0208900:	783c                	ld	a5,112(s0)
ffffffffc0208902:	85a6                	mv	a1,s1
ffffffffc0208904:	8522                	mv	a0,s0
ffffffffc0208906:	6bbc                	ld	a5,80(a5)
ffffffffc0208908:	9782                	jalr	a5
ffffffffc020890a:	ed19                	bnez	a0,ffffffffc0208928 <dev_fstat+0x58>
ffffffffc020890c:	4c38                	lw	a4,88(s0)
ffffffffc020890e:	6785                	lui	a5,0x1
ffffffffc0208910:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208914:	02f71f63          	bne	a4,a5,ffffffffc0208952 <dev_fstat+0x82>
ffffffffc0208918:	6018                	ld	a4,0(s0)
ffffffffc020891a:	641c                	ld	a5,8(s0)
ffffffffc020891c:	4685                	li	a3,1
ffffffffc020891e:	e494                	sd	a3,8(s1)
ffffffffc0208920:	02e787b3          	mul	a5,a5,a4
ffffffffc0208924:	e898                	sd	a4,16(s1)
ffffffffc0208926:	ec9c                	sd	a5,24(s1)
ffffffffc0208928:	60e2                	ld	ra,24(sp)
ffffffffc020892a:	6442                	ld	s0,16(sp)
ffffffffc020892c:	64a2                	ld	s1,8(sp)
ffffffffc020892e:	6105                	addi	sp,sp,32
ffffffffc0208930:	8082                	ret
ffffffffc0208932:	00006697          	auipc	a3,0x6
ffffffffc0208936:	48668693          	addi	a3,a3,1158 # ffffffffc020edb8 <syscalls+0xd48>
ffffffffc020893a:	00003617          	auipc	a2,0x3
ffffffffc020893e:	40660613          	addi	a2,a2,1030 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208942:	04200593          	li	a1,66
ffffffffc0208946:	00006517          	auipc	a0,0x6
ffffffffc020894a:	54a50513          	addi	a0,a0,1354 # ffffffffc020ee90 <syscalls+0xe20>
ffffffffc020894e:	b51f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208952:	00006697          	auipc	a3,0x6
ffffffffc0208956:	22e68693          	addi	a3,a3,558 # ffffffffc020eb80 <syscalls+0xb10>
ffffffffc020895a:	00003617          	auipc	a2,0x3
ffffffffc020895e:	3e660613          	addi	a2,a2,998 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208962:	04500593          	li	a1,69
ffffffffc0208966:	00006517          	auipc	a0,0x6
ffffffffc020896a:	52a50513          	addi	a0,a0,1322 # ffffffffc020ee90 <syscalls+0xe20>
ffffffffc020896e:	b31f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208972 <dev_ioctl>:
ffffffffc0208972:	c909                	beqz	a0,ffffffffc0208984 <dev_ioctl+0x12>
ffffffffc0208974:	4d34                	lw	a3,88(a0)
ffffffffc0208976:	6705                	lui	a4,0x1
ffffffffc0208978:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020897c:	00e69463          	bne	a3,a4,ffffffffc0208984 <dev_ioctl+0x12>
ffffffffc0208980:	751c                	ld	a5,40(a0)
ffffffffc0208982:	8782                	jr	a5
ffffffffc0208984:	1141                	addi	sp,sp,-16
ffffffffc0208986:	00006697          	auipc	a3,0x6
ffffffffc020898a:	1fa68693          	addi	a3,a3,506 # ffffffffc020eb80 <syscalls+0xb10>
ffffffffc020898e:	00003617          	auipc	a2,0x3
ffffffffc0208992:	3b260613          	addi	a2,a2,946 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208996:	03500593          	li	a1,53
ffffffffc020899a:	00006517          	auipc	a0,0x6
ffffffffc020899e:	4f650513          	addi	a0,a0,1270 # ffffffffc020ee90 <syscalls+0xe20>
ffffffffc02089a2:	e406                	sd	ra,8(sp)
ffffffffc02089a4:	afbf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02089a8 <dev_tryseek>:
ffffffffc02089a8:	c51d                	beqz	a0,ffffffffc02089d6 <dev_tryseek+0x2e>
ffffffffc02089aa:	4d38                	lw	a4,88(a0)
ffffffffc02089ac:	6785                	lui	a5,0x1
ffffffffc02089ae:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02089b2:	02f71263          	bne	a4,a5,ffffffffc02089d6 <dev_tryseek+0x2e>
ffffffffc02089b6:	611c                	ld	a5,0(a0)
ffffffffc02089b8:	cf89                	beqz	a5,ffffffffc02089d2 <dev_tryseek+0x2a>
ffffffffc02089ba:	6518                	ld	a4,8(a0)
ffffffffc02089bc:	02e5f6b3          	remu	a3,a1,a4
ffffffffc02089c0:	ea89                	bnez	a3,ffffffffc02089d2 <dev_tryseek+0x2a>
ffffffffc02089c2:	0005c863          	bltz	a1,ffffffffc02089d2 <dev_tryseek+0x2a>
ffffffffc02089c6:	02e787b3          	mul	a5,a5,a4
ffffffffc02089ca:	00f5f463          	bgeu	a1,a5,ffffffffc02089d2 <dev_tryseek+0x2a>
ffffffffc02089ce:	4501                	li	a0,0
ffffffffc02089d0:	8082                	ret
ffffffffc02089d2:	5575                	li	a0,-3
ffffffffc02089d4:	8082                	ret
ffffffffc02089d6:	1141                	addi	sp,sp,-16
ffffffffc02089d8:	00006697          	auipc	a3,0x6
ffffffffc02089dc:	1a868693          	addi	a3,a3,424 # ffffffffc020eb80 <syscalls+0xb10>
ffffffffc02089e0:	00003617          	auipc	a2,0x3
ffffffffc02089e4:	36060613          	addi	a2,a2,864 # ffffffffc020bd40 <commands+0x210>
ffffffffc02089e8:	05f00593          	li	a1,95
ffffffffc02089ec:	00006517          	auipc	a0,0x6
ffffffffc02089f0:	4a450513          	addi	a0,a0,1188 # ffffffffc020ee90 <syscalls+0xe20>
ffffffffc02089f4:	e406                	sd	ra,8(sp)
ffffffffc02089f6:	aa9f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02089fa <dev_gettype>:
ffffffffc02089fa:	c10d                	beqz	a0,ffffffffc0208a1c <dev_gettype+0x22>
ffffffffc02089fc:	4d38                	lw	a4,88(a0)
ffffffffc02089fe:	6785                	lui	a5,0x1
ffffffffc0208a00:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208a04:	00f71c63          	bne	a4,a5,ffffffffc0208a1c <dev_gettype+0x22>
ffffffffc0208a08:	6118                	ld	a4,0(a0)
ffffffffc0208a0a:	6795                	lui	a5,0x5
ffffffffc0208a0c:	c701                	beqz	a4,ffffffffc0208a14 <dev_gettype+0x1a>
ffffffffc0208a0e:	c19c                	sw	a5,0(a1)
ffffffffc0208a10:	4501                	li	a0,0
ffffffffc0208a12:	8082                	ret
ffffffffc0208a14:	6791                	lui	a5,0x4
ffffffffc0208a16:	c19c                	sw	a5,0(a1)
ffffffffc0208a18:	4501                	li	a0,0
ffffffffc0208a1a:	8082                	ret
ffffffffc0208a1c:	1141                	addi	sp,sp,-16
ffffffffc0208a1e:	00006697          	auipc	a3,0x6
ffffffffc0208a22:	16268693          	addi	a3,a3,354 # ffffffffc020eb80 <syscalls+0xb10>
ffffffffc0208a26:	00003617          	auipc	a2,0x3
ffffffffc0208a2a:	31a60613          	addi	a2,a2,794 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208a2e:	05300593          	li	a1,83
ffffffffc0208a32:	00006517          	auipc	a0,0x6
ffffffffc0208a36:	45e50513          	addi	a0,a0,1118 # ffffffffc020ee90 <syscalls+0xe20>
ffffffffc0208a3a:	e406                	sd	ra,8(sp)
ffffffffc0208a3c:	a63f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208a40 <dev_write>:
ffffffffc0208a40:	c911                	beqz	a0,ffffffffc0208a54 <dev_write+0x14>
ffffffffc0208a42:	4d34                	lw	a3,88(a0)
ffffffffc0208a44:	6705                	lui	a4,0x1
ffffffffc0208a46:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208a4a:	00e69563          	bne	a3,a4,ffffffffc0208a54 <dev_write+0x14>
ffffffffc0208a4e:	711c                	ld	a5,32(a0)
ffffffffc0208a50:	4605                	li	a2,1
ffffffffc0208a52:	8782                	jr	a5
ffffffffc0208a54:	1141                	addi	sp,sp,-16
ffffffffc0208a56:	00006697          	auipc	a3,0x6
ffffffffc0208a5a:	12a68693          	addi	a3,a3,298 # ffffffffc020eb80 <syscalls+0xb10>
ffffffffc0208a5e:	00003617          	auipc	a2,0x3
ffffffffc0208a62:	2e260613          	addi	a2,a2,738 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208a66:	02c00593          	li	a1,44
ffffffffc0208a6a:	00006517          	auipc	a0,0x6
ffffffffc0208a6e:	42650513          	addi	a0,a0,1062 # ffffffffc020ee90 <syscalls+0xe20>
ffffffffc0208a72:	e406                	sd	ra,8(sp)
ffffffffc0208a74:	a2bf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208a78 <dev_read>:
ffffffffc0208a78:	c911                	beqz	a0,ffffffffc0208a8c <dev_read+0x14>
ffffffffc0208a7a:	4d34                	lw	a3,88(a0)
ffffffffc0208a7c:	6705                	lui	a4,0x1
ffffffffc0208a7e:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208a82:	00e69563          	bne	a3,a4,ffffffffc0208a8c <dev_read+0x14>
ffffffffc0208a86:	711c                	ld	a5,32(a0)
ffffffffc0208a88:	4601                	li	a2,0
ffffffffc0208a8a:	8782                	jr	a5
ffffffffc0208a8c:	1141                	addi	sp,sp,-16
ffffffffc0208a8e:	00006697          	auipc	a3,0x6
ffffffffc0208a92:	0f268693          	addi	a3,a3,242 # ffffffffc020eb80 <syscalls+0xb10>
ffffffffc0208a96:	00003617          	auipc	a2,0x3
ffffffffc0208a9a:	2aa60613          	addi	a2,a2,682 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208a9e:	02300593          	li	a1,35
ffffffffc0208aa2:	00006517          	auipc	a0,0x6
ffffffffc0208aa6:	3ee50513          	addi	a0,a0,1006 # ffffffffc020ee90 <syscalls+0xe20>
ffffffffc0208aaa:	e406                	sd	ra,8(sp)
ffffffffc0208aac:	9f3f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208ab0 <dev_close>:
ffffffffc0208ab0:	c909                	beqz	a0,ffffffffc0208ac2 <dev_close+0x12>
ffffffffc0208ab2:	4d34                	lw	a3,88(a0)
ffffffffc0208ab4:	6705                	lui	a4,0x1
ffffffffc0208ab6:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208aba:	00e69463          	bne	a3,a4,ffffffffc0208ac2 <dev_close+0x12>
ffffffffc0208abe:	6d1c                	ld	a5,24(a0)
ffffffffc0208ac0:	8782                	jr	a5
ffffffffc0208ac2:	1141                	addi	sp,sp,-16
ffffffffc0208ac4:	00006697          	auipc	a3,0x6
ffffffffc0208ac8:	0bc68693          	addi	a3,a3,188 # ffffffffc020eb80 <syscalls+0xb10>
ffffffffc0208acc:	00003617          	auipc	a2,0x3
ffffffffc0208ad0:	27460613          	addi	a2,a2,628 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208ad4:	45e9                	li	a1,26
ffffffffc0208ad6:	00006517          	auipc	a0,0x6
ffffffffc0208ada:	3ba50513          	addi	a0,a0,954 # ffffffffc020ee90 <syscalls+0xe20>
ffffffffc0208ade:	e406                	sd	ra,8(sp)
ffffffffc0208ae0:	9bff70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208ae4 <dev_open>:
ffffffffc0208ae4:	03c5f713          	andi	a4,a1,60
ffffffffc0208ae8:	eb11                	bnez	a4,ffffffffc0208afc <dev_open+0x18>
ffffffffc0208aea:	c919                	beqz	a0,ffffffffc0208b00 <dev_open+0x1c>
ffffffffc0208aec:	4d34                	lw	a3,88(a0)
ffffffffc0208aee:	6705                	lui	a4,0x1
ffffffffc0208af0:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208af4:	00e69663          	bne	a3,a4,ffffffffc0208b00 <dev_open+0x1c>
ffffffffc0208af8:	691c                	ld	a5,16(a0)
ffffffffc0208afa:	8782                	jr	a5
ffffffffc0208afc:	5575                	li	a0,-3
ffffffffc0208afe:	8082                	ret
ffffffffc0208b00:	1141                	addi	sp,sp,-16
ffffffffc0208b02:	00006697          	auipc	a3,0x6
ffffffffc0208b06:	07e68693          	addi	a3,a3,126 # ffffffffc020eb80 <syscalls+0xb10>
ffffffffc0208b0a:	00003617          	auipc	a2,0x3
ffffffffc0208b0e:	23660613          	addi	a2,a2,566 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208b12:	45c5                	li	a1,17
ffffffffc0208b14:	00006517          	auipc	a0,0x6
ffffffffc0208b18:	37c50513          	addi	a0,a0,892 # ffffffffc020ee90 <syscalls+0xe20>
ffffffffc0208b1c:	e406                	sd	ra,8(sp)
ffffffffc0208b1e:	981f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208b22 <dev_init>:
ffffffffc0208b22:	1141                	addi	sp,sp,-16
ffffffffc0208b24:	e406                	sd	ra,8(sp)
ffffffffc0208b26:	542000ef          	jal	ra,ffffffffc0209068 <dev_init_stdin>
ffffffffc0208b2a:	65a000ef          	jal	ra,ffffffffc0209184 <dev_init_stdout>
ffffffffc0208b2e:	60a2                	ld	ra,8(sp)
ffffffffc0208b30:	0141                	addi	sp,sp,16
ffffffffc0208b32:	a439                	j	ffffffffc0208d40 <dev_init_disk0>

ffffffffc0208b34 <dev_create_inode>:
ffffffffc0208b34:	6505                	lui	a0,0x1
ffffffffc0208b36:	1141                	addi	sp,sp,-16
ffffffffc0208b38:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208b3c:	e022                	sd	s0,0(sp)
ffffffffc0208b3e:	e406                	sd	ra,8(sp)
ffffffffc0208b40:	852ff0ef          	jal	ra,ffffffffc0207b92 <__alloc_inode>
ffffffffc0208b44:	842a                	mv	s0,a0
ffffffffc0208b46:	c901                	beqz	a0,ffffffffc0208b56 <dev_create_inode+0x22>
ffffffffc0208b48:	4601                	li	a2,0
ffffffffc0208b4a:	00006597          	auipc	a1,0x6
ffffffffc0208b4e:	35e58593          	addi	a1,a1,862 # ffffffffc020eea8 <dev_node_ops>
ffffffffc0208b52:	85cff0ef          	jal	ra,ffffffffc0207bae <inode_init>
ffffffffc0208b56:	60a2                	ld	ra,8(sp)
ffffffffc0208b58:	8522                	mv	a0,s0
ffffffffc0208b5a:	6402                	ld	s0,0(sp)
ffffffffc0208b5c:	0141                	addi	sp,sp,16
ffffffffc0208b5e:	8082                	ret

ffffffffc0208b60 <disk0_open>:
ffffffffc0208b60:	4501                	li	a0,0
ffffffffc0208b62:	8082                	ret

ffffffffc0208b64 <disk0_close>:
ffffffffc0208b64:	4501                	li	a0,0
ffffffffc0208b66:	8082                	ret

ffffffffc0208b68 <disk0_ioctl>:
ffffffffc0208b68:	5531                	li	a0,-20
ffffffffc0208b6a:	8082                	ret

ffffffffc0208b6c <disk0_io>:
ffffffffc0208b6c:	659c                	ld	a5,8(a1)
ffffffffc0208b6e:	7159                	addi	sp,sp,-112
ffffffffc0208b70:	eca6                	sd	s1,88(sp)
ffffffffc0208b72:	f45e                	sd	s7,40(sp)
ffffffffc0208b74:	6d84                	ld	s1,24(a1)
ffffffffc0208b76:	6b85                	lui	s7,0x1
ffffffffc0208b78:	1bfd                	addi	s7,s7,-1
ffffffffc0208b7a:	e4ce                	sd	s3,72(sp)
ffffffffc0208b7c:	43f7d993          	srai	s3,a5,0x3f
ffffffffc0208b80:	0179f9b3          	and	s3,s3,s7
ffffffffc0208b84:	99be                	add	s3,s3,a5
ffffffffc0208b86:	8fc5                	or	a5,a5,s1
ffffffffc0208b88:	f486                	sd	ra,104(sp)
ffffffffc0208b8a:	f0a2                	sd	s0,96(sp)
ffffffffc0208b8c:	e8ca                	sd	s2,80(sp)
ffffffffc0208b8e:	e0d2                	sd	s4,64(sp)
ffffffffc0208b90:	fc56                	sd	s5,56(sp)
ffffffffc0208b92:	f85a                	sd	s6,48(sp)
ffffffffc0208b94:	f062                	sd	s8,32(sp)
ffffffffc0208b96:	ec66                	sd	s9,24(sp)
ffffffffc0208b98:	e86a                	sd	s10,16(sp)
ffffffffc0208b9a:	0177f7b3          	and	a5,a5,s7
ffffffffc0208b9e:	10079d63          	bnez	a5,ffffffffc0208cb8 <disk0_io+0x14c>
ffffffffc0208ba2:	40c9d993          	srai	s3,s3,0xc
ffffffffc0208ba6:	00c4d713          	srli	a4,s1,0xc
ffffffffc0208baa:	2981                	sext.w	s3,s3
ffffffffc0208bac:	2701                	sext.w	a4,a4
ffffffffc0208bae:	00e987bb          	addw	a5,s3,a4
ffffffffc0208bb2:	6114                	ld	a3,0(a0)
ffffffffc0208bb4:	1782                	slli	a5,a5,0x20
ffffffffc0208bb6:	9381                	srli	a5,a5,0x20
ffffffffc0208bb8:	10f6e063          	bltu	a3,a5,ffffffffc0208cb8 <disk0_io+0x14c>
ffffffffc0208bbc:	4501                	li	a0,0
ffffffffc0208bbe:	ef19                	bnez	a4,ffffffffc0208bdc <disk0_io+0x70>
ffffffffc0208bc0:	70a6                	ld	ra,104(sp)
ffffffffc0208bc2:	7406                	ld	s0,96(sp)
ffffffffc0208bc4:	64e6                	ld	s1,88(sp)
ffffffffc0208bc6:	6946                	ld	s2,80(sp)
ffffffffc0208bc8:	69a6                	ld	s3,72(sp)
ffffffffc0208bca:	6a06                	ld	s4,64(sp)
ffffffffc0208bcc:	7ae2                	ld	s5,56(sp)
ffffffffc0208bce:	7b42                	ld	s6,48(sp)
ffffffffc0208bd0:	7ba2                	ld	s7,40(sp)
ffffffffc0208bd2:	7c02                	ld	s8,32(sp)
ffffffffc0208bd4:	6ce2                	ld	s9,24(sp)
ffffffffc0208bd6:	6d42                	ld	s10,16(sp)
ffffffffc0208bd8:	6165                	addi	sp,sp,112
ffffffffc0208bda:	8082                	ret
ffffffffc0208bdc:	0008d517          	auipc	a0,0x8d
ffffffffc0208be0:	c6450513          	addi	a0,a0,-924 # ffffffffc0295840 <disk0_sem>
ffffffffc0208be4:	8b2e                	mv	s6,a1
ffffffffc0208be6:	8c32                	mv	s8,a2
ffffffffc0208be8:	0008ea97          	auipc	s5,0x8e
ffffffffc0208bec:	d10a8a93          	addi	s5,s5,-752 # ffffffffc02968f8 <disk0_buffer>
ffffffffc0208bf0:	b15fb0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc0208bf4:	6c91                	lui	s9,0x4
ffffffffc0208bf6:	e4b9                	bnez	s1,ffffffffc0208c44 <disk0_io+0xd8>
ffffffffc0208bf8:	a845                	j	ffffffffc0208ca8 <disk0_io+0x13c>
ffffffffc0208bfa:	00c4d413          	srli	s0,s1,0xc
ffffffffc0208bfe:	0034169b          	slliw	a3,s0,0x3
ffffffffc0208c02:	00068d1b          	sext.w	s10,a3
ffffffffc0208c06:	1682                	slli	a3,a3,0x20
ffffffffc0208c08:	2401                	sext.w	s0,s0
ffffffffc0208c0a:	9281                	srli	a3,a3,0x20
ffffffffc0208c0c:	8926                	mv	s2,s1
ffffffffc0208c0e:	00399a1b          	slliw	s4,s3,0x3
ffffffffc0208c12:	862e                	mv	a2,a1
ffffffffc0208c14:	4509                	li	a0,2
ffffffffc0208c16:	85d2                	mv	a1,s4
ffffffffc0208c18:	f29f70ef          	jal	ra,ffffffffc0200b40 <ide_read_secs>
ffffffffc0208c1c:	e165                	bnez	a0,ffffffffc0208cfc <disk0_io+0x190>
ffffffffc0208c1e:	000ab583          	ld	a1,0(s5)
ffffffffc0208c22:	0038                	addi	a4,sp,8
ffffffffc0208c24:	4685                	li	a3,1
ffffffffc0208c26:	864a                	mv	a2,s2
ffffffffc0208c28:	855a                	mv	a0,s6
ffffffffc0208c2a:	8f7fc0ef          	jal	ra,ffffffffc0205520 <iobuf_move>
ffffffffc0208c2e:	67a2                	ld	a5,8(sp)
ffffffffc0208c30:	09279663          	bne	a5,s2,ffffffffc0208cbc <disk0_io+0x150>
ffffffffc0208c34:	017977b3          	and	a5,s2,s7
ffffffffc0208c38:	e3d1                	bnez	a5,ffffffffc0208cbc <disk0_io+0x150>
ffffffffc0208c3a:	412484b3          	sub	s1,s1,s2
ffffffffc0208c3e:	013409bb          	addw	s3,s0,s3
ffffffffc0208c42:	c0bd                	beqz	s1,ffffffffc0208ca8 <disk0_io+0x13c>
ffffffffc0208c44:	000ab583          	ld	a1,0(s5)
ffffffffc0208c48:	000c1b63          	bnez	s8,ffffffffc0208c5e <disk0_io+0xf2>
ffffffffc0208c4c:	fb94e7e3          	bltu	s1,s9,ffffffffc0208bfa <disk0_io+0x8e>
ffffffffc0208c50:	02000693          	li	a3,32
ffffffffc0208c54:	02000d13          	li	s10,32
ffffffffc0208c58:	4411                	li	s0,4
ffffffffc0208c5a:	6911                	lui	s2,0x4
ffffffffc0208c5c:	bf4d                	j	ffffffffc0208c0e <disk0_io+0xa2>
ffffffffc0208c5e:	0038                	addi	a4,sp,8
ffffffffc0208c60:	4681                	li	a3,0
ffffffffc0208c62:	6611                	lui	a2,0x4
ffffffffc0208c64:	855a                	mv	a0,s6
ffffffffc0208c66:	8bbfc0ef          	jal	ra,ffffffffc0205520 <iobuf_move>
ffffffffc0208c6a:	6422                	ld	s0,8(sp)
ffffffffc0208c6c:	c825                	beqz	s0,ffffffffc0208cdc <disk0_io+0x170>
ffffffffc0208c6e:	0684e763          	bltu	s1,s0,ffffffffc0208cdc <disk0_io+0x170>
ffffffffc0208c72:	017477b3          	and	a5,s0,s7
ffffffffc0208c76:	e3bd                	bnez	a5,ffffffffc0208cdc <disk0_io+0x170>
ffffffffc0208c78:	8031                	srli	s0,s0,0xc
ffffffffc0208c7a:	0034179b          	slliw	a5,s0,0x3
ffffffffc0208c7e:	000ab603          	ld	a2,0(s5)
ffffffffc0208c82:	0039991b          	slliw	s2,s3,0x3
ffffffffc0208c86:	02079693          	slli	a3,a5,0x20
ffffffffc0208c8a:	9281                	srli	a3,a3,0x20
ffffffffc0208c8c:	85ca                	mv	a1,s2
ffffffffc0208c8e:	4509                	li	a0,2
ffffffffc0208c90:	2401                	sext.w	s0,s0
ffffffffc0208c92:	00078a1b          	sext.w	s4,a5
ffffffffc0208c96:	f41f70ef          	jal	ra,ffffffffc0200bd6 <ide_write_secs>
ffffffffc0208c9a:	e151                	bnez	a0,ffffffffc0208d1e <disk0_io+0x1b2>
ffffffffc0208c9c:	6922                	ld	s2,8(sp)
ffffffffc0208c9e:	013409bb          	addw	s3,s0,s3
ffffffffc0208ca2:	412484b3          	sub	s1,s1,s2
ffffffffc0208ca6:	fcd9                	bnez	s1,ffffffffc0208c44 <disk0_io+0xd8>
ffffffffc0208ca8:	0008d517          	auipc	a0,0x8d
ffffffffc0208cac:	b9850513          	addi	a0,a0,-1128 # ffffffffc0295840 <disk0_sem>
ffffffffc0208cb0:	a51fb0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0208cb4:	4501                	li	a0,0
ffffffffc0208cb6:	b729                	j	ffffffffc0208bc0 <disk0_io+0x54>
ffffffffc0208cb8:	5575                	li	a0,-3
ffffffffc0208cba:	b719                	j	ffffffffc0208bc0 <disk0_io+0x54>
ffffffffc0208cbc:	00006697          	auipc	a3,0x6
ffffffffc0208cc0:	36468693          	addi	a3,a3,868 # ffffffffc020f020 <dev_node_ops+0x178>
ffffffffc0208cc4:	00003617          	auipc	a2,0x3
ffffffffc0208cc8:	07c60613          	addi	a2,a2,124 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208ccc:	06200593          	li	a1,98
ffffffffc0208cd0:	00006517          	auipc	a0,0x6
ffffffffc0208cd4:	29850513          	addi	a0,a0,664 # ffffffffc020ef68 <dev_node_ops+0xc0>
ffffffffc0208cd8:	fc6f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208cdc:	00006697          	auipc	a3,0x6
ffffffffc0208ce0:	24c68693          	addi	a3,a3,588 # ffffffffc020ef28 <dev_node_ops+0x80>
ffffffffc0208ce4:	00003617          	auipc	a2,0x3
ffffffffc0208ce8:	05c60613          	addi	a2,a2,92 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208cec:	05700593          	li	a1,87
ffffffffc0208cf0:	00006517          	auipc	a0,0x6
ffffffffc0208cf4:	27850513          	addi	a0,a0,632 # ffffffffc020ef68 <dev_node_ops+0xc0>
ffffffffc0208cf8:	fa6f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208cfc:	88aa                	mv	a7,a0
ffffffffc0208cfe:	886a                	mv	a6,s10
ffffffffc0208d00:	87a2                	mv	a5,s0
ffffffffc0208d02:	8752                	mv	a4,s4
ffffffffc0208d04:	86ce                	mv	a3,s3
ffffffffc0208d06:	00006617          	auipc	a2,0x6
ffffffffc0208d0a:	2d260613          	addi	a2,a2,722 # ffffffffc020efd8 <dev_node_ops+0x130>
ffffffffc0208d0e:	02d00593          	li	a1,45
ffffffffc0208d12:	00006517          	auipc	a0,0x6
ffffffffc0208d16:	25650513          	addi	a0,a0,598 # ffffffffc020ef68 <dev_node_ops+0xc0>
ffffffffc0208d1a:	f84f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208d1e:	88aa                	mv	a7,a0
ffffffffc0208d20:	8852                	mv	a6,s4
ffffffffc0208d22:	87a2                	mv	a5,s0
ffffffffc0208d24:	874a                	mv	a4,s2
ffffffffc0208d26:	86ce                	mv	a3,s3
ffffffffc0208d28:	00006617          	auipc	a2,0x6
ffffffffc0208d2c:	26060613          	addi	a2,a2,608 # ffffffffc020ef88 <dev_node_ops+0xe0>
ffffffffc0208d30:	03700593          	li	a1,55
ffffffffc0208d34:	00006517          	auipc	a0,0x6
ffffffffc0208d38:	23450513          	addi	a0,a0,564 # ffffffffc020ef68 <dev_node_ops+0xc0>
ffffffffc0208d3c:	f62f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208d40 <dev_init_disk0>:
ffffffffc0208d40:	1101                	addi	sp,sp,-32
ffffffffc0208d42:	ec06                	sd	ra,24(sp)
ffffffffc0208d44:	e822                	sd	s0,16(sp)
ffffffffc0208d46:	e426                	sd	s1,8(sp)
ffffffffc0208d48:	dedff0ef          	jal	ra,ffffffffc0208b34 <dev_create_inode>
ffffffffc0208d4c:	c541                	beqz	a0,ffffffffc0208dd4 <dev_init_disk0+0x94>
ffffffffc0208d4e:	4d38                	lw	a4,88(a0)
ffffffffc0208d50:	6485                	lui	s1,0x1
ffffffffc0208d52:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208d56:	842a                	mv	s0,a0
ffffffffc0208d58:	0cf71f63          	bne	a4,a5,ffffffffc0208e36 <dev_init_disk0+0xf6>
ffffffffc0208d5c:	4509                	li	a0,2
ffffffffc0208d5e:	d97f70ef          	jal	ra,ffffffffc0200af4 <ide_device_valid>
ffffffffc0208d62:	cd55                	beqz	a0,ffffffffc0208e1e <dev_init_disk0+0xde>
ffffffffc0208d64:	4509                	li	a0,2
ffffffffc0208d66:	db3f70ef          	jal	ra,ffffffffc0200b18 <ide_device_size>
ffffffffc0208d6a:	00355793          	srli	a5,a0,0x3
ffffffffc0208d6e:	e01c                	sd	a5,0(s0)
ffffffffc0208d70:	00000797          	auipc	a5,0x0
ffffffffc0208d74:	df078793          	addi	a5,a5,-528 # ffffffffc0208b60 <disk0_open>
ffffffffc0208d78:	e81c                	sd	a5,16(s0)
ffffffffc0208d7a:	00000797          	auipc	a5,0x0
ffffffffc0208d7e:	dea78793          	addi	a5,a5,-534 # ffffffffc0208b64 <disk0_close>
ffffffffc0208d82:	ec1c                	sd	a5,24(s0)
ffffffffc0208d84:	00000797          	auipc	a5,0x0
ffffffffc0208d88:	de878793          	addi	a5,a5,-536 # ffffffffc0208b6c <disk0_io>
ffffffffc0208d8c:	f01c                	sd	a5,32(s0)
ffffffffc0208d8e:	00000797          	auipc	a5,0x0
ffffffffc0208d92:	dda78793          	addi	a5,a5,-550 # ffffffffc0208b68 <disk0_ioctl>
ffffffffc0208d96:	f41c                	sd	a5,40(s0)
ffffffffc0208d98:	4585                	li	a1,1
ffffffffc0208d9a:	0008d517          	auipc	a0,0x8d
ffffffffc0208d9e:	aa650513          	addi	a0,a0,-1370 # ffffffffc0295840 <disk0_sem>
ffffffffc0208da2:	e404                	sd	s1,8(s0)
ffffffffc0208da4:	957fb0ef          	jal	ra,ffffffffc02046fa <sem_init>
ffffffffc0208da8:	6511                	lui	a0,0x4
ffffffffc0208daa:	a74f90ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0208dae:	0008e797          	auipc	a5,0x8e
ffffffffc0208db2:	b4a7b523          	sd	a0,-1206(a5) # ffffffffc02968f8 <disk0_buffer>
ffffffffc0208db6:	c921                	beqz	a0,ffffffffc0208e06 <dev_init_disk0+0xc6>
ffffffffc0208db8:	4605                	li	a2,1
ffffffffc0208dba:	85a2                	mv	a1,s0
ffffffffc0208dbc:	00006517          	auipc	a0,0x6
ffffffffc0208dc0:	2f450513          	addi	a0,a0,756 # ffffffffc020f0b0 <dev_node_ops+0x208>
ffffffffc0208dc4:	c2cff0ef          	jal	ra,ffffffffc02081f0 <vfs_add_dev>
ffffffffc0208dc8:	e115                	bnez	a0,ffffffffc0208dec <dev_init_disk0+0xac>
ffffffffc0208dca:	60e2                	ld	ra,24(sp)
ffffffffc0208dcc:	6442                	ld	s0,16(sp)
ffffffffc0208dce:	64a2                	ld	s1,8(sp)
ffffffffc0208dd0:	6105                	addi	sp,sp,32
ffffffffc0208dd2:	8082                	ret
ffffffffc0208dd4:	00006617          	auipc	a2,0x6
ffffffffc0208dd8:	27c60613          	addi	a2,a2,636 # ffffffffc020f050 <dev_node_ops+0x1a8>
ffffffffc0208ddc:	08700593          	li	a1,135
ffffffffc0208de0:	00006517          	auipc	a0,0x6
ffffffffc0208de4:	18850513          	addi	a0,a0,392 # ffffffffc020ef68 <dev_node_ops+0xc0>
ffffffffc0208de8:	eb6f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208dec:	86aa                	mv	a3,a0
ffffffffc0208dee:	00006617          	auipc	a2,0x6
ffffffffc0208df2:	2ca60613          	addi	a2,a2,714 # ffffffffc020f0b8 <dev_node_ops+0x210>
ffffffffc0208df6:	08d00593          	li	a1,141
ffffffffc0208dfa:	00006517          	auipc	a0,0x6
ffffffffc0208dfe:	16e50513          	addi	a0,a0,366 # ffffffffc020ef68 <dev_node_ops+0xc0>
ffffffffc0208e02:	e9cf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208e06:	00006617          	auipc	a2,0x6
ffffffffc0208e0a:	28a60613          	addi	a2,a2,650 # ffffffffc020f090 <dev_node_ops+0x1e8>
ffffffffc0208e0e:	07f00593          	li	a1,127
ffffffffc0208e12:	00006517          	auipc	a0,0x6
ffffffffc0208e16:	15650513          	addi	a0,a0,342 # ffffffffc020ef68 <dev_node_ops+0xc0>
ffffffffc0208e1a:	e84f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208e1e:	00006617          	auipc	a2,0x6
ffffffffc0208e22:	25260613          	addi	a2,a2,594 # ffffffffc020f070 <dev_node_ops+0x1c8>
ffffffffc0208e26:	07300593          	li	a1,115
ffffffffc0208e2a:	00006517          	auipc	a0,0x6
ffffffffc0208e2e:	13e50513          	addi	a0,a0,318 # ffffffffc020ef68 <dev_node_ops+0xc0>
ffffffffc0208e32:	e6cf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208e36:	00006697          	auipc	a3,0x6
ffffffffc0208e3a:	d4a68693          	addi	a3,a3,-694 # ffffffffc020eb80 <syscalls+0xb10>
ffffffffc0208e3e:	00003617          	auipc	a2,0x3
ffffffffc0208e42:	f0260613          	addi	a2,a2,-254 # ffffffffc020bd40 <commands+0x210>
ffffffffc0208e46:	08900593          	li	a1,137
ffffffffc0208e4a:	00006517          	auipc	a0,0x6
ffffffffc0208e4e:	11e50513          	addi	a0,a0,286 # ffffffffc020ef68 <dev_node_ops+0xc0>
ffffffffc0208e52:	e4cf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208e56 <stdin_open>:
ffffffffc0208e56:	4501                	li	a0,0
ffffffffc0208e58:	e191                	bnez	a1,ffffffffc0208e5c <stdin_open+0x6>
ffffffffc0208e5a:	8082                	ret
ffffffffc0208e5c:	5575                	li	a0,-3
ffffffffc0208e5e:	8082                	ret

ffffffffc0208e60 <stdin_close>:
ffffffffc0208e60:	4501                	li	a0,0
ffffffffc0208e62:	8082                	ret

ffffffffc0208e64 <stdin_ioctl>:
ffffffffc0208e64:	5575                	li	a0,-3
ffffffffc0208e66:	8082                	ret

ffffffffc0208e68 <stdin_io>:
ffffffffc0208e68:	7135                	addi	sp,sp,-160
ffffffffc0208e6a:	ed06                	sd	ra,152(sp)
ffffffffc0208e6c:	e922                	sd	s0,144(sp)
ffffffffc0208e6e:	e526                	sd	s1,136(sp)
ffffffffc0208e70:	e14a                	sd	s2,128(sp)
ffffffffc0208e72:	fcce                	sd	s3,120(sp)
ffffffffc0208e74:	f8d2                	sd	s4,112(sp)
ffffffffc0208e76:	f4d6                	sd	s5,104(sp)
ffffffffc0208e78:	f0da                	sd	s6,96(sp)
ffffffffc0208e7a:	ecde                	sd	s7,88(sp)
ffffffffc0208e7c:	e8e2                	sd	s8,80(sp)
ffffffffc0208e7e:	e4e6                	sd	s9,72(sp)
ffffffffc0208e80:	e0ea                	sd	s10,64(sp)
ffffffffc0208e82:	fc6e                	sd	s11,56(sp)
ffffffffc0208e84:	14061163          	bnez	a2,ffffffffc0208fc6 <stdin_io+0x15e>
ffffffffc0208e88:	0005bd83          	ld	s11,0(a1)
ffffffffc0208e8c:	0185bd03          	ld	s10,24(a1)
ffffffffc0208e90:	8b2e                	mv	s6,a1
ffffffffc0208e92:	100027f3          	csrr	a5,sstatus
ffffffffc0208e96:	8b89                	andi	a5,a5,2
ffffffffc0208e98:	10079e63          	bnez	a5,ffffffffc0208fb4 <stdin_io+0x14c>
ffffffffc0208e9c:	4401                	li	s0,0
ffffffffc0208e9e:	100d0963          	beqz	s10,ffffffffc0208fb0 <stdin_io+0x148>
ffffffffc0208ea2:	0008e997          	auipc	s3,0x8e
ffffffffc0208ea6:	a5e98993          	addi	s3,s3,-1442 # ffffffffc0296900 <p_rpos>
ffffffffc0208eaa:	0009b783          	ld	a5,0(s3)
ffffffffc0208eae:	800004b7          	lui	s1,0x80000
ffffffffc0208eb2:	6c85                	lui	s9,0x1
ffffffffc0208eb4:	4a81                	li	s5,0
ffffffffc0208eb6:	0008ea17          	auipc	s4,0x8e
ffffffffc0208eba:	a52a0a13          	addi	s4,s4,-1454 # ffffffffc0296908 <p_wpos>
ffffffffc0208ebe:	0491                	addi	s1,s1,4
ffffffffc0208ec0:	0008d917          	auipc	s2,0x8d
ffffffffc0208ec4:	99890913          	addi	s2,s2,-1640 # ffffffffc0295858 <__wait_queue>
ffffffffc0208ec8:	1cfd                	addi	s9,s9,-1
ffffffffc0208eca:	000a3703          	ld	a4,0(s4)
ffffffffc0208ece:	000a8c1b          	sext.w	s8,s5
ffffffffc0208ed2:	8be2                	mv	s7,s8
ffffffffc0208ed4:	02e7d763          	bge	a5,a4,ffffffffc0208f02 <stdin_io+0x9a>
ffffffffc0208ed8:	a859                	j	ffffffffc0208f6e <stdin_io+0x106>
ffffffffc0208eda:	815fe0ef          	jal	ra,ffffffffc02076ee <schedule>
ffffffffc0208ede:	100027f3          	csrr	a5,sstatus
ffffffffc0208ee2:	8b89                	andi	a5,a5,2
ffffffffc0208ee4:	4401                	li	s0,0
ffffffffc0208ee6:	ef8d                	bnez	a5,ffffffffc0208f20 <stdin_io+0xb8>
ffffffffc0208ee8:	0028                	addi	a0,sp,8
ffffffffc0208eea:	8adfb0ef          	jal	ra,ffffffffc0204796 <wait_in_queue>
ffffffffc0208eee:	e121                	bnez	a0,ffffffffc0208f2e <stdin_io+0xc6>
ffffffffc0208ef0:	47c2                	lw	a5,16(sp)
ffffffffc0208ef2:	04979563          	bne	a5,s1,ffffffffc0208f3c <stdin_io+0xd4>
ffffffffc0208ef6:	0009b783          	ld	a5,0(s3)
ffffffffc0208efa:	000a3703          	ld	a4,0(s4)
ffffffffc0208efe:	06e7c863          	blt	a5,a4,ffffffffc0208f6e <stdin_io+0x106>
ffffffffc0208f02:	8626                	mv	a2,s1
ffffffffc0208f04:	002c                	addi	a1,sp,8
ffffffffc0208f06:	854a                	mv	a0,s2
ffffffffc0208f08:	9b9fb0ef          	jal	ra,ffffffffc02048c0 <wait_current_set>
ffffffffc0208f0c:	d479                	beqz	s0,ffffffffc0208eda <stdin_io+0x72>
ffffffffc0208f0e:	d5ff70ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208f12:	fdcfe0ef          	jal	ra,ffffffffc02076ee <schedule>
ffffffffc0208f16:	100027f3          	csrr	a5,sstatus
ffffffffc0208f1a:	8b89                	andi	a5,a5,2
ffffffffc0208f1c:	4401                	li	s0,0
ffffffffc0208f1e:	d7e9                	beqz	a5,ffffffffc0208ee8 <stdin_io+0x80>
ffffffffc0208f20:	d53f70ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208f24:	0028                	addi	a0,sp,8
ffffffffc0208f26:	4405                	li	s0,1
ffffffffc0208f28:	86ffb0ef          	jal	ra,ffffffffc0204796 <wait_in_queue>
ffffffffc0208f2c:	d171                	beqz	a0,ffffffffc0208ef0 <stdin_io+0x88>
ffffffffc0208f2e:	002c                	addi	a1,sp,8
ffffffffc0208f30:	854a                	mv	a0,s2
ffffffffc0208f32:	80bfb0ef          	jal	ra,ffffffffc020473c <wait_queue_del>
ffffffffc0208f36:	47c2                	lw	a5,16(sp)
ffffffffc0208f38:	fa978fe3          	beq	a5,s1,ffffffffc0208ef6 <stdin_io+0x8e>
ffffffffc0208f3c:	e435                	bnez	s0,ffffffffc0208fa8 <stdin_io+0x140>
ffffffffc0208f3e:	060b8963          	beqz	s7,ffffffffc0208fb0 <stdin_io+0x148>
ffffffffc0208f42:	018b3783          	ld	a5,24(s6)
ffffffffc0208f46:	41578ab3          	sub	s5,a5,s5
ffffffffc0208f4a:	015b3c23          	sd	s5,24(s6)
ffffffffc0208f4e:	60ea                	ld	ra,152(sp)
ffffffffc0208f50:	644a                	ld	s0,144(sp)
ffffffffc0208f52:	64aa                	ld	s1,136(sp)
ffffffffc0208f54:	690a                	ld	s2,128(sp)
ffffffffc0208f56:	79e6                	ld	s3,120(sp)
ffffffffc0208f58:	7a46                	ld	s4,112(sp)
ffffffffc0208f5a:	7aa6                	ld	s5,104(sp)
ffffffffc0208f5c:	7b06                	ld	s6,96(sp)
ffffffffc0208f5e:	6c46                	ld	s8,80(sp)
ffffffffc0208f60:	6ca6                	ld	s9,72(sp)
ffffffffc0208f62:	6d06                	ld	s10,64(sp)
ffffffffc0208f64:	7de2                	ld	s11,56(sp)
ffffffffc0208f66:	855e                	mv	a0,s7
ffffffffc0208f68:	6be6                	ld	s7,88(sp)
ffffffffc0208f6a:	610d                	addi	sp,sp,160
ffffffffc0208f6c:	8082                	ret
ffffffffc0208f6e:	43f7d713          	srai	a4,a5,0x3f
ffffffffc0208f72:	03475693          	srli	a3,a4,0x34
ffffffffc0208f76:	00d78733          	add	a4,a5,a3
ffffffffc0208f7a:	01977733          	and	a4,a4,s9
ffffffffc0208f7e:	8f15                	sub	a4,a4,a3
ffffffffc0208f80:	0008d697          	auipc	a3,0x8d
ffffffffc0208f84:	8e868693          	addi	a3,a3,-1816 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208f88:	9736                	add	a4,a4,a3
ffffffffc0208f8a:	00074683          	lbu	a3,0(a4)
ffffffffc0208f8e:	0785                	addi	a5,a5,1
ffffffffc0208f90:	015d8733          	add	a4,s11,s5
ffffffffc0208f94:	00d70023          	sb	a3,0(a4)
ffffffffc0208f98:	00f9b023          	sd	a5,0(s3)
ffffffffc0208f9c:	0a85                	addi	s5,s5,1
ffffffffc0208f9e:	001c0b9b          	addiw	s7,s8,1
ffffffffc0208fa2:	f3aae4e3          	bltu	s5,s10,ffffffffc0208eca <stdin_io+0x62>
ffffffffc0208fa6:	dc51                	beqz	s0,ffffffffc0208f42 <stdin_io+0xda>
ffffffffc0208fa8:	cc5f70ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208fac:	f80b9be3          	bnez	s7,ffffffffc0208f42 <stdin_io+0xda>
ffffffffc0208fb0:	4b81                	li	s7,0
ffffffffc0208fb2:	bf71                	j	ffffffffc0208f4e <stdin_io+0xe6>
ffffffffc0208fb4:	cbff70ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208fb8:	4405                	li	s0,1
ffffffffc0208fba:	ee0d14e3          	bnez	s10,ffffffffc0208ea2 <stdin_io+0x3a>
ffffffffc0208fbe:	caff70ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208fc2:	4b81                	li	s7,0
ffffffffc0208fc4:	b769                	j	ffffffffc0208f4e <stdin_io+0xe6>
ffffffffc0208fc6:	5bf5                	li	s7,-3
ffffffffc0208fc8:	b759                	j	ffffffffc0208f4e <stdin_io+0xe6>

ffffffffc0208fca <dev_stdin_write>:
ffffffffc0208fca:	e111                	bnez	a0,ffffffffc0208fce <dev_stdin_write+0x4>
ffffffffc0208fcc:	8082                	ret
ffffffffc0208fce:	1101                	addi	sp,sp,-32
ffffffffc0208fd0:	e822                	sd	s0,16(sp)
ffffffffc0208fd2:	ec06                	sd	ra,24(sp)
ffffffffc0208fd4:	e426                	sd	s1,8(sp)
ffffffffc0208fd6:	842a                	mv	s0,a0
ffffffffc0208fd8:	100027f3          	csrr	a5,sstatus
ffffffffc0208fdc:	8b89                	andi	a5,a5,2
ffffffffc0208fde:	4481                	li	s1,0
ffffffffc0208fe0:	e3c1                	bnez	a5,ffffffffc0209060 <dev_stdin_write+0x96>
ffffffffc0208fe2:	0008e597          	auipc	a1,0x8e
ffffffffc0208fe6:	92658593          	addi	a1,a1,-1754 # ffffffffc0296908 <p_wpos>
ffffffffc0208fea:	6198                	ld	a4,0(a1)
ffffffffc0208fec:	6605                	lui	a2,0x1
ffffffffc0208fee:	fff60513          	addi	a0,a2,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0208ff2:	43f75693          	srai	a3,a4,0x3f
ffffffffc0208ff6:	92d1                	srli	a3,a3,0x34
ffffffffc0208ff8:	00d707b3          	add	a5,a4,a3
ffffffffc0208ffc:	8fe9                	and	a5,a5,a0
ffffffffc0208ffe:	8f95                	sub	a5,a5,a3
ffffffffc0209000:	0008d697          	auipc	a3,0x8d
ffffffffc0209004:	86868693          	addi	a3,a3,-1944 # ffffffffc0295868 <stdin_buffer>
ffffffffc0209008:	97b6                	add	a5,a5,a3
ffffffffc020900a:	00878023          	sb	s0,0(a5)
ffffffffc020900e:	0008e797          	auipc	a5,0x8e
ffffffffc0209012:	8f27b783          	ld	a5,-1806(a5) # ffffffffc0296900 <p_rpos>
ffffffffc0209016:	40f707b3          	sub	a5,a4,a5
ffffffffc020901a:	00c7d463          	bge	a5,a2,ffffffffc0209022 <dev_stdin_write+0x58>
ffffffffc020901e:	0705                	addi	a4,a4,1
ffffffffc0209020:	e198                	sd	a4,0(a1)
ffffffffc0209022:	0008d517          	auipc	a0,0x8d
ffffffffc0209026:	83650513          	addi	a0,a0,-1994 # ffffffffc0295858 <__wait_queue>
ffffffffc020902a:	f60fb0ef          	jal	ra,ffffffffc020478a <wait_queue_empty>
ffffffffc020902e:	cd09                	beqz	a0,ffffffffc0209048 <dev_stdin_write+0x7e>
ffffffffc0209030:	e491                	bnez	s1,ffffffffc020903c <dev_stdin_write+0x72>
ffffffffc0209032:	60e2                	ld	ra,24(sp)
ffffffffc0209034:	6442                	ld	s0,16(sp)
ffffffffc0209036:	64a2                	ld	s1,8(sp)
ffffffffc0209038:	6105                	addi	sp,sp,32
ffffffffc020903a:	8082                	ret
ffffffffc020903c:	6442                	ld	s0,16(sp)
ffffffffc020903e:	60e2                	ld	ra,24(sp)
ffffffffc0209040:	64a2                	ld	s1,8(sp)
ffffffffc0209042:	6105                	addi	sp,sp,32
ffffffffc0209044:	c29f706f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0209048:	800005b7          	lui	a1,0x80000
ffffffffc020904c:	4605                	li	a2,1
ffffffffc020904e:	0591                	addi	a1,a1,4
ffffffffc0209050:	0008d517          	auipc	a0,0x8d
ffffffffc0209054:	80850513          	addi	a0,a0,-2040 # ffffffffc0295858 <__wait_queue>
ffffffffc0209058:	f9afb0ef          	jal	ra,ffffffffc02047f2 <wakeup_queue>
ffffffffc020905c:	d8f9                	beqz	s1,ffffffffc0209032 <dev_stdin_write+0x68>
ffffffffc020905e:	bff9                	j	ffffffffc020903c <dev_stdin_write+0x72>
ffffffffc0209060:	c13f70ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0209064:	4485                	li	s1,1
ffffffffc0209066:	bfb5                	j	ffffffffc0208fe2 <dev_stdin_write+0x18>

ffffffffc0209068 <dev_init_stdin>:
ffffffffc0209068:	1141                	addi	sp,sp,-16
ffffffffc020906a:	e406                	sd	ra,8(sp)
ffffffffc020906c:	e022                	sd	s0,0(sp)
ffffffffc020906e:	ac7ff0ef          	jal	ra,ffffffffc0208b34 <dev_create_inode>
ffffffffc0209072:	c93d                	beqz	a0,ffffffffc02090e8 <dev_init_stdin+0x80>
ffffffffc0209074:	4d38                	lw	a4,88(a0)
ffffffffc0209076:	6785                	lui	a5,0x1
ffffffffc0209078:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020907c:	842a                	mv	s0,a0
ffffffffc020907e:	08f71e63          	bne	a4,a5,ffffffffc020911a <dev_init_stdin+0xb2>
ffffffffc0209082:	4785                	li	a5,1
ffffffffc0209084:	e41c                	sd	a5,8(s0)
ffffffffc0209086:	00000797          	auipc	a5,0x0
ffffffffc020908a:	dd078793          	addi	a5,a5,-560 # ffffffffc0208e56 <stdin_open>
ffffffffc020908e:	e81c                	sd	a5,16(s0)
ffffffffc0209090:	00000797          	auipc	a5,0x0
ffffffffc0209094:	dd078793          	addi	a5,a5,-560 # ffffffffc0208e60 <stdin_close>
ffffffffc0209098:	ec1c                	sd	a5,24(s0)
ffffffffc020909a:	00000797          	auipc	a5,0x0
ffffffffc020909e:	dce78793          	addi	a5,a5,-562 # ffffffffc0208e68 <stdin_io>
ffffffffc02090a2:	f01c                	sd	a5,32(s0)
ffffffffc02090a4:	00000797          	auipc	a5,0x0
ffffffffc02090a8:	dc078793          	addi	a5,a5,-576 # ffffffffc0208e64 <stdin_ioctl>
ffffffffc02090ac:	f41c                	sd	a5,40(s0)
ffffffffc02090ae:	0008c517          	auipc	a0,0x8c
ffffffffc02090b2:	7aa50513          	addi	a0,a0,1962 # ffffffffc0295858 <__wait_queue>
ffffffffc02090b6:	00043023          	sd	zero,0(s0)
ffffffffc02090ba:	0008e797          	auipc	a5,0x8e
ffffffffc02090be:	8407b723          	sd	zero,-1970(a5) # ffffffffc0296908 <p_wpos>
ffffffffc02090c2:	0008e797          	auipc	a5,0x8e
ffffffffc02090c6:	8207bf23          	sd	zero,-1986(a5) # ffffffffc0296900 <p_rpos>
ffffffffc02090ca:	e6cfb0ef          	jal	ra,ffffffffc0204736 <wait_queue_init>
ffffffffc02090ce:	4601                	li	a2,0
ffffffffc02090d0:	85a2                	mv	a1,s0
ffffffffc02090d2:	00006517          	auipc	a0,0x6
ffffffffc02090d6:	04650513          	addi	a0,a0,70 # ffffffffc020f118 <dev_node_ops+0x270>
ffffffffc02090da:	916ff0ef          	jal	ra,ffffffffc02081f0 <vfs_add_dev>
ffffffffc02090de:	e10d                	bnez	a0,ffffffffc0209100 <dev_init_stdin+0x98>
ffffffffc02090e0:	60a2                	ld	ra,8(sp)
ffffffffc02090e2:	6402                	ld	s0,0(sp)
ffffffffc02090e4:	0141                	addi	sp,sp,16
ffffffffc02090e6:	8082                	ret
ffffffffc02090e8:	00006617          	auipc	a2,0x6
ffffffffc02090ec:	ff060613          	addi	a2,a2,-16 # ffffffffc020f0d8 <dev_node_ops+0x230>
ffffffffc02090f0:	07500593          	li	a1,117
ffffffffc02090f4:	00006517          	auipc	a0,0x6
ffffffffc02090f8:	00450513          	addi	a0,a0,4 # ffffffffc020f0f8 <dev_node_ops+0x250>
ffffffffc02090fc:	ba2f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209100:	86aa                	mv	a3,a0
ffffffffc0209102:	00006617          	auipc	a2,0x6
ffffffffc0209106:	01e60613          	addi	a2,a2,30 # ffffffffc020f120 <dev_node_ops+0x278>
ffffffffc020910a:	07b00593          	li	a1,123
ffffffffc020910e:	00006517          	auipc	a0,0x6
ffffffffc0209112:	fea50513          	addi	a0,a0,-22 # ffffffffc020f0f8 <dev_node_ops+0x250>
ffffffffc0209116:	b88f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020911a:	00006697          	auipc	a3,0x6
ffffffffc020911e:	a6668693          	addi	a3,a3,-1434 # ffffffffc020eb80 <syscalls+0xb10>
ffffffffc0209122:	00003617          	auipc	a2,0x3
ffffffffc0209126:	c1e60613          	addi	a2,a2,-994 # ffffffffc020bd40 <commands+0x210>
ffffffffc020912a:	07700593          	li	a1,119
ffffffffc020912e:	00006517          	auipc	a0,0x6
ffffffffc0209132:	fca50513          	addi	a0,a0,-54 # ffffffffc020f0f8 <dev_node_ops+0x250>
ffffffffc0209136:	b68f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020913a <stdout_open>:
ffffffffc020913a:	4785                	li	a5,1
ffffffffc020913c:	4501                	li	a0,0
ffffffffc020913e:	00f59363          	bne	a1,a5,ffffffffc0209144 <stdout_open+0xa>
ffffffffc0209142:	8082                	ret
ffffffffc0209144:	5575                	li	a0,-3
ffffffffc0209146:	8082                	ret

ffffffffc0209148 <stdout_close>:
ffffffffc0209148:	4501                	li	a0,0
ffffffffc020914a:	8082                	ret

ffffffffc020914c <stdout_ioctl>:
ffffffffc020914c:	5575                	li	a0,-3
ffffffffc020914e:	8082                	ret

ffffffffc0209150 <stdout_io>:
ffffffffc0209150:	ca05                	beqz	a2,ffffffffc0209180 <stdout_io+0x30>
ffffffffc0209152:	6d9c                	ld	a5,24(a1)
ffffffffc0209154:	1101                	addi	sp,sp,-32
ffffffffc0209156:	e822                	sd	s0,16(sp)
ffffffffc0209158:	e426                	sd	s1,8(sp)
ffffffffc020915a:	ec06                	sd	ra,24(sp)
ffffffffc020915c:	6180                	ld	s0,0(a1)
ffffffffc020915e:	84ae                	mv	s1,a1
ffffffffc0209160:	cb91                	beqz	a5,ffffffffc0209174 <stdout_io+0x24>
ffffffffc0209162:	00044503          	lbu	a0,0(s0)
ffffffffc0209166:	0405                	addi	s0,s0,1
ffffffffc0209168:	87af70ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc020916c:	6c9c                	ld	a5,24(s1)
ffffffffc020916e:	17fd                	addi	a5,a5,-1
ffffffffc0209170:	ec9c                	sd	a5,24(s1)
ffffffffc0209172:	fbe5                	bnez	a5,ffffffffc0209162 <stdout_io+0x12>
ffffffffc0209174:	60e2                	ld	ra,24(sp)
ffffffffc0209176:	6442                	ld	s0,16(sp)
ffffffffc0209178:	64a2                	ld	s1,8(sp)
ffffffffc020917a:	4501                	li	a0,0
ffffffffc020917c:	6105                	addi	sp,sp,32
ffffffffc020917e:	8082                	ret
ffffffffc0209180:	5575                	li	a0,-3
ffffffffc0209182:	8082                	ret

ffffffffc0209184 <dev_init_stdout>:
ffffffffc0209184:	1141                	addi	sp,sp,-16
ffffffffc0209186:	e406                	sd	ra,8(sp)
ffffffffc0209188:	9adff0ef          	jal	ra,ffffffffc0208b34 <dev_create_inode>
ffffffffc020918c:	c939                	beqz	a0,ffffffffc02091e2 <dev_init_stdout+0x5e>
ffffffffc020918e:	4d38                	lw	a4,88(a0)
ffffffffc0209190:	6785                	lui	a5,0x1
ffffffffc0209192:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0209196:	85aa                	mv	a1,a0
ffffffffc0209198:	06f71e63          	bne	a4,a5,ffffffffc0209214 <dev_init_stdout+0x90>
ffffffffc020919c:	4785                	li	a5,1
ffffffffc020919e:	e51c                	sd	a5,8(a0)
ffffffffc02091a0:	00000797          	auipc	a5,0x0
ffffffffc02091a4:	f9a78793          	addi	a5,a5,-102 # ffffffffc020913a <stdout_open>
ffffffffc02091a8:	e91c                	sd	a5,16(a0)
ffffffffc02091aa:	00000797          	auipc	a5,0x0
ffffffffc02091ae:	f9e78793          	addi	a5,a5,-98 # ffffffffc0209148 <stdout_close>
ffffffffc02091b2:	ed1c                	sd	a5,24(a0)
ffffffffc02091b4:	00000797          	auipc	a5,0x0
ffffffffc02091b8:	f9c78793          	addi	a5,a5,-100 # ffffffffc0209150 <stdout_io>
ffffffffc02091bc:	f11c                	sd	a5,32(a0)
ffffffffc02091be:	00000797          	auipc	a5,0x0
ffffffffc02091c2:	f8e78793          	addi	a5,a5,-114 # ffffffffc020914c <stdout_ioctl>
ffffffffc02091c6:	00053023          	sd	zero,0(a0)
ffffffffc02091ca:	f51c                	sd	a5,40(a0)
ffffffffc02091cc:	4601                	li	a2,0
ffffffffc02091ce:	00006517          	auipc	a0,0x6
ffffffffc02091d2:	fb250513          	addi	a0,a0,-78 # ffffffffc020f180 <dev_node_ops+0x2d8>
ffffffffc02091d6:	81aff0ef          	jal	ra,ffffffffc02081f0 <vfs_add_dev>
ffffffffc02091da:	e105                	bnez	a0,ffffffffc02091fa <dev_init_stdout+0x76>
ffffffffc02091dc:	60a2                	ld	ra,8(sp)
ffffffffc02091de:	0141                	addi	sp,sp,16
ffffffffc02091e0:	8082                	ret
ffffffffc02091e2:	00006617          	auipc	a2,0x6
ffffffffc02091e6:	f5e60613          	addi	a2,a2,-162 # ffffffffc020f140 <dev_node_ops+0x298>
ffffffffc02091ea:	03700593          	li	a1,55
ffffffffc02091ee:	00006517          	auipc	a0,0x6
ffffffffc02091f2:	f7250513          	addi	a0,a0,-142 # ffffffffc020f160 <dev_node_ops+0x2b8>
ffffffffc02091f6:	aa8f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02091fa:	86aa                	mv	a3,a0
ffffffffc02091fc:	00006617          	auipc	a2,0x6
ffffffffc0209200:	f8c60613          	addi	a2,a2,-116 # ffffffffc020f188 <dev_node_ops+0x2e0>
ffffffffc0209204:	03d00593          	li	a1,61
ffffffffc0209208:	00006517          	auipc	a0,0x6
ffffffffc020920c:	f5850513          	addi	a0,a0,-168 # ffffffffc020f160 <dev_node_ops+0x2b8>
ffffffffc0209210:	a8ef70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209214:	00006697          	auipc	a3,0x6
ffffffffc0209218:	96c68693          	addi	a3,a3,-1684 # ffffffffc020eb80 <syscalls+0xb10>
ffffffffc020921c:	00003617          	auipc	a2,0x3
ffffffffc0209220:	b2460613          	addi	a2,a2,-1244 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209224:	03900593          	li	a1,57
ffffffffc0209228:	00006517          	auipc	a0,0x6
ffffffffc020922c:	f3850513          	addi	a0,a0,-200 # ffffffffc020f160 <dev_node_ops+0x2b8>
ffffffffc0209230:	a6ef70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209234 <bitmap_translate.part.0>:
ffffffffc0209234:	1141                	addi	sp,sp,-16
ffffffffc0209236:	00006697          	auipc	a3,0x6
ffffffffc020923a:	f7268693          	addi	a3,a3,-142 # ffffffffc020f1a8 <dev_node_ops+0x300>
ffffffffc020923e:	00003617          	auipc	a2,0x3
ffffffffc0209242:	b0260613          	addi	a2,a2,-1278 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209246:	04c00593          	li	a1,76
ffffffffc020924a:	00006517          	auipc	a0,0x6
ffffffffc020924e:	f7650513          	addi	a0,a0,-138 # ffffffffc020f1c0 <dev_node_ops+0x318>
ffffffffc0209252:	e406                	sd	ra,8(sp)
ffffffffc0209254:	a4af70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209258 <bitmap_create>:
ffffffffc0209258:	7139                	addi	sp,sp,-64
ffffffffc020925a:	fc06                	sd	ra,56(sp)
ffffffffc020925c:	f822                	sd	s0,48(sp)
ffffffffc020925e:	f426                	sd	s1,40(sp)
ffffffffc0209260:	f04a                	sd	s2,32(sp)
ffffffffc0209262:	ec4e                	sd	s3,24(sp)
ffffffffc0209264:	e852                	sd	s4,16(sp)
ffffffffc0209266:	e456                	sd	s5,8(sp)
ffffffffc0209268:	c14d                	beqz	a0,ffffffffc020930a <bitmap_create+0xb2>
ffffffffc020926a:	842a                	mv	s0,a0
ffffffffc020926c:	4541                	li	a0,16
ffffffffc020926e:	db1f80ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0209272:	84aa                	mv	s1,a0
ffffffffc0209274:	cd25                	beqz	a0,ffffffffc02092ec <bitmap_create+0x94>
ffffffffc0209276:	02041a13          	slli	s4,s0,0x20
ffffffffc020927a:	020a5a13          	srli	s4,s4,0x20
ffffffffc020927e:	01fa0793          	addi	a5,s4,31
ffffffffc0209282:	0057d993          	srli	s3,a5,0x5
ffffffffc0209286:	00299a93          	slli	s5,s3,0x2
ffffffffc020928a:	8556                	mv	a0,s5
ffffffffc020928c:	894e                	mv	s2,s3
ffffffffc020928e:	d91f80ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0209292:	c53d                	beqz	a0,ffffffffc0209300 <bitmap_create+0xa8>
ffffffffc0209294:	0134a223          	sw	s3,4(s1) # ffffffff80000004 <_binary_bin_sfs_img_size+0xffffffff7ff8ad04>
ffffffffc0209298:	c080                	sw	s0,0(s1)
ffffffffc020929a:	8656                	mv	a2,s5
ffffffffc020929c:	0ff00593          	li	a1,255
ffffffffc02092a0:	5ba020ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc02092a4:	e488                	sd	a0,8(s1)
ffffffffc02092a6:	0996                	slli	s3,s3,0x5
ffffffffc02092a8:	053a0263          	beq	s4,s3,ffffffffc02092ec <bitmap_create+0x94>
ffffffffc02092ac:	fff9079b          	addiw	a5,s2,-1
ffffffffc02092b0:	0057969b          	slliw	a3,a5,0x5
ffffffffc02092b4:	0054561b          	srliw	a2,s0,0x5
ffffffffc02092b8:	40d4073b          	subw	a4,s0,a3
ffffffffc02092bc:	0054541b          	srliw	s0,s0,0x5
ffffffffc02092c0:	08f61463          	bne	a2,a5,ffffffffc0209348 <bitmap_create+0xf0>
ffffffffc02092c4:	fff7069b          	addiw	a3,a4,-1
ffffffffc02092c8:	47f9                	li	a5,30
ffffffffc02092ca:	04d7ef63          	bltu	a5,a3,ffffffffc0209328 <bitmap_create+0xd0>
ffffffffc02092ce:	1402                	slli	s0,s0,0x20
ffffffffc02092d0:	8079                	srli	s0,s0,0x1e
ffffffffc02092d2:	9522                	add	a0,a0,s0
ffffffffc02092d4:	411c                	lw	a5,0(a0)
ffffffffc02092d6:	4585                	li	a1,1
ffffffffc02092d8:	02000613          	li	a2,32
ffffffffc02092dc:	00e596bb          	sllw	a3,a1,a4
ffffffffc02092e0:	8fb5                	xor	a5,a5,a3
ffffffffc02092e2:	2705                	addiw	a4,a4,1
ffffffffc02092e4:	2781                	sext.w	a5,a5
ffffffffc02092e6:	fec71be3          	bne	a4,a2,ffffffffc02092dc <bitmap_create+0x84>
ffffffffc02092ea:	c11c                	sw	a5,0(a0)
ffffffffc02092ec:	70e2                	ld	ra,56(sp)
ffffffffc02092ee:	7442                	ld	s0,48(sp)
ffffffffc02092f0:	7902                	ld	s2,32(sp)
ffffffffc02092f2:	69e2                	ld	s3,24(sp)
ffffffffc02092f4:	6a42                	ld	s4,16(sp)
ffffffffc02092f6:	6aa2                	ld	s5,8(sp)
ffffffffc02092f8:	8526                	mv	a0,s1
ffffffffc02092fa:	74a2                	ld	s1,40(sp)
ffffffffc02092fc:	6121                	addi	sp,sp,64
ffffffffc02092fe:	8082                	ret
ffffffffc0209300:	8526                	mv	a0,s1
ffffffffc0209302:	dcdf80ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0209306:	4481                	li	s1,0
ffffffffc0209308:	b7d5                	j	ffffffffc02092ec <bitmap_create+0x94>
ffffffffc020930a:	00006697          	auipc	a3,0x6
ffffffffc020930e:	ece68693          	addi	a3,a3,-306 # ffffffffc020f1d8 <dev_node_ops+0x330>
ffffffffc0209312:	00003617          	auipc	a2,0x3
ffffffffc0209316:	a2e60613          	addi	a2,a2,-1490 # ffffffffc020bd40 <commands+0x210>
ffffffffc020931a:	45d5                	li	a1,21
ffffffffc020931c:	00006517          	auipc	a0,0x6
ffffffffc0209320:	ea450513          	addi	a0,a0,-348 # ffffffffc020f1c0 <dev_node_ops+0x318>
ffffffffc0209324:	97af70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209328:	00006697          	auipc	a3,0x6
ffffffffc020932c:	ef068693          	addi	a3,a3,-272 # ffffffffc020f218 <dev_node_ops+0x370>
ffffffffc0209330:	00003617          	auipc	a2,0x3
ffffffffc0209334:	a1060613          	addi	a2,a2,-1520 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209338:	02b00593          	li	a1,43
ffffffffc020933c:	00006517          	auipc	a0,0x6
ffffffffc0209340:	e8450513          	addi	a0,a0,-380 # ffffffffc020f1c0 <dev_node_ops+0x318>
ffffffffc0209344:	95af70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209348:	00006697          	auipc	a3,0x6
ffffffffc020934c:	eb868693          	addi	a3,a3,-328 # ffffffffc020f200 <dev_node_ops+0x358>
ffffffffc0209350:	00003617          	auipc	a2,0x3
ffffffffc0209354:	9f060613          	addi	a2,a2,-1552 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209358:	02a00593          	li	a1,42
ffffffffc020935c:	00006517          	auipc	a0,0x6
ffffffffc0209360:	e6450513          	addi	a0,a0,-412 # ffffffffc020f1c0 <dev_node_ops+0x318>
ffffffffc0209364:	93af70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209368 <bitmap_alloc>:
ffffffffc0209368:	4150                	lw	a2,4(a0)
ffffffffc020936a:	651c                	ld	a5,8(a0)
ffffffffc020936c:	c231                	beqz	a2,ffffffffc02093b0 <bitmap_alloc+0x48>
ffffffffc020936e:	4701                	li	a4,0
ffffffffc0209370:	a029                	j	ffffffffc020937a <bitmap_alloc+0x12>
ffffffffc0209372:	2705                	addiw	a4,a4,1
ffffffffc0209374:	0791                	addi	a5,a5,4
ffffffffc0209376:	02e60d63          	beq	a2,a4,ffffffffc02093b0 <bitmap_alloc+0x48>
ffffffffc020937a:	4394                	lw	a3,0(a5)
ffffffffc020937c:	dafd                	beqz	a3,ffffffffc0209372 <bitmap_alloc+0xa>
ffffffffc020937e:	4501                	li	a0,0
ffffffffc0209380:	4885                	li	a7,1
ffffffffc0209382:	8e36                	mv	t3,a3
ffffffffc0209384:	02000313          	li	t1,32
ffffffffc0209388:	a021                	j	ffffffffc0209390 <bitmap_alloc+0x28>
ffffffffc020938a:	2505                	addiw	a0,a0,1
ffffffffc020938c:	02650463          	beq	a0,t1,ffffffffc02093b4 <bitmap_alloc+0x4c>
ffffffffc0209390:	00a8983b          	sllw	a6,a7,a0
ffffffffc0209394:	0106f633          	and	a2,a3,a6
ffffffffc0209398:	2601                	sext.w	a2,a2
ffffffffc020939a:	da65                	beqz	a2,ffffffffc020938a <bitmap_alloc+0x22>
ffffffffc020939c:	010e4833          	xor	a6,t3,a6
ffffffffc02093a0:	0057171b          	slliw	a4,a4,0x5
ffffffffc02093a4:	9f29                	addw	a4,a4,a0
ffffffffc02093a6:	0107a023          	sw	a6,0(a5)
ffffffffc02093aa:	c198                	sw	a4,0(a1)
ffffffffc02093ac:	4501                	li	a0,0
ffffffffc02093ae:	8082                	ret
ffffffffc02093b0:	5571                	li	a0,-4
ffffffffc02093b2:	8082                	ret
ffffffffc02093b4:	1141                	addi	sp,sp,-16
ffffffffc02093b6:	00004697          	auipc	a3,0x4
ffffffffc02093ba:	a4268693          	addi	a3,a3,-1470 # ffffffffc020cdf8 <default_pmm_manager+0x598>
ffffffffc02093be:	00003617          	auipc	a2,0x3
ffffffffc02093c2:	98260613          	addi	a2,a2,-1662 # ffffffffc020bd40 <commands+0x210>
ffffffffc02093c6:	04300593          	li	a1,67
ffffffffc02093ca:	00006517          	auipc	a0,0x6
ffffffffc02093ce:	df650513          	addi	a0,a0,-522 # ffffffffc020f1c0 <dev_node_ops+0x318>
ffffffffc02093d2:	e406                	sd	ra,8(sp)
ffffffffc02093d4:	8caf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02093d8 <bitmap_test>:
ffffffffc02093d8:	411c                	lw	a5,0(a0)
ffffffffc02093da:	00f5ff63          	bgeu	a1,a5,ffffffffc02093f8 <bitmap_test+0x20>
ffffffffc02093de:	651c                	ld	a5,8(a0)
ffffffffc02093e0:	0055d71b          	srliw	a4,a1,0x5
ffffffffc02093e4:	070a                	slli	a4,a4,0x2
ffffffffc02093e6:	97ba                	add	a5,a5,a4
ffffffffc02093e8:	4388                	lw	a0,0(a5)
ffffffffc02093ea:	4785                	li	a5,1
ffffffffc02093ec:	00b795bb          	sllw	a1,a5,a1
ffffffffc02093f0:	8d6d                	and	a0,a0,a1
ffffffffc02093f2:	1502                	slli	a0,a0,0x20
ffffffffc02093f4:	9101                	srli	a0,a0,0x20
ffffffffc02093f6:	8082                	ret
ffffffffc02093f8:	1141                	addi	sp,sp,-16
ffffffffc02093fa:	e406                	sd	ra,8(sp)
ffffffffc02093fc:	e39ff0ef          	jal	ra,ffffffffc0209234 <bitmap_translate.part.0>

ffffffffc0209400 <bitmap_free>:
ffffffffc0209400:	411c                	lw	a5,0(a0)
ffffffffc0209402:	1141                	addi	sp,sp,-16
ffffffffc0209404:	e406                	sd	ra,8(sp)
ffffffffc0209406:	02f5f463          	bgeu	a1,a5,ffffffffc020942e <bitmap_free+0x2e>
ffffffffc020940a:	651c                	ld	a5,8(a0)
ffffffffc020940c:	0055d71b          	srliw	a4,a1,0x5
ffffffffc0209410:	070a                	slli	a4,a4,0x2
ffffffffc0209412:	97ba                	add	a5,a5,a4
ffffffffc0209414:	4398                	lw	a4,0(a5)
ffffffffc0209416:	4685                	li	a3,1
ffffffffc0209418:	00b695bb          	sllw	a1,a3,a1
ffffffffc020941c:	00b776b3          	and	a3,a4,a1
ffffffffc0209420:	2681                	sext.w	a3,a3
ffffffffc0209422:	ea81                	bnez	a3,ffffffffc0209432 <bitmap_free+0x32>
ffffffffc0209424:	60a2                	ld	ra,8(sp)
ffffffffc0209426:	8f4d                	or	a4,a4,a1
ffffffffc0209428:	c398                	sw	a4,0(a5)
ffffffffc020942a:	0141                	addi	sp,sp,16
ffffffffc020942c:	8082                	ret
ffffffffc020942e:	e07ff0ef          	jal	ra,ffffffffc0209234 <bitmap_translate.part.0>
ffffffffc0209432:	00006697          	auipc	a3,0x6
ffffffffc0209436:	e0e68693          	addi	a3,a3,-498 # ffffffffc020f240 <dev_node_ops+0x398>
ffffffffc020943a:	00003617          	auipc	a2,0x3
ffffffffc020943e:	90660613          	addi	a2,a2,-1786 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209442:	05f00593          	li	a1,95
ffffffffc0209446:	00006517          	auipc	a0,0x6
ffffffffc020944a:	d7a50513          	addi	a0,a0,-646 # ffffffffc020f1c0 <dev_node_ops+0x318>
ffffffffc020944e:	850f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209452 <bitmap_destroy>:
ffffffffc0209452:	1141                	addi	sp,sp,-16
ffffffffc0209454:	e022                	sd	s0,0(sp)
ffffffffc0209456:	842a                	mv	s0,a0
ffffffffc0209458:	6508                	ld	a0,8(a0)
ffffffffc020945a:	e406                	sd	ra,8(sp)
ffffffffc020945c:	c73f80ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0209460:	8522                	mv	a0,s0
ffffffffc0209462:	6402                	ld	s0,0(sp)
ffffffffc0209464:	60a2                	ld	ra,8(sp)
ffffffffc0209466:	0141                	addi	sp,sp,16
ffffffffc0209468:	c67f806f          	j	ffffffffc02020ce <kfree>

ffffffffc020946c <bitmap_getdata>:
ffffffffc020946c:	c589                	beqz	a1,ffffffffc0209476 <bitmap_getdata+0xa>
ffffffffc020946e:	00456783          	lwu	a5,4(a0)
ffffffffc0209472:	078a                	slli	a5,a5,0x2
ffffffffc0209474:	e19c                	sd	a5,0(a1)
ffffffffc0209476:	6508                	ld	a0,8(a0)
ffffffffc0209478:	8082                	ret

ffffffffc020947a <sfs_init>:
ffffffffc020947a:	1141                	addi	sp,sp,-16
ffffffffc020947c:	00006517          	auipc	a0,0x6
ffffffffc0209480:	c3450513          	addi	a0,a0,-972 # ffffffffc020f0b0 <dev_node_ops+0x208>
ffffffffc0209484:	e406                	sd	ra,8(sp)
ffffffffc0209486:	554000ef          	jal	ra,ffffffffc02099da <sfs_mount>
ffffffffc020948a:	e501                	bnez	a0,ffffffffc0209492 <sfs_init+0x18>
ffffffffc020948c:	60a2                	ld	ra,8(sp)
ffffffffc020948e:	0141                	addi	sp,sp,16
ffffffffc0209490:	8082                	ret
ffffffffc0209492:	86aa                	mv	a3,a0
ffffffffc0209494:	00006617          	auipc	a2,0x6
ffffffffc0209498:	dbc60613          	addi	a2,a2,-580 # ffffffffc020f250 <dev_node_ops+0x3a8>
ffffffffc020949c:	45c1                	li	a1,16
ffffffffc020949e:	00006517          	auipc	a0,0x6
ffffffffc02094a2:	dd250513          	addi	a0,a0,-558 # ffffffffc020f270 <dev_node_ops+0x3c8>
ffffffffc02094a6:	ff9f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02094aa <sfs_unmount>:
ffffffffc02094aa:	1141                	addi	sp,sp,-16
ffffffffc02094ac:	e406                	sd	ra,8(sp)
ffffffffc02094ae:	e022                	sd	s0,0(sp)
ffffffffc02094b0:	cd1d                	beqz	a0,ffffffffc02094ee <sfs_unmount+0x44>
ffffffffc02094b2:	0b052783          	lw	a5,176(a0)
ffffffffc02094b6:	842a                	mv	s0,a0
ffffffffc02094b8:	eb9d                	bnez	a5,ffffffffc02094ee <sfs_unmount+0x44>
ffffffffc02094ba:	7158                	ld	a4,160(a0)
ffffffffc02094bc:	09850793          	addi	a5,a0,152
ffffffffc02094c0:	02f71563          	bne	a4,a5,ffffffffc02094ea <sfs_unmount+0x40>
ffffffffc02094c4:	613c                	ld	a5,64(a0)
ffffffffc02094c6:	e7a1                	bnez	a5,ffffffffc020950e <sfs_unmount+0x64>
ffffffffc02094c8:	7d08                	ld	a0,56(a0)
ffffffffc02094ca:	f89ff0ef          	jal	ra,ffffffffc0209452 <bitmap_destroy>
ffffffffc02094ce:	6428                	ld	a0,72(s0)
ffffffffc02094d0:	bfff80ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc02094d4:	7448                	ld	a0,168(s0)
ffffffffc02094d6:	bf9f80ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc02094da:	8522                	mv	a0,s0
ffffffffc02094dc:	bf3f80ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc02094e0:	4501                	li	a0,0
ffffffffc02094e2:	60a2                	ld	ra,8(sp)
ffffffffc02094e4:	6402                	ld	s0,0(sp)
ffffffffc02094e6:	0141                	addi	sp,sp,16
ffffffffc02094e8:	8082                	ret
ffffffffc02094ea:	5545                	li	a0,-15
ffffffffc02094ec:	bfdd                	j	ffffffffc02094e2 <sfs_unmount+0x38>
ffffffffc02094ee:	00006697          	auipc	a3,0x6
ffffffffc02094f2:	d9a68693          	addi	a3,a3,-614 # ffffffffc020f288 <dev_node_ops+0x3e0>
ffffffffc02094f6:	00003617          	auipc	a2,0x3
ffffffffc02094fa:	84a60613          	addi	a2,a2,-1974 # ffffffffc020bd40 <commands+0x210>
ffffffffc02094fe:	04100593          	li	a1,65
ffffffffc0209502:	00006517          	auipc	a0,0x6
ffffffffc0209506:	db650513          	addi	a0,a0,-586 # ffffffffc020f2b8 <dev_node_ops+0x410>
ffffffffc020950a:	f95f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020950e:	00006697          	auipc	a3,0x6
ffffffffc0209512:	dc268693          	addi	a3,a3,-574 # ffffffffc020f2d0 <dev_node_ops+0x428>
ffffffffc0209516:	00003617          	auipc	a2,0x3
ffffffffc020951a:	82a60613          	addi	a2,a2,-2006 # ffffffffc020bd40 <commands+0x210>
ffffffffc020951e:	04500593          	li	a1,69
ffffffffc0209522:	00006517          	auipc	a0,0x6
ffffffffc0209526:	d9650513          	addi	a0,a0,-618 # ffffffffc020f2b8 <dev_node_ops+0x410>
ffffffffc020952a:	f75f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020952e <sfs_cleanup>:
ffffffffc020952e:	1101                	addi	sp,sp,-32
ffffffffc0209530:	ec06                	sd	ra,24(sp)
ffffffffc0209532:	e822                	sd	s0,16(sp)
ffffffffc0209534:	e426                	sd	s1,8(sp)
ffffffffc0209536:	e04a                	sd	s2,0(sp)
ffffffffc0209538:	c525                	beqz	a0,ffffffffc02095a0 <sfs_cleanup+0x72>
ffffffffc020953a:	0b052783          	lw	a5,176(a0)
ffffffffc020953e:	84aa                	mv	s1,a0
ffffffffc0209540:	e3a5                	bnez	a5,ffffffffc02095a0 <sfs_cleanup+0x72>
ffffffffc0209542:	4158                	lw	a4,4(a0)
ffffffffc0209544:	4514                	lw	a3,8(a0)
ffffffffc0209546:	00c50913          	addi	s2,a0,12
ffffffffc020954a:	85ca                	mv	a1,s2
ffffffffc020954c:	40d7063b          	subw	a2,a4,a3
ffffffffc0209550:	00006517          	auipc	a0,0x6
ffffffffc0209554:	d9850513          	addi	a0,a0,-616 # ffffffffc020f2e8 <dev_node_ops+0x440>
ffffffffc0209558:	c4ff60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020955c:	02000413          	li	s0,32
ffffffffc0209560:	a019                	j	ffffffffc0209566 <sfs_cleanup+0x38>
ffffffffc0209562:	347d                	addiw	s0,s0,-1
ffffffffc0209564:	c819                	beqz	s0,ffffffffc020957a <sfs_cleanup+0x4c>
ffffffffc0209566:	7cdc                	ld	a5,184(s1)
ffffffffc0209568:	8526                	mv	a0,s1
ffffffffc020956a:	9782                	jalr	a5
ffffffffc020956c:	f97d                	bnez	a0,ffffffffc0209562 <sfs_cleanup+0x34>
ffffffffc020956e:	60e2                	ld	ra,24(sp)
ffffffffc0209570:	6442                	ld	s0,16(sp)
ffffffffc0209572:	64a2                	ld	s1,8(sp)
ffffffffc0209574:	6902                	ld	s2,0(sp)
ffffffffc0209576:	6105                	addi	sp,sp,32
ffffffffc0209578:	8082                	ret
ffffffffc020957a:	6442                	ld	s0,16(sp)
ffffffffc020957c:	60e2                	ld	ra,24(sp)
ffffffffc020957e:	64a2                	ld	s1,8(sp)
ffffffffc0209580:	86ca                	mv	a3,s2
ffffffffc0209582:	6902                	ld	s2,0(sp)
ffffffffc0209584:	872a                	mv	a4,a0
ffffffffc0209586:	00006617          	auipc	a2,0x6
ffffffffc020958a:	d8260613          	addi	a2,a2,-638 # ffffffffc020f308 <dev_node_ops+0x460>
ffffffffc020958e:	05f00593          	li	a1,95
ffffffffc0209592:	00006517          	auipc	a0,0x6
ffffffffc0209596:	d2650513          	addi	a0,a0,-730 # ffffffffc020f2b8 <dev_node_ops+0x410>
ffffffffc020959a:	6105                	addi	sp,sp,32
ffffffffc020959c:	f6bf606f          	j	ffffffffc0200506 <__warn>
ffffffffc02095a0:	00006697          	auipc	a3,0x6
ffffffffc02095a4:	ce868693          	addi	a3,a3,-792 # ffffffffc020f288 <dev_node_ops+0x3e0>
ffffffffc02095a8:	00002617          	auipc	a2,0x2
ffffffffc02095ac:	79860613          	addi	a2,a2,1944 # ffffffffc020bd40 <commands+0x210>
ffffffffc02095b0:	05400593          	li	a1,84
ffffffffc02095b4:	00006517          	auipc	a0,0x6
ffffffffc02095b8:	d0450513          	addi	a0,a0,-764 # ffffffffc020f2b8 <dev_node_ops+0x410>
ffffffffc02095bc:	ee3f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02095c0 <sfs_sync>:
ffffffffc02095c0:	7179                	addi	sp,sp,-48
ffffffffc02095c2:	f406                	sd	ra,40(sp)
ffffffffc02095c4:	f022                	sd	s0,32(sp)
ffffffffc02095c6:	ec26                	sd	s1,24(sp)
ffffffffc02095c8:	e84a                	sd	s2,16(sp)
ffffffffc02095ca:	e44e                	sd	s3,8(sp)
ffffffffc02095cc:	e052                	sd	s4,0(sp)
ffffffffc02095ce:	cd4d                	beqz	a0,ffffffffc0209688 <sfs_sync+0xc8>
ffffffffc02095d0:	0b052783          	lw	a5,176(a0)
ffffffffc02095d4:	8a2a                	mv	s4,a0
ffffffffc02095d6:	ebcd                	bnez	a5,ffffffffc0209688 <sfs_sync+0xc8>
ffffffffc02095d8:	52f010ef          	jal	ra,ffffffffc020b306 <lock_sfs_fs>
ffffffffc02095dc:	0a0a3403          	ld	s0,160(s4)
ffffffffc02095e0:	098a0913          	addi	s2,s4,152
ffffffffc02095e4:	02890763          	beq	s2,s0,ffffffffc0209612 <sfs_sync+0x52>
ffffffffc02095e8:	00004997          	auipc	s3,0x4
ffffffffc02095ec:	11898993          	addi	s3,s3,280 # ffffffffc020d700 <default_pmm_manager+0xea0>
ffffffffc02095f0:	7c1c                	ld	a5,56(s0)
ffffffffc02095f2:	fc840493          	addi	s1,s0,-56
ffffffffc02095f6:	cbb5                	beqz	a5,ffffffffc020966a <sfs_sync+0xaa>
ffffffffc02095f8:	7b9c                	ld	a5,48(a5)
ffffffffc02095fa:	cba5                	beqz	a5,ffffffffc020966a <sfs_sync+0xaa>
ffffffffc02095fc:	85ce                	mv	a1,s3
ffffffffc02095fe:	8526                	mv	a0,s1
ffffffffc0209600:	e28fe0ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0209604:	7c1c                	ld	a5,56(s0)
ffffffffc0209606:	8526                	mv	a0,s1
ffffffffc0209608:	7b9c                	ld	a5,48(a5)
ffffffffc020960a:	9782                	jalr	a5
ffffffffc020960c:	6400                	ld	s0,8(s0)
ffffffffc020960e:	fe8911e3          	bne	s2,s0,ffffffffc02095f0 <sfs_sync+0x30>
ffffffffc0209612:	8552                	mv	a0,s4
ffffffffc0209614:	503010ef          	jal	ra,ffffffffc020b316 <unlock_sfs_fs>
ffffffffc0209618:	040a3783          	ld	a5,64(s4)
ffffffffc020961c:	4501                	li	a0,0
ffffffffc020961e:	eb89                	bnez	a5,ffffffffc0209630 <sfs_sync+0x70>
ffffffffc0209620:	70a2                	ld	ra,40(sp)
ffffffffc0209622:	7402                	ld	s0,32(sp)
ffffffffc0209624:	64e2                	ld	s1,24(sp)
ffffffffc0209626:	6942                	ld	s2,16(sp)
ffffffffc0209628:	69a2                	ld	s3,8(sp)
ffffffffc020962a:	6a02                	ld	s4,0(sp)
ffffffffc020962c:	6145                	addi	sp,sp,48
ffffffffc020962e:	8082                	ret
ffffffffc0209630:	040a3023          	sd	zero,64(s4)
ffffffffc0209634:	8552                	mv	a0,s4
ffffffffc0209636:	3b5010ef          	jal	ra,ffffffffc020b1ea <sfs_sync_super>
ffffffffc020963a:	cd01                	beqz	a0,ffffffffc0209652 <sfs_sync+0x92>
ffffffffc020963c:	70a2                	ld	ra,40(sp)
ffffffffc020963e:	7402                	ld	s0,32(sp)
ffffffffc0209640:	4785                	li	a5,1
ffffffffc0209642:	04fa3023          	sd	a5,64(s4)
ffffffffc0209646:	64e2                	ld	s1,24(sp)
ffffffffc0209648:	6942                	ld	s2,16(sp)
ffffffffc020964a:	69a2                	ld	s3,8(sp)
ffffffffc020964c:	6a02                	ld	s4,0(sp)
ffffffffc020964e:	6145                	addi	sp,sp,48
ffffffffc0209650:	8082                	ret
ffffffffc0209652:	8552                	mv	a0,s4
ffffffffc0209654:	3dd010ef          	jal	ra,ffffffffc020b230 <sfs_sync_freemap>
ffffffffc0209658:	f175                	bnez	a0,ffffffffc020963c <sfs_sync+0x7c>
ffffffffc020965a:	70a2                	ld	ra,40(sp)
ffffffffc020965c:	7402                	ld	s0,32(sp)
ffffffffc020965e:	64e2                	ld	s1,24(sp)
ffffffffc0209660:	6942                	ld	s2,16(sp)
ffffffffc0209662:	69a2                	ld	s3,8(sp)
ffffffffc0209664:	6a02                	ld	s4,0(sp)
ffffffffc0209666:	6145                	addi	sp,sp,48
ffffffffc0209668:	8082                	ret
ffffffffc020966a:	00004697          	auipc	a3,0x4
ffffffffc020966e:	04668693          	addi	a3,a3,70 # ffffffffc020d6b0 <default_pmm_manager+0xe50>
ffffffffc0209672:	00002617          	auipc	a2,0x2
ffffffffc0209676:	6ce60613          	addi	a2,a2,1742 # ffffffffc020bd40 <commands+0x210>
ffffffffc020967a:	45ed                	li	a1,27
ffffffffc020967c:	00006517          	auipc	a0,0x6
ffffffffc0209680:	c3c50513          	addi	a0,a0,-964 # ffffffffc020f2b8 <dev_node_ops+0x410>
ffffffffc0209684:	e1bf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209688:	00006697          	auipc	a3,0x6
ffffffffc020968c:	c0068693          	addi	a3,a3,-1024 # ffffffffc020f288 <dev_node_ops+0x3e0>
ffffffffc0209690:	00002617          	auipc	a2,0x2
ffffffffc0209694:	6b060613          	addi	a2,a2,1712 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209698:	45d5                	li	a1,21
ffffffffc020969a:	00006517          	auipc	a0,0x6
ffffffffc020969e:	c1e50513          	addi	a0,a0,-994 # ffffffffc020f2b8 <dev_node_ops+0x410>
ffffffffc02096a2:	dfdf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02096a6 <sfs_get_root>:
ffffffffc02096a6:	1101                	addi	sp,sp,-32
ffffffffc02096a8:	ec06                	sd	ra,24(sp)
ffffffffc02096aa:	cd09                	beqz	a0,ffffffffc02096c4 <sfs_get_root+0x1e>
ffffffffc02096ac:	0b052783          	lw	a5,176(a0)
ffffffffc02096b0:	eb91                	bnez	a5,ffffffffc02096c4 <sfs_get_root+0x1e>
ffffffffc02096b2:	4605                	li	a2,1
ffffffffc02096b4:	002c                	addi	a1,sp,8
ffffffffc02096b6:	366010ef          	jal	ra,ffffffffc020aa1c <sfs_load_inode>
ffffffffc02096ba:	e50d                	bnez	a0,ffffffffc02096e4 <sfs_get_root+0x3e>
ffffffffc02096bc:	60e2                	ld	ra,24(sp)
ffffffffc02096be:	6522                	ld	a0,8(sp)
ffffffffc02096c0:	6105                	addi	sp,sp,32
ffffffffc02096c2:	8082                	ret
ffffffffc02096c4:	00006697          	auipc	a3,0x6
ffffffffc02096c8:	bc468693          	addi	a3,a3,-1084 # ffffffffc020f288 <dev_node_ops+0x3e0>
ffffffffc02096cc:	00002617          	auipc	a2,0x2
ffffffffc02096d0:	67460613          	addi	a2,a2,1652 # ffffffffc020bd40 <commands+0x210>
ffffffffc02096d4:	03600593          	li	a1,54
ffffffffc02096d8:	00006517          	auipc	a0,0x6
ffffffffc02096dc:	be050513          	addi	a0,a0,-1056 # ffffffffc020f2b8 <dev_node_ops+0x410>
ffffffffc02096e0:	dbff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02096e4:	86aa                	mv	a3,a0
ffffffffc02096e6:	00006617          	auipc	a2,0x6
ffffffffc02096ea:	c4260613          	addi	a2,a2,-958 # ffffffffc020f328 <dev_node_ops+0x480>
ffffffffc02096ee:	03700593          	li	a1,55
ffffffffc02096f2:	00006517          	auipc	a0,0x6
ffffffffc02096f6:	bc650513          	addi	a0,a0,-1082 # ffffffffc020f2b8 <dev_node_ops+0x410>
ffffffffc02096fa:	da5f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02096fe <sfs_do_mount>:
ffffffffc02096fe:	6518                	ld	a4,8(a0)
ffffffffc0209700:	7171                	addi	sp,sp,-176
ffffffffc0209702:	f506                	sd	ra,168(sp)
ffffffffc0209704:	f122                	sd	s0,160(sp)
ffffffffc0209706:	ed26                	sd	s1,152(sp)
ffffffffc0209708:	e94a                	sd	s2,144(sp)
ffffffffc020970a:	e54e                	sd	s3,136(sp)
ffffffffc020970c:	e152                	sd	s4,128(sp)
ffffffffc020970e:	fcd6                	sd	s5,120(sp)
ffffffffc0209710:	f8da                	sd	s6,112(sp)
ffffffffc0209712:	f4de                	sd	s7,104(sp)
ffffffffc0209714:	f0e2                	sd	s8,96(sp)
ffffffffc0209716:	ece6                	sd	s9,88(sp)
ffffffffc0209718:	e8ea                	sd	s10,80(sp)
ffffffffc020971a:	e4ee                	sd	s11,72(sp)
ffffffffc020971c:	6785                	lui	a5,0x1
ffffffffc020971e:	24f71663          	bne	a4,a5,ffffffffc020996a <sfs_do_mount+0x26c>
ffffffffc0209722:	892a                	mv	s2,a0
ffffffffc0209724:	4501                	li	a0,0
ffffffffc0209726:	8aae                	mv	s5,a1
ffffffffc0209728:	f00fe0ef          	jal	ra,ffffffffc0207e28 <__alloc_fs>
ffffffffc020972c:	842a                	mv	s0,a0
ffffffffc020972e:	24050463          	beqz	a0,ffffffffc0209976 <sfs_do_mount+0x278>
ffffffffc0209732:	0b052b03          	lw	s6,176(a0)
ffffffffc0209736:	260b1263          	bnez	s6,ffffffffc020999a <sfs_do_mount+0x29c>
ffffffffc020973a:	03253823          	sd	s2,48(a0)
ffffffffc020973e:	6505                	lui	a0,0x1
ffffffffc0209740:	8dff80ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc0209744:	e428                	sd	a0,72(s0)
ffffffffc0209746:	84aa                	mv	s1,a0
ffffffffc0209748:	16050363          	beqz	a0,ffffffffc02098ae <sfs_do_mount+0x1b0>
ffffffffc020974c:	85aa                	mv	a1,a0
ffffffffc020974e:	4681                	li	a3,0
ffffffffc0209750:	6605                	lui	a2,0x1
ffffffffc0209752:	1008                	addi	a0,sp,32
ffffffffc0209754:	dc3fb0ef          	jal	ra,ffffffffc0205516 <iobuf_init>
ffffffffc0209758:	02093783          	ld	a5,32(s2)
ffffffffc020975c:	85aa                	mv	a1,a0
ffffffffc020975e:	4601                	li	a2,0
ffffffffc0209760:	854a                	mv	a0,s2
ffffffffc0209762:	9782                	jalr	a5
ffffffffc0209764:	8a2a                	mv	s4,a0
ffffffffc0209766:	10051e63          	bnez	a0,ffffffffc0209882 <sfs_do_mount+0x184>
ffffffffc020976a:	408c                	lw	a1,0(s1)
ffffffffc020976c:	2f8dc637          	lui	a2,0x2f8dc
ffffffffc0209770:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f866b2a>
ffffffffc0209774:	14c59863          	bne	a1,a2,ffffffffc02098c4 <sfs_do_mount+0x1c6>
ffffffffc0209778:	40dc                	lw	a5,4(s1)
ffffffffc020977a:	00093603          	ld	a2,0(s2)
ffffffffc020977e:	02079713          	slli	a4,a5,0x20
ffffffffc0209782:	9301                	srli	a4,a4,0x20
ffffffffc0209784:	12e66763          	bltu	a2,a4,ffffffffc02098b2 <sfs_do_mount+0x1b4>
ffffffffc0209788:	020485a3          	sb	zero,43(s1)
ffffffffc020978c:	0084af03          	lw	t5,8(s1)
ffffffffc0209790:	00c4ae83          	lw	t4,12(s1)
ffffffffc0209794:	0104ae03          	lw	t3,16(s1)
ffffffffc0209798:	0144a303          	lw	t1,20(s1)
ffffffffc020979c:	0184a883          	lw	a7,24(s1)
ffffffffc02097a0:	01c4a803          	lw	a6,28(s1)
ffffffffc02097a4:	5090                	lw	a2,32(s1)
ffffffffc02097a6:	50d4                	lw	a3,36(s1)
ffffffffc02097a8:	5498                	lw	a4,40(s1)
ffffffffc02097aa:	6511                	lui	a0,0x4
ffffffffc02097ac:	c00c                	sw	a1,0(s0)
ffffffffc02097ae:	c05c                	sw	a5,4(s0)
ffffffffc02097b0:	01e42423          	sw	t5,8(s0)
ffffffffc02097b4:	01d42623          	sw	t4,12(s0)
ffffffffc02097b8:	01c42823          	sw	t3,16(s0)
ffffffffc02097bc:	00642a23          	sw	t1,20(s0)
ffffffffc02097c0:	01142c23          	sw	a7,24(s0)
ffffffffc02097c4:	01042e23          	sw	a6,28(s0)
ffffffffc02097c8:	d010                	sw	a2,32(s0)
ffffffffc02097ca:	d054                	sw	a3,36(s0)
ffffffffc02097cc:	d418                	sw	a4,40(s0)
ffffffffc02097ce:	851f80ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc02097d2:	f448                	sd	a0,168(s0)
ffffffffc02097d4:	8c2a                	mv	s8,a0
ffffffffc02097d6:	18050c63          	beqz	a0,ffffffffc020996e <sfs_do_mount+0x270>
ffffffffc02097da:	6711                	lui	a4,0x4
ffffffffc02097dc:	87aa                	mv	a5,a0
ffffffffc02097de:	972a                	add	a4,a4,a0
ffffffffc02097e0:	e79c                	sd	a5,8(a5)
ffffffffc02097e2:	e39c                	sd	a5,0(a5)
ffffffffc02097e4:	07c1                	addi	a5,a5,16
ffffffffc02097e6:	fee79de3          	bne	a5,a4,ffffffffc02097e0 <sfs_do_mount+0xe2>
ffffffffc02097ea:	0044eb83          	lwu	s7,4(s1)
ffffffffc02097ee:	67a1                	lui	a5,0x8
ffffffffc02097f0:	fff78993          	addi	s3,a5,-1 # 7fff <_binary_bin_swap_img_size+0x2ff>
ffffffffc02097f4:	9bce                	add	s7,s7,s3
ffffffffc02097f6:	77e1                	lui	a5,0xffff8
ffffffffc02097f8:	00fbfbb3          	and	s7,s7,a5
ffffffffc02097fc:	2b81                	sext.w	s7,s7
ffffffffc02097fe:	855e                	mv	a0,s7
ffffffffc0209800:	a59ff0ef          	jal	ra,ffffffffc0209258 <bitmap_create>
ffffffffc0209804:	fc08                	sd	a0,56(s0)
ffffffffc0209806:	8d2a                	mv	s10,a0
ffffffffc0209808:	14050f63          	beqz	a0,ffffffffc0209966 <sfs_do_mount+0x268>
ffffffffc020980c:	0044e783          	lwu	a5,4(s1)
ffffffffc0209810:	082c                	addi	a1,sp,24
ffffffffc0209812:	97ce                	add	a5,a5,s3
ffffffffc0209814:	00f7d713          	srli	a4,a5,0xf
ffffffffc0209818:	e43a                	sd	a4,8(sp)
ffffffffc020981a:	40f7d993          	srai	s3,a5,0xf
ffffffffc020981e:	c4fff0ef          	jal	ra,ffffffffc020946c <bitmap_getdata>
ffffffffc0209822:	14050c63          	beqz	a0,ffffffffc020997a <sfs_do_mount+0x27c>
ffffffffc0209826:	00c9979b          	slliw	a5,s3,0xc
ffffffffc020982a:	66e2                	ld	a3,24(sp)
ffffffffc020982c:	1782                	slli	a5,a5,0x20
ffffffffc020982e:	9381                	srli	a5,a5,0x20
ffffffffc0209830:	14d79563          	bne	a5,a3,ffffffffc020997a <sfs_do_mount+0x27c>
ffffffffc0209834:	6722                	ld	a4,8(sp)
ffffffffc0209836:	6d89                	lui	s11,0x2
ffffffffc0209838:	89aa                	mv	s3,a0
ffffffffc020983a:	00c71c93          	slli	s9,a4,0xc
ffffffffc020983e:	9caa                	add	s9,s9,a0
ffffffffc0209840:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0209844:	e711                	bnez	a4,ffffffffc0209850 <sfs_do_mount+0x152>
ffffffffc0209846:	a079                	j	ffffffffc02098d4 <sfs_do_mount+0x1d6>
ffffffffc0209848:	6785                	lui	a5,0x1
ffffffffc020984a:	99be                	add	s3,s3,a5
ffffffffc020984c:	093c8463          	beq	s9,s3,ffffffffc02098d4 <sfs_do_mount+0x1d6>
ffffffffc0209850:	013d86bb          	addw	a3,s11,s3
ffffffffc0209854:	1682                	slli	a3,a3,0x20
ffffffffc0209856:	6605                	lui	a2,0x1
ffffffffc0209858:	85ce                	mv	a1,s3
ffffffffc020985a:	9281                	srli	a3,a3,0x20
ffffffffc020985c:	1008                	addi	a0,sp,32
ffffffffc020985e:	cb9fb0ef          	jal	ra,ffffffffc0205516 <iobuf_init>
ffffffffc0209862:	02093783          	ld	a5,32(s2)
ffffffffc0209866:	85aa                	mv	a1,a0
ffffffffc0209868:	4601                	li	a2,0
ffffffffc020986a:	854a                	mv	a0,s2
ffffffffc020986c:	9782                	jalr	a5
ffffffffc020986e:	dd69                	beqz	a0,ffffffffc0209848 <sfs_do_mount+0x14a>
ffffffffc0209870:	e42a                	sd	a0,8(sp)
ffffffffc0209872:	856a                	mv	a0,s10
ffffffffc0209874:	bdfff0ef          	jal	ra,ffffffffc0209452 <bitmap_destroy>
ffffffffc0209878:	67a2                	ld	a5,8(sp)
ffffffffc020987a:	8a3e                	mv	s4,a5
ffffffffc020987c:	8562                	mv	a0,s8
ffffffffc020987e:	851f80ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0209882:	8526                	mv	a0,s1
ffffffffc0209884:	84bf80ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0209888:	8522                	mv	a0,s0
ffffffffc020988a:	845f80ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc020988e:	70aa                	ld	ra,168(sp)
ffffffffc0209890:	740a                	ld	s0,160(sp)
ffffffffc0209892:	64ea                	ld	s1,152(sp)
ffffffffc0209894:	694a                	ld	s2,144(sp)
ffffffffc0209896:	69aa                	ld	s3,136(sp)
ffffffffc0209898:	7ae6                	ld	s5,120(sp)
ffffffffc020989a:	7b46                	ld	s6,112(sp)
ffffffffc020989c:	7ba6                	ld	s7,104(sp)
ffffffffc020989e:	7c06                	ld	s8,96(sp)
ffffffffc02098a0:	6ce6                	ld	s9,88(sp)
ffffffffc02098a2:	6d46                	ld	s10,80(sp)
ffffffffc02098a4:	6da6                	ld	s11,72(sp)
ffffffffc02098a6:	8552                	mv	a0,s4
ffffffffc02098a8:	6a0a                	ld	s4,128(sp)
ffffffffc02098aa:	614d                	addi	sp,sp,176
ffffffffc02098ac:	8082                	ret
ffffffffc02098ae:	5a71                	li	s4,-4
ffffffffc02098b0:	bfe1                	j	ffffffffc0209888 <sfs_do_mount+0x18a>
ffffffffc02098b2:	85be                	mv	a1,a5
ffffffffc02098b4:	00006517          	auipc	a0,0x6
ffffffffc02098b8:	acc50513          	addi	a0,a0,-1332 # ffffffffc020f380 <dev_node_ops+0x4d8>
ffffffffc02098bc:	8ebf60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02098c0:	5a75                	li	s4,-3
ffffffffc02098c2:	b7c1                	j	ffffffffc0209882 <sfs_do_mount+0x184>
ffffffffc02098c4:	00006517          	auipc	a0,0x6
ffffffffc02098c8:	a8450513          	addi	a0,a0,-1404 # ffffffffc020f348 <dev_node_ops+0x4a0>
ffffffffc02098cc:	8dbf60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02098d0:	5a75                	li	s4,-3
ffffffffc02098d2:	bf45                	j	ffffffffc0209882 <sfs_do_mount+0x184>
ffffffffc02098d4:	00442903          	lw	s2,4(s0)
ffffffffc02098d8:	4481                	li	s1,0
ffffffffc02098da:	080b8c63          	beqz	s7,ffffffffc0209972 <sfs_do_mount+0x274>
ffffffffc02098de:	85a6                	mv	a1,s1
ffffffffc02098e0:	856a                	mv	a0,s10
ffffffffc02098e2:	af7ff0ef          	jal	ra,ffffffffc02093d8 <bitmap_test>
ffffffffc02098e6:	c111                	beqz	a0,ffffffffc02098ea <sfs_do_mount+0x1ec>
ffffffffc02098e8:	2b05                	addiw	s6,s6,1
ffffffffc02098ea:	2485                	addiw	s1,s1,1
ffffffffc02098ec:	fe9b99e3          	bne	s7,s1,ffffffffc02098de <sfs_do_mount+0x1e0>
ffffffffc02098f0:	441c                	lw	a5,8(s0)
ffffffffc02098f2:	0d679463          	bne	a5,s6,ffffffffc02099ba <sfs_do_mount+0x2bc>
ffffffffc02098f6:	4585                	li	a1,1
ffffffffc02098f8:	05040513          	addi	a0,s0,80
ffffffffc02098fc:	04043023          	sd	zero,64(s0)
ffffffffc0209900:	dfbfa0ef          	jal	ra,ffffffffc02046fa <sem_init>
ffffffffc0209904:	4585                	li	a1,1
ffffffffc0209906:	06840513          	addi	a0,s0,104
ffffffffc020990a:	df1fa0ef          	jal	ra,ffffffffc02046fa <sem_init>
ffffffffc020990e:	4585                	li	a1,1
ffffffffc0209910:	08040513          	addi	a0,s0,128
ffffffffc0209914:	de7fa0ef          	jal	ra,ffffffffc02046fa <sem_init>
ffffffffc0209918:	09840793          	addi	a5,s0,152
ffffffffc020991c:	f05c                	sd	a5,160(s0)
ffffffffc020991e:	ec5c                	sd	a5,152(s0)
ffffffffc0209920:	874a                	mv	a4,s2
ffffffffc0209922:	86da                	mv	a3,s6
ffffffffc0209924:	4169063b          	subw	a2,s2,s6
ffffffffc0209928:	00c40593          	addi	a1,s0,12
ffffffffc020992c:	00006517          	auipc	a0,0x6
ffffffffc0209930:	ae450513          	addi	a0,a0,-1308 # ffffffffc020f410 <dev_node_ops+0x568>
ffffffffc0209934:	873f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0209938:	00000797          	auipc	a5,0x0
ffffffffc020993c:	c8878793          	addi	a5,a5,-888 # ffffffffc02095c0 <sfs_sync>
ffffffffc0209940:	fc5c                	sd	a5,184(s0)
ffffffffc0209942:	00000797          	auipc	a5,0x0
ffffffffc0209946:	d6478793          	addi	a5,a5,-668 # ffffffffc02096a6 <sfs_get_root>
ffffffffc020994a:	e07c                	sd	a5,192(s0)
ffffffffc020994c:	00000797          	auipc	a5,0x0
ffffffffc0209950:	b5e78793          	addi	a5,a5,-1186 # ffffffffc02094aa <sfs_unmount>
ffffffffc0209954:	e47c                	sd	a5,200(s0)
ffffffffc0209956:	00000797          	auipc	a5,0x0
ffffffffc020995a:	bd878793          	addi	a5,a5,-1064 # ffffffffc020952e <sfs_cleanup>
ffffffffc020995e:	e87c                	sd	a5,208(s0)
ffffffffc0209960:	008ab023          	sd	s0,0(s5)
ffffffffc0209964:	b72d                	j	ffffffffc020988e <sfs_do_mount+0x190>
ffffffffc0209966:	5a71                	li	s4,-4
ffffffffc0209968:	bf11                	j	ffffffffc020987c <sfs_do_mount+0x17e>
ffffffffc020996a:	5a49                	li	s4,-14
ffffffffc020996c:	b70d                	j	ffffffffc020988e <sfs_do_mount+0x190>
ffffffffc020996e:	5a71                	li	s4,-4
ffffffffc0209970:	bf09                	j	ffffffffc0209882 <sfs_do_mount+0x184>
ffffffffc0209972:	4b01                	li	s6,0
ffffffffc0209974:	bfb5                	j	ffffffffc02098f0 <sfs_do_mount+0x1f2>
ffffffffc0209976:	5a71                	li	s4,-4
ffffffffc0209978:	bf19                	j	ffffffffc020988e <sfs_do_mount+0x190>
ffffffffc020997a:	00006697          	auipc	a3,0x6
ffffffffc020997e:	a3668693          	addi	a3,a3,-1482 # ffffffffc020f3b0 <dev_node_ops+0x508>
ffffffffc0209982:	00002617          	auipc	a2,0x2
ffffffffc0209986:	3be60613          	addi	a2,a2,958 # ffffffffc020bd40 <commands+0x210>
ffffffffc020998a:	08300593          	li	a1,131
ffffffffc020998e:	00006517          	auipc	a0,0x6
ffffffffc0209992:	92a50513          	addi	a0,a0,-1750 # ffffffffc020f2b8 <dev_node_ops+0x410>
ffffffffc0209996:	b09f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020999a:	00006697          	auipc	a3,0x6
ffffffffc020999e:	8ee68693          	addi	a3,a3,-1810 # ffffffffc020f288 <dev_node_ops+0x3e0>
ffffffffc02099a2:	00002617          	auipc	a2,0x2
ffffffffc02099a6:	39e60613          	addi	a2,a2,926 # ffffffffc020bd40 <commands+0x210>
ffffffffc02099aa:	0a300593          	li	a1,163
ffffffffc02099ae:	00006517          	auipc	a0,0x6
ffffffffc02099b2:	90a50513          	addi	a0,a0,-1782 # ffffffffc020f2b8 <dev_node_ops+0x410>
ffffffffc02099b6:	ae9f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02099ba:	00006697          	auipc	a3,0x6
ffffffffc02099be:	a2668693          	addi	a3,a3,-1498 # ffffffffc020f3e0 <dev_node_ops+0x538>
ffffffffc02099c2:	00002617          	auipc	a2,0x2
ffffffffc02099c6:	37e60613          	addi	a2,a2,894 # ffffffffc020bd40 <commands+0x210>
ffffffffc02099ca:	0e000593          	li	a1,224
ffffffffc02099ce:	00006517          	auipc	a0,0x6
ffffffffc02099d2:	8ea50513          	addi	a0,a0,-1814 # ffffffffc020f2b8 <dev_node_ops+0x410>
ffffffffc02099d6:	ac9f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02099da <sfs_mount>:
ffffffffc02099da:	00000597          	auipc	a1,0x0
ffffffffc02099de:	d2458593          	addi	a1,a1,-732 # ffffffffc02096fe <sfs_do_mount>
ffffffffc02099e2:	817fe06f          	j	ffffffffc02081f8 <vfs_mount>

ffffffffc02099e6 <sfs_opendir>:
ffffffffc02099e6:	0235f593          	andi	a1,a1,35
ffffffffc02099ea:	4501                	li	a0,0
ffffffffc02099ec:	e191                	bnez	a1,ffffffffc02099f0 <sfs_opendir+0xa>
ffffffffc02099ee:	8082                	ret
ffffffffc02099f0:	553d                	li	a0,-17
ffffffffc02099f2:	8082                	ret

ffffffffc02099f4 <sfs_openfile>:
ffffffffc02099f4:	4501                	li	a0,0
ffffffffc02099f6:	8082                	ret

ffffffffc02099f8 <sfs_gettype>:
ffffffffc02099f8:	1141                	addi	sp,sp,-16
ffffffffc02099fa:	e406                	sd	ra,8(sp)
ffffffffc02099fc:	c939                	beqz	a0,ffffffffc0209a52 <sfs_gettype+0x5a>
ffffffffc02099fe:	4d34                	lw	a3,88(a0)
ffffffffc0209a00:	6785                	lui	a5,0x1
ffffffffc0209a02:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209a06:	04e69663          	bne	a3,a4,ffffffffc0209a52 <sfs_gettype+0x5a>
ffffffffc0209a0a:	6114                	ld	a3,0(a0)
ffffffffc0209a0c:	4709                	li	a4,2
ffffffffc0209a0e:	0046d683          	lhu	a3,4(a3)
ffffffffc0209a12:	02e68a63          	beq	a3,a4,ffffffffc0209a46 <sfs_gettype+0x4e>
ffffffffc0209a16:	470d                	li	a4,3
ffffffffc0209a18:	02e68163          	beq	a3,a4,ffffffffc0209a3a <sfs_gettype+0x42>
ffffffffc0209a1c:	4705                	li	a4,1
ffffffffc0209a1e:	00e68f63          	beq	a3,a4,ffffffffc0209a3c <sfs_gettype+0x44>
ffffffffc0209a22:	00006617          	auipc	a2,0x6
ffffffffc0209a26:	a5e60613          	addi	a2,a2,-1442 # ffffffffc020f480 <dev_node_ops+0x5d8>
ffffffffc0209a2a:	3a800593          	li	a1,936
ffffffffc0209a2e:	00006517          	auipc	a0,0x6
ffffffffc0209a32:	a3a50513          	addi	a0,a0,-1478 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209a36:	a69f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209a3a:	678d                	lui	a5,0x3
ffffffffc0209a3c:	60a2                	ld	ra,8(sp)
ffffffffc0209a3e:	c19c                	sw	a5,0(a1)
ffffffffc0209a40:	4501                	li	a0,0
ffffffffc0209a42:	0141                	addi	sp,sp,16
ffffffffc0209a44:	8082                	ret
ffffffffc0209a46:	60a2                	ld	ra,8(sp)
ffffffffc0209a48:	6789                	lui	a5,0x2
ffffffffc0209a4a:	c19c                	sw	a5,0(a1)
ffffffffc0209a4c:	4501                	li	a0,0
ffffffffc0209a4e:	0141                	addi	sp,sp,16
ffffffffc0209a50:	8082                	ret
ffffffffc0209a52:	00006697          	auipc	a3,0x6
ffffffffc0209a56:	9de68693          	addi	a3,a3,-1570 # ffffffffc020f430 <dev_node_ops+0x588>
ffffffffc0209a5a:	00002617          	auipc	a2,0x2
ffffffffc0209a5e:	2e660613          	addi	a2,a2,742 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209a62:	39c00593          	li	a1,924
ffffffffc0209a66:	00006517          	auipc	a0,0x6
ffffffffc0209a6a:	a0250513          	addi	a0,a0,-1534 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209a6e:	a31f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209a72 <sfs_fsync>:
ffffffffc0209a72:	7179                	addi	sp,sp,-48
ffffffffc0209a74:	ec26                	sd	s1,24(sp)
ffffffffc0209a76:	7524                	ld	s1,104(a0)
ffffffffc0209a78:	f406                	sd	ra,40(sp)
ffffffffc0209a7a:	f022                	sd	s0,32(sp)
ffffffffc0209a7c:	e84a                	sd	s2,16(sp)
ffffffffc0209a7e:	e44e                	sd	s3,8(sp)
ffffffffc0209a80:	c4bd                	beqz	s1,ffffffffc0209aee <sfs_fsync+0x7c>
ffffffffc0209a82:	0b04a783          	lw	a5,176(s1)
ffffffffc0209a86:	e7a5                	bnez	a5,ffffffffc0209aee <sfs_fsync+0x7c>
ffffffffc0209a88:	4d38                	lw	a4,88(a0)
ffffffffc0209a8a:	6785                	lui	a5,0x1
ffffffffc0209a8c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209a90:	842a                	mv	s0,a0
ffffffffc0209a92:	06f71e63          	bne	a4,a5,ffffffffc0209b0e <sfs_fsync+0x9c>
ffffffffc0209a96:	691c                	ld	a5,16(a0)
ffffffffc0209a98:	4901                	li	s2,0
ffffffffc0209a9a:	eb89                	bnez	a5,ffffffffc0209aac <sfs_fsync+0x3a>
ffffffffc0209a9c:	70a2                	ld	ra,40(sp)
ffffffffc0209a9e:	7402                	ld	s0,32(sp)
ffffffffc0209aa0:	64e2                	ld	s1,24(sp)
ffffffffc0209aa2:	69a2                	ld	s3,8(sp)
ffffffffc0209aa4:	854a                	mv	a0,s2
ffffffffc0209aa6:	6942                	ld	s2,16(sp)
ffffffffc0209aa8:	6145                	addi	sp,sp,48
ffffffffc0209aaa:	8082                	ret
ffffffffc0209aac:	02050993          	addi	s3,a0,32
ffffffffc0209ab0:	854e                	mv	a0,s3
ffffffffc0209ab2:	c53fa0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc0209ab6:	681c                	ld	a5,16(s0)
ffffffffc0209ab8:	ef81                	bnez	a5,ffffffffc0209ad0 <sfs_fsync+0x5e>
ffffffffc0209aba:	854e                	mv	a0,s3
ffffffffc0209abc:	c45fa0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc0209ac0:	70a2                	ld	ra,40(sp)
ffffffffc0209ac2:	7402                	ld	s0,32(sp)
ffffffffc0209ac4:	64e2                	ld	s1,24(sp)
ffffffffc0209ac6:	69a2                	ld	s3,8(sp)
ffffffffc0209ac8:	854a                	mv	a0,s2
ffffffffc0209aca:	6942                	ld	s2,16(sp)
ffffffffc0209acc:	6145                	addi	sp,sp,48
ffffffffc0209ace:	8082                	ret
ffffffffc0209ad0:	4414                	lw	a3,8(s0)
ffffffffc0209ad2:	600c                	ld	a1,0(s0)
ffffffffc0209ad4:	00043823          	sd	zero,16(s0)
ffffffffc0209ad8:	4701                	li	a4,0
ffffffffc0209ada:	04000613          	li	a2,64
ffffffffc0209ade:	8526                	mv	a0,s1
ffffffffc0209ae0:	676010ef          	jal	ra,ffffffffc020b156 <sfs_wbuf>
ffffffffc0209ae4:	892a                	mv	s2,a0
ffffffffc0209ae6:	d971                	beqz	a0,ffffffffc0209aba <sfs_fsync+0x48>
ffffffffc0209ae8:	4785                	li	a5,1
ffffffffc0209aea:	e81c                	sd	a5,16(s0)
ffffffffc0209aec:	b7f9                	j	ffffffffc0209aba <sfs_fsync+0x48>
ffffffffc0209aee:	00005697          	auipc	a3,0x5
ffffffffc0209af2:	79a68693          	addi	a3,a3,1946 # ffffffffc020f288 <dev_node_ops+0x3e0>
ffffffffc0209af6:	00002617          	auipc	a2,0x2
ffffffffc0209afa:	24a60613          	addi	a2,a2,586 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209afe:	2e000593          	li	a1,736
ffffffffc0209b02:	00006517          	auipc	a0,0x6
ffffffffc0209b06:	96650513          	addi	a0,a0,-1690 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209b0a:	995f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209b0e:	00006697          	auipc	a3,0x6
ffffffffc0209b12:	92268693          	addi	a3,a3,-1758 # ffffffffc020f430 <dev_node_ops+0x588>
ffffffffc0209b16:	00002617          	auipc	a2,0x2
ffffffffc0209b1a:	22a60613          	addi	a2,a2,554 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209b1e:	2e100593          	li	a1,737
ffffffffc0209b22:	00006517          	auipc	a0,0x6
ffffffffc0209b26:	94650513          	addi	a0,a0,-1722 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209b2a:	975f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209b2e <sfs_fstat>:
ffffffffc0209b2e:	1101                	addi	sp,sp,-32
ffffffffc0209b30:	e426                	sd	s1,8(sp)
ffffffffc0209b32:	84ae                	mv	s1,a1
ffffffffc0209b34:	e822                	sd	s0,16(sp)
ffffffffc0209b36:	02000613          	li	a2,32
ffffffffc0209b3a:	842a                	mv	s0,a0
ffffffffc0209b3c:	4581                	li	a1,0
ffffffffc0209b3e:	8526                	mv	a0,s1
ffffffffc0209b40:	ec06                	sd	ra,24(sp)
ffffffffc0209b42:	519010ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc0209b46:	c439                	beqz	s0,ffffffffc0209b94 <sfs_fstat+0x66>
ffffffffc0209b48:	783c                	ld	a5,112(s0)
ffffffffc0209b4a:	c7a9                	beqz	a5,ffffffffc0209b94 <sfs_fstat+0x66>
ffffffffc0209b4c:	6bbc                	ld	a5,80(a5)
ffffffffc0209b4e:	c3b9                	beqz	a5,ffffffffc0209b94 <sfs_fstat+0x66>
ffffffffc0209b50:	00005597          	auipc	a1,0x5
ffffffffc0209b54:	2d058593          	addi	a1,a1,720 # ffffffffc020ee20 <syscalls+0xdb0>
ffffffffc0209b58:	8522                	mv	a0,s0
ffffffffc0209b5a:	8cefe0ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0209b5e:	783c                	ld	a5,112(s0)
ffffffffc0209b60:	85a6                	mv	a1,s1
ffffffffc0209b62:	8522                	mv	a0,s0
ffffffffc0209b64:	6bbc                	ld	a5,80(a5)
ffffffffc0209b66:	9782                	jalr	a5
ffffffffc0209b68:	e10d                	bnez	a0,ffffffffc0209b8a <sfs_fstat+0x5c>
ffffffffc0209b6a:	4c38                	lw	a4,88(s0)
ffffffffc0209b6c:	6785                	lui	a5,0x1
ffffffffc0209b6e:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209b72:	04f71163          	bne	a4,a5,ffffffffc0209bb4 <sfs_fstat+0x86>
ffffffffc0209b76:	601c                	ld	a5,0(s0)
ffffffffc0209b78:	0067d683          	lhu	a3,6(a5)
ffffffffc0209b7c:	0087e703          	lwu	a4,8(a5)
ffffffffc0209b80:	0007e783          	lwu	a5,0(a5)
ffffffffc0209b84:	e494                	sd	a3,8(s1)
ffffffffc0209b86:	e898                	sd	a4,16(s1)
ffffffffc0209b88:	ec9c                	sd	a5,24(s1)
ffffffffc0209b8a:	60e2                	ld	ra,24(sp)
ffffffffc0209b8c:	6442                	ld	s0,16(sp)
ffffffffc0209b8e:	64a2                	ld	s1,8(sp)
ffffffffc0209b90:	6105                	addi	sp,sp,32
ffffffffc0209b92:	8082                	ret
ffffffffc0209b94:	00005697          	auipc	a3,0x5
ffffffffc0209b98:	22468693          	addi	a3,a3,548 # ffffffffc020edb8 <syscalls+0xd48>
ffffffffc0209b9c:	00002617          	auipc	a2,0x2
ffffffffc0209ba0:	1a460613          	addi	a2,a2,420 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209ba4:	2d100593          	li	a1,721
ffffffffc0209ba8:	00006517          	auipc	a0,0x6
ffffffffc0209bac:	8c050513          	addi	a0,a0,-1856 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209bb0:	8eff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209bb4:	00006697          	auipc	a3,0x6
ffffffffc0209bb8:	87c68693          	addi	a3,a3,-1924 # ffffffffc020f430 <dev_node_ops+0x588>
ffffffffc0209bbc:	00002617          	auipc	a2,0x2
ffffffffc0209bc0:	18460613          	addi	a2,a2,388 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209bc4:	2d400593          	li	a1,724
ffffffffc0209bc8:	00006517          	auipc	a0,0x6
ffffffffc0209bcc:	8a050513          	addi	a0,a0,-1888 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209bd0:	8cff60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209bd4 <sfs_tryseek>:
ffffffffc0209bd4:	080007b7          	lui	a5,0x8000
ffffffffc0209bd8:	04f5fd63          	bgeu	a1,a5,ffffffffc0209c32 <sfs_tryseek+0x5e>
ffffffffc0209bdc:	1101                	addi	sp,sp,-32
ffffffffc0209bde:	e822                	sd	s0,16(sp)
ffffffffc0209be0:	ec06                	sd	ra,24(sp)
ffffffffc0209be2:	e426                	sd	s1,8(sp)
ffffffffc0209be4:	842a                	mv	s0,a0
ffffffffc0209be6:	c921                	beqz	a0,ffffffffc0209c36 <sfs_tryseek+0x62>
ffffffffc0209be8:	4d38                	lw	a4,88(a0)
ffffffffc0209bea:	6785                	lui	a5,0x1
ffffffffc0209bec:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209bf0:	04f71363          	bne	a4,a5,ffffffffc0209c36 <sfs_tryseek+0x62>
ffffffffc0209bf4:	611c                	ld	a5,0(a0)
ffffffffc0209bf6:	84ae                	mv	s1,a1
ffffffffc0209bf8:	0007e783          	lwu	a5,0(a5)
ffffffffc0209bfc:	02b7d563          	bge	a5,a1,ffffffffc0209c26 <sfs_tryseek+0x52>
ffffffffc0209c00:	793c                	ld	a5,112(a0)
ffffffffc0209c02:	cbb1                	beqz	a5,ffffffffc0209c56 <sfs_tryseek+0x82>
ffffffffc0209c04:	73bc                	ld	a5,96(a5)
ffffffffc0209c06:	cba1                	beqz	a5,ffffffffc0209c56 <sfs_tryseek+0x82>
ffffffffc0209c08:	00005597          	auipc	a1,0x5
ffffffffc0209c0c:	10858593          	addi	a1,a1,264 # ffffffffc020ed10 <syscalls+0xca0>
ffffffffc0209c10:	818fe0ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0209c14:	783c                	ld	a5,112(s0)
ffffffffc0209c16:	8522                	mv	a0,s0
ffffffffc0209c18:	6442                	ld	s0,16(sp)
ffffffffc0209c1a:	60e2                	ld	ra,24(sp)
ffffffffc0209c1c:	73bc                	ld	a5,96(a5)
ffffffffc0209c1e:	85a6                	mv	a1,s1
ffffffffc0209c20:	64a2                	ld	s1,8(sp)
ffffffffc0209c22:	6105                	addi	sp,sp,32
ffffffffc0209c24:	8782                	jr	a5
ffffffffc0209c26:	60e2                	ld	ra,24(sp)
ffffffffc0209c28:	6442                	ld	s0,16(sp)
ffffffffc0209c2a:	64a2                	ld	s1,8(sp)
ffffffffc0209c2c:	4501                	li	a0,0
ffffffffc0209c2e:	6105                	addi	sp,sp,32
ffffffffc0209c30:	8082                	ret
ffffffffc0209c32:	5575                	li	a0,-3
ffffffffc0209c34:	8082                	ret
ffffffffc0209c36:	00005697          	auipc	a3,0x5
ffffffffc0209c3a:	7fa68693          	addi	a3,a3,2042 # ffffffffc020f430 <dev_node_ops+0x588>
ffffffffc0209c3e:	00002617          	auipc	a2,0x2
ffffffffc0209c42:	10260613          	addi	a2,a2,258 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209c46:	3b300593          	li	a1,947
ffffffffc0209c4a:	00006517          	auipc	a0,0x6
ffffffffc0209c4e:	81e50513          	addi	a0,a0,-2018 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209c52:	84df60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209c56:	00005697          	auipc	a3,0x5
ffffffffc0209c5a:	06268693          	addi	a3,a3,98 # ffffffffc020ecb8 <syscalls+0xc48>
ffffffffc0209c5e:	00002617          	auipc	a2,0x2
ffffffffc0209c62:	0e260613          	addi	a2,a2,226 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209c66:	3b500593          	li	a1,949
ffffffffc0209c6a:	00005517          	auipc	a0,0x5
ffffffffc0209c6e:	7fe50513          	addi	a0,a0,2046 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209c72:	82df60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209c76 <sfs_close>:
ffffffffc0209c76:	1141                	addi	sp,sp,-16
ffffffffc0209c78:	e406                	sd	ra,8(sp)
ffffffffc0209c7a:	e022                	sd	s0,0(sp)
ffffffffc0209c7c:	c11d                	beqz	a0,ffffffffc0209ca2 <sfs_close+0x2c>
ffffffffc0209c7e:	793c                	ld	a5,112(a0)
ffffffffc0209c80:	842a                	mv	s0,a0
ffffffffc0209c82:	c385                	beqz	a5,ffffffffc0209ca2 <sfs_close+0x2c>
ffffffffc0209c84:	7b9c                	ld	a5,48(a5)
ffffffffc0209c86:	cf91                	beqz	a5,ffffffffc0209ca2 <sfs_close+0x2c>
ffffffffc0209c88:	00004597          	auipc	a1,0x4
ffffffffc0209c8c:	a7858593          	addi	a1,a1,-1416 # ffffffffc020d700 <default_pmm_manager+0xea0>
ffffffffc0209c90:	f99fd0ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0209c94:	783c                	ld	a5,112(s0)
ffffffffc0209c96:	8522                	mv	a0,s0
ffffffffc0209c98:	6402                	ld	s0,0(sp)
ffffffffc0209c9a:	60a2                	ld	ra,8(sp)
ffffffffc0209c9c:	7b9c                	ld	a5,48(a5)
ffffffffc0209c9e:	0141                	addi	sp,sp,16
ffffffffc0209ca0:	8782                	jr	a5
ffffffffc0209ca2:	00004697          	auipc	a3,0x4
ffffffffc0209ca6:	a0e68693          	addi	a3,a3,-1522 # ffffffffc020d6b0 <default_pmm_manager+0xe50>
ffffffffc0209caa:	00002617          	auipc	a2,0x2
ffffffffc0209cae:	09660613          	addi	a2,a2,150 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209cb2:	21c00593          	li	a1,540
ffffffffc0209cb6:	00005517          	auipc	a0,0x5
ffffffffc0209cba:	7b250513          	addi	a0,a0,1970 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209cbe:	fe0f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209cc2 <sfs_io.part.0>:
ffffffffc0209cc2:	1141                	addi	sp,sp,-16
ffffffffc0209cc4:	00005697          	auipc	a3,0x5
ffffffffc0209cc8:	76c68693          	addi	a3,a3,1900 # ffffffffc020f430 <dev_node_ops+0x588>
ffffffffc0209ccc:	00002617          	auipc	a2,0x2
ffffffffc0209cd0:	07460613          	addi	a2,a2,116 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209cd4:	2b000593          	li	a1,688
ffffffffc0209cd8:	00005517          	auipc	a0,0x5
ffffffffc0209cdc:	79050513          	addi	a0,a0,1936 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209ce0:	e406                	sd	ra,8(sp)
ffffffffc0209ce2:	fbcf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209ce6 <sfs_block_free>:
ffffffffc0209ce6:	1101                	addi	sp,sp,-32
ffffffffc0209ce8:	e426                	sd	s1,8(sp)
ffffffffc0209cea:	ec06                	sd	ra,24(sp)
ffffffffc0209cec:	e822                	sd	s0,16(sp)
ffffffffc0209cee:	4154                	lw	a3,4(a0)
ffffffffc0209cf0:	84ae                	mv	s1,a1
ffffffffc0209cf2:	c595                	beqz	a1,ffffffffc0209d1e <sfs_block_free+0x38>
ffffffffc0209cf4:	02d5f563          	bgeu	a1,a3,ffffffffc0209d1e <sfs_block_free+0x38>
ffffffffc0209cf8:	842a                	mv	s0,a0
ffffffffc0209cfa:	7d08                	ld	a0,56(a0)
ffffffffc0209cfc:	edcff0ef          	jal	ra,ffffffffc02093d8 <bitmap_test>
ffffffffc0209d00:	ed05                	bnez	a0,ffffffffc0209d38 <sfs_block_free+0x52>
ffffffffc0209d02:	7c08                	ld	a0,56(s0)
ffffffffc0209d04:	85a6                	mv	a1,s1
ffffffffc0209d06:	efaff0ef          	jal	ra,ffffffffc0209400 <bitmap_free>
ffffffffc0209d0a:	441c                	lw	a5,8(s0)
ffffffffc0209d0c:	4705                	li	a4,1
ffffffffc0209d0e:	60e2                	ld	ra,24(sp)
ffffffffc0209d10:	2785                	addiw	a5,a5,1
ffffffffc0209d12:	e038                	sd	a4,64(s0)
ffffffffc0209d14:	c41c                	sw	a5,8(s0)
ffffffffc0209d16:	6442                	ld	s0,16(sp)
ffffffffc0209d18:	64a2                	ld	s1,8(sp)
ffffffffc0209d1a:	6105                	addi	sp,sp,32
ffffffffc0209d1c:	8082                	ret
ffffffffc0209d1e:	8726                	mv	a4,s1
ffffffffc0209d20:	00005617          	auipc	a2,0x5
ffffffffc0209d24:	77860613          	addi	a2,a2,1912 # ffffffffc020f498 <dev_node_ops+0x5f0>
ffffffffc0209d28:	05300593          	li	a1,83
ffffffffc0209d2c:	00005517          	auipc	a0,0x5
ffffffffc0209d30:	73c50513          	addi	a0,a0,1852 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209d34:	f6af60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d38:	00005697          	auipc	a3,0x5
ffffffffc0209d3c:	79868693          	addi	a3,a3,1944 # ffffffffc020f4d0 <dev_node_ops+0x628>
ffffffffc0209d40:	00002617          	auipc	a2,0x2
ffffffffc0209d44:	00060613          	mv	a2,a2
ffffffffc0209d48:	06a00593          	li	a1,106
ffffffffc0209d4c:	00005517          	auipc	a0,0x5
ffffffffc0209d50:	71c50513          	addi	a0,a0,1820 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209d54:	f4af60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209d58 <sfs_reclaim>:
ffffffffc0209d58:	1101                	addi	sp,sp,-32
ffffffffc0209d5a:	e426                	sd	s1,8(sp)
ffffffffc0209d5c:	7524                	ld	s1,104(a0)
ffffffffc0209d5e:	ec06                	sd	ra,24(sp)
ffffffffc0209d60:	e822                	sd	s0,16(sp)
ffffffffc0209d62:	e04a                	sd	s2,0(sp)
ffffffffc0209d64:	0e048a63          	beqz	s1,ffffffffc0209e58 <sfs_reclaim+0x100>
ffffffffc0209d68:	0b04a783          	lw	a5,176(s1)
ffffffffc0209d6c:	0e079663          	bnez	a5,ffffffffc0209e58 <sfs_reclaim+0x100>
ffffffffc0209d70:	4d38                	lw	a4,88(a0)
ffffffffc0209d72:	6785                	lui	a5,0x1
ffffffffc0209d74:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209d78:	842a                	mv	s0,a0
ffffffffc0209d7a:	10f71f63          	bne	a4,a5,ffffffffc0209e98 <sfs_reclaim+0x140>
ffffffffc0209d7e:	8526                	mv	a0,s1
ffffffffc0209d80:	586010ef          	jal	ra,ffffffffc020b306 <lock_sfs_fs>
ffffffffc0209d84:	4c1c                	lw	a5,24(s0)
ffffffffc0209d86:	0ef05963          	blez	a5,ffffffffc0209e78 <sfs_reclaim+0x120>
ffffffffc0209d8a:	fff7871b          	addiw	a4,a5,-1
ffffffffc0209d8e:	cc18                	sw	a4,24(s0)
ffffffffc0209d90:	eb59                	bnez	a4,ffffffffc0209e26 <sfs_reclaim+0xce>
ffffffffc0209d92:	05c42903          	lw	s2,92(s0)
ffffffffc0209d96:	08091863          	bnez	s2,ffffffffc0209e26 <sfs_reclaim+0xce>
ffffffffc0209d9a:	601c                	ld	a5,0(s0)
ffffffffc0209d9c:	0067d783          	lhu	a5,6(a5)
ffffffffc0209da0:	e785                	bnez	a5,ffffffffc0209dc8 <sfs_reclaim+0x70>
ffffffffc0209da2:	783c                	ld	a5,112(s0)
ffffffffc0209da4:	10078a63          	beqz	a5,ffffffffc0209eb8 <sfs_reclaim+0x160>
ffffffffc0209da8:	73bc                	ld	a5,96(a5)
ffffffffc0209daa:	10078763          	beqz	a5,ffffffffc0209eb8 <sfs_reclaim+0x160>
ffffffffc0209dae:	00005597          	auipc	a1,0x5
ffffffffc0209db2:	f6258593          	addi	a1,a1,-158 # ffffffffc020ed10 <syscalls+0xca0>
ffffffffc0209db6:	8522                	mv	a0,s0
ffffffffc0209db8:	e71fd0ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0209dbc:	783c                	ld	a5,112(s0)
ffffffffc0209dbe:	4581                	li	a1,0
ffffffffc0209dc0:	8522                	mv	a0,s0
ffffffffc0209dc2:	73bc                	ld	a5,96(a5)
ffffffffc0209dc4:	9782                	jalr	a5
ffffffffc0209dc6:	e559                	bnez	a0,ffffffffc0209e54 <sfs_reclaim+0xfc>
ffffffffc0209dc8:	681c                	ld	a5,16(s0)
ffffffffc0209dca:	c39d                	beqz	a5,ffffffffc0209df0 <sfs_reclaim+0x98>
ffffffffc0209dcc:	783c                	ld	a5,112(s0)
ffffffffc0209dce:	10078563          	beqz	a5,ffffffffc0209ed8 <sfs_reclaim+0x180>
ffffffffc0209dd2:	7b9c                	ld	a5,48(a5)
ffffffffc0209dd4:	10078263          	beqz	a5,ffffffffc0209ed8 <sfs_reclaim+0x180>
ffffffffc0209dd8:	8522                	mv	a0,s0
ffffffffc0209dda:	00004597          	auipc	a1,0x4
ffffffffc0209dde:	92658593          	addi	a1,a1,-1754 # ffffffffc020d700 <default_pmm_manager+0xea0>
ffffffffc0209de2:	e47fd0ef          	jal	ra,ffffffffc0207c28 <inode_check>
ffffffffc0209de6:	783c                	ld	a5,112(s0)
ffffffffc0209de8:	8522                	mv	a0,s0
ffffffffc0209dea:	7b9c                	ld	a5,48(a5)
ffffffffc0209dec:	9782                	jalr	a5
ffffffffc0209dee:	e13d                	bnez	a0,ffffffffc0209e54 <sfs_reclaim+0xfc>
ffffffffc0209df0:	7c18                	ld	a4,56(s0)
ffffffffc0209df2:	603c                	ld	a5,64(s0)
ffffffffc0209df4:	8526                	mv	a0,s1
ffffffffc0209df6:	e71c                	sd	a5,8(a4)
ffffffffc0209df8:	e398                	sd	a4,0(a5)
ffffffffc0209dfa:	6438                	ld	a4,72(s0)
ffffffffc0209dfc:	683c                	ld	a5,80(s0)
ffffffffc0209dfe:	e71c                	sd	a5,8(a4)
ffffffffc0209e00:	e398                	sd	a4,0(a5)
ffffffffc0209e02:	514010ef          	jal	ra,ffffffffc020b316 <unlock_sfs_fs>
ffffffffc0209e06:	6008                	ld	a0,0(s0)
ffffffffc0209e08:	00655783          	lhu	a5,6(a0)
ffffffffc0209e0c:	cb85                	beqz	a5,ffffffffc0209e3c <sfs_reclaim+0xe4>
ffffffffc0209e0e:	ac0f80ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc0209e12:	8522                	mv	a0,s0
ffffffffc0209e14:	da9fd0ef          	jal	ra,ffffffffc0207bbc <inode_kill>
ffffffffc0209e18:	60e2                	ld	ra,24(sp)
ffffffffc0209e1a:	6442                	ld	s0,16(sp)
ffffffffc0209e1c:	64a2                	ld	s1,8(sp)
ffffffffc0209e1e:	854a                	mv	a0,s2
ffffffffc0209e20:	6902                	ld	s2,0(sp)
ffffffffc0209e22:	6105                	addi	sp,sp,32
ffffffffc0209e24:	8082                	ret
ffffffffc0209e26:	5945                	li	s2,-15
ffffffffc0209e28:	8526                	mv	a0,s1
ffffffffc0209e2a:	4ec010ef          	jal	ra,ffffffffc020b316 <unlock_sfs_fs>
ffffffffc0209e2e:	60e2                	ld	ra,24(sp)
ffffffffc0209e30:	6442                	ld	s0,16(sp)
ffffffffc0209e32:	64a2                	ld	s1,8(sp)
ffffffffc0209e34:	854a                	mv	a0,s2
ffffffffc0209e36:	6902                	ld	s2,0(sp)
ffffffffc0209e38:	6105                	addi	sp,sp,32
ffffffffc0209e3a:	8082                	ret
ffffffffc0209e3c:	440c                	lw	a1,8(s0)
ffffffffc0209e3e:	8526                	mv	a0,s1
ffffffffc0209e40:	ea7ff0ef          	jal	ra,ffffffffc0209ce6 <sfs_block_free>
ffffffffc0209e44:	6008                	ld	a0,0(s0)
ffffffffc0209e46:	5d4c                	lw	a1,60(a0)
ffffffffc0209e48:	d1f9                	beqz	a1,ffffffffc0209e0e <sfs_reclaim+0xb6>
ffffffffc0209e4a:	8526                	mv	a0,s1
ffffffffc0209e4c:	e9bff0ef          	jal	ra,ffffffffc0209ce6 <sfs_block_free>
ffffffffc0209e50:	6008                	ld	a0,0(s0)
ffffffffc0209e52:	bf75                	j	ffffffffc0209e0e <sfs_reclaim+0xb6>
ffffffffc0209e54:	892a                	mv	s2,a0
ffffffffc0209e56:	bfc9                	j	ffffffffc0209e28 <sfs_reclaim+0xd0>
ffffffffc0209e58:	00005697          	auipc	a3,0x5
ffffffffc0209e5c:	43068693          	addi	a3,a3,1072 # ffffffffc020f288 <dev_node_ops+0x3e0>
ffffffffc0209e60:	00002617          	auipc	a2,0x2
ffffffffc0209e64:	ee060613          	addi	a2,a2,-288 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209e68:	37100593          	li	a1,881
ffffffffc0209e6c:	00005517          	auipc	a0,0x5
ffffffffc0209e70:	5fc50513          	addi	a0,a0,1532 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209e74:	e2af60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209e78:	00005697          	auipc	a3,0x5
ffffffffc0209e7c:	67868693          	addi	a3,a3,1656 # ffffffffc020f4f0 <dev_node_ops+0x648>
ffffffffc0209e80:	00002617          	auipc	a2,0x2
ffffffffc0209e84:	ec060613          	addi	a2,a2,-320 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209e88:	37700593          	li	a1,887
ffffffffc0209e8c:	00005517          	auipc	a0,0x5
ffffffffc0209e90:	5dc50513          	addi	a0,a0,1500 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209e94:	e0af60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209e98:	00005697          	auipc	a3,0x5
ffffffffc0209e9c:	59868693          	addi	a3,a3,1432 # ffffffffc020f430 <dev_node_ops+0x588>
ffffffffc0209ea0:	00002617          	auipc	a2,0x2
ffffffffc0209ea4:	ea060613          	addi	a2,a2,-352 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209ea8:	37200593          	li	a1,882
ffffffffc0209eac:	00005517          	auipc	a0,0x5
ffffffffc0209eb0:	5bc50513          	addi	a0,a0,1468 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209eb4:	deaf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209eb8:	00005697          	auipc	a3,0x5
ffffffffc0209ebc:	e0068693          	addi	a3,a3,-512 # ffffffffc020ecb8 <syscalls+0xc48>
ffffffffc0209ec0:	00002617          	auipc	a2,0x2
ffffffffc0209ec4:	e8060613          	addi	a2,a2,-384 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209ec8:	37c00593          	li	a1,892
ffffffffc0209ecc:	00005517          	auipc	a0,0x5
ffffffffc0209ed0:	59c50513          	addi	a0,a0,1436 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209ed4:	dcaf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209ed8:	00003697          	auipc	a3,0x3
ffffffffc0209edc:	7d868693          	addi	a3,a3,2008 # ffffffffc020d6b0 <default_pmm_manager+0xe50>
ffffffffc0209ee0:	00002617          	auipc	a2,0x2
ffffffffc0209ee4:	e6060613          	addi	a2,a2,-416 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209ee8:	38100593          	li	a1,897
ffffffffc0209eec:	00005517          	auipc	a0,0x5
ffffffffc0209ef0:	57c50513          	addi	a0,a0,1404 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209ef4:	daaf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209ef8 <sfs_block_alloc>:
ffffffffc0209ef8:	1101                	addi	sp,sp,-32
ffffffffc0209efa:	e822                	sd	s0,16(sp)
ffffffffc0209efc:	842a                	mv	s0,a0
ffffffffc0209efe:	7d08                	ld	a0,56(a0)
ffffffffc0209f00:	e426                	sd	s1,8(sp)
ffffffffc0209f02:	ec06                	sd	ra,24(sp)
ffffffffc0209f04:	84ae                	mv	s1,a1
ffffffffc0209f06:	c62ff0ef          	jal	ra,ffffffffc0209368 <bitmap_alloc>
ffffffffc0209f0a:	e90d                	bnez	a0,ffffffffc0209f3c <sfs_block_alloc+0x44>
ffffffffc0209f0c:	441c                	lw	a5,8(s0)
ffffffffc0209f0e:	cbad                	beqz	a5,ffffffffc0209f80 <sfs_block_alloc+0x88>
ffffffffc0209f10:	37fd                	addiw	a5,a5,-1
ffffffffc0209f12:	c41c                	sw	a5,8(s0)
ffffffffc0209f14:	408c                	lw	a1,0(s1)
ffffffffc0209f16:	4785                	li	a5,1
ffffffffc0209f18:	e03c                	sd	a5,64(s0)
ffffffffc0209f1a:	4054                	lw	a3,4(s0)
ffffffffc0209f1c:	c58d                	beqz	a1,ffffffffc0209f46 <sfs_block_alloc+0x4e>
ffffffffc0209f1e:	02d5f463          	bgeu	a1,a3,ffffffffc0209f46 <sfs_block_alloc+0x4e>
ffffffffc0209f22:	7c08                	ld	a0,56(s0)
ffffffffc0209f24:	cb4ff0ef          	jal	ra,ffffffffc02093d8 <bitmap_test>
ffffffffc0209f28:	ed05                	bnez	a0,ffffffffc0209f60 <sfs_block_alloc+0x68>
ffffffffc0209f2a:	8522                	mv	a0,s0
ffffffffc0209f2c:	6442                	ld	s0,16(sp)
ffffffffc0209f2e:	408c                	lw	a1,0(s1)
ffffffffc0209f30:	60e2                	ld	ra,24(sp)
ffffffffc0209f32:	64a2                	ld	s1,8(sp)
ffffffffc0209f34:	4605                	li	a2,1
ffffffffc0209f36:	6105                	addi	sp,sp,32
ffffffffc0209f38:	36e0106f          	j	ffffffffc020b2a6 <sfs_clear_block>
ffffffffc0209f3c:	60e2                	ld	ra,24(sp)
ffffffffc0209f3e:	6442                	ld	s0,16(sp)
ffffffffc0209f40:	64a2                	ld	s1,8(sp)
ffffffffc0209f42:	6105                	addi	sp,sp,32
ffffffffc0209f44:	8082                	ret
ffffffffc0209f46:	872e                	mv	a4,a1
ffffffffc0209f48:	00005617          	auipc	a2,0x5
ffffffffc0209f4c:	55060613          	addi	a2,a2,1360 # ffffffffc020f498 <dev_node_ops+0x5f0>
ffffffffc0209f50:	05300593          	li	a1,83
ffffffffc0209f54:	00005517          	auipc	a0,0x5
ffffffffc0209f58:	51450513          	addi	a0,a0,1300 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209f5c:	d42f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209f60:	00005697          	auipc	a3,0x5
ffffffffc0209f64:	5c868693          	addi	a3,a3,1480 # ffffffffc020f528 <dev_node_ops+0x680>
ffffffffc0209f68:	00002617          	auipc	a2,0x2
ffffffffc0209f6c:	dd860613          	addi	a2,a2,-552 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209f70:	06100593          	li	a1,97
ffffffffc0209f74:	00005517          	auipc	a0,0x5
ffffffffc0209f78:	4f450513          	addi	a0,a0,1268 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209f7c:	d22f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209f80:	00005697          	auipc	a3,0x5
ffffffffc0209f84:	58868693          	addi	a3,a3,1416 # ffffffffc020f508 <dev_node_ops+0x660>
ffffffffc0209f88:	00002617          	auipc	a2,0x2
ffffffffc0209f8c:	db860613          	addi	a2,a2,-584 # ffffffffc020bd40 <commands+0x210>
ffffffffc0209f90:	05f00593          	li	a1,95
ffffffffc0209f94:	00005517          	auipc	a0,0x5
ffffffffc0209f98:	4d450513          	addi	a0,a0,1236 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc0209f9c:	d02f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209fa0 <sfs_bmap_load_nolock>:
ffffffffc0209fa0:	7159                	addi	sp,sp,-112
ffffffffc0209fa2:	f85a                	sd	s6,48(sp)
ffffffffc0209fa4:	0005bb03          	ld	s6,0(a1)
ffffffffc0209fa8:	f45e                	sd	s7,40(sp)
ffffffffc0209faa:	f486                	sd	ra,104(sp)
ffffffffc0209fac:	008b2b83          	lw	s7,8(s6)
ffffffffc0209fb0:	f0a2                	sd	s0,96(sp)
ffffffffc0209fb2:	eca6                	sd	s1,88(sp)
ffffffffc0209fb4:	e8ca                	sd	s2,80(sp)
ffffffffc0209fb6:	e4ce                	sd	s3,72(sp)
ffffffffc0209fb8:	e0d2                	sd	s4,64(sp)
ffffffffc0209fba:	fc56                	sd	s5,56(sp)
ffffffffc0209fbc:	f062                	sd	s8,32(sp)
ffffffffc0209fbe:	ec66                	sd	s9,24(sp)
ffffffffc0209fc0:	18cbe363          	bltu	s7,a2,ffffffffc020a146 <sfs_bmap_load_nolock+0x1a6>
ffffffffc0209fc4:	47ad                	li	a5,11
ffffffffc0209fc6:	8aae                	mv	s5,a1
ffffffffc0209fc8:	8432                	mv	s0,a2
ffffffffc0209fca:	84aa                	mv	s1,a0
ffffffffc0209fcc:	89b6                	mv	s3,a3
ffffffffc0209fce:	04c7f563          	bgeu	a5,a2,ffffffffc020a018 <sfs_bmap_load_nolock+0x78>
ffffffffc0209fd2:	ff46071b          	addiw	a4,a2,-12
ffffffffc0209fd6:	0007069b          	sext.w	a3,a4
ffffffffc0209fda:	3ff00793          	li	a5,1023
ffffffffc0209fde:	1ad7e163          	bltu	a5,a3,ffffffffc020a180 <sfs_bmap_load_nolock+0x1e0>
ffffffffc0209fe2:	03cb2a03          	lw	s4,60(s6)
ffffffffc0209fe6:	02071793          	slli	a5,a4,0x20
ffffffffc0209fea:	c602                	sw	zero,12(sp)
ffffffffc0209fec:	c452                	sw	s4,8(sp)
ffffffffc0209fee:	01e7dc13          	srli	s8,a5,0x1e
ffffffffc0209ff2:	0e0a1e63          	bnez	s4,ffffffffc020a0ee <sfs_bmap_load_nolock+0x14e>
ffffffffc0209ff6:	0acb8663          	beq	s7,a2,ffffffffc020a0a2 <sfs_bmap_load_nolock+0x102>
ffffffffc0209ffa:	4a01                	li	s4,0
ffffffffc0209ffc:	40d4                	lw	a3,4(s1)
ffffffffc0209ffe:	8752                	mv	a4,s4
ffffffffc020a000:	00005617          	auipc	a2,0x5
ffffffffc020a004:	49860613          	addi	a2,a2,1176 # ffffffffc020f498 <dev_node_ops+0x5f0>
ffffffffc020a008:	05300593          	li	a1,83
ffffffffc020a00c:	00005517          	auipc	a0,0x5
ffffffffc020a010:	45c50513          	addi	a0,a0,1116 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a014:	c8af60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a018:	02061793          	slli	a5,a2,0x20
ffffffffc020a01c:	01e7da13          	srli	s4,a5,0x1e
ffffffffc020a020:	9a5a                	add	s4,s4,s6
ffffffffc020a022:	00ca2583          	lw	a1,12(s4)
ffffffffc020a026:	c22e                	sw	a1,4(sp)
ffffffffc020a028:	ed99                	bnez	a1,ffffffffc020a046 <sfs_bmap_load_nolock+0xa6>
ffffffffc020a02a:	fccb98e3          	bne	s7,a2,ffffffffc0209ffa <sfs_bmap_load_nolock+0x5a>
ffffffffc020a02e:	004c                	addi	a1,sp,4
ffffffffc020a030:	ec9ff0ef          	jal	ra,ffffffffc0209ef8 <sfs_block_alloc>
ffffffffc020a034:	892a                	mv	s2,a0
ffffffffc020a036:	e921                	bnez	a0,ffffffffc020a086 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a038:	4592                	lw	a1,4(sp)
ffffffffc020a03a:	4705                	li	a4,1
ffffffffc020a03c:	00ba2623          	sw	a1,12(s4)
ffffffffc020a040:	00eab823          	sd	a4,16(s5)
ffffffffc020a044:	d9dd                	beqz	a1,ffffffffc0209ffa <sfs_bmap_load_nolock+0x5a>
ffffffffc020a046:	40d4                	lw	a3,4(s1)
ffffffffc020a048:	10d5ff63          	bgeu	a1,a3,ffffffffc020a166 <sfs_bmap_load_nolock+0x1c6>
ffffffffc020a04c:	7c88                	ld	a0,56(s1)
ffffffffc020a04e:	b8aff0ef          	jal	ra,ffffffffc02093d8 <bitmap_test>
ffffffffc020a052:	18051363          	bnez	a0,ffffffffc020a1d8 <sfs_bmap_load_nolock+0x238>
ffffffffc020a056:	4a12                	lw	s4,4(sp)
ffffffffc020a058:	fa0a02e3          	beqz	s4,ffffffffc0209ffc <sfs_bmap_load_nolock+0x5c>
ffffffffc020a05c:	40dc                	lw	a5,4(s1)
ffffffffc020a05e:	f8fa7fe3          	bgeu	s4,a5,ffffffffc0209ffc <sfs_bmap_load_nolock+0x5c>
ffffffffc020a062:	7c88                	ld	a0,56(s1)
ffffffffc020a064:	85d2                	mv	a1,s4
ffffffffc020a066:	b72ff0ef          	jal	ra,ffffffffc02093d8 <bitmap_test>
ffffffffc020a06a:	12051763          	bnez	a0,ffffffffc020a198 <sfs_bmap_load_nolock+0x1f8>
ffffffffc020a06e:	008b9763          	bne	s7,s0,ffffffffc020a07c <sfs_bmap_load_nolock+0xdc>
ffffffffc020a072:	008b2783          	lw	a5,8(s6)
ffffffffc020a076:	2785                	addiw	a5,a5,1
ffffffffc020a078:	00fb2423          	sw	a5,8(s6)
ffffffffc020a07c:	4901                	li	s2,0
ffffffffc020a07e:	00098463          	beqz	s3,ffffffffc020a086 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a082:	0149a023          	sw	s4,0(s3)
ffffffffc020a086:	70a6                	ld	ra,104(sp)
ffffffffc020a088:	7406                	ld	s0,96(sp)
ffffffffc020a08a:	64e6                	ld	s1,88(sp)
ffffffffc020a08c:	69a6                	ld	s3,72(sp)
ffffffffc020a08e:	6a06                	ld	s4,64(sp)
ffffffffc020a090:	7ae2                	ld	s5,56(sp)
ffffffffc020a092:	7b42                	ld	s6,48(sp)
ffffffffc020a094:	7ba2                	ld	s7,40(sp)
ffffffffc020a096:	7c02                	ld	s8,32(sp)
ffffffffc020a098:	6ce2                	ld	s9,24(sp)
ffffffffc020a09a:	854a                	mv	a0,s2
ffffffffc020a09c:	6946                	ld	s2,80(sp)
ffffffffc020a09e:	6165                	addi	sp,sp,112
ffffffffc020a0a0:	8082                	ret
ffffffffc020a0a2:	002c                	addi	a1,sp,8
ffffffffc020a0a4:	e55ff0ef          	jal	ra,ffffffffc0209ef8 <sfs_block_alloc>
ffffffffc020a0a8:	892a                	mv	s2,a0
ffffffffc020a0aa:	00c10c93          	addi	s9,sp,12
ffffffffc020a0ae:	fd61                	bnez	a0,ffffffffc020a086 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a0b0:	85e6                	mv	a1,s9
ffffffffc020a0b2:	8526                	mv	a0,s1
ffffffffc020a0b4:	e45ff0ef          	jal	ra,ffffffffc0209ef8 <sfs_block_alloc>
ffffffffc020a0b8:	892a                	mv	s2,a0
ffffffffc020a0ba:	e925                	bnez	a0,ffffffffc020a12a <sfs_bmap_load_nolock+0x18a>
ffffffffc020a0bc:	46a2                	lw	a3,8(sp)
ffffffffc020a0be:	85e6                	mv	a1,s9
ffffffffc020a0c0:	8762                	mv	a4,s8
ffffffffc020a0c2:	4611                	li	a2,4
ffffffffc020a0c4:	8526                	mv	a0,s1
ffffffffc020a0c6:	090010ef          	jal	ra,ffffffffc020b156 <sfs_wbuf>
ffffffffc020a0ca:	45b2                	lw	a1,12(sp)
ffffffffc020a0cc:	892a                	mv	s2,a0
ffffffffc020a0ce:	e939                	bnez	a0,ffffffffc020a124 <sfs_bmap_load_nolock+0x184>
ffffffffc020a0d0:	03cb2683          	lw	a3,60(s6)
ffffffffc020a0d4:	4722                	lw	a4,8(sp)
ffffffffc020a0d6:	c22e                	sw	a1,4(sp)
ffffffffc020a0d8:	f6d706e3          	beq	a4,a3,ffffffffc020a044 <sfs_bmap_load_nolock+0xa4>
ffffffffc020a0dc:	eef1                	bnez	a3,ffffffffc020a1b8 <sfs_bmap_load_nolock+0x218>
ffffffffc020a0de:	02eb2e23          	sw	a4,60(s6)
ffffffffc020a0e2:	4705                	li	a4,1
ffffffffc020a0e4:	00eab823          	sd	a4,16(s5)
ffffffffc020a0e8:	f00589e3          	beqz	a1,ffffffffc0209ffa <sfs_bmap_load_nolock+0x5a>
ffffffffc020a0ec:	bfa9                	j	ffffffffc020a046 <sfs_bmap_load_nolock+0xa6>
ffffffffc020a0ee:	00c10c93          	addi	s9,sp,12
ffffffffc020a0f2:	8762                	mv	a4,s8
ffffffffc020a0f4:	86d2                	mv	a3,s4
ffffffffc020a0f6:	4611                	li	a2,4
ffffffffc020a0f8:	85e6                	mv	a1,s9
ffffffffc020a0fa:	7dd000ef          	jal	ra,ffffffffc020b0d6 <sfs_rbuf>
ffffffffc020a0fe:	892a                	mv	s2,a0
ffffffffc020a100:	f159                	bnez	a0,ffffffffc020a086 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a102:	45b2                	lw	a1,12(sp)
ffffffffc020a104:	e995                	bnez	a1,ffffffffc020a138 <sfs_bmap_load_nolock+0x198>
ffffffffc020a106:	fa8b85e3          	beq	s7,s0,ffffffffc020a0b0 <sfs_bmap_load_nolock+0x110>
ffffffffc020a10a:	03cb2703          	lw	a4,60(s6)
ffffffffc020a10e:	47a2                	lw	a5,8(sp)
ffffffffc020a110:	c202                	sw	zero,4(sp)
ffffffffc020a112:	eee784e3          	beq	a5,a4,ffffffffc0209ffa <sfs_bmap_load_nolock+0x5a>
ffffffffc020a116:	e34d                	bnez	a4,ffffffffc020a1b8 <sfs_bmap_load_nolock+0x218>
ffffffffc020a118:	02fb2e23          	sw	a5,60(s6)
ffffffffc020a11c:	4785                	li	a5,1
ffffffffc020a11e:	00fab823          	sd	a5,16(s5)
ffffffffc020a122:	bde1                	j	ffffffffc0209ffa <sfs_bmap_load_nolock+0x5a>
ffffffffc020a124:	8526                	mv	a0,s1
ffffffffc020a126:	bc1ff0ef          	jal	ra,ffffffffc0209ce6 <sfs_block_free>
ffffffffc020a12a:	45a2                	lw	a1,8(sp)
ffffffffc020a12c:	f4ba0de3          	beq	s4,a1,ffffffffc020a086 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a130:	8526                	mv	a0,s1
ffffffffc020a132:	bb5ff0ef          	jal	ra,ffffffffc0209ce6 <sfs_block_free>
ffffffffc020a136:	bf81                	j	ffffffffc020a086 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a138:	03cb2683          	lw	a3,60(s6)
ffffffffc020a13c:	4722                	lw	a4,8(sp)
ffffffffc020a13e:	c22e                	sw	a1,4(sp)
ffffffffc020a140:	f8e69ee3          	bne	a3,a4,ffffffffc020a0dc <sfs_bmap_load_nolock+0x13c>
ffffffffc020a144:	b709                	j	ffffffffc020a046 <sfs_bmap_load_nolock+0xa6>
ffffffffc020a146:	00005697          	auipc	a3,0x5
ffffffffc020a14a:	40a68693          	addi	a3,a3,1034 # ffffffffc020f550 <dev_node_ops+0x6a8>
ffffffffc020a14e:	00002617          	auipc	a2,0x2
ffffffffc020a152:	bf260613          	addi	a2,a2,-1038 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a156:	16400593          	li	a1,356
ffffffffc020a15a:	00005517          	auipc	a0,0x5
ffffffffc020a15e:	30e50513          	addi	a0,a0,782 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a162:	b3cf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a166:	872e                	mv	a4,a1
ffffffffc020a168:	00005617          	auipc	a2,0x5
ffffffffc020a16c:	33060613          	addi	a2,a2,816 # ffffffffc020f498 <dev_node_ops+0x5f0>
ffffffffc020a170:	05300593          	li	a1,83
ffffffffc020a174:	00005517          	auipc	a0,0x5
ffffffffc020a178:	2f450513          	addi	a0,a0,756 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a17c:	b22f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a180:	00005617          	auipc	a2,0x5
ffffffffc020a184:	40060613          	addi	a2,a2,1024 # ffffffffc020f580 <dev_node_ops+0x6d8>
ffffffffc020a188:	11e00593          	li	a1,286
ffffffffc020a18c:	00005517          	auipc	a0,0x5
ffffffffc020a190:	2dc50513          	addi	a0,a0,732 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a194:	b0af60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a198:	00005697          	auipc	a3,0x5
ffffffffc020a19c:	33868693          	addi	a3,a3,824 # ffffffffc020f4d0 <dev_node_ops+0x628>
ffffffffc020a1a0:	00002617          	auipc	a2,0x2
ffffffffc020a1a4:	ba060613          	addi	a2,a2,-1120 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a1a8:	16b00593          	li	a1,363
ffffffffc020a1ac:	00005517          	auipc	a0,0x5
ffffffffc020a1b0:	2bc50513          	addi	a0,a0,700 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a1b4:	aeaf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a1b8:	00005697          	auipc	a3,0x5
ffffffffc020a1bc:	3b068693          	addi	a3,a3,944 # ffffffffc020f568 <dev_node_ops+0x6c0>
ffffffffc020a1c0:	00002617          	auipc	a2,0x2
ffffffffc020a1c4:	b8060613          	addi	a2,a2,-1152 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a1c8:	11800593          	li	a1,280
ffffffffc020a1cc:	00005517          	auipc	a0,0x5
ffffffffc020a1d0:	29c50513          	addi	a0,a0,668 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a1d4:	acaf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a1d8:	00005697          	auipc	a3,0x5
ffffffffc020a1dc:	3d868693          	addi	a3,a3,984 # ffffffffc020f5b0 <dev_node_ops+0x708>
ffffffffc020a1e0:	00002617          	auipc	a2,0x2
ffffffffc020a1e4:	b6060613          	addi	a2,a2,-1184 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a1e8:	12100593          	li	a1,289
ffffffffc020a1ec:	00005517          	auipc	a0,0x5
ffffffffc020a1f0:	27c50513          	addi	a0,a0,636 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a1f4:	aaaf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a1f8 <sfs_io_nolock>:
ffffffffc020a1f8:	7175                	addi	sp,sp,-144
ffffffffc020a1fa:	f0d2                	sd	s4,96(sp)
ffffffffc020a1fc:	8a2e                	mv	s4,a1
ffffffffc020a1fe:	618c                	ld	a1,0(a1)
ffffffffc020a200:	e506                	sd	ra,136(sp)
ffffffffc020a202:	e122                	sd	s0,128(sp)
ffffffffc020a204:	0045d883          	lhu	a7,4(a1)
ffffffffc020a208:	fca6                	sd	s1,120(sp)
ffffffffc020a20a:	f8ca                	sd	s2,112(sp)
ffffffffc020a20c:	f4ce                	sd	s3,104(sp)
ffffffffc020a20e:	ecd6                	sd	s5,88(sp)
ffffffffc020a210:	e8da                	sd	s6,80(sp)
ffffffffc020a212:	e4de                	sd	s7,72(sp)
ffffffffc020a214:	e0e2                	sd	s8,64(sp)
ffffffffc020a216:	fc66                	sd	s9,56(sp)
ffffffffc020a218:	f86a                	sd	s10,48(sp)
ffffffffc020a21a:	f46e                	sd	s11,40(sp)
ffffffffc020a21c:	4809                	li	a6,2
ffffffffc020a21e:	19088763          	beq	a7,a6,ffffffffc020a3ac <sfs_io_nolock+0x1b4>
ffffffffc020a222:	00073a83          	ld	s5,0(a4) # 4000 <_binary_bin_swap_img_size-0x3d00>
ffffffffc020a226:	8c3a                	mv	s8,a4
ffffffffc020a228:	000c3023          	sd	zero,0(s8)
ffffffffc020a22c:	08000737          	lui	a4,0x8000
ffffffffc020a230:	84b6                	mv	s1,a3
ffffffffc020a232:	8d36                	mv	s10,a3
ffffffffc020a234:	9ab6                	add	s5,s5,a3
ffffffffc020a236:	16e6f963          	bgeu	a3,a4,ffffffffc020a3a8 <sfs_io_nolock+0x1b0>
ffffffffc020a23a:	16dac763          	blt	s5,a3,ffffffffc020a3a8 <sfs_io_nolock+0x1b0>
ffffffffc020a23e:	892a                	mv	s2,a0
ffffffffc020a240:	4501                	li	a0,0
ffffffffc020a242:	0d568263          	beq	a3,s5,ffffffffc020a306 <sfs_io_nolock+0x10e>
ffffffffc020a246:	8432                	mv	s0,a2
ffffffffc020a248:	01577463          	bgeu	a4,s5,ffffffffc020a250 <sfs_io_nolock+0x58>
ffffffffc020a24c:	08000ab7          	lui	s5,0x8000
ffffffffc020a250:	cbf1                	beqz	a5,ffffffffc020a324 <sfs_io_nolock+0x12c>
ffffffffc020a252:	00001797          	auipc	a5,0x1
ffffffffc020a256:	f0478793          	addi	a5,a5,-252 # ffffffffc020b156 <sfs_wbuf>
ffffffffc020a25a:	00001c97          	auipc	s9,0x1
ffffffffc020a25e:	e1cc8c93          	addi	s9,s9,-484 # ffffffffc020b076 <sfs_wblock>
ffffffffc020a262:	e43e                	sd	a5,8(sp)
ffffffffc020a264:	6705                	lui	a4,0x1
ffffffffc020a266:	40c4dd93          	srai	s11,s1,0xc
ffffffffc020a26a:	40cadb13          	srai	s6,s5,0xc
ffffffffc020a26e:	fff70b93          	addi	s7,a4,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc020a272:	41bb07bb          	subw	a5,s6,s11
ffffffffc020a276:	0174fbb3          	and	s7,s1,s7
ffffffffc020a27a:	8b3e                	mv	s6,a5
ffffffffc020a27c:	2d81                	sext.w	s11,s11
ffffffffc020a27e:	89de                	mv	s3,s7
ffffffffc020a280:	020b8c63          	beqz	s7,ffffffffc020a2b8 <sfs_io_nolock+0xc0>
ffffffffc020a284:	409a89b3          	sub	s3,s5,s1
ffffffffc020a288:	efdd                	bnez	a5,ffffffffc020a346 <sfs_io_nolock+0x14e>
ffffffffc020a28a:	0874                	addi	a3,sp,28
ffffffffc020a28c:	866e                	mv	a2,s11
ffffffffc020a28e:	85d2                	mv	a1,s4
ffffffffc020a290:	854a                	mv	a0,s2
ffffffffc020a292:	d0fff0ef          	jal	ra,ffffffffc0209fa0 <sfs_bmap_load_nolock>
ffffffffc020a296:	e169                	bnez	a0,ffffffffc020a358 <sfs_io_nolock+0x160>
ffffffffc020a298:	46f2                	lw	a3,28(sp)
ffffffffc020a29a:	67a2                	ld	a5,8(sp)
ffffffffc020a29c:	875e                	mv	a4,s7
ffffffffc020a29e:	864e                	mv	a2,s3
ffffffffc020a2a0:	85a2                	mv	a1,s0
ffffffffc020a2a2:	854a                	mv	a0,s2
ffffffffc020a2a4:	9782                	jalr	a5
ffffffffc020a2a6:	e94d                	bnez	a0,ffffffffc020a358 <sfs_io_nolock+0x160>
ffffffffc020a2a8:	409a87b3          	sub	a5,s5,s1
ffffffffc020a2ac:	03378d63          	beq	a5,s3,ffffffffc020a2e6 <sfs_io_nolock+0xee>
ffffffffc020a2b0:	944e                	add	s0,s0,s3
ffffffffc020a2b2:	2d85                	addiw	s11,s11,1
ffffffffc020a2b4:	fffb079b          	addiw	a5,s6,-1
ffffffffc020a2b8:	cfcd                	beqz	a5,ffffffffc020a372 <sfs_io_nolock+0x17a>
ffffffffc020a2ba:	01b78bbb          	addw	s7,a5,s11
ffffffffc020a2be:	6b05                	lui	s6,0x1
ffffffffc020a2c0:	a821                	j	ffffffffc020a2d8 <sfs_io_nolock+0xe0>
ffffffffc020a2c2:	4672                	lw	a2,28(sp)
ffffffffc020a2c4:	4685                	li	a3,1
ffffffffc020a2c6:	85a2                	mv	a1,s0
ffffffffc020a2c8:	854a                	mv	a0,s2
ffffffffc020a2ca:	9c82                	jalr	s9
ffffffffc020a2cc:	ed09                	bnez	a0,ffffffffc020a2e6 <sfs_io_nolock+0xee>
ffffffffc020a2ce:	2d85                	addiw	s11,s11,1
ffffffffc020a2d0:	99da                	add	s3,s3,s6
ffffffffc020a2d2:	945a                	add	s0,s0,s6
ffffffffc020a2d4:	0b7d8063          	beq	s11,s7,ffffffffc020a374 <sfs_io_nolock+0x17c>
ffffffffc020a2d8:	0874                	addi	a3,sp,28
ffffffffc020a2da:	866e                	mv	a2,s11
ffffffffc020a2dc:	85d2                	mv	a1,s4
ffffffffc020a2de:	854a                	mv	a0,s2
ffffffffc020a2e0:	cc1ff0ef          	jal	ra,ffffffffc0209fa0 <sfs_bmap_load_nolock>
ffffffffc020a2e4:	dd79                	beqz	a0,ffffffffc020a2c2 <sfs_io_nolock+0xca>
ffffffffc020a2e6:	01348d33          	add	s10,s1,s3
ffffffffc020a2ea:	000a3783          	ld	a5,0(s4)
ffffffffc020a2ee:	013c3023          	sd	s3,0(s8)
ffffffffc020a2f2:	0007e703          	lwu	a4,0(a5)
ffffffffc020a2f6:	01a77863          	bgeu	a4,s10,ffffffffc020a306 <sfs_io_nolock+0x10e>
ffffffffc020a2fa:	013484bb          	addw	s1,s1,s3
ffffffffc020a2fe:	c384                	sw	s1,0(a5)
ffffffffc020a300:	4785                	li	a5,1
ffffffffc020a302:	00fa3823          	sd	a5,16(s4)
ffffffffc020a306:	60aa                	ld	ra,136(sp)
ffffffffc020a308:	640a                	ld	s0,128(sp)
ffffffffc020a30a:	74e6                	ld	s1,120(sp)
ffffffffc020a30c:	7946                	ld	s2,112(sp)
ffffffffc020a30e:	79a6                	ld	s3,104(sp)
ffffffffc020a310:	7a06                	ld	s4,96(sp)
ffffffffc020a312:	6ae6                	ld	s5,88(sp)
ffffffffc020a314:	6b46                	ld	s6,80(sp)
ffffffffc020a316:	6ba6                	ld	s7,72(sp)
ffffffffc020a318:	6c06                	ld	s8,64(sp)
ffffffffc020a31a:	7ce2                	ld	s9,56(sp)
ffffffffc020a31c:	7d42                	ld	s10,48(sp)
ffffffffc020a31e:	7da2                	ld	s11,40(sp)
ffffffffc020a320:	6149                	addi	sp,sp,144
ffffffffc020a322:	8082                	ret
ffffffffc020a324:	0005e783          	lwu	a5,0(a1)
ffffffffc020a328:	4501                	li	a0,0
ffffffffc020a32a:	fcf4dee3          	bge	s1,a5,ffffffffc020a306 <sfs_io_nolock+0x10e>
ffffffffc020a32e:	0357c763          	blt	a5,s5,ffffffffc020a35c <sfs_io_nolock+0x164>
ffffffffc020a332:	00001797          	auipc	a5,0x1
ffffffffc020a336:	da478793          	addi	a5,a5,-604 # ffffffffc020b0d6 <sfs_rbuf>
ffffffffc020a33a:	00001c97          	auipc	s9,0x1
ffffffffc020a33e:	cdcc8c93          	addi	s9,s9,-804 # ffffffffc020b016 <sfs_rblock>
ffffffffc020a342:	e43e                	sd	a5,8(sp)
ffffffffc020a344:	b705                	j	ffffffffc020a264 <sfs_io_nolock+0x6c>
ffffffffc020a346:	0874                	addi	a3,sp,28
ffffffffc020a348:	866e                	mv	a2,s11
ffffffffc020a34a:	85d2                	mv	a1,s4
ffffffffc020a34c:	854a                	mv	a0,s2
ffffffffc020a34e:	417709b3          	sub	s3,a4,s7
ffffffffc020a352:	c4fff0ef          	jal	ra,ffffffffc0209fa0 <sfs_bmap_load_nolock>
ffffffffc020a356:	d129                	beqz	a0,ffffffffc020a298 <sfs_io_nolock+0xa0>
ffffffffc020a358:	4981                	li	s3,0
ffffffffc020a35a:	bf41                	j	ffffffffc020a2ea <sfs_io_nolock+0xf2>
ffffffffc020a35c:	8abe                	mv	s5,a5
ffffffffc020a35e:	00001797          	auipc	a5,0x1
ffffffffc020a362:	d7878793          	addi	a5,a5,-648 # ffffffffc020b0d6 <sfs_rbuf>
ffffffffc020a366:	00001c97          	auipc	s9,0x1
ffffffffc020a36a:	cb0c8c93          	addi	s9,s9,-848 # ffffffffc020b016 <sfs_rblock>
ffffffffc020a36e:	e43e                	sd	a5,8(sp)
ffffffffc020a370:	bdd5                	j	ffffffffc020a264 <sfs_io_nolock+0x6c>
ffffffffc020a372:	8bee                	mv	s7,s11
ffffffffc020a374:	1ad2                	slli	s5,s5,0x34
ffffffffc020a376:	034adb13          	srli	s6,s5,0x34
ffffffffc020a37a:	000a9663          	bnez	s5,ffffffffc020a386 <sfs_io_nolock+0x18e>
ffffffffc020a37e:	01348d33          	add	s10,s1,s3
ffffffffc020a382:	4501                	li	a0,0
ffffffffc020a384:	b79d                	j	ffffffffc020a2ea <sfs_io_nolock+0xf2>
ffffffffc020a386:	0874                	addi	a3,sp,28
ffffffffc020a388:	865e                	mv	a2,s7
ffffffffc020a38a:	85d2                	mv	a1,s4
ffffffffc020a38c:	854a                	mv	a0,s2
ffffffffc020a38e:	c13ff0ef          	jal	ra,ffffffffc0209fa0 <sfs_bmap_load_nolock>
ffffffffc020a392:	f931                	bnez	a0,ffffffffc020a2e6 <sfs_io_nolock+0xee>
ffffffffc020a394:	46f2                	lw	a3,28(sp)
ffffffffc020a396:	67a2                	ld	a5,8(sp)
ffffffffc020a398:	4701                	li	a4,0
ffffffffc020a39a:	865a                	mv	a2,s6
ffffffffc020a39c:	85a2                	mv	a1,s0
ffffffffc020a39e:	854a                	mv	a0,s2
ffffffffc020a3a0:	9782                	jalr	a5
ffffffffc020a3a2:	f131                	bnez	a0,ffffffffc020a2e6 <sfs_io_nolock+0xee>
ffffffffc020a3a4:	99da                	add	s3,s3,s6
ffffffffc020a3a6:	b781                	j	ffffffffc020a2e6 <sfs_io_nolock+0xee>
ffffffffc020a3a8:	5575                	li	a0,-3
ffffffffc020a3aa:	bfb1                	j	ffffffffc020a306 <sfs_io_nolock+0x10e>
ffffffffc020a3ac:	00005697          	auipc	a3,0x5
ffffffffc020a3b0:	22c68693          	addi	a3,a3,556 # ffffffffc020f5d8 <dev_node_ops+0x730>
ffffffffc020a3b4:	00002617          	auipc	a2,0x2
ffffffffc020a3b8:	98c60613          	addi	a2,a2,-1652 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a3bc:	22b00593          	li	a1,555
ffffffffc020a3c0:	00005517          	auipc	a0,0x5
ffffffffc020a3c4:	0a850513          	addi	a0,a0,168 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a3c8:	8d6f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a3cc <sfs_read>:
ffffffffc020a3cc:	7139                	addi	sp,sp,-64
ffffffffc020a3ce:	f04a                	sd	s2,32(sp)
ffffffffc020a3d0:	06853903          	ld	s2,104(a0)
ffffffffc020a3d4:	fc06                	sd	ra,56(sp)
ffffffffc020a3d6:	f822                	sd	s0,48(sp)
ffffffffc020a3d8:	f426                	sd	s1,40(sp)
ffffffffc020a3da:	ec4e                	sd	s3,24(sp)
ffffffffc020a3dc:	04090f63          	beqz	s2,ffffffffc020a43a <sfs_read+0x6e>
ffffffffc020a3e0:	0b092783          	lw	a5,176(s2)
ffffffffc020a3e4:	ebb9                	bnez	a5,ffffffffc020a43a <sfs_read+0x6e>
ffffffffc020a3e6:	4d38                	lw	a4,88(a0)
ffffffffc020a3e8:	6785                	lui	a5,0x1
ffffffffc020a3ea:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a3ee:	842a                	mv	s0,a0
ffffffffc020a3f0:	06f71563          	bne	a4,a5,ffffffffc020a45a <sfs_read+0x8e>
ffffffffc020a3f4:	02050993          	addi	s3,a0,32
ffffffffc020a3f8:	854e                	mv	a0,s3
ffffffffc020a3fa:	84ae                	mv	s1,a1
ffffffffc020a3fc:	b08fa0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc020a400:	0184b803          	ld	a6,24(s1)
ffffffffc020a404:	6494                	ld	a3,8(s1)
ffffffffc020a406:	6090                	ld	a2,0(s1)
ffffffffc020a408:	85a2                	mv	a1,s0
ffffffffc020a40a:	4781                	li	a5,0
ffffffffc020a40c:	0038                	addi	a4,sp,8
ffffffffc020a40e:	854a                	mv	a0,s2
ffffffffc020a410:	e442                	sd	a6,8(sp)
ffffffffc020a412:	de7ff0ef          	jal	ra,ffffffffc020a1f8 <sfs_io_nolock>
ffffffffc020a416:	65a2                	ld	a1,8(sp)
ffffffffc020a418:	842a                	mv	s0,a0
ffffffffc020a41a:	ed81                	bnez	a1,ffffffffc020a432 <sfs_read+0x66>
ffffffffc020a41c:	854e                	mv	a0,s3
ffffffffc020a41e:	ae2fa0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc020a422:	70e2                	ld	ra,56(sp)
ffffffffc020a424:	8522                	mv	a0,s0
ffffffffc020a426:	7442                	ld	s0,48(sp)
ffffffffc020a428:	74a2                	ld	s1,40(sp)
ffffffffc020a42a:	7902                	ld	s2,32(sp)
ffffffffc020a42c:	69e2                	ld	s3,24(sp)
ffffffffc020a42e:	6121                	addi	sp,sp,64
ffffffffc020a430:	8082                	ret
ffffffffc020a432:	8526                	mv	a0,s1
ffffffffc020a434:	958fb0ef          	jal	ra,ffffffffc020558c <iobuf_skip>
ffffffffc020a438:	b7d5                	j	ffffffffc020a41c <sfs_read+0x50>
ffffffffc020a43a:	00005697          	auipc	a3,0x5
ffffffffc020a43e:	e4e68693          	addi	a3,a3,-434 # ffffffffc020f288 <dev_node_ops+0x3e0>
ffffffffc020a442:	00002617          	auipc	a2,0x2
ffffffffc020a446:	8fe60613          	addi	a2,a2,-1794 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a44a:	2af00593          	li	a1,687
ffffffffc020a44e:	00005517          	auipc	a0,0x5
ffffffffc020a452:	01a50513          	addi	a0,a0,26 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a456:	848f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a45a:	869ff0ef          	jal	ra,ffffffffc0209cc2 <sfs_io.part.0>

ffffffffc020a45e <sfs_write>:
ffffffffc020a45e:	7139                	addi	sp,sp,-64
ffffffffc020a460:	f04a                	sd	s2,32(sp)
ffffffffc020a462:	06853903          	ld	s2,104(a0)
ffffffffc020a466:	fc06                	sd	ra,56(sp)
ffffffffc020a468:	f822                	sd	s0,48(sp)
ffffffffc020a46a:	f426                	sd	s1,40(sp)
ffffffffc020a46c:	ec4e                	sd	s3,24(sp)
ffffffffc020a46e:	04090f63          	beqz	s2,ffffffffc020a4cc <sfs_write+0x6e>
ffffffffc020a472:	0b092783          	lw	a5,176(s2)
ffffffffc020a476:	ebb9                	bnez	a5,ffffffffc020a4cc <sfs_write+0x6e>
ffffffffc020a478:	4d38                	lw	a4,88(a0)
ffffffffc020a47a:	6785                	lui	a5,0x1
ffffffffc020a47c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a480:	842a                	mv	s0,a0
ffffffffc020a482:	06f71563          	bne	a4,a5,ffffffffc020a4ec <sfs_write+0x8e>
ffffffffc020a486:	02050993          	addi	s3,a0,32
ffffffffc020a48a:	854e                	mv	a0,s3
ffffffffc020a48c:	84ae                	mv	s1,a1
ffffffffc020a48e:	a76fa0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc020a492:	0184b803          	ld	a6,24(s1)
ffffffffc020a496:	6494                	ld	a3,8(s1)
ffffffffc020a498:	6090                	ld	a2,0(s1)
ffffffffc020a49a:	85a2                	mv	a1,s0
ffffffffc020a49c:	4785                	li	a5,1
ffffffffc020a49e:	0038                	addi	a4,sp,8
ffffffffc020a4a0:	854a                	mv	a0,s2
ffffffffc020a4a2:	e442                	sd	a6,8(sp)
ffffffffc020a4a4:	d55ff0ef          	jal	ra,ffffffffc020a1f8 <sfs_io_nolock>
ffffffffc020a4a8:	65a2                	ld	a1,8(sp)
ffffffffc020a4aa:	842a                	mv	s0,a0
ffffffffc020a4ac:	ed81                	bnez	a1,ffffffffc020a4c4 <sfs_write+0x66>
ffffffffc020a4ae:	854e                	mv	a0,s3
ffffffffc020a4b0:	a50fa0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc020a4b4:	70e2                	ld	ra,56(sp)
ffffffffc020a4b6:	8522                	mv	a0,s0
ffffffffc020a4b8:	7442                	ld	s0,48(sp)
ffffffffc020a4ba:	74a2                	ld	s1,40(sp)
ffffffffc020a4bc:	7902                	ld	s2,32(sp)
ffffffffc020a4be:	69e2                	ld	s3,24(sp)
ffffffffc020a4c0:	6121                	addi	sp,sp,64
ffffffffc020a4c2:	8082                	ret
ffffffffc020a4c4:	8526                	mv	a0,s1
ffffffffc020a4c6:	8c6fb0ef          	jal	ra,ffffffffc020558c <iobuf_skip>
ffffffffc020a4ca:	b7d5                	j	ffffffffc020a4ae <sfs_write+0x50>
ffffffffc020a4cc:	00005697          	auipc	a3,0x5
ffffffffc020a4d0:	dbc68693          	addi	a3,a3,-580 # ffffffffc020f288 <dev_node_ops+0x3e0>
ffffffffc020a4d4:	00002617          	auipc	a2,0x2
ffffffffc020a4d8:	86c60613          	addi	a2,a2,-1940 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a4dc:	2af00593          	li	a1,687
ffffffffc020a4e0:	00005517          	auipc	a0,0x5
ffffffffc020a4e4:	f8850513          	addi	a0,a0,-120 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a4e8:	fb7f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a4ec:	fd6ff0ef          	jal	ra,ffffffffc0209cc2 <sfs_io.part.0>

ffffffffc020a4f0 <sfs_dirent_read_nolock>:
ffffffffc020a4f0:	6198                	ld	a4,0(a1)
ffffffffc020a4f2:	7179                	addi	sp,sp,-48
ffffffffc020a4f4:	f406                	sd	ra,40(sp)
ffffffffc020a4f6:	00475883          	lhu	a7,4(a4)
ffffffffc020a4fa:	f022                	sd	s0,32(sp)
ffffffffc020a4fc:	ec26                	sd	s1,24(sp)
ffffffffc020a4fe:	4809                	li	a6,2
ffffffffc020a500:	05089b63          	bne	a7,a6,ffffffffc020a556 <sfs_dirent_read_nolock+0x66>
ffffffffc020a504:	4718                	lw	a4,8(a4)
ffffffffc020a506:	87b2                	mv	a5,a2
ffffffffc020a508:	2601                	sext.w	a2,a2
ffffffffc020a50a:	04e7f663          	bgeu	a5,a4,ffffffffc020a556 <sfs_dirent_read_nolock+0x66>
ffffffffc020a50e:	84b6                	mv	s1,a3
ffffffffc020a510:	0074                	addi	a3,sp,12
ffffffffc020a512:	842a                	mv	s0,a0
ffffffffc020a514:	a8dff0ef          	jal	ra,ffffffffc0209fa0 <sfs_bmap_load_nolock>
ffffffffc020a518:	c511                	beqz	a0,ffffffffc020a524 <sfs_dirent_read_nolock+0x34>
ffffffffc020a51a:	70a2                	ld	ra,40(sp)
ffffffffc020a51c:	7402                	ld	s0,32(sp)
ffffffffc020a51e:	64e2                	ld	s1,24(sp)
ffffffffc020a520:	6145                	addi	sp,sp,48
ffffffffc020a522:	8082                	ret
ffffffffc020a524:	45b2                	lw	a1,12(sp)
ffffffffc020a526:	4054                	lw	a3,4(s0)
ffffffffc020a528:	c5b9                	beqz	a1,ffffffffc020a576 <sfs_dirent_read_nolock+0x86>
ffffffffc020a52a:	04d5f663          	bgeu	a1,a3,ffffffffc020a576 <sfs_dirent_read_nolock+0x86>
ffffffffc020a52e:	7c08                	ld	a0,56(s0)
ffffffffc020a530:	ea9fe0ef          	jal	ra,ffffffffc02093d8 <bitmap_test>
ffffffffc020a534:	ed31                	bnez	a0,ffffffffc020a590 <sfs_dirent_read_nolock+0xa0>
ffffffffc020a536:	46b2                	lw	a3,12(sp)
ffffffffc020a538:	4701                	li	a4,0
ffffffffc020a53a:	10400613          	li	a2,260
ffffffffc020a53e:	85a6                	mv	a1,s1
ffffffffc020a540:	8522                	mv	a0,s0
ffffffffc020a542:	395000ef          	jal	ra,ffffffffc020b0d6 <sfs_rbuf>
ffffffffc020a546:	f971                	bnez	a0,ffffffffc020a51a <sfs_dirent_read_nolock+0x2a>
ffffffffc020a548:	100481a3          	sb	zero,259(s1)
ffffffffc020a54c:	70a2                	ld	ra,40(sp)
ffffffffc020a54e:	7402                	ld	s0,32(sp)
ffffffffc020a550:	64e2                	ld	s1,24(sp)
ffffffffc020a552:	6145                	addi	sp,sp,48
ffffffffc020a554:	8082                	ret
ffffffffc020a556:	00005697          	auipc	a3,0x5
ffffffffc020a55a:	0a268693          	addi	a3,a3,162 # ffffffffc020f5f8 <dev_node_ops+0x750>
ffffffffc020a55e:	00001617          	auipc	a2,0x1
ffffffffc020a562:	7e260613          	addi	a2,a2,2018 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a566:	18e00593          	li	a1,398
ffffffffc020a56a:	00005517          	auipc	a0,0x5
ffffffffc020a56e:	efe50513          	addi	a0,a0,-258 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a572:	f2df50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a576:	872e                	mv	a4,a1
ffffffffc020a578:	00005617          	auipc	a2,0x5
ffffffffc020a57c:	f2060613          	addi	a2,a2,-224 # ffffffffc020f498 <dev_node_ops+0x5f0>
ffffffffc020a580:	05300593          	li	a1,83
ffffffffc020a584:	00005517          	auipc	a0,0x5
ffffffffc020a588:	ee450513          	addi	a0,a0,-284 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a58c:	f13f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a590:	00005697          	auipc	a3,0x5
ffffffffc020a594:	f4068693          	addi	a3,a3,-192 # ffffffffc020f4d0 <dev_node_ops+0x628>
ffffffffc020a598:	00001617          	auipc	a2,0x1
ffffffffc020a59c:	7a860613          	addi	a2,a2,1960 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a5a0:	19500593          	li	a1,405
ffffffffc020a5a4:	00005517          	auipc	a0,0x5
ffffffffc020a5a8:	ec450513          	addi	a0,a0,-316 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a5ac:	ef3f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a5b0 <sfs_getdirentry>:
ffffffffc020a5b0:	715d                	addi	sp,sp,-80
ffffffffc020a5b2:	ec56                	sd	s5,24(sp)
ffffffffc020a5b4:	8aaa                	mv	s5,a0
ffffffffc020a5b6:	10400513          	li	a0,260
ffffffffc020a5ba:	e85a                	sd	s6,16(sp)
ffffffffc020a5bc:	e486                	sd	ra,72(sp)
ffffffffc020a5be:	e0a2                	sd	s0,64(sp)
ffffffffc020a5c0:	fc26                	sd	s1,56(sp)
ffffffffc020a5c2:	f84a                	sd	s2,48(sp)
ffffffffc020a5c4:	f44e                	sd	s3,40(sp)
ffffffffc020a5c6:	f052                	sd	s4,32(sp)
ffffffffc020a5c8:	e45e                	sd	s7,8(sp)
ffffffffc020a5ca:	e062                	sd	s8,0(sp)
ffffffffc020a5cc:	8b2e                	mv	s6,a1
ffffffffc020a5ce:	a51f70ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc020a5d2:	cd61                	beqz	a0,ffffffffc020a6aa <sfs_getdirentry+0xfa>
ffffffffc020a5d4:	068abb83          	ld	s7,104(s5) # 8000068 <_binary_bin_sfs_img_size+0x7f8ad68>
ffffffffc020a5d8:	0c0b8b63          	beqz	s7,ffffffffc020a6ae <sfs_getdirentry+0xfe>
ffffffffc020a5dc:	0b0ba783          	lw	a5,176(s7) # 10b0 <_binary_bin_swap_img_size-0x6c50>
ffffffffc020a5e0:	e7f9                	bnez	a5,ffffffffc020a6ae <sfs_getdirentry+0xfe>
ffffffffc020a5e2:	058aa703          	lw	a4,88(s5)
ffffffffc020a5e6:	6785                	lui	a5,0x1
ffffffffc020a5e8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a5ec:	0ef71163          	bne	a4,a5,ffffffffc020a6ce <sfs_getdirentry+0x11e>
ffffffffc020a5f0:	008b3983          	ld	s3,8(s6) # 1008 <_binary_bin_swap_img_size-0x6cf8>
ffffffffc020a5f4:	892a                	mv	s2,a0
ffffffffc020a5f6:	0a09c163          	bltz	s3,ffffffffc020a698 <sfs_getdirentry+0xe8>
ffffffffc020a5fa:	0ff9f793          	zext.b	a5,s3
ffffffffc020a5fe:	efc9                	bnez	a5,ffffffffc020a698 <sfs_getdirentry+0xe8>
ffffffffc020a600:	000ab783          	ld	a5,0(s5)
ffffffffc020a604:	0089d993          	srli	s3,s3,0x8
ffffffffc020a608:	2981                	sext.w	s3,s3
ffffffffc020a60a:	479c                	lw	a5,8(a5)
ffffffffc020a60c:	0937eb63          	bltu	a5,s3,ffffffffc020a6a2 <sfs_getdirentry+0xf2>
ffffffffc020a610:	020a8c13          	addi	s8,s5,32
ffffffffc020a614:	8562                	mv	a0,s8
ffffffffc020a616:	8eefa0ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc020a61a:	000ab783          	ld	a5,0(s5)
ffffffffc020a61e:	0087aa03          	lw	s4,8(a5)
ffffffffc020a622:	07405663          	blez	s4,ffffffffc020a68e <sfs_getdirentry+0xde>
ffffffffc020a626:	4481                	li	s1,0
ffffffffc020a628:	a811                	j	ffffffffc020a63c <sfs_getdirentry+0x8c>
ffffffffc020a62a:	00092783          	lw	a5,0(s2)
ffffffffc020a62e:	c781                	beqz	a5,ffffffffc020a636 <sfs_getdirentry+0x86>
ffffffffc020a630:	02098263          	beqz	s3,ffffffffc020a654 <sfs_getdirentry+0xa4>
ffffffffc020a634:	39fd                	addiw	s3,s3,-1
ffffffffc020a636:	2485                	addiw	s1,s1,1
ffffffffc020a638:	049a0b63          	beq	s4,s1,ffffffffc020a68e <sfs_getdirentry+0xde>
ffffffffc020a63c:	86ca                	mv	a3,s2
ffffffffc020a63e:	8626                	mv	a2,s1
ffffffffc020a640:	85d6                	mv	a1,s5
ffffffffc020a642:	855e                	mv	a0,s7
ffffffffc020a644:	eadff0ef          	jal	ra,ffffffffc020a4f0 <sfs_dirent_read_nolock>
ffffffffc020a648:	842a                	mv	s0,a0
ffffffffc020a64a:	d165                	beqz	a0,ffffffffc020a62a <sfs_getdirentry+0x7a>
ffffffffc020a64c:	8562                	mv	a0,s8
ffffffffc020a64e:	8b2fa0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc020a652:	a831                	j	ffffffffc020a66e <sfs_getdirentry+0xbe>
ffffffffc020a654:	8562                	mv	a0,s8
ffffffffc020a656:	8aafa0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc020a65a:	4701                	li	a4,0
ffffffffc020a65c:	4685                	li	a3,1
ffffffffc020a65e:	10000613          	li	a2,256
ffffffffc020a662:	00490593          	addi	a1,s2,4
ffffffffc020a666:	855a                	mv	a0,s6
ffffffffc020a668:	eb9fa0ef          	jal	ra,ffffffffc0205520 <iobuf_move>
ffffffffc020a66c:	842a                	mv	s0,a0
ffffffffc020a66e:	854a                	mv	a0,s2
ffffffffc020a670:	a5ff70ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc020a674:	60a6                	ld	ra,72(sp)
ffffffffc020a676:	8522                	mv	a0,s0
ffffffffc020a678:	6406                	ld	s0,64(sp)
ffffffffc020a67a:	74e2                	ld	s1,56(sp)
ffffffffc020a67c:	7942                	ld	s2,48(sp)
ffffffffc020a67e:	79a2                	ld	s3,40(sp)
ffffffffc020a680:	7a02                	ld	s4,32(sp)
ffffffffc020a682:	6ae2                	ld	s5,24(sp)
ffffffffc020a684:	6b42                	ld	s6,16(sp)
ffffffffc020a686:	6ba2                	ld	s7,8(sp)
ffffffffc020a688:	6c02                	ld	s8,0(sp)
ffffffffc020a68a:	6161                	addi	sp,sp,80
ffffffffc020a68c:	8082                	ret
ffffffffc020a68e:	8562                	mv	a0,s8
ffffffffc020a690:	5441                	li	s0,-16
ffffffffc020a692:	86efa0ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc020a696:	bfe1                	j	ffffffffc020a66e <sfs_getdirentry+0xbe>
ffffffffc020a698:	854a                	mv	a0,s2
ffffffffc020a69a:	a35f70ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc020a69e:	5475                	li	s0,-3
ffffffffc020a6a0:	bfd1                	j	ffffffffc020a674 <sfs_getdirentry+0xc4>
ffffffffc020a6a2:	a2df70ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc020a6a6:	5441                	li	s0,-16
ffffffffc020a6a8:	b7f1                	j	ffffffffc020a674 <sfs_getdirentry+0xc4>
ffffffffc020a6aa:	5471                	li	s0,-4
ffffffffc020a6ac:	b7e1                	j	ffffffffc020a674 <sfs_getdirentry+0xc4>
ffffffffc020a6ae:	00005697          	auipc	a3,0x5
ffffffffc020a6b2:	bda68693          	addi	a3,a3,-1062 # ffffffffc020f288 <dev_node_ops+0x3e0>
ffffffffc020a6b6:	00001617          	auipc	a2,0x1
ffffffffc020a6ba:	68a60613          	addi	a2,a2,1674 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a6be:	35300593          	li	a1,851
ffffffffc020a6c2:	00005517          	auipc	a0,0x5
ffffffffc020a6c6:	da650513          	addi	a0,a0,-602 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a6ca:	dd5f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a6ce:	00005697          	auipc	a3,0x5
ffffffffc020a6d2:	d6268693          	addi	a3,a3,-670 # ffffffffc020f430 <dev_node_ops+0x588>
ffffffffc020a6d6:	00001617          	auipc	a2,0x1
ffffffffc020a6da:	66a60613          	addi	a2,a2,1642 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a6de:	35400593          	li	a1,852
ffffffffc020a6e2:	00005517          	auipc	a0,0x5
ffffffffc020a6e6:	d8650513          	addi	a0,a0,-634 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a6ea:	db5f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a6ee <sfs_dirent_search_nolock.constprop.0>:
ffffffffc020a6ee:	715d                	addi	sp,sp,-80
ffffffffc020a6f0:	f052                	sd	s4,32(sp)
ffffffffc020a6f2:	8a2a                	mv	s4,a0
ffffffffc020a6f4:	8532                	mv	a0,a2
ffffffffc020a6f6:	f44e                	sd	s3,40(sp)
ffffffffc020a6f8:	e85a                	sd	s6,16(sp)
ffffffffc020a6fa:	e45e                	sd	s7,8(sp)
ffffffffc020a6fc:	e486                	sd	ra,72(sp)
ffffffffc020a6fe:	e0a2                	sd	s0,64(sp)
ffffffffc020a700:	fc26                	sd	s1,56(sp)
ffffffffc020a702:	f84a                	sd	s2,48(sp)
ffffffffc020a704:	ec56                	sd	s5,24(sp)
ffffffffc020a706:	e062                	sd	s8,0(sp)
ffffffffc020a708:	8b32                	mv	s6,a2
ffffffffc020a70a:	89ae                	mv	s3,a1
ffffffffc020a70c:	8bb6                	mv	s7,a3
ffffffffc020a70e:	0aa010ef          	jal	ra,ffffffffc020b7b8 <strlen>
ffffffffc020a712:	0ff00793          	li	a5,255
ffffffffc020a716:	06a7ef63          	bltu	a5,a0,ffffffffc020a794 <sfs_dirent_search_nolock.constprop.0+0xa6>
ffffffffc020a71a:	10400513          	li	a0,260
ffffffffc020a71e:	901f70ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc020a722:	892a                	mv	s2,a0
ffffffffc020a724:	c535                	beqz	a0,ffffffffc020a790 <sfs_dirent_search_nolock.constprop.0+0xa2>
ffffffffc020a726:	0009b783          	ld	a5,0(s3)
ffffffffc020a72a:	0087aa83          	lw	s5,8(a5)
ffffffffc020a72e:	05505a63          	blez	s5,ffffffffc020a782 <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a732:	4481                	li	s1,0
ffffffffc020a734:	00450c13          	addi	s8,a0,4
ffffffffc020a738:	a829                	j	ffffffffc020a752 <sfs_dirent_search_nolock.constprop.0+0x64>
ffffffffc020a73a:	00092783          	lw	a5,0(s2)
ffffffffc020a73e:	c799                	beqz	a5,ffffffffc020a74c <sfs_dirent_search_nolock.constprop.0+0x5e>
ffffffffc020a740:	85e2                	mv	a1,s8
ffffffffc020a742:	855a                	mv	a0,s6
ffffffffc020a744:	0bc010ef          	jal	ra,ffffffffc020b800 <strcmp>
ffffffffc020a748:	842a                	mv	s0,a0
ffffffffc020a74a:	cd15                	beqz	a0,ffffffffc020a786 <sfs_dirent_search_nolock.constprop.0+0x98>
ffffffffc020a74c:	2485                	addiw	s1,s1,1
ffffffffc020a74e:	029a8a63          	beq	s5,s1,ffffffffc020a782 <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a752:	86ca                	mv	a3,s2
ffffffffc020a754:	8626                	mv	a2,s1
ffffffffc020a756:	85ce                	mv	a1,s3
ffffffffc020a758:	8552                	mv	a0,s4
ffffffffc020a75a:	d97ff0ef          	jal	ra,ffffffffc020a4f0 <sfs_dirent_read_nolock>
ffffffffc020a75e:	842a                	mv	s0,a0
ffffffffc020a760:	dd69                	beqz	a0,ffffffffc020a73a <sfs_dirent_search_nolock.constprop.0+0x4c>
ffffffffc020a762:	854a                	mv	a0,s2
ffffffffc020a764:	96bf70ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc020a768:	60a6                	ld	ra,72(sp)
ffffffffc020a76a:	8522                	mv	a0,s0
ffffffffc020a76c:	6406                	ld	s0,64(sp)
ffffffffc020a76e:	74e2                	ld	s1,56(sp)
ffffffffc020a770:	7942                	ld	s2,48(sp)
ffffffffc020a772:	79a2                	ld	s3,40(sp)
ffffffffc020a774:	7a02                	ld	s4,32(sp)
ffffffffc020a776:	6ae2                	ld	s5,24(sp)
ffffffffc020a778:	6b42                	ld	s6,16(sp)
ffffffffc020a77a:	6ba2                	ld	s7,8(sp)
ffffffffc020a77c:	6c02                	ld	s8,0(sp)
ffffffffc020a77e:	6161                	addi	sp,sp,80
ffffffffc020a780:	8082                	ret
ffffffffc020a782:	5441                	li	s0,-16
ffffffffc020a784:	bff9                	j	ffffffffc020a762 <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a786:	00092783          	lw	a5,0(s2)
ffffffffc020a78a:	00fba023          	sw	a5,0(s7)
ffffffffc020a78e:	bfd1                	j	ffffffffc020a762 <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a790:	5471                	li	s0,-4
ffffffffc020a792:	bfd9                	j	ffffffffc020a768 <sfs_dirent_search_nolock.constprop.0+0x7a>
ffffffffc020a794:	00005697          	auipc	a3,0x5
ffffffffc020a798:	eb468693          	addi	a3,a3,-332 # ffffffffc020f648 <dev_node_ops+0x7a0>
ffffffffc020a79c:	00001617          	auipc	a2,0x1
ffffffffc020a7a0:	5a460613          	addi	a2,a2,1444 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a7a4:	1ba00593          	li	a1,442
ffffffffc020a7a8:	00005517          	auipc	a0,0x5
ffffffffc020a7ac:	cc050513          	addi	a0,a0,-832 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a7b0:	ceff50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a7b4 <sfs_truncfile>:
ffffffffc020a7b4:	7175                	addi	sp,sp,-144
ffffffffc020a7b6:	e506                	sd	ra,136(sp)
ffffffffc020a7b8:	e122                	sd	s0,128(sp)
ffffffffc020a7ba:	fca6                	sd	s1,120(sp)
ffffffffc020a7bc:	f8ca                	sd	s2,112(sp)
ffffffffc020a7be:	f4ce                	sd	s3,104(sp)
ffffffffc020a7c0:	f0d2                	sd	s4,96(sp)
ffffffffc020a7c2:	ecd6                	sd	s5,88(sp)
ffffffffc020a7c4:	e8da                	sd	s6,80(sp)
ffffffffc020a7c6:	e4de                	sd	s7,72(sp)
ffffffffc020a7c8:	e0e2                	sd	s8,64(sp)
ffffffffc020a7ca:	fc66                	sd	s9,56(sp)
ffffffffc020a7cc:	f86a                	sd	s10,48(sp)
ffffffffc020a7ce:	f46e                	sd	s11,40(sp)
ffffffffc020a7d0:	080007b7          	lui	a5,0x8000
ffffffffc020a7d4:	16b7e463          	bltu	a5,a1,ffffffffc020a93c <sfs_truncfile+0x188>
ffffffffc020a7d8:	06853c83          	ld	s9,104(a0)
ffffffffc020a7dc:	89aa                	mv	s3,a0
ffffffffc020a7de:	160c8163          	beqz	s9,ffffffffc020a940 <sfs_truncfile+0x18c>
ffffffffc020a7e2:	0b0ca783          	lw	a5,176(s9)
ffffffffc020a7e6:	14079d63          	bnez	a5,ffffffffc020a940 <sfs_truncfile+0x18c>
ffffffffc020a7ea:	4d38                	lw	a4,88(a0)
ffffffffc020a7ec:	6405                	lui	s0,0x1
ffffffffc020a7ee:	23540793          	addi	a5,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a7f2:	16f71763          	bne	a4,a5,ffffffffc020a960 <sfs_truncfile+0x1ac>
ffffffffc020a7f6:	00053a83          	ld	s5,0(a0)
ffffffffc020a7fa:	147d                	addi	s0,s0,-1
ffffffffc020a7fc:	942e                	add	s0,s0,a1
ffffffffc020a7fe:	000ae783          	lwu	a5,0(s5)
ffffffffc020a802:	8031                	srli	s0,s0,0xc
ffffffffc020a804:	8a2e                	mv	s4,a1
ffffffffc020a806:	2401                	sext.w	s0,s0
ffffffffc020a808:	02b79763          	bne	a5,a1,ffffffffc020a836 <sfs_truncfile+0x82>
ffffffffc020a80c:	008aa783          	lw	a5,8(s5)
ffffffffc020a810:	4901                	li	s2,0
ffffffffc020a812:	18879763          	bne	a5,s0,ffffffffc020a9a0 <sfs_truncfile+0x1ec>
ffffffffc020a816:	60aa                	ld	ra,136(sp)
ffffffffc020a818:	640a                	ld	s0,128(sp)
ffffffffc020a81a:	74e6                	ld	s1,120(sp)
ffffffffc020a81c:	79a6                	ld	s3,104(sp)
ffffffffc020a81e:	7a06                	ld	s4,96(sp)
ffffffffc020a820:	6ae6                	ld	s5,88(sp)
ffffffffc020a822:	6b46                	ld	s6,80(sp)
ffffffffc020a824:	6ba6                	ld	s7,72(sp)
ffffffffc020a826:	6c06                	ld	s8,64(sp)
ffffffffc020a828:	7ce2                	ld	s9,56(sp)
ffffffffc020a82a:	7d42                	ld	s10,48(sp)
ffffffffc020a82c:	7da2                	ld	s11,40(sp)
ffffffffc020a82e:	854a                	mv	a0,s2
ffffffffc020a830:	7946                	ld	s2,112(sp)
ffffffffc020a832:	6149                	addi	sp,sp,144
ffffffffc020a834:	8082                	ret
ffffffffc020a836:	02050b13          	addi	s6,a0,32
ffffffffc020a83a:	855a                	mv	a0,s6
ffffffffc020a83c:	ec9f90ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc020a840:	008aa483          	lw	s1,8(s5)
ffffffffc020a844:	0a84e663          	bltu	s1,s0,ffffffffc020a8f0 <sfs_truncfile+0x13c>
ffffffffc020a848:	0c947163          	bgeu	s0,s1,ffffffffc020a90a <sfs_truncfile+0x156>
ffffffffc020a84c:	4dad                	li	s11,11
ffffffffc020a84e:	4b85                	li	s7,1
ffffffffc020a850:	a09d                	j	ffffffffc020a8b6 <sfs_truncfile+0x102>
ffffffffc020a852:	ff37091b          	addiw	s2,a4,-13
ffffffffc020a856:	0009079b          	sext.w	a5,s2
ffffffffc020a85a:	3ff00713          	li	a4,1023
ffffffffc020a85e:	04f76563          	bltu	a4,a5,ffffffffc020a8a8 <sfs_truncfile+0xf4>
ffffffffc020a862:	03cd2c03          	lw	s8,60(s10)
ffffffffc020a866:	040c0163          	beqz	s8,ffffffffc020a8a8 <sfs_truncfile+0xf4>
ffffffffc020a86a:	004ca783          	lw	a5,4(s9)
ffffffffc020a86e:	18fc7963          	bgeu	s8,a5,ffffffffc020aa00 <sfs_truncfile+0x24c>
ffffffffc020a872:	038cb503          	ld	a0,56(s9)
ffffffffc020a876:	85e2                	mv	a1,s8
ffffffffc020a878:	b61fe0ef          	jal	ra,ffffffffc02093d8 <bitmap_test>
ffffffffc020a87c:	16051263          	bnez	a0,ffffffffc020a9e0 <sfs_truncfile+0x22c>
ffffffffc020a880:	02091793          	slli	a5,s2,0x20
ffffffffc020a884:	01e7d713          	srli	a4,a5,0x1e
ffffffffc020a888:	86e2                	mv	a3,s8
ffffffffc020a88a:	4611                	li	a2,4
ffffffffc020a88c:	082c                	addi	a1,sp,24
ffffffffc020a88e:	8566                	mv	a0,s9
ffffffffc020a890:	e43a                	sd	a4,8(sp)
ffffffffc020a892:	ce02                	sw	zero,28(sp)
ffffffffc020a894:	043000ef          	jal	ra,ffffffffc020b0d6 <sfs_rbuf>
ffffffffc020a898:	892a                	mv	s2,a0
ffffffffc020a89a:	e141                	bnez	a0,ffffffffc020a91a <sfs_truncfile+0x166>
ffffffffc020a89c:	47e2                	lw	a5,24(sp)
ffffffffc020a89e:	6722                	ld	a4,8(sp)
ffffffffc020a8a0:	e3c9                	bnez	a5,ffffffffc020a922 <sfs_truncfile+0x16e>
ffffffffc020a8a2:	008d2603          	lw	a2,8(s10)
ffffffffc020a8a6:	367d                	addiw	a2,a2,-1
ffffffffc020a8a8:	00cd2423          	sw	a2,8(s10)
ffffffffc020a8ac:	0179b823          	sd	s7,16(s3)
ffffffffc020a8b0:	34fd                	addiw	s1,s1,-1
ffffffffc020a8b2:	04940a63          	beq	s0,s1,ffffffffc020a906 <sfs_truncfile+0x152>
ffffffffc020a8b6:	0009bd03          	ld	s10,0(s3)
ffffffffc020a8ba:	008d2703          	lw	a4,8(s10)
ffffffffc020a8be:	c369                	beqz	a4,ffffffffc020a980 <sfs_truncfile+0x1cc>
ffffffffc020a8c0:	fff7079b          	addiw	a5,a4,-1
ffffffffc020a8c4:	0007861b          	sext.w	a2,a5
ffffffffc020a8c8:	f8cde5e3          	bltu	s11,a2,ffffffffc020a852 <sfs_truncfile+0x9e>
ffffffffc020a8cc:	02079713          	slli	a4,a5,0x20
ffffffffc020a8d0:	01e75793          	srli	a5,a4,0x1e
ffffffffc020a8d4:	00fd0933          	add	s2,s10,a5
ffffffffc020a8d8:	00c92583          	lw	a1,12(s2)
ffffffffc020a8dc:	d5f1                	beqz	a1,ffffffffc020a8a8 <sfs_truncfile+0xf4>
ffffffffc020a8de:	8566                	mv	a0,s9
ffffffffc020a8e0:	c06ff0ef          	jal	ra,ffffffffc0209ce6 <sfs_block_free>
ffffffffc020a8e4:	00092623          	sw	zero,12(s2)
ffffffffc020a8e8:	008d2603          	lw	a2,8(s10)
ffffffffc020a8ec:	367d                	addiw	a2,a2,-1
ffffffffc020a8ee:	bf6d                	j	ffffffffc020a8a8 <sfs_truncfile+0xf4>
ffffffffc020a8f0:	4681                	li	a3,0
ffffffffc020a8f2:	8626                	mv	a2,s1
ffffffffc020a8f4:	85ce                	mv	a1,s3
ffffffffc020a8f6:	8566                	mv	a0,s9
ffffffffc020a8f8:	ea8ff0ef          	jal	ra,ffffffffc0209fa0 <sfs_bmap_load_nolock>
ffffffffc020a8fc:	892a                	mv	s2,a0
ffffffffc020a8fe:	ed11                	bnez	a0,ffffffffc020a91a <sfs_truncfile+0x166>
ffffffffc020a900:	2485                	addiw	s1,s1,1
ffffffffc020a902:	fe9417e3          	bne	s0,s1,ffffffffc020a8f0 <sfs_truncfile+0x13c>
ffffffffc020a906:	008aa483          	lw	s1,8(s5)
ffffffffc020a90a:	0a941b63          	bne	s0,s1,ffffffffc020a9c0 <sfs_truncfile+0x20c>
ffffffffc020a90e:	014aa023          	sw	s4,0(s5)
ffffffffc020a912:	4785                	li	a5,1
ffffffffc020a914:	00f9b823          	sd	a5,16(s3)
ffffffffc020a918:	4901                	li	s2,0
ffffffffc020a91a:	855a                	mv	a0,s6
ffffffffc020a91c:	de5f90ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc020a920:	bddd                	j	ffffffffc020a816 <sfs_truncfile+0x62>
ffffffffc020a922:	86e2                	mv	a3,s8
ffffffffc020a924:	4611                	li	a2,4
ffffffffc020a926:	086c                	addi	a1,sp,28
ffffffffc020a928:	8566                	mv	a0,s9
ffffffffc020a92a:	02d000ef          	jal	ra,ffffffffc020b156 <sfs_wbuf>
ffffffffc020a92e:	892a                	mv	s2,a0
ffffffffc020a930:	f56d                	bnez	a0,ffffffffc020a91a <sfs_truncfile+0x166>
ffffffffc020a932:	45e2                	lw	a1,24(sp)
ffffffffc020a934:	8566                	mv	a0,s9
ffffffffc020a936:	bb0ff0ef          	jal	ra,ffffffffc0209ce6 <sfs_block_free>
ffffffffc020a93a:	b7a5                	j	ffffffffc020a8a2 <sfs_truncfile+0xee>
ffffffffc020a93c:	5975                	li	s2,-3
ffffffffc020a93e:	bde1                	j	ffffffffc020a816 <sfs_truncfile+0x62>
ffffffffc020a940:	00005697          	auipc	a3,0x5
ffffffffc020a944:	94868693          	addi	a3,a3,-1720 # ffffffffc020f288 <dev_node_ops+0x3e0>
ffffffffc020a948:	00001617          	auipc	a2,0x1
ffffffffc020a94c:	3f860613          	addi	a2,a2,1016 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a950:	3c200593          	li	a1,962
ffffffffc020a954:	00005517          	auipc	a0,0x5
ffffffffc020a958:	b1450513          	addi	a0,a0,-1260 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a95c:	b43f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a960:	00005697          	auipc	a3,0x5
ffffffffc020a964:	ad068693          	addi	a3,a3,-1328 # ffffffffc020f430 <dev_node_ops+0x588>
ffffffffc020a968:	00001617          	auipc	a2,0x1
ffffffffc020a96c:	3d860613          	addi	a2,a2,984 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a970:	3c300593          	li	a1,963
ffffffffc020a974:	00005517          	auipc	a0,0x5
ffffffffc020a978:	af450513          	addi	a0,a0,-1292 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a97c:	b23f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a980:	00005697          	auipc	a3,0x5
ffffffffc020a984:	d0868693          	addi	a3,a3,-760 # ffffffffc020f688 <dev_node_ops+0x7e0>
ffffffffc020a988:	00001617          	auipc	a2,0x1
ffffffffc020a98c:	3b860613          	addi	a2,a2,952 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a990:	17b00593          	li	a1,379
ffffffffc020a994:	00005517          	auipc	a0,0x5
ffffffffc020a998:	ad450513          	addi	a0,a0,-1324 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a99c:	b03f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a9a0:	00005697          	auipc	a3,0x5
ffffffffc020a9a4:	cd068693          	addi	a3,a3,-816 # ffffffffc020f670 <dev_node_ops+0x7c8>
ffffffffc020a9a8:	00001617          	auipc	a2,0x1
ffffffffc020a9ac:	39860613          	addi	a2,a2,920 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a9b0:	3ca00593          	li	a1,970
ffffffffc020a9b4:	00005517          	auipc	a0,0x5
ffffffffc020a9b8:	ab450513          	addi	a0,a0,-1356 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a9bc:	ae3f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a9c0:	00005697          	auipc	a3,0x5
ffffffffc020a9c4:	d1868693          	addi	a3,a3,-744 # ffffffffc020f6d8 <dev_node_ops+0x830>
ffffffffc020a9c8:	00001617          	auipc	a2,0x1
ffffffffc020a9cc:	37860613          	addi	a2,a2,888 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a9d0:	3e300593          	li	a1,995
ffffffffc020a9d4:	00005517          	auipc	a0,0x5
ffffffffc020a9d8:	a9450513          	addi	a0,a0,-1388 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a9dc:	ac3f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a9e0:	00005697          	auipc	a3,0x5
ffffffffc020a9e4:	cc068693          	addi	a3,a3,-832 # ffffffffc020f6a0 <dev_node_ops+0x7f8>
ffffffffc020a9e8:	00001617          	auipc	a2,0x1
ffffffffc020a9ec:	35860613          	addi	a2,a2,856 # ffffffffc020bd40 <commands+0x210>
ffffffffc020a9f0:	12b00593          	li	a1,299
ffffffffc020a9f4:	00005517          	auipc	a0,0x5
ffffffffc020a9f8:	a7450513          	addi	a0,a0,-1420 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020a9fc:	aa3f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020aa00:	8762                	mv	a4,s8
ffffffffc020aa02:	86be                	mv	a3,a5
ffffffffc020aa04:	00005617          	auipc	a2,0x5
ffffffffc020aa08:	a9460613          	addi	a2,a2,-1388 # ffffffffc020f498 <dev_node_ops+0x5f0>
ffffffffc020aa0c:	05300593          	li	a1,83
ffffffffc020aa10:	00005517          	auipc	a0,0x5
ffffffffc020aa14:	a5850513          	addi	a0,a0,-1448 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020aa18:	a87f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020aa1c <sfs_load_inode>:
ffffffffc020aa1c:	7139                	addi	sp,sp,-64
ffffffffc020aa1e:	fc06                	sd	ra,56(sp)
ffffffffc020aa20:	f822                	sd	s0,48(sp)
ffffffffc020aa22:	f426                	sd	s1,40(sp)
ffffffffc020aa24:	f04a                	sd	s2,32(sp)
ffffffffc020aa26:	84b2                	mv	s1,a2
ffffffffc020aa28:	892a                	mv	s2,a0
ffffffffc020aa2a:	ec4e                	sd	s3,24(sp)
ffffffffc020aa2c:	e852                	sd	s4,16(sp)
ffffffffc020aa2e:	89ae                	mv	s3,a1
ffffffffc020aa30:	e456                	sd	s5,8(sp)
ffffffffc020aa32:	0d5000ef          	jal	ra,ffffffffc020b306 <lock_sfs_fs>
ffffffffc020aa36:	45a9                	li	a1,10
ffffffffc020aa38:	8526                	mv	a0,s1
ffffffffc020aa3a:	0a893403          	ld	s0,168(s2)
ffffffffc020aa3e:	0e9000ef          	jal	ra,ffffffffc020b326 <hash32>
ffffffffc020aa42:	02051793          	slli	a5,a0,0x20
ffffffffc020aa46:	01c7d713          	srli	a4,a5,0x1c
ffffffffc020aa4a:	9722                	add	a4,a4,s0
ffffffffc020aa4c:	843a                	mv	s0,a4
ffffffffc020aa4e:	a029                	j	ffffffffc020aa58 <sfs_load_inode+0x3c>
ffffffffc020aa50:	fc042783          	lw	a5,-64(s0)
ffffffffc020aa54:	10978863          	beq	a5,s1,ffffffffc020ab64 <sfs_load_inode+0x148>
ffffffffc020aa58:	6400                	ld	s0,8(s0)
ffffffffc020aa5a:	fe871be3          	bne	a4,s0,ffffffffc020aa50 <sfs_load_inode+0x34>
ffffffffc020aa5e:	04000513          	li	a0,64
ffffffffc020aa62:	dbcf70ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc020aa66:	8aaa                	mv	s5,a0
ffffffffc020aa68:	16050563          	beqz	a0,ffffffffc020abd2 <sfs_load_inode+0x1b6>
ffffffffc020aa6c:	00492683          	lw	a3,4(s2)
ffffffffc020aa70:	18048363          	beqz	s1,ffffffffc020abf6 <sfs_load_inode+0x1da>
ffffffffc020aa74:	18d4f163          	bgeu	s1,a3,ffffffffc020abf6 <sfs_load_inode+0x1da>
ffffffffc020aa78:	03893503          	ld	a0,56(s2)
ffffffffc020aa7c:	85a6                	mv	a1,s1
ffffffffc020aa7e:	95bfe0ef          	jal	ra,ffffffffc02093d8 <bitmap_test>
ffffffffc020aa82:	18051763          	bnez	a0,ffffffffc020ac10 <sfs_load_inode+0x1f4>
ffffffffc020aa86:	4701                	li	a4,0
ffffffffc020aa88:	86a6                	mv	a3,s1
ffffffffc020aa8a:	04000613          	li	a2,64
ffffffffc020aa8e:	85d6                	mv	a1,s5
ffffffffc020aa90:	854a                	mv	a0,s2
ffffffffc020aa92:	644000ef          	jal	ra,ffffffffc020b0d6 <sfs_rbuf>
ffffffffc020aa96:	842a                	mv	s0,a0
ffffffffc020aa98:	0e051563          	bnez	a0,ffffffffc020ab82 <sfs_load_inode+0x166>
ffffffffc020aa9c:	006ad783          	lhu	a5,6(s5)
ffffffffc020aaa0:	12078b63          	beqz	a5,ffffffffc020abd6 <sfs_load_inode+0x1ba>
ffffffffc020aaa4:	6405                	lui	s0,0x1
ffffffffc020aaa6:	23540513          	addi	a0,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020aaaa:	8e8fd0ef          	jal	ra,ffffffffc0207b92 <__alloc_inode>
ffffffffc020aaae:	8a2a                	mv	s4,a0
ffffffffc020aab0:	c961                	beqz	a0,ffffffffc020ab80 <sfs_load_inode+0x164>
ffffffffc020aab2:	004ad683          	lhu	a3,4(s5)
ffffffffc020aab6:	4785                	li	a5,1
ffffffffc020aab8:	0cf69c63          	bne	a3,a5,ffffffffc020ab90 <sfs_load_inode+0x174>
ffffffffc020aabc:	864a                	mv	a2,s2
ffffffffc020aabe:	00005597          	auipc	a1,0x5
ffffffffc020aac2:	d2a58593          	addi	a1,a1,-726 # ffffffffc020f7e8 <sfs_node_fileops>
ffffffffc020aac6:	8e8fd0ef          	jal	ra,ffffffffc0207bae <inode_init>
ffffffffc020aaca:	058a2783          	lw	a5,88(s4)
ffffffffc020aace:	23540413          	addi	s0,s0,565
ffffffffc020aad2:	0e879063          	bne	a5,s0,ffffffffc020abb2 <sfs_load_inode+0x196>
ffffffffc020aad6:	4785                	li	a5,1
ffffffffc020aad8:	00fa2c23          	sw	a5,24(s4)
ffffffffc020aadc:	015a3023          	sd	s5,0(s4)
ffffffffc020aae0:	009a2423          	sw	s1,8(s4)
ffffffffc020aae4:	000a3823          	sd	zero,16(s4)
ffffffffc020aae8:	4585                	li	a1,1
ffffffffc020aaea:	020a0513          	addi	a0,s4,32
ffffffffc020aaee:	c0df90ef          	jal	ra,ffffffffc02046fa <sem_init>
ffffffffc020aaf2:	058a2703          	lw	a4,88(s4)
ffffffffc020aaf6:	6785                	lui	a5,0x1
ffffffffc020aaf8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020aafc:	14f71663          	bne	a4,a5,ffffffffc020ac48 <sfs_load_inode+0x22c>
ffffffffc020ab00:	0a093703          	ld	a4,160(s2)
ffffffffc020ab04:	038a0793          	addi	a5,s4,56
ffffffffc020ab08:	008a2503          	lw	a0,8(s4)
ffffffffc020ab0c:	e31c                	sd	a5,0(a4)
ffffffffc020ab0e:	0af93023          	sd	a5,160(s2)
ffffffffc020ab12:	09890793          	addi	a5,s2,152
ffffffffc020ab16:	0a893403          	ld	s0,168(s2)
ffffffffc020ab1a:	45a9                	li	a1,10
ffffffffc020ab1c:	04ea3023          	sd	a4,64(s4)
ffffffffc020ab20:	02fa3c23          	sd	a5,56(s4)
ffffffffc020ab24:	003000ef          	jal	ra,ffffffffc020b326 <hash32>
ffffffffc020ab28:	02051713          	slli	a4,a0,0x20
ffffffffc020ab2c:	01c75793          	srli	a5,a4,0x1c
ffffffffc020ab30:	97a2                	add	a5,a5,s0
ffffffffc020ab32:	6798                	ld	a4,8(a5)
ffffffffc020ab34:	048a0693          	addi	a3,s4,72
ffffffffc020ab38:	e314                	sd	a3,0(a4)
ffffffffc020ab3a:	e794                	sd	a3,8(a5)
ffffffffc020ab3c:	04ea3823          	sd	a4,80(s4)
ffffffffc020ab40:	04fa3423          	sd	a5,72(s4)
ffffffffc020ab44:	854a                	mv	a0,s2
ffffffffc020ab46:	7d0000ef          	jal	ra,ffffffffc020b316 <unlock_sfs_fs>
ffffffffc020ab4a:	4401                	li	s0,0
ffffffffc020ab4c:	0149b023          	sd	s4,0(s3)
ffffffffc020ab50:	70e2                	ld	ra,56(sp)
ffffffffc020ab52:	8522                	mv	a0,s0
ffffffffc020ab54:	7442                	ld	s0,48(sp)
ffffffffc020ab56:	74a2                	ld	s1,40(sp)
ffffffffc020ab58:	7902                	ld	s2,32(sp)
ffffffffc020ab5a:	69e2                	ld	s3,24(sp)
ffffffffc020ab5c:	6a42                	ld	s4,16(sp)
ffffffffc020ab5e:	6aa2                	ld	s5,8(sp)
ffffffffc020ab60:	6121                	addi	sp,sp,64
ffffffffc020ab62:	8082                	ret
ffffffffc020ab64:	fb840a13          	addi	s4,s0,-72
ffffffffc020ab68:	8552                	mv	a0,s4
ffffffffc020ab6a:	8a6fd0ef          	jal	ra,ffffffffc0207c10 <inode_ref_inc>
ffffffffc020ab6e:	4785                	li	a5,1
ffffffffc020ab70:	fcf51ae3          	bne	a0,a5,ffffffffc020ab44 <sfs_load_inode+0x128>
ffffffffc020ab74:	fd042783          	lw	a5,-48(s0)
ffffffffc020ab78:	2785                	addiw	a5,a5,1
ffffffffc020ab7a:	fcf42823          	sw	a5,-48(s0)
ffffffffc020ab7e:	b7d9                	j	ffffffffc020ab44 <sfs_load_inode+0x128>
ffffffffc020ab80:	5471                	li	s0,-4
ffffffffc020ab82:	8556                	mv	a0,s5
ffffffffc020ab84:	d4af70ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc020ab88:	854a                	mv	a0,s2
ffffffffc020ab8a:	78c000ef          	jal	ra,ffffffffc020b316 <unlock_sfs_fs>
ffffffffc020ab8e:	b7c9                	j	ffffffffc020ab50 <sfs_load_inode+0x134>
ffffffffc020ab90:	4789                	li	a5,2
ffffffffc020ab92:	08f69f63          	bne	a3,a5,ffffffffc020ac30 <sfs_load_inode+0x214>
ffffffffc020ab96:	864a                	mv	a2,s2
ffffffffc020ab98:	00005597          	auipc	a1,0x5
ffffffffc020ab9c:	bd058593          	addi	a1,a1,-1072 # ffffffffc020f768 <sfs_node_dirops>
ffffffffc020aba0:	80efd0ef          	jal	ra,ffffffffc0207bae <inode_init>
ffffffffc020aba4:	058a2703          	lw	a4,88(s4)
ffffffffc020aba8:	6785                	lui	a5,0x1
ffffffffc020abaa:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020abae:	f2f704e3          	beq	a4,a5,ffffffffc020aad6 <sfs_load_inode+0xba>
ffffffffc020abb2:	00005697          	auipc	a3,0x5
ffffffffc020abb6:	87e68693          	addi	a3,a3,-1922 # ffffffffc020f430 <dev_node_ops+0x588>
ffffffffc020abba:	00001617          	auipc	a2,0x1
ffffffffc020abbe:	18660613          	addi	a2,a2,390 # ffffffffc020bd40 <commands+0x210>
ffffffffc020abc2:	07700593          	li	a1,119
ffffffffc020abc6:	00005517          	auipc	a0,0x5
ffffffffc020abca:	8a250513          	addi	a0,a0,-1886 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020abce:	8d1f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020abd2:	5471                	li	s0,-4
ffffffffc020abd4:	bf55                	j	ffffffffc020ab88 <sfs_load_inode+0x16c>
ffffffffc020abd6:	00005697          	auipc	a3,0x5
ffffffffc020abda:	b1a68693          	addi	a3,a3,-1254 # ffffffffc020f6f0 <dev_node_ops+0x848>
ffffffffc020abde:	00001617          	auipc	a2,0x1
ffffffffc020abe2:	16260613          	addi	a2,a2,354 # ffffffffc020bd40 <commands+0x210>
ffffffffc020abe6:	0ad00593          	li	a1,173
ffffffffc020abea:	00005517          	auipc	a0,0x5
ffffffffc020abee:	87e50513          	addi	a0,a0,-1922 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020abf2:	8adf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020abf6:	8726                	mv	a4,s1
ffffffffc020abf8:	00005617          	auipc	a2,0x5
ffffffffc020abfc:	8a060613          	addi	a2,a2,-1888 # ffffffffc020f498 <dev_node_ops+0x5f0>
ffffffffc020ac00:	05300593          	li	a1,83
ffffffffc020ac04:	00005517          	auipc	a0,0x5
ffffffffc020ac08:	86450513          	addi	a0,a0,-1948 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020ac0c:	893f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ac10:	00005697          	auipc	a3,0x5
ffffffffc020ac14:	8c068693          	addi	a3,a3,-1856 # ffffffffc020f4d0 <dev_node_ops+0x628>
ffffffffc020ac18:	00001617          	auipc	a2,0x1
ffffffffc020ac1c:	12860613          	addi	a2,a2,296 # ffffffffc020bd40 <commands+0x210>
ffffffffc020ac20:	0a800593          	li	a1,168
ffffffffc020ac24:	00005517          	auipc	a0,0x5
ffffffffc020ac28:	84450513          	addi	a0,a0,-1980 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020ac2c:	873f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ac30:	00005617          	auipc	a2,0x5
ffffffffc020ac34:	85060613          	addi	a2,a2,-1968 # ffffffffc020f480 <dev_node_ops+0x5d8>
ffffffffc020ac38:	02e00593          	li	a1,46
ffffffffc020ac3c:	00005517          	auipc	a0,0x5
ffffffffc020ac40:	82c50513          	addi	a0,a0,-2004 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020ac44:	85bf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ac48:	00004697          	auipc	a3,0x4
ffffffffc020ac4c:	7e868693          	addi	a3,a3,2024 # ffffffffc020f430 <dev_node_ops+0x588>
ffffffffc020ac50:	00001617          	auipc	a2,0x1
ffffffffc020ac54:	0f060613          	addi	a2,a2,240 # ffffffffc020bd40 <commands+0x210>
ffffffffc020ac58:	0b100593          	li	a1,177
ffffffffc020ac5c:	00005517          	auipc	a0,0x5
ffffffffc020ac60:	80c50513          	addi	a0,a0,-2036 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020ac64:	83bf50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ac68 <sfs_lookup>:
ffffffffc020ac68:	7139                	addi	sp,sp,-64
ffffffffc020ac6a:	ec4e                	sd	s3,24(sp)
ffffffffc020ac6c:	06853983          	ld	s3,104(a0)
ffffffffc020ac70:	fc06                	sd	ra,56(sp)
ffffffffc020ac72:	f822                	sd	s0,48(sp)
ffffffffc020ac74:	f426                	sd	s1,40(sp)
ffffffffc020ac76:	f04a                	sd	s2,32(sp)
ffffffffc020ac78:	e852                	sd	s4,16(sp)
ffffffffc020ac7a:	0a098c63          	beqz	s3,ffffffffc020ad32 <sfs_lookup+0xca>
ffffffffc020ac7e:	0b09a783          	lw	a5,176(s3)
ffffffffc020ac82:	ebc5                	bnez	a5,ffffffffc020ad32 <sfs_lookup+0xca>
ffffffffc020ac84:	0005c783          	lbu	a5,0(a1)
ffffffffc020ac88:	84ae                	mv	s1,a1
ffffffffc020ac8a:	c7c1                	beqz	a5,ffffffffc020ad12 <sfs_lookup+0xaa>
ffffffffc020ac8c:	02f00713          	li	a4,47
ffffffffc020ac90:	08e78163          	beq	a5,a4,ffffffffc020ad12 <sfs_lookup+0xaa>
ffffffffc020ac94:	842a                	mv	s0,a0
ffffffffc020ac96:	8a32                	mv	s4,a2
ffffffffc020ac98:	f79fc0ef          	jal	ra,ffffffffc0207c10 <inode_ref_inc>
ffffffffc020ac9c:	4c38                	lw	a4,88(s0)
ffffffffc020ac9e:	6785                	lui	a5,0x1
ffffffffc020aca0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020aca4:	0af71763          	bne	a4,a5,ffffffffc020ad52 <sfs_lookup+0xea>
ffffffffc020aca8:	6018                	ld	a4,0(s0)
ffffffffc020acaa:	4789                	li	a5,2
ffffffffc020acac:	00475703          	lhu	a4,4(a4)
ffffffffc020acb0:	04f71c63          	bne	a4,a5,ffffffffc020ad08 <sfs_lookup+0xa0>
ffffffffc020acb4:	02040913          	addi	s2,s0,32
ffffffffc020acb8:	854a                	mv	a0,s2
ffffffffc020acba:	a4bf90ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc020acbe:	8626                	mv	a2,s1
ffffffffc020acc0:	0054                	addi	a3,sp,4
ffffffffc020acc2:	85a2                	mv	a1,s0
ffffffffc020acc4:	854e                	mv	a0,s3
ffffffffc020acc6:	a29ff0ef          	jal	ra,ffffffffc020a6ee <sfs_dirent_search_nolock.constprop.0>
ffffffffc020acca:	84aa                	mv	s1,a0
ffffffffc020accc:	854a                	mv	a0,s2
ffffffffc020acce:	a33f90ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc020acd2:	cc89                	beqz	s1,ffffffffc020acec <sfs_lookup+0x84>
ffffffffc020acd4:	8522                	mv	a0,s0
ffffffffc020acd6:	808fd0ef          	jal	ra,ffffffffc0207cde <inode_ref_dec>
ffffffffc020acda:	70e2                	ld	ra,56(sp)
ffffffffc020acdc:	7442                	ld	s0,48(sp)
ffffffffc020acde:	7902                	ld	s2,32(sp)
ffffffffc020ace0:	69e2                	ld	s3,24(sp)
ffffffffc020ace2:	6a42                	ld	s4,16(sp)
ffffffffc020ace4:	8526                	mv	a0,s1
ffffffffc020ace6:	74a2                	ld	s1,40(sp)
ffffffffc020ace8:	6121                	addi	sp,sp,64
ffffffffc020acea:	8082                	ret
ffffffffc020acec:	4612                	lw	a2,4(sp)
ffffffffc020acee:	002c                	addi	a1,sp,8
ffffffffc020acf0:	854e                	mv	a0,s3
ffffffffc020acf2:	d2bff0ef          	jal	ra,ffffffffc020aa1c <sfs_load_inode>
ffffffffc020acf6:	84aa                	mv	s1,a0
ffffffffc020acf8:	8522                	mv	a0,s0
ffffffffc020acfa:	fe5fc0ef          	jal	ra,ffffffffc0207cde <inode_ref_dec>
ffffffffc020acfe:	fcf1                	bnez	s1,ffffffffc020acda <sfs_lookup+0x72>
ffffffffc020ad00:	67a2                	ld	a5,8(sp)
ffffffffc020ad02:	00fa3023          	sd	a5,0(s4)
ffffffffc020ad06:	bfd1                	j	ffffffffc020acda <sfs_lookup+0x72>
ffffffffc020ad08:	8522                	mv	a0,s0
ffffffffc020ad0a:	fd5fc0ef          	jal	ra,ffffffffc0207cde <inode_ref_dec>
ffffffffc020ad0e:	54b9                	li	s1,-18
ffffffffc020ad10:	b7e9                	j	ffffffffc020acda <sfs_lookup+0x72>
ffffffffc020ad12:	00005697          	auipc	a3,0x5
ffffffffc020ad16:	9f668693          	addi	a3,a3,-1546 # ffffffffc020f708 <dev_node_ops+0x860>
ffffffffc020ad1a:	00001617          	auipc	a2,0x1
ffffffffc020ad1e:	02660613          	addi	a2,a2,38 # ffffffffc020bd40 <commands+0x210>
ffffffffc020ad22:	3f400593          	li	a1,1012
ffffffffc020ad26:	00004517          	auipc	a0,0x4
ffffffffc020ad2a:	74250513          	addi	a0,a0,1858 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020ad2e:	f70f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ad32:	00004697          	auipc	a3,0x4
ffffffffc020ad36:	55668693          	addi	a3,a3,1366 # ffffffffc020f288 <dev_node_ops+0x3e0>
ffffffffc020ad3a:	00001617          	auipc	a2,0x1
ffffffffc020ad3e:	00660613          	addi	a2,a2,6 # ffffffffc020bd40 <commands+0x210>
ffffffffc020ad42:	3f300593          	li	a1,1011
ffffffffc020ad46:	00004517          	auipc	a0,0x4
ffffffffc020ad4a:	72250513          	addi	a0,a0,1826 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020ad4e:	f50f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ad52:	00004697          	auipc	a3,0x4
ffffffffc020ad56:	6de68693          	addi	a3,a3,1758 # ffffffffc020f430 <dev_node_ops+0x588>
ffffffffc020ad5a:	00001617          	auipc	a2,0x1
ffffffffc020ad5e:	fe660613          	addi	a2,a2,-26 # ffffffffc020bd40 <commands+0x210>
ffffffffc020ad62:	3f600593          	li	a1,1014
ffffffffc020ad66:	00004517          	auipc	a0,0x4
ffffffffc020ad6a:	70250513          	addi	a0,a0,1794 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020ad6e:	f30f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ad72 <sfs_namefile>:
ffffffffc020ad72:	6d98                	ld	a4,24(a1)
ffffffffc020ad74:	7175                	addi	sp,sp,-144
ffffffffc020ad76:	e506                	sd	ra,136(sp)
ffffffffc020ad78:	e122                	sd	s0,128(sp)
ffffffffc020ad7a:	fca6                	sd	s1,120(sp)
ffffffffc020ad7c:	f8ca                	sd	s2,112(sp)
ffffffffc020ad7e:	f4ce                	sd	s3,104(sp)
ffffffffc020ad80:	f0d2                	sd	s4,96(sp)
ffffffffc020ad82:	ecd6                	sd	s5,88(sp)
ffffffffc020ad84:	e8da                	sd	s6,80(sp)
ffffffffc020ad86:	e4de                	sd	s7,72(sp)
ffffffffc020ad88:	e0e2                	sd	s8,64(sp)
ffffffffc020ad8a:	fc66                	sd	s9,56(sp)
ffffffffc020ad8c:	f86a                	sd	s10,48(sp)
ffffffffc020ad8e:	f46e                	sd	s11,40(sp)
ffffffffc020ad90:	e42e                	sd	a1,8(sp)
ffffffffc020ad92:	4789                	li	a5,2
ffffffffc020ad94:	1ae7f363          	bgeu	a5,a4,ffffffffc020af3a <sfs_namefile+0x1c8>
ffffffffc020ad98:	89aa                	mv	s3,a0
ffffffffc020ad9a:	10400513          	li	a0,260
ffffffffc020ad9e:	a80f70ef          	jal	ra,ffffffffc020201e <kmalloc>
ffffffffc020ada2:	842a                	mv	s0,a0
ffffffffc020ada4:	18050b63          	beqz	a0,ffffffffc020af3a <sfs_namefile+0x1c8>
ffffffffc020ada8:	0689b483          	ld	s1,104(s3)
ffffffffc020adac:	1e048963          	beqz	s1,ffffffffc020af9e <sfs_namefile+0x22c>
ffffffffc020adb0:	0b04a783          	lw	a5,176(s1)
ffffffffc020adb4:	1e079563          	bnez	a5,ffffffffc020af9e <sfs_namefile+0x22c>
ffffffffc020adb8:	0589ac83          	lw	s9,88(s3)
ffffffffc020adbc:	6785                	lui	a5,0x1
ffffffffc020adbe:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020adc2:	1afc9e63          	bne	s9,a5,ffffffffc020af7e <sfs_namefile+0x20c>
ffffffffc020adc6:	6722                	ld	a4,8(sp)
ffffffffc020adc8:	854e                	mv	a0,s3
ffffffffc020adca:	8ace                	mv	s5,s3
ffffffffc020adcc:	6f1c                	ld	a5,24(a4)
ffffffffc020adce:	00073b03          	ld	s6,0(a4)
ffffffffc020add2:	02098a13          	addi	s4,s3,32
ffffffffc020add6:	ffe78b93          	addi	s7,a5,-2
ffffffffc020adda:	9b3e                	add	s6,s6,a5
ffffffffc020addc:	00005d17          	auipc	s10,0x5
ffffffffc020ade0:	94cd0d13          	addi	s10,s10,-1716 # ffffffffc020f728 <dev_node_ops+0x880>
ffffffffc020ade4:	e2dfc0ef          	jal	ra,ffffffffc0207c10 <inode_ref_inc>
ffffffffc020ade8:	00440c13          	addi	s8,s0,4
ffffffffc020adec:	e066                	sd	s9,0(sp)
ffffffffc020adee:	8552                	mv	a0,s4
ffffffffc020adf0:	915f90ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc020adf4:	0854                	addi	a3,sp,20
ffffffffc020adf6:	866a                	mv	a2,s10
ffffffffc020adf8:	85d6                	mv	a1,s5
ffffffffc020adfa:	8526                	mv	a0,s1
ffffffffc020adfc:	8f3ff0ef          	jal	ra,ffffffffc020a6ee <sfs_dirent_search_nolock.constprop.0>
ffffffffc020ae00:	8daa                	mv	s11,a0
ffffffffc020ae02:	8552                	mv	a0,s4
ffffffffc020ae04:	8fdf90ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc020ae08:	020d8863          	beqz	s11,ffffffffc020ae38 <sfs_namefile+0xc6>
ffffffffc020ae0c:	854e                	mv	a0,s3
ffffffffc020ae0e:	ed1fc0ef          	jal	ra,ffffffffc0207cde <inode_ref_dec>
ffffffffc020ae12:	8522                	mv	a0,s0
ffffffffc020ae14:	abaf70ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc020ae18:	60aa                	ld	ra,136(sp)
ffffffffc020ae1a:	640a                	ld	s0,128(sp)
ffffffffc020ae1c:	74e6                	ld	s1,120(sp)
ffffffffc020ae1e:	7946                	ld	s2,112(sp)
ffffffffc020ae20:	79a6                	ld	s3,104(sp)
ffffffffc020ae22:	7a06                	ld	s4,96(sp)
ffffffffc020ae24:	6ae6                	ld	s5,88(sp)
ffffffffc020ae26:	6b46                	ld	s6,80(sp)
ffffffffc020ae28:	6ba6                	ld	s7,72(sp)
ffffffffc020ae2a:	6c06                	ld	s8,64(sp)
ffffffffc020ae2c:	7ce2                	ld	s9,56(sp)
ffffffffc020ae2e:	7d42                	ld	s10,48(sp)
ffffffffc020ae30:	856e                	mv	a0,s11
ffffffffc020ae32:	7da2                	ld	s11,40(sp)
ffffffffc020ae34:	6149                	addi	sp,sp,144
ffffffffc020ae36:	8082                	ret
ffffffffc020ae38:	4652                	lw	a2,20(sp)
ffffffffc020ae3a:	082c                	addi	a1,sp,24
ffffffffc020ae3c:	8526                	mv	a0,s1
ffffffffc020ae3e:	bdfff0ef          	jal	ra,ffffffffc020aa1c <sfs_load_inode>
ffffffffc020ae42:	8daa                	mv	s11,a0
ffffffffc020ae44:	f561                	bnez	a0,ffffffffc020ae0c <sfs_namefile+0x9a>
ffffffffc020ae46:	854e                	mv	a0,s3
ffffffffc020ae48:	008aa903          	lw	s2,8(s5)
ffffffffc020ae4c:	e93fc0ef          	jal	ra,ffffffffc0207cde <inode_ref_dec>
ffffffffc020ae50:	6ce2                	ld	s9,24(sp)
ffffffffc020ae52:	0b3c8463          	beq	s9,s3,ffffffffc020aefa <sfs_namefile+0x188>
ffffffffc020ae56:	100c8463          	beqz	s9,ffffffffc020af5e <sfs_namefile+0x1ec>
ffffffffc020ae5a:	058ca703          	lw	a4,88(s9)
ffffffffc020ae5e:	6782                	ld	a5,0(sp)
ffffffffc020ae60:	0ef71f63          	bne	a4,a5,ffffffffc020af5e <sfs_namefile+0x1ec>
ffffffffc020ae64:	008ca703          	lw	a4,8(s9)
ffffffffc020ae68:	8ae6                	mv	s5,s9
ffffffffc020ae6a:	0d270a63          	beq	a4,s2,ffffffffc020af3e <sfs_namefile+0x1cc>
ffffffffc020ae6e:	000cb703          	ld	a4,0(s9)
ffffffffc020ae72:	4789                	li	a5,2
ffffffffc020ae74:	00475703          	lhu	a4,4(a4)
ffffffffc020ae78:	0cf71363          	bne	a4,a5,ffffffffc020af3e <sfs_namefile+0x1cc>
ffffffffc020ae7c:	020c8a13          	addi	s4,s9,32
ffffffffc020ae80:	8552                	mv	a0,s4
ffffffffc020ae82:	883f90ef          	jal	ra,ffffffffc0204704 <down>
ffffffffc020ae86:	000cb703          	ld	a4,0(s9)
ffffffffc020ae8a:	00872983          	lw	s3,8(a4)
ffffffffc020ae8e:	01304963          	bgtz	s3,ffffffffc020aea0 <sfs_namefile+0x12e>
ffffffffc020ae92:	a899                	j	ffffffffc020aee8 <sfs_namefile+0x176>
ffffffffc020ae94:	4018                	lw	a4,0(s0)
ffffffffc020ae96:	01270e63          	beq	a4,s2,ffffffffc020aeb2 <sfs_namefile+0x140>
ffffffffc020ae9a:	2d85                	addiw	s11,s11,1
ffffffffc020ae9c:	05b98663          	beq	s3,s11,ffffffffc020aee8 <sfs_namefile+0x176>
ffffffffc020aea0:	86a2                	mv	a3,s0
ffffffffc020aea2:	866e                	mv	a2,s11
ffffffffc020aea4:	85e6                	mv	a1,s9
ffffffffc020aea6:	8526                	mv	a0,s1
ffffffffc020aea8:	e48ff0ef          	jal	ra,ffffffffc020a4f0 <sfs_dirent_read_nolock>
ffffffffc020aeac:	872a                	mv	a4,a0
ffffffffc020aeae:	d17d                	beqz	a0,ffffffffc020ae94 <sfs_namefile+0x122>
ffffffffc020aeb0:	a82d                	j	ffffffffc020aeea <sfs_namefile+0x178>
ffffffffc020aeb2:	8552                	mv	a0,s4
ffffffffc020aeb4:	84df90ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc020aeb8:	8562                	mv	a0,s8
ffffffffc020aeba:	0ff000ef          	jal	ra,ffffffffc020b7b8 <strlen>
ffffffffc020aebe:	00150793          	addi	a5,a0,1
ffffffffc020aec2:	862a                	mv	a2,a0
ffffffffc020aec4:	06fbe863          	bltu	s7,a5,ffffffffc020af34 <sfs_namefile+0x1c2>
ffffffffc020aec8:	fff64913          	not	s2,a2
ffffffffc020aecc:	995a                	add	s2,s2,s6
ffffffffc020aece:	85e2                	mv	a1,s8
ffffffffc020aed0:	854a                	mv	a0,s2
ffffffffc020aed2:	40fb8bb3          	sub	s7,s7,a5
ffffffffc020aed6:	1d7000ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc020aeda:	02f00793          	li	a5,47
ffffffffc020aede:	fefb0fa3          	sb	a5,-1(s6)
ffffffffc020aee2:	89e6                	mv	s3,s9
ffffffffc020aee4:	8b4a                	mv	s6,s2
ffffffffc020aee6:	b721                	j	ffffffffc020adee <sfs_namefile+0x7c>
ffffffffc020aee8:	5741                	li	a4,-16
ffffffffc020aeea:	8552                	mv	a0,s4
ffffffffc020aeec:	e03a                	sd	a4,0(sp)
ffffffffc020aeee:	813f90ef          	jal	ra,ffffffffc0204700 <up>
ffffffffc020aef2:	6702                	ld	a4,0(sp)
ffffffffc020aef4:	89e6                	mv	s3,s9
ffffffffc020aef6:	8dba                	mv	s11,a4
ffffffffc020aef8:	bf11                	j	ffffffffc020ae0c <sfs_namefile+0x9a>
ffffffffc020aefa:	854e                	mv	a0,s3
ffffffffc020aefc:	de3fc0ef          	jal	ra,ffffffffc0207cde <inode_ref_dec>
ffffffffc020af00:	64a2                	ld	s1,8(sp)
ffffffffc020af02:	85da                	mv	a1,s6
ffffffffc020af04:	6c98                	ld	a4,24(s1)
ffffffffc020af06:	6088                	ld	a0,0(s1)
ffffffffc020af08:	1779                	addi	a4,a4,-2
ffffffffc020af0a:	41770bb3          	sub	s7,a4,s7
ffffffffc020af0e:	865e                	mv	a2,s7
ffffffffc020af10:	0505                	addi	a0,a0,1
ffffffffc020af12:	15b000ef          	jal	ra,ffffffffc020b86c <memmove>
ffffffffc020af16:	02f00713          	li	a4,47
ffffffffc020af1a:	fee50fa3          	sb	a4,-1(a0)
ffffffffc020af1e:	955e                	add	a0,a0,s7
ffffffffc020af20:	00050023          	sb	zero,0(a0)
ffffffffc020af24:	85de                	mv	a1,s7
ffffffffc020af26:	8526                	mv	a0,s1
ffffffffc020af28:	e64fa0ef          	jal	ra,ffffffffc020558c <iobuf_skip>
ffffffffc020af2c:	8522                	mv	a0,s0
ffffffffc020af2e:	9a0f70ef          	jal	ra,ffffffffc02020ce <kfree>
ffffffffc020af32:	b5dd                	j	ffffffffc020ae18 <sfs_namefile+0xa6>
ffffffffc020af34:	89e6                	mv	s3,s9
ffffffffc020af36:	5df1                	li	s11,-4
ffffffffc020af38:	bdd1                	j	ffffffffc020ae0c <sfs_namefile+0x9a>
ffffffffc020af3a:	5df1                	li	s11,-4
ffffffffc020af3c:	bdf1                	j	ffffffffc020ae18 <sfs_namefile+0xa6>
ffffffffc020af3e:	00004697          	auipc	a3,0x4
ffffffffc020af42:	7f268693          	addi	a3,a3,2034 # ffffffffc020f730 <dev_node_ops+0x888>
ffffffffc020af46:	00001617          	auipc	a2,0x1
ffffffffc020af4a:	dfa60613          	addi	a2,a2,-518 # ffffffffc020bd40 <commands+0x210>
ffffffffc020af4e:	31200593          	li	a1,786
ffffffffc020af52:	00004517          	auipc	a0,0x4
ffffffffc020af56:	51650513          	addi	a0,a0,1302 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020af5a:	d44f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020af5e:	00004697          	auipc	a3,0x4
ffffffffc020af62:	4d268693          	addi	a3,a3,1234 # ffffffffc020f430 <dev_node_ops+0x588>
ffffffffc020af66:	00001617          	auipc	a2,0x1
ffffffffc020af6a:	dda60613          	addi	a2,a2,-550 # ffffffffc020bd40 <commands+0x210>
ffffffffc020af6e:	31100593          	li	a1,785
ffffffffc020af72:	00004517          	auipc	a0,0x4
ffffffffc020af76:	4f650513          	addi	a0,a0,1270 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020af7a:	d24f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020af7e:	00004697          	auipc	a3,0x4
ffffffffc020af82:	4b268693          	addi	a3,a3,1202 # ffffffffc020f430 <dev_node_ops+0x588>
ffffffffc020af86:	00001617          	auipc	a2,0x1
ffffffffc020af8a:	dba60613          	addi	a2,a2,-582 # ffffffffc020bd40 <commands+0x210>
ffffffffc020af8e:	2fe00593          	li	a1,766
ffffffffc020af92:	00004517          	auipc	a0,0x4
ffffffffc020af96:	4d650513          	addi	a0,a0,1238 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020af9a:	d04f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020af9e:	00004697          	auipc	a3,0x4
ffffffffc020afa2:	2ea68693          	addi	a3,a3,746 # ffffffffc020f288 <dev_node_ops+0x3e0>
ffffffffc020afa6:	00001617          	auipc	a2,0x1
ffffffffc020afaa:	d9a60613          	addi	a2,a2,-614 # ffffffffc020bd40 <commands+0x210>
ffffffffc020afae:	2fd00593          	li	a1,765
ffffffffc020afb2:	00004517          	auipc	a0,0x4
ffffffffc020afb6:	4b650513          	addi	a0,a0,1206 # ffffffffc020f468 <dev_node_ops+0x5c0>
ffffffffc020afba:	ce4f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020afbe <sfs_rwblock_nolock>:
ffffffffc020afbe:	7139                	addi	sp,sp,-64
ffffffffc020afc0:	f822                	sd	s0,48(sp)
ffffffffc020afc2:	f426                	sd	s1,40(sp)
ffffffffc020afc4:	fc06                	sd	ra,56(sp)
ffffffffc020afc6:	842a                	mv	s0,a0
ffffffffc020afc8:	84b6                	mv	s1,a3
ffffffffc020afca:	e211                	bnez	a2,ffffffffc020afce <sfs_rwblock_nolock+0x10>
ffffffffc020afcc:	e715                	bnez	a4,ffffffffc020aff8 <sfs_rwblock_nolock+0x3a>
ffffffffc020afce:	405c                	lw	a5,4(s0)
ffffffffc020afd0:	02f67463          	bgeu	a2,a5,ffffffffc020aff8 <sfs_rwblock_nolock+0x3a>
ffffffffc020afd4:	00c6169b          	slliw	a3,a2,0xc
ffffffffc020afd8:	1682                	slli	a3,a3,0x20
ffffffffc020afda:	6605                	lui	a2,0x1
ffffffffc020afdc:	9281                	srli	a3,a3,0x20
ffffffffc020afde:	850a                	mv	a0,sp
ffffffffc020afe0:	d36fa0ef          	jal	ra,ffffffffc0205516 <iobuf_init>
ffffffffc020afe4:	85aa                	mv	a1,a0
ffffffffc020afe6:	7808                	ld	a0,48(s0)
ffffffffc020afe8:	8626                	mv	a2,s1
ffffffffc020afea:	7118                	ld	a4,32(a0)
ffffffffc020afec:	9702                	jalr	a4
ffffffffc020afee:	70e2                	ld	ra,56(sp)
ffffffffc020aff0:	7442                	ld	s0,48(sp)
ffffffffc020aff2:	74a2                	ld	s1,40(sp)
ffffffffc020aff4:	6121                	addi	sp,sp,64
ffffffffc020aff6:	8082                	ret
ffffffffc020aff8:	00005697          	auipc	a3,0x5
ffffffffc020affc:	87068693          	addi	a3,a3,-1936 # ffffffffc020f868 <sfs_node_fileops+0x80>
ffffffffc020b000:	00001617          	auipc	a2,0x1
ffffffffc020b004:	d4060613          	addi	a2,a2,-704 # ffffffffc020bd40 <commands+0x210>
ffffffffc020b008:	45d5                	li	a1,21
ffffffffc020b00a:	00005517          	auipc	a0,0x5
ffffffffc020b00e:	89650513          	addi	a0,a0,-1898 # ffffffffc020f8a0 <sfs_node_fileops+0xb8>
ffffffffc020b012:	c8cf50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020b016 <sfs_rblock>:
ffffffffc020b016:	7139                	addi	sp,sp,-64
ffffffffc020b018:	ec4e                	sd	s3,24(sp)
ffffffffc020b01a:	89b6                	mv	s3,a3
ffffffffc020b01c:	f822                	sd	s0,48(sp)
ffffffffc020b01e:	f04a                	sd	s2,32(sp)
ffffffffc020b020:	e852                	sd	s4,16(sp)
ffffffffc020b022:	fc06                	sd	ra,56(sp)
ffffffffc020b024:	f426                	sd	s1,40(sp)
ffffffffc020b026:	e456                	sd	s5,8(sp)
ffffffffc020b028:	8a2a                	mv	s4,a0
ffffffffc020b02a:	892e                	mv	s2,a1
ffffffffc020b02c:	8432                	mv	s0,a2
ffffffffc020b02e:	2e0000ef          	jal	ra,ffffffffc020b30e <lock_sfs_io>
ffffffffc020b032:	04098063          	beqz	s3,ffffffffc020b072 <sfs_rblock+0x5c>
ffffffffc020b036:	013409bb          	addw	s3,s0,s3
ffffffffc020b03a:	6a85                	lui	s5,0x1
ffffffffc020b03c:	a021                	j	ffffffffc020b044 <sfs_rblock+0x2e>
ffffffffc020b03e:	9956                	add	s2,s2,s5
ffffffffc020b040:	02898963          	beq	s3,s0,ffffffffc020b072 <sfs_rblock+0x5c>
ffffffffc020b044:	8622                	mv	a2,s0
ffffffffc020b046:	85ca                	mv	a1,s2
ffffffffc020b048:	4705                	li	a4,1
ffffffffc020b04a:	4681                	li	a3,0
ffffffffc020b04c:	8552                	mv	a0,s4
ffffffffc020b04e:	f71ff0ef          	jal	ra,ffffffffc020afbe <sfs_rwblock_nolock>
ffffffffc020b052:	84aa                	mv	s1,a0
ffffffffc020b054:	2405                	addiw	s0,s0,1
ffffffffc020b056:	d565                	beqz	a0,ffffffffc020b03e <sfs_rblock+0x28>
ffffffffc020b058:	8552                	mv	a0,s4
ffffffffc020b05a:	2c4000ef          	jal	ra,ffffffffc020b31e <unlock_sfs_io>
ffffffffc020b05e:	70e2                	ld	ra,56(sp)
ffffffffc020b060:	7442                	ld	s0,48(sp)
ffffffffc020b062:	7902                	ld	s2,32(sp)
ffffffffc020b064:	69e2                	ld	s3,24(sp)
ffffffffc020b066:	6a42                	ld	s4,16(sp)
ffffffffc020b068:	6aa2                	ld	s5,8(sp)
ffffffffc020b06a:	8526                	mv	a0,s1
ffffffffc020b06c:	74a2                	ld	s1,40(sp)
ffffffffc020b06e:	6121                	addi	sp,sp,64
ffffffffc020b070:	8082                	ret
ffffffffc020b072:	4481                	li	s1,0
ffffffffc020b074:	b7d5                	j	ffffffffc020b058 <sfs_rblock+0x42>

ffffffffc020b076 <sfs_wblock>:
ffffffffc020b076:	7139                	addi	sp,sp,-64
ffffffffc020b078:	ec4e                	sd	s3,24(sp)
ffffffffc020b07a:	89b6                	mv	s3,a3
ffffffffc020b07c:	f822                	sd	s0,48(sp)
ffffffffc020b07e:	f04a                	sd	s2,32(sp)
ffffffffc020b080:	e852                	sd	s4,16(sp)
ffffffffc020b082:	fc06                	sd	ra,56(sp)
ffffffffc020b084:	f426                	sd	s1,40(sp)
ffffffffc020b086:	e456                	sd	s5,8(sp)
ffffffffc020b088:	8a2a                	mv	s4,a0
ffffffffc020b08a:	892e                	mv	s2,a1
ffffffffc020b08c:	8432                	mv	s0,a2
ffffffffc020b08e:	280000ef          	jal	ra,ffffffffc020b30e <lock_sfs_io>
ffffffffc020b092:	04098063          	beqz	s3,ffffffffc020b0d2 <sfs_wblock+0x5c>
ffffffffc020b096:	013409bb          	addw	s3,s0,s3
ffffffffc020b09a:	6a85                	lui	s5,0x1
ffffffffc020b09c:	a021                	j	ffffffffc020b0a4 <sfs_wblock+0x2e>
ffffffffc020b09e:	9956                	add	s2,s2,s5
ffffffffc020b0a0:	02898963          	beq	s3,s0,ffffffffc020b0d2 <sfs_wblock+0x5c>
ffffffffc020b0a4:	8622                	mv	a2,s0
ffffffffc020b0a6:	85ca                	mv	a1,s2
ffffffffc020b0a8:	4705                	li	a4,1
ffffffffc020b0aa:	4685                	li	a3,1
ffffffffc020b0ac:	8552                	mv	a0,s4
ffffffffc020b0ae:	f11ff0ef          	jal	ra,ffffffffc020afbe <sfs_rwblock_nolock>
ffffffffc020b0b2:	84aa                	mv	s1,a0
ffffffffc020b0b4:	2405                	addiw	s0,s0,1
ffffffffc020b0b6:	d565                	beqz	a0,ffffffffc020b09e <sfs_wblock+0x28>
ffffffffc020b0b8:	8552                	mv	a0,s4
ffffffffc020b0ba:	264000ef          	jal	ra,ffffffffc020b31e <unlock_sfs_io>
ffffffffc020b0be:	70e2                	ld	ra,56(sp)
ffffffffc020b0c0:	7442                	ld	s0,48(sp)
ffffffffc020b0c2:	7902                	ld	s2,32(sp)
ffffffffc020b0c4:	69e2                	ld	s3,24(sp)
ffffffffc020b0c6:	6a42                	ld	s4,16(sp)
ffffffffc020b0c8:	6aa2                	ld	s5,8(sp)
ffffffffc020b0ca:	8526                	mv	a0,s1
ffffffffc020b0cc:	74a2                	ld	s1,40(sp)
ffffffffc020b0ce:	6121                	addi	sp,sp,64
ffffffffc020b0d0:	8082                	ret
ffffffffc020b0d2:	4481                	li	s1,0
ffffffffc020b0d4:	b7d5                	j	ffffffffc020b0b8 <sfs_wblock+0x42>

ffffffffc020b0d6 <sfs_rbuf>:
ffffffffc020b0d6:	7179                	addi	sp,sp,-48
ffffffffc020b0d8:	f406                	sd	ra,40(sp)
ffffffffc020b0da:	f022                	sd	s0,32(sp)
ffffffffc020b0dc:	ec26                	sd	s1,24(sp)
ffffffffc020b0de:	e84a                	sd	s2,16(sp)
ffffffffc020b0e0:	e44e                	sd	s3,8(sp)
ffffffffc020b0e2:	e052                	sd	s4,0(sp)
ffffffffc020b0e4:	6785                	lui	a5,0x1
ffffffffc020b0e6:	04f77863          	bgeu	a4,a5,ffffffffc020b136 <sfs_rbuf+0x60>
ffffffffc020b0ea:	84ba                	mv	s1,a4
ffffffffc020b0ec:	9732                	add	a4,a4,a2
ffffffffc020b0ee:	89b2                	mv	s3,a2
ffffffffc020b0f0:	04e7e363          	bltu	a5,a4,ffffffffc020b136 <sfs_rbuf+0x60>
ffffffffc020b0f4:	8936                	mv	s2,a3
ffffffffc020b0f6:	842a                	mv	s0,a0
ffffffffc020b0f8:	8a2e                	mv	s4,a1
ffffffffc020b0fa:	214000ef          	jal	ra,ffffffffc020b30e <lock_sfs_io>
ffffffffc020b0fe:	642c                	ld	a1,72(s0)
ffffffffc020b100:	864a                	mv	a2,s2
ffffffffc020b102:	4705                	li	a4,1
ffffffffc020b104:	4681                	li	a3,0
ffffffffc020b106:	8522                	mv	a0,s0
ffffffffc020b108:	eb7ff0ef          	jal	ra,ffffffffc020afbe <sfs_rwblock_nolock>
ffffffffc020b10c:	892a                	mv	s2,a0
ffffffffc020b10e:	cd09                	beqz	a0,ffffffffc020b128 <sfs_rbuf+0x52>
ffffffffc020b110:	8522                	mv	a0,s0
ffffffffc020b112:	20c000ef          	jal	ra,ffffffffc020b31e <unlock_sfs_io>
ffffffffc020b116:	70a2                	ld	ra,40(sp)
ffffffffc020b118:	7402                	ld	s0,32(sp)
ffffffffc020b11a:	64e2                	ld	s1,24(sp)
ffffffffc020b11c:	69a2                	ld	s3,8(sp)
ffffffffc020b11e:	6a02                	ld	s4,0(sp)
ffffffffc020b120:	854a                	mv	a0,s2
ffffffffc020b122:	6942                	ld	s2,16(sp)
ffffffffc020b124:	6145                	addi	sp,sp,48
ffffffffc020b126:	8082                	ret
ffffffffc020b128:	642c                	ld	a1,72(s0)
ffffffffc020b12a:	864e                	mv	a2,s3
ffffffffc020b12c:	8552                	mv	a0,s4
ffffffffc020b12e:	95a6                	add	a1,a1,s1
ffffffffc020b130:	77c000ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc020b134:	bff1                	j	ffffffffc020b110 <sfs_rbuf+0x3a>
ffffffffc020b136:	00004697          	auipc	a3,0x4
ffffffffc020b13a:	78268693          	addi	a3,a3,1922 # ffffffffc020f8b8 <sfs_node_fileops+0xd0>
ffffffffc020b13e:	00001617          	auipc	a2,0x1
ffffffffc020b142:	c0260613          	addi	a2,a2,-1022 # ffffffffc020bd40 <commands+0x210>
ffffffffc020b146:	05500593          	li	a1,85
ffffffffc020b14a:	00004517          	auipc	a0,0x4
ffffffffc020b14e:	75650513          	addi	a0,a0,1878 # ffffffffc020f8a0 <sfs_node_fileops+0xb8>
ffffffffc020b152:	b4cf50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020b156 <sfs_wbuf>:
ffffffffc020b156:	7139                	addi	sp,sp,-64
ffffffffc020b158:	fc06                	sd	ra,56(sp)
ffffffffc020b15a:	f822                	sd	s0,48(sp)
ffffffffc020b15c:	f426                	sd	s1,40(sp)
ffffffffc020b15e:	f04a                	sd	s2,32(sp)
ffffffffc020b160:	ec4e                	sd	s3,24(sp)
ffffffffc020b162:	e852                	sd	s4,16(sp)
ffffffffc020b164:	e456                	sd	s5,8(sp)
ffffffffc020b166:	6785                	lui	a5,0x1
ffffffffc020b168:	06f77163          	bgeu	a4,a5,ffffffffc020b1ca <sfs_wbuf+0x74>
ffffffffc020b16c:	893a                	mv	s2,a4
ffffffffc020b16e:	9732                	add	a4,a4,a2
ffffffffc020b170:	8a32                	mv	s4,a2
ffffffffc020b172:	04e7ec63          	bltu	a5,a4,ffffffffc020b1ca <sfs_wbuf+0x74>
ffffffffc020b176:	842a                	mv	s0,a0
ffffffffc020b178:	89b6                	mv	s3,a3
ffffffffc020b17a:	8aae                	mv	s5,a1
ffffffffc020b17c:	192000ef          	jal	ra,ffffffffc020b30e <lock_sfs_io>
ffffffffc020b180:	642c                	ld	a1,72(s0)
ffffffffc020b182:	4705                	li	a4,1
ffffffffc020b184:	4681                	li	a3,0
ffffffffc020b186:	864e                	mv	a2,s3
ffffffffc020b188:	8522                	mv	a0,s0
ffffffffc020b18a:	e35ff0ef          	jal	ra,ffffffffc020afbe <sfs_rwblock_nolock>
ffffffffc020b18e:	84aa                	mv	s1,a0
ffffffffc020b190:	cd11                	beqz	a0,ffffffffc020b1ac <sfs_wbuf+0x56>
ffffffffc020b192:	8522                	mv	a0,s0
ffffffffc020b194:	18a000ef          	jal	ra,ffffffffc020b31e <unlock_sfs_io>
ffffffffc020b198:	70e2                	ld	ra,56(sp)
ffffffffc020b19a:	7442                	ld	s0,48(sp)
ffffffffc020b19c:	7902                	ld	s2,32(sp)
ffffffffc020b19e:	69e2                	ld	s3,24(sp)
ffffffffc020b1a0:	6a42                	ld	s4,16(sp)
ffffffffc020b1a2:	6aa2                	ld	s5,8(sp)
ffffffffc020b1a4:	8526                	mv	a0,s1
ffffffffc020b1a6:	74a2                	ld	s1,40(sp)
ffffffffc020b1a8:	6121                	addi	sp,sp,64
ffffffffc020b1aa:	8082                	ret
ffffffffc020b1ac:	6428                	ld	a0,72(s0)
ffffffffc020b1ae:	8652                	mv	a2,s4
ffffffffc020b1b0:	85d6                	mv	a1,s5
ffffffffc020b1b2:	954a                	add	a0,a0,s2
ffffffffc020b1b4:	6f8000ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc020b1b8:	642c                	ld	a1,72(s0)
ffffffffc020b1ba:	4705                	li	a4,1
ffffffffc020b1bc:	4685                	li	a3,1
ffffffffc020b1be:	864e                	mv	a2,s3
ffffffffc020b1c0:	8522                	mv	a0,s0
ffffffffc020b1c2:	dfdff0ef          	jal	ra,ffffffffc020afbe <sfs_rwblock_nolock>
ffffffffc020b1c6:	84aa                	mv	s1,a0
ffffffffc020b1c8:	b7e9                	j	ffffffffc020b192 <sfs_wbuf+0x3c>
ffffffffc020b1ca:	00004697          	auipc	a3,0x4
ffffffffc020b1ce:	6ee68693          	addi	a3,a3,1774 # ffffffffc020f8b8 <sfs_node_fileops+0xd0>
ffffffffc020b1d2:	00001617          	auipc	a2,0x1
ffffffffc020b1d6:	b6e60613          	addi	a2,a2,-1170 # ffffffffc020bd40 <commands+0x210>
ffffffffc020b1da:	06b00593          	li	a1,107
ffffffffc020b1de:	00004517          	auipc	a0,0x4
ffffffffc020b1e2:	6c250513          	addi	a0,a0,1730 # ffffffffc020f8a0 <sfs_node_fileops+0xb8>
ffffffffc020b1e6:	ab8f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020b1ea <sfs_sync_super>:
ffffffffc020b1ea:	1101                	addi	sp,sp,-32
ffffffffc020b1ec:	ec06                	sd	ra,24(sp)
ffffffffc020b1ee:	e822                	sd	s0,16(sp)
ffffffffc020b1f0:	e426                	sd	s1,8(sp)
ffffffffc020b1f2:	842a                	mv	s0,a0
ffffffffc020b1f4:	11a000ef          	jal	ra,ffffffffc020b30e <lock_sfs_io>
ffffffffc020b1f8:	6428                	ld	a0,72(s0)
ffffffffc020b1fa:	6605                	lui	a2,0x1
ffffffffc020b1fc:	4581                	li	a1,0
ffffffffc020b1fe:	65c000ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc020b202:	6428                	ld	a0,72(s0)
ffffffffc020b204:	85a2                	mv	a1,s0
ffffffffc020b206:	02c00613          	li	a2,44
ffffffffc020b20a:	6a2000ef          	jal	ra,ffffffffc020b8ac <memcpy>
ffffffffc020b20e:	642c                	ld	a1,72(s0)
ffffffffc020b210:	4701                	li	a4,0
ffffffffc020b212:	4685                	li	a3,1
ffffffffc020b214:	4601                	li	a2,0
ffffffffc020b216:	8522                	mv	a0,s0
ffffffffc020b218:	da7ff0ef          	jal	ra,ffffffffc020afbe <sfs_rwblock_nolock>
ffffffffc020b21c:	84aa                	mv	s1,a0
ffffffffc020b21e:	8522                	mv	a0,s0
ffffffffc020b220:	0fe000ef          	jal	ra,ffffffffc020b31e <unlock_sfs_io>
ffffffffc020b224:	60e2                	ld	ra,24(sp)
ffffffffc020b226:	6442                	ld	s0,16(sp)
ffffffffc020b228:	8526                	mv	a0,s1
ffffffffc020b22a:	64a2                	ld	s1,8(sp)
ffffffffc020b22c:	6105                	addi	sp,sp,32
ffffffffc020b22e:	8082                	ret

ffffffffc020b230 <sfs_sync_freemap>:
ffffffffc020b230:	7139                	addi	sp,sp,-64
ffffffffc020b232:	ec4e                	sd	s3,24(sp)
ffffffffc020b234:	e852                	sd	s4,16(sp)
ffffffffc020b236:	00456983          	lwu	s3,4(a0)
ffffffffc020b23a:	8a2a                	mv	s4,a0
ffffffffc020b23c:	7d08                	ld	a0,56(a0)
ffffffffc020b23e:	67a1                	lui	a5,0x8
ffffffffc020b240:	17fd                	addi	a5,a5,-1
ffffffffc020b242:	4581                	li	a1,0
ffffffffc020b244:	f822                	sd	s0,48(sp)
ffffffffc020b246:	fc06                	sd	ra,56(sp)
ffffffffc020b248:	f426                	sd	s1,40(sp)
ffffffffc020b24a:	f04a                	sd	s2,32(sp)
ffffffffc020b24c:	e456                	sd	s5,8(sp)
ffffffffc020b24e:	99be                	add	s3,s3,a5
ffffffffc020b250:	a1cfe0ef          	jal	ra,ffffffffc020946c <bitmap_getdata>
ffffffffc020b254:	00f9d993          	srli	s3,s3,0xf
ffffffffc020b258:	842a                	mv	s0,a0
ffffffffc020b25a:	8552                	mv	a0,s4
ffffffffc020b25c:	0b2000ef          	jal	ra,ffffffffc020b30e <lock_sfs_io>
ffffffffc020b260:	04098163          	beqz	s3,ffffffffc020b2a2 <sfs_sync_freemap+0x72>
ffffffffc020b264:	09b2                	slli	s3,s3,0xc
ffffffffc020b266:	99a2                	add	s3,s3,s0
ffffffffc020b268:	4909                	li	s2,2
ffffffffc020b26a:	6a85                	lui	s5,0x1
ffffffffc020b26c:	a021                	j	ffffffffc020b274 <sfs_sync_freemap+0x44>
ffffffffc020b26e:	2905                	addiw	s2,s2,1
ffffffffc020b270:	02898963          	beq	s3,s0,ffffffffc020b2a2 <sfs_sync_freemap+0x72>
ffffffffc020b274:	85a2                	mv	a1,s0
ffffffffc020b276:	864a                	mv	a2,s2
ffffffffc020b278:	4705                	li	a4,1
ffffffffc020b27a:	4685                	li	a3,1
ffffffffc020b27c:	8552                	mv	a0,s4
ffffffffc020b27e:	d41ff0ef          	jal	ra,ffffffffc020afbe <sfs_rwblock_nolock>
ffffffffc020b282:	84aa                	mv	s1,a0
ffffffffc020b284:	9456                	add	s0,s0,s5
ffffffffc020b286:	d565                	beqz	a0,ffffffffc020b26e <sfs_sync_freemap+0x3e>
ffffffffc020b288:	8552                	mv	a0,s4
ffffffffc020b28a:	094000ef          	jal	ra,ffffffffc020b31e <unlock_sfs_io>
ffffffffc020b28e:	70e2                	ld	ra,56(sp)
ffffffffc020b290:	7442                	ld	s0,48(sp)
ffffffffc020b292:	7902                	ld	s2,32(sp)
ffffffffc020b294:	69e2                	ld	s3,24(sp)
ffffffffc020b296:	6a42                	ld	s4,16(sp)
ffffffffc020b298:	6aa2                	ld	s5,8(sp)
ffffffffc020b29a:	8526                	mv	a0,s1
ffffffffc020b29c:	74a2                	ld	s1,40(sp)
ffffffffc020b29e:	6121                	addi	sp,sp,64
ffffffffc020b2a0:	8082                	ret
ffffffffc020b2a2:	4481                	li	s1,0
ffffffffc020b2a4:	b7d5                	j	ffffffffc020b288 <sfs_sync_freemap+0x58>

ffffffffc020b2a6 <sfs_clear_block>:
ffffffffc020b2a6:	7179                	addi	sp,sp,-48
ffffffffc020b2a8:	f022                	sd	s0,32(sp)
ffffffffc020b2aa:	e84a                	sd	s2,16(sp)
ffffffffc020b2ac:	e44e                	sd	s3,8(sp)
ffffffffc020b2ae:	f406                	sd	ra,40(sp)
ffffffffc020b2b0:	89b2                	mv	s3,a2
ffffffffc020b2b2:	ec26                	sd	s1,24(sp)
ffffffffc020b2b4:	892a                	mv	s2,a0
ffffffffc020b2b6:	842e                	mv	s0,a1
ffffffffc020b2b8:	056000ef          	jal	ra,ffffffffc020b30e <lock_sfs_io>
ffffffffc020b2bc:	04893503          	ld	a0,72(s2)
ffffffffc020b2c0:	6605                	lui	a2,0x1
ffffffffc020b2c2:	4581                	li	a1,0
ffffffffc020b2c4:	596000ef          	jal	ra,ffffffffc020b85a <memset>
ffffffffc020b2c8:	02098d63          	beqz	s3,ffffffffc020b302 <sfs_clear_block+0x5c>
ffffffffc020b2cc:	013409bb          	addw	s3,s0,s3
ffffffffc020b2d0:	a019                	j	ffffffffc020b2d6 <sfs_clear_block+0x30>
ffffffffc020b2d2:	02898863          	beq	s3,s0,ffffffffc020b302 <sfs_clear_block+0x5c>
ffffffffc020b2d6:	04893583          	ld	a1,72(s2)
ffffffffc020b2da:	8622                	mv	a2,s0
ffffffffc020b2dc:	4705                	li	a4,1
ffffffffc020b2de:	4685                	li	a3,1
ffffffffc020b2e0:	854a                	mv	a0,s2
ffffffffc020b2e2:	cddff0ef          	jal	ra,ffffffffc020afbe <sfs_rwblock_nolock>
ffffffffc020b2e6:	84aa                	mv	s1,a0
ffffffffc020b2e8:	2405                	addiw	s0,s0,1
ffffffffc020b2ea:	d565                	beqz	a0,ffffffffc020b2d2 <sfs_clear_block+0x2c>
ffffffffc020b2ec:	854a                	mv	a0,s2
ffffffffc020b2ee:	030000ef          	jal	ra,ffffffffc020b31e <unlock_sfs_io>
ffffffffc020b2f2:	70a2                	ld	ra,40(sp)
ffffffffc020b2f4:	7402                	ld	s0,32(sp)
ffffffffc020b2f6:	6942                	ld	s2,16(sp)
ffffffffc020b2f8:	69a2                	ld	s3,8(sp)
ffffffffc020b2fa:	8526                	mv	a0,s1
ffffffffc020b2fc:	64e2                	ld	s1,24(sp)
ffffffffc020b2fe:	6145                	addi	sp,sp,48
ffffffffc020b300:	8082                	ret
ffffffffc020b302:	4481                	li	s1,0
ffffffffc020b304:	b7e5                	j	ffffffffc020b2ec <sfs_clear_block+0x46>

ffffffffc020b306 <lock_sfs_fs>:
ffffffffc020b306:	05050513          	addi	a0,a0,80
ffffffffc020b30a:	bfaf906f          	j	ffffffffc0204704 <down>

ffffffffc020b30e <lock_sfs_io>:
ffffffffc020b30e:	06850513          	addi	a0,a0,104
ffffffffc020b312:	bf2f906f          	j	ffffffffc0204704 <down>

ffffffffc020b316 <unlock_sfs_fs>:
ffffffffc020b316:	05050513          	addi	a0,a0,80
ffffffffc020b31a:	be6f906f          	j	ffffffffc0204700 <up>

ffffffffc020b31e <unlock_sfs_io>:
ffffffffc020b31e:	06850513          	addi	a0,a0,104
ffffffffc020b322:	bdef906f          	j	ffffffffc0204700 <up>

ffffffffc020b326 <hash32>:
ffffffffc020b326:	9e3707b7          	lui	a5,0x9e370
ffffffffc020b32a:	2785                	addiw	a5,a5,1
ffffffffc020b32c:	02a7853b          	mulw	a0,a5,a0
ffffffffc020b330:	02000793          	li	a5,32
ffffffffc020b334:	9f8d                	subw	a5,a5,a1
ffffffffc020b336:	00f5553b          	srlw	a0,a0,a5
ffffffffc020b33a:	8082                	ret

ffffffffc020b33c <printnum>:
ffffffffc020b33c:	02071893          	slli	a7,a4,0x20
ffffffffc020b340:	7139                	addi	sp,sp,-64
ffffffffc020b342:	0208d893          	srli	a7,a7,0x20
ffffffffc020b346:	e456                	sd	s5,8(sp)
ffffffffc020b348:	0316fab3          	remu	s5,a3,a7
ffffffffc020b34c:	f822                	sd	s0,48(sp)
ffffffffc020b34e:	f426                	sd	s1,40(sp)
ffffffffc020b350:	f04a                	sd	s2,32(sp)
ffffffffc020b352:	ec4e                	sd	s3,24(sp)
ffffffffc020b354:	fc06                	sd	ra,56(sp)
ffffffffc020b356:	e852                	sd	s4,16(sp)
ffffffffc020b358:	84aa                	mv	s1,a0
ffffffffc020b35a:	89ae                	mv	s3,a1
ffffffffc020b35c:	8932                	mv	s2,a2
ffffffffc020b35e:	fff7841b          	addiw	s0,a5,-1
ffffffffc020b362:	2a81                	sext.w	s5,s5
ffffffffc020b364:	0516f163          	bgeu	a3,a7,ffffffffc020b3a6 <printnum+0x6a>
ffffffffc020b368:	8a42                	mv	s4,a6
ffffffffc020b36a:	00805863          	blez	s0,ffffffffc020b37a <printnum+0x3e>
ffffffffc020b36e:	347d                	addiw	s0,s0,-1
ffffffffc020b370:	864e                	mv	a2,s3
ffffffffc020b372:	85ca                	mv	a1,s2
ffffffffc020b374:	8552                	mv	a0,s4
ffffffffc020b376:	9482                	jalr	s1
ffffffffc020b378:	f87d                	bnez	s0,ffffffffc020b36e <printnum+0x32>
ffffffffc020b37a:	1a82                	slli	s5,s5,0x20
ffffffffc020b37c:	00004797          	auipc	a5,0x4
ffffffffc020b380:	58478793          	addi	a5,a5,1412 # ffffffffc020f900 <sfs_node_fileops+0x118>
ffffffffc020b384:	020ada93          	srli	s5,s5,0x20
ffffffffc020b388:	9abe                	add	s5,s5,a5
ffffffffc020b38a:	7442                	ld	s0,48(sp)
ffffffffc020b38c:	000ac503          	lbu	a0,0(s5) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc020b390:	70e2                	ld	ra,56(sp)
ffffffffc020b392:	6a42                	ld	s4,16(sp)
ffffffffc020b394:	6aa2                	ld	s5,8(sp)
ffffffffc020b396:	864e                	mv	a2,s3
ffffffffc020b398:	85ca                	mv	a1,s2
ffffffffc020b39a:	69e2                	ld	s3,24(sp)
ffffffffc020b39c:	7902                	ld	s2,32(sp)
ffffffffc020b39e:	87a6                	mv	a5,s1
ffffffffc020b3a0:	74a2                	ld	s1,40(sp)
ffffffffc020b3a2:	6121                	addi	sp,sp,64
ffffffffc020b3a4:	8782                	jr	a5
ffffffffc020b3a6:	0316d6b3          	divu	a3,a3,a7
ffffffffc020b3aa:	87a2                	mv	a5,s0
ffffffffc020b3ac:	f91ff0ef          	jal	ra,ffffffffc020b33c <printnum>
ffffffffc020b3b0:	b7e9                	j	ffffffffc020b37a <printnum+0x3e>

ffffffffc020b3b2 <sprintputch>:
ffffffffc020b3b2:	499c                	lw	a5,16(a1)
ffffffffc020b3b4:	6198                	ld	a4,0(a1)
ffffffffc020b3b6:	6594                	ld	a3,8(a1)
ffffffffc020b3b8:	2785                	addiw	a5,a5,1
ffffffffc020b3ba:	c99c                	sw	a5,16(a1)
ffffffffc020b3bc:	00d77763          	bgeu	a4,a3,ffffffffc020b3ca <sprintputch+0x18>
ffffffffc020b3c0:	00170793          	addi	a5,a4,1
ffffffffc020b3c4:	e19c                	sd	a5,0(a1)
ffffffffc020b3c6:	00a70023          	sb	a0,0(a4)
ffffffffc020b3ca:	8082                	ret

ffffffffc020b3cc <vprintfmt>:
ffffffffc020b3cc:	7119                	addi	sp,sp,-128
ffffffffc020b3ce:	f4a6                	sd	s1,104(sp)
ffffffffc020b3d0:	f0ca                	sd	s2,96(sp)
ffffffffc020b3d2:	ecce                	sd	s3,88(sp)
ffffffffc020b3d4:	e8d2                	sd	s4,80(sp)
ffffffffc020b3d6:	e4d6                	sd	s5,72(sp)
ffffffffc020b3d8:	e0da                	sd	s6,64(sp)
ffffffffc020b3da:	fc5e                	sd	s7,56(sp)
ffffffffc020b3dc:	ec6e                	sd	s11,24(sp)
ffffffffc020b3de:	fc86                	sd	ra,120(sp)
ffffffffc020b3e0:	f8a2                	sd	s0,112(sp)
ffffffffc020b3e2:	f862                	sd	s8,48(sp)
ffffffffc020b3e4:	f466                	sd	s9,40(sp)
ffffffffc020b3e6:	f06a                	sd	s10,32(sp)
ffffffffc020b3e8:	89aa                	mv	s3,a0
ffffffffc020b3ea:	892e                	mv	s2,a1
ffffffffc020b3ec:	84b2                	mv	s1,a2
ffffffffc020b3ee:	8db6                	mv	s11,a3
ffffffffc020b3f0:	8aba                	mv	s5,a4
ffffffffc020b3f2:	02500a13          	li	s4,37
ffffffffc020b3f6:	5bfd                	li	s7,-1
ffffffffc020b3f8:	00004b17          	auipc	s6,0x4
ffffffffc020b3fc:	534b0b13          	addi	s6,s6,1332 # ffffffffc020f92c <sfs_node_fileops+0x144>
ffffffffc020b400:	000dc503          	lbu	a0,0(s11) # 2000 <_binary_bin_swap_img_size-0x5d00>
ffffffffc020b404:	001d8413          	addi	s0,s11,1
ffffffffc020b408:	01450b63          	beq	a0,s4,ffffffffc020b41e <vprintfmt+0x52>
ffffffffc020b40c:	c129                	beqz	a0,ffffffffc020b44e <vprintfmt+0x82>
ffffffffc020b40e:	864a                	mv	a2,s2
ffffffffc020b410:	85a6                	mv	a1,s1
ffffffffc020b412:	0405                	addi	s0,s0,1
ffffffffc020b414:	9982                	jalr	s3
ffffffffc020b416:	fff44503          	lbu	a0,-1(s0)
ffffffffc020b41a:	ff4519e3          	bne	a0,s4,ffffffffc020b40c <vprintfmt+0x40>
ffffffffc020b41e:	00044583          	lbu	a1,0(s0)
ffffffffc020b422:	02000813          	li	a6,32
ffffffffc020b426:	4d01                	li	s10,0
ffffffffc020b428:	4301                	li	t1,0
ffffffffc020b42a:	5cfd                	li	s9,-1
ffffffffc020b42c:	5c7d                	li	s8,-1
ffffffffc020b42e:	05500513          	li	a0,85
ffffffffc020b432:	48a5                	li	a7,9
ffffffffc020b434:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020b438:	0ff67613          	zext.b	a2,a2
ffffffffc020b43c:	00140d93          	addi	s11,s0,1
ffffffffc020b440:	04c56263          	bltu	a0,a2,ffffffffc020b484 <vprintfmt+0xb8>
ffffffffc020b444:	060a                	slli	a2,a2,0x2
ffffffffc020b446:	965a                	add	a2,a2,s6
ffffffffc020b448:	4214                	lw	a3,0(a2)
ffffffffc020b44a:	96da                	add	a3,a3,s6
ffffffffc020b44c:	8682                	jr	a3
ffffffffc020b44e:	70e6                	ld	ra,120(sp)
ffffffffc020b450:	7446                	ld	s0,112(sp)
ffffffffc020b452:	74a6                	ld	s1,104(sp)
ffffffffc020b454:	7906                	ld	s2,96(sp)
ffffffffc020b456:	69e6                	ld	s3,88(sp)
ffffffffc020b458:	6a46                	ld	s4,80(sp)
ffffffffc020b45a:	6aa6                	ld	s5,72(sp)
ffffffffc020b45c:	6b06                	ld	s6,64(sp)
ffffffffc020b45e:	7be2                	ld	s7,56(sp)
ffffffffc020b460:	7c42                	ld	s8,48(sp)
ffffffffc020b462:	7ca2                	ld	s9,40(sp)
ffffffffc020b464:	7d02                	ld	s10,32(sp)
ffffffffc020b466:	6de2                	ld	s11,24(sp)
ffffffffc020b468:	6109                	addi	sp,sp,128
ffffffffc020b46a:	8082                	ret
ffffffffc020b46c:	882e                	mv	a6,a1
ffffffffc020b46e:	00144583          	lbu	a1,1(s0)
ffffffffc020b472:	846e                	mv	s0,s11
ffffffffc020b474:	00140d93          	addi	s11,s0,1
ffffffffc020b478:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020b47c:	0ff67613          	zext.b	a2,a2
ffffffffc020b480:	fcc572e3          	bgeu	a0,a2,ffffffffc020b444 <vprintfmt+0x78>
ffffffffc020b484:	864a                	mv	a2,s2
ffffffffc020b486:	85a6                	mv	a1,s1
ffffffffc020b488:	02500513          	li	a0,37
ffffffffc020b48c:	9982                	jalr	s3
ffffffffc020b48e:	fff44783          	lbu	a5,-1(s0)
ffffffffc020b492:	8da2                	mv	s11,s0
ffffffffc020b494:	f74786e3          	beq	a5,s4,ffffffffc020b400 <vprintfmt+0x34>
ffffffffc020b498:	ffedc783          	lbu	a5,-2(s11)
ffffffffc020b49c:	1dfd                	addi	s11,s11,-1
ffffffffc020b49e:	ff479de3          	bne	a5,s4,ffffffffc020b498 <vprintfmt+0xcc>
ffffffffc020b4a2:	bfb9                	j	ffffffffc020b400 <vprintfmt+0x34>
ffffffffc020b4a4:	fd058c9b          	addiw	s9,a1,-48
ffffffffc020b4a8:	00144583          	lbu	a1,1(s0)
ffffffffc020b4ac:	846e                	mv	s0,s11
ffffffffc020b4ae:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b4b2:	0005861b          	sext.w	a2,a1
ffffffffc020b4b6:	02d8e463          	bltu	a7,a3,ffffffffc020b4de <vprintfmt+0x112>
ffffffffc020b4ba:	00144583          	lbu	a1,1(s0)
ffffffffc020b4be:	002c969b          	slliw	a3,s9,0x2
ffffffffc020b4c2:	0196873b          	addw	a4,a3,s9
ffffffffc020b4c6:	0017171b          	slliw	a4,a4,0x1
ffffffffc020b4ca:	9f31                	addw	a4,a4,a2
ffffffffc020b4cc:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b4d0:	0405                	addi	s0,s0,1
ffffffffc020b4d2:	fd070c9b          	addiw	s9,a4,-48
ffffffffc020b4d6:	0005861b          	sext.w	a2,a1
ffffffffc020b4da:	fed8f0e3          	bgeu	a7,a3,ffffffffc020b4ba <vprintfmt+0xee>
ffffffffc020b4de:	f40c5be3          	bgez	s8,ffffffffc020b434 <vprintfmt+0x68>
ffffffffc020b4e2:	8c66                	mv	s8,s9
ffffffffc020b4e4:	5cfd                	li	s9,-1
ffffffffc020b4e6:	b7b9                	j	ffffffffc020b434 <vprintfmt+0x68>
ffffffffc020b4e8:	fffc4693          	not	a3,s8
ffffffffc020b4ec:	96fd                	srai	a3,a3,0x3f
ffffffffc020b4ee:	00dc77b3          	and	a5,s8,a3
ffffffffc020b4f2:	00144583          	lbu	a1,1(s0)
ffffffffc020b4f6:	00078c1b          	sext.w	s8,a5
ffffffffc020b4fa:	846e                	mv	s0,s11
ffffffffc020b4fc:	bf25                	j	ffffffffc020b434 <vprintfmt+0x68>
ffffffffc020b4fe:	000aac83          	lw	s9,0(s5)
ffffffffc020b502:	00144583          	lbu	a1,1(s0)
ffffffffc020b506:	0aa1                	addi	s5,s5,8
ffffffffc020b508:	846e                	mv	s0,s11
ffffffffc020b50a:	bfd1                	j	ffffffffc020b4de <vprintfmt+0x112>
ffffffffc020b50c:	4705                	li	a4,1
ffffffffc020b50e:	008a8613          	addi	a2,s5,8
ffffffffc020b512:	00674463          	blt	a4,t1,ffffffffc020b51a <vprintfmt+0x14e>
ffffffffc020b516:	1c030c63          	beqz	t1,ffffffffc020b6ee <vprintfmt+0x322>
ffffffffc020b51a:	000ab683          	ld	a3,0(s5)
ffffffffc020b51e:	4741                	li	a4,16
ffffffffc020b520:	8ab2                	mv	s5,a2
ffffffffc020b522:	2801                	sext.w	a6,a6
ffffffffc020b524:	87e2                	mv	a5,s8
ffffffffc020b526:	8626                	mv	a2,s1
ffffffffc020b528:	85ca                	mv	a1,s2
ffffffffc020b52a:	854e                	mv	a0,s3
ffffffffc020b52c:	e11ff0ef          	jal	ra,ffffffffc020b33c <printnum>
ffffffffc020b530:	bdc1                	j	ffffffffc020b400 <vprintfmt+0x34>
ffffffffc020b532:	000aa503          	lw	a0,0(s5)
ffffffffc020b536:	864a                	mv	a2,s2
ffffffffc020b538:	85a6                	mv	a1,s1
ffffffffc020b53a:	0aa1                	addi	s5,s5,8
ffffffffc020b53c:	9982                	jalr	s3
ffffffffc020b53e:	b5c9                	j	ffffffffc020b400 <vprintfmt+0x34>
ffffffffc020b540:	4705                	li	a4,1
ffffffffc020b542:	008a8613          	addi	a2,s5,8
ffffffffc020b546:	00674463          	blt	a4,t1,ffffffffc020b54e <vprintfmt+0x182>
ffffffffc020b54a:	18030d63          	beqz	t1,ffffffffc020b6e4 <vprintfmt+0x318>
ffffffffc020b54e:	000ab683          	ld	a3,0(s5)
ffffffffc020b552:	4729                	li	a4,10
ffffffffc020b554:	8ab2                	mv	s5,a2
ffffffffc020b556:	b7f1                	j	ffffffffc020b522 <vprintfmt+0x156>
ffffffffc020b558:	00144583          	lbu	a1,1(s0)
ffffffffc020b55c:	4d05                	li	s10,1
ffffffffc020b55e:	846e                	mv	s0,s11
ffffffffc020b560:	bdd1                	j	ffffffffc020b434 <vprintfmt+0x68>
ffffffffc020b562:	864a                	mv	a2,s2
ffffffffc020b564:	85a6                	mv	a1,s1
ffffffffc020b566:	02500513          	li	a0,37
ffffffffc020b56a:	9982                	jalr	s3
ffffffffc020b56c:	bd51                	j	ffffffffc020b400 <vprintfmt+0x34>
ffffffffc020b56e:	00144583          	lbu	a1,1(s0)
ffffffffc020b572:	2305                	addiw	t1,t1,1
ffffffffc020b574:	846e                	mv	s0,s11
ffffffffc020b576:	bd7d                	j	ffffffffc020b434 <vprintfmt+0x68>
ffffffffc020b578:	4705                	li	a4,1
ffffffffc020b57a:	008a8613          	addi	a2,s5,8
ffffffffc020b57e:	00674463          	blt	a4,t1,ffffffffc020b586 <vprintfmt+0x1ba>
ffffffffc020b582:	14030c63          	beqz	t1,ffffffffc020b6da <vprintfmt+0x30e>
ffffffffc020b586:	000ab683          	ld	a3,0(s5)
ffffffffc020b58a:	4721                	li	a4,8
ffffffffc020b58c:	8ab2                	mv	s5,a2
ffffffffc020b58e:	bf51                	j	ffffffffc020b522 <vprintfmt+0x156>
ffffffffc020b590:	03000513          	li	a0,48
ffffffffc020b594:	864a                	mv	a2,s2
ffffffffc020b596:	85a6                	mv	a1,s1
ffffffffc020b598:	e042                	sd	a6,0(sp)
ffffffffc020b59a:	9982                	jalr	s3
ffffffffc020b59c:	864a                	mv	a2,s2
ffffffffc020b59e:	85a6                	mv	a1,s1
ffffffffc020b5a0:	07800513          	li	a0,120
ffffffffc020b5a4:	9982                	jalr	s3
ffffffffc020b5a6:	0aa1                	addi	s5,s5,8
ffffffffc020b5a8:	6802                	ld	a6,0(sp)
ffffffffc020b5aa:	4741                	li	a4,16
ffffffffc020b5ac:	ff8ab683          	ld	a3,-8(s5)
ffffffffc020b5b0:	bf8d                	j	ffffffffc020b522 <vprintfmt+0x156>
ffffffffc020b5b2:	000ab403          	ld	s0,0(s5)
ffffffffc020b5b6:	008a8793          	addi	a5,s5,8
ffffffffc020b5ba:	e03e                	sd	a5,0(sp)
ffffffffc020b5bc:	14040c63          	beqz	s0,ffffffffc020b714 <vprintfmt+0x348>
ffffffffc020b5c0:	11805063          	blez	s8,ffffffffc020b6c0 <vprintfmt+0x2f4>
ffffffffc020b5c4:	02d00693          	li	a3,45
ffffffffc020b5c8:	0cd81963          	bne	a6,a3,ffffffffc020b69a <vprintfmt+0x2ce>
ffffffffc020b5cc:	00044683          	lbu	a3,0(s0)
ffffffffc020b5d0:	0006851b          	sext.w	a0,a3
ffffffffc020b5d4:	ce8d                	beqz	a3,ffffffffc020b60e <vprintfmt+0x242>
ffffffffc020b5d6:	00140a93          	addi	s5,s0,1
ffffffffc020b5da:	05e00413          	li	s0,94
ffffffffc020b5de:	000cc563          	bltz	s9,ffffffffc020b5e8 <vprintfmt+0x21c>
ffffffffc020b5e2:	3cfd                	addiw	s9,s9,-1
ffffffffc020b5e4:	037c8363          	beq	s9,s7,ffffffffc020b60a <vprintfmt+0x23e>
ffffffffc020b5e8:	864a                	mv	a2,s2
ffffffffc020b5ea:	85a6                	mv	a1,s1
ffffffffc020b5ec:	100d0663          	beqz	s10,ffffffffc020b6f8 <vprintfmt+0x32c>
ffffffffc020b5f0:	3681                	addiw	a3,a3,-32
ffffffffc020b5f2:	10d47363          	bgeu	s0,a3,ffffffffc020b6f8 <vprintfmt+0x32c>
ffffffffc020b5f6:	03f00513          	li	a0,63
ffffffffc020b5fa:	9982                	jalr	s3
ffffffffc020b5fc:	000ac683          	lbu	a3,0(s5)
ffffffffc020b600:	3c7d                	addiw	s8,s8,-1
ffffffffc020b602:	0a85                	addi	s5,s5,1
ffffffffc020b604:	0006851b          	sext.w	a0,a3
ffffffffc020b608:	faf9                	bnez	a3,ffffffffc020b5de <vprintfmt+0x212>
ffffffffc020b60a:	01805a63          	blez	s8,ffffffffc020b61e <vprintfmt+0x252>
ffffffffc020b60e:	3c7d                	addiw	s8,s8,-1
ffffffffc020b610:	864a                	mv	a2,s2
ffffffffc020b612:	85a6                	mv	a1,s1
ffffffffc020b614:	02000513          	li	a0,32
ffffffffc020b618:	9982                	jalr	s3
ffffffffc020b61a:	fe0c1ae3          	bnez	s8,ffffffffc020b60e <vprintfmt+0x242>
ffffffffc020b61e:	6a82                	ld	s5,0(sp)
ffffffffc020b620:	b3c5                	j	ffffffffc020b400 <vprintfmt+0x34>
ffffffffc020b622:	4705                	li	a4,1
ffffffffc020b624:	008a8d13          	addi	s10,s5,8
ffffffffc020b628:	00674463          	blt	a4,t1,ffffffffc020b630 <vprintfmt+0x264>
ffffffffc020b62c:	0a030463          	beqz	t1,ffffffffc020b6d4 <vprintfmt+0x308>
ffffffffc020b630:	000ab403          	ld	s0,0(s5)
ffffffffc020b634:	0c044463          	bltz	s0,ffffffffc020b6fc <vprintfmt+0x330>
ffffffffc020b638:	86a2                	mv	a3,s0
ffffffffc020b63a:	8aea                	mv	s5,s10
ffffffffc020b63c:	4729                	li	a4,10
ffffffffc020b63e:	b5d5                	j	ffffffffc020b522 <vprintfmt+0x156>
ffffffffc020b640:	000aa783          	lw	a5,0(s5)
ffffffffc020b644:	46e1                	li	a3,24
ffffffffc020b646:	0aa1                	addi	s5,s5,8
ffffffffc020b648:	41f7d71b          	sraiw	a4,a5,0x1f
ffffffffc020b64c:	8fb9                	xor	a5,a5,a4
ffffffffc020b64e:	40e7873b          	subw	a4,a5,a4
ffffffffc020b652:	02e6c663          	blt	a3,a4,ffffffffc020b67e <vprintfmt+0x2b2>
ffffffffc020b656:	00371793          	slli	a5,a4,0x3
ffffffffc020b65a:	00004697          	auipc	a3,0x4
ffffffffc020b65e:	60668693          	addi	a3,a3,1542 # ffffffffc020fc60 <error_string>
ffffffffc020b662:	97b6                	add	a5,a5,a3
ffffffffc020b664:	639c                	ld	a5,0(a5)
ffffffffc020b666:	cf81                	beqz	a5,ffffffffc020b67e <vprintfmt+0x2b2>
ffffffffc020b668:	873e                	mv	a4,a5
ffffffffc020b66a:	00000697          	auipc	a3,0x0
ffffffffc020b66e:	28668693          	addi	a3,a3,646 # ffffffffc020b8f0 <etext+0x2c>
ffffffffc020b672:	8626                	mv	a2,s1
ffffffffc020b674:	85ca                	mv	a1,s2
ffffffffc020b676:	854e                	mv	a0,s3
ffffffffc020b678:	0d4000ef          	jal	ra,ffffffffc020b74c <printfmt>
ffffffffc020b67c:	b351                	j	ffffffffc020b400 <vprintfmt+0x34>
ffffffffc020b67e:	00004697          	auipc	a3,0x4
ffffffffc020b682:	2a268693          	addi	a3,a3,674 # ffffffffc020f920 <sfs_node_fileops+0x138>
ffffffffc020b686:	8626                	mv	a2,s1
ffffffffc020b688:	85ca                	mv	a1,s2
ffffffffc020b68a:	854e                	mv	a0,s3
ffffffffc020b68c:	0c0000ef          	jal	ra,ffffffffc020b74c <printfmt>
ffffffffc020b690:	bb85                	j	ffffffffc020b400 <vprintfmt+0x34>
ffffffffc020b692:	00004417          	auipc	s0,0x4
ffffffffc020b696:	28640413          	addi	s0,s0,646 # ffffffffc020f918 <sfs_node_fileops+0x130>
ffffffffc020b69a:	85e6                	mv	a1,s9
ffffffffc020b69c:	8522                	mv	a0,s0
ffffffffc020b69e:	e442                	sd	a6,8(sp)
ffffffffc020b6a0:	132000ef          	jal	ra,ffffffffc020b7d2 <strnlen>
ffffffffc020b6a4:	40ac0c3b          	subw	s8,s8,a0
ffffffffc020b6a8:	01805c63          	blez	s8,ffffffffc020b6c0 <vprintfmt+0x2f4>
ffffffffc020b6ac:	6822                	ld	a6,8(sp)
ffffffffc020b6ae:	00080a9b          	sext.w	s5,a6
ffffffffc020b6b2:	3c7d                	addiw	s8,s8,-1
ffffffffc020b6b4:	864a                	mv	a2,s2
ffffffffc020b6b6:	85a6                	mv	a1,s1
ffffffffc020b6b8:	8556                	mv	a0,s5
ffffffffc020b6ba:	9982                	jalr	s3
ffffffffc020b6bc:	fe0c1be3          	bnez	s8,ffffffffc020b6b2 <vprintfmt+0x2e6>
ffffffffc020b6c0:	00044683          	lbu	a3,0(s0)
ffffffffc020b6c4:	00140a93          	addi	s5,s0,1
ffffffffc020b6c8:	0006851b          	sext.w	a0,a3
ffffffffc020b6cc:	daa9                	beqz	a3,ffffffffc020b61e <vprintfmt+0x252>
ffffffffc020b6ce:	05e00413          	li	s0,94
ffffffffc020b6d2:	b731                	j	ffffffffc020b5de <vprintfmt+0x212>
ffffffffc020b6d4:	000aa403          	lw	s0,0(s5)
ffffffffc020b6d8:	bfb1                	j	ffffffffc020b634 <vprintfmt+0x268>
ffffffffc020b6da:	000ae683          	lwu	a3,0(s5)
ffffffffc020b6de:	4721                	li	a4,8
ffffffffc020b6e0:	8ab2                	mv	s5,a2
ffffffffc020b6e2:	b581                	j	ffffffffc020b522 <vprintfmt+0x156>
ffffffffc020b6e4:	000ae683          	lwu	a3,0(s5)
ffffffffc020b6e8:	4729                	li	a4,10
ffffffffc020b6ea:	8ab2                	mv	s5,a2
ffffffffc020b6ec:	bd1d                	j	ffffffffc020b522 <vprintfmt+0x156>
ffffffffc020b6ee:	000ae683          	lwu	a3,0(s5)
ffffffffc020b6f2:	4741                	li	a4,16
ffffffffc020b6f4:	8ab2                	mv	s5,a2
ffffffffc020b6f6:	b535                	j	ffffffffc020b522 <vprintfmt+0x156>
ffffffffc020b6f8:	9982                	jalr	s3
ffffffffc020b6fa:	b709                	j	ffffffffc020b5fc <vprintfmt+0x230>
ffffffffc020b6fc:	864a                	mv	a2,s2
ffffffffc020b6fe:	85a6                	mv	a1,s1
ffffffffc020b700:	02d00513          	li	a0,45
ffffffffc020b704:	e042                	sd	a6,0(sp)
ffffffffc020b706:	9982                	jalr	s3
ffffffffc020b708:	6802                	ld	a6,0(sp)
ffffffffc020b70a:	8aea                	mv	s5,s10
ffffffffc020b70c:	408006b3          	neg	a3,s0
ffffffffc020b710:	4729                	li	a4,10
ffffffffc020b712:	bd01                	j	ffffffffc020b522 <vprintfmt+0x156>
ffffffffc020b714:	03805163          	blez	s8,ffffffffc020b736 <vprintfmt+0x36a>
ffffffffc020b718:	02d00693          	li	a3,45
ffffffffc020b71c:	f6d81be3          	bne	a6,a3,ffffffffc020b692 <vprintfmt+0x2c6>
ffffffffc020b720:	00004417          	auipc	s0,0x4
ffffffffc020b724:	1f840413          	addi	s0,s0,504 # ffffffffc020f918 <sfs_node_fileops+0x130>
ffffffffc020b728:	02800693          	li	a3,40
ffffffffc020b72c:	02800513          	li	a0,40
ffffffffc020b730:	00140a93          	addi	s5,s0,1
ffffffffc020b734:	b55d                	j	ffffffffc020b5da <vprintfmt+0x20e>
ffffffffc020b736:	00004a97          	auipc	s5,0x4
ffffffffc020b73a:	1e3a8a93          	addi	s5,s5,483 # ffffffffc020f919 <sfs_node_fileops+0x131>
ffffffffc020b73e:	02800513          	li	a0,40
ffffffffc020b742:	02800693          	li	a3,40
ffffffffc020b746:	05e00413          	li	s0,94
ffffffffc020b74a:	bd51                	j	ffffffffc020b5de <vprintfmt+0x212>

ffffffffc020b74c <printfmt>:
ffffffffc020b74c:	7139                	addi	sp,sp,-64
ffffffffc020b74e:	02010313          	addi	t1,sp,32
ffffffffc020b752:	f03a                	sd	a4,32(sp)
ffffffffc020b754:	871a                	mv	a4,t1
ffffffffc020b756:	ec06                	sd	ra,24(sp)
ffffffffc020b758:	f43e                	sd	a5,40(sp)
ffffffffc020b75a:	f842                	sd	a6,48(sp)
ffffffffc020b75c:	fc46                	sd	a7,56(sp)
ffffffffc020b75e:	e41a                	sd	t1,8(sp)
ffffffffc020b760:	c6dff0ef          	jal	ra,ffffffffc020b3cc <vprintfmt>
ffffffffc020b764:	60e2                	ld	ra,24(sp)
ffffffffc020b766:	6121                	addi	sp,sp,64
ffffffffc020b768:	8082                	ret

ffffffffc020b76a <snprintf>:
ffffffffc020b76a:	711d                	addi	sp,sp,-96
ffffffffc020b76c:	15fd                	addi	a1,a1,-1
ffffffffc020b76e:	03810313          	addi	t1,sp,56
ffffffffc020b772:	95aa                	add	a1,a1,a0
ffffffffc020b774:	f406                	sd	ra,40(sp)
ffffffffc020b776:	fc36                	sd	a3,56(sp)
ffffffffc020b778:	e0ba                	sd	a4,64(sp)
ffffffffc020b77a:	e4be                	sd	a5,72(sp)
ffffffffc020b77c:	e8c2                	sd	a6,80(sp)
ffffffffc020b77e:	ecc6                	sd	a7,88(sp)
ffffffffc020b780:	e01a                	sd	t1,0(sp)
ffffffffc020b782:	e42a                	sd	a0,8(sp)
ffffffffc020b784:	e82e                	sd	a1,16(sp)
ffffffffc020b786:	cc02                	sw	zero,24(sp)
ffffffffc020b788:	c515                	beqz	a0,ffffffffc020b7b4 <snprintf+0x4a>
ffffffffc020b78a:	02a5e563          	bltu	a1,a0,ffffffffc020b7b4 <snprintf+0x4a>
ffffffffc020b78e:	75dd                	lui	a1,0xffff7
ffffffffc020b790:	86b2                	mv	a3,a2
ffffffffc020b792:	00000517          	auipc	a0,0x0
ffffffffc020b796:	c2050513          	addi	a0,a0,-992 # ffffffffc020b3b2 <sprintputch>
ffffffffc020b79a:	871a                	mv	a4,t1
ffffffffc020b79c:	0030                	addi	a2,sp,8
ffffffffc020b79e:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc020b7a2:	c2bff0ef          	jal	ra,ffffffffc020b3cc <vprintfmt>
ffffffffc020b7a6:	67a2                	ld	a5,8(sp)
ffffffffc020b7a8:	00078023          	sb	zero,0(a5)
ffffffffc020b7ac:	4562                	lw	a0,24(sp)
ffffffffc020b7ae:	70a2                	ld	ra,40(sp)
ffffffffc020b7b0:	6125                	addi	sp,sp,96
ffffffffc020b7b2:	8082                	ret
ffffffffc020b7b4:	5575                	li	a0,-3
ffffffffc020b7b6:	bfe5                	j	ffffffffc020b7ae <snprintf+0x44>

ffffffffc020b7b8 <strlen>:
ffffffffc020b7b8:	00054783          	lbu	a5,0(a0)
ffffffffc020b7bc:	872a                	mv	a4,a0
ffffffffc020b7be:	4501                	li	a0,0
ffffffffc020b7c0:	cb81                	beqz	a5,ffffffffc020b7d0 <strlen+0x18>
ffffffffc020b7c2:	0505                	addi	a0,a0,1
ffffffffc020b7c4:	00a707b3          	add	a5,a4,a0
ffffffffc020b7c8:	0007c783          	lbu	a5,0(a5)
ffffffffc020b7cc:	fbfd                	bnez	a5,ffffffffc020b7c2 <strlen+0xa>
ffffffffc020b7ce:	8082                	ret
ffffffffc020b7d0:	8082                	ret

ffffffffc020b7d2 <strnlen>:
ffffffffc020b7d2:	4781                	li	a5,0
ffffffffc020b7d4:	e589                	bnez	a1,ffffffffc020b7de <strnlen+0xc>
ffffffffc020b7d6:	a811                	j	ffffffffc020b7ea <strnlen+0x18>
ffffffffc020b7d8:	0785                	addi	a5,a5,1
ffffffffc020b7da:	00f58863          	beq	a1,a5,ffffffffc020b7ea <strnlen+0x18>
ffffffffc020b7de:	00f50733          	add	a4,a0,a5
ffffffffc020b7e2:	00074703          	lbu	a4,0(a4)
ffffffffc020b7e6:	fb6d                	bnez	a4,ffffffffc020b7d8 <strnlen+0x6>
ffffffffc020b7e8:	85be                	mv	a1,a5
ffffffffc020b7ea:	852e                	mv	a0,a1
ffffffffc020b7ec:	8082                	ret

ffffffffc020b7ee <strcpy>:
ffffffffc020b7ee:	87aa                	mv	a5,a0
ffffffffc020b7f0:	0005c703          	lbu	a4,0(a1)
ffffffffc020b7f4:	0785                	addi	a5,a5,1
ffffffffc020b7f6:	0585                	addi	a1,a1,1
ffffffffc020b7f8:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b7fc:	fb75                	bnez	a4,ffffffffc020b7f0 <strcpy+0x2>
ffffffffc020b7fe:	8082                	ret

ffffffffc020b800 <strcmp>:
ffffffffc020b800:	00054783          	lbu	a5,0(a0)
ffffffffc020b804:	0005c703          	lbu	a4,0(a1)
ffffffffc020b808:	cb89                	beqz	a5,ffffffffc020b81a <strcmp+0x1a>
ffffffffc020b80a:	0505                	addi	a0,a0,1
ffffffffc020b80c:	0585                	addi	a1,a1,1
ffffffffc020b80e:	fee789e3          	beq	a5,a4,ffffffffc020b800 <strcmp>
ffffffffc020b812:	0007851b          	sext.w	a0,a5
ffffffffc020b816:	9d19                	subw	a0,a0,a4
ffffffffc020b818:	8082                	ret
ffffffffc020b81a:	4501                	li	a0,0
ffffffffc020b81c:	bfed                	j	ffffffffc020b816 <strcmp+0x16>

ffffffffc020b81e <strncmp>:
ffffffffc020b81e:	c20d                	beqz	a2,ffffffffc020b840 <strncmp+0x22>
ffffffffc020b820:	962e                	add	a2,a2,a1
ffffffffc020b822:	a031                	j	ffffffffc020b82e <strncmp+0x10>
ffffffffc020b824:	0505                	addi	a0,a0,1
ffffffffc020b826:	00e79a63          	bne	a5,a4,ffffffffc020b83a <strncmp+0x1c>
ffffffffc020b82a:	00b60b63          	beq	a2,a1,ffffffffc020b840 <strncmp+0x22>
ffffffffc020b82e:	00054783          	lbu	a5,0(a0)
ffffffffc020b832:	0585                	addi	a1,a1,1
ffffffffc020b834:	fff5c703          	lbu	a4,-1(a1)
ffffffffc020b838:	f7f5                	bnez	a5,ffffffffc020b824 <strncmp+0x6>
ffffffffc020b83a:	40e7853b          	subw	a0,a5,a4
ffffffffc020b83e:	8082                	ret
ffffffffc020b840:	4501                	li	a0,0
ffffffffc020b842:	8082                	ret

ffffffffc020b844 <strchr>:
ffffffffc020b844:	00054783          	lbu	a5,0(a0)
ffffffffc020b848:	c799                	beqz	a5,ffffffffc020b856 <strchr+0x12>
ffffffffc020b84a:	00f58763          	beq	a1,a5,ffffffffc020b858 <strchr+0x14>
ffffffffc020b84e:	00154783          	lbu	a5,1(a0)
ffffffffc020b852:	0505                	addi	a0,a0,1
ffffffffc020b854:	fbfd                	bnez	a5,ffffffffc020b84a <strchr+0x6>
ffffffffc020b856:	4501                	li	a0,0
ffffffffc020b858:	8082                	ret

ffffffffc020b85a <memset>:
ffffffffc020b85a:	ca01                	beqz	a2,ffffffffc020b86a <memset+0x10>
ffffffffc020b85c:	962a                	add	a2,a2,a0
ffffffffc020b85e:	87aa                	mv	a5,a0
ffffffffc020b860:	0785                	addi	a5,a5,1
ffffffffc020b862:	feb78fa3          	sb	a1,-1(a5)
ffffffffc020b866:	fec79de3          	bne	a5,a2,ffffffffc020b860 <memset+0x6>
ffffffffc020b86a:	8082                	ret

ffffffffc020b86c <memmove>:
ffffffffc020b86c:	02a5f263          	bgeu	a1,a0,ffffffffc020b890 <memmove+0x24>
ffffffffc020b870:	00c587b3          	add	a5,a1,a2
ffffffffc020b874:	00f57e63          	bgeu	a0,a5,ffffffffc020b890 <memmove+0x24>
ffffffffc020b878:	00c50733          	add	a4,a0,a2
ffffffffc020b87c:	c615                	beqz	a2,ffffffffc020b8a8 <memmove+0x3c>
ffffffffc020b87e:	fff7c683          	lbu	a3,-1(a5)
ffffffffc020b882:	17fd                	addi	a5,a5,-1
ffffffffc020b884:	177d                	addi	a4,a4,-1
ffffffffc020b886:	00d70023          	sb	a3,0(a4)
ffffffffc020b88a:	fef59ae3          	bne	a1,a5,ffffffffc020b87e <memmove+0x12>
ffffffffc020b88e:	8082                	ret
ffffffffc020b890:	00c586b3          	add	a3,a1,a2
ffffffffc020b894:	87aa                	mv	a5,a0
ffffffffc020b896:	ca11                	beqz	a2,ffffffffc020b8aa <memmove+0x3e>
ffffffffc020b898:	0005c703          	lbu	a4,0(a1)
ffffffffc020b89c:	0585                	addi	a1,a1,1
ffffffffc020b89e:	0785                	addi	a5,a5,1
ffffffffc020b8a0:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b8a4:	fed59ae3          	bne	a1,a3,ffffffffc020b898 <memmove+0x2c>
ffffffffc020b8a8:	8082                	ret
ffffffffc020b8aa:	8082                	ret

ffffffffc020b8ac <memcpy>:
ffffffffc020b8ac:	ca19                	beqz	a2,ffffffffc020b8c2 <memcpy+0x16>
ffffffffc020b8ae:	962e                	add	a2,a2,a1
ffffffffc020b8b0:	87aa                	mv	a5,a0
ffffffffc020b8b2:	0005c703          	lbu	a4,0(a1)
ffffffffc020b8b6:	0585                	addi	a1,a1,1
ffffffffc020b8b8:	0785                	addi	a5,a5,1
ffffffffc020b8ba:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b8be:	fec59ae3          	bne	a1,a2,ffffffffc020b8b2 <memcpy+0x6>
ffffffffc020b8c2:	8082                	ret
