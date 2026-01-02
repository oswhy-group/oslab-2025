
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
ffffffffc0200062:	7720b0ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc0200066:	52c000ef          	jal	ra,ffffffffc0200592 <cons_init>
ffffffffc020006a:	0000b597          	auipc	a1,0xb
ffffffffc020006e:	7d658593          	addi	a1,a1,2006 # ffffffffc020b840 <etext+0x2>
ffffffffc0200072:	0000b517          	auipc	a0,0xb
ffffffffc0200076:	7ee50513          	addi	a0,a0,2030 # ffffffffc020b860 <etext+0x22>
ffffffffc020007a:	12c000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020007e:	1ae000ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc0200082:	62a000ef          	jal	ra,ffffffffc02006ac <dtb_init>
ffffffffc0200086:	24b020ef          	jal	ra,ffffffffc0202ad0 <pmm_init>
ffffffffc020008a:	3ef000ef          	jal	ra,ffffffffc0200c78 <pic_init>
ffffffffc020008e:	515000ef          	jal	ra,ffffffffc0200da2 <idt_init>
ffffffffc0200092:	6d7030ef          	jal	ra,ffffffffc0203f68 <vmm_init>
ffffffffc0200096:	4ce070ef          	jal	ra,ffffffffc0207564 <sched_init>
ffffffffc020009a:	0d0070ef          	jal	ra,ffffffffc020716a <proc_init>
ffffffffc020009e:	1bf000ef          	jal	ra,ffffffffc0200a5c <ide_init>
ffffffffc02000a2:	108050ef          	jal	ra,ffffffffc02051aa <fs_init>
ffffffffc02000a6:	4a4000ef          	jal	ra,ffffffffc020054a <clock_init>
ffffffffc02000aa:	3c3000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02000ae:	28c070ef          	jal	ra,ffffffffc020733a <cpu_idle>

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
ffffffffc02000c8:	0000b517          	auipc	a0,0xb
ffffffffc02000cc:	7a050513          	addi	a0,a0,1952 # ffffffffc020b868 <etext+0x2a>
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
ffffffffc020019a:	1ac0b0ef          	jal	ra,ffffffffc020b346 <vprintfmt>
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
ffffffffc02001d6:	1700b0ef          	jal	ra,ffffffffc020b346 <vprintfmt>
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
ffffffffc0200200:	5320b0ef          	jal	ra,ffffffffc020b732 <strlen>
ffffffffc0200204:	842a                	mv	s0,a0
ffffffffc0200206:	0505                	addi	a0,a0,1
ffffffffc0200208:	587010ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020020c:	84aa                	mv	s1,a0
ffffffffc020020e:	c901                	beqz	a0,ffffffffc020021e <strdup+0x2a>
ffffffffc0200210:	8622                	mv	a2,s0
ffffffffc0200212:	85ca                	mv	a1,s2
ffffffffc0200214:	9426                	add	s0,s0,s1
ffffffffc0200216:	6100b0ef          	jal	ra,ffffffffc020b826 <memcpy>
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
ffffffffc0200232:	64250513          	addi	a0,a0,1602 # ffffffffc020b870 <etext+0x32>
ffffffffc0200236:	e406                	sd	ra,8(sp)
ffffffffc0200238:	f6fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020023c:	00000597          	auipc	a1,0x0
ffffffffc0200240:	e0e58593          	addi	a1,a1,-498 # ffffffffc020004a <kern_init>
ffffffffc0200244:	0000b517          	auipc	a0,0xb
ffffffffc0200248:	64c50513          	addi	a0,a0,1612 # ffffffffc020b890 <etext+0x52>
ffffffffc020024c:	f5bff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200250:	0000b597          	auipc	a1,0xb
ffffffffc0200254:	5ee58593          	addi	a1,a1,1518 # ffffffffc020b83e <etext>
ffffffffc0200258:	0000b517          	auipc	a0,0xb
ffffffffc020025c:	65850513          	addi	a0,a0,1624 # ffffffffc020b8b0 <etext+0x72>
ffffffffc0200260:	f47ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200264:	00091597          	auipc	a1,0x91
ffffffffc0200268:	dfc58593          	addi	a1,a1,-516 # ffffffffc0291060 <buf>
ffffffffc020026c:	0000b517          	auipc	a0,0xb
ffffffffc0200270:	66450513          	addi	a0,a0,1636 # ffffffffc020b8d0 <etext+0x92>
ffffffffc0200274:	f33ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200278:	00096597          	auipc	a1,0x96
ffffffffc020027c:	69858593          	addi	a1,a1,1688 # ffffffffc0296910 <end>
ffffffffc0200280:	0000b517          	auipc	a0,0xb
ffffffffc0200284:	67050513          	addi	a0,a0,1648 # ffffffffc020b8f0 <etext+0xb2>
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
ffffffffc02002b2:	66250513          	addi	a0,a0,1634 # ffffffffc020b910 <etext+0xd2>
ffffffffc02002b6:	0141                	addi	sp,sp,16
ffffffffc02002b8:	b5fd                	j	ffffffffc02001a6 <cprintf>

ffffffffc02002ba <print_stackframe>:
ffffffffc02002ba:	1141                	addi	sp,sp,-16
ffffffffc02002bc:	0000b617          	auipc	a2,0xb
ffffffffc02002c0:	68460613          	addi	a2,a2,1668 # ffffffffc020b940 <etext+0x102>
ffffffffc02002c4:	04e00593          	li	a1,78
ffffffffc02002c8:	0000b517          	auipc	a0,0xb
ffffffffc02002cc:	69050513          	addi	a0,a0,1680 # ffffffffc020b958 <etext+0x11a>
ffffffffc02002d0:	e406                	sd	ra,8(sp)
ffffffffc02002d2:	1cc000ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02002d6 <mon_help>:
ffffffffc02002d6:	1141                	addi	sp,sp,-16
ffffffffc02002d8:	0000b617          	auipc	a2,0xb
ffffffffc02002dc:	69860613          	addi	a2,a2,1688 # ffffffffc020b970 <etext+0x132>
ffffffffc02002e0:	0000b597          	auipc	a1,0xb
ffffffffc02002e4:	6b058593          	addi	a1,a1,1712 # ffffffffc020b990 <etext+0x152>
ffffffffc02002e8:	0000b517          	auipc	a0,0xb
ffffffffc02002ec:	6b050513          	addi	a0,a0,1712 # ffffffffc020b998 <etext+0x15a>
ffffffffc02002f0:	e406                	sd	ra,8(sp)
ffffffffc02002f2:	eb5ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02002f6:	0000b617          	auipc	a2,0xb
ffffffffc02002fa:	6b260613          	addi	a2,a2,1714 # ffffffffc020b9a8 <etext+0x16a>
ffffffffc02002fe:	0000b597          	auipc	a1,0xb
ffffffffc0200302:	6d258593          	addi	a1,a1,1746 # ffffffffc020b9d0 <etext+0x192>
ffffffffc0200306:	0000b517          	auipc	a0,0xb
ffffffffc020030a:	69250513          	addi	a0,a0,1682 # ffffffffc020b998 <etext+0x15a>
ffffffffc020030e:	e99ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200312:	0000b617          	auipc	a2,0xb
ffffffffc0200316:	6ce60613          	addi	a2,a2,1742 # ffffffffc020b9e0 <etext+0x1a2>
ffffffffc020031a:	0000b597          	auipc	a1,0xb
ffffffffc020031e:	6e658593          	addi	a1,a1,1766 # ffffffffc020ba00 <etext+0x1c2>
ffffffffc0200322:	0000b517          	auipc	a0,0xb
ffffffffc0200326:	67650513          	addi	a0,a0,1654 # ffffffffc020b998 <etext+0x15a>
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
ffffffffc0200360:	6b450513          	addi	a0,a0,1716 # ffffffffc020ba10 <etext+0x1d2>
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
ffffffffc0200382:	6ba50513          	addi	a0,a0,1722 # ffffffffc020ba38 <etext+0x1fa>
ffffffffc0200386:	e21ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020038a:	000b8563          	beqz	s7,ffffffffc0200394 <kmonitor+0x3e>
ffffffffc020038e:	855e                	mv	a0,s7
ffffffffc0200390:	3fb000ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc0200394:	0000bc17          	auipc	s8,0xb
ffffffffc0200398:	714c0c13          	addi	s8,s8,1812 # ffffffffc020baa8 <commands>
ffffffffc020039c:	0000b917          	auipc	s2,0xb
ffffffffc02003a0:	6c490913          	addi	s2,s2,1732 # ffffffffc020ba60 <etext+0x222>
ffffffffc02003a4:	0000b497          	auipc	s1,0xb
ffffffffc02003a8:	6c448493          	addi	s1,s1,1732 # ffffffffc020ba68 <etext+0x22a>
ffffffffc02003ac:	49bd                	li	s3,15
ffffffffc02003ae:	0000bb17          	auipc	s6,0xb
ffffffffc02003b2:	6c2b0b13          	addi	s6,s6,1730 # ffffffffc020ba70 <etext+0x232>
ffffffffc02003b6:	0000ba17          	auipc	s4,0xb
ffffffffc02003ba:	5daa0a13          	addi	s4,s4,1498 # ffffffffc020b990 <etext+0x152>
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
ffffffffc02003dc:	6d0d0d13          	addi	s10,s10,1744 # ffffffffc020baa8 <commands>
ffffffffc02003e0:	8552                	mv	a0,s4
ffffffffc02003e2:	4401                	li	s0,0
ffffffffc02003e4:	0d61                	addi	s10,s10,24
ffffffffc02003e6:	3940b0ef          	jal	ra,ffffffffc020b77a <strcmp>
ffffffffc02003ea:	c919                	beqz	a0,ffffffffc0200400 <kmonitor+0xaa>
ffffffffc02003ec:	2405                	addiw	s0,s0,1
ffffffffc02003ee:	0b540063          	beq	s0,s5,ffffffffc020048e <kmonitor+0x138>
ffffffffc02003f2:	000d3503          	ld	a0,0(s10)
ffffffffc02003f6:	6582                	ld	a1,0(sp)
ffffffffc02003f8:	0d61                	addi	s10,s10,24
ffffffffc02003fa:	3800b0ef          	jal	ra,ffffffffc020b77a <strcmp>
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
ffffffffc0200438:	3860b0ef          	jal	ra,ffffffffc020b7be <strchr>
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
ffffffffc0200476:	3480b0ef          	jal	ra,ffffffffc020b7be <strchr>
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
ffffffffc0200494:	60050513          	addi	a0,a0,1536 # ffffffffc020ba90 <etext+0x252>
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
ffffffffc02004d0:	62450513          	addi	a0,a0,1572 # ffffffffc020baf0 <commands+0x48>
ffffffffc02004d4:	e43e                	sd	a5,8(sp)
ffffffffc02004d6:	cd1ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004da:	65a2                	ld	a1,8(sp)
ffffffffc02004dc:	8522                	mv	a0,s0
ffffffffc02004de:	ca3ff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc02004e2:	0000d517          	auipc	a0,0xd
ffffffffc02004e6:	8ce50513          	addi	a0,a0,-1842 # ffffffffc020cdb0 <default_pmm_manager+0x610>
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
ffffffffc020051a:	5fa50513          	addi	a0,a0,1530 # ffffffffc020bb10 <commands+0x68>
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
ffffffffc020053a:	87a50513          	addi	a0,a0,-1926 # ffffffffc020cdb0 <default_pmm_manager+0x610>
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
ffffffffc020056c:	5c850513          	addi	a0,a0,1480 # ffffffffc020bb30 <commands+0x88>
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
ffffffffc02006b2:	4a250513          	addi	a0,a0,1186 # ffffffffc020bb50 <commands+0xa8>
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
ffffffffc02006e0:	48450513          	addi	a0,a0,1156 # ffffffffc020bb60 <commands+0xb8>
ffffffffc02006e4:	ac3ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006e8:	00014417          	auipc	s0,0x14
ffffffffc02006ec:	92040413          	addi	s0,s0,-1760 # ffffffffc0214008 <boot_dtb>
ffffffffc02006f0:	600c                	ld	a1,0(s0)
ffffffffc02006f2:	0000b517          	auipc	a0,0xb
ffffffffc02006f6:	47e50513          	addi	a0,a0,1150 # ffffffffc020bb70 <commands+0xc8>
ffffffffc02006fa:	aadff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006fe:	00043a03          	ld	s4,0(s0)
ffffffffc0200702:	0000b517          	auipc	a0,0xb
ffffffffc0200706:	48650513          	addi	a0,a0,1158 # ffffffffc020bb88 <commands+0xe0>
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
ffffffffc02007c0:	41c90913          	addi	s2,s2,1052 # ffffffffc020bbd8 <commands+0x130>
ffffffffc02007c4:	49bd                	li	s3,15
ffffffffc02007c6:	4d91                	li	s11,4
ffffffffc02007c8:	4d05                	li	s10,1
ffffffffc02007ca:	0000b497          	auipc	s1,0xb
ffffffffc02007ce:	40648493          	addi	s1,s1,1030 # ffffffffc020bbd0 <commands+0x128>
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
ffffffffc0200822:	43250513          	addi	a0,a0,1074 # ffffffffc020bc50 <commands+0x1a8>
ffffffffc0200826:	981ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020082a:	0000b517          	auipc	a0,0xb
ffffffffc020082e:	45e50513          	addi	a0,a0,1118 # ffffffffc020bc88 <commands+0x1e0>
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
ffffffffc020086e:	33e50513          	addi	a0,a0,830 # ffffffffc020bba8 <commands+0x100>
ffffffffc0200872:	6109                	addi	sp,sp,128
ffffffffc0200874:	ba0d                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200876:	8556                	mv	a0,s5
ffffffffc0200878:	6bb0a0ef          	jal	ra,ffffffffc020b732 <strlen>
ffffffffc020087c:	8a2a                	mv	s4,a0
ffffffffc020087e:	4619                	li	a2,6
ffffffffc0200880:	85a6                	mv	a1,s1
ffffffffc0200882:	8556                	mv	a0,s5
ffffffffc0200884:	2a01                	sext.w	s4,s4
ffffffffc0200886:	7130a0ef          	jal	ra,ffffffffc020b798 <strncmp>
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
ffffffffc020091c:	65f0a0ef          	jal	ra,ffffffffc020b77a <strcmp>
ffffffffc0200920:	66a2                	ld	a3,8(sp)
ffffffffc0200922:	f94d                	bnez	a0,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200924:	fb59f8e3          	bgeu	s3,s5,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200928:	00ca3783          	ld	a5,12(s4)
ffffffffc020092c:	014a3703          	ld	a4,20(s4)
ffffffffc0200930:	0000b517          	auipc	a0,0xb
ffffffffc0200934:	2b050513          	addi	a0,a0,688 # ffffffffc020bbe0 <commands+0x138>
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
ffffffffc0200a02:	20250513          	addi	a0,a0,514 # ffffffffc020bc00 <commands+0x158>
ffffffffc0200a06:	fa0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a0a:	014b5613          	srli	a2,s6,0x14
ffffffffc0200a0e:	85da                	mv	a1,s6
ffffffffc0200a10:	0000b517          	auipc	a0,0xb
ffffffffc0200a14:	20850513          	addi	a0,a0,520 # ffffffffc020bc18 <commands+0x170>
ffffffffc0200a18:	f8eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a1c:	008b05b3          	add	a1,s6,s0
ffffffffc0200a20:	15fd                	addi	a1,a1,-1
ffffffffc0200a22:	0000b517          	auipc	a0,0xb
ffffffffc0200a26:	21650513          	addi	a0,a0,534 # ffffffffc020bc38 <commands+0x190>
ffffffffc0200a2a:	f7cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a2e:	0000b517          	auipc	a0,0xb
ffffffffc0200a32:	25a50513          	addi	a0,a0,602 # ffffffffc020bc88 <commands+0x1e0>
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
ffffffffc0200abc:	1e868693          	addi	a3,a3,488 # ffffffffc020bca0 <commands+0x1f8>
ffffffffc0200ac0:	0000b617          	auipc	a2,0xb
ffffffffc0200ac4:	1f860613          	addi	a2,a2,504 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0200ac8:	45c5                	li	a1,17
ffffffffc0200aca:	0000b517          	auipc	a0,0xb
ffffffffc0200ace:	20650513          	addi	a0,a0,518 # ffffffffc020bcd0 <commands+0x228>
ffffffffc0200ad2:	9cdff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200ad6:	0000b697          	auipc	a3,0xb
ffffffffc0200ada:	21268693          	addi	a3,a3,530 # ffffffffc020bce8 <commands+0x240>
ffffffffc0200ade:	0000b617          	auipc	a2,0xb
ffffffffc0200ae2:	1da60613          	addi	a2,a2,474 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0200ae6:	45d1                	li	a1,20
ffffffffc0200ae8:	0000b517          	auipc	a0,0xb
ffffffffc0200aec:	1e850513          	addi	a0,a0,488 # ffffffffc020bcd0 <commands+0x228>
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
ffffffffc0200b9a:	16a68693          	addi	a3,a3,362 # ffffffffc020bd00 <commands+0x258>
ffffffffc0200b9e:	0000b617          	auipc	a2,0xb
ffffffffc0200ba2:	11a60613          	addi	a2,a2,282 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0200ba6:	02200593          	li	a1,34
ffffffffc0200baa:	0000b517          	auipc	a0,0xb
ffffffffc0200bae:	12650513          	addi	a0,a0,294 # ffffffffc020bcd0 <commands+0x228>
ffffffffc0200bb2:	8edff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200bb6:	0000b697          	auipc	a3,0xb
ffffffffc0200bba:	17268693          	addi	a3,a3,370 # ffffffffc020bd28 <commands+0x280>
ffffffffc0200bbe:	0000b617          	auipc	a2,0xb
ffffffffc0200bc2:	0fa60613          	addi	a2,a2,250 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0200bc6:	02300593          	li	a1,35
ffffffffc0200bca:	0000b517          	auipc	a0,0xb
ffffffffc0200bce:	10650513          	addi	a0,a0,262 # ffffffffc020bcd0 <commands+0x228>
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
ffffffffc0200c30:	0d468693          	addi	a3,a3,212 # ffffffffc020bd00 <commands+0x258>
ffffffffc0200c34:	0000b617          	auipc	a2,0xb
ffffffffc0200c38:	08460613          	addi	a2,a2,132 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0200c3c:	02900593          	li	a1,41
ffffffffc0200c40:	0000b517          	auipc	a0,0xb
ffffffffc0200c44:	09050513          	addi	a0,a0,144 # ffffffffc020bcd0 <commands+0x228>
ffffffffc0200c48:	857ff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200c4c:	0000b697          	auipc	a3,0xb
ffffffffc0200c50:	0dc68693          	addi	a3,a3,220 # ffffffffc020bd28 <commands+0x280>
ffffffffc0200c54:	0000b617          	auipc	a2,0xb
ffffffffc0200c58:	06460613          	addi	a2,a2,100 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0200c5c:	02a00593          	li	a1,42
ffffffffc0200c60:	0000b517          	auipc	a0,0xb
ffffffffc0200c64:	07050513          	addi	a0,a0,112 # ffffffffc020bcd0 <commands+0x228>
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
ffffffffc0200c98:	38f0a0ef          	jal	ra,ffffffffc020b826 <memcpy>
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
ffffffffc0200cc2:	3650a0ef          	jal	ra,ffffffffc020b826 <memcpy>
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
ffffffffc0200ce4:	2f10a0ef          	jal	ra,ffffffffc020b7d4 <memset>
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
ffffffffc0200d16:	06e50513          	addi	a0,a0,110 # ffffffffc020bd80 <commands+0x2d8>
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
ffffffffc0200d38:	0a458593          	addi	a1,a1,164 # ffffffffc020bdd8 <commands+0x330>
ffffffffc0200d3c:	22d0a0ef          	jal	ra,ffffffffc020b768 <strcpy>
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
ffffffffc0200d80:	fec50513          	addi	a0,a0,-20 # ffffffffc020bd68 <commands+0x2c0>
ffffffffc0200d84:	6105                	addi	sp,sp,32
ffffffffc0200d86:	c20ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200d8a:	0000b617          	auipc	a2,0xb
ffffffffc0200d8e:	01e60613          	addi	a2,a2,30 # ffffffffc020bda8 <commands+0x300>
ffffffffc0200d92:	03200593          	li	a1,50
ffffffffc0200d96:	0000b517          	auipc	a0,0xb
ffffffffc0200d9a:	02a50513          	addi	a0,a0,42 # ffffffffc020bdc0 <commands+0x318>
ffffffffc0200d9e:	f00ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200da2 <idt_init>:
ffffffffc0200da2:	14005073          	csrwi	sscratch,0
ffffffffc0200da6:	00000797          	auipc	a5,0x0
ffffffffc0200daa:	43a78793          	addi	a5,a5,1082 # ffffffffc02011e0 <__alltraps>
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
ffffffffc0200dc8:	02450513          	addi	a0,a0,36 # ffffffffc020bde8 <commands+0x340>
ffffffffc0200dcc:	e406                	sd	ra,8(sp)
ffffffffc0200dce:	bd8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dd2:	640c                	ld	a1,8(s0)
ffffffffc0200dd4:	0000b517          	auipc	a0,0xb
ffffffffc0200dd8:	02c50513          	addi	a0,a0,44 # ffffffffc020be00 <commands+0x358>
ffffffffc0200ddc:	bcaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200de0:	680c                	ld	a1,16(s0)
ffffffffc0200de2:	0000b517          	auipc	a0,0xb
ffffffffc0200de6:	03650513          	addi	a0,a0,54 # ffffffffc020be18 <commands+0x370>
ffffffffc0200dea:	bbcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dee:	6c0c                	ld	a1,24(s0)
ffffffffc0200df0:	0000b517          	auipc	a0,0xb
ffffffffc0200df4:	04050513          	addi	a0,a0,64 # ffffffffc020be30 <commands+0x388>
ffffffffc0200df8:	baeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dfc:	700c                	ld	a1,32(s0)
ffffffffc0200dfe:	0000b517          	auipc	a0,0xb
ffffffffc0200e02:	04a50513          	addi	a0,a0,74 # ffffffffc020be48 <commands+0x3a0>
ffffffffc0200e06:	ba0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e0a:	740c                	ld	a1,40(s0)
ffffffffc0200e0c:	0000b517          	auipc	a0,0xb
ffffffffc0200e10:	05450513          	addi	a0,a0,84 # ffffffffc020be60 <commands+0x3b8>
ffffffffc0200e14:	b92ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e18:	780c                	ld	a1,48(s0)
ffffffffc0200e1a:	0000b517          	auipc	a0,0xb
ffffffffc0200e1e:	05e50513          	addi	a0,a0,94 # ffffffffc020be78 <commands+0x3d0>
ffffffffc0200e22:	b84ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e26:	7c0c                	ld	a1,56(s0)
ffffffffc0200e28:	0000b517          	auipc	a0,0xb
ffffffffc0200e2c:	06850513          	addi	a0,a0,104 # ffffffffc020be90 <commands+0x3e8>
ffffffffc0200e30:	b76ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e34:	602c                	ld	a1,64(s0)
ffffffffc0200e36:	0000b517          	auipc	a0,0xb
ffffffffc0200e3a:	07250513          	addi	a0,a0,114 # ffffffffc020bea8 <commands+0x400>
ffffffffc0200e3e:	b68ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e42:	642c                	ld	a1,72(s0)
ffffffffc0200e44:	0000b517          	auipc	a0,0xb
ffffffffc0200e48:	07c50513          	addi	a0,a0,124 # ffffffffc020bec0 <commands+0x418>
ffffffffc0200e4c:	b5aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e50:	682c                	ld	a1,80(s0)
ffffffffc0200e52:	0000b517          	auipc	a0,0xb
ffffffffc0200e56:	08650513          	addi	a0,a0,134 # ffffffffc020bed8 <commands+0x430>
ffffffffc0200e5a:	b4cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e5e:	6c2c                	ld	a1,88(s0)
ffffffffc0200e60:	0000b517          	auipc	a0,0xb
ffffffffc0200e64:	09050513          	addi	a0,a0,144 # ffffffffc020bef0 <commands+0x448>
ffffffffc0200e68:	b3eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e6c:	702c                	ld	a1,96(s0)
ffffffffc0200e6e:	0000b517          	auipc	a0,0xb
ffffffffc0200e72:	09a50513          	addi	a0,a0,154 # ffffffffc020bf08 <commands+0x460>
ffffffffc0200e76:	b30ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e7a:	742c                	ld	a1,104(s0)
ffffffffc0200e7c:	0000b517          	auipc	a0,0xb
ffffffffc0200e80:	0a450513          	addi	a0,a0,164 # ffffffffc020bf20 <commands+0x478>
ffffffffc0200e84:	b22ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e88:	782c                	ld	a1,112(s0)
ffffffffc0200e8a:	0000b517          	auipc	a0,0xb
ffffffffc0200e8e:	0ae50513          	addi	a0,a0,174 # ffffffffc020bf38 <commands+0x490>
ffffffffc0200e92:	b14ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e96:	7c2c                	ld	a1,120(s0)
ffffffffc0200e98:	0000b517          	auipc	a0,0xb
ffffffffc0200e9c:	0b850513          	addi	a0,a0,184 # ffffffffc020bf50 <commands+0x4a8>
ffffffffc0200ea0:	b06ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ea4:	604c                	ld	a1,128(s0)
ffffffffc0200ea6:	0000b517          	auipc	a0,0xb
ffffffffc0200eaa:	0c250513          	addi	a0,a0,194 # ffffffffc020bf68 <commands+0x4c0>
ffffffffc0200eae:	af8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eb2:	644c                	ld	a1,136(s0)
ffffffffc0200eb4:	0000b517          	auipc	a0,0xb
ffffffffc0200eb8:	0cc50513          	addi	a0,a0,204 # ffffffffc020bf80 <commands+0x4d8>
ffffffffc0200ebc:	aeaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ec0:	684c                	ld	a1,144(s0)
ffffffffc0200ec2:	0000b517          	auipc	a0,0xb
ffffffffc0200ec6:	0d650513          	addi	a0,a0,214 # ffffffffc020bf98 <commands+0x4f0>
ffffffffc0200eca:	adcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ece:	6c4c                	ld	a1,152(s0)
ffffffffc0200ed0:	0000b517          	auipc	a0,0xb
ffffffffc0200ed4:	0e050513          	addi	a0,a0,224 # ffffffffc020bfb0 <commands+0x508>
ffffffffc0200ed8:	aceff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200edc:	704c                	ld	a1,160(s0)
ffffffffc0200ede:	0000b517          	auipc	a0,0xb
ffffffffc0200ee2:	0ea50513          	addi	a0,a0,234 # ffffffffc020bfc8 <commands+0x520>
ffffffffc0200ee6:	ac0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eea:	744c                	ld	a1,168(s0)
ffffffffc0200eec:	0000b517          	auipc	a0,0xb
ffffffffc0200ef0:	0f450513          	addi	a0,a0,244 # ffffffffc020bfe0 <commands+0x538>
ffffffffc0200ef4:	ab2ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ef8:	784c                	ld	a1,176(s0)
ffffffffc0200efa:	0000b517          	auipc	a0,0xb
ffffffffc0200efe:	0fe50513          	addi	a0,a0,254 # ffffffffc020bff8 <commands+0x550>
ffffffffc0200f02:	aa4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f06:	7c4c                	ld	a1,184(s0)
ffffffffc0200f08:	0000b517          	auipc	a0,0xb
ffffffffc0200f0c:	10850513          	addi	a0,a0,264 # ffffffffc020c010 <commands+0x568>
ffffffffc0200f10:	a96ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f14:	606c                	ld	a1,192(s0)
ffffffffc0200f16:	0000b517          	auipc	a0,0xb
ffffffffc0200f1a:	11250513          	addi	a0,a0,274 # ffffffffc020c028 <commands+0x580>
ffffffffc0200f1e:	a88ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f22:	646c                	ld	a1,200(s0)
ffffffffc0200f24:	0000b517          	auipc	a0,0xb
ffffffffc0200f28:	11c50513          	addi	a0,a0,284 # ffffffffc020c040 <commands+0x598>
ffffffffc0200f2c:	a7aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f30:	686c                	ld	a1,208(s0)
ffffffffc0200f32:	0000b517          	auipc	a0,0xb
ffffffffc0200f36:	12650513          	addi	a0,a0,294 # ffffffffc020c058 <commands+0x5b0>
ffffffffc0200f3a:	a6cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f3e:	6c6c                	ld	a1,216(s0)
ffffffffc0200f40:	0000b517          	auipc	a0,0xb
ffffffffc0200f44:	13050513          	addi	a0,a0,304 # ffffffffc020c070 <commands+0x5c8>
ffffffffc0200f48:	a5eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f4c:	706c                	ld	a1,224(s0)
ffffffffc0200f4e:	0000b517          	auipc	a0,0xb
ffffffffc0200f52:	13a50513          	addi	a0,a0,314 # ffffffffc020c088 <commands+0x5e0>
ffffffffc0200f56:	a50ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f5a:	746c                	ld	a1,232(s0)
ffffffffc0200f5c:	0000b517          	auipc	a0,0xb
ffffffffc0200f60:	14450513          	addi	a0,a0,324 # ffffffffc020c0a0 <commands+0x5f8>
ffffffffc0200f64:	a42ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f68:	786c                	ld	a1,240(s0)
ffffffffc0200f6a:	0000b517          	auipc	a0,0xb
ffffffffc0200f6e:	14e50513          	addi	a0,a0,334 # ffffffffc020c0b8 <commands+0x610>
ffffffffc0200f72:	a34ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f76:	7c6c                	ld	a1,248(s0)
ffffffffc0200f78:	6402                	ld	s0,0(sp)
ffffffffc0200f7a:	60a2                	ld	ra,8(sp)
ffffffffc0200f7c:	0000b517          	auipc	a0,0xb
ffffffffc0200f80:	15450513          	addi	a0,a0,340 # ffffffffc020c0d0 <commands+0x628>
ffffffffc0200f84:	0141                	addi	sp,sp,16
ffffffffc0200f86:	a20ff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200f8a <print_trapframe>:
ffffffffc0200f8a:	1141                	addi	sp,sp,-16
ffffffffc0200f8c:	e022                	sd	s0,0(sp)
ffffffffc0200f8e:	85aa                	mv	a1,a0
ffffffffc0200f90:	842a                	mv	s0,a0
ffffffffc0200f92:	0000b517          	auipc	a0,0xb
ffffffffc0200f96:	15650513          	addi	a0,a0,342 # ffffffffc020c0e8 <commands+0x640>
ffffffffc0200f9a:	e406                	sd	ra,8(sp)
ffffffffc0200f9c:	a0aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fa0:	8522                	mv	a0,s0
ffffffffc0200fa2:	e1bff0ef          	jal	ra,ffffffffc0200dbc <print_regs>
ffffffffc0200fa6:	10043583          	ld	a1,256(s0)
ffffffffc0200faa:	0000b517          	auipc	a0,0xb
ffffffffc0200fae:	15650513          	addi	a0,a0,342 # ffffffffc020c100 <commands+0x658>
ffffffffc0200fb2:	9f4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fb6:	10843583          	ld	a1,264(s0)
ffffffffc0200fba:	0000b517          	auipc	a0,0xb
ffffffffc0200fbe:	15e50513          	addi	a0,a0,350 # ffffffffc020c118 <commands+0x670>
ffffffffc0200fc2:	9e4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fc6:	11043583          	ld	a1,272(s0)
ffffffffc0200fca:	0000b517          	auipc	a0,0xb
ffffffffc0200fce:	16650513          	addi	a0,a0,358 # ffffffffc020c130 <commands+0x688>
ffffffffc0200fd2:	9d4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fd6:	11843583          	ld	a1,280(s0)
ffffffffc0200fda:	6402                	ld	s0,0(sp)
ffffffffc0200fdc:	60a2                	ld	ra,8(sp)
ffffffffc0200fde:	0000b517          	auipc	a0,0xb
ffffffffc0200fe2:	16250513          	addi	a0,a0,354 # ffffffffc020c140 <commands+0x698>
ffffffffc0200fe6:	0141                	addi	sp,sp,16
ffffffffc0200fe8:	9beff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200fec <interrupt_handler>:
ffffffffc0200fec:	11853783          	ld	a5,280(a0)
ffffffffc0200ff0:	472d                	li	a4,11
ffffffffc0200ff2:	0786                	slli	a5,a5,0x1
ffffffffc0200ff4:	8385                	srli	a5,a5,0x1
ffffffffc0200ff6:	06f76c63          	bltu	a4,a5,ffffffffc020106e <interrupt_handler+0x82>
ffffffffc0200ffa:	0000b717          	auipc	a4,0xb
ffffffffc0200ffe:	1fe70713          	addi	a4,a4,510 # ffffffffc020c1f8 <commands+0x750>
ffffffffc0201002:	078a                	slli	a5,a5,0x2
ffffffffc0201004:	97ba                	add	a5,a5,a4
ffffffffc0201006:	439c                	lw	a5,0(a5)
ffffffffc0201008:	97ba                	add	a5,a5,a4
ffffffffc020100a:	8782                	jr	a5
ffffffffc020100c:	0000b517          	auipc	a0,0xb
ffffffffc0201010:	1ac50513          	addi	a0,a0,428 # ffffffffc020c1b8 <commands+0x710>
ffffffffc0201014:	992ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201018:	0000b517          	auipc	a0,0xb
ffffffffc020101c:	18050513          	addi	a0,a0,384 # ffffffffc020c198 <commands+0x6f0>
ffffffffc0201020:	986ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201024:	0000b517          	auipc	a0,0xb
ffffffffc0201028:	13450513          	addi	a0,a0,308 # ffffffffc020c158 <commands+0x6b0>
ffffffffc020102c:	97aff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201030:	0000b517          	auipc	a0,0xb
ffffffffc0201034:	14850513          	addi	a0,a0,328 # ffffffffc020c178 <commands+0x6d0>
ffffffffc0201038:	96eff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020103c:	1141                	addi	sp,sp,-16
ffffffffc020103e:	e406                	sd	ra,8(sp)
ffffffffc0201040:	d3aff0ef          	jal	ra,ffffffffc020057a <clock_set_next_event>
ffffffffc0201044:	00096717          	auipc	a4,0x96
ffffffffc0201048:	82c70713          	addi	a4,a4,-2004 # ffffffffc0296870 <ticks>
ffffffffc020104c:	631c                	ld	a5,0(a4)
ffffffffc020104e:	0785                	addi	a5,a5,1
ffffffffc0201050:	e31c                	sd	a5,0(a4)
ffffffffc0201052:	023060ef          	jal	ra,ffffffffc0207874 <run_timer_list>
ffffffffc0201056:	d9eff0ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc020105a:	60a2                	ld	ra,8(sp)
ffffffffc020105c:	0141                	addi	sp,sp,16
ffffffffc020105e:	6e70706f          	j	ffffffffc0208f44 <dev_stdin_write>
ffffffffc0201062:	0000b517          	auipc	a0,0xb
ffffffffc0201066:	17650513          	addi	a0,a0,374 # ffffffffc020c1d8 <commands+0x730>
ffffffffc020106a:	93cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020106e:	bf31                	j	ffffffffc0200f8a <print_trapframe>

ffffffffc0201070 <exception_handler>:
ffffffffc0201070:	11853783          	ld	a5,280(a0)
ffffffffc0201074:	1141                	addi	sp,sp,-16
ffffffffc0201076:	e022                	sd	s0,0(sp)
ffffffffc0201078:	e406                	sd	ra,8(sp)
ffffffffc020107a:	473d                	li	a4,15
ffffffffc020107c:	842a                	mv	s0,a0
ffffffffc020107e:	0af76b63          	bltu	a4,a5,ffffffffc0201134 <exception_handler+0xc4>
ffffffffc0201082:	0000b717          	auipc	a4,0xb
ffffffffc0201086:	33670713          	addi	a4,a4,822 # ffffffffc020c3b8 <commands+0x910>
ffffffffc020108a:	078a                	slli	a5,a5,0x2
ffffffffc020108c:	97ba                	add	a5,a5,a4
ffffffffc020108e:	439c                	lw	a5,0(a5)
ffffffffc0201090:	97ba                	add	a5,a5,a4
ffffffffc0201092:	8782                	jr	a5
ffffffffc0201094:	0000b517          	auipc	a0,0xb
ffffffffc0201098:	27c50513          	addi	a0,a0,636 # ffffffffc020c310 <commands+0x868>
ffffffffc020109c:	90aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02010a0:	10843783          	ld	a5,264(s0)
ffffffffc02010a4:	60a2                	ld	ra,8(sp)
ffffffffc02010a6:	0791                	addi	a5,a5,4
ffffffffc02010a8:	10f43423          	sd	a5,264(s0)
ffffffffc02010ac:	6402                	ld	s0,0(sp)
ffffffffc02010ae:	0141                	addi	sp,sp,16
ffffffffc02010b0:	1db0606f          	j	ffffffffc0207a8a <syscall>
ffffffffc02010b4:	0000b517          	auipc	a0,0xb
ffffffffc02010b8:	27c50513          	addi	a0,a0,636 # ffffffffc020c330 <commands+0x888>
ffffffffc02010bc:	6402                	ld	s0,0(sp)
ffffffffc02010be:	60a2                	ld	ra,8(sp)
ffffffffc02010c0:	0141                	addi	sp,sp,16
ffffffffc02010c2:	8e4ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010c6:	0000b517          	auipc	a0,0xb
ffffffffc02010ca:	28a50513          	addi	a0,a0,650 # ffffffffc020c350 <commands+0x8a8>
ffffffffc02010ce:	b7fd                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010d0:	0000b517          	auipc	a0,0xb
ffffffffc02010d4:	2a050513          	addi	a0,a0,672 # ffffffffc020c370 <commands+0x8c8>
ffffffffc02010d8:	b7d5                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010da:	0000b517          	auipc	a0,0xb
ffffffffc02010de:	2ae50513          	addi	a0,a0,686 # ffffffffc020c388 <commands+0x8e0>
ffffffffc02010e2:	bfe9                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010e4:	0000b517          	auipc	a0,0xb
ffffffffc02010e8:	2bc50513          	addi	a0,a0,700 # ffffffffc020c3a0 <commands+0x8f8>
ffffffffc02010ec:	bfc1                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010ee:	0000b517          	auipc	a0,0xb
ffffffffc02010f2:	13a50513          	addi	a0,a0,314 # ffffffffc020c228 <commands+0x780>
ffffffffc02010f6:	b7d9                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010f8:	0000b517          	auipc	a0,0xb
ffffffffc02010fc:	15050513          	addi	a0,a0,336 # ffffffffc020c248 <commands+0x7a0>
ffffffffc0201100:	bf75                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201102:	0000b517          	auipc	a0,0xb
ffffffffc0201106:	16650513          	addi	a0,a0,358 # ffffffffc020c268 <commands+0x7c0>
ffffffffc020110a:	bf4d                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc020110c:	0000b517          	auipc	a0,0xb
ffffffffc0201110:	17450513          	addi	a0,a0,372 # ffffffffc020c280 <commands+0x7d8>
ffffffffc0201114:	b765                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201116:	0000b517          	auipc	a0,0xb
ffffffffc020111a:	17a50513          	addi	a0,a0,378 # ffffffffc020c290 <commands+0x7e8>
ffffffffc020111e:	bf79                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201120:	0000b517          	auipc	a0,0xb
ffffffffc0201124:	19050513          	addi	a0,a0,400 # ffffffffc020c2b0 <commands+0x808>
ffffffffc0201128:	bf51                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc020112a:	0000b517          	auipc	a0,0xb
ffffffffc020112e:	1ce50513          	addi	a0,a0,462 # ffffffffc020c2f8 <commands+0x850>
ffffffffc0201132:	b769                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201134:	8522                	mv	a0,s0
ffffffffc0201136:	6402                	ld	s0,0(sp)
ffffffffc0201138:	60a2                	ld	ra,8(sp)
ffffffffc020113a:	0141                	addi	sp,sp,16
ffffffffc020113c:	b5b9                	j	ffffffffc0200f8a <print_trapframe>
ffffffffc020113e:	0000b617          	auipc	a2,0xb
ffffffffc0201142:	18a60613          	addi	a2,a2,394 # ffffffffc020c2c8 <commands+0x820>
ffffffffc0201146:	0b100593          	li	a1,177
ffffffffc020114a:	0000b517          	auipc	a0,0xb
ffffffffc020114e:	19650513          	addi	a0,a0,406 # ffffffffc020c2e0 <commands+0x838>
ffffffffc0201152:	b4cff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201156 <trap>:
ffffffffc0201156:	1101                	addi	sp,sp,-32
ffffffffc0201158:	e822                	sd	s0,16(sp)
ffffffffc020115a:	00095417          	auipc	s0,0x95
ffffffffc020115e:	76640413          	addi	s0,s0,1894 # ffffffffc02968c0 <current>
ffffffffc0201162:	6018                	ld	a4,0(s0)
ffffffffc0201164:	ec06                	sd	ra,24(sp)
ffffffffc0201166:	e426                	sd	s1,8(sp)
ffffffffc0201168:	e04a                	sd	s2,0(sp)
ffffffffc020116a:	11853683          	ld	a3,280(a0)
ffffffffc020116e:	cf1d                	beqz	a4,ffffffffc02011ac <trap+0x56>
ffffffffc0201170:	10053483          	ld	s1,256(a0)
ffffffffc0201174:	0a073903          	ld	s2,160(a4)
ffffffffc0201178:	f348                	sd	a0,160(a4)
ffffffffc020117a:	1004f493          	andi	s1,s1,256
ffffffffc020117e:	0206c463          	bltz	a3,ffffffffc02011a6 <trap+0x50>
ffffffffc0201182:	eefff0ef          	jal	ra,ffffffffc0201070 <exception_handler>
ffffffffc0201186:	601c                	ld	a5,0(s0)
ffffffffc0201188:	0b27b023          	sd	s2,160(a5) # 400a0 <_binary_bin_swap_img_size+0x383a0>
ffffffffc020118c:	e499                	bnez	s1,ffffffffc020119a <trap+0x44>
ffffffffc020118e:	0b07a703          	lw	a4,176(a5)
ffffffffc0201192:	8b05                	andi	a4,a4,1
ffffffffc0201194:	e329                	bnez	a4,ffffffffc02011d6 <trap+0x80>
ffffffffc0201196:	6f9c                	ld	a5,24(a5)
ffffffffc0201198:	eb85                	bnez	a5,ffffffffc02011c8 <trap+0x72>
ffffffffc020119a:	60e2                	ld	ra,24(sp)
ffffffffc020119c:	6442                	ld	s0,16(sp)
ffffffffc020119e:	64a2                	ld	s1,8(sp)
ffffffffc02011a0:	6902                	ld	s2,0(sp)
ffffffffc02011a2:	6105                	addi	sp,sp,32
ffffffffc02011a4:	8082                	ret
ffffffffc02011a6:	e47ff0ef          	jal	ra,ffffffffc0200fec <interrupt_handler>
ffffffffc02011aa:	bff1                	j	ffffffffc0201186 <trap+0x30>
ffffffffc02011ac:	0006c863          	bltz	a3,ffffffffc02011bc <trap+0x66>
ffffffffc02011b0:	6442                	ld	s0,16(sp)
ffffffffc02011b2:	60e2                	ld	ra,24(sp)
ffffffffc02011b4:	64a2                	ld	s1,8(sp)
ffffffffc02011b6:	6902                	ld	s2,0(sp)
ffffffffc02011b8:	6105                	addi	sp,sp,32
ffffffffc02011ba:	bd5d                	j	ffffffffc0201070 <exception_handler>
ffffffffc02011bc:	6442                	ld	s0,16(sp)
ffffffffc02011be:	60e2                	ld	ra,24(sp)
ffffffffc02011c0:	64a2                	ld	s1,8(sp)
ffffffffc02011c2:	6902                	ld	s2,0(sp)
ffffffffc02011c4:	6105                	addi	sp,sp,32
ffffffffc02011c6:	b51d                	j	ffffffffc0200fec <interrupt_handler>
ffffffffc02011c8:	6442                	ld	s0,16(sp)
ffffffffc02011ca:	60e2                	ld	ra,24(sp)
ffffffffc02011cc:	64a2                	ld	s1,8(sp)
ffffffffc02011ce:	6902                	ld	s2,0(sp)
ffffffffc02011d0:	6105                	addi	sp,sp,32
ffffffffc02011d2:	4960606f          	j	ffffffffc0207668 <schedule>
ffffffffc02011d6:	555d                	li	a0,-9
ffffffffc02011d8:	607040ef          	jal	ra,ffffffffc0205fde <do_exit>
ffffffffc02011dc:	601c                	ld	a5,0(s0)
ffffffffc02011de:	bf65                	j	ffffffffc0201196 <trap+0x40>

ffffffffc02011e0 <__alltraps>:
ffffffffc02011e0:	14011173          	csrrw	sp,sscratch,sp
ffffffffc02011e4:	00011463          	bnez	sp,ffffffffc02011ec <__alltraps+0xc>
ffffffffc02011e8:	14002173          	csrr	sp,sscratch
ffffffffc02011ec:	712d                	addi	sp,sp,-288
ffffffffc02011ee:	e002                	sd	zero,0(sp)
ffffffffc02011f0:	e406                	sd	ra,8(sp)
ffffffffc02011f2:	ec0e                	sd	gp,24(sp)
ffffffffc02011f4:	f012                	sd	tp,32(sp)
ffffffffc02011f6:	f416                	sd	t0,40(sp)
ffffffffc02011f8:	f81a                	sd	t1,48(sp)
ffffffffc02011fa:	fc1e                	sd	t2,56(sp)
ffffffffc02011fc:	e0a2                	sd	s0,64(sp)
ffffffffc02011fe:	e4a6                	sd	s1,72(sp)
ffffffffc0201200:	e8aa                	sd	a0,80(sp)
ffffffffc0201202:	ecae                	sd	a1,88(sp)
ffffffffc0201204:	f0b2                	sd	a2,96(sp)
ffffffffc0201206:	f4b6                	sd	a3,104(sp)
ffffffffc0201208:	f8ba                	sd	a4,112(sp)
ffffffffc020120a:	fcbe                	sd	a5,120(sp)
ffffffffc020120c:	e142                	sd	a6,128(sp)
ffffffffc020120e:	e546                	sd	a7,136(sp)
ffffffffc0201210:	e94a                	sd	s2,144(sp)
ffffffffc0201212:	ed4e                	sd	s3,152(sp)
ffffffffc0201214:	f152                	sd	s4,160(sp)
ffffffffc0201216:	f556                	sd	s5,168(sp)
ffffffffc0201218:	f95a                	sd	s6,176(sp)
ffffffffc020121a:	fd5e                	sd	s7,184(sp)
ffffffffc020121c:	e1e2                	sd	s8,192(sp)
ffffffffc020121e:	e5e6                	sd	s9,200(sp)
ffffffffc0201220:	e9ea                	sd	s10,208(sp)
ffffffffc0201222:	edee                	sd	s11,216(sp)
ffffffffc0201224:	f1f2                	sd	t3,224(sp)
ffffffffc0201226:	f5f6                	sd	t4,232(sp)
ffffffffc0201228:	f9fa                	sd	t5,240(sp)
ffffffffc020122a:	fdfe                	sd	t6,248(sp)
ffffffffc020122c:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0201230:	100024f3          	csrr	s1,sstatus
ffffffffc0201234:	14102973          	csrr	s2,sepc
ffffffffc0201238:	143029f3          	csrr	s3,stval
ffffffffc020123c:	14202a73          	csrr	s4,scause
ffffffffc0201240:	e822                	sd	s0,16(sp)
ffffffffc0201242:	e226                	sd	s1,256(sp)
ffffffffc0201244:	e64a                	sd	s2,264(sp)
ffffffffc0201246:	ea4e                	sd	s3,272(sp)
ffffffffc0201248:	ee52                	sd	s4,280(sp)
ffffffffc020124a:	850a                	mv	a0,sp
ffffffffc020124c:	f0bff0ef          	jal	ra,ffffffffc0201156 <trap>

ffffffffc0201250 <__trapret>:
ffffffffc0201250:	6492                	ld	s1,256(sp)
ffffffffc0201252:	6932                	ld	s2,264(sp)
ffffffffc0201254:	1004f413          	andi	s0,s1,256
ffffffffc0201258:	e401                	bnez	s0,ffffffffc0201260 <__trapret+0x10>
ffffffffc020125a:	1200                	addi	s0,sp,288
ffffffffc020125c:	14041073          	csrw	sscratch,s0
ffffffffc0201260:	10049073          	csrw	sstatus,s1
ffffffffc0201264:	14191073          	csrw	sepc,s2
ffffffffc0201268:	60a2                	ld	ra,8(sp)
ffffffffc020126a:	61e2                	ld	gp,24(sp)
ffffffffc020126c:	7202                	ld	tp,32(sp)
ffffffffc020126e:	72a2                	ld	t0,40(sp)
ffffffffc0201270:	7342                	ld	t1,48(sp)
ffffffffc0201272:	73e2                	ld	t2,56(sp)
ffffffffc0201274:	6406                	ld	s0,64(sp)
ffffffffc0201276:	64a6                	ld	s1,72(sp)
ffffffffc0201278:	6546                	ld	a0,80(sp)
ffffffffc020127a:	65e6                	ld	a1,88(sp)
ffffffffc020127c:	7606                	ld	a2,96(sp)
ffffffffc020127e:	76a6                	ld	a3,104(sp)
ffffffffc0201280:	7746                	ld	a4,112(sp)
ffffffffc0201282:	77e6                	ld	a5,120(sp)
ffffffffc0201284:	680a                	ld	a6,128(sp)
ffffffffc0201286:	68aa                	ld	a7,136(sp)
ffffffffc0201288:	694a                	ld	s2,144(sp)
ffffffffc020128a:	69ea                	ld	s3,152(sp)
ffffffffc020128c:	7a0a                	ld	s4,160(sp)
ffffffffc020128e:	7aaa                	ld	s5,168(sp)
ffffffffc0201290:	7b4a                	ld	s6,176(sp)
ffffffffc0201292:	7bea                	ld	s7,184(sp)
ffffffffc0201294:	6c0e                	ld	s8,192(sp)
ffffffffc0201296:	6cae                	ld	s9,200(sp)
ffffffffc0201298:	6d4e                	ld	s10,208(sp)
ffffffffc020129a:	6dee                	ld	s11,216(sp)
ffffffffc020129c:	7e0e                	ld	t3,224(sp)
ffffffffc020129e:	7eae                	ld	t4,232(sp)
ffffffffc02012a0:	7f4e                	ld	t5,240(sp)
ffffffffc02012a2:	7fee                	ld	t6,248(sp)
ffffffffc02012a4:	6142                	ld	sp,16(sp)
ffffffffc02012a6:	10200073          	sret

ffffffffc02012aa <forkrets>:
ffffffffc02012aa:	812a                	mv	sp,a0
ffffffffc02012ac:	b755                	j	ffffffffc0201250 <__trapret>

ffffffffc02012ae <default_init>:
ffffffffc02012ae:	00090797          	auipc	a5,0x90
ffffffffc02012b2:	4fa78793          	addi	a5,a5,1274 # ffffffffc02917a8 <free_area>
ffffffffc02012b6:	e79c                	sd	a5,8(a5)
ffffffffc02012b8:	e39c                	sd	a5,0(a5)
ffffffffc02012ba:	0007a823          	sw	zero,16(a5)
ffffffffc02012be:	8082                	ret

ffffffffc02012c0 <default_nr_free_pages>:
ffffffffc02012c0:	00090517          	auipc	a0,0x90
ffffffffc02012c4:	4f856503          	lwu	a0,1272(a0) # ffffffffc02917b8 <free_area+0x10>
ffffffffc02012c8:	8082                	ret

ffffffffc02012ca <default_check>:
ffffffffc02012ca:	715d                	addi	sp,sp,-80
ffffffffc02012cc:	e0a2                	sd	s0,64(sp)
ffffffffc02012ce:	00090417          	auipc	s0,0x90
ffffffffc02012d2:	4da40413          	addi	s0,s0,1242 # ffffffffc02917a8 <free_area>
ffffffffc02012d6:	641c                	ld	a5,8(s0)
ffffffffc02012d8:	e486                	sd	ra,72(sp)
ffffffffc02012da:	fc26                	sd	s1,56(sp)
ffffffffc02012dc:	f84a                	sd	s2,48(sp)
ffffffffc02012de:	f44e                	sd	s3,40(sp)
ffffffffc02012e0:	f052                	sd	s4,32(sp)
ffffffffc02012e2:	ec56                	sd	s5,24(sp)
ffffffffc02012e4:	e85a                	sd	s6,16(sp)
ffffffffc02012e6:	e45e                	sd	s7,8(sp)
ffffffffc02012e8:	e062                	sd	s8,0(sp)
ffffffffc02012ea:	2a878d63          	beq	a5,s0,ffffffffc02015a4 <default_check+0x2da>
ffffffffc02012ee:	4481                	li	s1,0
ffffffffc02012f0:	4901                	li	s2,0
ffffffffc02012f2:	ff07b703          	ld	a4,-16(a5)
ffffffffc02012f6:	8b09                	andi	a4,a4,2
ffffffffc02012f8:	2a070a63          	beqz	a4,ffffffffc02015ac <default_check+0x2e2>
ffffffffc02012fc:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201300:	679c                	ld	a5,8(a5)
ffffffffc0201302:	2905                	addiw	s2,s2,1
ffffffffc0201304:	9cb9                	addw	s1,s1,a4
ffffffffc0201306:	fe8796e3          	bne	a5,s0,ffffffffc02012f2 <default_check+0x28>
ffffffffc020130a:	89a6                	mv	s3,s1
ffffffffc020130c:	6df000ef          	jal	ra,ffffffffc02021ea <nr_free_pages>
ffffffffc0201310:	6f351e63          	bne	a0,s3,ffffffffc0201a0c <default_check+0x742>
ffffffffc0201314:	4505                	li	a0,1
ffffffffc0201316:	657000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020131a:	8aaa                	mv	s5,a0
ffffffffc020131c:	42050863          	beqz	a0,ffffffffc020174c <default_check+0x482>
ffffffffc0201320:	4505                	li	a0,1
ffffffffc0201322:	64b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201326:	89aa                	mv	s3,a0
ffffffffc0201328:	70050263          	beqz	a0,ffffffffc0201a2c <default_check+0x762>
ffffffffc020132c:	4505                	li	a0,1
ffffffffc020132e:	63f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201332:	8a2a                	mv	s4,a0
ffffffffc0201334:	48050c63          	beqz	a0,ffffffffc02017cc <default_check+0x502>
ffffffffc0201338:	293a8a63          	beq	s5,s3,ffffffffc02015cc <default_check+0x302>
ffffffffc020133c:	28aa8863          	beq	s5,a0,ffffffffc02015cc <default_check+0x302>
ffffffffc0201340:	28a98663          	beq	s3,a0,ffffffffc02015cc <default_check+0x302>
ffffffffc0201344:	000aa783          	lw	a5,0(s5)
ffffffffc0201348:	2a079263          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc020134c:	0009a783          	lw	a5,0(s3)
ffffffffc0201350:	28079e63          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc0201354:	411c                	lw	a5,0(a0)
ffffffffc0201356:	28079b63          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc020135a:	00095797          	auipc	a5,0x95
ffffffffc020135e:	54e7b783          	ld	a5,1358(a5) # ffffffffc02968a8 <pages>
ffffffffc0201362:	40fa8733          	sub	a4,s5,a5
ffffffffc0201366:	0000f617          	auipc	a2,0xf
ffffffffc020136a:	c7a63603          	ld	a2,-902(a2) # ffffffffc020ffe0 <nbase>
ffffffffc020136e:	8719                	srai	a4,a4,0x6
ffffffffc0201370:	9732                	add	a4,a4,a2
ffffffffc0201372:	00095697          	auipc	a3,0x95
ffffffffc0201376:	52e6b683          	ld	a3,1326(a3) # ffffffffc02968a0 <npage>
ffffffffc020137a:	06b2                	slli	a3,a3,0xc
ffffffffc020137c:	0732                	slli	a4,a4,0xc
ffffffffc020137e:	28d77763          	bgeu	a4,a3,ffffffffc020160c <default_check+0x342>
ffffffffc0201382:	40f98733          	sub	a4,s3,a5
ffffffffc0201386:	8719                	srai	a4,a4,0x6
ffffffffc0201388:	9732                	add	a4,a4,a2
ffffffffc020138a:	0732                	slli	a4,a4,0xc
ffffffffc020138c:	4cd77063          	bgeu	a4,a3,ffffffffc020184c <default_check+0x582>
ffffffffc0201390:	40f507b3          	sub	a5,a0,a5
ffffffffc0201394:	8799                	srai	a5,a5,0x6
ffffffffc0201396:	97b2                	add	a5,a5,a2
ffffffffc0201398:	07b2                	slli	a5,a5,0xc
ffffffffc020139a:	30d7f963          	bgeu	a5,a3,ffffffffc02016ac <default_check+0x3e2>
ffffffffc020139e:	4505                	li	a0,1
ffffffffc02013a0:	00043c03          	ld	s8,0(s0)
ffffffffc02013a4:	00843b83          	ld	s7,8(s0)
ffffffffc02013a8:	01042b03          	lw	s6,16(s0)
ffffffffc02013ac:	e400                	sd	s0,8(s0)
ffffffffc02013ae:	e000                	sd	s0,0(s0)
ffffffffc02013b0:	00090797          	auipc	a5,0x90
ffffffffc02013b4:	4007a423          	sw	zero,1032(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc02013b8:	5b5000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013bc:	2c051863          	bnez	a0,ffffffffc020168c <default_check+0x3c2>
ffffffffc02013c0:	4585                	li	a1,1
ffffffffc02013c2:	8556                	mv	a0,s5
ffffffffc02013c4:	5e7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013c8:	4585                	li	a1,1
ffffffffc02013ca:	854e                	mv	a0,s3
ffffffffc02013cc:	5df000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013d0:	4585                	li	a1,1
ffffffffc02013d2:	8552                	mv	a0,s4
ffffffffc02013d4:	5d7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013d8:	4818                	lw	a4,16(s0)
ffffffffc02013da:	478d                	li	a5,3
ffffffffc02013dc:	28f71863          	bne	a4,a5,ffffffffc020166c <default_check+0x3a2>
ffffffffc02013e0:	4505                	li	a0,1
ffffffffc02013e2:	58b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013e6:	89aa                	mv	s3,a0
ffffffffc02013e8:	26050263          	beqz	a0,ffffffffc020164c <default_check+0x382>
ffffffffc02013ec:	4505                	li	a0,1
ffffffffc02013ee:	57f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013f2:	8aaa                	mv	s5,a0
ffffffffc02013f4:	3a050c63          	beqz	a0,ffffffffc02017ac <default_check+0x4e2>
ffffffffc02013f8:	4505                	li	a0,1
ffffffffc02013fa:	573000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013fe:	8a2a                	mv	s4,a0
ffffffffc0201400:	38050663          	beqz	a0,ffffffffc020178c <default_check+0x4c2>
ffffffffc0201404:	4505                	li	a0,1
ffffffffc0201406:	567000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020140a:	36051163          	bnez	a0,ffffffffc020176c <default_check+0x4a2>
ffffffffc020140e:	4585                	li	a1,1
ffffffffc0201410:	854e                	mv	a0,s3
ffffffffc0201412:	599000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201416:	641c                	ld	a5,8(s0)
ffffffffc0201418:	20878a63          	beq	a5,s0,ffffffffc020162c <default_check+0x362>
ffffffffc020141c:	4505                	li	a0,1
ffffffffc020141e:	54f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201422:	30a99563          	bne	s3,a0,ffffffffc020172c <default_check+0x462>
ffffffffc0201426:	4505                	li	a0,1
ffffffffc0201428:	545000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020142c:	2e051063          	bnez	a0,ffffffffc020170c <default_check+0x442>
ffffffffc0201430:	481c                	lw	a5,16(s0)
ffffffffc0201432:	2a079d63          	bnez	a5,ffffffffc02016ec <default_check+0x422>
ffffffffc0201436:	854e                	mv	a0,s3
ffffffffc0201438:	4585                	li	a1,1
ffffffffc020143a:	01843023          	sd	s8,0(s0)
ffffffffc020143e:	01743423          	sd	s7,8(s0)
ffffffffc0201442:	01642823          	sw	s6,16(s0)
ffffffffc0201446:	565000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020144a:	4585                	li	a1,1
ffffffffc020144c:	8556                	mv	a0,s5
ffffffffc020144e:	55d000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201452:	4585                	li	a1,1
ffffffffc0201454:	8552                	mv	a0,s4
ffffffffc0201456:	555000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020145a:	4515                	li	a0,5
ffffffffc020145c:	511000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201460:	89aa                	mv	s3,a0
ffffffffc0201462:	26050563          	beqz	a0,ffffffffc02016cc <default_check+0x402>
ffffffffc0201466:	651c                	ld	a5,8(a0)
ffffffffc0201468:	8385                	srli	a5,a5,0x1
ffffffffc020146a:	8b85                	andi	a5,a5,1
ffffffffc020146c:	54079063          	bnez	a5,ffffffffc02019ac <default_check+0x6e2>
ffffffffc0201470:	4505                	li	a0,1
ffffffffc0201472:	00043b03          	ld	s6,0(s0)
ffffffffc0201476:	00843a83          	ld	s5,8(s0)
ffffffffc020147a:	e000                	sd	s0,0(s0)
ffffffffc020147c:	e400                	sd	s0,8(s0)
ffffffffc020147e:	4ef000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201482:	50051563          	bnez	a0,ffffffffc020198c <default_check+0x6c2>
ffffffffc0201486:	08098a13          	addi	s4,s3,128
ffffffffc020148a:	8552                	mv	a0,s4
ffffffffc020148c:	458d                	li	a1,3
ffffffffc020148e:	01042b83          	lw	s7,16(s0)
ffffffffc0201492:	00090797          	auipc	a5,0x90
ffffffffc0201496:	3207a323          	sw	zero,806(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc020149a:	511000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020149e:	4511                	li	a0,4
ffffffffc02014a0:	4cd000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014a4:	4c051463          	bnez	a0,ffffffffc020196c <default_check+0x6a2>
ffffffffc02014a8:	0889b783          	ld	a5,136(s3)
ffffffffc02014ac:	8385                	srli	a5,a5,0x1
ffffffffc02014ae:	8b85                	andi	a5,a5,1
ffffffffc02014b0:	48078e63          	beqz	a5,ffffffffc020194c <default_check+0x682>
ffffffffc02014b4:	0909a703          	lw	a4,144(s3)
ffffffffc02014b8:	478d                	li	a5,3
ffffffffc02014ba:	48f71963          	bne	a4,a5,ffffffffc020194c <default_check+0x682>
ffffffffc02014be:	450d                	li	a0,3
ffffffffc02014c0:	4ad000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014c4:	8c2a                	mv	s8,a0
ffffffffc02014c6:	46050363          	beqz	a0,ffffffffc020192c <default_check+0x662>
ffffffffc02014ca:	4505                	li	a0,1
ffffffffc02014cc:	4a1000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014d0:	42051e63          	bnez	a0,ffffffffc020190c <default_check+0x642>
ffffffffc02014d4:	418a1c63          	bne	s4,s8,ffffffffc02018ec <default_check+0x622>
ffffffffc02014d8:	4585                	li	a1,1
ffffffffc02014da:	854e                	mv	a0,s3
ffffffffc02014dc:	4cf000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02014e0:	458d                	li	a1,3
ffffffffc02014e2:	8552                	mv	a0,s4
ffffffffc02014e4:	4c7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02014e8:	0089b783          	ld	a5,8(s3)
ffffffffc02014ec:	04098c13          	addi	s8,s3,64
ffffffffc02014f0:	8385                	srli	a5,a5,0x1
ffffffffc02014f2:	8b85                	andi	a5,a5,1
ffffffffc02014f4:	3c078c63          	beqz	a5,ffffffffc02018cc <default_check+0x602>
ffffffffc02014f8:	0109a703          	lw	a4,16(s3)
ffffffffc02014fc:	4785                	li	a5,1
ffffffffc02014fe:	3cf71763          	bne	a4,a5,ffffffffc02018cc <default_check+0x602>
ffffffffc0201502:	008a3783          	ld	a5,8(s4)
ffffffffc0201506:	8385                	srli	a5,a5,0x1
ffffffffc0201508:	8b85                	andi	a5,a5,1
ffffffffc020150a:	3a078163          	beqz	a5,ffffffffc02018ac <default_check+0x5e2>
ffffffffc020150e:	010a2703          	lw	a4,16(s4)
ffffffffc0201512:	478d                	li	a5,3
ffffffffc0201514:	38f71c63          	bne	a4,a5,ffffffffc02018ac <default_check+0x5e2>
ffffffffc0201518:	4505                	li	a0,1
ffffffffc020151a:	453000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020151e:	36a99763          	bne	s3,a0,ffffffffc020188c <default_check+0x5c2>
ffffffffc0201522:	4585                	li	a1,1
ffffffffc0201524:	487000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201528:	4509                	li	a0,2
ffffffffc020152a:	443000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020152e:	32aa1f63          	bne	s4,a0,ffffffffc020186c <default_check+0x5a2>
ffffffffc0201532:	4589                	li	a1,2
ffffffffc0201534:	477000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201538:	4585                	li	a1,1
ffffffffc020153a:	8562                	mv	a0,s8
ffffffffc020153c:	46f000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201540:	4515                	li	a0,5
ffffffffc0201542:	42b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201546:	89aa                	mv	s3,a0
ffffffffc0201548:	48050263          	beqz	a0,ffffffffc02019cc <default_check+0x702>
ffffffffc020154c:	4505                	li	a0,1
ffffffffc020154e:	41f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201552:	2c051d63          	bnez	a0,ffffffffc020182c <default_check+0x562>
ffffffffc0201556:	481c                	lw	a5,16(s0)
ffffffffc0201558:	2a079a63          	bnez	a5,ffffffffc020180c <default_check+0x542>
ffffffffc020155c:	4595                	li	a1,5
ffffffffc020155e:	854e                	mv	a0,s3
ffffffffc0201560:	01742823          	sw	s7,16(s0)
ffffffffc0201564:	01643023          	sd	s6,0(s0)
ffffffffc0201568:	01543423          	sd	s5,8(s0)
ffffffffc020156c:	43f000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201570:	641c                	ld	a5,8(s0)
ffffffffc0201572:	00878963          	beq	a5,s0,ffffffffc0201584 <default_check+0x2ba>
ffffffffc0201576:	ff87a703          	lw	a4,-8(a5)
ffffffffc020157a:	679c                	ld	a5,8(a5)
ffffffffc020157c:	397d                	addiw	s2,s2,-1
ffffffffc020157e:	9c99                	subw	s1,s1,a4
ffffffffc0201580:	fe879be3          	bne	a5,s0,ffffffffc0201576 <default_check+0x2ac>
ffffffffc0201584:	26091463          	bnez	s2,ffffffffc02017ec <default_check+0x522>
ffffffffc0201588:	46049263          	bnez	s1,ffffffffc02019ec <default_check+0x722>
ffffffffc020158c:	60a6                	ld	ra,72(sp)
ffffffffc020158e:	6406                	ld	s0,64(sp)
ffffffffc0201590:	74e2                	ld	s1,56(sp)
ffffffffc0201592:	7942                	ld	s2,48(sp)
ffffffffc0201594:	79a2                	ld	s3,40(sp)
ffffffffc0201596:	7a02                	ld	s4,32(sp)
ffffffffc0201598:	6ae2                	ld	s5,24(sp)
ffffffffc020159a:	6b42                	ld	s6,16(sp)
ffffffffc020159c:	6ba2                	ld	s7,8(sp)
ffffffffc020159e:	6c02                	ld	s8,0(sp)
ffffffffc02015a0:	6161                	addi	sp,sp,80
ffffffffc02015a2:	8082                	ret
ffffffffc02015a4:	4981                	li	s3,0
ffffffffc02015a6:	4481                	li	s1,0
ffffffffc02015a8:	4901                	li	s2,0
ffffffffc02015aa:	b38d                	j	ffffffffc020130c <default_check+0x42>
ffffffffc02015ac:	0000b697          	auipc	a3,0xb
ffffffffc02015b0:	e4c68693          	addi	a3,a3,-436 # ffffffffc020c3f8 <commands+0x950>
ffffffffc02015b4:	0000a617          	auipc	a2,0xa
ffffffffc02015b8:	70460613          	addi	a2,a2,1796 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02015bc:	0ef00593          	li	a1,239
ffffffffc02015c0:	0000b517          	auipc	a0,0xb
ffffffffc02015c4:	e4850513          	addi	a0,a0,-440 # ffffffffc020c408 <commands+0x960>
ffffffffc02015c8:	ed7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02015cc:	0000b697          	auipc	a3,0xb
ffffffffc02015d0:	ed468693          	addi	a3,a3,-300 # ffffffffc020c4a0 <commands+0x9f8>
ffffffffc02015d4:	0000a617          	auipc	a2,0xa
ffffffffc02015d8:	6e460613          	addi	a2,a2,1764 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02015dc:	0bc00593          	li	a1,188
ffffffffc02015e0:	0000b517          	auipc	a0,0xb
ffffffffc02015e4:	e2850513          	addi	a0,a0,-472 # ffffffffc020c408 <commands+0x960>
ffffffffc02015e8:	eb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02015ec:	0000b697          	auipc	a3,0xb
ffffffffc02015f0:	edc68693          	addi	a3,a3,-292 # ffffffffc020c4c8 <commands+0xa20>
ffffffffc02015f4:	0000a617          	auipc	a2,0xa
ffffffffc02015f8:	6c460613          	addi	a2,a2,1732 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02015fc:	0bd00593          	li	a1,189
ffffffffc0201600:	0000b517          	auipc	a0,0xb
ffffffffc0201604:	e0850513          	addi	a0,a0,-504 # ffffffffc020c408 <commands+0x960>
ffffffffc0201608:	e97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020160c:	0000b697          	auipc	a3,0xb
ffffffffc0201610:	efc68693          	addi	a3,a3,-260 # ffffffffc020c508 <commands+0xa60>
ffffffffc0201614:	0000a617          	auipc	a2,0xa
ffffffffc0201618:	6a460613          	addi	a2,a2,1700 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020161c:	0bf00593          	li	a1,191
ffffffffc0201620:	0000b517          	auipc	a0,0xb
ffffffffc0201624:	de850513          	addi	a0,a0,-536 # ffffffffc020c408 <commands+0x960>
ffffffffc0201628:	e77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020162c:	0000b697          	auipc	a3,0xb
ffffffffc0201630:	f6468693          	addi	a3,a3,-156 # ffffffffc020c590 <commands+0xae8>
ffffffffc0201634:	0000a617          	auipc	a2,0xa
ffffffffc0201638:	68460613          	addi	a2,a2,1668 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020163c:	0d800593          	li	a1,216
ffffffffc0201640:	0000b517          	auipc	a0,0xb
ffffffffc0201644:	dc850513          	addi	a0,a0,-568 # ffffffffc020c408 <commands+0x960>
ffffffffc0201648:	e57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020164c:	0000b697          	auipc	a3,0xb
ffffffffc0201650:	df468693          	addi	a3,a3,-524 # ffffffffc020c440 <commands+0x998>
ffffffffc0201654:	0000a617          	auipc	a2,0xa
ffffffffc0201658:	66460613          	addi	a2,a2,1636 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020165c:	0d100593          	li	a1,209
ffffffffc0201660:	0000b517          	auipc	a0,0xb
ffffffffc0201664:	da850513          	addi	a0,a0,-600 # ffffffffc020c408 <commands+0x960>
ffffffffc0201668:	e37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020166c:	0000b697          	auipc	a3,0xb
ffffffffc0201670:	f1468693          	addi	a3,a3,-236 # ffffffffc020c580 <commands+0xad8>
ffffffffc0201674:	0000a617          	auipc	a2,0xa
ffffffffc0201678:	64460613          	addi	a2,a2,1604 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020167c:	0cf00593          	li	a1,207
ffffffffc0201680:	0000b517          	auipc	a0,0xb
ffffffffc0201684:	d8850513          	addi	a0,a0,-632 # ffffffffc020c408 <commands+0x960>
ffffffffc0201688:	e17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020168c:	0000b697          	auipc	a3,0xb
ffffffffc0201690:	edc68693          	addi	a3,a3,-292 # ffffffffc020c568 <commands+0xac0>
ffffffffc0201694:	0000a617          	auipc	a2,0xa
ffffffffc0201698:	62460613          	addi	a2,a2,1572 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020169c:	0ca00593          	li	a1,202
ffffffffc02016a0:	0000b517          	auipc	a0,0xb
ffffffffc02016a4:	d6850513          	addi	a0,a0,-664 # ffffffffc020c408 <commands+0x960>
ffffffffc02016a8:	df7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016ac:	0000b697          	auipc	a3,0xb
ffffffffc02016b0:	e9c68693          	addi	a3,a3,-356 # ffffffffc020c548 <commands+0xaa0>
ffffffffc02016b4:	0000a617          	auipc	a2,0xa
ffffffffc02016b8:	60460613          	addi	a2,a2,1540 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02016bc:	0c100593          	li	a1,193
ffffffffc02016c0:	0000b517          	auipc	a0,0xb
ffffffffc02016c4:	d4850513          	addi	a0,a0,-696 # ffffffffc020c408 <commands+0x960>
ffffffffc02016c8:	dd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016cc:	0000b697          	auipc	a3,0xb
ffffffffc02016d0:	f0c68693          	addi	a3,a3,-244 # ffffffffc020c5d8 <commands+0xb30>
ffffffffc02016d4:	0000a617          	auipc	a2,0xa
ffffffffc02016d8:	5e460613          	addi	a2,a2,1508 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02016dc:	0f700593          	li	a1,247
ffffffffc02016e0:	0000b517          	auipc	a0,0xb
ffffffffc02016e4:	d2850513          	addi	a0,a0,-728 # ffffffffc020c408 <commands+0x960>
ffffffffc02016e8:	db7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016ec:	0000b697          	auipc	a3,0xb
ffffffffc02016f0:	edc68693          	addi	a3,a3,-292 # ffffffffc020c5c8 <commands+0xb20>
ffffffffc02016f4:	0000a617          	auipc	a2,0xa
ffffffffc02016f8:	5c460613          	addi	a2,a2,1476 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02016fc:	0de00593          	li	a1,222
ffffffffc0201700:	0000b517          	auipc	a0,0xb
ffffffffc0201704:	d0850513          	addi	a0,a0,-760 # ffffffffc020c408 <commands+0x960>
ffffffffc0201708:	d97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020170c:	0000b697          	auipc	a3,0xb
ffffffffc0201710:	e5c68693          	addi	a3,a3,-420 # ffffffffc020c568 <commands+0xac0>
ffffffffc0201714:	0000a617          	auipc	a2,0xa
ffffffffc0201718:	5a460613          	addi	a2,a2,1444 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020171c:	0dc00593          	li	a1,220
ffffffffc0201720:	0000b517          	auipc	a0,0xb
ffffffffc0201724:	ce850513          	addi	a0,a0,-792 # ffffffffc020c408 <commands+0x960>
ffffffffc0201728:	d77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020172c:	0000b697          	auipc	a3,0xb
ffffffffc0201730:	e7c68693          	addi	a3,a3,-388 # ffffffffc020c5a8 <commands+0xb00>
ffffffffc0201734:	0000a617          	auipc	a2,0xa
ffffffffc0201738:	58460613          	addi	a2,a2,1412 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020173c:	0db00593          	li	a1,219
ffffffffc0201740:	0000b517          	auipc	a0,0xb
ffffffffc0201744:	cc850513          	addi	a0,a0,-824 # ffffffffc020c408 <commands+0x960>
ffffffffc0201748:	d57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020174c:	0000b697          	auipc	a3,0xb
ffffffffc0201750:	cf468693          	addi	a3,a3,-780 # ffffffffc020c440 <commands+0x998>
ffffffffc0201754:	0000a617          	auipc	a2,0xa
ffffffffc0201758:	56460613          	addi	a2,a2,1380 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020175c:	0b800593          	li	a1,184
ffffffffc0201760:	0000b517          	auipc	a0,0xb
ffffffffc0201764:	ca850513          	addi	a0,a0,-856 # ffffffffc020c408 <commands+0x960>
ffffffffc0201768:	d37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020176c:	0000b697          	auipc	a3,0xb
ffffffffc0201770:	dfc68693          	addi	a3,a3,-516 # ffffffffc020c568 <commands+0xac0>
ffffffffc0201774:	0000a617          	auipc	a2,0xa
ffffffffc0201778:	54460613          	addi	a2,a2,1348 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020177c:	0d500593          	li	a1,213
ffffffffc0201780:	0000b517          	auipc	a0,0xb
ffffffffc0201784:	c8850513          	addi	a0,a0,-888 # ffffffffc020c408 <commands+0x960>
ffffffffc0201788:	d17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020178c:	0000b697          	auipc	a3,0xb
ffffffffc0201790:	cf468693          	addi	a3,a3,-780 # ffffffffc020c480 <commands+0x9d8>
ffffffffc0201794:	0000a617          	auipc	a2,0xa
ffffffffc0201798:	52460613          	addi	a2,a2,1316 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020179c:	0d300593          	li	a1,211
ffffffffc02017a0:	0000b517          	auipc	a0,0xb
ffffffffc02017a4:	c6850513          	addi	a0,a0,-920 # ffffffffc020c408 <commands+0x960>
ffffffffc02017a8:	cf7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017ac:	0000b697          	auipc	a3,0xb
ffffffffc02017b0:	cb468693          	addi	a3,a3,-844 # ffffffffc020c460 <commands+0x9b8>
ffffffffc02017b4:	0000a617          	auipc	a2,0xa
ffffffffc02017b8:	50460613          	addi	a2,a2,1284 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02017bc:	0d200593          	li	a1,210
ffffffffc02017c0:	0000b517          	auipc	a0,0xb
ffffffffc02017c4:	c4850513          	addi	a0,a0,-952 # ffffffffc020c408 <commands+0x960>
ffffffffc02017c8:	cd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017cc:	0000b697          	auipc	a3,0xb
ffffffffc02017d0:	cb468693          	addi	a3,a3,-844 # ffffffffc020c480 <commands+0x9d8>
ffffffffc02017d4:	0000a617          	auipc	a2,0xa
ffffffffc02017d8:	4e460613          	addi	a2,a2,1252 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02017dc:	0ba00593          	li	a1,186
ffffffffc02017e0:	0000b517          	auipc	a0,0xb
ffffffffc02017e4:	c2850513          	addi	a0,a0,-984 # ffffffffc020c408 <commands+0x960>
ffffffffc02017e8:	cb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017ec:	0000b697          	auipc	a3,0xb
ffffffffc02017f0:	f3c68693          	addi	a3,a3,-196 # ffffffffc020c728 <commands+0xc80>
ffffffffc02017f4:	0000a617          	auipc	a2,0xa
ffffffffc02017f8:	4c460613          	addi	a2,a2,1220 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02017fc:	12400593          	li	a1,292
ffffffffc0201800:	0000b517          	auipc	a0,0xb
ffffffffc0201804:	c0850513          	addi	a0,a0,-1016 # ffffffffc020c408 <commands+0x960>
ffffffffc0201808:	c97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020180c:	0000b697          	auipc	a3,0xb
ffffffffc0201810:	dbc68693          	addi	a3,a3,-580 # ffffffffc020c5c8 <commands+0xb20>
ffffffffc0201814:	0000a617          	auipc	a2,0xa
ffffffffc0201818:	4a460613          	addi	a2,a2,1188 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020181c:	11900593          	li	a1,281
ffffffffc0201820:	0000b517          	auipc	a0,0xb
ffffffffc0201824:	be850513          	addi	a0,a0,-1048 # ffffffffc020c408 <commands+0x960>
ffffffffc0201828:	c77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020182c:	0000b697          	auipc	a3,0xb
ffffffffc0201830:	d3c68693          	addi	a3,a3,-708 # ffffffffc020c568 <commands+0xac0>
ffffffffc0201834:	0000a617          	auipc	a2,0xa
ffffffffc0201838:	48460613          	addi	a2,a2,1156 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020183c:	11700593          	li	a1,279
ffffffffc0201840:	0000b517          	auipc	a0,0xb
ffffffffc0201844:	bc850513          	addi	a0,a0,-1080 # ffffffffc020c408 <commands+0x960>
ffffffffc0201848:	c57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020184c:	0000b697          	auipc	a3,0xb
ffffffffc0201850:	cdc68693          	addi	a3,a3,-804 # ffffffffc020c528 <commands+0xa80>
ffffffffc0201854:	0000a617          	auipc	a2,0xa
ffffffffc0201858:	46460613          	addi	a2,a2,1124 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020185c:	0c000593          	li	a1,192
ffffffffc0201860:	0000b517          	auipc	a0,0xb
ffffffffc0201864:	ba850513          	addi	a0,a0,-1112 # ffffffffc020c408 <commands+0x960>
ffffffffc0201868:	c37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020186c:	0000b697          	auipc	a3,0xb
ffffffffc0201870:	e7c68693          	addi	a3,a3,-388 # ffffffffc020c6e8 <commands+0xc40>
ffffffffc0201874:	0000a617          	auipc	a2,0xa
ffffffffc0201878:	44460613          	addi	a2,a2,1092 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020187c:	11100593          	li	a1,273
ffffffffc0201880:	0000b517          	auipc	a0,0xb
ffffffffc0201884:	b8850513          	addi	a0,a0,-1144 # ffffffffc020c408 <commands+0x960>
ffffffffc0201888:	c17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020188c:	0000b697          	auipc	a3,0xb
ffffffffc0201890:	e3c68693          	addi	a3,a3,-452 # ffffffffc020c6c8 <commands+0xc20>
ffffffffc0201894:	0000a617          	auipc	a2,0xa
ffffffffc0201898:	42460613          	addi	a2,a2,1060 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020189c:	10f00593          	li	a1,271
ffffffffc02018a0:	0000b517          	auipc	a0,0xb
ffffffffc02018a4:	b6850513          	addi	a0,a0,-1176 # ffffffffc020c408 <commands+0x960>
ffffffffc02018a8:	bf7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018ac:	0000b697          	auipc	a3,0xb
ffffffffc02018b0:	df468693          	addi	a3,a3,-524 # ffffffffc020c6a0 <commands+0xbf8>
ffffffffc02018b4:	0000a617          	auipc	a2,0xa
ffffffffc02018b8:	40460613          	addi	a2,a2,1028 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02018bc:	10d00593          	li	a1,269
ffffffffc02018c0:	0000b517          	auipc	a0,0xb
ffffffffc02018c4:	b4850513          	addi	a0,a0,-1208 # ffffffffc020c408 <commands+0x960>
ffffffffc02018c8:	bd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018cc:	0000b697          	auipc	a3,0xb
ffffffffc02018d0:	dac68693          	addi	a3,a3,-596 # ffffffffc020c678 <commands+0xbd0>
ffffffffc02018d4:	0000a617          	auipc	a2,0xa
ffffffffc02018d8:	3e460613          	addi	a2,a2,996 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02018dc:	10c00593          	li	a1,268
ffffffffc02018e0:	0000b517          	auipc	a0,0xb
ffffffffc02018e4:	b2850513          	addi	a0,a0,-1240 # ffffffffc020c408 <commands+0x960>
ffffffffc02018e8:	bb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018ec:	0000b697          	auipc	a3,0xb
ffffffffc02018f0:	d7c68693          	addi	a3,a3,-644 # ffffffffc020c668 <commands+0xbc0>
ffffffffc02018f4:	0000a617          	auipc	a2,0xa
ffffffffc02018f8:	3c460613          	addi	a2,a2,964 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02018fc:	10700593          	li	a1,263
ffffffffc0201900:	0000b517          	auipc	a0,0xb
ffffffffc0201904:	b0850513          	addi	a0,a0,-1272 # ffffffffc020c408 <commands+0x960>
ffffffffc0201908:	b97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020190c:	0000b697          	auipc	a3,0xb
ffffffffc0201910:	c5c68693          	addi	a3,a3,-932 # ffffffffc020c568 <commands+0xac0>
ffffffffc0201914:	0000a617          	auipc	a2,0xa
ffffffffc0201918:	3a460613          	addi	a2,a2,932 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020191c:	10600593          	li	a1,262
ffffffffc0201920:	0000b517          	auipc	a0,0xb
ffffffffc0201924:	ae850513          	addi	a0,a0,-1304 # ffffffffc020c408 <commands+0x960>
ffffffffc0201928:	b77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020192c:	0000b697          	auipc	a3,0xb
ffffffffc0201930:	d1c68693          	addi	a3,a3,-740 # ffffffffc020c648 <commands+0xba0>
ffffffffc0201934:	0000a617          	auipc	a2,0xa
ffffffffc0201938:	38460613          	addi	a2,a2,900 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020193c:	10500593          	li	a1,261
ffffffffc0201940:	0000b517          	auipc	a0,0xb
ffffffffc0201944:	ac850513          	addi	a0,a0,-1336 # ffffffffc020c408 <commands+0x960>
ffffffffc0201948:	b57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020194c:	0000b697          	auipc	a3,0xb
ffffffffc0201950:	ccc68693          	addi	a3,a3,-820 # ffffffffc020c618 <commands+0xb70>
ffffffffc0201954:	0000a617          	auipc	a2,0xa
ffffffffc0201958:	36460613          	addi	a2,a2,868 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020195c:	10400593          	li	a1,260
ffffffffc0201960:	0000b517          	auipc	a0,0xb
ffffffffc0201964:	aa850513          	addi	a0,a0,-1368 # ffffffffc020c408 <commands+0x960>
ffffffffc0201968:	b37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020196c:	0000b697          	auipc	a3,0xb
ffffffffc0201970:	c9468693          	addi	a3,a3,-876 # ffffffffc020c600 <commands+0xb58>
ffffffffc0201974:	0000a617          	auipc	a2,0xa
ffffffffc0201978:	34460613          	addi	a2,a2,836 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020197c:	10300593          	li	a1,259
ffffffffc0201980:	0000b517          	auipc	a0,0xb
ffffffffc0201984:	a8850513          	addi	a0,a0,-1400 # ffffffffc020c408 <commands+0x960>
ffffffffc0201988:	b17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020198c:	0000b697          	auipc	a3,0xb
ffffffffc0201990:	bdc68693          	addi	a3,a3,-1060 # ffffffffc020c568 <commands+0xac0>
ffffffffc0201994:	0000a617          	auipc	a2,0xa
ffffffffc0201998:	32460613          	addi	a2,a2,804 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020199c:	0fd00593          	li	a1,253
ffffffffc02019a0:	0000b517          	auipc	a0,0xb
ffffffffc02019a4:	a6850513          	addi	a0,a0,-1432 # ffffffffc020c408 <commands+0x960>
ffffffffc02019a8:	af7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019ac:	0000b697          	auipc	a3,0xb
ffffffffc02019b0:	c3c68693          	addi	a3,a3,-964 # ffffffffc020c5e8 <commands+0xb40>
ffffffffc02019b4:	0000a617          	auipc	a2,0xa
ffffffffc02019b8:	30460613          	addi	a2,a2,772 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02019bc:	0f800593          	li	a1,248
ffffffffc02019c0:	0000b517          	auipc	a0,0xb
ffffffffc02019c4:	a4850513          	addi	a0,a0,-1464 # ffffffffc020c408 <commands+0x960>
ffffffffc02019c8:	ad7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019cc:	0000b697          	auipc	a3,0xb
ffffffffc02019d0:	d3c68693          	addi	a3,a3,-708 # ffffffffc020c708 <commands+0xc60>
ffffffffc02019d4:	0000a617          	auipc	a2,0xa
ffffffffc02019d8:	2e460613          	addi	a2,a2,740 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02019dc:	11600593          	li	a1,278
ffffffffc02019e0:	0000b517          	auipc	a0,0xb
ffffffffc02019e4:	a2850513          	addi	a0,a0,-1496 # ffffffffc020c408 <commands+0x960>
ffffffffc02019e8:	ab7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019ec:	0000b697          	auipc	a3,0xb
ffffffffc02019f0:	d4c68693          	addi	a3,a3,-692 # ffffffffc020c738 <commands+0xc90>
ffffffffc02019f4:	0000a617          	auipc	a2,0xa
ffffffffc02019f8:	2c460613          	addi	a2,a2,708 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02019fc:	12500593          	li	a1,293
ffffffffc0201a00:	0000b517          	auipc	a0,0xb
ffffffffc0201a04:	a0850513          	addi	a0,a0,-1528 # ffffffffc020c408 <commands+0x960>
ffffffffc0201a08:	a97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a0c:	0000b697          	auipc	a3,0xb
ffffffffc0201a10:	a1468693          	addi	a3,a3,-1516 # ffffffffc020c420 <commands+0x978>
ffffffffc0201a14:	0000a617          	auipc	a2,0xa
ffffffffc0201a18:	2a460613          	addi	a2,a2,676 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0201a1c:	0f200593          	li	a1,242
ffffffffc0201a20:	0000b517          	auipc	a0,0xb
ffffffffc0201a24:	9e850513          	addi	a0,a0,-1560 # ffffffffc020c408 <commands+0x960>
ffffffffc0201a28:	a77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a2c:	0000b697          	auipc	a3,0xb
ffffffffc0201a30:	a3468693          	addi	a3,a3,-1484 # ffffffffc020c460 <commands+0x9b8>
ffffffffc0201a34:	0000a617          	auipc	a2,0xa
ffffffffc0201a38:	28460613          	addi	a2,a2,644 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0201a3c:	0b900593          	li	a1,185
ffffffffc0201a40:	0000b517          	auipc	a0,0xb
ffffffffc0201a44:	9c850513          	addi	a0,a0,-1592 # ffffffffc020c408 <commands+0x960>
ffffffffc0201a48:	a57fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201a4c <default_free_pages>:
ffffffffc0201a4c:	1141                	addi	sp,sp,-16
ffffffffc0201a4e:	e406                	sd	ra,8(sp)
ffffffffc0201a50:	14058463          	beqz	a1,ffffffffc0201b98 <default_free_pages+0x14c>
ffffffffc0201a54:	00659693          	slli	a3,a1,0x6
ffffffffc0201a58:	96aa                	add	a3,a3,a0
ffffffffc0201a5a:	87aa                	mv	a5,a0
ffffffffc0201a5c:	02d50263          	beq	a0,a3,ffffffffc0201a80 <default_free_pages+0x34>
ffffffffc0201a60:	6798                	ld	a4,8(a5)
ffffffffc0201a62:	8b05                	andi	a4,a4,1
ffffffffc0201a64:	10071a63          	bnez	a4,ffffffffc0201b78 <default_free_pages+0x12c>
ffffffffc0201a68:	6798                	ld	a4,8(a5)
ffffffffc0201a6a:	8b09                	andi	a4,a4,2
ffffffffc0201a6c:	10071663          	bnez	a4,ffffffffc0201b78 <default_free_pages+0x12c>
ffffffffc0201a70:	0007b423          	sd	zero,8(a5)
ffffffffc0201a74:	0007a023          	sw	zero,0(a5)
ffffffffc0201a78:	04078793          	addi	a5,a5,64
ffffffffc0201a7c:	fed792e3          	bne	a5,a3,ffffffffc0201a60 <default_free_pages+0x14>
ffffffffc0201a80:	2581                	sext.w	a1,a1
ffffffffc0201a82:	c90c                	sw	a1,16(a0)
ffffffffc0201a84:	00850893          	addi	a7,a0,8
ffffffffc0201a88:	4789                	li	a5,2
ffffffffc0201a8a:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0201a8e:	00090697          	auipc	a3,0x90
ffffffffc0201a92:	d1a68693          	addi	a3,a3,-742 # ffffffffc02917a8 <free_area>
ffffffffc0201a96:	4a98                	lw	a4,16(a3)
ffffffffc0201a98:	669c                	ld	a5,8(a3)
ffffffffc0201a9a:	01850613          	addi	a2,a0,24
ffffffffc0201a9e:	9db9                	addw	a1,a1,a4
ffffffffc0201aa0:	ca8c                	sw	a1,16(a3)
ffffffffc0201aa2:	0ad78463          	beq	a5,a3,ffffffffc0201b4a <default_free_pages+0xfe>
ffffffffc0201aa6:	fe878713          	addi	a4,a5,-24
ffffffffc0201aaa:	0006b803          	ld	a6,0(a3)
ffffffffc0201aae:	4581                	li	a1,0
ffffffffc0201ab0:	00e56a63          	bltu	a0,a4,ffffffffc0201ac4 <default_free_pages+0x78>
ffffffffc0201ab4:	6798                	ld	a4,8(a5)
ffffffffc0201ab6:	04d70c63          	beq	a4,a3,ffffffffc0201b0e <default_free_pages+0xc2>
ffffffffc0201aba:	87ba                	mv	a5,a4
ffffffffc0201abc:	fe878713          	addi	a4,a5,-24
ffffffffc0201ac0:	fee57ae3          	bgeu	a0,a4,ffffffffc0201ab4 <default_free_pages+0x68>
ffffffffc0201ac4:	c199                	beqz	a1,ffffffffc0201aca <default_free_pages+0x7e>
ffffffffc0201ac6:	0106b023          	sd	a6,0(a3)
ffffffffc0201aca:	6398                	ld	a4,0(a5)
ffffffffc0201acc:	e390                	sd	a2,0(a5)
ffffffffc0201ace:	e710                	sd	a2,8(a4)
ffffffffc0201ad0:	f11c                	sd	a5,32(a0)
ffffffffc0201ad2:	ed18                	sd	a4,24(a0)
ffffffffc0201ad4:	00d70d63          	beq	a4,a3,ffffffffc0201aee <default_free_pages+0xa2>
ffffffffc0201ad8:	ff872583          	lw	a1,-8(a4)
ffffffffc0201adc:	fe870613          	addi	a2,a4,-24
ffffffffc0201ae0:	02059813          	slli	a6,a1,0x20
ffffffffc0201ae4:	01a85793          	srli	a5,a6,0x1a
ffffffffc0201ae8:	97b2                	add	a5,a5,a2
ffffffffc0201aea:	02f50c63          	beq	a0,a5,ffffffffc0201b22 <default_free_pages+0xd6>
ffffffffc0201aee:	711c                	ld	a5,32(a0)
ffffffffc0201af0:	00d78c63          	beq	a5,a3,ffffffffc0201b08 <default_free_pages+0xbc>
ffffffffc0201af4:	4910                	lw	a2,16(a0)
ffffffffc0201af6:	fe878693          	addi	a3,a5,-24
ffffffffc0201afa:	02061593          	slli	a1,a2,0x20
ffffffffc0201afe:	01a5d713          	srli	a4,a1,0x1a
ffffffffc0201b02:	972a                	add	a4,a4,a0
ffffffffc0201b04:	04e68a63          	beq	a3,a4,ffffffffc0201b58 <default_free_pages+0x10c>
ffffffffc0201b08:	60a2                	ld	ra,8(sp)
ffffffffc0201b0a:	0141                	addi	sp,sp,16
ffffffffc0201b0c:	8082                	ret
ffffffffc0201b0e:	e790                	sd	a2,8(a5)
ffffffffc0201b10:	f114                	sd	a3,32(a0)
ffffffffc0201b12:	6798                	ld	a4,8(a5)
ffffffffc0201b14:	ed1c                	sd	a5,24(a0)
ffffffffc0201b16:	02d70763          	beq	a4,a3,ffffffffc0201b44 <default_free_pages+0xf8>
ffffffffc0201b1a:	8832                	mv	a6,a2
ffffffffc0201b1c:	4585                	li	a1,1
ffffffffc0201b1e:	87ba                	mv	a5,a4
ffffffffc0201b20:	bf71                	j	ffffffffc0201abc <default_free_pages+0x70>
ffffffffc0201b22:	491c                	lw	a5,16(a0)
ffffffffc0201b24:	9dbd                	addw	a1,a1,a5
ffffffffc0201b26:	feb72c23          	sw	a1,-8(a4)
ffffffffc0201b2a:	57f5                	li	a5,-3
ffffffffc0201b2c:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0201b30:	01853803          	ld	a6,24(a0)
ffffffffc0201b34:	710c                	ld	a1,32(a0)
ffffffffc0201b36:	8532                	mv	a0,a2
ffffffffc0201b38:	00b83423          	sd	a1,8(a6)
ffffffffc0201b3c:	671c                	ld	a5,8(a4)
ffffffffc0201b3e:	0105b023          	sd	a6,0(a1)
ffffffffc0201b42:	b77d                	j	ffffffffc0201af0 <default_free_pages+0xa4>
ffffffffc0201b44:	e290                	sd	a2,0(a3)
ffffffffc0201b46:	873e                	mv	a4,a5
ffffffffc0201b48:	bf41                	j	ffffffffc0201ad8 <default_free_pages+0x8c>
ffffffffc0201b4a:	60a2                	ld	ra,8(sp)
ffffffffc0201b4c:	e390                	sd	a2,0(a5)
ffffffffc0201b4e:	e790                	sd	a2,8(a5)
ffffffffc0201b50:	f11c                	sd	a5,32(a0)
ffffffffc0201b52:	ed1c                	sd	a5,24(a0)
ffffffffc0201b54:	0141                	addi	sp,sp,16
ffffffffc0201b56:	8082                	ret
ffffffffc0201b58:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201b5c:	ff078693          	addi	a3,a5,-16
ffffffffc0201b60:	9e39                	addw	a2,a2,a4
ffffffffc0201b62:	c910                	sw	a2,16(a0)
ffffffffc0201b64:	5775                	li	a4,-3
ffffffffc0201b66:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc0201b6a:	6398                	ld	a4,0(a5)
ffffffffc0201b6c:	679c                	ld	a5,8(a5)
ffffffffc0201b6e:	60a2                	ld	ra,8(sp)
ffffffffc0201b70:	e71c                	sd	a5,8(a4)
ffffffffc0201b72:	e398                	sd	a4,0(a5)
ffffffffc0201b74:	0141                	addi	sp,sp,16
ffffffffc0201b76:	8082                	ret
ffffffffc0201b78:	0000b697          	auipc	a3,0xb
ffffffffc0201b7c:	bd868693          	addi	a3,a3,-1064 # ffffffffc020c750 <commands+0xca8>
ffffffffc0201b80:	0000a617          	auipc	a2,0xa
ffffffffc0201b84:	13860613          	addi	a2,a2,312 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0201b88:	08200593          	li	a1,130
ffffffffc0201b8c:	0000b517          	auipc	a0,0xb
ffffffffc0201b90:	87c50513          	addi	a0,a0,-1924 # ffffffffc020c408 <commands+0x960>
ffffffffc0201b94:	90bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201b98:	0000b697          	auipc	a3,0xb
ffffffffc0201b9c:	bb068693          	addi	a3,a3,-1104 # ffffffffc020c748 <commands+0xca0>
ffffffffc0201ba0:	0000a617          	auipc	a2,0xa
ffffffffc0201ba4:	11860613          	addi	a2,a2,280 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0201ba8:	07f00593          	li	a1,127
ffffffffc0201bac:	0000b517          	auipc	a0,0xb
ffffffffc0201bb0:	85c50513          	addi	a0,a0,-1956 # ffffffffc020c408 <commands+0x960>
ffffffffc0201bb4:	8ebfe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201bb8 <default_alloc_pages>:
ffffffffc0201bb8:	c941                	beqz	a0,ffffffffc0201c48 <default_alloc_pages+0x90>
ffffffffc0201bba:	00090597          	auipc	a1,0x90
ffffffffc0201bbe:	bee58593          	addi	a1,a1,-1042 # ffffffffc02917a8 <free_area>
ffffffffc0201bc2:	0105a803          	lw	a6,16(a1)
ffffffffc0201bc6:	872a                	mv	a4,a0
ffffffffc0201bc8:	02081793          	slli	a5,a6,0x20
ffffffffc0201bcc:	9381                	srli	a5,a5,0x20
ffffffffc0201bce:	00a7ee63          	bltu	a5,a0,ffffffffc0201bea <default_alloc_pages+0x32>
ffffffffc0201bd2:	87ae                	mv	a5,a1
ffffffffc0201bd4:	a801                	j	ffffffffc0201be4 <default_alloc_pages+0x2c>
ffffffffc0201bd6:	ff87a683          	lw	a3,-8(a5)
ffffffffc0201bda:	02069613          	slli	a2,a3,0x20
ffffffffc0201bde:	9201                	srli	a2,a2,0x20
ffffffffc0201be0:	00e67763          	bgeu	a2,a4,ffffffffc0201bee <default_alloc_pages+0x36>
ffffffffc0201be4:	679c                	ld	a5,8(a5)
ffffffffc0201be6:	feb798e3          	bne	a5,a1,ffffffffc0201bd6 <default_alloc_pages+0x1e>
ffffffffc0201bea:	4501                	li	a0,0
ffffffffc0201bec:	8082                	ret
ffffffffc0201bee:	0007b883          	ld	a7,0(a5)
ffffffffc0201bf2:	0087b303          	ld	t1,8(a5)
ffffffffc0201bf6:	fe878513          	addi	a0,a5,-24
ffffffffc0201bfa:	00070e1b          	sext.w	t3,a4
ffffffffc0201bfe:	0068b423          	sd	t1,8(a7) # 10000008 <_binary_bin_sfs_img_size+0xff8ad08>
ffffffffc0201c02:	01133023          	sd	a7,0(t1)
ffffffffc0201c06:	02c77863          	bgeu	a4,a2,ffffffffc0201c36 <default_alloc_pages+0x7e>
ffffffffc0201c0a:	071a                	slli	a4,a4,0x6
ffffffffc0201c0c:	972a                	add	a4,a4,a0
ffffffffc0201c0e:	41c686bb          	subw	a3,a3,t3
ffffffffc0201c12:	cb14                	sw	a3,16(a4)
ffffffffc0201c14:	00870613          	addi	a2,a4,8
ffffffffc0201c18:	4689                	li	a3,2
ffffffffc0201c1a:	40d6302f          	amoor.d	zero,a3,(a2)
ffffffffc0201c1e:	0088b683          	ld	a3,8(a7)
ffffffffc0201c22:	01870613          	addi	a2,a4,24
ffffffffc0201c26:	0105a803          	lw	a6,16(a1)
ffffffffc0201c2a:	e290                	sd	a2,0(a3)
ffffffffc0201c2c:	00c8b423          	sd	a2,8(a7)
ffffffffc0201c30:	f314                	sd	a3,32(a4)
ffffffffc0201c32:	01173c23          	sd	a7,24(a4)
ffffffffc0201c36:	41c8083b          	subw	a6,a6,t3
ffffffffc0201c3a:	0105a823          	sw	a6,16(a1)
ffffffffc0201c3e:	5775                	li	a4,-3
ffffffffc0201c40:	17c1                	addi	a5,a5,-16
ffffffffc0201c42:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0201c46:	8082                	ret
ffffffffc0201c48:	1141                	addi	sp,sp,-16
ffffffffc0201c4a:	0000b697          	auipc	a3,0xb
ffffffffc0201c4e:	afe68693          	addi	a3,a3,-1282 # ffffffffc020c748 <commands+0xca0>
ffffffffc0201c52:	0000a617          	auipc	a2,0xa
ffffffffc0201c56:	06660613          	addi	a2,a2,102 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0201c5a:	06100593          	li	a1,97
ffffffffc0201c5e:	0000a517          	auipc	a0,0xa
ffffffffc0201c62:	7aa50513          	addi	a0,a0,1962 # ffffffffc020c408 <commands+0x960>
ffffffffc0201c66:	e406                	sd	ra,8(sp)
ffffffffc0201c68:	837fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201c6c <default_init_memmap>:
ffffffffc0201c6c:	1141                	addi	sp,sp,-16
ffffffffc0201c6e:	e406                	sd	ra,8(sp)
ffffffffc0201c70:	c5f1                	beqz	a1,ffffffffc0201d3c <default_init_memmap+0xd0>
ffffffffc0201c72:	00659693          	slli	a3,a1,0x6
ffffffffc0201c76:	96aa                	add	a3,a3,a0
ffffffffc0201c78:	87aa                	mv	a5,a0
ffffffffc0201c7a:	00d50f63          	beq	a0,a3,ffffffffc0201c98 <default_init_memmap+0x2c>
ffffffffc0201c7e:	6798                	ld	a4,8(a5)
ffffffffc0201c80:	8b05                	andi	a4,a4,1
ffffffffc0201c82:	cf49                	beqz	a4,ffffffffc0201d1c <default_init_memmap+0xb0>
ffffffffc0201c84:	0007a823          	sw	zero,16(a5)
ffffffffc0201c88:	0007b423          	sd	zero,8(a5)
ffffffffc0201c8c:	0007a023          	sw	zero,0(a5)
ffffffffc0201c90:	04078793          	addi	a5,a5,64
ffffffffc0201c94:	fed795e3          	bne	a5,a3,ffffffffc0201c7e <default_init_memmap+0x12>
ffffffffc0201c98:	2581                	sext.w	a1,a1
ffffffffc0201c9a:	c90c                	sw	a1,16(a0)
ffffffffc0201c9c:	4789                	li	a5,2
ffffffffc0201c9e:	00850713          	addi	a4,a0,8
ffffffffc0201ca2:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc0201ca6:	00090697          	auipc	a3,0x90
ffffffffc0201caa:	b0268693          	addi	a3,a3,-1278 # ffffffffc02917a8 <free_area>
ffffffffc0201cae:	4a98                	lw	a4,16(a3)
ffffffffc0201cb0:	669c                	ld	a5,8(a3)
ffffffffc0201cb2:	01850613          	addi	a2,a0,24
ffffffffc0201cb6:	9db9                	addw	a1,a1,a4
ffffffffc0201cb8:	ca8c                	sw	a1,16(a3)
ffffffffc0201cba:	04d78a63          	beq	a5,a3,ffffffffc0201d0e <default_init_memmap+0xa2>
ffffffffc0201cbe:	fe878713          	addi	a4,a5,-24
ffffffffc0201cc2:	0006b803          	ld	a6,0(a3)
ffffffffc0201cc6:	4581                	li	a1,0
ffffffffc0201cc8:	00e56a63          	bltu	a0,a4,ffffffffc0201cdc <default_init_memmap+0x70>
ffffffffc0201ccc:	6798                	ld	a4,8(a5)
ffffffffc0201cce:	02d70263          	beq	a4,a3,ffffffffc0201cf2 <default_init_memmap+0x86>
ffffffffc0201cd2:	87ba                	mv	a5,a4
ffffffffc0201cd4:	fe878713          	addi	a4,a5,-24
ffffffffc0201cd8:	fee57ae3          	bgeu	a0,a4,ffffffffc0201ccc <default_init_memmap+0x60>
ffffffffc0201cdc:	c199                	beqz	a1,ffffffffc0201ce2 <default_init_memmap+0x76>
ffffffffc0201cde:	0106b023          	sd	a6,0(a3)
ffffffffc0201ce2:	6398                	ld	a4,0(a5)
ffffffffc0201ce4:	60a2                	ld	ra,8(sp)
ffffffffc0201ce6:	e390                	sd	a2,0(a5)
ffffffffc0201ce8:	e710                	sd	a2,8(a4)
ffffffffc0201cea:	f11c                	sd	a5,32(a0)
ffffffffc0201cec:	ed18                	sd	a4,24(a0)
ffffffffc0201cee:	0141                	addi	sp,sp,16
ffffffffc0201cf0:	8082                	ret
ffffffffc0201cf2:	e790                	sd	a2,8(a5)
ffffffffc0201cf4:	f114                	sd	a3,32(a0)
ffffffffc0201cf6:	6798                	ld	a4,8(a5)
ffffffffc0201cf8:	ed1c                	sd	a5,24(a0)
ffffffffc0201cfa:	00d70663          	beq	a4,a3,ffffffffc0201d06 <default_init_memmap+0x9a>
ffffffffc0201cfe:	8832                	mv	a6,a2
ffffffffc0201d00:	4585                	li	a1,1
ffffffffc0201d02:	87ba                	mv	a5,a4
ffffffffc0201d04:	bfc1                	j	ffffffffc0201cd4 <default_init_memmap+0x68>
ffffffffc0201d06:	60a2                	ld	ra,8(sp)
ffffffffc0201d08:	e290                	sd	a2,0(a3)
ffffffffc0201d0a:	0141                	addi	sp,sp,16
ffffffffc0201d0c:	8082                	ret
ffffffffc0201d0e:	60a2                	ld	ra,8(sp)
ffffffffc0201d10:	e390                	sd	a2,0(a5)
ffffffffc0201d12:	e790                	sd	a2,8(a5)
ffffffffc0201d14:	f11c                	sd	a5,32(a0)
ffffffffc0201d16:	ed1c                	sd	a5,24(a0)
ffffffffc0201d18:	0141                	addi	sp,sp,16
ffffffffc0201d1a:	8082                	ret
ffffffffc0201d1c:	0000b697          	auipc	a3,0xb
ffffffffc0201d20:	a5c68693          	addi	a3,a3,-1444 # ffffffffc020c778 <commands+0xcd0>
ffffffffc0201d24:	0000a617          	auipc	a2,0xa
ffffffffc0201d28:	f9460613          	addi	a2,a2,-108 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0201d2c:	04800593          	li	a1,72
ffffffffc0201d30:	0000a517          	auipc	a0,0xa
ffffffffc0201d34:	6d850513          	addi	a0,a0,1752 # ffffffffc020c408 <commands+0x960>
ffffffffc0201d38:	f66fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201d3c:	0000b697          	auipc	a3,0xb
ffffffffc0201d40:	a0c68693          	addi	a3,a3,-1524 # ffffffffc020c748 <commands+0xca0>
ffffffffc0201d44:	0000a617          	auipc	a2,0xa
ffffffffc0201d48:	f7460613          	addi	a2,a2,-140 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0201d4c:	04500593          	li	a1,69
ffffffffc0201d50:	0000a517          	auipc	a0,0xa
ffffffffc0201d54:	6b850513          	addi	a0,a0,1720 # ffffffffc020c408 <commands+0x960>
ffffffffc0201d58:	f46fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201d5c <slob_free>:
ffffffffc0201d5c:	c94d                	beqz	a0,ffffffffc0201e0e <slob_free+0xb2>
ffffffffc0201d5e:	1141                	addi	sp,sp,-16
ffffffffc0201d60:	e022                	sd	s0,0(sp)
ffffffffc0201d62:	e406                	sd	ra,8(sp)
ffffffffc0201d64:	842a                	mv	s0,a0
ffffffffc0201d66:	e9c1                	bnez	a1,ffffffffc0201df6 <slob_free+0x9a>
ffffffffc0201d68:	100027f3          	csrr	a5,sstatus
ffffffffc0201d6c:	8b89                	andi	a5,a5,2
ffffffffc0201d6e:	4501                	li	a0,0
ffffffffc0201d70:	ebd9                	bnez	a5,ffffffffc0201e06 <slob_free+0xaa>
ffffffffc0201d72:	0008f617          	auipc	a2,0x8f
ffffffffc0201d76:	2de60613          	addi	a2,a2,734 # ffffffffc0291050 <slobfree>
ffffffffc0201d7a:	621c                	ld	a5,0(a2)
ffffffffc0201d7c:	873e                	mv	a4,a5
ffffffffc0201d7e:	679c                	ld	a5,8(a5)
ffffffffc0201d80:	02877a63          	bgeu	a4,s0,ffffffffc0201db4 <slob_free+0x58>
ffffffffc0201d84:	00f46463          	bltu	s0,a5,ffffffffc0201d8c <slob_free+0x30>
ffffffffc0201d88:	fef76ae3          	bltu	a4,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201d8c:	400c                	lw	a1,0(s0)
ffffffffc0201d8e:	00459693          	slli	a3,a1,0x4
ffffffffc0201d92:	96a2                	add	a3,a3,s0
ffffffffc0201d94:	02d78a63          	beq	a5,a3,ffffffffc0201dc8 <slob_free+0x6c>
ffffffffc0201d98:	4314                	lw	a3,0(a4)
ffffffffc0201d9a:	e41c                	sd	a5,8(s0)
ffffffffc0201d9c:	00469793          	slli	a5,a3,0x4
ffffffffc0201da0:	97ba                	add	a5,a5,a4
ffffffffc0201da2:	02f40e63          	beq	s0,a5,ffffffffc0201dde <slob_free+0x82>
ffffffffc0201da6:	e700                	sd	s0,8(a4)
ffffffffc0201da8:	e218                	sd	a4,0(a2)
ffffffffc0201daa:	e129                	bnez	a0,ffffffffc0201dec <slob_free+0x90>
ffffffffc0201dac:	60a2                	ld	ra,8(sp)
ffffffffc0201dae:	6402                	ld	s0,0(sp)
ffffffffc0201db0:	0141                	addi	sp,sp,16
ffffffffc0201db2:	8082                	ret
ffffffffc0201db4:	fcf764e3          	bltu	a4,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201db8:	fcf472e3          	bgeu	s0,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201dbc:	400c                	lw	a1,0(s0)
ffffffffc0201dbe:	00459693          	slli	a3,a1,0x4
ffffffffc0201dc2:	96a2                	add	a3,a3,s0
ffffffffc0201dc4:	fcd79ae3          	bne	a5,a3,ffffffffc0201d98 <slob_free+0x3c>
ffffffffc0201dc8:	4394                	lw	a3,0(a5)
ffffffffc0201dca:	679c                	ld	a5,8(a5)
ffffffffc0201dcc:	9db5                	addw	a1,a1,a3
ffffffffc0201dce:	c00c                	sw	a1,0(s0)
ffffffffc0201dd0:	4314                	lw	a3,0(a4)
ffffffffc0201dd2:	e41c                	sd	a5,8(s0)
ffffffffc0201dd4:	00469793          	slli	a5,a3,0x4
ffffffffc0201dd8:	97ba                	add	a5,a5,a4
ffffffffc0201dda:	fcf416e3          	bne	s0,a5,ffffffffc0201da6 <slob_free+0x4a>
ffffffffc0201dde:	401c                	lw	a5,0(s0)
ffffffffc0201de0:	640c                	ld	a1,8(s0)
ffffffffc0201de2:	e218                	sd	a4,0(a2)
ffffffffc0201de4:	9ebd                	addw	a3,a3,a5
ffffffffc0201de6:	c314                	sw	a3,0(a4)
ffffffffc0201de8:	e70c                	sd	a1,8(a4)
ffffffffc0201dea:	d169                	beqz	a0,ffffffffc0201dac <slob_free+0x50>
ffffffffc0201dec:	6402                	ld	s0,0(sp)
ffffffffc0201dee:	60a2                	ld	ra,8(sp)
ffffffffc0201df0:	0141                	addi	sp,sp,16
ffffffffc0201df2:	e7bfe06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0201df6:	25bd                	addiw	a1,a1,15
ffffffffc0201df8:	8191                	srli	a1,a1,0x4
ffffffffc0201dfa:	c10c                	sw	a1,0(a0)
ffffffffc0201dfc:	100027f3          	csrr	a5,sstatus
ffffffffc0201e00:	8b89                	andi	a5,a5,2
ffffffffc0201e02:	4501                	li	a0,0
ffffffffc0201e04:	d7bd                	beqz	a5,ffffffffc0201d72 <slob_free+0x16>
ffffffffc0201e06:	e6dfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201e0a:	4505                	li	a0,1
ffffffffc0201e0c:	b79d                	j	ffffffffc0201d72 <slob_free+0x16>
ffffffffc0201e0e:	8082                	ret

ffffffffc0201e10 <__slob_get_free_pages.constprop.0>:
ffffffffc0201e10:	4785                	li	a5,1
ffffffffc0201e12:	1141                	addi	sp,sp,-16
ffffffffc0201e14:	00a7953b          	sllw	a0,a5,a0
ffffffffc0201e18:	e406                	sd	ra,8(sp)
ffffffffc0201e1a:	352000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201e1e:	c91d                	beqz	a0,ffffffffc0201e54 <__slob_get_free_pages.constprop.0+0x44>
ffffffffc0201e20:	00095697          	auipc	a3,0x95
ffffffffc0201e24:	a886b683          	ld	a3,-1400(a3) # ffffffffc02968a8 <pages>
ffffffffc0201e28:	8d15                	sub	a0,a0,a3
ffffffffc0201e2a:	8519                	srai	a0,a0,0x6
ffffffffc0201e2c:	0000e697          	auipc	a3,0xe
ffffffffc0201e30:	1b46b683          	ld	a3,436(a3) # ffffffffc020ffe0 <nbase>
ffffffffc0201e34:	9536                	add	a0,a0,a3
ffffffffc0201e36:	00c51793          	slli	a5,a0,0xc
ffffffffc0201e3a:	83b1                	srli	a5,a5,0xc
ffffffffc0201e3c:	00095717          	auipc	a4,0x95
ffffffffc0201e40:	a6473703          	ld	a4,-1436(a4) # ffffffffc02968a0 <npage>
ffffffffc0201e44:	0532                	slli	a0,a0,0xc
ffffffffc0201e46:	00e7fa63          	bgeu	a5,a4,ffffffffc0201e5a <__slob_get_free_pages.constprop.0+0x4a>
ffffffffc0201e4a:	00095697          	auipc	a3,0x95
ffffffffc0201e4e:	a6e6b683          	ld	a3,-1426(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0201e52:	9536                	add	a0,a0,a3
ffffffffc0201e54:	60a2                	ld	ra,8(sp)
ffffffffc0201e56:	0141                	addi	sp,sp,16
ffffffffc0201e58:	8082                	ret
ffffffffc0201e5a:	86aa                	mv	a3,a0
ffffffffc0201e5c:	0000b617          	auipc	a2,0xb
ffffffffc0201e60:	97c60613          	addi	a2,a2,-1668 # ffffffffc020c7d8 <default_pmm_manager+0x38>
ffffffffc0201e64:	07100593          	li	a1,113
ffffffffc0201e68:	0000b517          	auipc	a0,0xb
ffffffffc0201e6c:	99850513          	addi	a0,a0,-1640 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc0201e70:	e2efe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201e74 <slob_alloc.constprop.0>:
ffffffffc0201e74:	1101                	addi	sp,sp,-32
ffffffffc0201e76:	ec06                	sd	ra,24(sp)
ffffffffc0201e78:	e822                	sd	s0,16(sp)
ffffffffc0201e7a:	e426                	sd	s1,8(sp)
ffffffffc0201e7c:	e04a                	sd	s2,0(sp)
ffffffffc0201e7e:	01050713          	addi	a4,a0,16
ffffffffc0201e82:	6785                	lui	a5,0x1
ffffffffc0201e84:	0cf77363          	bgeu	a4,a5,ffffffffc0201f4a <slob_alloc.constprop.0+0xd6>
ffffffffc0201e88:	00f50493          	addi	s1,a0,15
ffffffffc0201e8c:	8091                	srli	s1,s1,0x4
ffffffffc0201e8e:	2481                	sext.w	s1,s1
ffffffffc0201e90:	10002673          	csrr	a2,sstatus
ffffffffc0201e94:	8a09                	andi	a2,a2,2
ffffffffc0201e96:	e25d                	bnez	a2,ffffffffc0201f3c <slob_alloc.constprop.0+0xc8>
ffffffffc0201e98:	0008f917          	auipc	s2,0x8f
ffffffffc0201e9c:	1b890913          	addi	s2,s2,440 # ffffffffc0291050 <slobfree>
ffffffffc0201ea0:	00093683          	ld	a3,0(s2)
ffffffffc0201ea4:	669c                	ld	a5,8(a3)
ffffffffc0201ea6:	4398                	lw	a4,0(a5)
ffffffffc0201ea8:	08975e63          	bge	a4,s1,ffffffffc0201f44 <slob_alloc.constprop.0+0xd0>
ffffffffc0201eac:	00f68b63          	beq	a3,a5,ffffffffc0201ec2 <slob_alloc.constprop.0+0x4e>
ffffffffc0201eb0:	6780                	ld	s0,8(a5)
ffffffffc0201eb2:	4018                	lw	a4,0(s0)
ffffffffc0201eb4:	02975a63          	bge	a4,s1,ffffffffc0201ee8 <slob_alloc.constprop.0+0x74>
ffffffffc0201eb8:	00093683          	ld	a3,0(s2)
ffffffffc0201ebc:	87a2                	mv	a5,s0
ffffffffc0201ebe:	fef699e3          	bne	a3,a5,ffffffffc0201eb0 <slob_alloc.constprop.0+0x3c>
ffffffffc0201ec2:	ee31                	bnez	a2,ffffffffc0201f1e <slob_alloc.constprop.0+0xaa>
ffffffffc0201ec4:	4501                	li	a0,0
ffffffffc0201ec6:	f4bff0ef          	jal	ra,ffffffffc0201e10 <__slob_get_free_pages.constprop.0>
ffffffffc0201eca:	842a                	mv	s0,a0
ffffffffc0201ecc:	cd05                	beqz	a0,ffffffffc0201f04 <slob_alloc.constprop.0+0x90>
ffffffffc0201ece:	6585                	lui	a1,0x1
ffffffffc0201ed0:	e8dff0ef          	jal	ra,ffffffffc0201d5c <slob_free>
ffffffffc0201ed4:	10002673          	csrr	a2,sstatus
ffffffffc0201ed8:	8a09                	andi	a2,a2,2
ffffffffc0201eda:	ee05                	bnez	a2,ffffffffc0201f12 <slob_alloc.constprop.0+0x9e>
ffffffffc0201edc:	00093783          	ld	a5,0(s2)
ffffffffc0201ee0:	6780                	ld	s0,8(a5)
ffffffffc0201ee2:	4018                	lw	a4,0(s0)
ffffffffc0201ee4:	fc974ae3          	blt	a4,s1,ffffffffc0201eb8 <slob_alloc.constprop.0+0x44>
ffffffffc0201ee8:	04e48763          	beq	s1,a4,ffffffffc0201f36 <slob_alloc.constprop.0+0xc2>
ffffffffc0201eec:	00449693          	slli	a3,s1,0x4
ffffffffc0201ef0:	96a2                	add	a3,a3,s0
ffffffffc0201ef2:	e794                	sd	a3,8(a5)
ffffffffc0201ef4:	640c                	ld	a1,8(s0)
ffffffffc0201ef6:	9f05                	subw	a4,a4,s1
ffffffffc0201ef8:	c298                	sw	a4,0(a3)
ffffffffc0201efa:	e68c                	sd	a1,8(a3)
ffffffffc0201efc:	c004                	sw	s1,0(s0)
ffffffffc0201efe:	00f93023          	sd	a5,0(s2)
ffffffffc0201f02:	e20d                	bnez	a2,ffffffffc0201f24 <slob_alloc.constprop.0+0xb0>
ffffffffc0201f04:	60e2                	ld	ra,24(sp)
ffffffffc0201f06:	8522                	mv	a0,s0
ffffffffc0201f08:	6442                	ld	s0,16(sp)
ffffffffc0201f0a:	64a2                	ld	s1,8(sp)
ffffffffc0201f0c:	6902                	ld	s2,0(sp)
ffffffffc0201f0e:	6105                	addi	sp,sp,32
ffffffffc0201f10:	8082                	ret
ffffffffc0201f12:	d61fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201f16:	00093783          	ld	a5,0(s2)
ffffffffc0201f1a:	4605                	li	a2,1
ffffffffc0201f1c:	b7d1                	j	ffffffffc0201ee0 <slob_alloc.constprop.0+0x6c>
ffffffffc0201f1e:	d4ffe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201f22:	b74d                	j	ffffffffc0201ec4 <slob_alloc.constprop.0+0x50>
ffffffffc0201f24:	d49fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201f28:	60e2                	ld	ra,24(sp)
ffffffffc0201f2a:	8522                	mv	a0,s0
ffffffffc0201f2c:	6442                	ld	s0,16(sp)
ffffffffc0201f2e:	64a2                	ld	s1,8(sp)
ffffffffc0201f30:	6902                	ld	s2,0(sp)
ffffffffc0201f32:	6105                	addi	sp,sp,32
ffffffffc0201f34:	8082                	ret
ffffffffc0201f36:	6418                	ld	a4,8(s0)
ffffffffc0201f38:	e798                	sd	a4,8(a5)
ffffffffc0201f3a:	b7d1                	j	ffffffffc0201efe <slob_alloc.constprop.0+0x8a>
ffffffffc0201f3c:	d37fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201f40:	4605                	li	a2,1
ffffffffc0201f42:	bf99                	j	ffffffffc0201e98 <slob_alloc.constprop.0+0x24>
ffffffffc0201f44:	843e                	mv	s0,a5
ffffffffc0201f46:	87b6                	mv	a5,a3
ffffffffc0201f48:	b745                	j	ffffffffc0201ee8 <slob_alloc.constprop.0+0x74>
ffffffffc0201f4a:	0000b697          	auipc	a3,0xb
ffffffffc0201f4e:	8c668693          	addi	a3,a3,-1850 # ffffffffc020c810 <default_pmm_manager+0x70>
ffffffffc0201f52:	0000a617          	auipc	a2,0xa
ffffffffc0201f56:	d6660613          	addi	a2,a2,-666 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0201f5a:	06300593          	li	a1,99
ffffffffc0201f5e:	0000b517          	auipc	a0,0xb
ffffffffc0201f62:	8d250513          	addi	a0,a0,-1838 # ffffffffc020c830 <default_pmm_manager+0x90>
ffffffffc0201f66:	d38fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201f6a <kmalloc_init>:
ffffffffc0201f6a:	1141                	addi	sp,sp,-16
ffffffffc0201f6c:	0000b517          	auipc	a0,0xb
ffffffffc0201f70:	8dc50513          	addi	a0,a0,-1828 # ffffffffc020c848 <default_pmm_manager+0xa8>
ffffffffc0201f74:	e406                	sd	ra,8(sp)
ffffffffc0201f76:	a30fe0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0201f7a:	60a2                	ld	ra,8(sp)
ffffffffc0201f7c:	0000b517          	auipc	a0,0xb
ffffffffc0201f80:	8e450513          	addi	a0,a0,-1820 # ffffffffc020c860 <default_pmm_manager+0xc0>
ffffffffc0201f84:	0141                	addi	sp,sp,16
ffffffffc0201f86:	a20fe06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0201f8a <kallocated>:
ffffffffc0201f8a:	4501                	li	a0,0
ffffffffc0201f8c:	8082                	ret

ffffffffc0201f8e <kmalloc>:
ffffffffc0201f8e:	1101                	addi	sp,sp,-32
ffffffffc0201f90:	e04a                	sd	s2,0(sp)
ffffffffc0201f92:	6905                	lui	s2,0x1
ffffffffc0201f94:	e822                	sd	s0,16(sp)
ffffffffc0201f96:	ec06                	sd	ra,24(sp)
ffffffffc0201f98:	e426                	sd	s1,8(sp)
ffffffffc0201f9a:	fef90793          	addi	a5,s2,-17 # fef <_binary_bin_swap_img_size-0x6d11>
ffffffffc0201f9e:	842a                	mv	s0,a0
ffffffffc0201fa0:	04a7f963          	bgeu	a5,a0,ffffffffc0201ff2 <kmalloc+0x64>
ffffffffc0201fa4:	4561                	li	a0,24
ffffffffc0201fa6:	ecfff0ef          	jal	ra,ffffffffc0201e74 <slob_alloc.constprop.0>
ffffffffc0201faa:	84aa                	mv	s1,a0
ffffffffc0201fac:	c929                	beqz	a0,ffffffffc0201ffe <kmalloc+0x70>
ffffffffc0201fae:	0004079b          	sext.w	a5,s0
ffffffffc0201fb2:	4501                	li	a0,0
ffffffffc0201fb4:	00f95763          	bge	s2,a5,ffffffffc0201fc2 <kmalloc+0x34>
ffffffffc0201fb8:	6705                	lui	a4,0x1
ffffffffc0201fba:	8785                	srai	a5,a5,0x1
ffffffffc0201fbc:	2505                	addiw	a0,a0,1
ffffffffc0201fbe:	fef74ee3          	blt	a4,a5,ffffffffc0201fba <kmalloc+0x2c>
ffffffffc0201fc2:	c088                	sw	a0,0(s1)
ffffffffc0201fc4:	e4dff0ef          	jal	ra,ffffffffc0201e10 <__slob_get_free_pages.constprop.0>
ffffffffc0201fc8:	e488                	sd	a0,8(s1)
ffffffffc0201fca:	842a                	mv	s0,a0
ffffffffc0201fcc:	c525                	beqz	a0,ffffffffc0202034 <kmalloc+0xa6>
ffffffffc0201fce:	100027f3          	csrr	a5,sstatus
ffffffffc0201fd2:	8b89                	andi	a5,a5,2
ffffffffc0201fd4:	ef8d                	bnez	a5,ffffffffc020200e <kmalloc+0x80>
ffffffffc0201fd6:	00095797          	auipc	a5,0x95
ffffffffc0201fda:	8b278793          	addi	a5,a5,-1870 # ffffffffc0296888 <bigblocks>
ffffffffc0201fde:	6398                	ld	a4,0(a5)
ffffffffc0201fe0:	e384                	sd	s1,0(a5)
ffffffffc0201fe2:	e898                	sd	a4,16(s1)
ffffffffc0201fe4:	60e2                	ld	ra,24(sp)
ffffffffc0201fe6:	8522                	mv	a0,s0
ffffffffc0201fe8:	6442                	ld	s0,16(sp)
ffffffffc0201fea:	64a2                	ld	s1,8(sp)
ffffffffc0201fec:	6902                	ld	s2,0(sp)
ffffffffc0201fee:	6105                	addi	sp,sp,32
ffffffffc0201ff0:	8082                	ret
ffffffffc0201ff2:	0541                	addi	a0,a0,16
ffffffffc0201ff4:	e81ff0ef          	jal	ra,ffffffffc0201e74 <slob_alloc.constprop.0>
ffffffffc0201ff8:	01050413          	addi	s0,a0,16
ffffffffc0201ffc:	f565                	bnez	a0,ffffffffc0201fe4 <kmalloc+0x56>
ffffffffc0201ffe:	4401                	li	s0,0
ffffffffc0202000:	60e2                	ld	ra,24(sp)
ffffffffc0202002:	8522                	mv	a0,s0
ffffffffc0202004:	6442                	ld	s0,16(sp)
ffffffffc0202006:	64a2                	ld	s1,8(sp)
ffffffffc0202008:	6902                	ld	s2,0(sp)
ffffffffc020200a:	6105                	addi	sp,sp,32
ffffffffc020200c:	8082                	ret
ffffffffc020200e:	c65fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202012:	00095797          	auipc	a5,0x95
ffffffffc0202016:	87678793          	addi	a5,a5,-1930 # ffffffffc0296888 <bigblocks>
ffffffffc020201a:	6398                	ld	a4,0(a5)
ffffffffc020201c:	e384                	sd	s1,0(a5)
ffffffffc020201e:	e898                	sd	a4,16(s1)
ffffffffc0202020:	c4dfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202024:	6480                	ld	s0,8(s1)
ffffffffc0202026:	60e2                	ld	ra,24(sp)
ffffffffc0202028:	64a2                	ld	s1,8(sp)
ffffffffc020202a:	8522                	mv	a0,s0
ffffffffc020202c:	6442                	ld	s0,16(sp)
ffffffffc020202e:	6902                	ld	s2,0(sp)
ffffffffc0202030:	6105                	addi	sp,sp,32
ffffffffc0202032:	8082                	ret
ffffffffc0202034:	45e1                	li	a1,24
ffffffffc0202036:	8526                	mv	a0,s1
ffffffffc0202038:	d25ff0ef          	jal	ra,ffffffffc0201d5c <slob_free>
ffffffffc020203c:	b765                	j	ffffffffc0201fe4 <kmalloc+0x56>

ffffffffc020203e <kfree>:
ffffffffc020203e:	c169                	beqz	a0,ffffffffc0202100 <kfree+0xc2>
ffffffffc0202040:	1101                	addi	sp,sp,-32
ffffffffc0202042:	e822                	sd	s0,16(sp)
ffffffffc0202044:	ec06                	sd	ra,24(sp)
ffffffffc0202046:	e426                	sd	s1,8(sp)
ffffffffc0202048:	03451793          	slli	a5,a0,0x34
ffffffffc020204c:	842a                	mv	s0,a0
ffffffffc020204e:	e3d9                	bnez	a5,ffffffffc02020d4 <kfree+0x96>
ffffffffc0202050:	100027f3          	csrr	a5,sstatus
ffffffffc0202054:	8b89                	andi	a5,a5,2
ffffffffc0202056:	e7d9                	bnez	a5,ffffffffc02020e4 <kfree+0xa6>
ffffffffc0202058:	00095797          	auipc	a5,0x95
ffffffffc020205c:	8307b783          	ld	a5,-2000(a5) # ffffffffc0296888 <bigblocks>
ffffffffc0202060:	4601                	li	a2,0
ffffffffc0202062:	cbad                	beqz	a5,ffffffffc02020d4 <kfree+0x96>
ffffffffc0202064:	00095697          	auipc	a3,0x95
ffffffffc0202068:	82468693          	addi	a3,a3,-2012 # ffffffffc0296888 <bigblocks>
ffffffffc020206c:	a021                	j	ffffffffc0202074 <kfree+0x36>
ffffffffc020206e:	01048693          	addi	a3,s1,16
ffffffffc0202072:	c3a5                	beqz	a5,ffffffffc02020d2 <kfree+0x94>
ffffffffc0202074:	6798                	ld	a4,8(a5)
ffffffffc0202076:	84be                	mv	s1,a5
ffffffffc0202078:	6b9c                	ld	a5,16(a5)
ffffffffc020207a:	fe871ae3          	bne	a4,s0,ffffffffc020206e <kfree+0x30>
ffffffffc020207e:	e29c                	sd	a5,0(a3)
ffffffffc0202080:	ee2d                	bnez	a2,ffffffffc02020fa <kfree+0xbc>
ffffffffc0202082:	c02007b7          	lui	a5,0xc0200
ffffffffc0202086:	4098                	lw	a4,0(s1)
ffffffffc0202088:	08f46963          	bltu	s0,a5,ffffffffc020211a <kfree+0xdc>
ffffffffc020208c:	00095697          	auipc	a3,0x95
ffffffffc0202090:	82c6b683          	ld	a3,-2004(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202094:	8c15                	sub	s0,s0,a3
ffffffffc0202096:	8031                	srli	s0,s0,0xc
ffffffffc0202098:	00095797          	auipc	a5,0x95
ffffffffc020209c:	8087b783          	ld	a5,-2040(a5) # ffffffffc02968a0 <npage>
ffffffffc02020a0:	06f47163          	bgeu	s0,a5,ffffffffc0202102 <kfree+0xc4>
ffffffffc02020a4:	0000e517          	auipc	a0,0xe
ffffffffc02020a8:	f3c53503          	ld	a0,-196(a0) # ffffffffc020ffe0 <nbase>
ffffffffc02020ac:	8c09                	sub	s0,s0,a0
ffffffffc02020ae:	041a                	slli	s0,s0,0x6
ffffffffc02020b0:	00094517          	auipc	a0,0x94
ffffffffc02020b4:	7f853503          	ld	a0,2040(a0) # ffffffffc02968a8 <pages>
ffffffffc02020b8:	4585                	li	a1,1
ffffffffc02020ba:	9522                	add	a0,a0,s0
ffffffffc02020bc:	00e595bb          	sllw	a1,a1,a4
ffffffffc02020c0:	0ea000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02020c4:	6442                	ld	s0,16(sp)
ffffffffc02020c6:	60e2                	ld	ra,24(sp)
ffffffffc02020c8:	8526                	mv	a0,s1
ffffffffc02020ca:	64a2                	ld	s1,8(sp)
ffffffffc02020cc:	45e1                	li	a1,24
ffffffffc02020ce:	6105                	addi	sp,sp,32
ffffffffc02020d0:	b171                	j	ffffffffc0201d5c <slob_free>
ffffffffc02020d2:	e20d                	bnez	a2,ffffffffc02020f4 <kfree+0xb6>
ffffffffc02020d4:	ff040513          	addi	a0,s0,-16
ffffffffc02020d8:	6442                	ld	s0,16(sp)
ffffffffc02020da:	60e2                	ld	ra,24(sp)
ffffffffc02020dc:	64a2                	ld	s1,8(sp)
ffffffffc02020de:	4581                	li	a1,0
ffffffffc02020e0:	6105                	addi	sp,sp,32
ffffffffc02020e2:	b9ad                	j	ffffffffc0201d5c <slob_free>
ffffffffc02020e4:	b8ffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02020e8:	00094797          	auipc	a5,0x94
ffffffffc02020ec:	7a07b783          	ld	a5,1952(a5) # ffffffffc0296888 <bigblocks>
ffffffffc02020f0:	4605                	li	a2,1
ffffffffc02020f2:	fbad                	bnez	a5,ffffffffc0202064 <kfree+0x26>
ffffffffc02020f4:	b79fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02020f8:	bff1                	j	ffffffffc02020d4 <kfree+0x96>
ffffffffc02020fa:	b73fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02020fe:	b751                	j	ffffffffc0202082 <kfree+0x44>
ffffffffc0202100:	8082                	ret
ffffffffc0202102:	0000a617          	auipc	a2,0xa
ffffffffc0202106:	7a660613          	addi	a2,a2,1958 # ffffffffc020c8a8 <default_pmm_manager+0x108>
ffffffffc020210a:	06900593          	li	a1,105
ffffffffc020210e:	0000a517          	auipc	a0,0xa
ffffffffc0202112:	6f250513          	addi	a0,a0,1778 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc0202116:	b88fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020211a:	86a2                	mv	a3,s0
ffffffffc020211c:	0000a617          	auipc	a2,0xa
ffffffffc0202120:	76460613          	addi	a2,a2,1892 # ffffffffc020c880 <default_pmm_manager+0xe0>
ffffffffc0202124:	07700593          	li	a1,119
ffffffffc0202128:	0000a517          	auipc	a0,0xa
ffffffffc020212c:	6d850513          	addi	a0,a0,1752 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc0202130:	b6efe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202134 <pa2page.part.0>:
ffffffffc0202134:	1141                	addi	sp,sp,-16
ffffffffc0202136:	0000a617          	auipc	a2,0xa
ffffffffc020213a:	77260613          	addi	a2,a2,1906 # ffffffffc020c8a8 <default_pmm_manager+0x108>
ffffffffc020213e:	06900593          	li	a1,105
ffffffffc0202142:	0000a517          	auipc	a0,0xa
ffffffffc0202146:	6be50513          	addi	a0,a0,1726 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc020214a:	e406                	sd	ra,8(sp)
ffffffffc020214c:	b52fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202150 <pte2page.part.0>:
ffffffffc0202150:	1141                	addi	sp,sp,-16
ffffffffc0202152:	0000a617          	auipc	a2,0xa
ffffffffc0202156:	77660613          	addi	a2,a2,1910 # ffffffffc020c8c8 <default_pmm_manager+0x128>
ffffffffc020215a:	07f00593          	li	a1,127
ffffffffc020215e:	0000a517          	auipc	a0,0xa
ffffffffc0202162:	6a250513          	addi	a0,a0,1698 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc0202166:	e406                	sd	ra,8(sp)
ffffffffc0202168:	b36fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020216c <alloc_pages>:
ffffffffc020216c:	100027f3          	csrr	a5,sstatus
ffffffffc0202170:	8b89                	andi	a5,a5,2
ffffffffc0202172:	e799                	bnez	a5,ffffffffc0202180 <alloc_pages+0x14>
ffffffffc0202174:	00094797          	auipc	a5,0x94
ffffffffc0202178:	73c7b783          	ld	a5,1852(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020217c:	6f9c                	ld	a5,24(a5)
ffffffffc020217e:	8782                	jr	a5
ffffffffc0202180:	1141                	addi	sp,sp,-16
ffffffffc0202182:	e406                	sd	ra,8(sp)
ffffffffc0202184:	e022                	sd	s0,0(sp)
ffffffffc0202186:	842a                	mv	s0,a0
ffffffffc0202188:	aebfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020218c:	00094797          	auipc	a5,0x94
ffffffffc0202190:	7247b783          	ld	a5,1828(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202194:	6f9c                	ld	a5,24(a5)
ffffffffc0202196:	8522                	mv	a0,s0
ffffffffc0202198:	9782                	jalr	a5
ffffffffc020219a:	842a                	mv	s0,a0
ffffffffc020219c:	ad1fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02021a0:	60a2                	ld	ra,8(sp)
ffffffffc02021a2:	8522                	mv	a0,s0
ffffffffc02021a4:	6402                	ld	s0,0(sp)
ffffffffc02021a6:	0141                	addi	sp,sp,16
ffffffffc02021a8:	8082                	ret

ffffffffc02021aa <free_pages>:
ffffffffc02021aa:	100027f3          	csrr	a5,sstatus
ffffffffc02021ae:	8b89                	andi	a5,a5,2
ffffffffc02021b0:	e799                	bnez	a5,ffffffffc02021be <free_pages+0x14>
ffffffffc02021b2:	00094797          	auipc	a5,0x94
ffffffffc02021b6:	6fe7b783          	ld	a5,1790(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021ba:	739c                	ld	a5,32(a5)
ffffffffc02021bc:	8782                	jr	a5
ffffffffc02021be:	1101                	addi	sp,sp,-32
ffffffffc02021c0:	ec06                	sd	ra,24(sp)
ffffffffc02021c2:	e822                	sd	s0,16(sp)
ffffffffc02021c4:	e426                	sd	s1,8(sp)
ffffffffc02021c6:	842a                	mv	s0,a0
ffffffffc02021c8:	84ae                	mv	s1,a1
ffffffffc02021ca:	aa9fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02021ce:	00094797          	auipc	a5,0x94
ffffffffc02021d2:	6e27b783          	ld	a5,1762(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021d6:	739c                	ld	a5,32(a5)
ffffffffc02021d8:	85a6                	mv	a1,s1
ffffffffc02021da:	8522                	mv	a0,s0
ffffffffc02021dc:	9782                	jalr	a5
ffffffffc02021de:	6442                	ld	s0,16(sp)
ffffffffc02021e0:	60e2                	ld	ra,24(sp)
ffffffffc02021e2:	64a2                	ld	s1,8(sp)
ffffffffc02021e4:	6105                	addi	sp,sp,32
ffffffffc02021e6:	a87fe06f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc02021ea <nr_free_pages>:
ffffffffc02021ea:	100027f3          	csrr	a5,sstatus
ffffffffc02021ee:	8b89                	andi	a5,a5,2
ffffffffc02021f0:	e799                	bnez	a5,ffffffffc02021fe <nr_free_pages+0x14>
ffffffffc02021f2:	00094797          	auipc	a5,0x94
ffffffffc02021f6:	6be7b783          	ld	a5,1726(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021fa:	779c                	ld	a5,40(a5)
ffffffffc02021fc:	8782                	jr	a5
ffffffffc02021fe:	1141                	addi	sp,sp,-16
ffffffffc0202200:	e406                	sd	ra,8(sp)
ffffffffc0202202:	e022                	sd	s0,0(sp)
ffffffffc0202204:	a6ffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202208:	00094797          	auipc	a5,0x94
ffffffffc020220c:	6a87b783          	ld	a5,1704(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202210:	779c                	ld	a5,40(a5)
ffffffffc0202212:	9782                	jalr	a5
ffffffffc0202214:	842a                	mv	s0,a0
ffffffffc0202216:	a57fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020221a:	60a2                	ld	ra,8(sp)
ffffffffc020221c:	8522                	mv	a0,s0
ffffffffc020221e:	6402                	ld	s0,0(sp)
ffffffffc0202220:	0141                	addi	sp,sp,16
ffffffffc0202222:	8082                	ret

ffffffffc0202224 <get_pte>:
ffffffffc0202224:	01e5d793          	srli	a5,a1,0x1e
ffffffffc0202228:	1ff7f793          	andi	a5,a5,511
ffffffffc020222c:	7139                	addi	sp,sp,-64
ffffffffc020222e:	078e                	slli	a5,a5,0x3
ffffffffc0202230:	f426                	sd	s1,40(sp)
ffffffffc0202232:	00f504b3          	add	s1,a0,a5
ffffffffc0202236:	6094                	ld	a3,0(s1)
ffffffffc0202238:	f04a                	sd	s2,32(sp)
ffffffffc020223a:	ec4e                	sd	s3,24(sp)
ffffffffc020223c:	e852                	sd	s4,16(sp)
ffffffffc020223e:	fc06                	sd	ra,56(sp)
ffffffffc0202240:	f822                	sd	s0,48(sp)
ffffffffc0202242:	e456                	sd	s5,8(sp)
ffffffffc0202244:	e05a                	sd	s6,0(sp)
ffffffffc0202246:	0016f793          	andi	a5,a3,1
ffffffffc020224a:	892e                	mv	s2,a1
ffffffffc020224c:	8a32                	mv	s4,a2
ffffffffc020224e:	00094997          	auipc	s3,0x94
ffffffffc0202252:	65298993          	addi	s3,s3,1618 # ffffffffc02968a0 <npage>
ffffffffc0202256:	efbd                	bnez	a5,ffffffffc02022d4 <get_pte+0xb0>
ffffffffc0202258:	14060c63          	beqz	a2,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020225c:	100027f3          	csrr	a5,sstatus
ffffffffc0202260:	8b89                	andi	a5,a5,2
ffffffffc0202262:	14079963          	bnez	a5,ffffffffc02023b4 <get_pte+0x190>
ffffffffc0202266:	00094797          	auipc	a5,0x94
ffffffffc020226a:	64a7b783          	ld	a5,1610(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020226e:	6f9c                	ld	a5,24(a5)
ffffffffc0202270:	4505                	li	a0,1
ffffffffc0202272:	9782                	jalr	a5
ffffffffc0202274:	842a                	mv	s0,a0
ffffffffc0202276:	12040d63          	beqz	s0,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020227a:	00094b17          	auipc	s6,0x94
ffffffffc020227e:	62eb0b13          	addi	s6,s6,1582 # ffffffffc02968a8 <pages>
ffffffffc0202282:	000b3503          	ld	a0,0(s6)
ffffffffc0202286:	00080ab7          	lui	s5,0x80
ffffffffc020228a:	00094997          	auipc	s3,0x94
ffffffffc020228e:	61698993          	addi	s3,s3,1558 # ffffffffc02968a0 <npage>
ffffffffc0202292:	40a40533          	sub	a0,s0,a0
ffffffffc0202296:	8519                	srai	a0,a0,0x6
ffffffffc0202298:	9556                	add	a0,a0,s5
ffffffffc020229a:	0009b703          	ld	a4,0(s3)
ffffffffc020229e:	00c51793          	slli	a5,a0,0xc
ffffffffc02022a2:	4685                	li	a3,1
ffffffffc02022a4:	c014                	sw	a3,0(s0)
ffffffffc02022a6:	83b1                	srli	a5,a5,0xc
ffffffffc02022a8:	0532                	slli	a0,a0,0xc
ffffffffc02022aa:	16e7f763          	bgeu	a5,a4,ffffffffc0202418 <get_pte+0x1f4>
ffffffffc02022ae:	00094797          	auipc	a5,0x94
ffffffffc02022b2:	60a7b783          	ld	a5,1546(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc02022b6:	6605                	lui	a2,0x1
ffffffffc02022b8:	4581                	li	a1,0
ffffffffc02022ba:	953e                	add	a0,a0,a5
ffffffffc02022bc:	518090ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc02022c0:	000b3683          	ld	a3,0(s6)
ffffffffc02022c4:	40d406b3          	sub	a3,s0,a3
ffffffffc02022c8:	8699                	srai	a3,a3,0x6
ffffffffc02022ca:	96d6                	add	a3,a3,s5
ffffffffc02022cc:	06aa                	slli	a3,a3,0xa
ffffffffc02022ce:	0116e693          	ori	a3,a3,17
ffffffffc02022d2:	e094                	sd	a3,0(s1)
ffffffffc02022d4:	77fd                	lui	a5,0xfffff
ffffffffc02022d6:	068a                	slli	a3,a3,0x2
ffffffffc02022d8:	0009b703          	ld	a4,0(s3)
ffffffffc02022dc:	8efd                	and	a3,a3,a5
ffffffffc02022de:	00c6d793          	srli	a5,a3,0xc
ffffffffc02022e2:	10e7ff63          	bgeu	a5,a4,ffffffffc0202400 <get_pte+0x1dc>
ffffffffc02022e6:	00094a97          	auipc	s5,0x94
ffffffffc02022ea:	5d2a8a93          	addi	s5,s5,1490 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02022ee:	000ab403          	ld	s0,0(s5)
ffffffffc02022f2:	01595793          	srli	a5,s2,0x15
ffffffffc02022f6:	1ff7f793          	andi	a5,a5,511
ffffffffc02022fa:	96a2                	add	a3,a3,s0
ffffffffc02022fc:	00379413          	slli	s0,a5,0x3
ffffffffc0202300:	9436                	add	s0,s0,a3
ffffffffc0202302:	6014                	ld	a3,0(s0)
ffffffffc0202304:	0016f793          	andi	a5,a3,1
ffffffffc0202308:	ebad                	bnez	a5,ffffffffc020237a <get_pte+0x156>
ffffffffc020230a:	0a0a0363          	beqz	s4,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020230e:	100027f3          	csrr	a5,sstatus
ffffffffc0202312:	8b89                	andi	a5,a5,2
ffffffffc0202314:	efcd                	bnez	a5,ffffffffc02023ce <get_pte+0x1aa>
ffffffffc0202316:	00094797          	auipc	a5,0x94
ffffffffc020231a:	59a7b783          	ld	a5,1434(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020231e:	6f9c                	ld	a5,24(a5)
ffffffffc0202320:	4505                	li	a0,1
ffffffffc0202322:	9782                	jalr	a5
ffffffffc0202324:	84aa                	mv	s1,a0
ffffffffc0202326:	c4c9                	beqz	s1,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc0202328:	00094b17          	auipc	s6,0x94
ffffffffc020232c:	580b0b13          	addi	s6,s6,1408 # ffffffffc02968a8 <pages>
ffffffffc0202330:	000b3503          	ld	a0,0(s6)
ffffffffc0202334:	00080a37          	lui	s4,0x80
ffffffffc0202338:	0009b703          	ld	a4,0(s3)
ffffffffc020233c:	40a48533          	sub	a0,s1,a0
ffffffffc0202340:	8519                	srai	a0,a0,0x6
ffffffffc0202342:	9552                	add	a0,a0,s4
ffffffffc0202344:	00c51793          	slli	a5,a0,0xc
ffffffffc0202348:	4685                	li	a3,1
ffffffffc020234a:	c094                	sw	a3,0(s1)
ffffffffc020234c:	83b1                	srli	a5,a5,0xc
ffffffffc020234e:	0532                	slli	a0,a0,0xc
ffffffffc0202350:	0ee7f163          	bgeu	a5,a4,ffffffffc0202432 <get_pte+0x20e>
ffffffffc0202354:	000ab783          	ld	a5,0(s5)
ffffffffc0202358:	6605                	lui	a2,0x1
ffffffffc020235a:	4581                	li	a1,0
ffffffffc020235c:	953e                	add	a0,a0,a5
ffffffffc020235e:	476090ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc0202362:	000b3683          	ld	a3,0(s6)
ffffffffc0202366:	40d486b3          	sub	a3,s1,a3
ffffffffc020236a:	8699                	srai	a3,a3,0x6
ffffffffc020236c:	96d2                	add	a3,a3,s4
ffffffffc020236e:	06aa                	slli	a3,a3,0xa
ffffffffc0202370:	0116e693          	ori	a3,a3,17
ffffffffc0202374:	e014                	sd	a3,0(s0)
ffffffffc0202376:	0009b703          	ld	a4,0(s3)
ffffffffc020237a:	068a                	slli	a3,a3,0x2
ffffffffc020237c:	757d                	lui	a0,0xfffff
ffffffffc020237e:	8ee9                	and	a3,a3,a0
ffffffffc0202380:	00c6d793          	srli	a5,a3,0xc
ffffffffc0202384:	06e7f263          	bgeu	a5,a4,ffffffffc02023e8 <get_pte+0x1c4>
ffffffffc0202388:	000ab503          	ld	a0,0(s5)
ffffffffc020238c:	00c95913          	srli	s2,s2,0xc
ffffffffc0202390:	1ff97913          	andi	s2,s2,511
ffffffffc0202394:	96aa                	add	a3,a3,a0
ffffffffc0202396:	00391513          	slli	a0,s2,0x3
ffffffffc020239a:	9536                	add	a0,a0,a3
ffffffffc020239c:	70e2                	ld	ra,56(sp)
ffffffffc020239e:	7442                	ld	s0,48(sp)
ffffffffc02023a0:	74a2                	ld	s1,40(sp)
ffffffffc02023a2:	7902                	ld	s2,32(sp)
ffffffffc02023a4:	69e2                	ld	s3,24(sp)
ffffffffc02023a6:	6a42                	ld	s4,16(sp)
ffffffffc02023a8:	6aa2                	ld	s5,8(sp)
ffffffffc02023aa:	6b02                	ld	s6,0(sp)
ffffffffc02023ac:	6121                	addi	sp,sp,64
ffffffffc02023ae:	8082                	ret
ffffffffc02023b0:	4501                	li	a0,0
ffffffffc02023b2:	b7ed                	j	ffffffffc020239c <get_pte+0x178>
ffffffffc02023b4:	8bffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02023b8:	00094797          	auipc	a5,0x94
ffffffffc02023bc:	4f87b783          	ld	a5,1272(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02023c0:	6f9c                	ld	a5,24(a5)
ffffffffc02023c2:	4505                	li	a0,1
ffffffffc02023c4:	9782                	jalr	a5
ffffffffc02023c6:	842a                	mv	s0,a0
ffffffffc02023c8:	8a5fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02023cc:	b56d                	j	ffffffffc0202276 <get_pte+0x52>
ffffffffc02023ce:	8a5fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02023d2:	00094797          	auipc	a5,0x94
ffffffffc02023d6:	4de7b783          	ld	a5,1246(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02023da:	6f9c                	ld	a5,24(a5)
ffffffffc02023dc:	4505                	li	a0,1
ffffffffc02023de:	9782                	jalr	a5
ffffffffc02023e0:	84aa                	mv	s1,a0
ffffffffc02023e2:	88bfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02023e6:	b781                	j	ffffffffc0202326 <get_pte+0x102>
ffffffffc02023e8:	0000a617          	auipc	a2,0xa
ffffffffc02023ec:	3f060613          	addi	a2,a2,1008 # ffffffffc020c7d8 <default_pmm_manager+0x38>
ffffffffc02023f0:	13200593          	li	a1,306
ffffffffc02023f4:	0000a517          	auipc	a0,0xa
ffffffffc02023f8:	4fc50513          	addi	a0,a0,1276 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02023fc:	8a2fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202400:	0000a617          	auipc	a2,0xa
ffffffffc0202404:	3d860613          	addi	a2,a2,984 # ffffffffc020c7d8 <default_pmm_manager+0x38>
ffffffffc0202408:	12500593          	li	a1,293
ffffffffc020240c:	0000a517          	auipc	a0,0xa
ffffffffc0202410:	4e450513          	addi	a0,a0,1252 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0202414:	88afe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202418:	86aa                	mv	a3,a0
ffffffffc020241a:	0000a617          	auipc	a2,0xa
ffffffffc020241e:	3be60613          	addi	a2,a2,958 # ffffffffc020c7d8 <default_pmm_manager+0x38>
ffffffffc0202422:	12100593          	li	a1,289
ffffffffc0202426:	0000a517          	auipc	a0,0xa
ffffffffc020242a:	4ca50513          	addi	a0,a0,1226 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020242e:	870fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202432:	86aa                	mv	a3,a0
ffffffffc0202434:	0000a617          	auipc	a2,0xa
ffffffffc0202438:	3a460613          	addi	a2,a2,932 # ffffffffc020c7d8 <default_pmm_manager+0x38>
ffffffffc020243c:	12f00593          	li	a1,303
ffffffffc0202440:	0000a517          	auipc	a0,0xa
ffffffffc0202444:	4b050513          	addi	a0,a0,1200 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0202448:	856fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020244c <boot_map_segment>:
ffffffffc020244c:	6785                	lui	a5,0x1
ffffffffc020244e:	7139                	addi	sp,sp,-64
ffffffffc0202450:	00d5c833          	xor	a6,a1,a3
ffffffffc0202454:	17fd                	addi	a5,a5,-1
ffffffffc0202456:	fc06                	sd	ra,56(sp)
ffffffffc0202458:	f822                	sd	s0,48(sp)
ffffffffc020245a:	f426                	sd	s1,40(sp)
ffffffffc020245c:	f04a                	sd	s2,32(sp)
ffffffffc020245e:	ec4e                	sd	s3,24(sp)
ffffffffc0202460:	e852                	sd	s4,16(sp)
ffffffffc0202462:	e456                	sd	s5,8(sp)
ffffffffc0202464:	00f87833          	and	a6,a6,a5
ffffffffc0202468:	08081563          	bnez	a6,ffffffffc02024f2 <boot_map_segment+0xa6>
ffffffffc020246c:	00f5f4b3          	and	s1,a1,a5
ffffffffc0202470:	963e                	add	a2,a2,a5
ffffffffc0202472:	94b2                	add	s1,s1,a2
ffffffffc0202474:	797d                	lui	s2,0xfffff
ffffffffc0202476:	80b1                	srli	s1,s1,0xc
ffffffffc0202478:	0125f5b3          	and	a1,a1,s2
ffffffffc020247c:	0126f6b3          	and	a3,a3,s2
ffffffffc0202480:	c0a1                	beqz	s1,ffffffffc02024c0 <boot_map_segment+0x74>
ffffffffc0202482:	00176713          	ori	a4,a4,1
ffffffffc0202486:	04b2                	slli	s1,s1,0xc
ffffffffc0202488:	02071993          	slli	s3,a4,0x20
ffffffffc020248c:	8a2a                	mv	s4,a0
ffffffffc020248e:	842e                	mv	s0,a1
ffffffffc0202490:	94ae                	add	s1,s1,a1
ffffffffc0202492:	40b68933          	sub	s2,a3,a1
ffffffffc0202496:	0209d993          	srli	s3,s3,0x20
ffffffffc020249a:	6a85                	lui	s5,0x1
ffffffffc020249c:	4605                	li	a2,1
ffffffffc020249e:	85a2                	mv	a1,s0
ffffffffc02024a0:	8552                	mv	a0,s4
ffffffffc02024a2:	d83ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02024a6:	008907b3          	add	a5,s2,s0
ffffffffc02024aa:	c505                	beqz	a0,ffffffffc02024d2 <boot_map_segment+0x86>
ffffffffc02024ac:	83b1                	srli	a5,a5,0xc
ffffffffc02024ae:	07aa                	slli	a5,a5,0xa
ffffffffc02024b0:	0137e7b3          	or	a5,a5,s3
ffffffffc02024b4:	0017e793          	ori	a5,a5,1
ffffffffc02024b8:	e11c                	sd	a5,0(a0)
ffffffffc02024ba:	9456                	add	s0,s0,s5
ffffffffc02024bc:	fe8490e3          	bne	s1,s0,ffffffffc020249c <boot_map_segment+0x50>
ffffffffc02024c0:	70e2                	ld	ra,56(sp)
ffffffffc02024c2:	7442                	ld	s0,48(sp)
ffffffffc02024c4:	74a2                	ld	s1,40(sp)
ffffffffc02024c6:	7902                	ld	s2,32(sp)
ffffffffc02024c8:	69e2                	ld	s3,24(sp)
ffffffffc02024ca:	6a42                	ld	s4,16(sp)
ffffffffc02024cc:	6aa2                	ld	s5,8(sp)
ffffffffc02024ce:	6121                	addi	sp,sp,64
ffffffffc02024d0:	8082                	ret
ffffffffc02024d2:	0000a697          	auipc	a3,0xa
ffffffffc02024d6:	44668693          	addi	a3,a3,1094 # ffffffffc020c918 <default_pmm_manager+0x178>
ffffffffc02024da:	00009617          	auipc	a2,0x9
ffffffffc02024de:	7de60613          	addi	a2,a2,2014 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02024e2:	09c00593          	li	a1,156
ffffffffc02024e6:	0000a517          	auipc	a0,0xa
ffffffffc02024ea:	40a50513          	addi	a0,a0,1034 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02024ee:	fb1fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02024f2:	0000a697          	auipc	a3,0xa
ffffffffc02024f6:	40e68693          	addi	a3,a3,1038 # ffffffffc020c900 <default_pmm_manager+0x160>
ffffffffc02024fa:	00009617          	auipc	a2,0x9
ffffffffc02024fe:	7be60613          	addi	a2,a2,1982 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0202502:	09500593          	li	a1,149
ffffffffc0202506:	0000a517          	auipc	a0,0xa
ffffffffc020250a:	3ea50513          	addi	a0,a0,1002 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020250e:	f91fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202512 <get_page>:
ffffffffc0202512:	1141                	addi	sp,sp,-16
ffffffffc0202514:	e022                	sd	s0,0(sp)
ffffffffc0202516:	8432                	mv	s0,a2
ffffffffc0202518:	4601                	li	a2,0
ffffffffc020251a:	e406                	sd	ra,8(sp)
ffffffffc020251c:	d09ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202520:	c011                	beqz	s0,ffffffffc0202524 <get_page+0x12>
ffffffffc0202522:	e008                	sd	a0,0(s0)
ffffffffc0202524:	c511                	beqz	a0,ffffffffc0202530 <get_page+0x1e>
ffffffffc0202526:	611c                	ld	a5,0(a0)
ffffffffc0202528:	4501                	li	a0,0
ffffffffc020252a:	0017f713          	andi	a4,a5,1
ffffffffc020252e:	e709                	bnez	a4,ffffffffc0202538 <get_page+0x26>
ffffffffc0202530:	60a2                	ld	ra,8(sp)
ffffffffc0202532:	6402                	ld	s0,0(sp)
ffffffffc0202534:	0141                	addi	sp,sp,16
ffffffffc0202536:	8082                	ret
ffffffffc0202538:	078a                	slli	a5,a5,0x2
ffffffffc020253a:	83b1                	srli	a5,a5,0xc
ffffffffc020253c:	00094717          	auipc	a4,0x94
ffffffffc0202540:	36473703          	ld	a4,868(a4) # ffffffffc02968a0 <npage>
ffffffffc0202544:	00e7ff63          	bgeu	a5,a4,ffffffffc0202562 <get_page+0x50>
ffffffffc0202548:	60a2                	ld	ra,8(sp)
ffffffffc020254a:	6402                	ld	s0,0(sp)
ffffffffc020254c:	fff80537          	lui	a0,0xfff80
ffffffffc0202550:	97aa                	add	a5,a5,a0
ffffffffc0202552:	079a                	slli	a5,a5,0x6
ffffffffc0202554:	00094517          	auipc	a0,0x94
ffffffffc0202558:	35453503          	ld	a0,852(a0) # ffffffffc02968a8 <pages>
ffffffffc020255c:	953e                	add	a0,a0,a5
ffffffffc020255e:	0141                	addi	sp,sp,16
ffffffffc0202560:	8082                	ret
ffffffffc0202562:	bd3ff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc0202566 <unmap_range>:
ffffffffc0202566:	7159                	addi	sp,sp,-112
ffffffffc0202568:	00c5e7b3          	or	a5,a1,a2
ffffffffc020256c:	f486                	sd	ra,104(sp)
ffffffffc020256e:	f0a2                	sd	s0,96(sp)
ffffffffc0202570:	eca6                	sd	s1,88(sp)
ffffffffc0202572:	e8ca                	sd	s2,80(sp)
ffffffffc0202574:	e4ce                	sd	s3,72(sp)
ffffffffc0202576:	e0d2                	sd	s4,64(sp)
ffffffffc0202578:	fc56                	sd	s5,56(sp)
ffffffffc020257a:	f85a                	sd	s6,48(sp)
ffffffffc020257c:	f45e                	sd	s7,40(sp)
ffffffffc020257e:	f062                	sd	s8,32(sp)
ffffffffc0202580:	ec66                	sd	s9,24(sp)
ffffffffc0202582:	e86a                	sd	s10,16(sp)
ffffffffc0202584:	17d2                	slli	a5,a5,0x34
ffffffffc0202586:	e3ed                	bnez	a5,ffffffffc0202668 <unmap_range+0x102>
ffffffffc0202588:	002007b7          	lui	a5,0x200
ffffffffc020258c:	842e                	mv	s0,a1
ffffffffc020258e:	0ef5ed63          	bltu	a1,a5,ffffffffc0202688 <unmap_range+0x122>
ffffffffc0202592:	8932                	mv	s2,a2
ffffffffc0202594:	0ec5fa63          	bgeu	a1,a2,ffffffffc0202688 <unmap_range+0x122>
ffffffffc0202598:	4785                	li	a5,1
ffffffffc020259a:	07fe                	slli	a5,a5,0x1f
ffffffffc020259c:	0ec7e663          	bltu	a5,a2,ffffffffc0202688 <unmap_range+0x122>
ffffffffc02025a0:	89aa                	mv	s3,a0
ffffffffc02025a2:	6a05                	lui	s4,0x1
ffffffffc02025a4:	00094c97          	auipc	s9,0x94
ffffffffc02025a8:	2fcc8c93          	addi	s9,s9,764 # ffffffffc02968a0 <npage>
ffffffffc02025ac:	00094c17          	auipc	s8,0x94
ffffffffc02025b0:	2fcc0c13          	addi	s8,s8,764 # ffffffffc02968a8 <pages>
ffffffffc02025b4:	fff80bb7          	lui	s7,0xfff80
ffffffffc02025b8:	00094d17          	auipc	s10,0x94
ffffffffc02025bc:	2f8d0d13          	addi	s10,s10,760 # ffffffffc02968b0 <pmm_manager>
ffffffffc02025c0:	00200b37          	lui	s6,0x200
ffffffffc02025c4:	ffe00ab7          	lui	s5,0xffe00
ffffffffc02025c8:	4601                	li	a2,0
ffffffffc02025ca:	85a2                	mv	a1,s0
ffffffffc02025cc:	854e                	mv	a0,s3
ffffffffc02025ce:	c57ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02025d2:	84aa                	mv	s1,a0
ffffffffc02025d4:	cd29                	beqz	a0,ffffffffc020262e <unmap_range+0xc8>
ffffffffc02025d6:	611c                	ld	a5,0(a0)
ffffffffc02025d8:	e395                	bnez	a5,ffffffffc02025fc <unmap_range+0x96>
ffffffffc02025da:	9452                	add	s0,s0,s4
ffffffffc02025dc:	ff2466e3          	bltu	s0,s2,ffffffffc02025c8 <unmap_range+0x62>
ffffffffc02025e0:	70a6                	ld	ra,104(sp)
ffffffffc02025e2:	7406                	ld	s0,96(sp)
ffffffffc02025e4:	64e6                	ld	s1,88(sp)
ffffffffc02025e6:	6946                	ld	s2,80(sp)
ffffffffc02025e8:	69a6                	ld	s3,72(sp)
ffffffffc02025ea:	6a06                	ld	s4,64(sp)
ffffffffc02025ec:	7ae2                	ld	s5,56(sp)
ffffffffc02025ee:	7b42                	ld	s6,48(sp)
ffffffffc02025f0:	7ba2                	ld	s7,40(sp)
ffffffffc02025f2:	7c02                	ld	s8,32(sp)
ffffffffc02025f4:	6ce2                	ld	s9,24(sp)
ffffffffc02025f6:	6d42                	ld	s10,16(sp)
ffffffffc02025f8:	6165                	addi	sp,sp,112
ffffffffc02025fa:	8082                	ret
ffffffffc02025fc:	0017f713          	andi	a4,a5,1
ffffffffc0202600:	df69                	beqz	a4,ffffffffc02025da <unmap_range+0x74>
ffffffffc0202602:	000cb703          	ld	a4,0(s9)
ffffffffc0202606:	078a                	slli	a5,a5,0x2
ffffffffc0202608:	83b1                	srli	a5,a5,0xc
ffffffffc020260a:	08e7ff63          	bgeu	a5,a4,ffffffffc02026a8 <unmap_range+0x142>
ffffffffc020260e:	000c3503          	ld	a0,0(s8)
ffffffffc0202612:	97de                	add	a5,a5,s7
ffffffffc0202614:	079a                	slli	a5,a5,0x6
ffffffffc0202616:	953e                	add	a0,a0,a5
ffffffffc0202618:	411c                	lw	a5,0(a0)
ffffffffc020261a:	fff7871b          	addiw	a4,a5,-1
ffffffffc020261e:	c118                	sw	a4,0(a0)
ffffffffc0202620:	cf11                	beqz	a4,ffffffffc020263c <unmap_range+0xd6>
ffffffffc0202622:	0004b023          	sd	zero,0(s1)
ffffffffc0202626:	12040073          	sfence.vma	s0
ffffffffc020262a:	9452                	add	s0,s0,s4
ffffffffc020262c:	bf45                	j	ffffffffc02025dc <unmap_range+0x76>
ffffffffc020262e:	945a                	add	s0,s0,s6
ffffffffc0202630:	01547433          	and	s0,s0,s5
ffffffffc0202634:	d455                	beqz	s0,ffffffffc02025e0 <unmap_range+0x7a>
ffffffffc0202636:	f92469e3          	bltu	s0,s2,ffffffffc02025c8 <unmap_range+0x62>
ffffffffc020263a:	b75d                	j	ffffffffc02025e0 <unmap_range+0x7a>
ffffffffc020263c:	100027f3          	csrr	a5,sstatus
ffffffffc0202640:	8b89                	andi	a5,a5,2
ffffffffc0202642:	e799                	bnez	a5,ffffffffc0202650 <unmap_range+0xea>
ffffffffc0202644:	000d3783          	ld	a5,0(s10)
ffffffffc0202648:	4585                	li	a1,1
ffffffffc020264a:	739c                	ld	a5,32(a5)
ffffffffc020264c:	9782                	jalr	a5
ffffffffc020264e:	bfd1                	j	ffffffffc0202622 <unmap_range+0xbc>
ffffffffc0202650:	e42a                	sd	a0,8(sp)
ffffffffc0202652:	e20fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202656:	000d3783          	ld	a5,0(s10)
ffffffffc020265a:	6522                	ld	a0,8(sp)
ffffffffc020265c:	4585                	li	a1,1
ffffffffc020265e:	739c                	ld	a5,32(a5)
ffffffffc0202660:	9782                	jalr	a5
ffffffffc0202662:	e0afe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202666:	bf75                	j	ffffffffc0202622 <unmap_range+0xbc>
ffffffffc0202668:	0000a697          	auipc	a3,0xa
ffffffffc020266c:	2c068693          	addi	a3,a3,704 # ffffffffc020c928 <default_pmm_manager+0x188>
ffffffffc0202670:	00009617          	auipc	a2,0x9
ffffffffc0202674:	64860613          	addi	a2,a2,1608 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0202678:	15a00593          	li	a1,346
ffffffffc020267c:	0000a517          	auipc	a0,0xa
ffffffffc0202680:	27450513          	addi	a0,a0,628 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0202684:	e1bfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202688:	0000a697          	auipc	a3,0xa
ffffffffc020268c:	2d068693          	addi	a3,a3,720 # ffffffffc020c958 <default_pmm_manager+0x1b8>
ffffffffc0202690:	00009617          	auipc	a2,0x9
ffffffffc0202694:	62860613          	addi	a2,a2,1576 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0202698:	15b00593          	li	a1,347
ffffffffc020269c:	0000a517          	auipc	a0,0xa
ffffffffc02026a0:	25450513          	addi	a0,a0,596 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02026a4:	dfbfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02026a8:	a8dff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc02026ac <exit_range>:
ffffffffc02026ac:	7119                	addi	sp,sp,-128
ffffffffc02026ae:	00c5e7b3          	or	a5,a1,a2
ffffffffc02026b2:	fc86                	sd	ra,120(sp)
ffffffffc02026b4:	f8a2                	sd	s0,112(sp)
ffffffffc02026b6:	f4a6                	sd	s1,104(sp)
ffffffffc02026b8:	f0ca                	sd	s2,96(sp)
ffffffffc02026ba:	ecce                	sd	s3,88(sp)
ffffffffc02026bc:	e8d2                	sd	s4,80(sp)
ffffffffc02026be:	e4d6                	sd	s5,72(sp)
ffffffffc02026c0:	e0da                	sd	s6,64(sp)
ffffffffc02026c2:	fc5e                	sd	s7,56(sp)
ffffffffc02026c4:	f862                	sd	s8,48(sp)
ffffffffc02026c6:	f466                	sd	s9,40(sp)
ffffffffc02026c8:	f06a                	sd	s10,32(sp)
ffffffffc02026ca:	ec6e                	sd	s11,24(sp)
ffffffffc02026cc:	17d2                	slli	a5,a5,0x34
ffffffffc02026ce:	20079a63          	bnez	a5,ffffffffc02028e2 <exit_range+0x236>
ffffffffc02026d2:	002007b7          	lui	a5,0x200
ffffffffc02026d6:	24f5e463          	bltu	a1,a5,ffffffffc020291e <exit_range+0x272>
ffffffffc02026da:	8ab2                	mv	s5,a2
ffffffffc02026dc:	24c5f163          	bgeu	a1,a2,ffffffffc020291e <exit_range+0x272>
ffffffffc02026e0:	4785                	li	a5,1
ffffffffc02026e2:	07fe                	slli	a5,a5,0x1f
ffffffffc02026e4:	22c7ed63          	bltu	a5,a2,ffffffffc020291e <exit_range+0x272>
ffffffffc02026e8:	c00009b7          	lui	s3,0xc0000
ffffffffc02026ec:	0135f9b3          	and	s3,a1,s3
ffffffffc02026f0:	ffe00937          	lui	s2,0xffe00
ffffffffc02026f4:	400007b7          	lui	a5,0x40000
ffffffffc02026f8:	5cfd                	li	s9,-1
ffffffffc02026fa:	8c2a                	mv	s8,a0
ffffffffc02026fc:	0125f933          	and	s2,a1,s2
ffffffffc0202700:	99be                	add	s3,s3,a5
ffffffffc0202702:	00094d17          	auipc	s10,0x94
ffffffffc0202706:	19ed0d13          	addi	s10,s10,414 # ffffffffc02968a0 <npage>
ffffffffc020270a:	00ccdc93          	srli	s9,s9,0xc
ffffffffc020270e:	00094717          	auipc	a4,0x94
ffffffffc0202712:	19a70713          	addi	a4,a4,410 # ffffffffc02968a8 <pages>
ffffffffc0202716:	00094d97          	auipc	s11,0x94
ffffffffc020271a:	19ad8d93          	addi	s11,s11,410 # ffffffffc02968b0 <pmm_manager>
ffffffffc020271e:	c0000437          	lui	s0,0xc0000
ffffffffc0202722:	944e                	add	s0,s0,s3
ffffffffc0202724:	8079                	srli	s0,s0,0x1e
ffffffffc0202726:	1ff47413          	andi	s0,s0,511
ffffffffc020272a:	040e                	slli	s0,s0,0x3
ffffffffc020272c:	9462                	add	s0,s0,s8
ffffffffc020272e:	00043a03          	ld	s4,0(s0) # ffffffffc0000000 <_binary_bin_sfs_img_size+0xffffffffbff8ad00>
ffffffffc0202732:	001a7793          	andi	a5,s4,1
ffffffffc0202736:	eb99                	bnez	a5,ffffffffc020274c <exit_range+0xa0>
ffffffffc0202738:	12098463          	beqz	s3,ffffffffc0202860 <exit_range+0x1b4>
ffffffffc020273c:	400007b7          	lui	a5,0x40000
ffffffffc0202740:	97ce                	add	a5,a5,s3
ffffffffc0202742:	894e                	mv	s2,s3
ffffffffc0202744:	1159fe63          	bgeu	s3,s5,ffffffffc0202860 <exit_range+0x1b4>
ffffffffc0202748:	89be                	mv	s3,a5
ffffffffc020274a:	bfd1                	j	ffffffffc020271e <exit_range+0x72>
ffffffffc020274c:	000d3783          	ld	a5,0(s10)
ffffffffc0202750:	0a0a                	slli	s4,s4,0x2
ffffffffc0202752:	00ca5a13          	srli	s4,s4,0xc
ffffffffc0202756:	1cfa7263          	bgeu	s4,a5,ffffffffc020291a <exit_range+0x26e>
ffffffffc020275a:	fff80637          	lui	a2,0xfff80
ffffffffc020275e:	9652                	add	a2,a2,s4
ffffffffc0202760:	000806b7          	lui	a3,0x80
ffffffffc0202764:	96b2                	add	a3,a3,a2
ffffffffc0202766:	0196f5b3          	and	a1,a3,s9
ffffffffc020276a:	061a                	slli	a2,a2,0x6
ffffffffc020276c:	06b2                	slli	a3,a3,0xc
ffffffffc020276e:	18f5fa63          	bgeu	a1,a5,ffffffffc0202902 <exit_range+0x256>
ffffffffc0202772:	00094817          	auipc	a6,0x94
ffffffffc0202776:	14680813          	addi	a6,a6,326 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020277a:	00083b03          	ld	s6,0(a6)
ffffffffc020277e:	4b85                	li	s7,1
ffffffffc0202780:	fff80e37          	lui	t3,0xfff80
ffffffffc0202784:	9b36                	add	s6,s6,a3
ffffffffc0202786:	00080337          	lui	t1,0x80
ffffffffc020278a:	6885                	lui	a7,0x1
ffffffffc020278c:	a819                	j	ffffffffc02027a2 <exit_range+0xf6>
ffffffffc020278e:	4b81                	li	s7,0
ffffffffc0202790:	002007b7          	lui	a5,0x200
ffffffffc0202794:	993e                	add	s2,s2,a5
ffffffffc0202796:	08090c63          	beqz	s2,ffffffffc020282e <exit_range+0x182>
ffffffffc020279a:	09397a63          	bgeu	s2,s3,ffffffffc020282e <exit_range+0x182>
ffffffffc020279e:	0f597063          	bgeu	s2,s5,ffffffffc020287e <exit_range+0x1d2>
ffffffffc02027a2:	01595493          	srli	s1,s2,0x15
ffffffffc02027a6:	1ff4f493          	andi	s1,s1,511
ffffffffc02027aa:	048e                	slli	s1,s1,0x3
ffffffffc02027ac:	94da                	add	s1,s1,s6
ffffffffc02027ae:	609c                	ld	a5,0(s1)
ffffffffc02027b0:	0017f693          	andi	a3,a5,1
ffffffffc02027b4:	dee9                	beqz	a3,ffffffffc020278e <exit_range+0xe2>
ffffffffc02027b6:	000d3583          	ld	a1,0(s10)
ffffffffc02027ba:	078a                	slli	a5,a5,0x2
ffffffffc02027bc:	83b1                	srli	a5,a5,0xc
ffffffffc02027be:	14b7fe63          	bgeu	a5,a1,ffffffffc020291a <exit_range+0x26e>
ffffffffc02027c2:	97f2                	add	a5,a5,t3
ffffffffc02027c4:	006786b3          	add	a3,a5,t1
ffffffffc02027c8:	0196feb3          	and	t4,a3,s9
ffffffffc02027cc:	00679513          	slli	a0,a5,0x6
ffffffffc02027d0:	06b2                	slli	a3,a3,0xc
ffffffffc02027d2:	12bef863          	bgeu	t4,a1,ffffffffc0202902 <exit_range+0x256>
ffffffffc02027d6:	00083783          	ld	a5,0(a6)
ffffffffc02027da:	96be                	add	a3,a3,a5
ffffffffc02027dc:	011685b3          	add	a1,a3,a7
ffffffffc02027e0:	629c                	ld	a5,0(a3)
ffffffffc02027e2:	8b85                	andi	a5,a5,1
ffffffffc02027e4:	f7d5                	bnez	a5,ffffffffc0202790 <exit_range+0xe4>
ffffffffc02027e6:	06a1                	addi	a3,a3,8
ffffffffc02027e8:	fed59ce3          	bne	a1,a3,ffffffffc02027e0 <exit_range+0x134>
ffffffffc02027ec:	631c                	ld	a5,0(a4)
ffffffffc02027ee:	953e                	add	a0,a0,a5
ffffffffc02027f0:	100027f3          	csrr	a5,sstatus
ffffffffc02027f4:	8b89                	andi	a5,a5,2
ffffffffc02027f6:	e7d9                	bnez	a5,ffffffffc0202884 <exit_range+0x1d8>
ffffffffc02027f8:	000db783          	ld	a5,0(s11)
ffffffffc02027fc:	4585                	li	a1,1
ffffffffc02027fe:	e032                	sd	a2,0(sp)
ffffffffc0202800:	739c                	ld	a5,32(a5)
ffffffffc0202802:	9782                	jalr	a5
ffffffffc0202804:	6602                	ld	a2,0(sp)
ffffffffc0202806:	00094817          	auipc	a6,0x94
ffffffffc020280a:	0b280813          	addi	a6,a6,178 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020280e:	fff80e37          	lui	t3,0xfff80
ffffffffc0202812:	00080337          	lui	t1,0x80
ffffffffc0202816:	6885                	lui	a7,0x1
ffffffffc0202818:	00094717          	auipc	a4,0x94
ffffffffc020281c:	09070713          	addi	a4,a4,144 # ffffffffc02968a8 <pages>
ffffffffc0202820:	0004b023          	sd	zero,0(s1)
ffffffffc0202824:	002007b7          	lui	a5,0x200
ffffffffc0202828:	993e                	add	s2,s2,a5
ffffffffc020282a:	f60918e3          	bnez	s2,ffffffffc020279a <exit_range+0xee>
ffffffffc020282e:	f00b85e3          	beqz	s7,ffffffffc0202738 <exit_range+0x8c>
ffffffffc0202832:	000d3783          	ld	a5,0(s10)
ffffffffc0202836:	0efa7263          	bgeu	s4,a5,ffffffffc020291a <exit_range+0x26e>
ffffffffc020283a:	6308                	ld	a0,0(a4)
ffffffffc020283c:	9532                	add	a0,a0,a2
ffffffffc020283e:	100027f3          	csrr	a5,sstatus
ffffffffc0202842:	8b89                	andi	a5,a5,2
ffffffffc0202844:	efad                	bnez	a5,ffffffffc02028be <exit_range+0x212>
ffffffffc0202846:	000db783          	ld	a5,0(s11)
ffffffffc020284a:	4585                	li	a1,1
ffffffffc020284c:	739c                	ld	a5,32(a5)
ffffffffc020284e:	9782                	jalr	a5
ffffffffc0202850:	00094717          	auipc	a4,0x94
ffffffffc0202854:	05870713          	addi	a4,a4,88 # ffffffffc02968a8 <pages>
ffffffffc0202858:	00043023          	sd	zero,0(s0)
ffffffffc020285c:	ee0990e3          	bnez	s3,ffffffffc020273c <exit_range+0x90>
ffffffffc0202860:	70e6                	ld	ra,120(sp)
ffffffffc0202862:	7446                	ld	s0,112(sp)
ffffffffc0202864:	74a6                	ld	s1,104(sp)
ffffffffc0202866:	7906                	ld	s2,96(sp)
ffffffffc0202868:	69e6                	ld	s3,88(sp)
ffffffffc020286a:	6a46                	ld	s4,80(sp)
ffffffffc020286c:	6aa6                	ld	s5,72(sp)
ffffffffc020286e:	6b06                	ld	s6,64(sp)
ffffffffc0202870:	7be2                	ld	s7,56(sp)
ffffffffc0202872:	7c42                	ld	s8,48(sp)
ffffffffc0202874:	7ca2                	ld	s9,40(sp)
ffffffffc0202876:	7d02                	ld	s10,32(sp)
ffffffffc0202878:	6de2                	ld	s11,24(sp)
ffffffffc020287a:	6109                	addi	sp,sp,128
ffffffffc020287c:	8082                	ret
ffffffffc020287e:	ea0b8fe3          	beqz	s7,ffffffffc020273c <exit_range+0x90>
ffffffffc0202882:	bf45                	j	ffffffffc0202832 <exit_range+0x186>
ffffffffc0202884:	e032                	sd	a2,0(sp)
ffffffffc0202886:	e42a                	sd	a0,8(sp)
ffffffffc0202888:	beafe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020288c:	000db783          	ld	a5,0(s11)
ffffffffc0202890:	6522                	ld	a0,8(sp)
ffffffffc0202892:	4585                	li	a1,1
ffffffffc0202894:	739c                	ld	a5,32(a5)
ffffffffc0202896:	9782                	jalr	a5
ffffffffc0202898:	bd4fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020289c:	6602                	ld	a2,0(sp)
ffffffffc020289e:	00094717          	auipc	a4,0x94
ffffffffc02028a2:	00a70713          	addi	a4,a4,10 # ffffffffc02968a8 <pages>
ffffffffc02028a6:	6885                	lui	a7,0x1
ffffffffc02028a8:	00080337          	lui	t1,0x80
ffffffffc02028ac:	fff80e37          	lui	t3,0xfff80
ffffffffc02028b0:	00094817          	auipc	a6,0x94
ffffffffc02028b4:	00880813          	addi	a6,a6,8 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02028b8:	0004b023          	sd	zero,0(s1)
ffffffffc02028bc:	b7a5                	j	ffffffffc0202824 <exit_range+0x178>
ffffffffc02028be:	e02a                	sd	a0,0(sp)
ffffffffc02028c0:	bb2fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02028c4:	000db783          	ld	a5,0(s11)
ffffffffc02028c8:	6502                	ld	a0,0(sp)
ffffffffc02028ca:	4585                	li	a1,1
ffffffffc02028cc:	739c                	ld	a5,32(a5)
ffffffffc02028ce:	9782                	jalr	a5
ffffffffc02028d0:	b9cfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02028d4:	00094717          	auipc	a4,0x94
ffffffffc02028d8:	fd470713          	addi	a4,a4,-44 # ffffffffc02968a8 <pages>
ffffffffc02028dc:	00043023          	sd	zero,0(s0)
ffffffffc02028e0:	bfb5                	j	ffffffffc020285c <exit_range+0x1b0>
ffffffffc02028e2:	0000a697          	auipc	a3,0xa
ffffffffc02028e6:	04668693          	addi	a3,a3,70 # ffffffffc020c928 <default_pmm_manager+0x188>
ffffffffc02028ea:	00009617          	auipc	a2,0x9
ffffffffc02028ee:	3ce60613          	addi	a2,a2,974 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02028f2:	16f00593          	li	a1,367
ffffffffc02028f6:	0000a517          	auipc	a0,0xa
ffffffffc02028fa:	ffa50513          	addi	a0,a0,-6 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02028fe:	ba1fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202902:	0000a617          	auipc	a2,0xa
ffffffffc0202906:	ed660613          	addi	a2,a2,-298 # ffffffffc020c7d8 <default_pmm_manager+0x38>
ffffffffc020290a:	07100593          	li	a1,113
ffffffffc020290e:	0000a517          	auipc	a0,0xa
ffffffffc0202912:	ef250513          	addi	a0,a0,-270 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc0202916:	b89fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020291a:	81bff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>
ffffffffc020291e:	0000a697          	auipc	a3,0xa
ffffffffc0202922:	03a68693          	addi	a3,a3,58 # ffffffffc020c958 <default_pmm_manager+0x1b8>
ffffffffc0202926:	00009617          	auipc	a2,0x9
ffffffffc020292a:	39260613          	addi	a2,a2,914 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020292e:	17000593          	li	a1,368
ffffffffc0202932:	0000a517          	auipc	a0,0xa
ffffffffc0202936:	fbe50513          	addi	a0,a0,-66 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020293a:	b65fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020293e <page_remove>:
ffffffffc020293e:	7179                	addi	sp,sp,-48
ffffffffc0202940:	4601                	li	a2,0
ffffffffc0202942:	ec26                	sd	s1,24(sp)
ffffffffc0202944:	f406                	sd	ra,40(sp)
ffffffffc0202946:	f022                	sd	s0,32(sp)
ffffffffc0202948:	84ae                	mv	s1,a1
ffffffffc020294a:	8dbff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc020294e:	c511                	beqz	a0,ffffffffc020295a <page_remove+0x1c>
ffffffffc0202950:	611c                	ld	a5,0(a0)
ffffffffc0202952:	842a                	mv	s0,a0
ffffffffc0202954:	0017f713          	andi	a4,a5,1
ffffffffc0202958:	e711                	bnez	a4,ffffffffc0202964 <page_remove+0x26>
ffffffffc020295a:	70a2                	ld	ra,40(sp)
ffffffffc020295c:	7402                	ld	s0,32(sp)
ffffffffc020295e:	64e2                	ld	s1,24(sp)
ffffffffc0202960:	6145                	addi	sp,sp,48
ffffffffc0202962:	8082                	ret
ffffffffc0202964:	078a                	slli	a5,a5,0x2
ffffffffc0202966:	83b1                	srli	a5,a5,0xc
ffffffffc0202968:	00094717          	auipc	a4,0x94
ffffffffc020296c:	f3873703          	ld	a4,-200(a4) # ffffffffc02968a0 <npage>
ffffffffc0202970:	06e7f363          	bgeu	a5,a4,ffffffffc02029d6 <page_remove+0x98>
ffffffffc0202974:	fff80537          	lui	a0,0xfff80
ffffffffc0202978:	97aa                	add	a5,a5,a0
ffffffffc020297a:	079a                	slli	a5,a5,0x6
ffffffffc020297c:	00094517          	auipc	a0,0x94
ffffffffc0202980:	f2c53503          	ld	a0,-212(a0) # ffffffffc02968a8 <pages>
ffffffffc0202984:	953e                	add	a0,a0,a5
ffffffffc0202986:	411c                	lw	a5,0(a0)
ffffffffc0202988:	fff7871b          	addiw	a4,a5,-1
ffffffffc020298c:	c118                	sw	a4,0(a0)
ffffffffc020298e:	cb11                	beqz	a4,ffffffffc02029a2 <page_remove+0x64>
ffffffffc0202990:	00043023          	sd	zero,0(s0)
ffffffffc0202994:	12048073          	sfence.vma	s1
ffffffffc0202998:	70a2                	ld	ra,40(sp)
ffffffffc020299a:	7402                	ld	s0,32(sp)
ffffffffc020299c:	64e2                	ld	s1,24(sp)
ffffffffc020299e:	6145                	addi	sp,sp,48
ffffffffc02029a0:	8082                	ret
ffffffffc02029a2:	100027f3          	csrr	a5,sstatus
ffffffffc02029a6:	8b89                	andi	a5,a5,2
ffffffffc02029a8:	eb89                	bnez	a5,ffffffffc02029ba <page_remove+0x7c>
ffffffffc02029aa:	00094797          	auipc	a5,0x94
ffffffffc02029ae:	f067b783          	ld	a5,-250(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02029b2:	739c                	ld	a5,32(a5)
ffffffffc02029b4:	4585                	li	a1,1
ffffffffc02029b6:	9782                	jalr	a5
ffffffffc02029b8:	bfe1                	j	ffffffffc0202990 <page_remove+0x52>
ffffffffc02029ba:	e42a                	sd	a0,8(sp)
ffffffffc02029bc:	ab6fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02029c0:	00094797          	auipc	a5,0x94
ffffffffc02029c4:	ef07b783          	ld	a5,-272(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02029c8:	739c                	ld	a5,32(a5)
ffffffffc02029ca:	6522                	ld	a0,8(sp)
ffffffffc02029cc:	4585                	li	a1,1
ffffffffc02029ce:	9782                	jalr	a5
ffffffffc02029d0:	a9cfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02029d4:	bf75                	j	ffffffffc0202990 <page_remove+0x52>
ffffffffc02029d6:	f5eff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc02029da <page_insert>:
ffffffffc02029da:	7139                	addi	sp,sp,-64
ffffffffc02029dc:	e852                	sd	s4,16(sp)
ffffffffc02029de:	8a32                	mv	s4,a2
ffffffffc02029e0:	f822                	sd	s0,48(sp)
ffffffffc02029e2:	4605                	li	a2,1
ffffffffc02029e4:	842e                	mv	s0,a1
ffffffffc02029e6:	85d2                	mv	a1,s4
ffffffffc02029e8:	f426                	sd	s1,40(sp)
ffffffffc02029ea:	fc06                	sd	ra,56(sp)
ffffffffc02029ec:	f04a                	sd	s2,32(sp)
ffffffffc02029ee:	ec4e                	sd	s3,24(sp)
ffffffffc02029f0:	e456                	sd	s5,8(sp)
ffffffffc02029f2:	84b6                	mv	s1,a3
ffffffffc02029f4:	831ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02029f8:	c961                	beqz	a0,ffffffffc0202ac8 <page_insert+0xee>
ffffffffc02029fa:	4014                	lw	a3,0(s0)
ffffffffc02029fc:	611c                	ld	a5,0(a0)
ffffffffc02029fe:	89aa                	mv	s3,a0
ffffffffc0202a00:	0016871b          	addiw	a4,a3,1
ffffffffc0202a04:	c018                	sw	a4,0(s0)
ffffffffc0202a06:	0017f713          	andi	a4,a5,1
ffffffffc0202a0a:	ef05                	bnez	a4,ffffffffc0202a42 <page_insert+0x68>
ffffffffc0202a0c:	00094717          	auipc	a4,0x94
ffffffffc0202a10:	e9c73703          	ld	a4,-356(a4) # ffffffffc02968a8 <pages>
ffffffffc0202a14:	8c19                	sub	s0,s0,a4
ffffffffc0202a16:	000807b7          	lui	a5,0x80
ffffffffc0202a1a:	8419                	srai	s0,s0,0x6
ffffffffc0202a1c:	943e                	add	s0,s0,a5
ffffffffc0202a1e:	042a                	slli	s0,s0,0xa
ffffffffc0202a20:	8cc1                	or	s1,s1,s0
ffffffffc0202a22:	0014e493          	ori	s1,s1,1
ffffffffc0202a26:	0099b023          	sd	s1,0(s3) # ffffffffc0000000 <_binary_bin_sfs_img_size+0xffffffffbff8ad00>
ffffffffc0202a2a:	120a0073          	sfence.vma	s4
ffffffffc0202a2e:	4501                	li	a0,0
ffffffffc0202a30:	70e2                	ld	ra,56(sp)
ffffffffc0202a32:	7442                	ld	s0,48(sp)
ffffffffc0202a34:	74a2                	ld	s1,40(sp)
ffffffffc0202a36:	7902                	ld	s2,32(sp)
ffffffffc0202a38:	69e2                	ld	s3,24(sp)
ffffffffc0202a3a:	6a42                	ld	s4,16(sp)
ffffffffc0202a3c:	6aa2                	ld	s5,8(sp)
ffffffffc0202a3e:	6121                	addi	sp,sp,64
ffffffffc0202a40:	8082                	ret
ffffffffc0202a42:	078a                	slli	a5,a5,0x2
ffffffffc0202a44:	83b1                	srli	a5,a5,0xc
ffffffffc0202a46:	00094717          	auipc	a4,0x94
ffffffffc0202a4a:	e5a73703          	ld	a4,-422(a4) # ffffffffc02968a0 <npage>
ffffffffc0202a4e:	06e7ff63          	bgeu	a5,a4,ffffffffc0202acc <page_insert+0xf2>
ffffffffc0202a52:	00094a97          	auipc	s5,0x94
ffffffffc0202a56:	e56a8a93          	addi	s5,s5,-426 # ffffffffc02968a8 <pages>
ffffffffc0202a5a:	000ab703          	ld	a4,0(s5)
ffffffffc0202a5e:	fff80937          	lui	s2,0xfff80
ffffffffc0202a62:	993e                	add	s2,s2,a5
ffffffffc0202a64:	091a                	slli	s2,s2,0x6
ffffffffc0202a66:	993a                	add	s2,s2,a4
ffffffffc0202a68:	01240c63          	beq	s0,s2,ffffffffc0202a80 <page_insert+0xa6>
ffffffffc0202a6c:	00092783          	lw	a5,0(s2) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202a70:	fff7869b          	addiw	a3,a5,-1
ffffffffc0202a74:	00d92023          	sw	a3,0(s2)
ffffffffc0202a78:	c691                	beqz	a3,ffffffffc0202a84 <page_insert+0xaa>
ffffffffc0202a7a:	120a0073          	sfence.vma	s4
ffffffffc0202a7e:	bf59                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202a80:	c014                	sw	a3,0(s0)
ffffffffc0202a82:	bf49                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202a84:	100027f3          	csrr	a5,sstatus
ffffffffc0202a88:	8b89                	andi	a5,a5,2
ffffffffc0202a8a:	ef91                	bnez	a5,ffffffffc0202aa6 <page_insert+0xcc>
ffffffffc0202a8c:	00094797          	auipc	a5,0x94
ffffffffc0202a90:	e247b783          	ld	a5,-476(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202a94:	739c                	ld	a5,32(a5)
ffffffffc0202a96:	4585                	li	a1,1
ffffffffc0202a98:	854a                	mv	a0,s2
ffffffffc0202a9a:	9782                	jalr	a5
ffffffffc0202a9c:	000ab703          	ld	a4,0(s5)
ffffffffc0202aa0:	120a0073          	sfence.vma	s4
ffffffffc0202aa4:	bf85                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202aa6:	9ccfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202aaa:	00094797          	auipc	a5,0x94
ffffffffc0202aae:	e067b783          	ld	a5,-506(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202ab2:	739c                	ld	a5,32(a5)
ffffffffc0202ab4:	4585                	li	a1,1
ffffffffc0202ab6:	854a                	mv	a0,s2
ffffffffc0202ab8:	9782                	jalr	a5
ffffffffc0202aba:	9b2fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202abe:	000ab703          	ld	a4,0(s5)
ffffffffc0202ac2:	120a0073          	sfence.vma	s4
ffffffffc0202ac6:	b7b9                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202ac8:	5571                	li	a0,-4
ffffffffc0202aca:	b79d                	j	ffffffffc0202a30 <page_insert+0x56>
ffffffffc0202acc:	e68ff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc0202ad0 <pmm_init>:
ffffffffc0202ad0:	0000a797          	auipc	a5,0xa
ffffffffc0202ad4:	cd078793          	addi	a5,a5,-816 # ffffffffc020c7a0 <default_pmm_manager>
ffffffffc0202ad8:	638c                	ld	a1,0(a5)
ffffffffc0202ada:	7159                	addi	sp,sp,-112
ffffffffc0202adc:	f85a                	sd	s6,48(sp)
ffffffffc0202ade:	0000a517          	auipc	a0,0xa
ffffffffc0202ae2:	e9250513          	addi	a0,a0,-366 # ffffffffc020c970 <default_pmm_manager+0x1d0>
ffffffffc0202ae6:	00094b17          	auipc	s6,0x94
ffffffffc0202aea:	dcab0b13          	addi	s6,s6,-566 # ffffffffc02968b0 <pmm_manager>
ffffffffc0202aee:	f486                	sd	ra,104(sp)
ffffffffc0202af0:	e8ca                	sd	s2,80(sp)
ffffffffc0202af2:	e4ce                	sd	s3,72(sp)
ffffffffc0202af4:	f0a2                	sd	s0,96(sp)
ffffffffc0202af6:	eca6                	sd	s1,88(sp)
ffffffffc0202af8:	e0d2                	sd	s4,64(sp)
ffffffffc0202afa:	fc56                	sd	s5,56(sp)
ffffffffc0202afc:	f45e                	sd	s7,40(sp)
ffffffffc0202afe:	f062                	sd	s8,32(sp)
ffffffffc0202b00:	ec66                	sd	s9,24(sp)
ffffffffc0202b02:	00fb3023          	sd	a5,0(s6)
ffffffffc0202b06:	ea0fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b0a:	000b3783          	ld	a5,0(s6)
ffffffffc0202b0e:	00094997          	auipc	s3,0x94
ffffffffc0202b12:	daa98993          	addi	s3,s3,-598 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202b16:	679c                	ld	a5,8(a5)
ffffffffc0202b18:	9782                	jalr	a5
ffffffffc0202b1a:	57f5                	li	a5,-3
ffffffffc0202b1c:	07fa                	slli	a5,a5,0x1e
ffffffffc0202b1e:	00f9b023          	sd	a5,0(s3)
ffffffffc0202b22:	f27fd0ef          	jal	ra,ffffffffc0200a48 <get_memory_base>
ffffffffc0202b26:	892a                	mv	s2,a0
ffffffffc0202b28:	f2bfd0ef          	jal	ra,ffffffffc0200a52 <get_memory_size>
ffffffffc0202b2c:	280502e3          	beqz	a0,ffffffffc02035b0 <pmm_init+0xae0>
ffffffffc0202b30:	84aa                	mv	s1,a0
ffffffffc0202b32:	0000a517          	auipc	a0,0xa
ffffffffc0202b36:	e7650513          	addi	a0,a0,-394 # ffffffffc020c9a8 <default_pmm_manager+0x208>
ffffffffc0202b3a:	e6cfd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b3e:	00990433          	add	s0,s2,s1
ffffffffc0202b42:	fff40693          	addi	a3,s0,-1
ffffffffc0202b46:	864a                	mv	a2,s2
ffffffffc0202b48:	85a6                	mv	a1,s1
ffffffffc0202b4a:	0000a517          	auipc	a0,0xa
ffffffffc0202b4e:	e7650513          	addi	a0,a0,-394 # ffffffffc020c9c0 <default_pmm_manager+0x220>
ffffffffc0202b52:	e54fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b56:	c8000737          	lui	a4,0xc8000
ffffffffc0202b5a:	87a2                	mv	a5,s0
ffffffffc0202b5c:	5e876e63          	bltu	a4,s0,ffffffffc0203158 <pmm_init+0x688>
ffffffffc0202b60:	757d                	lui	a0,0xfffff
ffffffffc0202b62:	00095617          	auipc	a2,0x95
ffffffffc0202b66:	dad60613          	addi	a2,a2,-595 # ffffffffc029790f <end+0xfff>
ffffffffc0202b6a:	8e69                	and	a2,a2,a0
ffffffffc0202b6c:	00094497          	auipc	s1,0x94
ffffffffc0202b70:	d3448493          	addi	s1,s1,-716 # ffffffffc02968a0 <npage>
ffffffffc0202b74:	00c7d513          	srli	a0,a5,0xc
ffffffffc0202b78:	00094b97          	auipc	s7,0x94
ffffffffc0202b7c:	d30b8b93          	addi	s7,s7,-720 # ffffffffc02968a8 <pages>
ffffffffc0202b80:	e088                	sd	a0,0(s1)
ffffffffc0202b82:	00cbb023          	sd	a2,0(s7)
ffffffffc0202b86:	000807b7          	lui	a5,0x80
ffffffffc0202b8a:	86b2                	mv	a3,a2
ffffffffc0202b8c:	02f50863          	beq	a0,a5,ffffffffc0202bbc <pmm_init+0xec>
ffffffffc0202b90:	4781                	li	a5,0
ffffffffc0202b92:	4585                	li	a1,1
ffffffffc0202b94:	fff806b7          	lui	a3,0xfff80
ffffffffc0202b98:	00679513          	slli	a0,a5,0x6
ffffffffc0202b9c:	9532                	add	a0,a0,a2
ffffffffc0202b9e:	00850713          	addi	a4,a0,8 # fffffffffffff008 <end+0x3fd686f8>
ffffffffc0202ba2:	40b7302f          	amoor.d	zero,a1,(a4)
ffffffffc0202ba6:	6088                	ld	a0,0(s1)
ffffffffc0202ba8:	0785                	addi	a5,a5,1
ffffffffc0202baa:	000bb603          	ld	a2,0(s7)
ffffffffc0202bae:	00d50733          	add	a4,a0,a3
ffffffffc0202bb2:	fee7e3e3          	bltu	a5,a4,ffffffffc0202b98 <pmm_init+0xc8>
ffffffffc0202bb6:	071a                	slli	a4,a4,0x6
ffffffffc0202bb8:	00e606b3          	add	a3,a2,a4
ffffffffc0202bbc:	c02007b7          	lui	a5,0xc0200
ffffffffc0202bc0:	3af6eae3          	bltu	a3,a5,ffffffffc0203774 <pmm_init+0xca4>
ffffffffc0202bc4:	0009b583          	ld	a1,0(s3)
ffffffffc0202bc8:	77fd                	lui	a5,0xfffff
ffffffffc0202bca:	8c7d                	and	s0,s0,a5
ffffffffc0202bcc:	8e8d                	sub	a3,a3,a1
ffffffffc0202bce:	5e86e363          	bltu	a3,s0,ffffffffc02031b4 <pmm_init+0x6e4>
ffffffffc0202bd2:	0000a517          	auipc	a0,0xa
ffffffffc0202bd6:	e1650513          	addi	a0,a0,-490 # ffffffffc020c9e8 <default_pmm_manager+0x248>
ffffffffc0202bda:	dccfd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202bde:	000b3783          	ld	a5,0(s6)
ffffffffc0202be2:	7b9c                	ld	a5,48(a5)
ffffffffc0202be4:	9782                	jalr	a5
ffffffffc0202be6:	0000a517          	auipc	a0,0xa
ffffffffc0202bea:	e1a50513          	addi	a0,a0,-486 # ffffffffc020ca00 <default_pmm_manager+0x260>
ffffffffc0202bee:	db8fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202bf2:	100027f3          	csrr	a5,sstatus
ffffffffc0202bf6:	8b89                	andi	a5,a5,2
ffffffffc0202bf8:	5a079363          	bnez	a5,ffffffffc020319e <pmm_init+0x6ce>
ffffffffc0202bfc:	000b3783          	ld	a5,0(s6)
ffffffffc0202c00:	4505                	li	a0,1
ffffffffc0202c02:	6f9c                	ld	a5,24(a5)
ffffffffc0202c04:	9782                	jalr	a5
ffffffffc0202c06:	842a                	mv	s0,a0
ffffffffc0202c08:	180408e3          	beqz	s0,ffffffffc0203598 <pmm_init+0xac8>
ffffffffc0202c0c:	000bb683          	ld	a3,0(s7)
ffffffffc0202c10:	5a7d                	li	s4,-1
ffffffffc0202c12:	6098                	ld	a4,0(s1)
ffffffffc0202c14:	40d406b3          	sub	a3,s0,a3
ffffffffc0202c18:	8699                	srai	a3,a3,0x6
ffffffffc0202c1a:	00080437          	lui	s0,0x80
ffffffffc0202c1e:	96a2                	add	a3,a3,s0
ffffffffc0202c20:	00ca5793          	srli	a5,s4,0xc
ffffffffc0202c24:	8ff5                	and	a5,a5,a3
ffffffffc0202c26:	06b2                	slli	a3,a3,0xc
ffffffffc0202c28:	30e7fde3          	bgeu	a5,a4,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0202c2c:	0009b403          	ld	s0,0(s3)
ffffffffc0202c30:	6605                	lui	a2,0x1
ffffffffc0202c32:	4581                	li	a1,0
ffffffffc0202c34:	9436                	add	s0,s0,a3
ffffffffc0202c36:	8522                	mv	a0,s0
ffffffffc0202c38:	39d080ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc0202c3c:	0009b683          	ld	a3,0(s3)
ffffffffc0202c40:	77fd                	lui	a5,0xfffff
ffffffffc0202c42:	0000a917          	auipc	s2,0xa
ffffffffc0202c46:	bfb90913          	addi	s2,s2,-1029 # ffffffffc020c83d <default_pmm_manager+0x9d>
ffffffffc0202c4a:	00f97933          	and	s2,s2,a5
ffffffffc0202c4e:	c0200ab7          	lui	s5,0xc0200
ffffffffc0202c52:	3fe00637          	lui	a2,0x3fe00
ffffffffc0202c56:	964a                	add	a2,a2,s2
ffffffffc0202c58:	4729                	li	a4,10
ffffffffc0202c5a:	40da86b3          	sub	a3,s5,a3
ffffffffc0202c5e:	c02005b7          	lui	a1,0xc0200
ffffffffc0202c62:	8522                	mv	a0,s0
ffffffffc0202c64:	fe8ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0202c68:	c8000637          	lui	a2,0xc8000
ffffffffc0202c6c:	41260633          	sub	a2,a2,s2
ffffffffc0202c70:	3f596ce3          	bltu	s2,s5,ffffffffc0203868 <pmm_init+0xd98>
ffffffffc0202c74:	0009b683          	ld	a3,0(s3)
ffffffffc0202c78:	85ca                	mv	a1,s2
ffffffffc0202c7a:	4719                	li	a4,6
ffffffffc0202c7c:	40d906b3          	sub	a3,s2,a3
ffffffffc0202c80:	8522                	mv	a0,s0
ffffffffc0202c82:	00094917          	auipc	s2,0x94
ffffffffc0202c86:	c1690913          	addi	s2,s2,-1002 # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0202c8a:	fc2ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0202c8e:	00893023          	sd	s0,0(s2)
ffffffffc0202c92:	2d5464e3          	bltu	s0,s5,ffffffffc020375a <pmm_init+0xc8a>
ffffffffc0202c96:	0009b783          	ld	a5,0(s3)
ffffffffc0202c9a:	1a7e                	slli	s4,s4,0x3f
ffffffffc0202c9c:	8c1d                	sub	s0,s0,a5
ffffffffc0202c9e:	00c45793          	srli	a5,s0,0xc
ffffffffc0202ca2:	00094717          	auipc	a4,0x94
ffffffffc0202ca6:	be873723          	sd	s0,-1042(a4) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0202caa:	0147ea33          	or	s4,a5,s4
ffffffffc0202cae:	180a1073          	csrw	satp,s4
ffffffffc0202cb2:	12000073          	sfence.vma
ffffffffc0202cb6:	0000a517          	auipc	a0,0xa
ffffffffc0202cba:	d8a50513          	addi	a0,a0,-630 # ffffffffc020ca40 <default_pmm_manager+0x2a0>
ffffffffc0202cbe:	ce8fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202cc2:	0000e717          	auipc	a4,0xe
ffffffffc0202cc6:	33e70713          	addi	a4,a4,830 # ffffffffc0211000 <bootstack>
ffffffffc0202cca:	0000e797          	auipc	a5,0xe
ffffffffc0202cce:	33678793          	addi	a5,a5,822 # ffffffffc0211000 <bootstack>
ffffffffc0202cd2:	5cf70d63          	beq	a4,a5,ffffffffc02032ac <pmm_init+0x7dc>
ffffffffc0202cd6:	100027f3          	csrr	a5,sstatus
ffffffffc0202cda:	8b89                	andi	a5,a5,2
ffffffffc0202cdc:	4a079763          	bnez	a5,ffffffffc020318a <pmm_init+0x6ba>
ffffffffc0202ce0:	000b3783          	ld	a5,0(s6)
ffffffffc0202ce4:	779c                	ld	a5,40(a5)
ffffffffc0202ce6:	9782                	jalr	a5
ffffffffc0202ce8:	842a                	mv	s0,a0
ffffffffc0202cea:	6098                	ld	a4,0(s1)
ffffffffc0202cec:	c80007b7          	lui	a5,0xc8000
ffffffffc0202cf0:	83b1                	srli	a5,a5,0xc
ffffffffc0202cf2:	08e7e3e3          	bltu	a5,a4,ffffffffc0203578 <pmm_init+0xaa8>
ffffffffc0202cf6:	00093503          	ld	a0,0(s2)
ffffffffc0202cfa:	04050fe3          	beqz	a0,ffffffffc0203558 <pmm_init+0xa88>
ffffffffc0202cfe:	03451793          	slli	a5,a0,0x34
ffffffffc0202d02:	04079be3          	bnez	a5,ffffffffc0203558 <pmm_init+0xa88>
ffffffffc0202d06:	4601                	li	a2,0
ffffffffc0202d08:	4581                	li	a1,0
ffffffffc0202d0a:	809ff0ef          	jal	ra,ffffffffc0202512 <get_page>
ffffffffc0202d0e:	2e0511e3          	bnez	a0,ffffffffc02037f0 <pmm_init+0xd20>
ffffffffc0202d12:	100027f3          	csrr	a5,sstatus
ffffffffc0202d16:	8b89                	andi	a5,a5,2
ffffffffc0202d18:	44079e63          	bnez	a5,ffffffffc0203174 <pmm_init+0x6a4>
ffffffffc0202d1c:	000b3783          	ld	a5,0(s6)
ffffffffc0202d20:	4505                	li	a0,1
ffffffffc0202d22:	6f9c                	ld	a5,24(a5)
ffffffffc0202d24:	9782                	jalr	a5
ffffffffc0202d26:	8a2a                	mv	s4,a0
ffffffffc0202d28:	00093503          	ld	a0,0(s2)
ffffffffc0202d2c:	4681                	li	a3,0
ffffffffc0202d2e:	4601                	li	a2,0
ffffffffc0202d30:	85d2                	mv	a1,s4
ffffffffc0202d32:	ca9ff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202d36:	26051be3          	bnez	a0,ffffffffc02037ac <pmm_init+0xcdc>
ffffffffc0202d3a:	00093503          	ld	a0,0(s2)
ffffffffc0202d3e:	4601                	li	a2,0
ffffffffc0202d40:	4581                	li	a1,0
ffffffffc0202d42:	ce2ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202d46:	280505e3          	beqz	a0,ffffffffc02037d0 <pmm_init+0xd00>
ffffffffc0202d4a:	611c                	ld	a5,0(a0)
ffffffffc0202d4c:	0017f713          	andi	a4,a5,1
ffffffffc0202d50:	26070ee3          	beqz	a4,ffffffffc02037cc <pmm_init+0xcfc>
ffffffffc0202d54:	6098                	ld	a4,0(s1)
ffffffffc0202d56:	078a                	slli	a5,a5,0x2
ffffffffc0202d58:	83b1                	srli	a5,a5,0xc
ffffffffc0202d5a:	62e7f363          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202d5e:	000bb683          	ld	a3,0(s7)
ffffffffc0202d62:	fff80637          	lui	a2,0xfff80
ffffffffc0202d66:	97b2                	add	a5,a5,a2
ffffffffc0202d68:	079a                	slli	a5,a5,0x6
ffffffffc0202d6a:	97b6                	add	a5,a5,a3
ffffffffc0202d6c:	2afa12e3          	bne	s4,a5,ffffffffc0203810 <pmm_init+0xd40>
ffffffffc0202d70:	000a2683          	lw	a3,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202d74:	4785                	li	a5,1
ffffffffc0202d76:	2cf699e3          	bne	a3,a5,ffffffffc0203848 <pmm_init+0xd78>
ffffffffc0202d7a:	00093503          	ld	a0,0(s2)
ffffffffc0202d7e:	77fd                	lui	a5,0xfffff
ffffffffc0202d80:	6114                	ld	a3,0(a0)
ffffffffc0202d82:	068a                	slli	a3,a3,0x2
ffffffffc0202d84:	8efd                	and	a3,a3,a5
ffffffffc0202d86:	00c6d613          	srli	a2,a3,0xc
ffffffffc0202d8a:	2ae673e3          	bgeu	a2,a4,ffffffffc0203830 <pmm_init+0xd60>
ffffffffc0202d8e:	0009bc03          	ld	s8,0(s3)
ffffffffc0202d92:	96e2                	add	a3,a3,s8
ffffffffc0202d94:	0006ba83          	ld	s5,0(a3) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202d98:	0a8a                	slli	s5,s5,0x2
ffffffffc0202d9a:	00fafab3          	and	s5,s5,a5
ffffffffc0202d9e:	00cad793          	srli	a5,s5,0xc
ffffffffc0202da2:	06e7f3e3          	bgeu	a5,a4,ffffffffc0203608 <pmm_init+0xb38>
ffffffffc0202da6:	4601                	li	a2,0
ffffffffc0202da8:	6585                	lui	a1,0x1
ffffffffc0202daa:	9ae2                	add	s5,s5,s8
ffffffffc0202dac:	c78ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202db0:	0aa1                	addi	s5,s5,8
ffffffffc0202db2:	03551be3          	bne	a0,s5,ffffffffc02035e8 <pmm_init+0xb18>
ffffffffc0202db6:	100027f3          	csrr	a5,sstatus
ffffffffc0202dba:	8b89                	andi	a5,a5,2
ffffffffc0202dbc:	3a079163          	bnez	a5,ffffffffc020315e <pmm_init+0x68e>
ffffffffc0202dc0:	000b3783          	ld	a5,0(s6)
ffffffffc0202dc4:	4505                	li	a0,1
ffffffffc0202dc6:	6f9c                	ld	a5,24(a5)
ffffffffc0202dc8:	9782                	jalr	a5
ffffffffc0202dca:	8c2a                	mv	s8,a0
ffffffffc0202dcc:	00093503          	ld	a0,0(s2)
ffffffffc0202dd0:	46d1                	li	a3,20
ffffffffc0202dd2:	6605                	lui	a2,0x1
ffffffffc0202dd4:	85e2                	mv	a1,s8
ffffffffc0202dd6:	c05ff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202dda:	1a0519e3          	bnez	a0,ffffffffc020378c <pmm_init+0xcbc>
ffffffffc0202dde:	00093503          	ld	a0,0(s2)
ffffffffc0202de2:	4601                	li	a2,0
ffffffffc0202de4:	6585                	lui	a1,0x1
ffffffffc0202de6:	c3eff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202dea:	10050ce3          	beqz	a0,ffffffffc0203702 <pmm_init+0xc32>
ffffffffc0202dee:	611c                	ld	a5,0(a0)
ffffffffc0202df0:	0107f713          	andi	a4,a5,16
ffffffffc0202df4:	0e0707e3          	beqz	a4,ffffffffc02036e2 <pmm_init+0xc12>
ffffffffc0202df8:	8b91                	andi	a5,a5,4
ffffffffc0202dfa:	0c0784e3          	beqz	a5,ffffffffc02036c2 <pmm_init+0xbf2>
ffffffffc0202dfe:	00093503          	ld	a0,0(s2)
ffffffffc0202e02:	611c                	ld	a5,0(a0)
ffffffffc0202e04:	8bc1                	andi	a5,a5,16
ffffffffc0202e06:	08078ee3          	beqz	a5,ffffffffc02036a2 <pmm_init+0xbd2>
ffffffffc0202e0a:	000c2703          	lw	a4,0(s8)
ffffffffc0202e0e:	4785                	li	a5,1
ffffffffc0202e10:	06f719e3          	bne	a4,a5,ffffffffc0203682 <pmm_init+0xbb2>
ffffffffc0202e14:	4681                	li	a3,0
ffffffffc0202e16:	6605                	lui	a2,0x1
ffffffffc0202e18:	85d2                	mv	a1,s4
ffffffffc0202e1a:	bc1ff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202e1e:	040512e3          	bnez	a0,ffffffffc0203662 <pmm_init+0xb92>
ffffffffc0202e22:	000a2703          	lw	a4,0(s4)
ffffffffc0202e26:	4789                	li	a5,2
ffffffffc0202e28:	00f71de3          	bne	a4,a5,ffffffffc0203642 <pmm_init+0xb72>
ffffffffc0202e2c:	000c2783          	lw	a5,0(s8)
ffffffffc0202e30:	7e079963          	bnez	a5,ffffffffc0203622 <pmm_init+0xb52>
ffffffffc0202e34:	00093503          	ld	a0,0(s2)
ffffffffc0202e38:	4601                	li	a2,0
ffffffffc0202e3a:	6585                	lui	a1,0x1
ffffffffc0202e3c:	be8ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202e40:	54050263          	beqz	a0,ffffffffc0203384 <pmm_init+0x8b4>
ffffffffc0202e44:	6118                	ld	a4,0(a0)
ffffffffc0202e46:	00177793          	andi	a5,a4,1
ffffffffc0202e4a:	180781e3          	beqz	a5,ffffffffc02037cc <pmm_init+0xcfc>
ffffffffc0202e4e:	6094                	ld	a3,0(s1)
ffffffffc0202e50:	00271793          	slli	a5,a4,0x2
ffffffffc0202e54:	83b1                	srli	a5,a5,0xc
ffffffffc0202e56:	52d7f563          	bgeu	a5,a3,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202e5a:	000bb683          	ld	a3,0(s7)
ffffffffc0202e5e:	fff80ab7          	lui	s5,0xfff80
ffffffffc0202e62:	97d6                	add	a5,a5,s5
ffffffffc0202e64:	079a                	slli	a5,a5,0x6
ffffffffc0202e66:	97b6                	add	a5,a5,a3
ffffffffc0202e68:	58fa1e63          	bne	s4,a5,ffffffffc0203404 <pmm_init+0x934>
ffffffffc0202e6c:	8b41                	andi	a4,a4,16
ffffffffc0202e6e:	56071b63          	bnez	a4,ffffffffc02033e4 <pmm_init+0x914>
ffffffffc0202e72:	00093503          	ld	a0,0(s2)
ffffffffc0202e76:	4581                	li	a1,0
ffffffffc0202e78:	ac7ff0ef          	jal	ra,ffffffffc020293e <page_remove>
ffffffffc0202e7c:	000a2c83          	lw	s9,0(s4)
ffffffffc0202e80:	4785                	li	a5,1
ffffffffc0202e82:	5cfc9163          	bne	s9,a5,ffffffffc0203444 <pmm_init+0x974>
ffffffffc0202e86:	000c2783          	lw	a5,0(s8)
ffffffffc0202e8a:	58079d63          	bnez	a5,ffffffffc0203424 <pmm_init+0x954>
ffffffffc0202e8e:	00093503          	ld	a0,0(s2)
ffffffffc0202e92:	6585                	lui	a1,0x1
ffffffffc0202e94:	aabff0ef          	jal	ra,ffffffffc020293e <page_remove>
ffffffffc0202e98:	000a2783          	lw	a5,0(s4)
ffffffffc0202e9c:	200793e3          	bnez	a5,ffffffffc02038a2 <pmm_init+0xdd2>
ffffffffc0202ea0:	000c2783          	lw	a5,0(s8)
ffffffffc0202ea4:	1c079fe3          	bnez	a5,ffffffffc0203882 <pmm_init+0xdb2>
ffffffffc0202ea8:	00093a03          	ld	s4,0(s2)
ffffffffc0202eac:	608c                	ld	a1,0(s1)
ffffffffc0202eae:	000a3683          	ld	a3,0(s4)
ffffffffc0202eb2:	068a                	slli	a3,a3,0x2
ffffffffc0202eb4:	82b1                	srli	a3,a3,0xc
ffffffffc0202eb6:	4cb6f563          	bgeu	a3,a1,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202eba:	000bb503          	ld	a0,0(s7)
ffffffffc0202ebe:	96d6                	add	a3,a3,s5
ffffffffc0202ec0:	069a                	slli	a3,a3,0x6
ffffffffc0202ec2:	00d507b3          	add	a5,a0,a3
ffffffffc0202ec6:	439c                	lw	a5,0(a5)
ffffffffc0202ec8:	4f979e63          	bne	a5,s9,ffffffffc02033c4 <pmm_init+0x8f4>
ffffffffc0202ecc:	8699                	srai	a3,a3,0x6
ffffffffc0202ece:	00080637          	lui	a2,0x80
ffffffffc0202ed2:	96b2                	add	a3,a3,a2
ffffffffc0202ed4:	00c69713          	slli	a4,a3,0xc
ffffffffc0202ed8:	8331                	srli	a4,a4,0xc
ffffffffc0202eda:	06b2                	slli	a3,a3,0xc
ffffffffc0202edc:	06b773e3          	bgeu	a4,a1,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0202ee0:	0009b703          	ld	a4,0(s3)
ffffffffc0202ee4:	96ba                	add	a3,a3,a4
ffffffffc0202ee6:	629c                	ld	a5,0(a3)
ffffffffc0202ee8:	078a                	slli	a5,a5,0x2
ffffffffc0202eea:	83b1                	srli	a5,a5,0xc
ffffffffc0202eec:	48b7fa63          	bgeu	a5,a1,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202ef0:	8f91                	sub	a5,a5,a2
ffffffffc0202ef2:	079a                	slli	a5,a5,0x6
ffffffffc0202ef4:	953e                	add	a0,a0,a5
ffffffffc0202ef6:	100027f3          	csrr	a5,sstatus
ffffffffc0202efa:	8b89                	andi	a5,a5,2
ffffffffc0202efc:	32079463          	bnez	a5,ffffffffc0203224 <pmm_init+0x754>
ffffffffc0202f00:	000b3783          	ld	a5,0(s6)
ffffffffc0202f04:	4585                	li	a1,1
ffffffffc0202f06:	739c                	ld	a5,32(a5)
ffffffffc0202f08:	9782                	jalr	a5
ffffffffc0202f0a:	000a3783          	ld	a5,0(s4)
ffffffffc0202f0e:	6098                	ld	a4,0(s1)
ffffffffc0202f10:	078a                	slli	a5,a5,0x2
ffffffffc0202f12:	83b1                	srli	a5,a5,0xc
ffffffffc0202f14:	46e7f663          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202f18:	000bb503          	ld	a0,0(s7)
ffffffffc0202f1c:	fff80737          	lui	a4,0xfff80
ffffffffc0202f20:	97ba                	add	a5,a5,a4
ffffffffc0202f22:	079a                	slli	a5,a5,0x6
ffffffffc0202f24:	953e                	add	a0,a0,a5
ffffffffc0202f26:	100027f3          	csrr	a5,sstatus
ffffffffc0202f2a:	8b89                	andi	a5,a5,2
ffffffffc0202f2c:	2e079063          	bnez	a5,ffffffffc020320c <pmm_init+0x73c>
ffffffffc0202f30:	000b3783          	ld	a5,0(s6)
ffffffffc0202f34:	4585                	li	a1,1
ffffffffc0202f36:	739c                	ld	a5,32(a5)
ffffffffc0202f38:	9782                	jalr	a5
ffffffffc0202f3a:	00093783          	ld	a5,0(s2)
ffffffffc0202f3e:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0202f42:	12000073          	sfence.vma
ffffffffc0202f46:	100027f3          	csrr	a5,sstatus
ffffffffc0202f4a:	8b89                	andi	a5,a5,2
ffffffffc0202f4c:	2a079663          	bnez	a5,ffffffffc02031f8 <pmm_init+0x728>
ffffffffc0202f50:	000b3783          	ld	a5,0(s6)
ffffffffc0202f54:	779c                	ld	a5,40(a5)
ffffffffc0202f56:	9782                	jalr	a5
ffffffffc0202f58:	8a2a                	mv	s4,a0
ffffffffc0202f5a:	7d441463          	bne	s0,s4,ffffffffc0203722 <pmm_init+0xc52>
ffffffffc0202f5e:	0000a517          	auipc	a0,0xa
ffffffffc0202f62:	e3a50513          	addi	a0,a0,-454 # ffffffffc020cd98 <default_pmm_manager+0x5f8>
ffffffffc0202f66:	a40fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202f6a:	100027f3          	csrr	a5,sstatus
ffffffffc0202f6e:	8b89                	andi	a5,a5,2
ffffffffc0202f70:	26079a63          	bnez	a5,ffffffffc02031e4 <pmm_init+0x714>
ffffffffc0202f74:	000b3783          	ld	a5,0(s6)
ffffffffc0202f78:	779c                	ld	a5,40(a5)
ffffffffc0202f7a:	9782                	jalr	a5
ffffffffc0202f7c:	8c2a                	mv	s8,a0
ffffffffc0202f7e:	6098                	ld	a4,0(s1)
ffffffffc0202f80:	c0200437          	lui	s0,0xc0200
ffffffffc0202f84:	7afd                	lui	s5,0xfffff
ffffffffc0202f86:	00c71793          	slli	a5,a4,0xc
ffffffffc0202f8a:	6a05                	lui	s4,0x1
ffffffffc0202f8c:	02f47c63          	bgeu	s0,a5,ffffffffc0202fc4 <pmm_init+0x4f4>
ffffffffc0202f90:	00c45793          	srli	a5,s0,0xc
ffffffffc0202f94:	00093503          	ld	a0,0(s2)
ffffffffc0202f98:	3ae7f763          	bgeu	a5,a4,ffffffffc0203346 <pmm_init+0x876>
ffffffffc0202f9c:	0009b583          	ld	a1,0(s3)
ffffffffc0202fa0:	4601                	li	a2,0
ffffffffc0202fa2:	95a2                	add	a1,a1,s0
ffffffffc0202fa4:	a80ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202fa8:	36050f63          	beqz	a0,ffffffffc0203326 <pmm_init+0x856>
ffffffffc0202fac:	611c                	ld	a5,0(a0)
ffffffffc0202fae:	078a                	slli	a5,a5,0x2
ffffffffc0202fb0:	0157f7b3          	and	a5,a5,s5
ffffffffc0202fb4:	3a879663          	bne	a5,s0,ffffffffc0203360 <pmm_init+0x890>
ffffffffc0202fb8:	6098                	ld	a4,0(s1)
ffffffffc0202fba:	9452                	add	s0,s0,s4
ffffffffc0202fbc:	00c71793          	slli	a5,a4,0xc
ffffffffc0202fc0:	fcf468e3          	bltu	s0,a5,ffffffffc0202f90 <pmm_init+0x4c0>
ffffffffc0202fc4:	00093783          	ld	a5,0(s2)
ffffffffc0202fc8:	639c                	ld	a5,0(a5)
ffffffffc0202fca:	48079d63          	bnez	a5,ffffffffc0203464 <pmm_init+0x994>
ffffffffc0202fce:	100027f3          	csrr	a5,sstatus
ffffffffc0202fd2:	8b89                	andi	a5,a5,2
ffffffffc0202fd4:	26079463          	bnez	a5,ffffffffc020323c <pmm_init+0x76c>
ffffffffc0202fd8:	000b3783          	ld	a5,0(s6)
ffffffffc0202fdc:	4505                	li	a0,1
ffffffffc0202fde:	6f9c                	ld	a5,24(a5)
ffffffffc0202fe0:	9782                	jalr	a5
ffffffffc0202fe2:	8a2a                	mv	s4,a0
ffffffffc0202fe4:	00093503          	ld	a0,0(s2)
ffffffffc0202fe8:	4699                	li	a3,6
ffffffffc0202fea:	10000613          	li	a2,256
ffffffffc0202fee:	85d2                	mv	a1,s4
ffffffffc0202ff0:	9ebff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202ff4:	4a051863          	bnez	a0,ffffffffc02034a4 <pmm_init+0x9d4>
ffffffffc0202ff8:	000a2703          	lw	a4,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202ffc:	4785                	li	a5,1
ffffffffc0202ffe:	48f71363          	bne	a4,a5,ffffffffc0203484 <pmm_init+0x9b4>
ffffffffc0203002:	00093503          	ld	a0,0(s2)
ffffffffc0203006:	6405                	lui	s0,0x1
ffffffffc0203008:	4699                	li	a3,6
ffffffffc020300a:	10040613          	addi	a2,s0,256 # 1100 <_binary_bin_swap_img_size-0x6c00>
ffffffffc020300e:	85d2                	mv	a1,s4
ffffffffc0203010:	9cbff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0203014:	38051863          	bnez	a0,ffffffffc02033a4 <pmm_init+0x8d4>
ffffffffc0203018:	000a2703          	lw	a4,0(s4)
ffffffffc020301c:	4789                	li	a5,2
ffffffffc020301e:	4ef71363          	bne	a4,a5,ffffffffc0203504 <pmm_init+0xa34>
ffffffffc0203022:	0000a597          	auipc	a1,0xa
ffffffffc0203026:	ebe58593          	addi	a1,a1,-322 # ffffffffc020cee0 <default_pmm_manager+0x740>
ffffffffc020302a:	10000513          	li	a0,256
ffffffffc020302e:	73a080ef          	jal	ra,ffffffffc020b768 <strcpy>
ffffffffc0203032:	10040593          	addi	a1,s0,256
ffffffffc0203036:	10000513          	li	a0,256
ffffffffc020303a:	740080ef          	jal	ra,ffffffffc020b77a <strcmp>
ffffffffc020303e:	4a051363          	bnez	a0,ffffffffc02034e4 <pmm_init+0xa14>
ffffffffc0203042:	000bb683          	ld	a3,0(s7)
ffffffffc0203046:	00080737          	lui	a4,0x80
ffffffffc020304a:	547d                	li	s0,-1
ffffffffc020304c:	40da06b3          	sub	a3,s4,a3
ffffffffc0203050:	8699                	srai	a3,a3,0x6
ffffffffc0203052:	609c                	ld	a5,0(s1)
ffffffffc0203054:	96ba                	add	a3,a3,a4
ffffffffc0203056:	8031                	srli	s0,s0,0xc
ffffffffc0203058:	0086f733          	and	a4,a3,s0
ffffffffc020305c:	06b2                	slli	a3,a3,0xc
ffffffffc020305e:	6ef77263          	bgeu	a4,a5,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0203062:	0009b783          	ld	a5,0(s3)
ffffffffc0203066:	10000513          	li	a0,256
ffffffffc020306a:	96be                	add	a3,a3,a5
ffffffffc020306c:	10068023          	sb	zero,256(a3)
ffffffffc0203070:	6c2080ef          	jal	ra,ffffffffc020b732 <strlen>
ffffffffc0203074:	44051863          	bnez	a0,ffffffffc02034c4 <pmm_init+0x9f4>
ffffffffc0203078:	00093a83          	ld	s5,0(s2)
ffffffffc020307c:	609c                	ld	a5,0(s1)
ffffffffc020307e:	000ab683          	ld	a3,0(s5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0203082:	068a                	slli	a3,a3,0x2
ffffffffc0203084:	82b1                	srli	a3,a3,0xc
ffffffffc0203086:	2ef6fd63          	bgeu	a3,a5,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc020308a:	8c75                	and	s0,s0,a3
ffffffffc020308c:	06b2                	slli	a3,a3,0xc
ffffffffc020308e:	6af47a63          	bgeu	s0,a5,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0203092:	0009b403          	ld	s0,0(s3)
ffffffffc0203096:	9436                	add	s0,s0,a3
ffffffffc0203098:	100027f3          	csrr	a5,sstatus
ffffffffc020309c:	8b89                	andi	a5,a5,2
ffffffffc020309e:	1e079c63          	bnez	a5,ffffffffc0203296 <pmm_init+0x7c6>
ffffffffc02030a2:	000b3783          	ld	a5,0(s6)
ffffffffc02030a6:	4585                	li	a1,1
ffffffffc02030a8:	8552                	mv	a0,s4
ffffffffc02030aa:	739c                	ld	a5,32(a5)
ffffffffc02030ac:	9782                	jalr	a5
ffffffffc02030ae:	601c                	ld	a5,0(s0)
ffffffffc02030b0:	6098                	ld	a4,0(s1)
ffffffffc02030b2:	078a                	slli	a5,a5,0x2
ffffffffc02030b4:	83b1                	srli	a5,a5,0xc
ffffffffc02030b6:	2ce7f563          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc02030ba:	000bb503          	ld	a0,0(s7)
ffffffffc02030be:	fff80737          	lui	a4,0xfff80
ffffffffc02030c2:	97ba                	add	a5,a5,a4
ffffffffc02030c4:	079a                	slli	a5,a5,0x6
ffffffffc02030c6:	953e                	add	a0,a0,a5
ffffffffc02030c8:	100027f3          	csrr	a5,sstatus
ffffffffc02030cc:	8b89                	andi	a5,a5,2
ffffffffc02030ce:	1a079863          	bnez	a5,ffffffffc020327e <pmm_init+0x7ae>
ffffffffc02030d2:	000b3783          	ld	a5,0(s6)
ffffffffc02030d6:	4585                	li	a1,1
ffffffffc02030d8:	739c                	ld	a5,32(a5)
ffffffffc02030da:	9782                	jalr	a5
ffffffffc02030dc:	000ab783          	ld	a5,0(s5)
ffffffffc02030e0:	6098                	ld	a4,0(s1)
ffffffffc02030e2:	078a                	slli	a5,a5,0x2
ffffffffc02030e4:	83b1                	srli	a5,a5,0xc
ffffffffc02030e6:	28e7fd63          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc02030ea:	000bb503          	ld	a0,0(s7)
ffffffffc02030ee:	fff80737          	lui	a4,0xfff80
ffffffffc02030f2:	97ba                	add	a5,a5,a4
ffffffffc02030f4:	079a                	slli	a5,a5,0x6
ffffffffc02030f6:	953e                	add	a0,a0,a5
ffffffffc02030f8:	100027f3          	csrr	a5,sstatus
ffffffffc02030fc:	8b89                	andi	a5,a5,2
ffffffffc02030fe:	16079463          	bnez	a5,ffffffffc0203266 <pmm_init+0x796>
ffffffffc0203102:	000b3783          	ld	a5,0(s6)
ffffffffc0203106:	4585                	li	a1,1
ffffffffc0203108:	739c                	ld	a5,32(a5)
ffffffffc020310a:	9782                	jalr	a5
ffffffffc020310c:	00093783          	ld	a5,0(s2)
ffffffffc0203110:	0007b023          	sd	zero,0(a5)
ffffffffc0203114:	12000073          	sfence.vma
ffffffffc0203118:	100027f3          	csrr	a5,sstatus
ffffffffc020311c:	8b89                	andi	a5,a5,2
ffffffffc020311e:	12079a63          	bnez	a5,ffffffffc0203252 <pmm_init+0x782>
ffffffffc0203122:	000b3783          	ld	a5,0(s6)
ffffffffc0203126:	779c                	ld	a5,40(a5)
ffffffffc0203128:	9782                	jalr	a5
ffffffffc020312a:	842a                	mv	s0,a0
ffffffffc020312c:	488c1e63          	bne	s8,s0,ffffffffc02035c8 <pmm_init+0xaf8>
ffffffffc0203130:	0000a517          	auipc	a0,0xa
ffffffffc0203134:	e2850513          	addi	a0,a0,-472 # ffffffffc020cf58 <default_pmm_manager+0x7b8>
ffffffffc0203138:	86efd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020313c:	7406                	ld	s0,96(sp)
ffffffffc020313e:	70a6                	ld	ra,104(sp)
ffffffffc0203140:	64e6                	ld	s1,88(sp)
ffffffffc0203142:	6946                	ld	s2,80(sp)
ffffffffc0203144:	69a6                	ld	s3,72(sp)
ffffffffc0203146:	6a06                	ld	s4,64(sp)
ffffffffc0203148:	7ae2                	ld	s5,56(sp)
ffffffffc020314a:	7b42                	ld	s6,48(sp)
ffffffffc020314c:	7ba2                	ld	s7,40(sp)
ffffffffc020314e:	7c02                	ld	s8,32(sp)
ffffffffc0203150:	6ce2                	ld	s9,24(sp)
ffffffffc0203152:	6165                	addi	sp,sp,112
ffffffffc0203154:	e17fe06f          	j	ffffffffc0201f6a <kmalloc_init>
ffffffffc0203158:	c80007b7          	lui	a5,0xc8000
ffffffffc020315c:	b411                	j	ffffffffc0202b60 <pmm_init+0x90>
ffffffffc020315e:	b15fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203162:	000b3783          	ld	a5,0(s6)
ffffffffc0203166:	4505                	li	a0,1
ffffffffc0203168:	6f9c                	ld	a5,24(a5)
ffffffffc020316a:	9782                	jalr	a5
ffffffffc020316c:	8c2a                	mv	s8,a0
ffffffffc020316e:	afffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203172:	b9a9                	j	ffffffffc0202dcc <pmm_init+0x2fc>
ffffffffc0203174:	afffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203178:	000b3783          	ld	a5,0(s6)
ffffffffc020317c:	4505                	li	a0,1
ffffffffc020317e:	6f9c                	ld	a5,24(a5)
ffffffffc0203180:	9782                	jalr	a5
ffffffffc0203182:	8a2a                	mv	s4,a0
ffffffffc0203184:	ae9fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203188:	b645                	j	ffffffffc0202d28 <pmm_init+0x258>
ffffffffc020318a:	ae9fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020318e:	000b3783          	ld	a5,0(s6)
ffffffffc0203192:	779c                	ld	a5,40(a5)
ffffffffc0203194:	9782                	jalr	a5
ffffffffc0203196:	842a                	mv	s0,a0
ffffffffc0203198:	ad5fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020319c:	b6b9                	j	ffffffffc0202cea <pmm_init+0x21a>
ffffffffc020319e:	ad5fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031a2:	000b3783          	ld	a5,0(s6)
ffffffffc02031a6:	4505                	li	a0,1
ffffffffc02031a8:	6f9c                	ld	a5,24(a5)
ffffffffc02031aa:	9782                	jalr	a5
ffffffffc02031ac:	842a                	mv	s0,a0
ffffffffc02031ae:	abffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02031b2:	bc99                	j	ffffffffc0202c08 <pmm_init+0x138>
ffffffffc02031b4:	6705                	lui	a4,0x1
ffffffffc02031b6:	177d                	addi	a4,a4,-1
ffffffffc02031b8:	96ba                	add	a3,a3,a4
ffffffffc02031ba:	8ff5                	and	a5,a5,a3
ffffffffc02031bc:	00c7d713          	srli	a4,a5,0xc
ffffffffc02031c0:	1ca77063          	bgeu	a4,a0,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc02031c4:	000b3683          	ld	a3,0(s6)
ffffffffc02031c8:	fff80537          	lui	a0,0xfff80
ffffffffc02031cc:	972a                	add	a4,a4,a0
ffffffffc02031ce:	6a94                	ld	a3,16(a3)
ffffffffc02031d0:	8c1d                	sub	s0,s0,a5
ffffffffc02031d2:	00671513          	slli	a0,a4,0x6
ffffffffc02031d6:	00c45593          	srli	a1,s0,0xc
ffffffffc02031da:	9532                	add	a0,a0,a2
ffffffffc02031dc:	9682                	jalr	a3
ffffffffc02031de:	0009b583          	ld	a1,0(s3)
ffffffffc02031e2:	bac5                	j	ffffffffc0202bd2 <pmm_init+0x102>
ffffffffc02031e4:	a8ffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031e8:	000b3783          	ld	a5,0(s6)
ffffffffc02031ec:	779c                	ld	a5,40(a5)
ffffffffc02031ee:	9782                	jalr	a5
ffffffffc02031f0:	8c2a                	mv	s8,a0
ffffffffc02031f2:	a7bfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02031f6:	b361                	j	ffffffffc0202f7e <pmm_init+0x4ae>
ffffffffc02031f8:	a7bfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031fc:	000b3783          	ld	a5,0(s6)
ffffffffc0203200:	779c                	ld	a5,40(a5)
ffffffffc0203202:	9782                	jalr	a5
ffffffffc0203204:	8a2a                	mv	s4,a0
ffffffffc0203206:	a67fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020320a:	bb81                	j	ffffffffc0202f5a <pmm_init+0x48a>
ffffffffc020320c:	e42a                	sd	a0,8(sp)
ffffffffc020320e:	a65fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203212:	000b3783          	ld	a5,0(s6)
ffffffffc0203216:	6522                	ld	a0,8(sp)
ffffffffc0203218:	4585                	li	a1,1
ffffffffc020321a:	739c                	ld	a5,32(a5)
ffffffffc020321c:	9782                	jalr	a5
ffffffffc020321e:	a4ffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203222:	bb21                	j	ffffffffc0202f3a <pmm_init+0x46a>
ffffffffc0203224:	e42a                	sd	a0,8(sp)
ffffffffc0203226:	a4dfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020322a:	000b3783          	ld	a5,0(s6)
ffffffffc020322e:	6522                	ld	a0,8(sp)
ffffffffc0203230:	4585                	li	a1,1
ffffffffc0203232:	739c                	ld	a5,32(a5)
ffffffffc0203234:	9782                	jalr	a5
ffffffffc0203236:	a37fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020323a:	b9c1                	j	ffffffffc0202f0a <pmm_init+0x43a>
ffffffffc020323c:	a37fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203240:	000b3783          	ld	a5,0(s6)
ffffffffc0203244:	4505                	li	a0,1
ffffffffc0203246:	6f9c                	ld	a5,24(a5)
ffffffffc0203248:	9782                	jalr	a5
ffffffffc020324a:	8a2a                	mv	s4,a0
ffffffffc020324c:	a21fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203250:	bb51                	j	ffffffffc0202fe4 <pmm_init+0x514>
ffffffffc0203252:	a21fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203256:	000b3783          	ld	a5,0(s6)
ffffffffc020325a:	779c                	ld	a5,40(a5)
ffffffffc020325c:	9782                	jalr	a5
ffffffffc020325e:	842a                	mv	s0,a0
ffffffffc0203260:	a0dfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203264:	b5e1                	j	ffffffffc020312c <pmm_init+0x65c>
ffffffffc0203266:	e42a                	sd	a0,8(sp)
ffffffffc0203268:	a0bfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020326c:	000b3783          	ld	a5,0(s6)
ffffffffc0203270:	6522                	ld	a0,8(sp)
ffffffffc0203272:	4585                	li	a1,1
ffffffffc0203274:	739c                	ld	a5,32(a5)
ffffffffc0203276:	9782                	jalr	a5
ffffffffc0203278:	9f5fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020327c:	bd41                	j	ffffffffc020310c <pmm_init+0x63c>
ffffffffc020327e:	e42a                	sd	a0,8(sp)
ffffffffc0203280:	9f3fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203284:	000b3783          	ld	a5,0(s6)
ffffffffc0203288:	6522                	ld	a0,8(sp)
ffffffffc020328a:	4585                	li	a1,1
ffffffffc020328c:	739c                	ld	a5,32(a5)
ffffffffc020328e:	9782                	jalr	a5
ffffffffc0203290:	9ddfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203294:	b5a1                	j	ffffffffc02030dc <pmm_init+0x60c>
ffffffffc0203296:	9ddfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020329a:	000b3783          	ld	a5,0(s6)
ffffffffc020329e:	4585                	li	a1,1
ffffffffc02032a0:	8552                	mv	a0,s4
ffffffffc02032a2:	739c                	ld	a5,32(a5)
ffffffffc02032a4:	9782                	jalr	a5
ffffffffc02032a6:	9c7fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02032aa:	b511                	j	ffffffffc02030ae <pmm_init+0x5de>
ffffffffc02032ac:	00010417          	auipc	s0,0x10
ffffffffc02032b0:	d5440413          	addi	s0,s0,-684 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc02032b4:	00010797          	auipc	a5,0x10
ffffffffc02032b8:	d4c78793          	addi	a5,a5,-692 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc02032bc:	a0f41de3          	bne	s0,a5,ffffffffc0202cd6 <pmm_init+0x206>
ffffffffc02032c0:	4581                	li	a1,0
ffffffffc02032c2:	6605                	lui	a2,0x1
ffffffffc02032c4:	8522                	mv	a0,s0
ffffffffc02032c6:	50e080ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc02032ca:	0000d597          	auipc	a1,0xd
ffffffffc02032ce:	d3658593          	addi	a1,a1,-714 # ffffffffc0210000 <bootstackguard>
ffffffffc02032d2:	0000e797          	auipc	a5,0xe
ffffffffc02032d6:	d20786a3          	sb	zero,-723(a5) # ffffffffc0210fff <bootstackguard+0xfff>
ffffffffc02032da:	0000d797          	auipc	a5,0xd
ffffffffc02032de:	d2078323          	sb	zero,-730(a5) # ffffffffc0210000 <bootstackguard>
ffffffffc02032e2:	00093503          	ld	a0,0(s2)
ffffffffc02032e6:	2555ec63          	bltu	a1,s5,ffffffffc020353e <pmm_init+0xa6e>
ffffffffc02032ea:	0009b683          	ld	a3,0(s3)
ffffffffc02032ee:	4701                	li	a4,0
ffffffffc02032f0:	6605                	lui	a2,0x1
ffffffffc02032f2:	40d586b3          	sub	a3,a1,a3
ffffffffc02032f6:	956ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc02032fa:	00093503          	ld	a0,0(s2)
ffffffffc02032fe:	23546363          	bltu	s0,s5,ffffffffc0203524 <pmm_init+0xa54>
ffffffffc0203302:	0009b683          	ld	a3,0(s3)
ffffffffc0203306:	4701                	li	a4,0
ffffffffc0203308:	6605                	lui	a2,0x1
ffffffffc020330a:	40d406b3          	sub	a3,s0,a3
ffffffffc020330e:	85a2                	mv	a1,s0
ffffffffc0203310:	93cff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0203314:	12000073          	sfence.vma
ffffffffc0203318:	00009517          	auipc	a0,0x9
ffffffffc020331c:	75050513          	addi	a0,a0,1872 # ffffffffc020ca68 <default_pmm_manager+0x2c8>
ffffffffc0203320:	e87fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0203324:	ba4d                	j	ffffffffc0202cd6 <pmm_init+0x206>
ffffffffc0203326:	0000a697          	auipc	a3,0xa
ffffffffc020332a:	a9268693          	addi	a3,a3,-1390 # ffffffffc020cdb8 <default_pmm_manager+0x618>
ffffffffc020332e:	00009617          	auipc	a2,0x9
ffffffffc0203332:	98a60613          	addi	a2,a2,-1654 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203336:	28d00593          	li	a1,653
ffffffffc020333a:	00009517          	auipc	a0,0x9
ffffffffc020333e:	5b650513          	addi	a0,a0,1462 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203342:	95cfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203346:	86a2                	mv	a3,s0
ffffffffc0203348:	00009617          	auipc	a2,0x9
ffffffffc020334c:	49060613          	addi	a2,a2,1168 # ffffffffc020c7d8 <default_pmm_manager+0x38>
ffffffffc0203350:	28d00593          	li	a1,653
ffffffffc0203354:	00009517          	auipc	a0,0x9
ffffffffc0203358:	59c50513          	addi	a0,a0,1436 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020335c:	942fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203360:	0000a697          	auipc	a3,0xa
ffffffffc0203364:	a9868693          	addi	a3,a3,-1384 # ffffffffc020cdf8 <default_pmm_manager+0x658>
ffffffffc0203368:	00009617          	auipc	a2,0x9
ffffffffc020336c:	95060613          	addi	a2,a2,-1712 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203370:	28e00593          	li	a1,654
ffffffffc0203374:	00009517          	auipc	a0,0x9
ffffffffc0203378:	57c50513          	addi	a0,a0,1404 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020337c:	922fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203380:	db5fe0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>
ffffffffc0203384:	0000a697          	auipc	a3,0xa
ffffffffc0203388:	89c68693          	addi	a3,a3,-1892 # ffffffffc020cc20 <default_pmm_manager+0x480>
ffffffffc020338c:	00009617          	auipc	a2,0x9
ffffffffc0203390:	92c60613          	addi	a2,a2,-1748 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203394:	26a00593          	li	a1,618
ffffffffc0203398:	00009517          	auipc	a0,0x9
ffffffffc020339c:	55850513          	addi	a0,a0,1368 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02033a0:	8fefd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033a4:	0000a697          	auipc	a3,0xa
ffffffffc02033a8:	adc68693          	addi	a3,a3,-1316 # ffffffffc020ce80 <default_pmm_manager+0x6e0>
ffffffffc02033ac:	00009617          	auipc	a2,0x9
ffffffffc02033b0:	90c60613          	addi	a2,a2,-1780 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02033b4:	29700593          	li	a1,663
ffffffffc02033b8:	00009517          	auipc	a0,0x9
ffffffffc02033bc:	53850513          	addi	a0,a0,1336 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02033c0:	8defd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033c4:	0000a697          	auipc	a3,0xa
ffffffffc02033c8:	97c68693          	addi	a3,a3,-1668 # ffffffffc020cd40 <default_pmm_manager+0x5a0>
ffffffffc02033cc:	00009617          	auipc	a2,0x9
ffffffffc02033d0:	8ec60613          	addi	a2,a2,-1812 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02033d4:	27600593          	li	a1,630
ffffffffc02033d8:	00009517          	auipc	a0,0x9
ffffffffc02033dc:	51850513          	addi	a0,a0,1304 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02033e0:	8befd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033e4:	0000a697          	auipc	a3,0xa
ffffffffc02033e8:	92c68693          	addi	a3,a3,-1748 # ffffffffc020cd10 <default_pmm_manager+0x570>
ffffffffc02033ec:	00009617          	auipc	a2,0x9
ffffffffc02033f0:	8cc60613          	addi	a2,a2,-1844 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02033f4:	26c00593          	li	a1,620
ffffffffc02033f8:	00009517          	auipc	a0,0x9
ffffffffc02033fc:	4f850513          	addi	a0,a0,1272 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203400:	89efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203404:	00009697          	auipc	a3,0x9
ffffffffc0203408:	77c68693          	addi	a3,a3,1916 # ffffffffc020cb80 <default_pmm_manager+0x3e0>
ffffffffc020340c:	00009617          	auipc	a2,0x9
ffffffffc0203410:	8ac60613          	addi	a2,a2,-1876 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203414:	26b00593          	li	a1,619
ffffffffc0203418:	00009517          	auipc	a0,0x9
ffffffffc020341c:	4d850513          	addi	a0,a0,1240 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203420:	87efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203424:	0000a697          	auipc	a3,0xa
ffffffffc0203428:	8d468693          	addi	a3,a3,-1836 # ffffffffc020ccf8 <default_pmm_manager+0x558>
ffffffffc020342c:	00009617          	auipc	a2,0x9
ffffffffc0203430:	88c60613          	addi	a2,a2,-1908 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203434:	27000593          	li	a1,624
ffffffffc0203438:	00009517          	auipc	a0,0x9
ffffffffc020343c:	4b850513          	addi	a0,a0,1208 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203440:	85efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203444:	00009697          	auipc	a3,0x9
ffffffffc0203448:	75468693          	addi	a3,a3,1876 # ffffffffc020cb98 <default_pmm_manager+0x3f8>
ffffffffc020344c:	00009617          	auipc	a2,0x9
ffffffffc0203450:	86c60613          	addi	a2,a2,-1940 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203454:	26f00593          	li	a1,623
ffffffffc0203458:	00009517          	auipc	a0,0x9
ffffffffc020345c:	49850513          	addi	a0,a0,1176 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203460:	83efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203464:	0000a697          	auipc	a3,0xa
ffffffffc0203468:	9ac68693          	addi	a3,a3,-1620 # ffffffffc020ce10 <default_pmm_manager+0x670>
ffffffffc020346c:	00009617          	auipc	a2,0x9
ffffffffc0203470:	84c60613          	addi	a2,a2,-1972 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203474:	29100593          	li	a1,657
ffffffffc0203478:	00009517          	auipc	a0,0x9
ffffffffc020347c:	47850513          	addi	a0,a0,1144 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203480:	81efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203484:	0000a697          	auipc	a3,0xa
ffffffffc0203488:	9e468693          	addi	a3,a3,-1564 # ffffffffc020ce68 <default_pmm_manager+0x6c8>
ffffffffc020348c:	00009617          	auipc	a2,0x9
ffffffffc0203490:	82c60613          	addi	a2,a2,-2004 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203494:	29600593          	li	a1,662
ffffffffc0203498:	00009517          	auipc	a0,0x9
ffffffffc020349c:	45850513          	addi	a0,a0,1112 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02034a0:	ffffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034a4:	0000a697          	auipc	a3,0xa
ffffffffc02034a8:	98468693          	addi	a3,a3,-1660 # ffffffffc020ce28 <default_pmm_manager+0x688>
ffffffffc02034ac:	00009617          	auipc	a2,0x9
ffffffffc02034b0:	80c60613          	addi	a2,a2,-2036 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02034b4:	29500593          	li	a1,661
ffffffffc02034b8:	00009517          	auipc	a0,0x9
ffffffffc02034bc:	43850513          	addi	a0,a0,1080 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02034c0:	fdffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034c4:	0000a697          	auipc	a3,0xa
ffffffffc02034c8:	a6c68693          	addi	a3,a3,-1428 # ffffffffc020cf30 <default_pmm_manager+0x790>
ffffffffc02034cc:	00008617          	auipc	a2,0x8
ffffffffc02034d0:	7ec60613          	addi	a2,a2,2028 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02034d4:	29f00593          	li	a1,671
ffffffffc02034d8:	00009517          	auipc	a0,0x9
ffffffffc02034dc:	41850513          	addi	a0,a0,1048 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02034e0:	fbffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034e4:	0000a697          	auipc	a3,0xa
ffffffffc02034e8:	a1468693          	addi	a3,a3,-1516 # ffffffffc020cef8 <default_pmm_manager+0x758>
ffffffffc02034ec:	00008617          	auipc	a2,0x8
ffffffffc02034f0:	7cc60613          	addi	a2,a2,1996 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02034f4:	29c00593          	li	a1,668
ffffffffc02034f8:	00009517          	auipc	a0,0x9
ffffffffc02034fc:	3f850513          	addi	a0,a0,1016 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203500:	f9ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203504:	0000a697          	auipc	a3,0xa
ffffffffc0203508:	9c468693          	addi	a3,a3,-1596 # ffffffffc020cec8 <default_pmm_manager+0x728>
ffffffffc020350c:	00008617          	auipc	a2,0x8
ffffffffc0203510:	7ac60613          	addi	a2,a2,1964 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203514:	29800593          	li	a1,664
ffffffffc0203518:	00009517          	auipc	a0,0x9
ffffffffc020351c:	3d850513          	addi	a0,a0,984 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203520:	f7ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203524:	86a2                	mv	a3,s0
ffffffffc0203526:	00009617          	auipc	a2,0x9
ffffffffc020352a:	35a60613          	addi	a2,a2,858 # ffffffffc020c880 <default_pmm_manager+0xe0>
ffffffffc020352e:	0dc00593          	li	a1,220
ffffffffc0203532:	00009517          	auipc	a0,0x9
ffffffffc0203536:	3be50513          	addi	a0,a0,958 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020353a:	f65fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020353e:	86ae                	mv	a3,a1
ffffffffc0203540:	00009617          	auipc	a2,0x9
ffffffffc0203544:	34060613          	addi	a2,a2,832 # ffffffffc020c880 <default_pmm_manager+0xe0>
ffffffffc0203548:	0db00593          	li	a1,219
ffffffffc020354c:	00009517          	auipc	a0,0x9
ffffffffc0203550:	3a450513          	addi	a0,a0,932 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203554:	f4bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203558:	00009697          	auipc	a3,0x9
ffffffffc020355c:	55868693          	addi	a3,a3,1368 # ffffffffc020cab0 <default_pmm_manager+0x310>
ffffffffc0203560:	00008617          	auipc	a2,0x8
ffffffffc0203564:	75860613          	addi	a2,a2,1880 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203568:	24f00593          	li	a1,591
ffffffffc020356c:	00009517          	auipc	a0,0x9
ffffffffc0203570:	38450513          	addi	a0,a0,900 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203574:	f2bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203578:	00009697          	auipc	a3,0x9
ffffffffc020357c:	51868693          	addi	a3,a3,1304 # ffffffffc020ca90 <default_pmm_manager+0x2f0>
ffffffffc0203580:	00008617          	auipc	a2,0x8
ffffffffc0203584:	73860613          	addi	a2,a2,1848 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203588:	24e00593          	li	a1,590
ffffffffc020358c:	00009517          	auipc	a0,0x9
ffffffffc0203590:	36450513          	addi	a0,a0,868 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203594:	f0bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203598:	00009617          	auipc	a2,0x9
ffffffffc020359c:	48860613          	addi	a2,a2,1160 # ffffffffc020ca20 <default_pmm_manager+0x280>
ffffffffc02035a0:	0aa00593          	li	a1,170
ffffffffc02035a4:	00009517          	auipc	a0,0x9
ffffffffc02035a8:	34c50513          	addi	a0,a0,844 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02035ac:	ef3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035b0:	00009617          	auipc	a2,0x9
ffffffffc02035b4:	3d860613          	addi	a2,a2,984 # ffffffffc020c988 <default_pmm_manager+0x1e8>
ffffffffc02035b8:	06500593          	li	a1,101
ffffffffc02035bc:	00009517          	auipc	a0,0x9
ffffffffc02035c0:	33450513          	addi	a0,a0,820 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02035c4:	edbfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035c8:	00009697          	auipc	a3,0x9
ffffffffc02035cc:	7a868693          	addi	a3,a3,1960 # ffffffffc020cd70 <default_pmm_manager+0x5d0>
ffffffffc02035d0:	00008617          	auipc	a2,0x8
ffffffffc02035d4:	6e860613          	addi	a2,a2,1768 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02035d8:	2a800593          	li	a1,680
ffffffffc02035dc:	00009517          	auipc	a0,0x9
ffffffffc02035e0:	31450513          	addi	a0,a0,788 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02035e4:	ebbfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035e8:	00009697          	auipc	a3,0x9
ffffffffc02035ec:	5c868693          	addi	a3,a3,1480 # ffffffffc020cbb0 <default_pmm_manager+0x410>
ffffffffc02035f0:	00008617          	auipc	a2,0x8
ffffffffc02035f4:	6c860613          	addi	a2,a2,1736 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02035f8:	25d00593          	li	a1,605
ffffffffc02035fc:	00009517          	auipc	a0,0x9
ffffffffc0203600:	2f450513          	addi	a0,a0,756 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203604:	e9bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203608:	86d6                	mv	a3,s5
ffffffffc020360a:	00009617          	auipc	a2,0x9
ffffffffc020360e:	1ce60613          	addi	a2,a2,462 # ffffffffc020c7d8 <default_pmm_manager+0x38>
ffffffffc0203612:	25c00593          	li	a1,604
ffffffffc0203616:	00009517          	auipc	a0,0x9
ffffffffc020361a:	2da50513          	addi	a0,a0,730 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020361e:	e81fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203622:	00009697          	auipc	a3,0x9
ffffffffc0203626:	6d668693          	addi	a3,a3,1750 # ffffffffc020ccf8 <default_pmm_manager+0x558>
ffffffffc020362a:	00008617          	auipc	a2,0x8
ffffffffc020362e:	68e60613          	addi	a2,a2,1678 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203632:	26900593          	li	a1,617
ffffffffc0203636:	00009517          	auipc	a0,0x9
ffffffffc020363a:	2ba50513          	addi	a0,a0,698 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020363e:	e61fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203642:	00009697          	auipc	a3,0x9
ffffffffc0203646:	69e68693          	addi	a3,a3,1694 # ffffffffc020cce0 <default_pmm_manager+0x540>
ffffffffc020364a:	00008617          	auipc	a2,0x8
ffffffffc020364e:	66e60613          	addi	a2,a2,1646 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203652:	26800593          	li	a1,616
ffffffffc0203656:	00009517          	auipc	a0,0x9
ffffffffc020365a:	29a50513          	addi	a0,a0,666 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020365e:	e41fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203662:	00009697          	auipc	a3,0x9
ffffffffc0203666:	64e68693          	addi	a3,a3,1614 # ffffffffc020ccb0 <default_pmm_manager+0x510>
ffffffffc020366a:	00008617          	auipc	a2,0x8
ffffffffc020366e:	64e60613          	addi	a2,a2,1614 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203672:	26700593          	li	a1,615
ffffffffc0203676:	00009517          	auipc	a0,0x9
ffffffffc020367a:	27a50513          	addi	a0,a0,634 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020367e:	e21fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203682:	00009697          	auipc	a3,0x9
ffffffffc0203686:	61668693          	addi	a3,a3,1558 # ffffffffc020cc98 <default_pmm_manager+0x4f8>
ffffffffc020368a:	00008617          	auipc	a2,0x8
ffffffffc020368e:	62e60613          	addi	a2,a2,1582 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203692:	26500593          	li	a1,613
ffffffffc0203696:	00009517          	auipc	a0,0x9
ffffffffc020369a:	25a50513          	addi	a0,a0,602 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020369e:	e01fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036a2:	00009697          	auipc	a3,0x9
ffffffffc02036a6:	5d668693          	addi	a3,a3,1494 # ffffffffc020cc78 <default_pmm_manager+0x4d8>
ffffffffc02036aa:	00008617          	auipc	a2,0x8
ffffffffc02036ae:	60e60613          	addi	a2,a2,1550 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02036b2:	26400593          	li	a1,612
ffffffffc02036b6:	00009517          	auipc	a0,0x9
ffffffffc02036ba:	23a50513          	addi	a0,a0,570 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02036be:	de1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036c2:	00009697          	auipc	a3,0x9
ffffffffc02036c6:	5a668693          	addi	a3,a3,1446 # ffffffffc020cc68 <default_pmm_manager+0x4c8>
ffffffffc02036ca:	00008617          	auipc	a2,0x8
ffffffffc02036ce:	5ee60613          	addi	a2,a2,1518 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02036d2:	26300593          	li	a1,611
ffffffffc02036d6:	00009517          	auipc	a0,0x9
ffffffffc02036da:	21a50513          	addi	a0,a0,538 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02036de:	dc1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036e2:	00009697          	auipc	a3,0x9
ffffffffc02036e6:	57668693          	addi	a3,a3,1398 # ffffffffc020cc58 <default_pmm_manager+0x4b8>
ffffffffc02036ea:	00008617          	auipc	a2,0x8
ffffffffc02036ee:	5ce60613          	addi	a2,a2,1486 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02036f2:	26200593          	li	a1,610
ffffffffc02036f6:	00009517          	auipc	a0,0x9
ffffffffc02036fa:	1fa50513          	addi	a0,a0,506 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02036fe:	da1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203702:	00009697          	auipc	a3,0x9
ffffffffc0203706:	51e68693          	addi	a3,a3,1310 # ffffffffc020cc20 <default_pmm_manager+0x480>
ffffffffc020370a:	00008617          	auipc	a2,0x8
ffffffffc020370e:	5ae60613          	addi	a2,a2,1454 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203712:	26100593          	li	a1,609
ffffffffc0203716:	00009517          	auipc	a0,0x9
ffffffffc020371a:	1da50513          	addi	a0,a0,474 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020371e:	d81fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203722:	00009697          	auipc	a3,0x9
ffffffffc0203726:	64e68693          	addi	a3,a3,1614 # ffffffffc020cd70 <default_pmm_manager+0x5d0>
ffffffffc020372a:	00008617          	auipc	a2,0x8
ffffffffc020372e:	58e60613          	addi	a2,a2,1422 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203732:	27e00593          	li	a1,638
ffffffffc0203736:	00009517          	auipc	a0,0x9
ffffffffc020373a:	1ba50513          	addi	a0,a0,442 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020373e:	d61fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203742:	00009617          	auipc	a2,0x9
ffffffffc0203746:	09660613          	addi	a2,a2,150 # ffffffffc020c7d8 <default_pmm_manager+0x38>
ffffffffc020374a:	07100593          	li	a1,113
ffffffffc020374e:	00009517          	auipc	a0,0x9
ffffffffc0203752:	0b250513          	addi	a0,a0,178 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc0203756:	d49fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020375a:	86a2                	mv	a3,s0
ffffffffc020375c:	00009617          	auipc	a2,0x9
ffffffffc0203760:	12460613          	addi	a2,a2,292 # ffffffffc020c880 <default_pmm_manager+0xe0>
ffffffffc0203764:	0ca00593          	li	a1,202
ffffffffc0203768:	00009517          	auipc	a0,0x9
ffffffffc020376c:	18850513          	addi	a0,a0,392 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203770:	d2ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203774:	00009617          	auipc	a2,0x9
ffffffffc0203778:	10c60613          	addi	a2,a2,268 # ffffffffc020c880 <default_pmm_manager+0xe0>
ffffffffc020377c:	08100593          	li	a1,129
ffffffffc0203780:	00009517          	auipc	a0,0x9
ffffffffc0203784:	17050513          	addi	a0,a0,368 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203788:	d17fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020378c:	00009697          	auipc	a3,0x9
ffffffffc0203790:	45468693          	addi	a3,a3,1108 # ffffffffc020cbe0 <default_pmm_manager+0x440>
ffffffffc0203794:	00008617          	auipc	a2,0x8
ffffffffc0203798:	52460613          	addi	a2,a2,1316 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020379c:	26000593          	li	a1,608
ffffffffc02037a0:	00009517          	auipc	a0,0x9
ffffffffc02037a4:	15050513          	addi	a0,a0,336 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02037a8:	cf7fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037ac:	00009697          	auipc	a3,0x9
ffffffffc02037b0:	37468693          	addi	a3,a3,884 # ffffffffc020cb20 <default_pmm_manager+0x380>
ffffffffc02037b4:	00008617          	auipc	a2,0x8
ffffffffc02037b8:	50460613          	addi	a2,a2,1284 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02037bc:	25400593          	li	a1,596
ffffffffc02037c0:	00009517          	auipc	a0,0x9
ffffffffc02037c4:	13050513          	addi	a0,a0,304 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02037c8:	cd7fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037cc:	985fe0ef          	jal	ra,ffffffffc0202150 <pte2page.part.0>
ffffffffc02037d0:	00009697          	auipc	a3,0x9
ffffffffc02037d4:	38068693          	addi	a3,a3,896 # ffffffffc020cb50 <default_pmm_manager+0x3b0>
ffffffffc02037d8:	00008617          	auipc	a2,0x8
ffffffffc02037dc:	4e060613          	addi	a2,a2,1248 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02037e0:	25700593          	li	a1,599
ffffffffc02037e4:	00009517          	auipc	a0,0x9
ffffffffc02037e8:	10c50513          	addi	a0,a0,268 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02037ec:	cb3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037f0:	00009697          	auipc	a3,0x9
ffffffffc02037f4:	30068693          	addi	a3,a3,768 # ffffffffc020caf0 <default_pmm_manager+0x350>
ffffffffc02037f8:	00008617          	auipc	a2,0x8
ffffffffc02037fc:	4c060613          	addi	a2,a2,1216 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203800:	25000593          	li	a1,592
ffffffffc0203804:	00009517          	auipc	a0,0x9
ffffffffc0203808:	0ec50513          	addi	a0,a0,236 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020380c:	c93fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203810:	00009697          	auipc	a3,0x9
ffffffffc0203814:	37068693          	addi	a3,a3,880 # ffffffffc020cb80 <default_pmm_manager+0x3e0>
ffffffffc0203818:	00008617          	auipc	a2,0x8
ffffffffc020381c:	4a060613          	addi	a2,a2,1184 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203820:	25800593          	li	a1,600
ffffffffc0203824:	00009517          	auipc	a0,0x9
ffffffffc0203828:	0cc50513          	addi	a0,a0,204 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020382c:	c73fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203830:	00009617          	auipc	a2,0x9
ffffffffc0203834:	fa860613          	addi	a2,a2,-88 # ffffffffc020c7d8 <default_pmm_manager+0x38>
ffffffffc0203838:	25b00593          	li	a1,603
ffffffffc020383c:	00009517          	auipc	a0,0x9
ffffffffc0203840:	0b450513          	addi	a0,a0,180 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203844:	c5bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203848:	00009697          	auipc	a3,0x9
ffffffffc020384c:	35068693          	addi	a3,a3,848 # ffffffffc020cb98 <default_pmm_manager+0x3f8>
ffffffffc0203850:	00008617          	auipc	a2,0x8
ffffffffc0203854:	46860613          	addi	a2,a2,1128 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203858:	25900593          	li	a1,601
ffffffffc020385c:	00009517          	auipc	a0,0x9
ffffffffc0203860:	09450513          	addi	a0,a0,148 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203864:	c3bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203868:	86ca                	mv	a3,s2
ffffffffc020386a:	00009617          	auipc	a2,0x9
ffffffffc020386e:	01660613          	addi	a2,a2,22 # ffffffffc020c880 <default_pmm_manager+0xe0>
ffffffffc0203872:	0c600593          	li	a1,198
ffffffffc0203876:	00009517          	auipc	a0,0x9
ffffffffc020387a:	07a50513          	addi	a0,a0,122 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020387e:	c21fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203882:	00009697          	auipc	a3,0x9
ffffffffc0203886:	47668693          	addi	a3,a3,1142 # ffffffffc020ccf8 <default_pmm_manager+0x558>
ffffffffc020388a:	00008617          	auipc	a2,0x8
ffffffffc020388e:	42e60613          	addi	a2,a2,1070 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203892:	27400593          	li	a1,628
ffffffffc0203896:	00009517          	auipc	a0,0x9
ffffffffc020389a:	05a50513          	addi	a0,a0,90 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc020389e:	c01fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038a2:	00009697          	auipc	a3,0x9
ffffffffc02038a6:	48668693          	addi	a3,a3,1158 # ffffffffc020cd28 <default_pmm_manager+0x588>
ffffffffc02038aa:	00008617          	auipc	a2,0x8
ffffffffc02038ae:	40e60613          	addi	a2,a2,1038 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02038b2:	27300593          	li	a1,627
ffffffffc02038b6:	00009517          	auipc	a0,0x9
ffffffffc02038ba:	03a50513          	addi	a0,a0,58 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc02038be:	be1fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02038c2 <copy_range>:
ffffffffc02038c2:	7159                	addi	sp,sp,-112
ffffffffc02038c4:	00d667b3          	or	a5,a2,a3
ffffffffc02038c8:	f486                	sd	ra,104(sp)
ffffffffc02038ca:	f0a2                	sd	s0,96(sp)
ffffffffc02038cc:	eca6                	sd	s1,88(sp)
ffffffffc02038ce:	e8ca                	sd	s2,80(sp)
ffffffffc02038d0:	e4ce                	sd	s3,72(sp)
ffffffffc02038d2:	e0d2                	sd	s4,64(sp)
ffffffffc02038d4:	fc56                	sd	s5,56(sp)
ffffffffc02038d6:	f85a                	sd	s6,48(sp)
ffffffffc02038d8:	f45e                	sd	s7,40(sp)
ffffffffc02038da:	f062                	sd	s8,32(sp)
ffffffffc02038dc:	ec66                	sd	s9,24(sp)
ffffffffc02038de:	e86a                	sd	s10,16(sp)
ffffffffc02038e0:	e46e                	sd	s11,8(sp)
ffffffffc02038e2:	17d2                	slli	a5,a5,0x34
ffffffffc02038e4:	20079f63          	bnez	a5,ffffffffc0203b02 <copy_range+0x240>
ffffffffc02038e8:	002007b7          	lui	a5,0x200
ffffffffc02038ec:	8432                	mv	s0,a2
ffffffffc02038ee:	1af66263          	bltu	a2,a5,ffffffffc0203a92 <copy_range+0x1d0>
ffffffffc02038f2:	8936                	mv	s2,a3
ffffffffc02038f4:	18d67f63          	bgeu	a2,a3,ffffffffc0203a92 <copy_range+0x1d0>
ffffffffc02038f8:	4785                	li	a5,1
ffffffffc02038fa:	07fe                	slli	a5,a5,0x1f
ffffffffc02038fc:	18d7eb63          	bltu	a5,a3,ffffffffc0203a92 <copy_range+0x1d0>
ffffffffc0203900:	5b7d                	li	s6,-1
ffffffffc0203902:	8aaa                	mv	s5,a0
ffffffffc0203904:	89ae                	mv	s3,a1
ffffffffc0203906:	6a05                	lui	s4,0x1
ffffffffc0203908:	00093c17          	auipc	s8,0x93
ffffffffc020390c:	f98c0c13          	addi	s8,s8,-104 # ffffffffc02968a0 <npage>
ffffffffc0203910:	00093b97          	auipc	s7,0x93
ffffffffc0203914:	f98b8b93          	addi	s7,s7,-104 # ffffffffc02968a8 <pages>
ffffffffc0203918:	00cb5b13          	srli	s6,s6,0xc
ffffffffc020391c:	00093c97          	auipc	s9,0x93
ffffffffc0203920:	f94c8c93          	addi	s9,s9,-108 # ffffffffc02968b0 <pmm_manager>
ffffffffc0203924:	4601                	li	a2,0
ffffffffc0203926:	85a2                	mv	a1,s0
ffffffffc0203928:	854e                	mv	a0,s3
ffffffffc020392a:	8fbfe0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc020392e:	84aa                	mv	s1,a0
ffffffffc0203930:	0e050c63          	beqz	a0,ffffffffc0203a28 <copy_range+0x166>
ffffffffc0203934:	611c                	ld	a5,0(a0)
ffffffffc0203936:	8b85                	andi	a5,a5,1
ffffffffc0203938:	e785                	bnez	a5,ffffffffc0203960 <copy_range+0x9e>
ffffffffc020393a:	9452                	add	s0,s0,s4
ffffffffc020393c:	ff2464e3          	bltu	s0,s2,ffffffffc0203924 <copy_range+0x62>
ffffffffc0203940:	4501                	li	a0,0
ffffffffc0203942:	70a6                	ld	ra,104(sp)
ffffffffc0203944:	7406                	ld	s0,96(sp)
ffffffffc0203946:	64e6                	ld	s1,88(sp)
ffffffffc0203948:	6946                	ld	s2,80(sp)
ffffffffc020394a:	69a6                	ld	s3,72(sp)
ffffffffc020394c:	6a06                	ld	s4,64(sp)
ffffffffc020394e:	7ae2                	ld	s5,56(sp)
ffffffffc0203950:	7b42                	ld	s6,48(sp)
ffffffffc0203952:	7ba2                	ld	s7,40(sp)
ffffffffc0203954:	7c02                	ld	s8,32(sp)
ffffffffc0203956:	6ce2                	ld	s9,24(sp)
ffffffffc0203958:	6d42                	ld	s10,16(sp)
ffffffffc020395a:	6da2                	ld	s11,8(sp)
ffffffffc020395c:	6165                	addi	sp,sp,112
ffffffffc020395e:	8082                	ret
ffffffffc0203960:	4605                	li	a2,1
ffffffffc0203962:	85a2                	mv	a1,s0
ffffffffc0203964:	8556                	mv	a0,s5
ffffffffc0203966:	8bffe0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc020396a:	c56d                	beqz	a0,ffffffffc0203a54 <copy_range+0x192>
ffffffffc020396c:	609c                	ld	a5,0(s1)
ffffffffc020396e:	0017f713          	andi	a4,a5,1
ffffffffc0203972:	01f7f493          	andi	s1,a5,31
ffffffffc0203976:	16070a63          	beqz	a4,ffffffffc0203aea <copy_range+0x228>
ffffffffc020397a:	000c3683          	ld	a3,0(s8)
ffffffffc020397e:	078a                	slli	a5,a5,0x2
ffffffffc0203980:	00c7d713          	srli	a4,a5,0xc
ffffffffc0203984:	14d77763          	bgeu	a4,a3,ffffffffc0203ad2 <copy_range+0x210>
ffffffffc0203988:	000bb783          	ld	a5,0(s7)
ffffffffc020398c:	fff806b7          	lui	a3,0xfff80
ffffffffc0203990:	9736                	add	a4,a4,a3
ffffffffc0203992:	071a                	slli	a4,a4,0x6
ffffffffc0203994:	00e78db3          	add	s11,a5,a4
ffffffffc0203998:	10002773          	csrr	a4,sstatus
ffffffffc020399c:	8b09                	andi	a4,a4,2
ffffffffc020399e:	e345                	bnez	a4,ffffffffc0203a3e <copy_range+0x17c>
ffffffffc02039a0:	000cb703          	ld	a4,0(s9)
ffffffffc02039a4:	4505                	li	a0,1
ffffffffc02039a6:	6f18                	ld	a4,24(a4)
ffffffffc02039a8:	9702                	jalr	a4
ffffffffc02039aa:	8d2a                	mv	s10,a0
ffffffffc02039ac:	0c0d8363          	beqz	s11,ffffffffc0203a72 <copy_range+0x1b0>
ffffffffc02039b0:	100d0163          	beqz	s10,ffffffffc0203ab2 <copy_range+0x1f0>
ffffffffc02039b4:	000bb703          	ld	a4,0(s7)
ffffffffc02039b8:	000805b7          	lui	a1,0x80
ffffffffc02039bc:	000c3603          	ld	a2,0(s8)
ffffffffc02039c0:	40ed86b3          	sub	a3,s11,a4
ffffffffc02039c4:	8699                	srai	a3,a3,0x6
ffffffffc02039c6:	96ae                	add	a3,a3,a1
ffffffffc02039c8:	0166f7b3          	and	a5,a3,s6
ffffffffc02039cc:	06b2                	slli	a3,a3,0xc
ffffffffc02039ce:	08c7f663          	bgeu	a5,a2,ffffffffc0203a5a <copy_range+0x198>
ffffffffc02039d2:	40ed07b3          	sub	a5,s10,a4
ffffffffc02039d6:	00093717          	auipc	a4,0x93
ffffffffc02039da:	ee270713          	addi	a4,a4,-286 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02039de:	6308                	ld	a0,0(a4)
ffffffffc02039e0:	8799                	srai	a5,a5,0x6
ffffffffc02039e2:	97ae                	add	a5,a5,a1
ffffffffc02039e4:	0167f733          	and	a4,a5,s6
ffffffffc02039e8:	00a685b3          	add	a1,a3,a0
ffffffffc02039ec:	07b2                	slli	a5,a5,0xc
ffffffffc02039ee:	06c77563          	bgeu	a4,a2,ffffffffc0203a58 <copy_range+0x196>
ffffffffc02039f2:	6605                	lui	a2,0x1
ffffffffc02039f4:	953e                	add	a0,a0,a5
ffffffffc02039f6:	631070ef          	jal	ra,ffffffffc020b826 <memcpy>
ffffffffc02039fa:	86a6                	mv	a3,s1
ffffffffc02039fc:	8622                	mv	a2,s0
ffffffffc02039fe:	85ea                	mv	a1,s10
ffffffffc0203a00:	8556                	mv	a0,s5
ffffffffc0203a02:	fd9fe0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0203a06:	d915                	beqz	a0,ffffffffc020393a <copy_range+0x78>
ffffffffc0203a08:	00009697          	auipc	a3,0x9
ffffffffc0203a0c:	59068693          	addi	a3,a3,1424 # ffffffffc020cf98 <default_pmm_manager+0x7f8>
ffffffffc0203a10:	00008617          	auipc	a2,0x8
ffffffffc0203a14:	2a860613          	addi	a2,a2,680 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203a18:	1ec00593          	li	a1,492
ffffffffc0203a1c:	00009517          	auipc	a0,0x9
ffffffffc0203a20:	ed450513          	addi	a0,a0,-300 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203a24:	a7bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a28:	00200637          	lui	a2,0x200
ffffffffc0203a2c:	9432                	add	s0,s0,a2
ffffffffc0203a2e:	ffe00637          	lui	a2,0xffe00
ffffffffc0203a32:	8c71                	and	s0,s0,a2
ffffffffc0203a34:	f00406e3          	beqz	s0,ffffffffc0203940 <copy_range+0x7e>
ffffffffc0203a38:	ef2466e3          	bltu	s0,s2,ffffffffc0203924 <copy_range+0x62>
ffffffffc0203a3c:	b711                	j	ffffffffc0203940 <copy_range+0x7e>
ffffffffc0203a3e:	a34fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203a42:	000cb703          	ld	a4,0(s9)
ffffffffc0203a46:	4505                	li	a0,1
ffffffffc0203a48:	6f18                	ld	a4,24(a4)
ffffffffc0203a4a:	9702                	jalr	a4
ffffffffc0203a4c:	8d2a                	mv	s10,a0
ffffffffc0203a4e:	a1efd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203a52:	bfa9                	j	ffffffffc02039ac <copy_range+0xea>
ffffffffc0203a54:	5571                	li	a0,-4
ffffffffc0203a56:	b5f5                	j	ffffffffc0203942 <copy_range+0x80>
ffffffffc0203a58:	86be                	mv	a3,a5
ffffffffc0203a5a:	00009617          	auipc	a2,0x9
ffffffffc0203a5e:	d7e60613          	addi	a2,a2,-642 # ffffffffc020c7d8 <default_pmm_manager+0x38>
ffffffffc0203a62:	07100593          	li	a1,113
ffffffffc0203a66:	00009517          	auipc	a0,0x9
ffffffffc0203a6a:	d9a50513          	addi	a0,a0,-614 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc0203a6e:	a31fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a72:	00009697          	auipc	a3,0x9
ffffffffc0203a76:	50668693          	addi	a3,a3,1286 # ffffffffc020cf78 <default_pmm_manager+0x7d8>
ffffffffc0203a7a:	00008617          	auipc	a2,0x8
ffffffffc0203a7e:	23e60613          	addi	a2,a2,574 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203a82:	1ce00593          	li	a1,462
ffffffffc0203a86:	00009517          	auipc	a0,0x9
ffffffffc0203a8a:	e6a50513          	addi	a0,a0,-406 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203a8e:	a11fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a92:	00009697          	auipc	a3,0x9
ffffffffc0203a96:	ec668693          	addi	a3,a3,-314 # ffffffffc020c958 <default_pmm_manager+0x1b8>
ffffffffc0203a9a:	00008617          	auipc	a2,0x8
ffffffffc0203a9e:	21e60613          	addi	a2,a2,542 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203aa2:	1b600593          	li	a1,438
ffffffffc0203aa6:	00009517          	auipc	a0,0x9
ffffffffc0203aaa:	e4a50513          	addi	a0,a0,-438 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203aae:	9f1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ab2:	00009697          	auipc	a3,0x9
ffffffffc0203ab6:	4d668693          	addi	a3,a3,1238 # ffffffffc020cf88 <default_pmm_manager+0x7e8>
ffffffffc0203aba:	00008617          	auipc	a2,0x8
ffffffffc0203abe:	1fe60613          	addi	a2,a2,510 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203ac2:	1cf00593          	li	a1,463
ffffffffc0203ac6:	00009517          	auipc	a0,0x9
ffffffffc0203aca:	e2a50513          	addi	a0,a0,-470 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203ace:	9d1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ad2:	00009617          	auipc	a2,0x9
ffffffffc0203ad6:	dd660613          	addi	a2,a2,-554 # ffffffffc020c8a8 <default_pmm_manager+0x108>
ffffffffc0203ada:	06900593          	li	a1,105
ffffffffc0203ade:	00009517          	auipc	a0,0x9
ffffffffc0203ae2:	d2250513          	addi	a0,a0,-734 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc0203ae6:	9b9fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203aea:	00009617          	auipc	a2,0x9
ffffffffc0203aee:	dde60613          	addi	a2,a2,-546 # ffffffffc020c8c8 <default_pmm_manager+0x128>
ffffffffc0203af2:	07f00593          	li	a1,127
ffffffffc0203af6:	00009517          	auipc	a0,0x9
ffffffffc0203afa:	d0a50513          	addi	a0,a0,-758 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc0203afe:	9a1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b02:	00009697          	auipc	a3,0x9
ffffffffc0203b06:	e2668693          	addi	a3,a3,-474 # ffffffffc020c928 <default_pmm_manager+0x188>
ffffffffc0203b0a:	00008617          	auipc	a2,0x8
ffffffffc0203b0e:	1ae60613          	addi	a2,a2,430 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203b12:	1b500593          	li	a1,437
ffffffffc0203b16:	00009517          	auipc	a0,0x9
ffffffffc0203b1a:	dda50513          	addi	a0,a0,-550 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203b1e:	981fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203b22 <pgdir_alloc_page>:
ffffffffc0203b22:	7179                	addi	sp,sp,-48
ffffffffc0203b24:	ec26                	sd	s1,24(sp)
ffffffffc0203b26:	e84a                	sd	s2,16(sp)
ffffffffc0203b28:	e052                	sd	s4,0(sp)
ffffffffc0203b2a:	f406                	sd	ra,40(sp)
ffffffffc0203b2c:	f022                	sd	s0,32(sp)
ffffffffc0203b2e:	e44e                	sd	s3,8(sp)
ffffffffc0203b30:	8a2a                	mv	s4,a0
ffffffffc0203b32:	84ae                	mv	s1,a1
ffffffffc0203b34:	8932                	mv	s2,a2
ffffffffc0203b36:	100027f3          	csrr	a5,sstatus
ffffffffc0203b3a:	8b89                	andi	a5,a5,2
ffffffffc0203b3c:	00093997          	auipc	s3,0x93
ffffffffc0203b40:	d7498993          	addi	s3,s3,-652 # ffffffffc02968b0 <pmm_manager>
ffffffffc0203b44:	ef8d                	bnez	a5,ffffffffc0203b7e <pgdir_alloc_page+0x5c>
ffffffffc0203b46:	0009b783          	ld	a5,0(s3)
ffffffffc0203b4a:	4505                	li	a0,1
ffffffffc0203b4c:	6f9c                	ld	a5,24(a5)
ffffffffc0203b4e:	9782                	jalr	a5
ffffffffc0203b50:	842a                	mv	s0,a0
ffffffffc0203b52:	cc09                	beqz	s0,ffffffffc0203b6c <pgdir_alloc_page+0x4a>
ffffffffc0203b54:	86ca                	mv	a3,s2
ffffffffc0203b56:	8626                	mv	a2,s1
ffffffffc0203b58:	85a2                	mv	a1,s0
ffffffffc0203b5a:	8552                	mv	a0,s4
ffffffffc0203b5c:	e7ffe0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0203b60:	e915                	bnez	a0,ffffffffc0203b94 <pgdir_alloc_page+0x72>
ffffffffc0203b62:	4018                	lw	a4,0(s0)
ffffffffc0203b64:	fc04                	sd	s1,56(s0)
ffffffffc0203b66:	4785                	li	a5,1
ffffffffc0203b68:	04f71e63          	bne	a4,a5,ffffffffc0203bc4 <pgdir_alloc_page+0xa2>
ffffffffc0203b6c:	70a2                	ld	ra,40(sp)
ffffffffc0203b6e:	8522                	mv	a0,s0
ffffffffc0203b70:	7402                	ld	s0,32(sp)
ffffffffc0203b72:	64e2                	ld	s1,24(sp)
ffffffffc0203b74:	6942                	ld	s2,16(sp)
ffffffffc0203b76:	69a2                	ld	s3,8(sp)
ffffffffc0203b78:	6a02                	ld	s4,0(sp)
ffffffffc0203b7a:	6145                	addi	sp,sp,48
ffffffffc0203b7c:	8082                	ret
ffffffffc0203b7e:	8f4fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203b82:	0009b783          	ld	a5,0(s3)
ffffffffc0203b86:	4505                	li	a0,1
ffffffffc0203b88:	6f9c                	ld	a5,24(a5)
ffffffffc0203b8a:	9782                	jalr	a5
ffffffffc0203b8c:	842a                	mv	s0,a0
ffffffffc0203b8e:	8defd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203b92:	b7c1                	j	ffffffffc0203b52 <pgdir_alloc_page+0x30>
ffffffffc0203b94:	100027f3          	csrr	a5,sstatus
ffffffffc0203b98:	8b89                	andi	a5,a5,2
ffffffffc0203b9a:	eb89                	bnez	a5,ffffffffc0203bac <pgdir_alloc_page+0x8a>
ffffffffc0203b9c:	0009b783          	ld	a5,0(s3)
ffffffffc0203ba0:	8522                	mv	a0,s0
ffffffffc0203ba2:	4585                	li	a1,1
ffffffffc0203ba4:	739c                	ld	a5,32(a5)
ffffffffc0203ba6:	4401                	li	s0,0
ffffffffc0203ba8:	9782                	jalr	a5
ffffffffc0203baa:	b7c9                	j	ffffffffc0203b6c <pgdir_alloc_page+0x4a>
ffffffffc0203bac:	8c6fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203bb0:	0009b783          	ld	a5,0(s3)
ffffffffc0203bb4:	8522                	mv	a0,s0
ffffffffc0203bb6:	4585                	li	a1,1
ffffffffc0203bb8:	739c                	ld	a5,32(a5)
ffffffffc0203bba:	4401                	li	s0,0
ffffffffc0203bbc:	9782                	jalr	a5
ffffffffc0203bbe:	8aefd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203bc2:	b76d                	j	ffffffffc0203b6c <pgdir_alloc_page+0x4a>
ffffffffc0203bc4:	00009697          	auipc	a3,0x9
ffffffffc0203bc8:	3e468693          	addi	a3,a3,996 # ffffffffc020cfa8 <default_pmm_manager+0x808>
ffffffffc0203bcc:	00008617          	auipc	a2,0x8
ffffffffc0203bd0:	0ec60613          	addi	a2,a2,236 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203bd4:	23500593          	li	a1,565
ffffffffc0203bd8:	00009517          	auipc	a0,0x9
ffffffffc0203bdc:	d1850513          	addi	a0,a0,-744 # ffffffffc020c8f0 <default_pmm_manager+0x150>
ffffffffc0203be0:	8bffc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203be4 <check_vma_overlap.part.0>:
ffffffffc0203be4:	1141                	addi	sp,sp,-16
ffffffffc0203be6:	00009697          	auipc	a3,0x9
ffffffffc0203bea:	3da68693          	addi	a3,a3,986 # ffffffffc020cfc0 <default_pmm_manager+0x820>
ffffffffc0203bee:	00008617          	auipc	a2,0x8
ffffffffc0203bf2:	0ca60613          	addi	a2,a2,202 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203bf6:	07400593          	li	a1,116
ffffffffc0203bfa:	00009517          	auipc	a0,0x9
ffffffffc0203bfe:	3e650513          	addi	a0,a0,998 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc0203c02:	e406                	sd	ra,8(sp)
ffffffffc0203c04:	89bfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203c08 <mm_create>:
ffffffffc0203c08:	1141                	addi	sp,sp,-16
ffffffffc0203c0a:	05800513          	li	a0,88
ffffffffc0203c0e:	e022                	sd	s0,0(sp)
ffffffffc0203c10:	e406                	sd	ra,8(sp)
ffffffffc0203c12:	b7cfe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203c16:	842a                	mv	s0,a0
ffffffffc0203c18:	c115                	beqz	a0,ffffffffc0203c3c <mm_create+0x34>
ffffffffc0203c1a:	e408                	sd	a0,8(s0)
ffffffffc0203c1c:	e008                	sd	a0,0(s0)
ffffffffc0203c1e:	00053823          	sd	zero,16(a0)
ffffffffc0203c22:	00053c23          	sd	zero,24(a0)
ffffffffc0203c26:	02052023          	sw	zero,32(a0)
ffffffffc0203c2a:	02053423          	sd	zero,40(a0)
ffffffffc0203c2e:	02052823          	sw	zero,48(a0)
ffffffffc0203c32:	4585                	li	a1,1
ffffffffc0203c34:	03850513          	addi	a0,a0,56
ffffffffc0203c38:	123000ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0203c3c:	60a2                	ld	ra,8(sp)
ffffffffc0203c3e:	8522                	mv	a0,s0
ffffffffc0203c40:	6402                	ld	s0,0(sp)
ffffffffc0203c42:	0141                	addi	sp,sp,16
ffffffffc0203c44:	8082                	ret

ffffffffc0203c46 <find_vma>:
ffffffffc0203c46:	86aa                	mv	a3,a0
ffffffffc0203c48:	c505                	beqz	a0,ffffffffc0203c70 <find_vma+0x2a>
ffffffffc0203c4a:	6908                	ld	a0,16(a0)
ffffffffc0203c4c:	c501                	beqz	a0,ffffffffc0203c54 <find_vma+0xe>
ffffffffc0203c4e:	651c                	ld	a5,8(a0)
ffffffffc0203c50:	02f5f263          	bgeu	a1,a5,ffffffffc0203c74 <find_vma+0x2e>
ffffffffc0203c54:	669c                	ld	a5,8(a3)
ffffffffc0203c56:	00f68d63          	beq	a3,a5,ffffffffc0203c70 <find_vma+0x2a>
ffffffffc0203c5a:	fe87b703          	ld	a4,-24(a5) # 1fffe8 <_binary_bin_sfs_img_size+0x18ace8>
ffffffffc0203c5e:	00e5e663          	bltu	a1,a4,ffffffffc0203c6a <find_vma+0x24>
ffffffffc0203c62:	ff07b703          	ld	a4,-16(a5)
ffffffffc0203c66:	00e5ec63          	bltu	a1,a4,ffffffffc0203c7e <find_vma+0x38>
ffffffffc0203c6a:	679c                	ld	a5,8(a5)
ffffffffc0203c6c:	fef697e3          	bne	a3,a5,ffffffffc0203c5a <find_vma+0x14>
ffffffffc0203c70:	4501                	li	a0,0
ffffffffc0203c72:	8082                	ret
ffffffffc0203c74:	691c                	ld	a5,16(a0)
ffffffffc0203c76:	fcf5ffe3          	bgeu	a1,a5,ffffffffc0203c54 <find_vma+0xe>
ffffffffc0203c7a:	ea88                	sd	a0,16(a3)
ffffffffc0203c7c:	8082                	ret
ffffffffc0203c7e:	fe078513          	addi	a0,a5,-32
ffffffffc0203c82:	ea88                	sd	a0,16(a3)
ffffffffc0203c84:	8082                	ret

ffffffffc0203c86 <insert_vma_struct>:
ffffffffc0203c86:	6590                	ld	a2,8(a1)
ffffffffc0203c88:	0105b803          	ld	a6,16(a1) # 80010 <_binary_bin_sfs_img_size+0xad10>
ffffffffc0203c8c:	1141                	addi	sp,sp,-16
ffffffffc0203c8e:	e406                	sd	ra,8(sp)
ffffffffc0203c90:	87aa                	mv	a5,a0
ffffffffc0203c92:	01066763          	bltu	a2,a6,ffffffffc0203ca0 <insert_vma_struct+0x1a>
ffffffffc0203c96:	a085                	j	ffffffffc0203cf6 <insert_vma_struct+0x70>
ffffffffc0203c98:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203c9c:	04e66863          	bltu	a2,a4,ffffffffc0203cec <insert_vma_struct+0x66>
ffffffffc0203ca0:	86be                	mv	a3,a5
ffffffffc0203ca2:	679c                	ld	a5,8(a5)
ffffffffc0203ca4:	fef51ae3          	bne	a0,a5,ffffffffc0203c98 <insert_vma_struct+0x12>
ffffffffc0203ca8:	02a68463          	beq	a3,a0,ffffffffc0203cd0 <insert_vma_struct+0x4a>
ffffffffc0203cac:	ff06b703          	ld	a4,-16(a3)
ffffffffc0203cb0:	fe86b883          	ld	a7,-24(a3)
ffffffffc0203cb4:	08e8f163          	bgeu	a7,a4,ffffffffc0203d36 <insert_vma_struct+0xb0>
ffffffffc0203cb8:	04e66f63          	bltu	a2,a4,ffffffffc0203d16 <insert_vma_struct+0x90>
ffffffffc0203cbc:	00f50a63          	beq	a0,a5,ffffffffc0203cd0 <insert_vma_struct+0x4a>
ffffffffc0203cc0:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203cc4:	05076963          	bltu	a4,a6,ffffffffc0203d16 <insert_vma_struct+0x90>
ffffffffc0203cc8:	ff07b603          	ld	a2,-16(a5)
ffffffffc0203ccc:	02c77363          	bgeu	a4,a2,ffffffffc0203cf2 <insert_vma_struct+0x6c>
ffffffffc0203cd0:	5118                	lw	a4,32(a0)
ffffffffc0203cd2:	e188                	sd	a0,0(a1)
ffffffffc0203cd4:	02058613          	addi	a2,a1,32
ffffffffc0203cd8:	e390                	sd	a2,0(a5)
ffffffffc0203cda:	e690                	sd	a2,8(a3)
ffffffffc0203cdc:	60a2                	ld	ra,8(sp)
ffffffffc0203cde:	f59c                	sd	a5,40(a1)
ffffffffc0203ce0:	f194                	sd	a3,32(a1)
ffffffffc0203ce2:	0017079b          	addiw	a5,a4,1
ffffffffc0203ce6:	d11c                	sw	a5,32(a0)
ffffffffc0203ce8:	0141                	addi	sp,sp,16
ffffffffc0203cea:	8082                	ret
ffffffffc0203cec:	fca690e3          	bne	a3,a0,ffffffffc0203cac <insert_vma_struct+0x26>
ffffffffc0203cf0:	bfd1                	j	ffffffffc0203cc4 <insert_vma_struct+0x3e>
ffffffffc0203cf2:	ef3ff0ef          	jal	ra,ffffffffc0203be4 <check_vma_overlap.part.0>
ffffffffc0203cf6:	00009697          	auipc	a3,0x9
ffffffffc0203cfa:	2fa68693          	addi	a3,a3,762 # ffffffffc020cff0 <default_pmm_manager+0x850>
ffffffffc0203cfe:	00008617          	auipc	a2,0x8
ffffffffc0203d02:	fba60613          	addi	a2,a2,-70 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203d06:	07a00593          	li	a1,122
ffffffffc0203d0a:	00009517          	auipc	a0,0x9
ffffffffc0203d0e:	2d650513          	addi	a0,a0,726 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc0203d12:	f8cfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203d16:	00009697          	auipc	a3,0x9
ffffffffc0203d1a:	31a68693          	addi	a3,a3,794 # ffffffffc020d030 <default_pmm_manager+0x890>
ffffffffc0203d1e:	00008617          	auipc	a2,0x8
ffffffffc0203d22:	f9a60613          	addi	a2,a2,-102 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203d26:	07300593          	li	a1,115
ffffffffc0203d2a:	00009517          	auipc	a0,0x9
ffffffffc0203d2e:	2b650513          	addi	a0,a0,694 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc0203d32:	f6cfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203d36:	00009697          	auipc	a3,0x9
ffffffffc0203d3a:	2da68693          	addi	a3,a3,730 # ffffffffc020d010 <default_pmm_manager+0x870>
ffffffffc0203d3e:	00008617          	auipc	a2,0x8
ffffffffc0203d42:	f7a60613          	addi	a2,a2,-134 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203d46:	07200593          	li	a1,114
ffffffffc0203d4a:	00009517          	auipc	a0,0x9
ffffffffc0203d4e:	29650513          	addi	a0,a0,662 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc0203d52:	f4cfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203d56 <mm_destroy>:
ffffffffc0203d56:	591c                	lw	a5,48(a0)
ffffffffc0203d58:	1141                	addi	sp,sp,-16
ffffffffc0203d5a:	e406                	sd	ra,8(sp)
ffffffffc0203d5c:	e022                	sd	s0,0(sp)
ffffffffc0203d5e:	e78d                	bnez	a5,ffffffffc0203d88 <mm_destroy+0x32>
ffffffffc0203d60:	842a                	mv	s0,a0
ffffffffc0203d62:	6508                	ld	a0,8(a0)
ffffffffc0203d64:	00a40c63          	beq	s0,a0,ffffffffc0203d7c <mm_destroy+0x26>
ffffffffc0203d68:	6118                	ld	a4,0(a0)
ffffffffc0203d6a:	651c                	ld	a5,8(a0)
ffffffffc0203d6c:	1501                	addi	a0,a0,-32
ffffffffc0203d6e:	e71c                	sd	a5,8(a4)
ffffffffc0203d70:	e398                	sd	a4,0(a5)
ffffffffc0203d72:	accfe0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0203d76:	6408                	ld	a0,8(s0)
ffffffffc0203d78:	fea418e3          	bne	s0,a0,ffffffffc0203d68 <mm_destroy+0x12>
ffffffffc0203d7c:	8522                	mv	a0,s0
ffffffffc0203d7e:	6402                	ld	s0,0(sp)
ffffffffc0203d80:	60a2                	ld	ra,8(sp)
ffffffffc0203d82:	0141                	addi	sp,sp,16
ffffffffc0203d84:	abafe06f          	j	ffffffffc020203e <kfree>
ffffffffc0203d88:	00009697          	auipc	a3,0x9
ffffffffc0203d8c:	2c868693          	addi	a3,a3,712 # ffffffffc020d050 <default_pmm_manager+0x8b0>
ffffffffc0203d90:	00008617          	auipc	a2,0x8
ffffffffc0203d94:	f2860613          	addi	a2,a2,-216 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203d98:	09e00593          	li	a1,158
ffffffffc0203d9c:	00009517          	auipc	a0,0x9
ffffffffc0203da0:	24450513          	addi	a0,a0,580 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc0203da4:	efafc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203da8 <mm_map>:
ffffffffc0203da8:	7139                	addi	sp,sp,-64
ffffffffc0203daa:	f822                	sd	s0,48(sp)
ffffffffc0203dac:	6405                	lui	s0,0x1
ffffffffc0203dae:	147d                	addi	s0,s0,-1
ffffffffc0203db0:	77fd                	lui	a5,0xfffff
ffffffffc0203db2:	9622                	add	a2,a2,s0
ffffffffc0203db4:	962e                	add	a2,a2,a1
ffffffffc0203db6:	f426                	sd	s1,40(sp)
ffffffffc0203db8:	fc06                	sd	ra,56(sp)
ffffffffc0203dba:	00f5f4b3          	and	s1,a1,a5
ffffffffc0203dbe:	f04a                	sd	s2,32(sp)
ffffffffc0203dc0:	ec4e                	sd	s3,24(sp)
ffffffffc0203dc2:	e852                	sd	s4,16(sp)
ffffffffc0203dc4:	e456                	sd	s5,8(sp)
ffffffffc0203dc6:	002005b7          	lui	a1,0x200
ffffffffc0203dca:	00f67433          	and	s0,a2,a5
ffffffffc0203dce:	06b4e363          	bltu	s1,a1,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203dd2:	0684f163          	bgeu	s1,s0,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203dd6:	4785                	li	a5,1
ffffffffc0203dd8:	07fe                	slli	a5,a5,0x1f
ffffffffc0203dda:	0487ed63          	bltu	a5,s0,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203dde:	89aa                	mv	s3,a0
ffffffffc0203de0:	cd21                	beqz	a0,ffffffffc0203e38 <mm_map+0x90>
ffffffffc0203de2:	85a6                	mv	a1,s1
ffffffffc0203de4:	8ab6                	mv	s5,a3
ffffffffc0203de6:	8a3a                	mv	s4,a4
ffffffffc0203de8:	e5fff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0203dec:	c501                	beqz	a0,ffffffffc0203df4 <mm_map+0x4c>
ffffffffc0203dee:	651c                	ld	a5,8(a0)
ffffffffc0203df0:	0487e263          	bltu	a5,s0,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203df4:	03000513          	li	a0,48
ffffffffc0203df8:	996fe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203dfc:	892a                	mv	s2,a0
ffffffffc0203dfe:	5571                	li	a0,-4
ffffffffc0203e00:	02090163          	beqz	s2,ffffffffc0203e22 <mm_map+0x7a>
ffffffffc0203e04:	854e                	mv	a0,s3
ffffffffc0203e06:	00993423          	sd	s1,8(s2)
ffffffffc0203e0a:	00893823          	sd	s0,16(s2)
ffffffffc0203e0e:	01592c23          	sw	s5,24(s2)
ffffffffc0203e12:	85ca                	mv	a1,s2
ffffffffc0203e14:	e73ff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc0203e18:	4501                	li	a0,0
ffffffffc0203e1a:	000a0463          	beqz	s4,ffffffffc0203e22 <mm_map+0x7a>
ffffffffc0203e1e:	012a3023          	sd	s2,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0203e22:	70e2                	ld	ra,56(sp)
ffffffffc0203e24:	7442                	ld	s0,48(sp)
ffffffffc0203e26:	74a2                	ld	s1,40(sp)
ffffffffc0203e28:	7902                	ld	s2,32(sp)
ffffffffc0203e2a:	69e2                	ld	s3,24(sp)
ffffffffc0203e2c:	6a42                	ld	s4,16(sp)
ffffffffc0203e2e:	6aa2                	ld	s5,8(sp)
ffffffffc0203e30:	6121                	addi	sp,sp,64
ffffffffc0203e32:	8082                	ret
ffffffffc0203e34:	5575                	li	a0,-3
ffffffffc0203e36:	b7f5                	j	ffffffffc0203e22 <mm_map+0x7a>
ffffffffc0203e38:	00009697          	auipc	a3,0x9
ffffffffc0203e3c:	23068693          	addi	a3,a3,560 # ffffffffc020d068 <default_pmm_manager+0x8c8>
ffffffffc0203e40:	00008617          	auipc	a2,0x8
ffffffffc0203e44:	e7860613          	addi	a2,a2,-392 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203e48:	0b300593          	li	a1,179
ffffffffc0203e4c:	00009517          	auipc	a0,0x9
ffffffffc0203e50:	19450513          	addi	a0,a0,404 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc0203e54:	e4afc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203e58 <dup_mmap>:
ffffffffc0203e58:	7139                	addi	sp,sp,-64
ffffffffc0203e5a:	fc06                	sd	ra,56(sp)
ffffffffc0203e5c:	f822                	sd	s0,48(sp)
ffffffffc0203e5e:	f426                	sd	s1,40(sp)
ffffffffc0203e60:	f04a                	sd	s2,32(sp)
ffffffffc0203e62:	ec4e                	sd	s3,24(sp)
ffffffffc0203e64:	e852                	sd	s4,16(sp)
ffffffffc0203e66:	e456                	sd	s5,8(sp)
ffffffffc0203e68:	c52d                	beqz	a0,ffffffffc0203ed2 <dup_mmap+0x7a>
ffffffffc0203e6a:	892a                	mv	s2,a0
ffffffffc0203e6c:	84ae                	mv	s1,a1
ffffffffc0203e6e:	842e                	mv	s0,a1
ffffffffc0203e70:	e595                	bnez	a1,ffffffffc0203e9c <dup_mmap+0x44>
ffffffffc0203e72:	a085                	j	ffffffffc0203ed2 <dup_mmap+0x7a>
ffffffffc0203e74:	854a                	mv	a0,s2
ffffffffc0203e76:	0155b423          	sd	s5,8(a1) # 200008 <_binary_bin_sfs_img_size+0x18ad08>
ffffffffc0203e7a:	0145b823          	sd	s4,16(a1)
ffffffffc0203e7e:	0135ac23          	sw	s3,24(a1)
ffffffffc0203e82:	e05ff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc0203e86:	ff043683          	ld	a3,-16(s0) # ff0 <_binary_bin_swap_img_size-0x6d10>
ffffffffc0203e8a:	fe843603          	ld	a2,-24(s0)
ffffffffc0203e8e:	6c8c                	ld	a1,24(s1)
ffffffffc0203e90:	01893503          	ld	a0,24(s2)
ffffffffc0203e94:	4701                	li	a4,0
ffffffffc0203e96:	a2dff0ef          	jal	ra,ffffffffc02038c2 <copy_range>
ffffffffc0203e9a:	e105                	bnez	a0,ffffffffc0203eba <dup_mmap+0x62>
ffffffffc0203e9c:	6000                	ld	s0,0(s0)
ffffffffc0203e9e:	02848863          	beq	s1,s0,ffffffffc0203ece <dup_mmap+0x76>
ffffffffc0203ea2:	03000513          	li	a0,48
ffffffffc0203ea6:	fe843a83          	ld	s5,-24(s0)
ffffffffc0203eaa:	ff043a03          	ld	s4,-16(s0)
ffffffffc0203eae:	ff842983          	lw	s3,-8(s0)
ffffffffc0203eb2:	8dcfe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203eb6:	85aa                	mv	a1,a0
ffffffffc0203eb8:	fd55                	bnez	a0,ffffffffc0203e74 <dup_mmap+0x1c>
ffffffffc0203eba:	5571                	li	a0,-4
ffffffffc0203ebc:	70e2                	ld	ra,56(sp)
ffffffffc0203ebe:	7442                	ld	s0,48(sp)
ffffffffc0203ec0:	74a2                	ld	s1,40(sp)
ffffffffc0203ec2:	7902                	ld	s2,32(sp)
ffffffffc0203ec4:	69e2                	ld	s3,24(sp)
ffffffffc0203ec6:	6a42                	ld	s4,16(sp)
ffffffffc0203ec8:	6aa2                	ld	s5,8(sp)
ffffffffc0203eca:	6121                	addi	sp,sp,64
ffffffffc0203ecc:	8082                	ret
ffffffffc0203ece:	4501                	li	a0,0
ffffffffc0203ed0:	b7f5                	j	ffffffffc0203ebc <dup_mmap+0x64>
ffffffffc0203ed2:	00009697          	auipc	a3,0x9
ffffffffc0203ed6:	1a668693          	addi	a3,a3,422 # ffffffffc020d078 <default_pmm_manager+0x8d8>
ffffffffc0203eda:	00008617          	auipc	a2,0x8
ffffffffc0203ede:	dde60613          	addi	a2,a2,-546 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203ee2:	0cf00593          	li	a1,207
ffffffffc0203ee6:	00009517          	auipc	a0,0x9
ffffffffc0203eea:	0fa50513          	addi	a0,a0,250 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc0203eee:	db0fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203ef2 <exit_mmap>:
ffffffffc0203ef2:	1101                	addi	sp,sp,-32
ffffffffc0203ef4:	ec06                	sd	ra,24(sp)
ffffffffc0203ef6:	e822                	sd	s0,16(sp)
ffffffffc0203ef8:	e426                	sd	s1,8(sp)
ffffffffc0203efa:	e04a                	sd	s2,0(sp)
ffffffffc0203efc:	c531                	beqz	a0,ffffffffc0203f48 <exit_mmap+0x56>
ffffffffc0203efe:	591c                	lw	a5,48(a0)
ffffffffc0203f00:	84aa                	mv	s1,a0
ffffffffc0203f02:	e3b9                	bnez	a5,ffffffffc0203f48 <exit_mmap+0x56>
ffffffffc0203f04:	6500                	ld	s0,8(a0)
ffffffffc0203f06:	01853903          	ld	s2,24(a0)
ffffffffc0203f0a:	02850663          	beq	a0,s0,ffffffffc0203f36 <exit_mmap+0x44>
ffffffffc0203f0e:	ff043603          	ld	a2,-16(s0)
ffffffffc0203f12:	fe843583          	ld	a1,-24(s0)
ffffffffc0203f16:	854a                	mv	a0,s2
ffffffffc0203f18:	e4efe0ef          	jal	ra,ffffffffc0202566 <unmap_range>
ffffffffc0203f1c:	6400                	ld	s0,8(s0)
ffffffffc0203f1e:	fe8498e3          	bne	s1,s0,ffffffffc0203f0e <exit_mmap+0x1c>
ffffffffc0203f22:	6400                	ld	s0,8(s0)
ffffffffc0203f24:	00848c63          	beq	s1,s0,ffffffffc0203f3c <exit_mmap+0x4a>
ffffffffc0203f28:	ff043603          	ld	a2,-16(s0)
ffffffffc0203f2c:	fe843583          	ld	a1,-24(s0)
ffffffffc0203f30:	854a                	mv	a0,s2
ffffffffc0203f32:	f7afe0ef          	jal	ra,ffffffffc02026ac <exit_range>
ffffffffc0203f36:	6400                	ld	s0,8(s0)
ffffffffc0203f38:	fe8498e3          	bne	s1,s0,ffffffffc0203f28 <exit_mmap+0x36>
ffffffffc0203f3c:	60e2                	ld	ra,24(sp)
ffffffffc0203f3e:	6442                	ld	s0,16(sp)
ffffffffc0203f40:	64a2                	ld	s1,8(sp)
ffffffffc0203f42:	6902                	ld	s2,0(sp)
ffffffffc0203f44:	6105                	addi	sp,sp,32
ffffffffc0203f46:	8082                	ret
ffffffffc0203f48:	00009697          	auipc	a3,0x9
ffffffffc0203f4c:	15068693          	addi	a3,a3,336 # ffffffffc020d098 <default_pmm_manager+0x8f8>
ffffffffc0203f50:	00008617          	auipc	a2,0x8
ffffffffc0203f54:	d6860613          	addi	a2,a2,-664 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203f58:	0e800593          	li	a1,232
ffffffffc0203f5c:	00009517          	auipc	a0,0x9
ffffffffc0203f60:	08450513          	addi	a0,a0,132 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc0203f64:	d3afc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203f68 <vmm_init>:
ffffffffc0203f68:	7139                	addi	sp,sp,-64
ffffffffc0203f6a:	05800513          	li	a0,88
ffffffffc0203f6e:	fc06                	sd	ra,56(sp)
ffffffffc0203f70:	f822                	sd	s0,48(sp)
ffffffffc0203f72:	f426                	sd	s1,40(sp)
ffffffffc0203f74:	f04a                	sd	s2,32(sp)
ffffffffc0203f76:	ec4e                	sd	s3,24(sp)
ffffffffc0203f78:	e852                	sd	s4,16(sp)
ffffffffc0203f7a:	e456                	sd	s5,8(sp)
ffffffffc0203f7c:	812fe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203f80:	2e050963          	beqz	a0,ffffffffc0204272 <vmm_init+0x30a>
ffffffffc0203f84:	e508                	sd	a0,8(a0)
ffffffffc0203f86:	e108                	sd	a0,0(a0)
ffffffffc0203f88:	00053823          	sd	zero,16(a0)
ffffffffc0203f8c:	00053c23          	sd	zero,24(a0)
ffffffffc0203f90:	02052023          	sw	zero,32(a0)
ffffffffc0203f94:	02053423          	sd	zero,40(a0)
ffffffffc0203f98:	02052823          	sw	zero,48(a0)
ffffffffc0203f9c:	84aa                	mv	s1,a0
ffffffffc0203f9e:	4585                	li	a1,1
ffffffffc0203fa0:	03850513          	addi	a0,a0,56
ffffffffc0203fa4:	5b6000ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0203fa8:	03200413          	li	s0,50
ffffffffc0203fac:	a811                	j	ffffffffc0203fc0 <vmm_init+0x58>
ffffffffc0203fae:	e500                	sd	s0,8(a0)
ffffffffc0203fb0:	e91c                	sd	a5,16(a0)
ffffffffc0203fb2:	00052c23          	sw	zero,24(a0)
ffffffffc0203fb6:	146d                	addi	s0,s0,-5
ffffffffc0203fb8:	8526                	mv	a0,s1
ffffffffc0203fba:	ccdff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc0203fbe:	c80d                	beqz	s0,ffffffffc0203ff0 <vmm_init+0x88>
ffffffffc0203fc0:	03000513          	li	a0,48
ffffffffc0203fc4:	fcbfd0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203fc8:	85aa                	mv	a1,a0
ffffffffc0203fca:	00240793          	addi	a5,s0,2
ffffffffc0203fce:	f165                	bnez	a0,ffffffffc0203fae <vmm_init+0x46>
ffffffffc0203fd0:	00009697          	auipc	a3,0x9
ffffffffc0203fd4:	26068693          	addi	a3,a3,608 # ffffffffc020d230 <default_pmm_manager+0xa90>
ffffffffc0203fd8:	00008617          	auipc	a2,0x8
ffffffffc0203fdc:	ce060613          	addi	a2,a2,-800 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0203fe0:	12c00593          	li	a1,300
ffffffffc0203fe4:	00009517          	auipc	a0,0x9
ffffffffc0203fe8:	ffc50513          	addi	a0,a0,-4 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc0203fec:	cb2fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ff0:	03700413          	li	s0,55
ffffffffc0203ff4:	1f900913          	li	s2,505
ffffffffc0203ff8:	a819                	j	ffffffffc020400e <vmm_init+0xa6>
ffffffffc0203ffa:	e500                	sd	s0,8(a0)
ffffffffc0203ffc:	e91c                	sd	a5,16(a0)
ffffffffc0203ffe:	00052c23          	sw	zero,24(a0)
ffffffffc0204002:	0415                	addi	s0,s0,5
ffffffffc0204004:	8526                	mv	a0,s1
ffffffffc0204006:	c81ff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc020400a:	03240a63          	beq	s0,s2,ffffffffc020403e <vmm_init+0xd6>
ffffffffc020400e:	03000513          	li	a0,48
ffffffffc0204012:	f7dfd0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0204016:	85aa                	mv	a1,a0
ffffffffc0204018:	00240793          	addi	a5,s0,2
ffffffffc020401c:	fd79                	bnez	a0,ffffffffc0203ffa <vmm_init+0x92>
ffffffffc020401e:	00009697          	auipc	a3,0x9
ffffffffc0204022:	21268693          	addi	a3,a3,530 # ffffffffc020d230 <default_pmm_manager+0xa90>
ffffffffc0204026:	00008617          	auipc	a2,0x8
ffffffffc020402a:	c9260613          	addi	a2,a2,-878 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020402e:	13300593          	li	a1,307
ffffffffc0204032:	00009517          	auipc	a0,0x9
ffffffffc0204036:	fae50513          	addi	a0,a0,-82 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc020403a:	c64fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020403e:	649c                	ld	a5,8(s1)
ffffffffc0204040:	471d                	li	a4,7
ffffffffc0204042:	1fb00593          	li	a1,507
ffffffffc0204046:	16f48663          	beq	s1,a5,ffffffffc02041b2 <vmm_init+0x24a>
ffffffffc020404a:	fe87b603          	ld	a2,-24(a5) # ffffffffffffefe8 <end+0x3fd686d8>
ffffffffc020404e:	ffe70693          	addi	a3,a4,-2
ffffffffc0204052:	10d61063          	bne	a2,a3,ffffffffc0204152 <vmm_init+0x1ea>
ffffffffc0204056:	ff07b683          	ld	a3,-16(a5)
ffffffffc020405a:	0ed71c63          	bne	a4,a3,ffffffffc0204152 <vmm_init+0x1ea>
ffffffffc020405e:	0715                	addi	a4,a4,5
ffffffffc0204060:	679c                	ld	a5,8(a5)
ffffffffc0204062:	feb712e3          	bne	a4,a1,ffffffffc0204046 <vmm_init+0xde>
ffffffffc0204066:	4a1d                	li	s4,7
ffffffffc0204068:	4415                	li	s0,5
ffffffffc020406a:	1f900a93          	li	s5,505
ffffffffc020406e:	85a2                	mv	a1,s0
ffffffffc0204070:	8526                	mv	a0,s1
ffffffffc0204072:	bd5ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0204076:	892a                	mv	s2,a0
ffffffffc0204078:	16050d63          	beqz	a0,ffffffffc02041f2 <vmm_init+0x28a>
ffffffffc020407c:	00140593          	addi	a1,s0,1
ffffffffc0204080:	8526                	mv	a0,s1
ffffffffc0204082:	bc5ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0204086:	89aa                	mv	s3,a0
ffffffffc0204088:	14050563          	beqz	a0,ffffffffc02041d2 <vmm_init+0x26a>
ffffffffc020408c:	85d2                	mv	a1,s4
ffffffffc020408e:	8526                	mv	a0,s1
ffffffffc0204090:	bb7ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0204094:	16051f63          	bnez	a0,ffffffffc0204212 <vmm_init+0x2aa>
ffffffffc0204098:	00340593          	addi	a1,s0,3
ffffffffc020409c:	8526                	mv	a0,s1
ffffffffc020409e:	ba9ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02040a2:	1a051863          	bnez	a0,ffffffffc0204252 <vmm_init+0x2ea>
ffffffffc02040a6:	00440593          	addi	a1,s0,4
ffffffffc02040aa:	8526                	mv	a0,s1
ffffffffc02040ac:	b9bff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02040b0:	18051163          	bnez	a0,ffffffffc0204232 <vmm_init+0x2ca>
ffffffffc02040b4:	00893783          	ld	a5,8(s2)
ffffffffc02040b8:	0a879d63          	bne	a5,s0,ffffffffc0204172 <vmm_init+0x20a>
ffffffffc02040bc:	01093783          	ld	a5,16(s2)
ffffffffc02040c0:	0b479963          	bne	a5,s4,ffffffffc0204172 <vmm_init+0x20a>
ffffffffc02040c4:	0089b783          	ld	a5,8(s3)
ffffffffc02040c8:	0c879563          	bne	a5,s0,ffffffffc0204192 <vmm_init+0x22a>
ffffffffc02040cc:	0109b783          	ld	a5,16(s3)
ffffffffc02040d0:	0d479163          	bne	a5,s4,ffffffffc0204192 <vmm_init+0x22a>
ffffffffc02040d4:	0415                	addi	s0,s0,5
ffffffffc02040d6:	0a15                	addi	s4,s4,5
ffffffffc02040d8:	f9541be3          	bne	s0,s5,ffffffffc020406e <vmm_init+0x106>
ffffffffc02040dc:	4411                	li	s0,4
ffffffffc02040de:	597d                	li	s2,-1
ffffffffc02040e0:	85a2                	mv	a1,s0
ffffffffc02040e2:	8526                	mv	a0,s1
ffffffffc02040e4:	b63ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02040e8:	0004059b          	sext.w	a1,s0
ffffffffc02040ec:	c90d                	beqz	a0,ffffffffc020411e <vmm_init+0x1b6>
ffffffffc02040ee:	6914                	ld	a3,16(a0)
ffffffffc02040f0:	6510                	ld	a2,8(a0)
ffffffffc02040f2:	00009517          	auipc	a0,0x9
ffffffffc02040f6:	0c650513          	addi	a0,a0,198 # ffffffffc020d1b8 <default_pmm_manager+0xa18>
ffffffffc02040fa:	8acfc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02040fe:	00009697          	auipc	a3,0x9
ffffffffc0204102:	0e268693          	addi	a3,a3,226 # ffffffffc020d1e0 <default_pmm_manager+0xa40>
ffffffffc0204106:	00008617          	auipc	a2,0x8
ffffffffc020410a:	bb260613          	addi	a2,a2,-1102 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020410e:	15900593          	li	a1,345
ffffffffc0204112:	00009517          	auipc	a0,0x9
ffffffffc0204116:	ece50513          	addi	a0,a0,-306 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc020411a:	b84fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020411e:	147d                	addi	s0,s0,-1
ffffffffc0204120:	fd2410e3          	bne	s0,s2,ffffffffc02040e0 <vmm_init+0x178>
ffffffffc0204124:	8526                	mv	a0,s1
ffffffffc0204126:	c31ff0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc020412a:	00009517          	auipc	a0,0x9
ffffffffc020412e:	0ce50513          	addi	a0,a0,206 # ffffffffc020d1f8 <default_pmm_manager+0xa58>
ffffffffc0204132:	874fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0204136:	7442                	ld	s0,48(sp)
ffffffffc0204138:	70e2                	ld	ra,56(sp)
ffffffffc020413a:	74a2                	ld	s1,40(sp)
ffffffffc020413c:	7902                	ld	s2,32(sp)
ffffffffc020413e:	69e2                	ld	s3,24(sp)
ffffffffc0204140:	6a42                	ld	s4,16(sp)
ffffffffc0204142:	6aa2                	ld	s5,8(sp)
ffffffffc0204144:	00009517          	auipc	a0,0x9
ffffffffc0204148:	0d450513          	addi	a0,a0,212 # ffffffffc020d218 <default_pmm_manager+0xa78>
ffffffffc020414c:	6121                	addi	sp,sp,64
ffffffffc020414e:	858fc06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0204152:	00009697          	auipc	a3,0x9
ffffffffc0204156:	f7e68693          	addi	a3,a3,-130 # ffffffffc020d0d0 <default_pmm_manager+0x930>
ffffffffc020415a:	00008617          	auipc	a2,0x8
ffffffffc020415e:	b5e60613          	addi	a2,a2,-1186 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204162:	13d00593          	li	a1,317
ffffffffc0204166:	00009517          	auipc	a0,0x9
ffffffffc020416a:	e7a50513          	addi	a0,a0,-390 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc020416e:	b30fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204172:	00009697          	auipc	a3,0x9
ffffffffc0204176:	fe668693          	addi	a3,a3,-26 # ffffffffc020d158 <default_pmm_manager+0x9b8>
ffffffffc020417a:	00008617          	auipc	a2,0x8
ffffffffc020417e:	b3e60613          	addi	a2,a2,-1218 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204182:	14e00593          	li	a1,334
ffffffffc0204186:	00009517          	auipc	a0,0x9
ffffffffc020418a:	e5a50513          	addi	a0,a0,-422 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc020418e:	b10fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204192:	00009697          	auipc	a3,0x9
ffffffffc0204196:	ff668693          	addi	a3,a3,-10 # ffffffffc020d188 <default_pmm_manager+0x9e8>
ffffffffc020419a:	00008617          	auipc	a2,0x8
ffffffffc020419e:	b1e60613          	addi	a2,a2,-1250 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02041a2:	14f00593          	li	a1,335
ffffffffc02041a6:	00009517          	auipc	a0,0x9
ffffffffc02041aa:	e3a50513          	addi	a0,a0,-454 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc02041ae:	af0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041b2:	00009697          	auipc	a3,0x9
ffffffffc02041b6:	f0668693          	addi	a3,a3,-250 # ffffffffc020d0b8 <default_pmm_manager+0x918>
ffffffffc02041ba:	00008617          	auipc	a2,0x8
ffffffffc02041be:	afe60613          	addi	a2,a2,-1282 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02041c2:	13b00593          	li	a1,315
ffffffffc02041c6:	00009517          	auipc	a0,0x9
ffffffffc02041ca:	e1a50513          	addi	a0,a0,-486 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc02041ce:	ad0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041d2:	00009697          	auipc	a3,0x9
ffffffffc02041d6:	f4668693          	addi	a3,a3,-186 # ffffffffc020d118 <default_pmm_manager+0x978>
ffffffffc02041da:	00008617          	auipc	a2,0x8
ffffffffc02041de:	ade60613          	addi	a2,a2,-1314 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02041e2:	14600593          	li	a1,326
ffffffffc02041e6:	00009517          	auipc	a0,0x9
ffffffffc02041ea:	dfa50513          	addi	a0,a0,-518 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc02041ee:	ab0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041f2:	00009697          	auipc	a3,0x9
ffffffffc02041f6:	f1668693          	addi	a3,a3,-234 # ffffffffc020d108 <default_pmm_manager+0x968>
ffffffffc02041fa:	00008617          	auipc	a2,0x8
ffffffffc02041fe:	abe60613          	addi	a2,a2,-1346 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204202:	14400593          	li	a1,324
ffffffffc0204206:	00009517          	auipc	a0,0x9
ffffffffc020420a:	dda50513          	addi	a0,a0,-550 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc020420e:	a90fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204212:	00009697          	auipc	a3,0x9
ffffffffc0204216:	f1668693          	addi	a3,a3,-234 # ffffffffc020d128 <default_pmm_manager+0x988>
ffffffffc020421a:	00008617          	auipc	a2,0x8
ffffffffc020421e:	a9e60613          	addi	a2,a2,-1378 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204222:	14800593          	li	a1,328
ffffffffc0204226:	00009517          	auipc	a0,0x9
ffffffffc020422a:	dba50513          	addi	a0,a0,-582 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc020422e:	a70fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204232:	00009697          	auipc	a3,0x9
ffffffffc0204236:	f1668693          	addi	a3,a3,-234 # ffffffffc020d148 <default_pmm_manager+0x9a8>
ffffffffc020423a:	00008617          	auipc	a2,0x8
ffffffffc020423e:	a7e60613          	addi	a2,a2,-1410 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204242:	14c00593          	li	a1,332
ffffffffc0204246:	00009517          	auipc	a0,0x9
ffffffffc020424a:	d9a50513          	addi	a0,a0,-614 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc020424e:	a50fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204252:	00009697          	auipc	a3,0x9
ffffffffc0204256:	ee668693          	addi	a3,a3,-282 # ffffffffc020d138 <default_pmm_manager+0x998>
ffffffffc020425a:	00008617          	auipc	a2,0x8
ffffffffc020425e:	a5e60613          	addi	a2,a2,-1442 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204262:	14a00593          	li	a1,330
ffffffffc0204266:	00009517          	auipc	a0,0x9
ffffffffc020426a:	d7a50513          	addi	a0,a0,-646 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc020426e:	a30fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204272:	00009697          	auipc	a3,0x9
ffffffffc0204276:	df668693          	addi	a3,a3,-522 # ffffffffc020d068 <default_pmm_manager+0x8c8>
ffffffffc020427a:	00008617          	auipc	a2,0x8
ffffffffc020427e:	a3e60613          	addi	a2,a2,-1474 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204282:	12400593          	li	a1,292
ffffffffc0204286:	00009517          	auipc	a0,0x9
ffffffffc020428a:	d5a50513          	addi	a0,a0,-678 # ffffffffc020cfe0 <default_pmm_manager+0x840>
ffffffffc020428e:	a10fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204292 <user_mem_check>:
ffffffffc0204292:	7179                	addi	sp,sp,-48
ffffffffc0204294:	f022                	sd	s0,32(sp)
ffffffffc0204296:	f406                	sd	ra,40(sp)
ffffffffc0204298:	ec26                	sd	s1,24(sp)
ffffffffc020429a:	e84a                	sd	s2,16(sp)
ffffffffc020429c:	e44e                	sd	s3,8(sp)
ffffffffc020429e:	e052                	sd	s4,0(sp)
ffffffffc02042a0:	842e                	mv	s0,a1
ffffffffc02042a2:	c135                	beqz	a0,ffffffffc0204306 <user_mem_check+0x74>
ffffffffc02042a4:	002007b7          	lui	a5,0x200
ffffffffc02042a8:	04f5e663          	bltu	a1,a5,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042ac:	00c584b3          	add	s1,a1,a2
ffffffffc02042b0:	0495f263          	bgeu	a1,s1,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042b4:	4785                	li	a5,1
ffffffffc02042b6:	07fe                	slli	a5,a5,0x1f
ffffffffc02042b8:	0297ee63          	bltu	a5,s1,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042bc:	892a                	mv	s2,a0
ffffffffc02042be:	89b6                	mv	s3,a3
ffffffffc02042c0:	6a05                	lui	s4,0x1
ffffffffc02042c2:	a821                	j	ffffffffc02042da <user_mem_check+0x48>
ffffffffc02042c4:	0027f693          	andi	a3,a5,2
ffffffffc02042c8:	9752                	add	a4,a4,s4
ffffffffc02042ca:	8ba1                	andi	a5,a5,8
ffffffffc02042cc:	c685                	beqz	a3,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042ce:	c399                	beqz	a5,ffffffffc02042d4 <user_mem_check+0x42>
ffffffffc02042d0:	02e46263          	bltu	s0,a4,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042d4:	6900                	ld	s0,16(a0)
ffffffffc02042d6:	04947663          	bgeu	s0,s1,ffffffffc0204322 <user_mem_check+0x90>
ffffffffc02042da:	85a2                	mv	a1,s0
ffffffffc02042dc:	854a                	mv	a0,s2
ffffffffc02042de:	969ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02042e2:	c909                	beqz	a0,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042e4:	6518                	ld	a4,8(a0)
ffffffffc02042e6:	00e46763          	bltu	s0,a4,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042ea:	4d1c                	lw	a5,24(a0)
ffffffffc02042ec:	fc099ce3          	bnez	s3,ffffffffc02042c4 <user_mem_check+0x32>
ffffffffc02042f0:	8b85                	andi	a5,a5,1
ffffffffc02042f2:	f3ed                	bnez	a5,ffffffffc02042d4 <user_mem_check+0x42>
ffffffffc02042f4:	4501                	li	a0,0
ffffffffc02042f6:	70a2                	ld	ra,40(sp)
ffffffffc02042f8:	7402                	ld	s0,32(sp)
ffffffffc02042fa:	64e2                	ld	s1,24(sp)
ffffffffc02042fc:	6942                	ld	s2,16(sp)
ffffffffc02042fe:	69a2                	ld	s3,8(sp)
ffffffffc0204300:	6a02                	ld	s4,0(sp)
ffffffffc0204302:	6145                	addi	sp,sp,48
ffffffffc0204304:	8082                	ret
ffffffffc0204306:	c02007b7          	lui	a5,0xc0200
ffffffffc020430a:	4501                	li	a0,0
ffffffffc020430c:	fef5e5e3          	bltu	a1,a5,ffffffffc02042f6 <user_mem_check+0x64>
ffffffffc0204310:	962e                	add	a2,a2,a1
ffffffffc0204312:	fec5f2e3          	bgeu	a1,a2,ffffffffc02042f6 <user_mem_check+0x64>
ffffffffc0204316:	c8000537          	lui	a0,0xc8000
ffffffffc020431a:	0505                	addi	a0,a0,1
ffffffffc020431c:	00a63533          	sltu	a0,a2,a0
ffffffffc0204320:	bfd9                	j	ffffffffc02042f6 <user_mem_check+0x64>
ffffffffc0204322:	4505                	li	a0,1
ffffffffc0204324:	bfc9                	j	ffffffffc02042f6 <user_mem_check+0x64>

ffffffffc0204326 <copy_from_user>:
ffffffffc0204326:	1101                	addi	sp,sp,-32
ffffffffc0204328:	e822                	sd	s0,16(sp)
ffffffffc020432a:	e426                	sd	s1,8(sp)
ffffffffc020432c:	8432                	mv	s0,a2
ffffffffc020432e:	84b6                	mv	s1,a3
ffffffffc0204330:	e04a                	sd	s2,0(sp)
ffffffffc0204332:	86ba                	mv	a3,a4
ffffffffc0204334:	892e                	mv	s2,a1
ffffffffc0204336:	8626                	mv	a2,s1
ffffffffc0204338:	85a2                	mv	a1,s0
ffffffffc020433a:	ec06                	sd	ra,24(sp)
ffffffffc020433c:	f57ff0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc0204340:	c519                	beqz	a0,ffffffffc020434e <copy_from_user+0x28>
ffffffffc0204342:	8626                	mv	a2,s1
ffffffffc0204344:	85a2                	mv	a1,s0
ffffffffc0204346:	854a                	mv	a0,s2
ffffffffc0204348:	4de070ef          	jal	ra,ffffffffc020b826 <memcpy>
ffffffffc020434c:	4505                	li	a0,1
ffffffffc020434e:	60e2                	ld	ra,24(sp)
ffffffffc0204350:	6442                	ld	s0,16(sp)
ffffffffc0204352:	64a2                	ld	s1,8(sp)
ffffffffc0204354:	6902                	ld	s2,0(sp)
ffffffffc0204356:	6105                	addi	sp,sp,32
ffffffffc0204358:	8082                	ret

ffffffffc020435a <copy_to_user>:
ffffffffc020435a:	1101                	addi	sp,sp,-32
ffffffffc020435c:	e822                	sd	s0,16(sp)
ffffffffc020435e:	8436                	mv	s0,a3
ffffffffc0204360:	e04a                	sd	s2,0(sp)
ffffffffc0204362:	4685                	li	a3,1
ffffffffc0204364:	8932                	mv	s2,a2
ffffffffc0204366:	8622                	mv	a2,s0
ffffffffc0204368:	e426                	sd	s1,8(sp)
ffffffffc020436a:	ec06                	sd	ra,24(sp)
ffffffffc020436c:	84ae                	mv	s1,a1
ffffffffc020436e:	f25ff0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc0204372:	c519                	beqz	a0,ffffffffc0204380 <copy_to_user+0x26>
ffffffffc0204374:	8622                	mv	a2,s0
ffffffffc0204376:	85ca                	mv	a1,s2
ffffffffc0204378:	8526                	mv	a0,s1
ffffffffc020437a:	4ac070ef          	jal	ra,ffffffffc020b826 <memcpy>
ffffffffc020437e:	4505                	li	a0,1
ffffffffc0204380:	60e2                	ld	ra,24(sp)
ffffffffc0204382:	6442                	ld	s0,16(sp)
ffffffffc0204384:	64a2                	ld	s1,8(sp)
ffffffffc0204386:	6902                	ld	s2,0(sp)
ffffffffc0204388:	6105                	addi	sp,sp,32
ffffffffc020438a:	8082                	ret

ffffffffc020438c <copy_string>:
ffffffffc020438c:	7139                	addi	sp,sp,-64
ffffffffc020438e:	ec4e                	sd	s3,24(sp)
ffffffffc0204390:	6985                	lui	s3,0x1
ffffffffc0204392:	99b2                	add	s3,s3,a2
ffffffffc0204394:	77fd                	lui	a5,0xfffff
ffffffffc0204396:	00f9f9b3          	and	s3,s3,a5
ffffffffc020439a:	f426                	sd	s1,40(sp)
ffffffffc020439c:	f04a                	sd	s2,32(sp)
ffffffffc020439e:	e852                	sd	s4,16(sp)
ffffffffc02043a0:	e456                	sd	s5,8(sp)
ffffffffc02043a2:	fc06                	sd	ra,56(sp)
ffffffffc02043a4:	f822                	sd	s0,48(sp)
ffffffffc02043a6:	84b2                	mv	s1,a2
ffffffffc02043a8:	8aaa                	mv	s5,a0
ffffffffc02043aa:	8a2e                	mv	s4,a1
ffffffffc02043ac:	8936                	mv	s2,a3
ffffffffc02043ae:	40c989b3          	sub	s3,s3,a2
ffffffffc02043b2:	a015                	j	ffffffffc02043d6 <copy_string+0x4a>
ffffffffc02043b4:	398070ef          	jal	ra,ffffffffc020b74c <strnlen>
ffffffffc02043b8:	87aa                	mv	a5,a0
ffffffffc02043ba:	85a6                	mv	a1,s1
ffffffffc02043bc:	8552                	mv	a0,s4
ffffffffc02043be:	8622                	mv	a2,s0
ffffffffc02043c0:	0487e363          	bltu	a5,s0,ffffffffc0204406 <copy_string+0x7a>
ffffffffc02043c4:	0329f763          	bgeu	s3,s2,ffffffffc02043f2 <copy_string+0x66>
ffffffffc02043c8:	45e070ef          	jal	ra,ffffffffc020b826 <memcpy>
ffffffffc02043cc:	9a22                	add	s4,s4,s0
ffffffffc02043ce:	94a2                	add	s1,s1,s0
ffffffffc02043d0:	40890933          	sub	s2,s2,s0
ffffffffc02043d4:	6985                	lui	s3,0x1
ffffffffc02043d6:	4681                	li	a3,0
ffffffffc02043d8:	85a6                	mv	a1,s1
ffffffffc02043da:	8556                	mv	a0,s5
ffffffffc02043dc:	844a                	mv	s0,s2
ffffffffc02043de:	0129f363          	bgeu	s3,s2,ffffffffc02043e4 <copy_string+0x58>
ffffffffc02043e2:	844e                	mv	s0,s3
ffffffffc02043e4:	8622                	mv	a2,s0
ffffffffc02043e6:	eadff0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc02043ea:	87aa                	mv	a5,a0
ffffffffc02043ec:	85a2                	mv	a1,s0
ffffffffc02043ee:	8526                	mv	a0,s1
ffffffffc02043f0:	f3f1                	bnez	a5,ffffffffc02043b4 <copy_string+0x28>
ffffffffc02043f2:	4501                	li	a0,0
ffffffffc02043f4:	70e2                	ld	ra,56(sp)
ffffffffc02043f6:	7442                	ld	s0,48(sp)
ffffffffc02043f8:	74a2                	ld	s1,40(sp)
ffffffffc02043fa:	7902                	ld	s2,32(sp)
ffffffffc02043fc:	69e2                	ld	s3,24(sp)
ffffffffc02043fe:	6a42                	ld	s4,16(sp)
ffffffffc0204400:	6aa2                	ld	s5,8(sp)
ffffffffc0204402:	6121                	addi	sp,sp,64
ffffffffc0204404:	8082                	ret
ffffffffc0204406:	00178613          	addi	a2,a5,1 # fffffffffffff001 <end+0x3fd686f1>
ffffffffc020440a:	41c070ef          	jal	ra,ffffffffc020b826 <memcpy>
ffffffffc020440e:	4505                	li	a0,1
ffffffffc0204410:	b7d5                	j	ffffffffc02043f4 <copy_string+0x68>

ffffffffc0204412 <__down.constprop.0>:
ffffffffc0204412:	715d                	addi	sp,sp,-80
ffffffffc0204414:	e0a2                	sd	s0,64(sp)
ffffffffc0204416:	e486                	sd	ra,72(sp)
ffffffffc0204418:	fc26                	sd	s1,56(sp)
ffffffffc020441a:	842a                	mv	s0,a0
ffffffffc020441c:	100027f3          	csrr	a5,sstatus
ffffffffc0204420:	8b89                	andi	a5,a5,2
ffffffffc0204422:	ebb1                	bnez	a5,ffffffffc0204476 <__down.constprop.0+0x64>
ffffffffc0204424:	411c                	lw	a5,0(a0)
ffffffffc0204426:	00f05a63          	blez	a5,ffffffffc020443a <__down.constprop.0+0x28>
ffffffffc020442a:	37fd                	addiw	a5,a5,-1
ffffffffc020442c:	c11c                	sw	a5,0(a0)
ffffffffc020442e:	4501                	li	a0,0
ffffffffc0204430:	60a6                	ld	ra,72(sp)
ffffffffc0204432:	6406                	ld	s0,64(sp)
ffffffffc0204434:	74e2                	ld	s1,56(sp)
ffffffffc0204436:	6161                	addi	sp,sp,80
ffffffffc0204438:	8082                	ret
ffffffffc020443a:	00850413          	addi	s0,a0,8 # ffffffffc8000008 <end+0x7d696f8>
ffffffffc020443e:	0024                	addi	s1,sp,8
ffffffffc0204440:	10000613          	li	a2,256
ffffffffc0204444:	85a6                	mv	a1,s1
ffffffffc0204446:	8522                	mv	a0,s0
ffffffffc0204448:	2d8000ef          	jal	ra,ffffffffc0204720 <wait_current_set>
ffffffffc020444c:	21c030ef          	jal	ra,ffffffffc0207668 <schedule>
ffffffffc0204450:	100027f3          	csrr	a5,sstatus
ffffffffc0204454:	8b89                	andi	a5,a5,2
ffffffffc0204456:	efb9                	bnez	a5,ffffffffc02044b4 <__down.constprop.0+0xa2>
ffffffffc0204458:	8526                	mv	a0,s1
ffffffffc020445a:	19c000ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc020445e:	e531                	bnez	a0,ffffffffc02044aa <__down.constprop.0+0x98>
ffffffffc0204460:	4542                	lw	a0,16(sp)
ffffffffc0204462:	10000793          	li	a5,256
ffffffffc0204466:	fcf515e3          	bne	a0,a5,ffffffffc0204430 <__down.constprop.0+0x1e>
ffffffffc020446a:	60a6                	ld	ra,72(sp)
ffffffffc020446c:	6406                	ld	s0,64(sp)
ffffffffc020446e:	74e2                	ld	s1,56(sp)
ffffffffc0204470:	4501                	li	a0,0
ffffffffc0204472:	6161                	addi	sp,sp,80
ffffffffc0204474:	8082                	ret
ffffffffc0204476:	ffcfc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020447a:	401c                	lw	a5,0(s0)
ffffffffc020447c:	00f05c63          	blez	a5,ffffffffc0204494 <__down.constprop.0+0x82>
ffffffffc0204480:	37fd                	addiw	a5,a5,-1
ffffffffc0204482:	c01c                	sw	a5,0(s0)
ffffffffc0204484:	fe8fc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0204488:	60a6                	ld	ra,72(sp)
ffffffffc020448a:	6406                	ld	s0,64(sp)
ffffffffc020448c:	74e2                	ld	s1,56(sp)
ffffffffc020448e:	4501                	li	a0,0
ffffffffc0204490:	6161                	addi	sp,sp,80
ffffffffc0204492:	8082                	ret
ffffffffc0204494:	0421                	addi	s0,s0,8
ffffffffc0204496:	0024                	addi	s1,sp,8
ffffffffc0204498:	10000613          	li	a2,256
ffffffffc020449c:	85a6                	mv	a1,s1
ffffffffc020449e:	8522                	mv	a0,s0
ffffffffc02044a0:	280000ef          	jal	ra,ffffffffc0204720 <wait_current_set>
ffffffffc02044a4:	fc8fc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02044a8:	b755                	j	ffffffffc020444c <__down.constprop.0+0x3a>
ffffffffc02044aa:	85a6                	mv	a1,s1
ffffffffc02044ac:	8522                	mv	a0,s0
ffffffffc02044ae:	0ee000ef          	jal	ra,ffffffffc020459c <wait_queue_del>
ffffffffc02044b2:	b77d                	j	ffffffffc0204460 <__down.constprop.0+0x4e>
ffffffffc02044b4:	fbefc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02044b8:	8526                	mv	a0,s1
ffffffffc02044ba:	13c000ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc02044be:	e501                	bnez	a0,ffffffffc02044c6 <__down.constprop.0+0xb4>
ffffffffc02044c0:	facfc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02044c4:	bf71                	j	ffffffffc0204460 <__down.constprop.0+0x4e>
ffffffffc02044c6:	85a6                	mv	a1,s1
ffffffffc02044c8:	8522                	mv	a0,s0
ffffffffc02044ca:	0d2000ef          	jal	ra,ffffffffc020459c <wait_queue_del>
ffffffffc02044ce:	bfcd                	j	ffffffffc02044c0 <__down.constprop.0+0xae>

ffffffffc02044d0 <__up.constprop.0>:
ffffffffc02044d0:	1101                	addi	sp,sp,-32
ffffffffc02044d2:	e822                	sd	s0,16(sp)
ffffffffc02044d4:	ec06                	sd	ra,24(sp)
ffffffffc02044d6:	e426                	sd	s1,8(sp)
ffffffffc02044d8:	e04a                	sd	s2,0(sp)
ffffffffc02044da:	842a                	mv	s0,a0
ffffffffc02044dc:	100027f3          	csrr	a5,sstatus
ffffffffc02044e0:	8b89                	andi	a5,a5,2
ffffffffc02044e2:	4901                	li	s2,0
ffffffffc02044e4:	eba1                	bnez	a5,ffffffffc0204534 <__up.constprop.0+0x64>
ffffffffc02044e6:	00840493          	addi	s1,s0,8
ffffffffc02044ea:	8526                	mv	a0,s1
ffffffffc02044ec:	0ee000ef          	jal	ra,ffffffffc02045da <wait_queue_first>
ffffffffc02044f0:	85aa                	mv	a1,a0
ffffffffc02044f2:	cd0d                	beqz	a0,ffffffffc020452c <__up.constprop.0+0x5c>
ffffffffc02044f4:	6118                	ld	a4,0(a0)
ffffffffc02044f6:	10000793          	li	a5,256
ffffffffc02044fa:	0ec72703          	lw	a4,236(a4)
ffffffffc02044fe:	02f71f63          	bne	a4,a5,ffffffffc020453c <__up.constprop.0+0x6c>
ffffffffc0204502:	4685                	li	a3,1
ffffffffc0204504:	10000613          	li	a2,256
ffffffffc0204508:	8526                	mv	a0,s1
ffffffffc020450a:	0fa000ef          	jal	ra,ffffffffc0204604 <wakeup_wait>
ffffffffc020450e:	00091863          	bnez	s2,ffffffffc020451e <__up.constprop.0+0x4e>
ffffffffc0204512:	60e2                	ld	ra,24(sp)
ffffffffc0204514:	6442                	ld	s0,16(sp)
ffffffffc0204516:	64a2                	ld	s1,8(sp)
ffffffffc0204518:	6902                	ld	s2,0(sp)
ffffffffc020451a:	6105                	addi	sp,sp,32
ffffffffc020451c:	8082                	ret
ffffffffc020451e:	6442                	ld	s0,16(sp)
ffffffffc0204520:	60e2                	ld	ra,24(sp)
ffffffffc0204522:	64a2                	ld	s1,8(sp)
ffffffffc0204524:	6902                	ld	s2,0(sp)
ffffffffc0204526:	6105                	addi	sp,sp,32
ffffffffc0204528:	f44fc06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc020452c:	401c                	lw	a5,0(s0)
ffffffffc020452e:	2785                	addiw	a5,a5,1
ffffffffc0204530:	c01c                	sw	a5,0(s0)
ffffffffc0204532:	bff1                	j	ffffffffc020450e <__up.constprop.0+0x3e>
ffffffffc0204534:	f3efc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0204538:	4905                	li	s2,1
ffffffffc020453a:	b775                	j	ffffffffc02044e6 <__up.constprop.0+0x16>
ffffffffc020453c:	00009697          	auipc	a3,0x9
ffffffffc0204540:	d0468693          	addi	a3,a3,-764 # ffffffffc020d240 <default_pmm_manager+0xaa0>
ffffffffc0204544:	00007617          	auipc	a2,0x7
ffffffffc0204548:	77460613          	addi	a2,a2,1908 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020454c:	45e5                	li	a1,25
ffffffffc020454e:	00009517          	auipc	a0,0x9
ffffffffc0204552:	d1a50513          	addi	a0,a0,-742 # ffffffffc020d268 <default_pmm_manager+0xac8>
ffffffffc0204556:	f49fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020455a <sem_init>:
ffffffffc020455a:	c10c                	sw	a1,0(a0)
ffffffffc020455c:	0521                	addi	a0,a0,8
ffffffffc020455e:	a825                	j	ffffffffc0204596 <wait_queue_init>

ffffffffc0204560 <up>:
ffffffffc0204560:	f71ff06f          	j	ffffffffc02044d0 <__up.constprop.0>

ffffffffc0204564 <down>:
ffffffffc0204564:	1141                	addi	sp,sp,-16
ffffffffc0204566:	e406                	sd	ra,8(sp)
ffffffffc0204568:	eabff0ef          	jal	ra,ffffffffc0204412 <__down.constprop.0>
ffffffffc020456c:	2501                	sext.w	a0,a0
ffffffffc020456e:	e501                	bnez	a0,ffffffffc0204576 <down+0x12>
ffffffffc0204570:	60a2                	ld	ra,8(sp)
ffffffffc0204572:	0141                	addi	sp,sp,16
ffffffffc0204574:	8082                	ret
ffffffffc0204576:	00009697          	auipc	a3,0x9
ffffffffc020457a:	d0268693          	addi	a3,a3,-766 # ffffffffc020d278 <default_pmm_manager+0xad8>
ffffffffc020457e:	00007617          	auipc	a2,0x7
ffffffffc0204582:	73a60613          	addi	a2,a2,1850 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204586:	04000593          	li	a1,64
ffffffffc020458a:	00009517          	auipc	a0,0x9
ffffffffc020458e:	cde50513          	addi	a0,a0,-802 # ffffffffc020d268 <default_pmm_manager+0xac8>
ffffffffc0204592:	f0dfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204596 <wait_queue_init>:
ffffffffc0204596:	e508                	sd	a0,8(a0)
ffffffffc0204598:	e108                	sd	a0,0(a0)
ffffffffc020459a:	8082                	ret

ffffffffc020459c <wait_queue_del>:
ffffffffc020459c:	7198                	ld	a4,32(a1)
ffffffffc020459e:	01858793          	addi	a5,a1,24
ffffffffc02045a2:	00e78b63          	beq	a5,a4,ffffffffc02045b8 <wait_queue_del+0x1c>
ffffffffc02045a6:	6994                	ld	a3,16(a1)
ffffffffc02045a8:	00a69863          	bne	a3,a0,ffffffffc02045b8 <wait_queue_del+0x1c>
ffffffffc02045ac:	6d94                	ld	a3,24(a1)
ffffffffc02045ae:	e698                	sd	a4,8(a3)
ffffffffc02045b0:	e314                	sd	a3,0(a4)
ffffffffc02045b2:	f19c                	sd	a5,32(a1)
ffffffffc02045b4:	ed9c                	sd	a5,24(a1)
ffffffffc02045b6:	8082                	ret
ffffffffc02045b8:	1141                	addi	sp,sp,-16
ffffffffc02045ba:	00009697          	auipc	a3,0x9
ffffffffc02045be:	d1e68693          	addi	a3,a3,-738 # ffffffffc020d2d8 <default_pmm_manager+0xb38>
ffffffffc02045c2:	00007617          	auipc	a2,0x7
ffffffffc02045c6:	6f660613          	addi	a2,a2,1782 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02045ca:	45f1                	li	a1,28
ffffffffc02045cc:	00009517          	auipc	a0,0x9
ffffffffc02045d0:	cf450513          	addi	a0,a0,-780 # ffffffffc020d2c0 <default_pmm_manager+0xb20>
ffffffffc02045d4:	e406                	sd	ra,8(sp)
ffffffffc02045d6:	ec9fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02045da <wait_queue_first>:
ffffffffc02045da:	651c                	ld	a5,8(a0)
ffffffffc02045dc:	00f50563          	beq	a0,a5,ffffffffc02045e6 <wait_queue_first+0xc>
ffffffffc02045e0:	fe878513          	addi	a0,a5,-24
ffffffffc02045e4:	8082                	ret
ffffffffc02045e6:	4501                	li	a0,0
ffffffffc02045e8:	8082                	ret

ffffffffc02045ea <wait_queue_empty>:
ffffffffc02045ea:	651c                	ld	a5,8(a0)
ffffffffc02045ec:	40a78533          	sub	a0,a5,a0
ffffffffc02045f0:	00153513          	seqz	a0,a0
ffffffffc02045f4:	8082                	ret

ffffffffc02045f6 <wait_in_queue>:
ffffffffc02045f6:	711c                	ld	a5,32(a0)
ffffffffc02045f8:	0561                	addi	a0,a0,24
ffffffffc02045fa:	40a78533          	sub	a0,a5,a0
ffffffffc02045fe:	00a03533          	snez	a0,a0
ffffffffc0204602:	8082                	ret

ffffffffc0204604 <wakeup_wait>:
ffffffffc0204604:	e689                	bnez	a3,ffffffffc020460e <wakeup_wait+0xa>
ffffffffc0204606:	6188                	ld	a0,0(a1)
ffffffffc0204608:	c590                	sw	a2,8(a1)
ffffffffc020460a:	7ad0206f          	j	ffffffffc02075b6 <wakeup_proc>
ffffffffc020460e:	7198                	ld	a4,32(a1)
ffffffffc0204610:	01858793          	addi	a5,a1,24
ffffffffc0204614:	00e78e63          	beq	a5,a4,ffffffffc0204630 <wakeup_wait+0x2c>
ffffffffc0204618:	6994                	ld	a3,16(a1)
ffffffffc020461a:	00d51b63          	bne	a0,a3,ffffffffc0204630 <wakeup_wait+0x2c>
ffffffffc020461e:	6d94                	ld	a3,24(a1)
ffffffffc0204620:	6188                	ld	a0,0(a1)
ffffffffc0204622:	e698                	sd	a4,8(a3)
ffffffffc0204624:	e314                	sd	a3,0(a4)
ffffffffc0204626:	f19c                	sd	a5,32(a1)
ffffffffc0204628:	ed9c                	sd	a5,24(a1)
ffffffffc020462a:	c590                	sw	a2,8(a1)
ffffffffc020462c:	78b0206f          	j	ffffffffc02075b6 <wakeup_proc>
ffffffffc0204630:	1141                	addi	sp,sp,-16
ffffffffc0204632:	00009697          	auipc	a3,0x9
ffffffffc0204636:	ca668693          	addi	a3,a3,-858 # ffffffffc020d2d8 <default_pmm_manager+0xb38>
ffffffffc020463a:	00007617          	auipc	a2,0x7
ffffffffc020463e:	67e60613          	addi	a2,a2,1662 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204642:	45f1                	li	a1,28
ffffffffc0204644:	00009517          	auipc	a0,0x9
ffffffffc0204648:	c7c50513          	addi	a0,a0,-900 # ffffffffc020d2c0 <default_pmm_manager+0xb20>
ffffffffc020464c:	e406                	sd	ra,8(sp)
ffffffffc020464e:	e51fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204652 <wakeup_queue>:
ffffffffc0204652:	651c                	ld	a5,8(a0)
ffffffffc0204654:	0ca78563          	beq	a5,a0,ffffffffc020471e <wakeup_queue+0xcc>
ffffffffc0204658:	1101                	addi	sp,sp,-32
ffffffffc020465a:	e822                	sd	s0,16(sp)
ffffffffc020465c:	e426                	sd	s1,8(sp)
ffffffffc020465e:	e04a                	sd	s2,0(sp)
ffffffffc0204660:	ec06                	sd	ra,24(sp)
ffffffffc0204662:	84aa                	mv	s1,a0
ffffffffc0204664:	892e                	mv	s2,a1
ffffffffc0204666:	fe878413          	addi	s0,a5,-24
ffffffffc020466a:	e23d                	bnez	a2,ffffffffc02046d0 <wakeup_queue+0x7e>
ffffffffc020466c:	6008                	ld	a0,0(s0)
ffffffffc020466e:	01242423          	sw	s2,8(s0)
ffffffffc0204672:	745020ef          	jal	ra,ffffffffc02075b6 <wakeup_proc>
ffffffffc0204676:	701c                	ld	a5,32(s0)
ffffffffc0204678:	01840713          	addi	a4,s0,24
ffffffffc020467c:	02e78463          	beq	a5,a4,ffffffffc02046a4 <wakeup_queue+0x52>
ffffffffc0204680:	6818                	ld	a4,16(s0)
ffffffffc0204682:	02e49163          	bne	s1,a4,ffffffffc02046a4 <wakeup_queue+0x52>
ffffffffc0204686:	02f48f63          	beq	s1,a5,ffffffffc02046c4 <wakeup_queue+0x72>
ffffffffc020468a:	fe87b503          	ld	a0,-24(a5)
ffffffffc020468e:	ff27a823          	sw	s2,-16(a5)
ffffffffc0204692:	fe878413          	addi	s0,a5,-24
ffffffffc0204696:	721020ef          	jal	ra,ffffffffc02075b6 <wakeup_proc>
ffffffffc020469a:	701c                	ld	a5,32(s0)
ffffffffc020469c:	01840713          	addi	a4,s0,24
ffffffffc02046a0:	fee790e3          	bne	a5,a4,ffffffffc0204680 <wakeup_queue+0x2e>
ffffffffc02046a4:	00009697          	auipc	a3,0x9
ffffffffc02046a8:	c3468693          	addi	a3,a3,-972 # ffffffffc020d2d8 <default_pmm_manager+0xb38>
ffffffffc02046ac:	00007617          	auipc	a2,0x7
ffffffffc02046b0:	60c60613          	addi	a2,a2,1548 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02046b4:	02200593          	li	a1,34
ffffffffc02046b8:	00009517          	auipc	a0,0x9
ffffffffc02046bc:	c0850513          	addi	a0,a0,-1016 # ffffffffc020d2c0 <default_pmm_manager+0xb20>
ffffffffc02046c0:	ddffb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02046c4:	60e2                	ld	ra,24(sp)
ffffffffc02046c6:	6442                	ld	s0,16(sp)
ffffffffc02046c8:	64a2                	ld	s1,8(sp)
ffffffffc02046ca:	6902                	ld	s2,0(sp)
ffffffffc02046cc:	6105                	addi	sp,sp,32
ffffffffc02046ce:	8082                	ret
ffffffffc02046d0:	6798                	ld	a4,8(a5)
ffffffffc02046d2:	02f70763          	beq	a4,a5,ffffffffc0204700 <wakeup_queue+0xae>
ffffffffc02046d6:	6814                	ld	a3,16(s0)
ffffffffc02046d8:	02d49463          	bne	s1,a3,ffffffffc0204700 <wakeup_queue+0xae>
ffffffffc02046dc:	6c14                	ld	a3,24(s0)
ffffffffc02046de:	6008                	ld	a0,0(s0)
ffffffffc02046e0:	e698                	sd	a4,8(a3)
ffffffffc02046e2:	e314                	sd	a3,0(a4)
ffffffffc02046e4:	f01c                	sd	a5,32(s0)
ffffffffc02046e6:	ec1c                	sd	a5,24(s0)
ffffffffc02046e8:	01242423          	sw	s2,8(s0)
ffffffffc02046ec:	6cb020ef          	jal	ra,ffffffffc02075b6 <wakeup_proc>
ffffffffc02046f0:	6480                	ld	s0,8(s1)
ffffffffc02046f2:	fc8489e3          	beq	s1,s0,ffffffffc02046c4 <wakeup_queue+0x72>
ffffffffc02046f6:	6418                	ld	a4,8(s0)
ffffffffc02046f8:	87a2                	mv	a5,s0
ffffffffc02046fa:	1421                	addi	s0,s0,-24
ffffffffc02046fc:	fce79de3          	bne	a5,a4,ffffffffc02046d6 <wakeup_queue+0x84>
ffffffffc0204700:	00009697          	auipc	a3,0x9
ffffffffc0204704:	bd868693          	addi	a3,a3,-1064 # ffffffffc020d2d8 <default_pmm_manager+0xb38>
ffffffffc0204708:	00007617          	auipc	a2,0x7
ffffffffc020470c:	5b060613          	addi	a2,a2,1456 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204710:	45f1                	li	a1,28
ffffffffc0204712:	00009517          	auipc	a0,0x9
ffffffffc0204716:	bae50513          	addi	a0,a0,-1106 # ffffffffc020d2c0 <default_pmm_manager+0xb20>
ffffffffc020471a:	d85fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020471e:	8082                	ret

ffffffffc0204720 <wait_current_set>:
ffffffffc0204720:	00092797          	auipc	a5,0x92
ffffffffc0204724:	1a07b783          	ld	a5,416(a5) # ffffffffc02968c0 <current>
ffffffffc0204728:	c39d                	beqz	a5,ffffffffc020474e <wait_current_set+0x2e>
ffffffffc020472a:	01858713          	addi	a4,a1,24
ffffffffc020472e:	800006b7          	lui	a3,0x80000
ffffffffc0204732:	ed98                	sd	a4,24(a1)
ffffffffc0204734:	e19c                	sd	a5,0(a1)
ffffffffc0204736:	c594                	sw	a3,8(a1)
ffffffffc0204738:	4685                	li	a3,1
ffffffffc020473a:	c394                	sw	a3,0(a5)
ffffffffc020473c:	0ec7a623          	sw	a2,236(a5)
ffffffffc0204740:	611c                	ld	a5,0(a0)
ffffffffc0204742:	e988                	sd	a0,16(a1)
ffffffffc0204744:	e118                	sd	a4,0(a0)
ffffffffc0204746:	e798                	sd	a4,8(a5)
ffffffffc0204748:	f188                	sd	a0,32(a1)
ffffffffc020474a:	ed9c                	sd	a5,24(a1)
ffffffffc020474c:	8082                	ret
ffffffffc020474e:	1141                	addi	sp,sp,-16
ffffffffc0204750:	00009697          	auipc	a3,0x9
ffffffffc0204754:	bc868693          	addi	a3,a3,-1080 # ffffffffc020d318 <default_pmm_manager+0xb78>
ffffffffc0204758:	00007617          	auipc	a2,0x7
ffffffffc020475c:	56060613          	addi	a2,a2,1376 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204760:	07400593          	li	a1,116
ffffffffc0204764:	00009517          	auipc	a0,0x9
ffffffffc0204768:	b5c50513          	addi	a0,a0,-1188 # ffffffffc020d2c0 <default_pmm_manager+0xb20>
ffffffffc020476c:	e406                	sd	ra,8(sp)
ffffffffc020476e:	d31fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204772 <get_fd_array.part.0>:
ffffffffc0204772:	1141                	addi	sp,sp,-16
ffffffffc0204774:	00009697          	auipc	a3,0x9
ffffffffc0204778:	bb468693          	addi	a3,a3,-1100 # ffffffffc020d328 <default_pmm_manager+0xb88>
ffffffffc020477c:	00007617          	auipc	a2,0x7
ffffffffc0204780:	53c60613          	addi	a2,a2,1340 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204784:	45d1                	li	a1,20
ffffffffc0204786:	00009517          	auipc	a0,0x9
ffffffffc020478a:	bd250513          	addi	a0,a0,-1070 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc020478e:	e406                	sd	ra,8(sp)
ffffffffc0204790:	d0ffb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204794 <fd_array_alloc>:
ffffffffc0204794:	00092797          	auipc	a5,0x92
ffffffffc0204798:	12c7b783          	ld	a5,300(a5) # ffffffffc02968c0 <current>
ffffffffc020479c:	1487b783          	ld	a5,328(a5)
ffffffffc02047a0:	1141                	addi	sp,sp,-16
ffffffffc02047a2:	e406                	sd	ra,8(sp)
ffffffffc02047a4:	c3a5                	beqz	a5,ffffffffc0204804 <fd_array_alloc+0x70>
ffffffffc02047a6:	4b98                	lw	a4,16(a5)
ffffffffc02047a8:	04e05e63          	blez	a4,ffffffffc0204804 <fd_array_alloc+0x70>
ffffffffc02047ac:	775d                	lui	a4,0xffff7
ffffffffc02047ae:	ad970713          	addi	a4,a4,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc02047b2:	679c                	ld	a5,8(a5)
ffffffffc02047b4:	02e50863          	beq	a0,a4,ffffffffc02047e4 <fd_array_alloc+0x50>
ffffffffc02047b8:	04700713          	li	a4,71
ffffffffc02047bc:	04a76263          	bltu	a4,a0,ffffffffc0204800 <fd_array_alloc+0x6c>
ffffffffc02047c0:	00351713          	slli	a4,a0,0x3
ffffffffc02047c4:	40a70533          	sub	a0,a4,a0
ffffffffc02047c8:	050e                	slli	a0,a0,0x3
ffffffffc02047ca:	97aa                	add	a5,a5,a0
ffffffffc02047cc:	4398                	lw	a4,0(a5)
ffffffffc02047ce:	e71d                	bnez	a4,ffffffffc02047fc <fd_array_alloc+0x68>
ffffffffc02047d0:	5b88                	lw	a0,48(a5)
ffffffffc02047d2:	e91d                	bnez	a0,ffffffffc0204808 <fd_array_alloc+0x74>
ffffffffc02047d4:	4705                	li	a4,1
ffffffffc02047d6:	c398                	sw	a4,0(a5)
ffffffffc02047d8:	0207b423          	sd	zero,40(a5)
ffffffffc02047dc:	e19c                	sd	a5,0(a1)
ffffffffc02047de:	60a2                	ld	ra,8(sp)
ffffffffc02047e0:	0141                	addi	sp,sp,16
ffffffffc02047e2:	8082                	ret
ffffffffc02047e4:	6685                	lui	a3,0x1
ffffffffc02047e6:	fc068693          	addi	a3,a3,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc02047ea:	96be                	add	a3,a3,a5
ffffffffc02047ec:	4398                	lw	a4,0(a5)
ffffffffc02047ee:	d36d                	beqz	a4,ffffffffc02047d0 <fd_array_alloc+0x3c>
ffffffffc02047f0:	03878793          	addi	a5,a5,56
ffffffffc02047f4:	fef69ce3          	bne	a3,a5,ffffffffc02047ec <fd_array_alloc+0x58>
ffffffffc02047f8:	5529                	li	a0,-22
ffffffffc02047fa:	b7d5                	j	ffffffffc02047de <fd_array_alloc+0x4a>
ffffffffc02047fc:	5545                	li	a0,-15
ffffffffc02047fe:	b7c5                	j	ffffffffc02047de <fd_array_alloc+0x4a>
ffffffffc0204800:	5575                	li	a0,-3
ffffffffc0204802:	bff1                	j	ffffffffc02047de <fd_array_alloc+0x4a>
ffffffffc0204804:	f6fff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204808:	00009697          	auipc	a3,0x9
ffffffffc020480c:	b6068693          	addi	a3,a3,-1184 # ffffffffc020d368 <default_pmm_manager+0xbc8>
ffffffffc0204810:	00007617          	auipc	a2,0x7
ffffffffc0204814:	4a860613          	addi	a2,a2,1192 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204818:	03b00593          	li	a1,59
ffffffffc020481c:	00009517          	auipc	a0,0x9
ffffffffc0204820:	b3c50513          	addi	a0,a0,-1220 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc0204824:	c7bfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204828 <fd_array_free>:
ffffffffc0204828:	411c                	lw	a5,0(a0)
ffffffffc020482a:	1141                	addi	sp,sp,-16
ffffffffc020482c:	e022                	sd	s0,0(sp)
ffffffffc020482e:	e406                	sd	ra,8(sp)
ffffffffc0204830:	4705                	li	a4,1
ffffffffc0204832:	842a                	mv	s0,a0
ffffffffc0204834:	04e78063          	beq	a5,a4,ffffffffc0204874 <fd_array_free+0x4c>
ffffffffc0204838:	470d                	li	a4,3
ffffffffc020483a:	04e79563          	bne	a5,a4,ffffffffc0204884 <fd_array_free+0x5c>
ffffffffc020483e:	591c                	lw	a5,48(a0)
ffffffffc0204840:	c38d                	beqz	a5,ffffffffc0204862 <fd_array_free+0x3a>
ffffffffc0204842:	00009697          	auipc	a3,0x9
ffffffffc0204846:	b2668693          	addi	a3,a3,-1242 # ffffffffc020d368 <default_pmm_manager+0xbc8>
ffffffffc020484a:	00007617          	auipc	a2,0x7
ffffffffc020484e:	46e60613          	addi	a2,a2,1134 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204852:	04500593          	li	a1,69
ffffffffc0204856:	00009517          	auipc	a0,0x9
ffffffffc020485a:	b0250513          	addi	a0,a0,-1278 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc020485e:	c41fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204862:	7408                	ld	a0,40(s0)
ffffffffc0204864:	3c9030ef          	jal	ra,ffffffffc020842c <vfs_close>
ffffffffc0204868:	60a2                	ld	ra,8(sp)
ffffffffc020486a:	00042023          	sw	zero,0(s0)
ffffffffc020486e:	6402                	ld	s0,0(sp)
ffffffffc0204870:	0141                	addi	sp,sp,16
ffffffffc0204872:	8082                	ret
ffffffffc0204874:	591c                	lw	a5,48(a0)
ffffffffc0204876:	f7f1                	bnez	a5,ffffffffc0204842 <fd_array_free+0x1a>
ffffffffc0204878:	60a2                	ld	ra,8(sp)
ffffffffc020487a:	00042023          	sw	zero,0(s0)
ffffffffc020487e:	6402                	ld	s0,0(sp)
ffffffffc0204880:	0141                	addi	sp,sp,16
ffffffffc0204882:	8082                	ret
ffffffffc0204884:	00009697          	auipc	a3,0x9
ffffffffc0204888:	b1c68693          	addi	a3,a3,-1252 # ffffffffc020d3a0 <default_pmm_manager+0xc00>
ffffffffc020488c:	00007617          	auipc	a2,0x7
ffffffffc0204890:	42c60613          	addi	a2,a2,1068 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204894:	04400593          	li	a1,68
ffffffffc0204898:	00009517          	auipc	a0,0x9
ffffffffc020489c:	ac050513          	addi	a0,a0,-1344 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc02048a0:	bfffb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02048a4 <fd_array_release>:
ffffffffc02048a4:	4118                	lw	a4,0(a0)
ffffffffc02048a6:	1141                	addi	sp,sp,-16
ffffffffc02048a8:	e406                	sd	ra,8(sp)
ffffffffc02048aa:	4685                	li	a3,1
ffffffffc02048ac:	3779                	addiw	a4,a4,-2
ffffffffc02048ae:	04e6e063          	bltu	a3,a4,ffffffffc02048ee <fd_array_release+0x4a>
ffffffffc02048b2:	5918                	lw	a4,48(a0)
ffffffffc02048b4:	00e05d63          	blez	a4,ffffffffc02048ce <fd_array_release+0x2a>
ffffffffc02048b8:	fff7069b          	addiw	a3,a4,-1
ffffffffc02048bc:	d914                	sw	a3,48(a0)
ffffffffc02048be:	c681                	beqz	a3,ffffffffc02048c6 <fd_array_release+0x22>
ffffffffc02048c0:	60a2                	ld	ra,8(sp)
ffffffffc02048c2:	0141                	addi	sp,sp,16
ffffffffc02048c4:	8082                	ret
ffffffffc02048c6:	60a2                	ld	ra,8(sp)
ffffffffc02048c8:	0141                	addi	sp,sp,16
ffffffffc02048ca:	f5fff06f          	j	ffffffffc0204828 <fd_array_free>
ffffffffc02048ce:	00009697          	auipc	a3,0x9
ffffffffc02048d2:	b4268693          	addi	a3,a3,-1214 # ffffffffc020d410 <default_pmm_manager+0xc70>
ffffffffc02048d6:	00007617          	auipc	a2,0x7
ffffffffc02048da:	3e260613          	addi	a2,a2,994 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02048de:	05600593          	li	a1,86
ffffffffc02048e2:	00009517          	auipc	a0,0x9
ffffffffc02048e6:	a7650513          	addi	a0,a0,-1418 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc02048ea:	bb5fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02048ee:	00009697          	auipc	a3,0x9
ffffffffc02048f2:	aea68693          	addi	a3,a3,-1302 # ffffffffc020d3d8 <default_pmm_manager+0xc38>
ffffffffc02048f6:	00007617          	auipc	a2,0x7
ffffffffc02048fa:	3c260613          	addi	a2,a2,962 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02048fe:	05500593          	li	a1,85
ffffffffc0204902:	00009517          	auipc	a0,0x9
ffffffffc0204906:	a5650513          	addi	a0,a0,-1450 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc020490a:	b95fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020490e <fd_array_open.part.0>:
ffffffffc020490e:	1141                	addi	sp,sp,-16
ffffffffc0204910:	00009697          	auipc	a3,0x9
ffffffffc0204914:	b1868693          	addi	a3,a3,-1256 # ffffffffc020d428 <default_pmm_manager+0xc88>
ffffffffc0204918:	00007617          	auipc	a2,0x7
ffffffffc020491c:	3a060613          	addi	a2,a2,928 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204920:	05f00593          	li	a1,95
ffffffffc0204924:	00009517          	auipc	a0,0x9
ffffffffc0204928:	a3450513          	addi	a0,a0,-1484 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc020492c:	e406                	sd	ra,8(sp)
ffffffffc020492e:	b71fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204932 <fd_array_init>:
ffffffffc0204932:	4781                	li	a5,0
ffffffffc0204934:	04800713          	li	a4,72
ffffffffc0204938:	cd1c                	sw	a5,24(a0)
ffffffffc020493a:	02052823          	sw	zero,48(a0)
ffffffffc020493e:	00052023          	sw	zero,0(a0)
ffffffffc0204942:	2785                	addiw	a5,a5,1
ffffffffc0204944:	03850513          	addi	a0,a0,56
ffffffffc0204948:	fee798e3          	bne	a5,a4,ffffffffc0204938 <fd_array_init+0x6>
ffffffffc020494c:	8082                	ret

ffffffffc020494e <fd_array_close>:
ffffffffc020494e:	4118                	lw	a4,0(a0)
ffffffffc0204950:	1141                	addi	sp,sp,-16
ffffffffc0204952:	e406                	sd	ra,8(sp)
ffffffffc0204954:	e022                	sd	s0,0(sp)
ffffffffc0204956:	4789                	li	a5,2
ffffffffc0204958:	04f71a63          	bne	a4,a5,ffffffffc02049ac <fd_array_close+0x5e>
ffffffffc020495c:	591c                	lw	a5,48(a0)
ffffffffc020495e:	842a                	mv	s0,a0
ffffffffc0204960:	02f05663          	blez	a5,ffffffffc020498c <fd_array_close+0x3e>
ffffffffc0204964:	37fd                	addiw	a5,a5,-1
ffffffffc0204966:	470d                	li	a4,3
ffffffffc0204968:	c118                	sw	a4,0(a0)
ffffffffc020496a:	d91c                	sw	a5,48(a0)
ffffffffc020496c:	0007871b          	sext.w	a4,a5
ffffffffc0204970:	c709                	beqz	a4,ffffffffc020497a <fd_array_close+0x2c>
ffffffffc0204972:	60a2                	ld	ra,8(sp)
ffffffffc0204974:	6402                	ld	s0,0(sp)
ffffffffc0204976:	0141                	addi	sp,sp,16
ffffffffc0204978:	8082                	ret
ffffffffc020497a:	7508                	ld	a0,40(a0)
ffffffffc020497c:	2b1030ef          	jal	ra,ffffffffc020842c <vfs_close>
ffffffffc0204980:	60a2                	ld	ra,8(sp)
ffffffffc0204982:	00042023          	sw	zero,0(s0)
ffffffffc0204986:	6402                	ld	s0,0(sp)
ffffffffc0204988:	0141                	addi	sp,sp,16
ffffffffc020498a:	8082                	ret
ffffffffc020498c:	00009697          	auipc	a3,0x9
ffffffffc0204990:	a8468693          	addi	a3,a3,-1404 # ffffffffc020d410 <default_pmm_manager+0xc70>
ffffffffc0204994:	00007617          	auipc	a2,0x7
ffffffffc0204998:	32460613          	addi	a2,a2,804 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020499c:	06800593          	li	a1,104
ffffffffc02049a0:	00009517          	auipc	a0,0x9
ffffffffc02049a4:	9b850513          	addi	a0,a0,-1608 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc02049a8:	af7fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02049ac:	00009697          	auipc	a3,0x9
ffffffffc02049b0:	9d468693          	addi	a3,a3,-1580 # ffffffffc020d380 <default_pmm_manager+0xbe0>
ffffffffc02049b4:	00007617          	auipc	a2,0x7
ffffffffc02049b8:	30460613          	addi	a2,a2,772 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02049bc:	06700593          	li	a1,103
ffffffffc02049c0:	00009517          	auipc	a0,0x9
ffffffffc02049c4:	99850513          	addi	a0,a0,-1640 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc02049c8:	ad7fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02049cc <fd_array_dup>:
ffffffffc02049cc:	7179                	addi	sp,sp,-48
ffffffffc02049ce:	e84a                	sd	s2,16(sp)
ffffffffc02049d0:	00052903          	lw	s2,0(a0)
ffffffffc02049d4:	f406                	sd	ra,40(sp)
ffffffffc02049d6:	f022                	sd	s0,32(sp)
ffffffffc02049d8:	ec26                	sd	s1,24(sp)
ffffffffc02049da:	e44e                	sd	s3,8(sp)
ffffffffc02049dc:	4785                	li	a5,1
ffffffffc02049de:	04f91663          	bne	s2,a5,ffffffffc0204a2a <fd_array_dup+0x5e>
ffffffffc02049e2:	0005a983          	lw	s3,0(a1)
ffffffffc02049e6:	4789                	li	a5,2
ffffffffc02049e8:	04f99163          	bne	s3,a5,ffffffffc0204a2a <fd_array_dup+0x5e>
ffffffffc02049ec:	7584                	ld	s1,40(a1)
ffffffffc02049ee:	699c                	ld	a5,16(a1)
ffffffffc02049f0:	7194                	ld	a3,32(a1)
ffffffffc02049f2:	6598                	ld	a4,8(a1)
ffffffffc02049f4:	842a                	mv	s0,a0
ffffffffc02049f6:	e91c                	sd	a5,16(a0)
ffffffffc02049f8:	f114                	sd	a3,32(a0)
ffffffffc02049fa:	e518                	sd	a4,8(a0)
ffffffffc02049fc:	8526                	mv	a0,s1
ffffffffc02049fe:	18c030ef          	jal	ra,ffffffffc0207b8a <inode_ref_inc>
ffffffffc0204a02:	8526                	mv	a0,s1
ffffffffc0204a04:	192030ef          	jal	ra,ffffffffc0207b96 <inode_open_inc>
ffffffffc0204a08:	401c                	lw	a5,0(s0)
ffffffffc0204a0a:	f404                	sd	s1,40(s0)
ffffffffc0204a0c:	03279f63          	bne	a5,s2,ffffffffc0204a4a <fd_array_dup+0x7e>
ffffffffc0204a10:	cc8d                	beqz	s1,ffffffffc0204a4a <fd_array_dup+0x7e>
ffffffffc0204a12:	581c                	lw	a5,48(s0)
ffffffffc0204a14:	01342023          	sw	s3,0(s0)
ffffffffc0204a18:	70a2                	ld	ra,40(sp)
ffffffffc0204a1a:	2785                	addiw	a5,a5,1
ffffffffc0204a1c:	d81c                	sw	a5,48(s0)
ffffffffc0204a1e:	7402                	ld	s0,32(sp)
ffffffffc0204a20:	64e2                	ld	s1,24(sp)
ffffffffc0204a22:	6942                	ld	s2,16(sp)
ffffffffc0204a24:	69a2                	ld	s3,8(sp)
ffffffffc0204a26:	6145                	addi	sp,sp,48
ffffffffc0204a28:	8082                	ret
ffffffffc0204a2a:	00009697          	auipc	a3,0x9
ffffffffc0204a2e:	a2e68693          	addi	a3,a3,-1490 # ffffffffc020d458 <default_pmm_manager+0xcb8>
ffffffffc0204a32:	00007617          	auipc	a2,0x7
ffffffffc0204a36:	28660613          	addi	a2,a2,646 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204a3a:	07300593          	li	a1,115
ffffffffc0204a3e:	00009517          	auipc	a0,0x9
ffffffffc0204a42:	91a50513          	addi	a0,a0,-1766 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc0204a46:	a59fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204a4a:	ec5ff0ef          	jal	ra,ffffffffc020490e <fd_array_open.part.0>

ffffffffc0204a4e <file_testfd>:
ffffffffc0204a4e:	04700793          	li	a5,71
ffffffffc0204a52:	04a7e263          	bltu	a5,a0,ffffffffc0204a96 <file_testfd+0x48>
ffffffffc0204a56:	00092797          	auipc	a5,0x92
ffffffffc0204a5a:	e6a7b783          	ld	a5,-406(a5) # ffffffffc02968c0 <current>
ffffffffc0204a5e:	1487b783          	ld	a5,328(a5)
ffffffffc0204a62:	cf85                	beqz	a5,ffffffffc0204a9a <file_testfd+0x4c>
ffffffffc0204a64:	4b98                	lw	a4,16(a5)
ffffffffc0204a66:	02e05a63          	blez	a4,ffffffffc0204a9a <file_testfd+0x4c>
ffffffffc0204a6a:	6798                	ld	a4,8(a5)
ffffffffc0204a6c:	00351793          	slli	a5,a0,0x3
ffffffffc0204a70:	8f89                	sub	a5,a5,a0
ffffffffc0204a72:	078e                	slli	a5,a5,0x3
ffffffffc0204a74:	97ba                	add	a5,a5,a4
ffffffffc0204a76:	4394                	lw	a3,0(a5)
ffffffffc0204a78:	4709                	li	a4,2
ffffffffc0204a7a:	00e69e63          	bne	a3,a4,ffffffffc0204a96 <file_testfd+0x48>
ffffffffc0204a7e:	4f98                	lw	a4,24(a5)
ffffffffc0204a80:	00a71b63          	bne	a4,a0,ffffffffc0204a96 <file_testfd+0x48>
ffffffffc0204a84:	c199                	beqz	a1,ffffffffc0204a8a <file_testfd+0x3c>
ffffffffc0204a86:	6788                	ld	a0,8(a5)
ffffffffc0204a88:	c901                	beqz	a0,ffffffffc0204a98 <file_testfd+0x4a>
ffffffffc0204a8a:	4505                	li	a0,1
ffffffffc0204a8c:	c611                	beqz	a2,ffffffffc0204a98 <file_testfd+0x4a>
ffffffffc0204a8e:	6b88                	ld	a0,16(a5)
ffffffffc0204a90:	00a03533          	snez	a0,a0
ffffffffc0204a94:	8082                	ret
ffffffffc0204a96:	4501                	li	a0,0
ffffffffc0204a98:	8082                	ret
ffffffffc0204a9a:	1141                	addi	sp,sp,-16
ffffffffc0204a9c:	e406                	sd	ra,8(sp)
ffffffffc0204a9e:	cd5ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0204aa2 <file_open>:
ffffffffc0204aa2:	711d                	addi	sp,sp,-96
ffffffffc0204aa4:	ec86                	sd	ra,88(sp)
ffffffffc0204aa6:	e8a2                	sd	s0,80(sp)
ffffffffc0204aa8:	e4a6                	sd	s1,72(sp)
ffffffffc0204aaa:	e0ca                	sd	s2,64(sp)
ffffffffc0204aac:	fc4e                	sd	s3,56(sp)
ffffffffc0204aae:	f852                	sd	s4,48(sp)
ffffffffc0204ab0:	0035f793          	andi	a5,a1,3
ffffffffc0204ab4:	470d                	li	a4,3
ffffffffc0204ab6:	0ce78163          	beq	a5,a4,ffffffffc0204b78 <file_open+0xd6>
ffffffffc0204aba:	078e                	slli	a5,a5,0x3
ffffffffc0204abc:	00009717          	auipc	a4,0x9
ffffffffc0204ac0:	c0c70713          	addi	a4,a4,-1012 # ffffffffc020d6c8 <CSWTCH.79>
ffffffffc0204ac4:	892a                	mv	s2,a0
ffffffffc0204ac6:	00009697          	auipc	a3,0x9
ffffffffc0204aca:	bea68693          	addi	a3,a3,-1046 # ffffffffc020d6b0 <CSWTCH.78>
ffffffffc0204ace:	755d                	lui	a0,0xffff7
ffffffffc0204ad0:	96be                	add	a3,a3,a5
ffffffffc0204ad2:	84ae                	mv	s1,a1
ffffffffc0204ad4:	97ba                	add	a5,a5,a4
ffffffffc0204ad6:	858a                	mv	a1,sp
ffffffffc0204ad8:	ad950513          	addi	a0,a0,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0204adc:	0006ba03          	ld	s4,0(a3)
ffffffffc0204ae0:	0007b983          	ld	s3,0(a5)
ffffffffc0204ae4:	cb1ff0ef          	jal	ra,ffffffffc0204794 <fd_array_alloc>
ffffffffc0204ae8:	842a                	mv	s0,a0
ffffffffc0204aea:	c911                	beqz	a0,ffffffffc0204afe <file_open+0x5c>
ffffffffc0204aec:	60e6                	ld	ra,88(sp)
ffffffffc0204aee:	8522                	mv	a0,s0
ffffffffc0204af0:	6446                	ld	s0,80(sp)
ffffffffc0204af2:	64a6                	ld	s1,72(sp)
ffffffffc0204af4:	6906                	ld	s2,64(sp)
ffffffffc0204af6:	79e2                	ld	s3,56(sp)
ffffffffc0204af8:	7a42                	ld	s4,48(sp)
ffffffffc0204afa:	6125                	addi	sp,sp,96
ffffffffc0204afc:	8082                	ret
ffffffffc0204afe:	0030                	addi	a2,sp,8
ffffffffc0204b00:	85a6                	mv	a1,s1
ffffffffc0204b02:	854a                	mv	a0,s2
ffffffffc0204b04:	782030ef          	jal	ra,ffffffffc0208286 <vfs_open>
ffffffffc0204b08:	842a                	mv	s0,a0
ffffffffc0204b0a:	e13d                	bnez	a0,ffffffffc0204b70 <file_open+0xce>
ffffffffc0204b0c:	6782                	ld	a5,0(sp)
ffffffffc0204b0e:	0204f493          	andi	s1,s1,32
ffffffffc0204b12:	6422                	ld	s0,8(sp)
ffffffffc0204b14:	0207b023          	sd	zero,32(a5)
ffffffffc0204b18:	c885                	beqz	s1,ffffffffc0204b48 <file_open+0xa6>
ffffffffc0204b1a:	c03d                	beqz	s0,ffffffffc0204b80 <file_open+0xde>
ffffffffc0204b1c:	783c                	ld	a5,112(s0)
ffffffffc0204b1e:	c3ad                	beqz	a5,ffffffffc0204b80 <file_open+0xde>
ffffffffc0204b20:	779c                	ld	a5,40(a5)
ffffffffc0204b22:	cfb9                	beqz	a5,ffffffffc0204b80 <file_open+0xde>
ffffffffc0204b24:	8522                	mv	a0,s0
ffffffffc0204b26:	00009597          	auipc	a1,0x9
ffffffffc0204b2a:	9ba58593          	addi	a1,a1,-1606 # ffffffffc020d4e0 <default_pmm_manager+0xd40>
ffffffffc0204b2e:	074030ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc0204b32:	783c                	ld	a5,112(s0)
ffffffffc0204b34:	6522                	ld	a0,8(sp)
ffffffffc0204b36:	080c                	addi	a1,sp,16
ffffffffc0204b38:	779c                	ld	a5,40(a5)
ffffffffc0204b3a:	9782                	jalr	a5
ffffffffc0204b3c:	842a                	mv	s0,a0
ffffffffc0204b3e:	e515                	bnez	a0,ffffffffc0204b6a <file_open+0xc8>
ffffffffc0204b40:	6782                	ld	a5,0(sp)
ffffffffc0204b42:	7722                	ld	a4,40(sp)
ffffffffc0204b44:	6422                	ld	s0,8(sp)
ffffffffc0204b46:	f398                	sd	a4,32(a5)
ffffffffc0204b48:	4394                	lw	a3,0(a5)
ffffffffc0204b4a:	f780                	sd	s0,40(a5)
ffffffffc0204b4c:	0147b423          	sd	s4,8(a5)
ffffffffc0204b50:	0137b823          	sd	s3,16(a5)
ffffffffc0204b54:	4705                	li	a4,1
ffffffffc0204b56:	02e69363          	bne	a3,a4,ffffffffc0204b7c <file_open+0xda>
ffffffffc0204b5a:	c00d                	beqz	s0,ffffffffc0204b7c <file_open+0xda>
ffffffffc0204b5c:	5b98                	lw	a4,48(a5)
ffffffffc0204b5e:	4689                	li	a3,2
ffffffffc0204b60:	4f80                	lw	s0,24(a5)
ffffffffc0204b62:	2705                	addiw	a4,a4,1
ffffffffc0204b64:	c394                	sw	a3,0(a5)
ffffffffc0204b66:	db98                	sw	a4,48(a5)
ffffffffc0204b68:	b751                	j	ffffffffc0204aec <file_open+0x4a>
ffffffffc0204b6a:	6522                	ld	a0,8(sp)
ffffffffc0204b6c:	0c1030ef          	jal	ra,ffffffffc020842c <vfs_close>
ffffffffc0204b70:	6502                	ld	a0,0(sp)
ffffffffc0204b72:	cb7ff0ef          	jal	ra,ffffffffc0204828 <fd_array_free>
ffffffffc0204b76:	bf9d                	j	ffffffffc0204aec <file_open+0x4a>
ffffffffc0204b78:	5475                	li	s0,-3
ffffffffc0204b7a:	bf8d                	j	ffffffffc0204aec <file_open+0x4a>
ffffffffc0204b7c:	d93ff0ef          	jal	ra,ffffffffc020490e <fd_array_open.part.0>
ffffffffc0204b80:	00009697          	auipc	a3,0x9
ffffffffc0204b84:	91068693          	addi	a3,a3,-1776 # ffffffffc020d490 <default_pmm_manager+0xcf0>
ffffffffc0204b88:	00007617          	auipc	a2,0x7
ffffffffc0204b8c:	13060613          	addi	a2,a2,304 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204b90:	0b500593          	li	a1,181
ffffffffc0204b94:	00008517          	auipc	a0,0x8
ffffffffc0204b98:	7c450513          	addi	a0,a0,1988 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc0204b9c:	903fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204ba0 <file_close>:
ffffffffc0204ba0:	04700713          	li	a4,71
ffffffffc0204ba4:	04a76563          	bltu	a4,a0,ffffffffc0204bee <file_close+0x4e>
ffffffffc0204ba8:	00092717          	auipc	a4,0x92
ffffffffc0204bac:	d1873703          	ld	a4,-744(a4) # ffffffffc02968c0 <current>
ffffffffc0204bb0:	14873703          	ld	a4,328(a4)
ffffffffc0204bb4:	1141                	addi	sp,sp,-16
ffffffffc0204bb6:	e406                	sd	ra,8(sp)
ffffffffc0204bb8:	cf0d                	beqz	a4,ffffffffc0204bf2 <file_close+0x52>
ffffffffc0204bba:	4b14                	lw	a3,16(a4)
ffffffffc0204bbc:	02d05b63          	blez	a3,ffffffffc0204bf2 <file_close+0x52>
ffffffffc0204bc0:	6718                	ld	a4,8(a4)
ffffffffc0204bc2:	87aa                	mv	a5,a0
ffffffffc0204bc4:	050e                	slli	a0,a0,0x3
ffffffffc0204bc6:	8d1d                	sub	a0,a0,a5
ffffffffc0204bc8:	050e                	slli	a0,a0,0x3
ffffffffc0204bca:	953a                	add	a0,a0,a4
ffffffffc0204bcc:	4114                	lw	a3,0(a0)
ffffffffc0204bce:	4709                	li	a4,2
ffffffffc0204bd0:	00e69b63          	bne	a3,a4,ffffffffc0204be6 <file_close+0x46>
ffffffffc0204bd4:	4d18                	lw	a4,24(a0)
ffffffffc0204bd6:	00f71863          	bne	a4,a5,ffffffffc0204be6 <file_close+0x46>
ffffffffc0204bda:	d75ff0ef          	jal	ra,ffffffffc020494e <fd_array_close>
ffffffffc0204bde:	60a2                	ld	ra,8(sp)
ffffffffc0204be0:	4501                	li	a0,0
ffffffffc0204be2:	0141                	addi	sp,sp,16
ffffffffc0204be4:	8082                	ret
ffffffffc0204be6:	60a2                	ld	ra,8(sp)
ffffffffc0204be8:	5575                	li	a0,-3
ffffffffc0204bea:	0141                	addi	sp,sp,16
ffffffffc0204bec:	8082                	ret
ffffffffc0204bee:	5575                	li	a0,-3
ffffffffc0204bf0:	8082                	ret
ffffffffc0204bf2:	b81ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0204bf6 <file_read>:
ffffffffc0204bf6:	715d                	addi	sp,sp,-80
ffffffffc0204bf8:	e486                	sd	ra,72(sp)
ffffffffc0204bfa:	e0a2                	sd	s0,64(sp)
ffffffffc0204bfc:	fc26                	sd	s1,56(sp)
ffffffffc0204bfe:	f84a                	sd	s2,48(sp)
ffffffffc0204c00:	f44e                	sd	s3,40(sp)
ffffffffc0204c02:	f052                	sd	s4,32(sp)
ffffffffc0204c04:	0006b023          	sd	zero,0(a3)
ffffffffc0204c08:	04700793          	li	a5,71
ffffffffc0204c0c:	0aa7e463          	bltu	a5,a0,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c10:	00092797          	auipc	a5,0x92
ffffffffc0204c14:	cb07b783          	ld	a5,-848(a5) # ffffffffc02968c0 <current>
ffffffffc0204c18:	1487b783          	ld	a5,328(a5)
ffffffffc0204c1c:	cfd1                	beqz	a5,ffffffffc0204cb8 <file_read+0xc2>
ffffffffc0204c1e:	4b98                	lw	a4,16(a5)
ffffffffc0204c20:	08e05c63          	blez	a4,ffffffffc0204cb8 <file_read+0xc2>
ffffffffc0204c24:	6780                	ld	s0,8(a5)
ffffffffc0204c26:	00351793          	slli	a5,a0,0x3
ffffffffc0204c2a:	8f89                	sub	a5,a5,a0
ffffffffc0204c2c:	078e                	slli	a5,a5,0x3
ffffffffc0204c2e:	943e                	add	s0,s0,a5
ffffffffc0204c30:	00042983          	lw	s3,0(s0)
ffffffffc0204c34:	4789                	li	a5,2
ffffffffc0204c36:	06f99f63          	bne	s3,a5,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c3a:	4c1c                	lw	a5,24(s0)
ffffffffc0204c3c:	06a79c63          	bne	a5,a0,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c40:	641c                	ld	a5,8(s0)
ffffffffc0204c42:	cbad                	beqz	a5,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c44:	581c                	lw	a5,48(s0)
ffffffffc0204c46:	8a36                	mv	s4,a3
ffffffffc0204c48:	7014                	ld	a3,32(s0)
ffffffffc0204c4a:	2785                	addiw	a5,a5,1
ffffffffc0204c4c:	850a                	mv	a0,sp
ffffffffc0204c4e:	d81c                	sw	a5,48(s0)
ffffffffc0204c50:	726000ef          	jal	ra,ffffffffc0205376 <iobuf_init>
ffffffffc0204c54:	02843903          	ld	s2,40(s0)
ffffffffc0204c58:	84aa                	mv	s1,a0
ffffffffc0204c5a:	06090163          	beqz	s2,ffffffffc0204cbc <file_read+0xc6>
ffffffffc0204c5e:	07093783          	ld	a5,112(s2)
ffffffffc0204c62:	cfa9                	beqz	a5,ffffffffc0204cbc <file_read+0xc6>
ffffffffc0204c64:	6f9c                	ld	a5,24(a5)
ffffffffc0204c66:	cbb9                	beqz	a5,ffffffffc0204cbc <file_read+0xc6>
ffffffffc0204c68:	00009597          	auipc	a1,0x9
ffffffffc0204c6c:	8d058593          	addi	a1,a1,-1840 # ffffffffc020d538 <default_pmm_manager+0xd98>
ffffffffc0204c70:	854a                	mv	a0,s2
ffffffffc0204c72:	731020ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc0204c76:	07093783          	ld	a5,112(s2)
ffffffffc0204c7a:	7408                	ld	a0,40(s0)
ffffffffc0204c7c:	85a6                	mv	a1,s1
ffffffffc0204c7e:	6f9c                	ld	a5,24(a5)
ffffffffc0204c80:	9782                	jalr	a5
ffffffffc0204c82:	689c                	ld	a5,16(s1)
ffffffffc0204c84:	6c94                	ld	a3,24(s1)
ffffffffc0204c86:	4018                	lw	a4,0(s0)
ffffffffc0204c88:	84aa                	mv	s1,a0
ffffffffc0204c8a:	8f95                	sub	a5,a5,a3
ffffffffc0204c8c:	03370063          	beq	a4,s3,ffffffffc0204cac <file_read+0xb6>
ffffffffc0204c90:	00fa3023          	sd	a5,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0204c94:	8522                	mv	a0,s0
ffffffffc0204c96:	c0fff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204c9a:	60a6                	ld	ra,72(sp)
ffffffffc0204c9c:	6406                	ld	s0,64(sp)
ffffffffc0204c9e:	7942                	ld	s2,48(sp)
ffffffffc0204ca0:	79a2                	ld	s3,40(sp)
ffffffffc0204ca2:	7a02                	ld	s4,32(sp)
ffffffffc0204ca4:	8526                	mv	a0,s1
ffffffffc0204ca6:	74e2                	ld	s1,56(sp)
ffffffffc0204ca8:	6161                	addi	sp,sp,80
ffffffffc0204caa:	8082                	ret
ffffffffc0204cac:	7018                	ld	a4,32(s0)
ffffffffc0204cae:	973e                	add	a4,a4,a5
ffffffffc0204cb0:	f018                	sd	a4,32(s0)
ffffffffc0204cb2:	bff9                	j	ffffffffc0204c90 <file_read+0x9a>
ffffffffc0204cb4:	54f5                	li	s1,-3
ffffffffc0204cb6:	b7d5                	j	ffffffffc0204c9a <file_read+0xa4>
ffffffffc0204cb8:	abbff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204cbc:	00009697          	auipc	a3,0x9
ffffffffc0204cc0:	82c68693          	addi	a3,a3,-2004 # ffffffffc020d4e8 <default_pmm_manager+0xd48>
ffffffffc0204cc4:	00007617          	auipc	a2,0x7
ffffffffc0204cc8:	ff460613          	addi	a2,a2,-12 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204ccc:	0de00593          	li	a1,222
ffffffffc0204cd0:	00008517          	auipc	a0,0x8
ffffffffc0204cd4:	68850513          	addi	a0,a0,1672 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc0204cd8:	fc6fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204cdc <file_write>:
ffffffffc0204cdc:	715d                	addi	sp,sp,-80
ffffffffc0204cde:	e486                	sd	ra,72(sp)
ffffffffc0204ce0:	e0a2                	sd	s0,64(sp)
ffffffffc0204ce2:	fc26                	sd	s1,56(sp)
ffffffffc0204ce4:	f84a                	sd	s2,48(sp)
ffffffffc0204ce6:	f44e                	sd	s3,40(sp)
ffffffffc0204ce8:	f052                	sd	s4,32(sp)
ffffffffc0204cea:	0006b023          	sd	zero,0(a3)
ffffffffc0204cee:	04700793          	li	a5,71
ffffffffc0204cf2:	0aa7e463          	bltu	a5,a0,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204cf6:	00092797          	auipc	a5,0x92
ffffffffc0204cfa:	bca7b783          	ld	a5,-1078(a5) # ffffffffc02968c0 <current>
ffffffffc0204cfe:	1487b783          	ld	a5,328(a5)
ffffffffc0204d02:	cfd1                	beqz	a5,ffffffffc0204d9e <file_write+0xc2>
ffffffffc0204d04:	4b98                	lw	a4,16(a5)
ffffffffc0204d06:	08e05c63          	blez	a4,ffffffffc0204d9e <file_write+0xc2>
ffffffffc0204d0a:	6780                	ld	s0,8(a5)
ffffffffc0204d0c:	00351793          	slli	a5,a0,0x3
ffffffffc0204d10:	8f89                	sub	a5,a5,a0
ffffffffc0204d12:	078e                	slli	a5,a5,0x3
ffffffffc0204d14:	943e                	add	s0,s0,a5
ffffffffc0204d16:	00042983          	lw	s3,0(s0)
ffffffffc0204d1a:	4789                	li	a5,2
ffffffffc0204d1c:	06f99f63          	bne	s3,a5,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204d20:	4c1c                	lw	a5,24(s0)
ffffffffc0204d22:	06a79c63          	bne	a5,a0,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204d26:	681c                	ld	a5,16(s0)
ffffffffc0204d28:	cbad                	beqz	a5,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204d2a:	581c                	lw	a5,48(s0)
ffffffffc0204d2c:	8a36                	mv	s4,a3
ffffffffc0204d2e:	7014                	ld	a3,32(s0)
ffffffffc0204d30:	2785                	addiw	a5,a5,1
ffffffffc0204d32:	850a                	mv	a0,sp
ffffffffc0204d34:	d81c                	sw	a5,48(s0)
ffffffffc0204d36:	640000ef          	jal	ra,ffffffffc0205376 <iobuf_init>
ffffffffc0204d3a:	02843903          	ld	s2,40(s0)
ffffffffc0204d3e:	84aa                	mv	s1,a0
ffffffffc0204d40:	06090163          	beqz	s2,ffffffffc0204da2 <file_write+0xc6>
ffffffffc0204d44:	07093783          	ld	a5,112(s2)
ffffffffc0204d48:	cfa9                	beqz	a5,ffffffffc0204da2 <file_write+0xc6>
ffffffffc0204d4a:	739c                	ld	a5,32(a5)
ffffffffc0204d4c:	cbb9                	beqz	a5,ffffffffc0204da2 <file_write+0xc6>
ffffffffc0204d4e:	00009597          	auipc	a1,0x9
ffffffffc0204d52:	84258593          	addi	a1,a1,-1982 # ffffffffc020d590 <default_pmm_manager+0xdf0>
ffffffffc0204d56:	854a                	mv	a0,s2
ffffffffc0204d58:	64b020ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc0204d5c:	07093783          	ld	a5,112(s2)
ffffffffc0204d60:	7408                	ld	a0,40(s0)
ffffffffc0204d62:	85a6                	mv	a1,s1
ffffffffc0204d64:	739c                	ld	a5,32(a5)
ffffffffc0204d66:	9782                	jalr	a5
ffffffffc0204d68:	689c                	ld	a5,16(s1)
ffffffffc0204d6a:	6c94                	ld	a3,24(s1)
ffffffffc0204d6c:	4018                	lw	a4,0(s0)
ffffffffc0204d6e:	84aa                	mv	s1,a0
ffffffffc0204d70:	8f95                	sub	a5,a5,a3
ffffffffc0204d72:	03370063          	beq	a4,s3,ffffffffc0204d92 <file_write+0xb6>
ffffffffc0204d76:	00fa3023          	sd	a5,0(s4)
ffffffffc0204d7a:	8522                	mv	a0,s0
ffffffffc0204d7c:	b29ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204d80:	60a6                	ld	ra,72(sp)
ffffffffc0204d82:	6406                	ld	s0,64(sp)
ffffffffc0204d84:	7942                	ld	s2,48(sp)
ffffffffc0204d86:	79a2                	ld	s3,40(sp)
ffffffffc0204d88:	7a02                	ld	s4,32(sp)
ffffffffc0204d8a:	8526                	mv	a0,s1
ffffffffc0204d8c:	74e2                	ld	s1,56(sp)
ffffffffc0204d8e:	6161                	addi	sp,sp,80
ffffffffc0204d90:	8082                	ret
ffffffffc0204d92:	7018                	ld	a4,32(s0)
ffffffffc0204d94:	973e                	add	a4,a4,a5
ffffffffc0204d96:	f018                	sd	a4,32(s0)
ffffffffc0204d98:	bff9                	j	ffffffffc0204d76 <file_write+0x9a>
ffffffffc0204d9a:	54f5                	li	s1,-3
ffffffffc0204d9c:	b7d5                	j	ffffffffc0204d80 <file_write+0xa4>
ffffffffc0204d9e:	9d5ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204da2:	00008697          	auipc	a3,0x8
ffffffffc0204da6:	79e68693          	addi	a3,a3,1950 # ffffffffc020d540 <default_pmm_manager+0xda0>
ffffffffc0204daa:	00007617          	auipc	a2,0x7
ffffffffc0204dae:	f0e60613          	addi	a2,a2,-242 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204db2:	0f800593          	li	a1,248
ffffffffc0204db6:	00008517          	auipc	a0,0x8
ffffffffc0204dba:	5a250513          	addi	a0,a0,1442 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc0204dbe:	ee0fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204dc2 <file_seek>:
ffffffffc0204dc2:	7139                	addi	sp,sp,-64
ffffffffc0204dc4:	fc06                	sd	ra,56(sp)
ffffffffc0204dc6:	f822                	sd	s0,48(sp)
ffffffffc0204dc8:	f426                	sd	s1,40(sp)
ffffffffc0204dca:	f04a                	sd	s2,32(sp)
ffffffffc0204dcc:	04700793          	li	a5,71
ffffffffc0204dd0:	08a7e863          	bltu	a5,a0,ffffffffc0204e60 <file_seek+0x9e>
ffffffffc0204dd4:	00092797          	auipc	a5,0x92
ffffffffc0204dd8:	aec7b783          	ld	a5,-1300(a5) # ffffffffc02968c0 <current>
ffffffffc0204ddc:	1487b783          	ld	a5,328(a5)
ffffffffc0204de0:	cfdd                	beqz	a5,ffffffffc0204e9e <file_seek+0xdc>
ffffffffc0204de2:	4b98                	lw	a4,16(a5)
ffffffffc0204de4:	0ae05d63          	blez	a4,ffffffffc0204e9e <file_seek+0xdc>
ffffffffc0204de8:	6780                	ld	s0,8(a5)
ffffffffc0204dea:	00351793          	slli	a5,a0,0x3
ffffffffc0204dee:	8f89                	sub	a5,a5,a0
ffffffffc0204df0:	078e                	slli	a5,a5,0x3
ffffffffc0204df2:	943e                	add	s0,s0,a5
ffffffffc0204df4:	4018                	lw	a4,0(s0)
ffffffffc0204df6:	4789                	li	a5,2
ffffffffc0204df8:	06f71463          	bne	a4,a5,ffffffffc0204e60 <file_seek+0x9e>
ffffffffc0204dfc:	4c1c                	lw	a5,24(s0)
ffffffffc0204dfe:	06a79163          	bne	a5,a0,ffffffffc0204e60 <file_seek+0x9e>
ffffffffc0204e02:	581c                	lw	a5,48(s0)
ffffffffc0204e04:	4685                	li	a3,1
ffffffffc0204e06:	892e                	mv	s2,a1
ffffffffc0204e08:	2785                	addiw	a5,a5,1
ffffffffc0204e0a:	d81c                	sw	a5,48(s0)
ffffffffc0204e0c:	02d60063          	beq	a2,a3,ffffffffc0204e2c <file_seek+0x6a>
ffffffffc0204e10:	06e60063          	beq	a2,a4,ffffffffc0204e70 <file_seek+0xae>
ffffffffc0204e14:	54f5                	li	s1,-3
ffffffffc0204e16:	ce11                	beqz	a2,ffffffffc0204e32 <file_seek+0x70>
ffffffffc0204e18:	8522                	mv	a0,s0
ffffffffc0204e1a:	a8bff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204e1e:	70e2                	ld	ra,56(sp)
ffffffffc0204e20:	7442                	ld	s0,48(sp)
ffffffffc0204e22:	7902                	ld	s2,32(sp)
ffffffffc0204e24:	8526                	mv	a0,s1
ffffffffc0204e26:	74a2                	ld	s1,40(sp)
ffffffffc0204e28:	6121                	addi	sp,sp,64
ffffffffc0204e2a:	8082                	ret
ffffffffc0204e2c:	701c                	ld	a5,32(s0)
ffffffffc0204e2e:	00f58933          	add	s2,a1,a5
ffffffffc0204e32:	7404                	ld	s1,40(s0)
ffffffffc0204e34:	c4bd                	beqz	s1,ffffffffc0204ea2 <file_seek+0xe0>
ffffffffc0204e36:	78bc                	ld	a5,112(s1)
ffffffffc0204e38:	c7ad                	beqz	a5,ffffffffc0204ea2 <file_seek+0xe0>
ffffffffc0204e3a:	6fbc                	ld	a5,88(a5)
ffffffffc0204e3c:	c3bd                	beqz	a5,ffffffffc0204ea2 <file_seek+0xe0>
ffffffffc0204e3e:	8526                	mv	a0,s1
ffffffffc0204e40:	00008597          	auipc	a1,0x8
ffffffffc0204e44:	7a858593          	addi	a1,a1,1960 # ffffffffc020d5e8 <default_pmm_manager+0xe48>
ffffffffc0204e48:	55b020ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc0204e4c:	78bc                	ld	a5,112(s1)
ffffffffc0204e4e:	7408                	ld	a0,40(s0)
ffffffffc0204e50:	85ca                	mv	a1,s2
ffffffffc0204e52:	6fbc                	ld	a5,88(a5)
ffffffffc0204e54:	9782                	jalr	a5
ffffffffc0204e56:	84aa                	mv	s1,a0
ffffffffc0204e58:	f161                	bnez	a0,ffffffffc0204e18 <file_seek+0x56>
ffffffffc0204e5a:	03243023          	sd	s2,32(s0)
ffffffffc0204e5e:	bf6d                	j	ffffffffc0204e18 <file_seek+0x56>
ffffffffc0204e60:	70e2                	ld	ra,56(sp)
ffffffffc0204e62:	7442                	ld	s0,48(sp)
ffffffffc0204e64:	54f5                	li	s1,-3
ffffffffc0204e66:	7902                	ld	s2,32(sp)
ffffffffc0204e68:	8526                	mv	a0,s1
ffffffffc0204e6a:	74a2                	ld	s1,40(sp)
ffffffffc0204e6c:	6121                	addi	sp,sp,64
ffffffffc0204e6e:	8082                	ret
ffffffffc0204e70:	7404                	ld	s1,40(s0)
ffffffffc0204e72:	c8a1                	beqz	s1,ffffffffc0204ec2 <file_seek+0x100>
ffffffffc0204e74:	78bc                	ld	a5,112(s1)
ffffffffc0204e76:	c7b1                	beqz	a5,ffffffffc0204ec2 <file_seek+0x100>
ffffffffc0204e78:	779c                	ld	a5,40(a5)
ffffffffc0204e7a:	c7a1                	beqz	a5,ffffffffc0204ec2 <file_seek+0x100>
ffffffffc0204e7c:	8526                	mv	a0,s1
ffffffffc0204e7e:	00008597          	auipc	a1,0x8
ffffffffc0204e82:	66258593          	addi	a1,a1,1634 # ffffffffc020d4e0 <default_pmm_manager+0xd40>
ffffffffc0204e86:	51d020ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc0204e8a:	78bc                	ld	a5,112(s1)
ffffffffc0204e8c:	7408                	ld	a0,40(s0)
ffffffffc0204e8e:	858a                	mv	a1,sp
ffffffffc0204e90:	779c                	ld	a5,40(a5)
ffffffffc0204e92:	9782                	jalr	a5
ffffffffc0204e94:	84aa                	mv	s1,a0
ffffffffc0204e96:	f149                	bnez	a0,ffffffffc0204e18 <file_seek+0x56>
ffffffffc0204e98:	67e2                	ld	a5,24(sp)
ffffffffc0204e9a:	993e                	add	s2,s2,a5
ffffffffc0204e9c:	bf59                	j	ffffffffc0204e32 <file_seek+0x70>
ffffffffc0204e9e:	8d5ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204ea2:	00008697          	auipc	a3,0x8
ffffffffc0204ea6:	6f668693          	addi	a3,a3,1782 # ffffffffc020d598 <default_pmm_manager+0xdf8>
ffffffffc0204eaa:	00007617          	auipc	a2,0x7
ffffffffc0204eae:	e0e60613          	addi	a2,a2,-498 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204eb2:	11a00593          	li	a1,282
ffffffffc0204eb6:	00008517          	auipc	a0,0x8
ffffffffc0204eba:	4a250513          	addi	a0,a0,1186 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc0204ebe:	de0fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204ec2:	00008697          	auipc	a3,0x8
ffffffffc0204ec6:	5ce68693          	addi	a3,a3,1486 # ffffffffc020d490 <default_pmm_manager+0xcf0>
ffffffffc0204eca:	00007617          	auipc	a2,0x7
ffffffffc0204ece:	dee60613          	addi	a2,a2,-530 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204ed2:	11200593          	li	a1,274
ffffffffc0204ed6:	00008517          	auipc	a0,0x8
ffffffffc0204eda:	48250513          	addi	a0,a0,1154 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc0204ede:	dc0fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204ee2 <file_fstat>:
ffffffffc0204ee2:	1101                	addi	sp,sp,-32
ffffffffc0204ee4:	ec06                	sd	ra,24(sp)
ffffffffc0204ee6:	e822                	sd	s0,16(sp)
ffffffffc0204ee8:	e426                	sd	s1,8(sp)
ffffffffc0204eea:	e04a                	sd	s2,0(sp)
ffffffffc0204eec:	04700793          	li	a5,71
ffffffffc0204ef0:	06a7ef63          	bltu	a5,a0,ffffffffc0204f6e <file_fstat+0x8c>
ffffffffc0204ef4:	00092797          	auipc	a5,0x92
ffffffffc0204ef8:	9cc7b783          	ld	a5,-1588(a5) # ffffffffc02968c0 <current>
ffffffffc0204efc:	1487b783          	ld	a5,328(a5)
ffffffffc0204f00:	cfd9                	beqz	a5,ffffffffc0204f9e <file_fstat+0xbc>
ffffffffc0204f02:	4b98                	lw	a4,16(a5)
ffffffffc0204f04:	08e05d63          	blez	a4,ffffffffc0204f9e <file_fstat+0xbc>
ffffffffc0204f08:	6780                	ld	s0,8(a5)
ffffffffc0204f0a:	00351793          	slli	a5,a0,0x3
ffffffffc0204f0e:	8f89                	sub	a5,a5,a0
ffffffffc0204f10:	078e                	slli	a5,a5,0x3
ffffffffc0204f12:	943e                	add	s0,s0,a5
ffffffffc0204f14:	4018                	lw	a4,0(s0)
ffffffffc0204f16:	4789                	li	a5,2
ffffffffc0204f18:	04f71b63          	bne	a4,a5,ffffffffc0204f6e <file_fstat+0x8c>
ffffffffc0204f1c:	4c1c                	lw	a5,24(s0)
ffffffffc0204f1e:	04a79863          	bne	a5,a0,ffffffffc0204f6e <file_fstat+0x8c>
ffffffffc0204f22:	581c                	lw	a5,48(s0)
ffffffffc0204f24:	02843903          	ld	s2,40(s0)
ffffffffc0204f28:	2785                	addiw	a5,a5,1
ffffffffc0204f2a:	d81c                	sw	a5,48(s0)
ffffffffc0204f2c:	04090963          	beqz	s2,ffffffffc0204f7e <file_fstat+0x9c>
ffffffffc0204f30:	07093783          	ld	a5,112(s2)
ffffffffc0204f34:	c7a9                	beqz	a5,ffffffffc0204f7e <file_fstat+0x9c>
ffffffffc0204f36:	779c                	ld	a5,40(a5)
ffffffffc0204f38:	c3b9                	beqz	a5,ffffffffc0204f7e <file_fstat+0x9c>
ffffffffc0204f3a:	84ae                	mv	s1,a1
ffffffffc0204f3c:	854a                	mv	a0,s2
ffffffffc0204f3e:	00008597          	auipc	a1,0x8
ffffffffc0204f42:	5a258593          	addi	a1,a1,1442 # ffffffffc020d4e0 <default_pmm_manager+0xd40>
ffffffffc0204f46:	45d020ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc0204f4a:	07093783          	ld	a5,112(s2)
ffffffffc0204f4e:	7408                	ld	a0,40(s0)
ffffffffc0204f50:	85a6                	mv	a1,s1
ffffffffc0204f52:	779c                	ld	a5,40(a5)
ffffffffc0204f54:	9782                	jalr	a5
ffffffffc0204f56:	87aa                	mv	a5,a0
ffffffffc0204f58:	8522                	mv	a0,s0
ffffffffc0204f5a:	843e                	mv	s0,a5
ffffffffc0204f5c:	949ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204f60:	60e2                	ld	ra,24(sp)
ffffffffc0204f62:	8522                	mv	a0,s0
ffffffffc0204f64:	6442                	ld	s0,16(sp)
ffffffffc0204f66:	64a2                	ld	s1,8(sp)
ffffffffc0204f68:	6902                	ld	s2,0(sp)
ffffffffc0204f6a:	6105                	addi	sp,sp,32
ffffffffc0204f6c:	8082                	ret
ffffffffc0204f6e:	5475                	li	s0,-3
ffffffffc0204f70:	60e2                	ld	ra,24(sp)
ffffffffc0204f72:	8522                	mv	a0,s0
ffffffffc0204f74:	6442                	ld	s0,16(sp)
ffffffffc0204f76:	64a2                	ld	s1,8(sp)
ffffffffc0204f78:	6902                	ld	s2,0(sp)
ffffffffc0204f7a:	6105                	addi	sp,sp,32
ffffffffc0204f7c:	8082                	ret
ffffffffc0204f7e:	00008697          	auipc	a3,0x8
ffffffffc0204f82:	51268693          	addi	a3,a3,1298 # ffffffffc020d490 <default_pmm_manager+0xcf0>
ffffffffc0204f86:	00007617          	auipc	a2,0x7
ffffffffc0204f8a:	d3260613          	addi	a2,a2,-718 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0204f8e:	12c00593          	li	a1,300
ffffffffc0204f92:	00008517          	auipc	a0,0x8
ffffffffc0204f96:	3c650513          	addi	a0,a0,966 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc0204f9a:	d04fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204f9e:	fd4ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0204fa2 <file_fsync>:
ffffffffc0204fa2:	1101                	addi	sp,sp,-32
ffffffffc0204fa4:	ec06                	sd	ra,24(sp)
ffffffffc0204fa6:	e822                	sd	s0,16(sp)
ffffffffc0204fa8:	e426                	sd	s1,8(sp)
ffffffffc0204faa:	04700793          	li	a5,71
ffffffffc0204fae:	06a7e863          	bltu	a5,a0,ffffffffc020501e <file_fsync+0x7c>
ffffffffc0204fb2:	00092797          	auipc	a5,0x92
ffffffffc0204fb6:	90e7b783          	ld	a5,-1778(a5) # ffffffffc02968c0 <current>
ffffffffc0204fba:	1487b783          	ld	a5,328(a5)
ffffffffc0204fbe:	c7d9                	beqz	a5,ffffffffc020504c <file_fsync+0xaa>
ffffffffc0204fc0:	4b98                	lw	a4,16(a5)
ffffffffc0204fc2:	08e05563          	blez	a4,ffffffffc020504c <file_fsync+0xaa>
ffffffffc0204fc6:	6780                	ld	s0,8(a5)
ffffffffc0204fc8:	00351793          	slli	a5,a0,0x3
ffffffffc0204fcc:	8f89                	sub	a5,a5,a0
ffffffffc0204fce:	078e                	slli	a5,a5,0x3
ffffffffc0204fd0:	943e                	add	s0,s0,a5
ffffffffc0204fd2:	4018                	lw	a4,0(s0)
ffffffffc0204fd4:	4789                	li	a5,2
ffffffffc0204fd6:	04f71463          	bne	a4,a5,ffffffffc020501e <file_fsync+0x7c>
ffffffffc0204fda:	4c1c                	lw	a5,24(s0)
ffffffffc0204fdc:	04a79163          	bne	a5,a0,ffffffffc020501e <file_fsync+0x7c>
ffffffffc0204fe0:	581c                	lw	a5,48(s0)
ffffffffc0204fe2:	7404                	ld	s1,40(s0)
ffffffffc0204fe4:	2785                	addiw	a5,a5,1
ffffffffc0204fe6:	d81c                	sw	a5,48(s0)
ffffffffc0204fe8:	c0b1                	beqz	s1,ffffffffc020502c <file_fsync+0x8a>
ffffffffc0204fea:	78bc                	ld	a5,112(s1)
ffffffffc0204fec:	c3a1                	beqz	a5,ffffffffc020502c <file_fsync+0x8a>
ffffffffc0204fee:	7b9c                	ld	a5,48(a5)
ffffffffc0204ff0:	cf95                	beqz	a5,ffffffffc020502c <file_fsync+0x8a>
ffffffffc0204ff2:	00008597          	auipc	a1,0x8
ffffffffc0204ff6:	64e58593          	addi	a1,a1,1614 # ffffffffc020d640 <default_pmm_manager+0xea0>
ffffffffc0204ffa:	8526                	mv	a0,s1
ffffffffc0204ffc:	3a7020ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc0205000:	78bc                	ld	a5,112(s1)
ffffffffc0205002:	7408                	ld	a0,40(s0)
ffffffffc0205004:	7b9c                	ld	a5,48(a5)
ffffffffc0205006:	9782                	jalr	a5
ffffffffc0205008:	87aa                	mv	a5,a0
ffffffffc020500a:	8522                	mv	a0,s0
ffffffffc020500c:	843e                	mv	s0,a5
ffffffffc020500e:	897ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0205012:	60e2                	ld	ra,24(sp)
ffffffffc0205014:	8522                	mv	a0,s0
ffffffffc0205016:	6442                	ld	s0,16(sp)
ffffffffc0205018:	64a2                	ld	s1,8(sp)
ffffffffc020501a:	6105                	addi	sp,sp,32
ffffffffc020501c:	8082                	ret
ffffffffc020501e:	5475                	li	s0,-3
ffffffffc0205020:	60e2                	ld	ra,24(sp)
ffffffffc0205022:	8522                	mv	a0,s0
ffffffffc0205024:	6442                	ld	s0,16(sp)
ffffffffc0205026:	64a2                	ld	s1,8(sp)
ffffffffc0205028:	6105                	addi	sp,sp,32
ffffffffc020502a:	8082                	ret
ffffffffc020502c:	00008697          	auipc	a3,0x8
ffffffffc0205030:	5c468693          	addi	a3,a3,1476 # ffffffffc020d5f0 <default_pmm_manager+0xe50>
ffffffffc0205034:	00007617          	auipc	a2,0x7
ffffffffc0205038:	c8460613          	addi	a2,a2,-892 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020503c:	13a00593          	li	a1,314
ffffffffc0205040:	00008517          	auipc	a0,0x8
ffffffffc0205044:	31850513          	addi	a0,a0,792 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc0205048:	c56fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020504c:	f26ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0205050 <file_getdirentry>:
ffffffffc0205050:	715d                	addi	sp,sp,-80
ffffffffc0205052:	e486                	sd	ra,72(sp)
ffffffffc0205054:	e0a2                	sd	s0,64(sp)
ffffffffc0205056:	fc26                	sd	s1,56(sp)
ffffffffc0205058:	f84a                	sd	s2,48(sp)
ffffffffc020505a:	f44e                	sd	s3,40(sp)
ffffffffc020505c:	04700793          	li	a5,71
ffffffffc0205060:	0aa7e063          	bltu	a5,a0,ffffffffc0205100 <file_getdirentry+0xb0>
ffffffffc0205064:	00092797          	auipc	a5,0x92
ffffffffc0205068:	85c7b783          	ld	a5,-1956(a5) # ffffffffc02968c0 <current>
ffffffffc020506c:	1487b783          	ld	a5,328(a5)
ffffffffc0205070:	c3e9                	beqz	a5,ffffffffc0205132 <file_getdirentry+0xe2>
ffffffffc0205072:	4b98                	lw	a4,16(a5)
ffffffffc0205074:	0ae05f63          	blez	a4,ffffffffc0205132 <file_getdirentry+0xe2>
ffffffffc0205078:	6780                	ld	s0,8(a5)
ffffffffc020507a:	00351793          	slli	a5,a0,0x3
ffffffffc020507e:	8f89                	sub	a5,a5,a0
ffffffffc0205080:	078e                	slli	a5,a5,0x3
ffffffffc0205082:	943e                	add	s0,s0,a5
ffffffffc0205084:	4018                	lw	a4,0(s0)
ffffffffc0205086:	4789                	li	a5,2
ffffffffc0205088:	06f71c63          	bne	a4,a5,ffffffffc0205100 <file_getdirentry+0xb0>
ffffffffc020508c:	4c1c                	lw	a5,24(s0)
ffffffffc020508e:	06a79963          	bne	a5,a0,ffffffffc0205100 <file_getdirentry+0xb0>
ffffffffc0205092:	581c                	lw	a5,48(s0)
ffffffffc0205094:	6194                	ld	a3,0(a1)
ffffffffc0205096:	84ae                	mv	s1,a1
ffffffffc0205098:	2785                	addiw	a5,a5,1
ffffffffc020509a:	10000613          	li	a2,256
ffffffffc020509e:	d81c                	sw	a5,48(s0)
ffffffffc02050a0:	05a1                	addi	a1,a1,8
ffffffffc02050a2:	850a                	mv	a0,sp
ffffffffc02050a4:	2d2000ef          	jal	ra,ffffffffc0205376 <iobuf_init>
ffffffffc02050a8:	02843983          	ld	s3,40(s0)
ffffffffc02050ac:	892a                	mv	s2,a0
ffffffffc02050ae:	06098263          	beqz	s3,ffffffffc0205112 <file_getdirentry+0xc2>
ffffffffc02050b2:	0709b783          	ld	a5,112(s3) # 1070 <_binary_bin_swap_img_size-0x6c90>
ffffffffc02050b6:	cfb1                	beqz	a5,ffffffffc0205112 <file_getdirentry+0xc2>
ffffffffc02050b8:	63bc                	ld	a5,64(a5)
ffffffffc02050ba:	cfa1                	beqz	a5,ffffffffc0205112 <file_getdirentry+0xc2>
ffffffffc02050bc:	854e                	mv	a0,s3
ffffffffc02050be:	00008597          	auipc	a1,0x8
ffffffffc02050c2:	5e258593          	addi	a1,a1,1506 # ffffffffc020d6a0 <default_pmm_manager+0xf00>
ffffffffc02050c6:	2dd020ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc02050ca:	0709b783          	ld	a5,112(s3)
ffffffffc02050ce:	7408                	ld	a0,40(s0)
ffffffffc02050d0:	85ca                	mv	a1,s2
ffffffffc02050d2:	63bc                	ld	a5,64(a5)
ffffffffc02050d4:	9782                	jalr	a5
ffffffffc02050d6:	89aa                	mv	s3,a0
ffffffffc02050d8:	e909                	bnez	a0,ffffffffc02050ea <file_getdirentry+0x9a>
ffffffffc02050da:	609c                	ld	a5,0(s1)
ffffffffc02050dc:	01093683          	ld	a3,16(s2)
ffffffffc02050e0:	01893703          	ld	a4,24(s2)
ffffffffc02050e4:	97b6                	add	a5,a5,a3
ffffffffc02050e6:	8f99                	sub	a5,a5,a4
ffffffffc02050e8:	e09c                	sd	a5,0(s1)
ffffffffc02050ea:	8522                	mv	a0,s0
ffffffffc02050ec:	fb8ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc02050f0:	60a6                	ld	ra,72(sp)
ffffffffc02050f2:	6406                	ld	s0,64(sp)
ffffffffc02050f4:	74e2                	ld	s1,56(sp)
ffffffffc02050f6:	7942                	ld	s2,48(sp)
ffffffffc02050f8:	854e                	mv	a0,s3
ffffffffc02050fa:	79a2                	ld	s3,40(sp)
ffffffffc02050fc:	6161                	addi	sp,sp,80
ffffffffc02050fe:	8082                	ret
ffffffffc0205100:	60a6                	ld	ra,72(sp)
ffffffffc0205102:	6406                	ld	s0,64(sp)
ffffffffc0205104:	59f5                	li	s3,-3
ffffffffc0205106:	74e2                	ld	s1,56(sp)
ffffffffc0205108:	7942                	ld	s2,48(sp)
ffffffffc020510a:	854e                	mv	a0,s3
ffffffffc020510c:	79a2                	ld	s3,40(sp)
ffffffffc020510e:	6161                	addi	sp,sp,80
ffffffffc0205110:	8082                	ret
ffffffffc0205112:	00008697          	auipc	a3,0x8
ffffffffc0205116:	53668693          	addi	a3,a3,1334 # ffffffffc020d648 <default_pmm_manager+0xea8>
ffffffffc020511a:	00007617          	auipc	a2,0x7
ffffffffc020511e:	b9e60613          	addi	a2,a2,-1122 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0205122:	14a00593          	li	a1,330
ffffffffc0205126:	00008517          	auipc	a0,0x8
ffffffffc020512a:	23250513          	addi	a0,a0,562 # ffffffffc020d358 <default_pmm_manager+0xbb8>
ffffffffc020512e:	b70fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205132:	e40ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0205136 <file_dup>:
ffffffffc0205136:	04700713          	li	a4,71
ffffffffc020513a:	06a76463          	bltu	a4,a0,ffffffffc02051a2 <file_dup+0x6c>
ffffffffc020513e:	00091717          	auipc	a4,0x91
ffffffffc0205142:	78273703          	ld	a4,1922(a4) # ffffffffc02968c0 <current>
ffffffffc0205146:	14873703          	ld	a4,328(a4)
ffffffffc020514a:	1101                	addi	sp,sp,-32
ffffffffc020514c:	ec06                	sd	ra,24(sp)
ffffffffc020514e:	e822                	sd	s0,16(sp)
ffffffffc0205150:	cb39                	beqz	a4,ffffffffc02051a6 <file_dup+0x70>
ffffffffc0205152:	4b14                	lw	a3,16(a4)
ffffffffc0205154:	04d05963          	blez	a3,ffffffffc02051a6 <file_dup+0x70>
ffffffffc0205158:	6700                	ld	s0,8(a4)
ffffffffc020515a:	00351713          	slli	a4,a0,0x3
ffffffffc020515e:	8f09                	sub	a4,a4,a0
ffffffffc0205160:	070e                	slli	a4,a4,0x3
ffffffffc0205162:	943a                	add	s0,s0,a4
ffffffffc0205164:	4014                	lw	a3,0(s0)
ffffffffc0205166:	4709                	li	a4,2
ffffffffc0205168:	02e69863          	bne	a3,a4,ffffffffc0205198 <file_dup+0x62>
ffffffffc020516c:	4c18                	lw	a4,24(s0)
ffffffffc020516e:	02a71563          	bne	a4,a0,ffffffffc0205198 <file_dup+0x62>
ffffffffc0205172:	852e                	mv	a0,a1
ffffffffc0205174:	002c                	addi	a1,sp,8
ffffffffc0205176:	e1eff0ef          	jal	ra,ffffffffc0204794 <fd_array_alloc>
ffffffffc020517a:	c509                	beqz	a0,ffffffffc0205184 <file_dup+0x4e>
ffffffffc020517c:	60e2                	ld	ra,24(sp)
ffffffffc020517e:	6442                	ld	s0,16(sp)
ffffffffc0205180:	6105                	addi	sp,sp,32
ffffffffc0205182:	8082                	ret
ffffffffc0205184:	6522                	ld	a0,8(sp)
ffffffffc0205186:	85a2                	mv	a1,s0
ffffffffc0205188:	845ff0ef          	jal	ra,ffffffffc02049cc <fd_array_dup>
ffffffffc020518c:	67a2                	ld	a5,8(sp)
ffffffffc020518e:	60e2                	ld	ra,24(sp)
ffffffffc0205190:	6442                	ld	s0,16(sp)
ffffffffc0205192:	4f88                	lw	a0,24(a5)
ffffffffc0205194:	6105                	addi	sp,sp,32
ffffffffc0205196:	8082                	ret
ffffffffc0205198:	60e2                	ld	ra,24(sp)
ffffffffc020519a:	6442                	ld	s0,16(sp)
ffffffffc020519c:	5575                	li	a0,-3
ffffffffc020519e:	6105                	addi	sp,sp,32
ffffffffc02051a0:	8082                	ret
ffffffffc02051a2:	5575                	li	a0,-3
ffffffffc02051a4:	8082                	ret
ffffffffc02051a6:	dccff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc02051aa <fs_init>:
ffffffffc02051aa:	1141                	addi	sp,sp,-16
ffffffffc02051ac:	e406                	sd	ra,8(sp)
ffffffffc02051ae:	413020ef          	jal	ra,ffffffffc0207dc0 <vfs_init>
ffffffffc02051b2:	0eb030ef          	jal	ra,ffffffffc0208a9c <dev_init>
ffffffffc02051b6:	60a2                	ld	ra,8(sp)
ffffffffc02051b8:	0141                	addi	sp,sp,16
ffffffffc02051ba:	23a0406f          	j	ffffffffc02093f4 <sfs_init>

ffffffffc02051be <fs_cleanup>:
ffffffffc02051be:	6550206f          	j	ffffffffc0208012 <vfs_cleanup>

ffffffffc02051c2 <lock_files>:
ffffffffc02051c2:	0561                	addi	a0,a0,24
ffffffffc02051c4:	ba0ff06f          	j	ffffffffc0204564 <down>

ffffffffc02051c8 <unlock_files>:
ffffffffc02051c8:	0561                	addi	a0,a0,24
ffffffffc02051ca:	b96ff06f          	j	ffffffffc0204560 <up>

ffffffffc02051ce <files_create>:
ffffffffc02051ce:	1141                	addi	sp,sp,-16
ffffffffc02051d0:	6505                	lui	a0,0x1
ffffffffc02051d2:	e022                	sd	s0,0(sp)
ffffffffc02051d4:	e406                	sd	ra,8(sp)
ffffffffc02051d6:	db9fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02051da:	842a                	mv	s0,a0
ffffffffc02051dc:	cd19                	beqz	a0,ffffffffc02051fa <files_create+0x2c>
ffffffffc02051de:	03050793          	addi	a5,a0,48 # 1030 <_binary_bin_swap_img_size-0x6cd0>
ffffffffc02051e2:	00043023          	sd	zero,0(s0)
ffffffffc02051e6:	0561                	addi	a0,a0,24
ffffffffc02051e8:	e41c                	sd	a5,8(s0)
ffffffffc02051ea:	00042823          	sw	zero,16(s0)
ffffffffc02051ee:	4585                	li	a1,1
ffffffffc02051f0:	b6aff0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc02051f4:	6408                	ld	a0,8(s0)
ffffffffc02051f6:	f3cff0ef          	jal	ra,ffffffffc0204932 <fd_array_init>
ffffffffc02051fa:	60a2                	ld	ra,8(sp)
ffffffffc02051fc:	8522                	mv	a0,s0
ffffffffc02051fe:	6402                	ld	s0,0(sp)
ffffffffc0205200:	0141                	addi	sp,sp,16
ffffffffc0205202:	8082                	ret

ffffffffc0205204 <files_destroy>:
ffffffffc0205204:	7179                	addi	sp,sp,-48
ffffffffc0205206:	f406                	sd	ra,40(sp)
ffffffffc0205208:	f022                	sd	s0,32(sp)
ffffffffc020520a:	ec26                	sd	s1,24(sp)
ffffffffc020520c:	e84a                	sd	s2,16(sp)
ffffffffc020520e:	e44e                	sd	s3,8(sp)
ffffffffc0205210:	c52d                	beqz	a0,ffffffffc020527a <files_destroy+0x76>
ffffffffc0205212:	491c                	lw	a5,16(a0)
ffffffffc0205214:	89aa                	mv	s3,a0
ffffffffc0205216:	e3b5                	bnez	a5,ffffffffc020527a <files_destroy+0x76>
ffffffffc0205218:	6108                	ld	a0,0(a0)
ffffffffc020521a:	c119                	beqz	a0,ffffffffc0205220 <files_destroy+0x1c>
ffffffffc020521c:	23d020ef          	jal	ra,ffffffffc0207c58 <inode_ref_dec>
ffffffffc0205220:	0089b403          	ld	s0,8(s3)
ffffffffc0205224:	6485                	lui	s1,0x1
ffffffffc0205226:	fc048493          	addi	s1,s1,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc020522a:	94a2                	add	s1,s1,s0
ffffffffc020522c:	4909                	li	s2,2
ffffffffc020522e:	401c                	lw	a5,0(s0)
ffffffffc0205230:	03278063          	beq	a5,s2,ffffffffc0205250 <files_destroy+0x4c>
ffffffffc0205234:	e39d                	bnez	a5,ffffffffc020525a <files_destroy+0x56>
ffffffffc0205236:	03840413          	addi	s0,s0,56
ffffffffc020523a:	fe849ae3          	bne	s1,s0,ffffffffc020522e <files_destroy+0x2a>
ffffffffc020523e:	7402                	ld	s0,32(sp)
ffffffffc0205240:	70a2                	ld	ra,40(sp)
ffffffffc0205242:	64e2                	ld	s1,24(sp)
ffffffffc0205244:	6942                	ld	s2,16(sp)
ffffffffc0205246:	854e                	mv	a0,s3
ffffffffc0205248:	69a2                	ld	s3,8(sp)
ffffffffc020524a:	6145                	addi	sp,sp,48
ffffffffc020524c:	df3fc06f          	j	ffffffffc020203e <kfree>
ffffffffc0205250:	8522                	mv	a0,s0
ffffffffc0205252:	efcff0ef          	jal	ra,ffffffffc020494e <fd_array_close>
ffffffffc0205256:	401c                	lw	a5,0(s0)
ffffffffc0205258:	bff1                	j	ffffffffc0205234 <files_destroy+0x30>
ffffffffc020525a:	00008697          	auipc	a3,0x8
ffffffffc020525e:	4c668693          	addi	a3,a3,1222 # ffffffffc020d720 <CSWTCH.79+0x58>
ffffffffc0205262:	00007617          	auipc	a2,0x7
ffffffffc0205266:	a5660613          	addi	a2,a2,-1450 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020526a:	03d00593          	li	a1,61
ffffffffc020526e:	00008517          	auipc	a0,0x8
ffffffffc0205272:	4a250513          	addi	a0,a0,1186 # ffffffffc020d710 <CSWTCH.79+0x48>
ffffffffc0205276:	a28fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020527a:	00008697          	auipc	a3,0x8
ffffffffc020527e:	46668693          	addi	a3,a3,1126 # ffffffffc020d6e0 <CSWTCH.79+0x18>
ffffffffc0205282:	00007617          	auipc	a2,0x7
ffffffffc0205286:	a3660613          	addi	a2,a2,-1482 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020528a:	03300593          	li	a1,51
ffffffffc020528e:	00008517          	auipc	a0,0x8
ffffffffc0205292:	48250513          	addi	a0,a0,1154 # ffffffffc020d710 <CSWTCH.79+0x48>
ffffffffc0205296:	a08fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020529a <dup_files>:
ffffffffc020529a:	7179                	addi	sp,sp,-48
ffffffffc020529c:	f406                	sd	ra,40(sp)
ffffffffc020529e:	f022                	sd	s0,32(sp)
ffffffffc02052a0:	ec26                	sd	s1,24(sp)
ffffffffc02052a2:	e84a                	sd	s2,16(sp)
ffffffffc02052a4:	e44e                	sd	s3,8(sp)
ffffffffc02052a6:	e052                	sd	s4,0(sp)
ffffffffc02052a8:	c52d                	beqz	a0,ffffffffc0205312 <dup_files+0x78>
ffffffffc02052aa:	842e                	mv	s0,a1
ffffffffc02052ac:	c1bd                	beqz	a1,ffffffffc0205312 <dup_files+0x78>
ffffffffc02052ae:	491c                	lw	a5,16(a0)
ffffffffc02052b0:	84aa                	mv	s1,a0
ffffffffc02052b2:	e3c1                	bnez	a5,ffffffffc0205332 <dup_files+0x98>
ffffffffc02052b4:	499c                	lw	a5,16(a1)
ffffffffc02052b6:	06f05e63          	blez	a5,ffffffffc0205332 <dup_files+0x98>
ffffffffc02052ba:	6188                	ld	a0,0(a1)
ffffffffc02052bc:	e088                	sd	a0,0(s1)
ffffffffc02052be:	c119                	beqz	a0,ffffffffc02052c4 <dup_files+0x2a>
ffffffffc02052c0:	0cb020ef          	jal	ra,ffffffffc0207b8a <inode_ref_inc>
ffffffffc02052c4:	6400                	ld	s0,8(s0)
ffffffffc02052c6:	6905                	lui	s2,0x1
ffffffffc02052c8:	fc090913          	addi	s2,s2,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc02052cc:	6484                	ld	s1,8(s1)
ffffffffc02052ce:	9922                	add	s2,s2,s0
ffffffffc02052d0:	4989                	li	s3,2
ffffffffc02052d2:	4a05                	li	s4,1
ffffffffc02052d4:	a039                	j	ffffffffc02052e2 <dup_files+0x48>
ffffffffc02052d6:	03840413          	addi	s0,s0,56
ffffffffc02052da:	03848493          	addi	s1,s1,56
ffffffffc02052de:	02890163          	beq	s2,s0,ffffffffc0205300 <dup_files+0x66>
ffffffffc02052e2:	401c                	lw	a5,0(s0)
ffffffffc02052e4:	ff3799e3          	bne	a5,s3,ffffffffc02052d6 <dup_files+0x3c>
ffffffffc02052e8:	0144a023          	sw	s4,0(s1)
ffffffffc02052ec:	85a2                	mv	a1,s0
ffffffffc02052ee:	8526                	mv	a0,s1
ffffffffc02052f0:	03840413          	addi	s0,s0,56
ffffffffc02052f4:	ed8ff0ef          	jal	ra,ffffffffc02049cc <fd_array_dup>
ffffffffc02052f8:	03848493          	addi	s1,s1,56
ffffffffc02052fc:	fe8913e3          	bne	s2,s0,ffffffffc02052e2 <dup_files+0x48>
ffffffffc0205300:	70a2                	ld	ra,40(sp)
ffffffffc0205302:	7402                	ld	s0,32(sp)
ffffffffc0205304:	64e2                	ld	s1,24(sp)
ffffffffc0205306:	6942                	ld	s2,16(sp)
ffffffffc0205308:	69a2                	ld	s3,8(sp)
ffffffffc020530a:	6a02                	ld	s4,0(sp)
ffffffffc020530c:	4501                	li	a0,0
ffffffffc020530e:	6145                	addi	sp,sp,48
ffffffffc0205310:	8082                	ret
ffffffffc0205312:	00008697          	auipc	a3,0x8
ffffffffc0205316:	d6668693          	addi	a3,a3,-666 # ffffffffc020d078 <default_pmm_manager+0x8d8>
ffffffffc020531a:	00007617          	auipc	a2,0x7
ffffffffc020531e:	99e60613          	addi	a2,a2,-1634 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0205322:	05300593          	li	a1,83
ffffffffc0205326:	00008517          	auipc	a0,0x8
ffffffffc020532a:	3ea50513          	addi	a0,a0,1002 # ffffffffc020d710 <CSWTCH.79+0x48>
ffffffffc020532e:	970fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205332:	00008697          	auipc	a3,0x8
ffffffffc0205336:	40668693          	addi	a3,a3,1030 # ffffffffc020d738 <CSWTCH.79+0x70>
ffffffffc020533a:	00007617          	auipc	a2,0x7
ffffffffc020533e:	97e60613          	addi	a2,a2,-1666 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0205342:	05400593          	li	a1,84
ffffffffc0205346:	00008517          	auipc	a0,0x8
ffffffffc020534a:	3ca50513          	addi	a0,a0,970 # ffffffffc020d710 <CSWTCH.79+0x48>
ffffffffc020534e:	950fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205352 <iobuf_skip.part.0>:
ffffffffc0205352:	1141                	addi	sp,sp,-16
ffffffffc0205354:	00008697          	auipc	a3,0x8
ffffffffc0205358:	41468693          	addi	a3,a3,1044 # ffffffffc020d768 <CSWTCH.79+0xa0>
ffffffffc020535c:	00007617          	auipc	a2,0x7
ffffffffc0205360:	95c60613          	addi	a2,a2,-1700 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0205364:	04a00593          	li	a1,74
ffffffffc0205368:	00008517          	auipc	a0,0x8
ffffffffc020536c:	41850513          	addi	a0,a0,1048 # ffffffffc020d780 <CSWTCH.79+0xb8>
ffffffffc0205370:	e406                	sd	ra,8(sp)
ffffffffc0205372:	92cfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205376 <iobuf_init>:
ffffffffc0205376:	e10c                	sd	a1,0(a0)
ffffffffc0205378:	e514                	sd	a3,8(a0)
ffffffffc020537a:	ed10                	sd	a2,24(a0)
ffffffffc020537c:	e910                	sd	a2,16(a0)
ffffffffc020537e:	8082                	ret

ffffffffc0205380 <iobuf_move>:
ffffffffc0205380:	7179                	addi	sp,sp,-48
ffffffffc0205382:	ec26                	sd	s1,24(sp)
ffffffffc0205384:	6d04                	ld	s1,24(a0)
ffffffffc0205386:	f022                	sd	s0,32(sp)
ffffffffc0205388:	e84a                	sd	s2,16(sp)
ffffffffc020538a:	e44e                	sd	s3,8(sp)
ffffffffc020538c:	f406                	sd	ra,40(sp)
ffffffffc020538e:	842a                	mv	s0,a0
ffffffffc0205390:	8932                	mv	s2,a2
ffffffffc0205392:	852e                	mv	a0,a1
ffffffffc0205394:	89ba                	mv	s3,a4
ffffffffc0205396:	00967363          	bgeu	a2,s1,ffffffffc020539c <iobuf_move+0x1c>
ffffffffc020539a:	84b2                	mv	s1,a2
ffffffffc020539c:	c495                	beqz	s1,ffffffffc02053c8 <iobuf_move+0x48>
ffffffffc020539e:	600c                	ld	a1,0(s0)
ffffffffc02053a0:	c681                	beqz	a3,ffffffffc02053a8 <iobuf_move+0x28>
ffffffffc02053a2:	87ae                	mv	a5,a1
ffffffffc02053a4:	85aa                	mv	a1,a0
ffffffffc02053a6:	853e                	mv	a0,a5
ffffffffc02053a8:	8626                	mv	a2,s1
ffffffffc02053aa:	43c060ef          	jal	ra,ffffffffc020b7e6 <memmove>
ffffffffc02053ae:	6c1c                	ld	a5,24(s0)
ffffffffc02053b0:	0297ea63          	bltu	a5,s1,ffffffffc02053e4 <iobuf_move+0x64>
ffffffffc02053b4:	6014                	ld	a3,0(s0)
ffffffffc02053b6:	6418                	ld	a4,8(s0)
ffffffffc02053b8:	8f85                	sub	a5,a5,s1
ffffffffc02053ba:	96a6                	add	a3,a3,s1
ffffffffc02053bc:	9726                	add	a4,a4,s1
ffffffffc02053be:	e014                	sd	a3,0(s0)
ffffffffc02053c0:	e418                	sd	a4,8(s0)
ffffffffc02053c2:	ec1c                	sd	a5,24(s0)
ffffffffc02053c4:	40990933          	sub	s2,s2,s1
ffffffffc02053c8:	00098463          	beqz	s3,ffffffffc02053d0 <iobuf_move+0x50>
ffffffffc02053cc:	0099b023          	sd	s1,0(s3)
ffffffffc02053d0:	4501                	li	a0,0
ffffffffc02053d2:	00091b63          	bnez	s2,ffffffffc02053e8 <iobuf_move+0x68>
ffffffffc02053d6:	70a2                	ld	ra,40(sp)
ffffffffc02053d8:	7402                	ld	s0,32(sp)
ffffffffc02053da:	64e2                	ld	s1,24(sp)
ffffffffc02053dc:	6942                	ld	s2,16(sp)
ffffffffc02053de:	69a2                	ld	s3,8(sp)
ffffffffc02053e0:	6145                	addi	sp,sp,48
ffffffffc02053e2:	8082                	ret
ffffffffc02053e4:	f6fff0ef          	jal	ra,ffffffffc0205352 <iobuf_skip.part.0>
ffffffffc02053e8:	5571                	li	a0,-4
ffffffffc02053ea:	b7f5                	j	ffffffffc02053d6 <iobuf_move+0x56>

ffffffffc02053ec <iobuf_skip>:
ffffffffc02053ec:	6d1c                	ld	a5,24(a0)
ffffffffc02053ee:	00b7eb63          	bltu	a5,a1,ffffffffc0205404 <iobuf_skip+0x18>
ffffffffc02053f2:	6114                	ld	a3,0(a0)
ffffffffc02053f4:	6518                	ld	a4,8(a0)
ffffffffc02053f6:	8f8d                	sub	a5,a5,a1
ffffffffc02053f8:	96ae                	add	a3,a3,a1
ffffffffc02053fa:	95ba                	add	a1,a1,a4
ffffffffc02053fc:	e114                	sd	a3,0(a0)
ffffffffc02053fe:	e50c                	sd	a1,8(a0)
ffffffffc0205400:	ed1c                	sd	a5,24(a0)
ffffffffc0205402:	8082                	ret
ffffffffc0205404:	1141                	addi	sp,sp,-16
ffffffffc0205406:	e406                	sd	ra,8(sp)
ffffffffc0205408:	f4bff0ef          	jal	ra,ffffffffc0205352 <iobuf_skip.part.0>

ffffffffc020540c <copy_path>:
ffffffffc020540c:	7139                	addi	sp,sp,-64
ffffffffc020540e:	f04a                	sd	s2,32(sp)
ffffffffc0205410:	00091917          	auipc	s2,0x91
ffffffffc0205414:	4b090913          	addi	s2,s2,1200 # ffffffffc02968c0 <current>
ffffffffc0205418:	00093703          	ld	a4,0(s2)
ffffffffc020541c:	ec4e                	sd	s3,24(sp)
ffffffffc020541e:	89aa                	mv	s3,a0
ffffffffc0205420:	6505                	lui	a0,0x1
ffffffffc0205422:	f426                	sd	s1,40(sp)
ffffffffc0205424:	e852                	sd	s4,16(sp)
ffffffffc0205426:	fc06                	sd	ra,56(sp)
ffffffffc0205428:	f822                	sd	s0,48(sp)
ffffffffc020542a:	e456                	sd	s5,8(sp)
ffffffffc020542c:	02873a03          	ld	s4,40(a4)
ffffffffc0205430:	84ae                	mv	s1,a1
ffffffffc0205432:	b5dfc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0205436:	c141                	beqz	a0,ffffffffc02054b6 <copy_path+0xaa>
ffffffffc0205438:	842a                	mv	s0,a0
ffffffffc020543a:	040a0563          	beqz	s4,ffffffffc0205484 <copy_path+0x78>
ffffffffc020543e:	038a0a93          	addi	s5,s4,56
ffffffffc0205442:	8556                	mv	a0,s5
ffffffffc0205444:	920ff0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0205448:	00093783          	ld	a5,0(s2)
ffffffffc020544c:	cba1                	beqz	a5,ffffffffc020549c <copy_path+0x90>
ffffffffc020544e:	43dc                	lw	a5,4(a5)
ffffffffc0205450:	6685                	lui	a3,0x1
ffffffffc0205452:	8626                	mv	a2,s1
ffffffffc0205454:	04fa2823          	sw	a5,80(s4)
ffffffffc0205458:	85a2                	mv	a1,s0
ffffffffc020545a:	8552                	mv	a0,s4
ffffffffc020545c:	f31fe0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc0205460:	c529                	beqz	a0,ffffffffc02054aa <copy_path+0x9e>
ffffffffc0205462:	8556                	mv	a0,s5
ffffffffc0205464:	8fcff0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205468:	040a2823          	sw	zero,80(s4)
ffffffffc020546c:	0089b023          	sd	s0,0(s3)
ffffffffc0205470:	4501                	li	a0,0
ffffffffc0205472:	70e2                	ld	ra,56(sp)
ffffffffc0205474:	7442                	ld	s0,48(sp)
ffffffffc0205476:	74a2                	ld	s1,40(sp)
ffffffffc0205478:	7902                	ld	s2,32(sp)
ffffffffc020547a:	69e2                	ld	s3,24(sp)
ffffffffc020547c:	6a42                	ld	s4,16(sp)
ffffffffc020547e:	6aa2                	ld	s5,8(sp)
ffffffffc0205480:	6121                	addi	sp,sp,64
ffffffffc0205482:	8082                	ret
ffffffffc0205484:	85aa                	mv	a1,a0
ffffffffc0205486:	6685                	lui	a3,0x1
ffffffffc0205488:	8626                	mv	a2,s1
ffffffffc020548a:	4501                	li	a0,0
ffffffffc020548c:	f01fe0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc0205490:	fd71                	bnez	a0,ffffffffc020546c <copy_path+0x60>
ffffffffc0205492:	8522                	mv	a0,s0
ffffffffc0205494:	babfc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205498:	5575                	li	a0,-3
ffffffffc020549a:	bfe1                	j	ffffffffc0205472 <copy_path+0x66>
ffffffffc020549c:	6685                	lui	a3,0x1
ffffffffc020549e:	8626                	mv	a2,s1
ffffffffc02054a0:	85a2                	mv	a1,s0
ffffffffc02054a2:	8552                	mv	a0,s4
ffffffffc02054a4:	ee9fe0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc02054a8:	fd4d                	bnez	a0,ffffffffc0205462 <copy_path+0x56>
ffffffffc02054aa:	8556                	mv	a0,s5
ffffffffc02054ac:	8b4ff0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02054b0:	040a2823          	sw	zero,80(s4)
ffffffffc02054b4:	bff9                	j	ffffffffc0205492 <copy_path+0x86>
ffffffffc02054b6:	5571                	li	a0,-4
ffffffffc02054b8:	bf6d                	j	ffffffffc0205472 <copy_path+0x66>

ffffffffc02054ba <sysfile_open>:
ffffffffc02054ba:	7179                	addi	sp,sp,-48
ffffffffc02054bc:	872a                	mv	a4,a0
ffffffffc02054be:	ec26                	sd	s1,24(sp)
ffffffffc02054c0:	0028                	addi	a0,sp,8
ffffffffc02054c2:	84ae                	mv	s1,a1
ffffffffc02054c4:	85ba                	mv	a1,a4
ffffffffc02054c6:	f022                	sd	s0,32(sp)
ffffffffc02054c8:	f406                	sd	ra,40(sp)
ffffffffc02054ca:	f43ff0ef          	jal	ra,ffffffffc020540c <copy_path>
ffffffffc02054ce:	842a                	mv	s0,a0
ffffffffc02054d0:	e909                	bnez	a0,ffffffffc02054e2 <sysfile_open+0x28>
ffffffffc02054d2:	6522                	ld	a0,8(sp)
ffffffffc02054d4:	85a6                	mv	a1,s1
ffffffffc02054d6:	dccff0ef          	jal	ra,ffffffffc0204aa2 <file_open>
ffffffffc02054da:	842a                	mv	s0,a0
ffffffffc02054dc:	6522                	ld	a0,8(sp)
ffffffffc02054de:	b61fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02054e2:	70a2                	ld	ra,40(sp)
ffffffffc02054e4:	8522                	mv	a0,s0
ffffffffc02054e6:	7402                	ld	s0,32(sp)
ffffffffc02054e8:	64e2                	ld	s1,24(sp)
ffffffffc02054ea:	6145                	addi	sp,sp,48
ffffffffc02054ec:	8082                	ret

ffffffffc02054ee <sysfile_close>:
ffffffffc02054ee:	eb2ff06f          	j	ffffffffc0204ba0 <file_close>

ffffffffc02054f2 <sysfile_read>:
ffffffffc02054f2:	7159                	addi	sp,sp,-112
ffffffffc02054f4:	f0a2                	sd	s0,96(sp)
ffffffffc02054f6:	f486                	sd	ra,104(sp)
ffffffffc02054f8:	eca6                	sd	s1,88(sp)
ffffffffc02054fa:	e8ca                	sd	s2,80(sp)
ffffffffc02054fc:	e4ce                	sd	s3,72(sp)
ffffffffc02054fe:	e0d2                	sd	s4,64(sp)
ffffffffc0205500:	fc56                	sd	s5,56(sp)
ffffffffc0205502:	f85a                	sd	s6,48(sp)
ffffffffc0205504:	f45e                	sd	s7,40(sp)
ffffffffc0205506:	f062                	sd	s8,32(sp)
ffffffffc0205508:	ec66                	sd	s9,24(sp)
ffffffffc020550a:	4401                	li	s0,0
ffffffffc020550c:	ee19                	bnez	a2,ffffffffc020552a <sysfile_read+0x38>
ffffffffc020550e:	70a6                	ld	ra,104(sp)
ffffffffc0205510:	8522                	mv	a0,s0
ffffffffc0205512:	7406                	ld	s0,96(sp)
ffffffffc0205514:	64e6                	ld	s1,88(sp)
ffffffffc0205516:	6946                	ld	s2,80(sp)
ffffffffc0205518:	69a6                	ld	s3,72(sp)
ffffffffc020551a:	6a06                	ld	s4,64(sp)
ffffffffc020551c:	7ae2                	ld	s5,56(sp)
ffffffffc020551e:	7b42                	ld	s6,48(sp)
ffffffffc0205520:	7ba2                	ld	s7,40(sp)
ffffffffc0205522:	7c02                	ld	s8,32(sp)
ffffffffc0205524:	6ce2                	ld	s9,24(sp)
ffffffffc0205526:	6165                	addi	sp,sp,112
ffffffffc0205528:	8082                	ret
ffffffffc020552a:	00091c97          	auipc	s9,0x91
ffffffffc020552e:	396c8c93          	addi	s9,s9,918 # ffffffffc02968c0 <current>
ffffffffc0205532:	000cb783          	ld	a5,0(s9)
ffffffffc0205536:	84b2                	mv	s1,a2
ffffffffc0205538:	8b2e                	mv	s6,a1
ffffffffc020553a:	4601                	li	a2,0
ffffffffc020553c:	4585                	li	a1,1
ffffffffc020553e:	0287b903          	ld	s2,40(a5)
ffffffffc0205542:	8aaa                	mv	s5,a0
ffffffffc0205544:	d0aff0ef          	jal	ra,ffffffffc0204a4e <file_testfd>
ffffffffc0205548:	c959                	beqz	a0,ffffffffc02055de <sysfile_read+0xec>
ffffffffc020554a:	6505                	lui	a0,0x1
ffffffffc020554c:	a43fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0205550:	89aa                	mv	s3,a0
ffffffffc0205552:	c941                	beqz	a0,ffffffffc02055e2 <sysfile_read+0xf0>
ffffffffc0205554:	4b81                	li	s7,0
ffffffffc0205556:	6a05                	lui	s4,0x1
ffffffffc0205558:	03890c13          	addi	s8,s2,56
ffffffffc020555c:	0744ec63          	bltu	s1,s4,ffffffffc02055d4 <sysfile_read+0xe2>
ffffffffc0205560:	e452                	sd	s4,8(sp)
ffffffffc0205562:	6605                	lui	a2,0x1
ffffffffc0205564:	0034                	addi	a3,sp,8
ffffffffc0205566:	85ce                	mv	a1,s3
ffffffffc0205568:	8556                	mv	a0,s5
ffffffffc020556a:	e8cff0ef          	jal	ra,ffffffffc0204bf6 <file_read>
ffffffffc020556e:	66a2                	ld	a3,8(sp)
ffffffffc0205570:	842a                	mv	s0,a0
ffffffffc0205572:	ca9d                	beqz	a3,ffffffffc02055a8 <sysfile_read+0xb6>
ffffffffc0205574:	00090c63          	beqz	s2,ffffffffc020558c <sysfile_read+0x9a>
ffffffffc0205578:	8562                	mv	a0,s8
ffffffffc020557a:	febfe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020557e:	000cb783          	ld	a5,0(s9)
ffffffffc0205582:	cfa1                	beqz	a5,ffffffffc02055da <sysfile_read+0xe8>
ffffffffc0205584:	43dc                	lw	a5,4(a5)
ffffffffc0205586:	66a2                	ld	a3,8(sp)
ffffffffc0205588:	04f92823          	sw	a5,80(s2)
ffffffffc020558c:	864e                	mv	a2,s3
ffffffffc020558e:	85da                	mv	a1,s6
ffffffffc0205590:	854a                	mv	a0,s2
ffffffffc0205592:	dc9fe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc0205596:	c50d                	beqz	a0,ffffffffc02055c0 <sysfile_read+0xce>
ffffffffc0205598:	67a2                	ld	a5,8(sp)
ffffffffc020559a:	04f4e663          	bltu	s1,a5,ffffffffc02055e6 <sysfile_read+0xf4>
ffffffffc020559e:	9b3e                	add	s6,s6,a5
ffffffffc02055a0:	8c9d                	sub	s1,s1,a5
ffffffffc02055a2:	9bbe                	add	s7,s7,a5
ffffffffc02055a4:	02091263          	bnez	s2,ffffffffc02055c8 <sysfile_read+0xd6>
ffffffffc02055a8:	e401                	bnez	s0,ffffffffc02055b0 <sysfile_read+0xbe>
ffffffffc02055aa:	67a2                	ld	a5,8(sp)
ffffffffc02055ac:	c391                	beqz	a5,ffffffffc02055b0 <sysfile_read+0xbe>
ffffffffc02055ae:	f4dd                	bnez	s1,ffffffffc020555c <sysfile_read+0x6a>
ffffffffc02055b0:	854e                	mv	a0,s3
ffffffffc02055b2:	a8dfc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02055b6:	f40b8ce3          	beqz	s7,ffffffffc020550e <sysfile_read+0x1c>
ffffffffc02055ba:	000b841b          	sext.w	s0,s7
ffffffffc02055be:	bf81                	j	ffffffffc020550e <sysfile_read+0x1c>
ffffffffc02055c0:	e011                	bnez	s0,ffffffffc02055c4 <sysfile_read+0xd2>
ffffffffc02055c2:	5475                	li	s0,-3
ffffffffc02055c4:	fe0906e3          	beqz	s2,ffffffffc02055b0 <sysfile_read+0xbe>
ffffffffc02055c8:	8562                	mv	a0,s8
ffffffffc02055ca:	f97fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02055ce:	04092823          	sw	zero,80(s2)
ffffffffc02055d2:	bfd9                	j	ffffffffc02055a8 <sysfile_read+0xb6>
ffffffffc02055d4:	e426                	sd	s1,8(sp)
ffffffffc02055d6:	8626                	mv	a2,s1
ffffffffc02055d8:	b771                	j	ffffffffc0205564 <sysfile_read+0x72>
ffffffffc02055da:	66a2                	ld	a3,8(sp)
ffffffffc02055dc:	bf45                	j	ffffffffc020558c <sysfile_read+0x9a>
ffffffffc02055de:	5475                	li	s0,-3
ffffffffc02055e0:	b73d                	j	ffffffffc020550e <sysfile_read+0x1c>
ffffffffc02055e2:	5471                	li	s0,-4
ffffffffc02055e4:	b72d                	j	ffffffffc020550e <sysfile_read+0x1c>
ffffffffc02055e6:	00008697          	auipc	a3,0x8
ffffffffc02055ea:	1aa68693          	addi	a3,a3,426 # ffffffffc020d790 <CSWTCH.79+0xc8>
ffffffffc02055ee:	00006617          	auipc	a2,0x6
ffffffffc02055f2:	6ca60613          	addi	a2,a2,1738 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02055f6:	05500593          	li	a1,85
ffffffffc02055fa:	00008517          	auipc	a0,0x8
ffffffffc02055fe:	1a650513          	addi	a0,a0,422 # ffffffffc020d7a0 <CSWTCH.79+0xd8>
ffffffffc0205602:	e9dfa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205606 <sysfile_write>:
ffffffffc0205606:	7159                	addi	sp,sp,-112
ffffffffc0205608:	e8ca                	sd	s2,80(sp)
ffffffffc020560a:	f486                	sd	ra,104(sp)
ffffffffc020560c:	f0a2                	sd	s0,96(sp)
ffffffffc020560e:	eca6                	sd	s1,88(sp)
ffffffffc0205610:	e4ce                	sd	s3,72(sp)
ffffffffc0205612:	e0d2                	sd	s4,64(sp)
ffffffffc0205614:	fc56                	sd	s5,56(sp)
ffffffffc0205616:	f85a                	sd	s6,48(sp)
ffffffffc0205618:	f45e                	sd	s7,40(sp)
ffffffffc020561a:	f062                	sd	s8,32(sp)
ffffffffc020561c:	ec66                	sd	s9,24(sp)
ffffffffc020561e:	4901                	li	s2,0
ffffffffc0205620:	ee19                	bnez	a2,ffffffffc020563e <sysfile_write+0x38>
ffffffffc0205622:	70a6                	ld	ra,104(sp)
ffffffffc0205624:	7406                	ld	s0,96(sp)
ffffffffc0205626:	64e6                	ld	s1,88(sp)
ffffffffc0205628:	69a6                	ld	s3,72(sp)
ffffffffc020562a:	6a06                	ld	s4,64(sp)
ffffffffc020562c:	7ae2                	ld	s5,56(sp)
ffffffffc020562e:	7b42                	ld	s6,48(sp)
ffffffffc0205630:	7ba2                	ld	s7,40(sp)
ffffffffc0205632:	7c02                	ld	s8,32(sp)
ffffffffc0205634:	6ce2                	ld	s9,24(sp)
ffffffffc0205636:	854a                	mv	a0,s2
ffffffffc0205638:	6946                	ld	s2,80(sp)
ffffffffc020563a:	6165                	addi	sp,sp,112
ffffffffc020563c:	8082                	ret
ffffffffc020563e:	00091c17          	auipc	s8,0x91
ffffffffc0205642:	282c0c13          	addi	s8,s8,642 # ffffffffc02968c0 <current>
ffffffffc0205646:	000c3783          	ld	a5,0(s8)
ffffffffc020564a:	8432                	mv	s0,a2
ffffffffc020564c:	89ae                	mv	s3,a1
ffffffffc020564e:	4605                	li	a2,1
ffffffffc0205650:	4581                	li	a1,0
ffffffffc0205652:	7784                	ld	s1,40(a5)
ffffffffc0205654:	8baa                	mv	s7,a0
ffffffffc0205656:	bf8ff0ef          	jal	ra,ffffffffc0204a4e <file_testfd>
ffffffffc020565a:	cd59                	beqz	a0,ffffffffc02056f8 <sysfile_write+0xf2>
ffffffffc020565c:	6505                	lui	a0,0x1
ffffffffc020565e:	931fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0205662:	8a2a                	mv	s4,a0
ffffffffc0205664:	cd41                	beqz	a0,ffffffffc02056fc <sysfile_write+0xf6>
ffffffffc0205666:	4c81                	li	s9,0
ffffffffc0205668:	6a85                	lui	s5,0x1
ffffffffc020566a:	03848b13          	addi	s6,s1,56
ffffffffc020566e:	05546a63          	bltu	s0,s5,ffffffffc02056c2 <sysfile_write+0xbc>
ffffffffc0205672:	e456                	sd	s5,8(sp)
ffffffffc0205674:	c8a9                	beqz	s1,ffffffffc02056c6 <sysfile_write+0xc0>
ffffffffc0205676:	855a                	mv	a0,s6
ffffffffc0205678:	eedfe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020567c:	000c3783          	ld	a5,0(s8)
ffffffffc0205680:	c399                	beqz	a5,ffffffffc0205686 <sysfile_write+0x80>
ffffffffc0205682:	43dc                	lw	a5,4(a5)
ffffffffc0205684:	c8bc                	sw	a5,80(s1)
ffffffffc0205686:	66a2                	ld	a3,8(sp)
ffffffffc0205688:	4701                	li	a4,0
ffffffffc020568a:	864e                	mv	a2,s3
ffffffffc020568c:	85d2                	mv	a1,s4
ffffffffc020568e:	8526                	mv	a0,s1
ffffffffc0205690:	c97fe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc0205694:	c139                	beqz	a0,ffffffffc02056da <sysfile_write+0xd4>
ffffffffc0205696:	855a                	mv	a0,s6
ffffffffc0205698:	ec9fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020569c:	0404a823          	sw	zero,80(s1)
ffffffffc02056a0:	6622                	ld	a2,8(sp)
ffffffffc02056a2:	0034                	addi	a3,sp,8
ffffffffc02056a4:	85d2                	mv	a1,s4
ffffffffc02056a6:	855e                	mv	a0,s7
ffffffffc02056a8:	e34ff0ef          	jal	ra,ffffffffc0204cdc <file_write>
ffffffffc02056ac:	67a2                	ld	a5,8(sp)
ffffffffc02056ae:	892a                	mv	s2,a0
ffffffffc02056b0:	ef85                	bnez	a5,ffffffffc02056e8 <sysfile_write+0xe2>
ffffffffc02056b2:	8552                	mv	a0,s4
ffffffffc02056b4:	98bfc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02056b8:	f60c85e3          	beqz	s9,ffffffffc0205622 <sysfile_write+0x1c>
ffffffffc02056bc:	000c891b          	sext.w	s2,s9
ffffffffc02056c0:	b78d                	j	ffffffffc0205622 <sysfile_write+0x1c>
ffffffffc02056c2:	e422                	sd	s0,8(sp)
ffffffffc02056c4:	f8cd                	bnez	s1,ffffffffc0205676 <sysfile_write+0x70>
ffffffffc02056c6:	66a2                	ld	a3,8(sp)
ffffffffc02056c8:	4701                	li	a4,0
ffffffffc02056ca:	864e                	mv	a2,s3
ffffffffc02056cc:	85d2                	mv	a1,s4
ffffffffc02056ce:	4501                	li	a0,0
ffffffffc02056d0:	c57fe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc02056d4:	f571                	bnez	a0,ffffffffc02056a0 <sysfile_write+0x9a>
ffffffffc02056d6:	5975                	li	s2,-3
ffffffffc02056d8:	bfe9                	j	ffffffffc02056b2 <sysfile_write+0xac>
ffffffffc02056da:	855a                	mv	a0,s6
ffffffffc02056dc:	e85fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02056e0:	5975                	li	s2,-3
ffffffffc02056e2:	0404a823          	sw	zero,80(s1)
ffffffffc02056e6:	b7f1                	j	ffffffffc02056b2 <sysfile_write+0xac>
ffffffffc02056e8:	00f46c63          	bltu	s0,a5,ffffffffc0205700 <sysfile_write+0xfa>
ffffffffc02056ec:	99be                	add	s3,s3,a5
ffffffffc02056ee:	8c1d                	sub	s0,s0,a5
ffffffffc02056f0:	9cbe                	add	s9,s9,a5
ffffffffc02056f2:	f161                	bnez	a0,ffffffffc02056b2 <sysfile_write+0xac>
ffffffffc02056f4:	fc2d                	bnez	s0,ffffffffc020566e <sysfile_write+0x68>
ffffffffc02056f6:	bf75                	j	ffffffffc02056b2 <sysfile_write+0xac>
ffffffffc02056f8:	5975                	li	s2,-3
ffffffffc02056fa:	b725                	j	ffffffffc0205622 <sysfile_write+0x1c>
ffffffffc02056fc:	5971                	li	s2,-4
ffffffffc02056fe:	b715                	j	ffffffffc0205622 <sysfile_write+0x1c>
ffffffffc0205700:	00008697          	auipc	a3,0x8
ffffffffc0205704:	09068693          	addi	a3,a3,144 # ffffffffc020d790 <CSWTCH.79+0xc8>
ffffffffc0205708:	00006617          	auipc	a2,0x6
ffffffffc020570c:	5b060613          	addi	a2,a2,1456 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0205710:	08a00593          	li	a1,138
ffffffffc0205714:	00008517          	auipc	a0,0x8
ffffffffc0205718:	08c50513          	addi	a0,a0,140 # ffffffffc020d7a0 <CSWTCH.79+0xd8>
ffffffffc020571c:	d83fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205720 <sysfile_seek>:
ffffffffc0205720:	ea2ff06f          	j	ffffffffc0204dc2 <file_seek>

ffffffffc0205724 <sysfile_fstat>:
ffffffffc0205724:	715d                	addi	sp,sp,-80
ffffffffc0205726:	f44e                	sd	s3,40(sp)
ffffffffc0205728:	00091997          	auipc	s3,0x91
ffffffffc020572c:	19898993          	addi	s3,s3,408 # ffffffffc02968c0 <current>
ffffffffc0205730:	0009b703          	ld	a4,0(s3)
ffffffffc0205734:	fc26                	sd	s1,56(sp)
ffffffffc0205736:	84ae                	mv	s1,a1
ffffffffc0205738:	858a                	mv	a1,sp
ffffffffc020573a:	e0a2                	sd	s0,64(sp)
ffffffffc020573c:	f84a                	sd	s2,48(sp)
ffffffffc020573e:	e486                	sd	ra,72(sp)
ffffffffc0205740:	02873903          	ld	s2,40(a4)
ffffffffc0205744:	f052                	sd	s4,32(sp)
ffffffffc0205746:	f9cff0ef          	jal	ra,ffffffffc0204ee2 <file_fstat>
ffffffffc020574a:	842a                	mv	s0,a0
ffffffffc020574c:	e91d                	bnez	a0,ffffffffc0205782 <sysfile_fstat+0x5e>
ffffffffc020574e:	04090363          	beqz	s2,ffffffffc0205794 <sysfile_fstat+0x70>
ffffffffc0205752:	03890a13          	addi	s4,s2,56
ffffffffc0205756:	8552                	mv	a0,s4
ffffffffc0205758:	e0dfe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020575c:	0009b783          	ld	a5,0(s3)
ffffffffc0205760:	c3b9                	beqz	a5,ffffffffc02057a6 <sysfile_fstat+0x82>
ffffffffc0205762:	43dc                	lw	a5,4(a5)
ffffffffc0205764:	02000693          	li	a3,32
ffffffffc0205768:	860a                	mv	a2,sp
ffffffffc020576a:	04f92823          	sw	a5,80(s2)
ffffffffc020576e:	85a6                	mv	a1,s1
ffffffffc0205770:	854a                	mv	a0,s2
ffffffffc0205772:	be9fe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc0205776:	c121                	beqz	a0,ffffffffc02057b6 <sysfile_fstat+0x92>
ffffffffc0205778:	8552                	mv	a0,s4
ffffffffc020577a:	de7fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020577e:	04092823          	sw	zero,80(s2)
ffffffffc0205782:	60a6                	ld	ra,72(sp)
ffffffffc0205784:	8522                	mv	a0,s0
ffffffffc0205786:	6406                	ld	s0,64(sp)
ffffffffc0205788:	74e2                	ld	s1,56(sp)
ffffffffc020578a:	7942                	ld	s2,48(sp)
ffffffffc020578c:	79a2                	ld	s3,40(sp)
ffffffffc020578e:	7a02                	ld	s4,32(sp)
ffffffffc0205790:	6161                	addi	sp,sp,80
ffffffffc0205792:	8082                	ret
ffffffffc0205794:	02000693          	li	a3,32
ffffffffc0205798:	860a                	mv	a2,sp
ffffffffc020579a:	85a6                	mv	a1,s1
ffffffffc020579c:	bbffe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc02057a0:	f16d                	bnez	a0,ffffffffc0205782 <sysfile_fstat+0x5e>
ffffffffc02057a2:	5475                	li	s0,-3
ffffffffc02057a4:	bff9                	j	ffffffffc0205782 <sysfile_fstat+0x5e>
ffffffffc02057a6:	02000693          	li	a3,32
ffffffffc02057aa:	860a                	mv	a2,sp
ffffffffc02057ac:	85a6                	mv	a1,s1
ffffffffc02057ae:	854a                	mv	a0,s2
ffffffffc02057b0:	babfe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc02057b4:	f171                	bnez	a0,ffffffffc0205778 <sysfile_fstat+0x54>
ffffffffc02057b6:	8552                	mv	a0,s4
ffffffffc02057b8:	da9fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02057bc:	5475                	li	s0,-3
ffffffffc02057be:	04092823          	sw	zero,80(s2)
ffffffffc02057c2:	b7c1                	j	ffffffffc0205782 <sysfile_fstat+0x5e>

ffffffffc02057c4 <sysfile_fsync>:
ffffffffc02057c4:	fdeff06f          	j	ffffffffc0204fa2 <file_fsync>

ffffffffc02057c8 <sysfile_getcwd>:
ffffffffc02057c8:	715d                	addi	sp,sp,-80
ffffffffc02057ca:	f44e                	sd	s3,40(sp)
ffffffffc02057cc:	00091997          	auipc	s3,0x91
ffffffffc02057d0:	0f498993          	addi	s3,s3,244 # ffffffffc02968c0 <current>
ffffffffc02057d4:	0009b783          	ld	a5,0(s3)
ffffffffc02057d8:	f84a                	sd	s2,48(sp)
ffffffffc02057da:	e486                	sd	ra,72(sp)
ffffffffc02057dc:	e0a2                	sd	s0,64(sp)
ffffffffc02057de:	fc26                	sd	s1,56(sp)
ffffffffc02057e0:	f052                	sd	s4,32(sp)
ffffffffc02057e2:	0287b903          	ld	s2,40(a5)
ffffffffc02057e6:	cda9                	beqz	a1,ffffffffc0205840 <sysfile_getcwd+0x78>
ffffffffc02057e8:	842e                	mv	s0,a1
ffffffffc02057ea:	84aa                	mv	s1,a0
ffffffffc02057ec:	04090363          	beqz	s2,ffffffffc0205832 <sysfile_getcwd+0x6a>
ffffffffc02057f0:	03890a13          	addi	s4,s2,56
ffffffffc02057f4:	8552                	mv	a0,s4
ffffffffc02057f6:	d6ffe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02057fa:	0009b783          	ld	a5,0(s3)
ffffffffc02057fe:	c781                	beqz	a5,ffffffffc0205806 <sysfile_getcwd+0x3e>
ffffffffc0205800:	43dc                	lw	a5,4(a5)
ffffffffc0205802:	04f92823          	sw	a5,80(s2)
ffffffffc0205806:	4685                	li	a3,1
ffffffffc0205808:	8622                	mv	a2,s0
ffffffffc020580a:	85a6                	mv	a1,s1
ffffffffc020580c:	854a                	mv	a0,s2
ffffffffc020580e:	a85fe0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc0205812:	e90d                	bnez	a0,ffffffffc0205844 <sysfile_getcwd+0x7c>
ffffffffc0205814:	5475                	li	s0,-3
ffffffffc0205816:	8552                	mv	a0,s4
ffffffffc0205818:	d49fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020581c:	04092823          	sw	zero,80(s2)
ffffffffc0205820:	60a6                	ld	ra,72(sp)
ffffffffc0205822:	8522                	mv	a0,s0
ffffffffc0205824:	6406                	ld	s0,64(sp)
ffffffffc0205826:	74e2                	ld	s1,56(sp)
ffffffffc0205828:	7942                	ld	s2,48(sp)
ffffffffc020582a:	79a2                	ld	s3,40(sp)
ffffffffc020582c:	7a02                	ld	s4,32(sp)
ffffffffc020582e:	6161                	addi	sp,sp,80
ffffffffc0205830:	8082                	ret
ffffffffc0205832:	862e                	mv	a2,a1
ffffffffc0205834:	4685                	li	a3,1
ffffffffc0205836:	85aa                	mv	a1,a0
ffffffffc0205838:	4501                	li	a0,0
ffffffffc020583a:	a59fe0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc020583e:	ed09                	bnez	a0,ffffffffc0205858 <sysfile_getcwd+0x90>
ffffffffc0205840:	5475                	li	s0,-3
ffffffffc0205842:	bff9                	j	ffffffffc0205820 <sysfile_getcwd+0x58>
ffffffffc0205844:	8622                	mv	a2,s0
ffffffffc0205846:	4681                	li	a3,0
ffffffffc0205848:	85a6                	mv	a1,s1
ffffffffc020584a:	850a                	mv	a0,sp
ffffffffc020584c:	b2bff0ef          	jal	ra,ffffffffc0205376 <iobuf_init>
ffffffffc0205850:	6f9020ef          	jal	ra,ffffffffc0208748 <vfs_getcwd>
ffffffffc0205854:	842a                	mv	s0,a0
ffffffffc0205856:	b7c1                	j	ffffffffc0205816 <sysfile_getcwd+0x4e>
ffffffffc0205858:	8622                	mv	a2,s0
ffffffffc020585a:	4681                	li	a3,0
ffffffffc020585c:	85a6                	mv	a1,s1
ffffffffc020585e:	850a                	mv	a0,sp
ffffffffc0205860:	b17ff0ef          	jal	ra,ffffffffc0205376 <iobuf_init>
ffffffffc0205864:	6e5020ef          	jal	ra,ffffffffc0208748 <vfs_getcwd>
ffffffffc0205868:	842a                	mv	s0,a0
ffffffffc020586a:	bf5d                	j	ffffffffc0205820 <sysfile_getcwd+0x58>

ffffffffc020586c <sysfile_getdirentry>:
ffffffffc020586c:	7139                	addi	sp,sp,-64
ffffffffc020586e:	e852                	sd	s4,16(sp)
ffffffffc0205870:	00091a17          	auipc	s4,0x91
ffffffffc0205874:	050a0a13          	addi	s4,s4,80 # ffffffffc02968c0 <current>
ffffffffc0205878:	000a3703          	ld	a4,0(s4)
ffffffffc020587c:	ec4e                	sd	s3,24(sp)
ffffffffc020587e:	89aa                	mv	s3,a0
ffffffffc0205880:	10800513          	li	a0,264
ffffffffc0205884:	f426                	sd	s1,40(sp)
ffffffffc0205886:	f04a                	sd	s2,32(sp)
ffffffffc0205888:	fc06                	sd	ra,56(sp)
ffffffffc020588a:	f822                	sd	s0,48(sp)
ffffffffc020588c:	e456                	sd	s5,8(sp)
ffffffffc020588e:	7704                	ld	s1,40(a4)
ffffffffc0205890:	892e                	mv	s2,a1
ffffffffc0205892:	efcfc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0205896:	c169                	beqz	a0,ffffffffc0205958 <sysfile_getdirentry+0xec>
ffffffffc0205898:	842a                	mv	s0,a0
ffffffffc020589a:	c8c1                	beqz	s1,ffffffffc020592a <sysfile_getdirentry+0xbe>
ffffffffc020589c:	03848a93          	addi	s5,s1,56
ffffffffc02058a0:	8556                	mv	a0,s5
ffffffffc02058a2:	cc3fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02058a6:	000a3783          	ld	a5,0(s4)
ffffffffc02058aa:	c399                	beqz	a5,ffffffffc02058b0 <sysfile_getdirentry+0x44>
ffffffffc02058ac:	43dc                	lw	a5,4(a5)
ffffffffc02058ae:	c8bc                	sw	a5,80(s1)
ffffffffc02058b0:	4705                	li	a4,1
ffffffffc02058b2:	46a1                	li	a3,8
ffffffffc02058b4:	864a                	mv	a2,s2
ffffffffc02058b6:	85a2                	mv	a1,s0
ffffffffc02058b8:	8526                	mv	a0,s1
ffffffffc02058ba:	a6dfe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc02058be:	e505                	bnez	a0,ffffffffc02058e6 <sysfile_getdirentry+0x7a>
ffffffffc02058c0:	8556                	mv	a0,s5
ffffffffc02058c2:	c9ffe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02058c6:	59f5                	li	s3,-3
ffffffffc02058c8:	0404a823          	sw	zero,80(s1)
ffffffffc02058cc:	8522                	mv	a0,s0
ffffffffc02058ce:	f70fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02058d2:	70e2                	ld	ra,56(sp)
ffffffffc02058d4:	7442                	ld	s0,48(sp)
ffffffffc02058d6:	74a2                	ld	s1,40(sp)
ffffffffc02058d8:	7902                	ld	s2,32(sp)
ffffffffc02058da:	6a42                	ld	s4,16(sp)
ffffffffc02058dc:	6aa2                	ld	s5,8(sp)
ffffffffc02058de:	854e                	mv	a0,s3
ffffffffc02058e0:	69e2                	ld	s3,24(sp)
ffffffffc02058e2:	6121                	addi	sp,sp,64
ffffffffc02058e4:	8082                	ret
ffffffffc02058e6:	8556                	mv	a0,s5
ffffffffc02058e8:	c79fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02058ec:	854e                	mv	a0,s3
ffffffffc02058ee:	85a2                	mv	a1,s0
ffffffffc02058f0:	0404a823          	sw	zero,80(s1)
ffffffffc02058f4:	f5cff0ef          	jal	ra,ffffffffc0205050 <file_getdirentry>
ffffffffc02058f8:	89aa                	mv	s3,a0
ffffffffc02058fa:	f969                	bnez	a0,ffffffffc02058cc <sysfile_getdirentry+0x60>
ffffffffc02058fc:	8556                	mv	a0,s5
ffffffffc02058fe:	c67fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0205902:	000a3783          	ld	a5,0(s4)
ffffffffc0205906:	c399                	beqz	a5,ffffffffc020590c <sysfile_getdirentry+0xa0>
ffffffffc0205908:	43dc                	lw	a5,4(a5)
ffffffffc020590a:	c8bc                	sw	a5,80(s1)
ffffffffc020590c:	10800693          	li	a3,264
ffffffffc0205910:	8622                	mv	a2,s0
ffffffffc0205912:	85ca                	mv	a1,s2
ffffffffc0205914:	8526                	mv	a0,s1
ffffffffc0205916:	a45fe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc020591a:	e111                	bnez	a0,ffffffffc020591e <sysfile_getdirentry+0xb2>
ffffffffc020591c:	59f5                	li	s3,-3
ffffffffc020591e:	8556                	mv	a0,s5
ffffffffc0205920:	c41fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205924:	0404a823          	sw	zero,80(s1)
ffffffffc0205928:	b755                	j	ffffffffc02058cc <sysfile_getdirentry+0x60>
ffffffffc020592a:	85aa                	mv	a1,a0
ffffffffc020592c:	4705                	li	a4,1
ffffffffc020592e:	46a1                	li	a3,8
ffffffffc0205930:	864a                	mv	a2,s2
ffffffffc0205932:	4501                	li	a0,0
ffffffffc0205934:	9f3fe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc0205938:	cd11                	beqz	a0,ffffffffc0205954 <sysfile_getdirentry+0xe8>
ffffffffc020593a:	854e                	mv	a0,s3
ffffffffc020593c:	85a2                	mv	a1,s0
ffffffffc020593e:	f12ff0ef          	jal	ra,ffffffffc0205050 <file_getdirentry>
ffffffffc0205942:	89aa                	mv	s3,a0
ffffffffc0205944:	f541                	bnez	a0,ffffffffc02058cc <sysfile_getdirentry+0x60>
ffffffffc0205946:	10800693          	li	a3,264
ffffffffc020594a:	8622                	mv	a2,s0
ffffffffc020594c:	85ca                	mv	a1,s2
ffffffffc020594e:	a0dfe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc0205952:	fd2d                	bnez	a0,ffffffffc02058cc <sysfile_getdirentry+0x60>
ffffffffc0205954:	59f5                	li	s3,-3
ffffffffc0205956:	bf9d                	j	ffffffffc02058cc <sysfile_getdirentry+0x60>
ffffffffc0205958:	59f1                	li	s3,-4
ffffffffc020595a:	bfa5                	j	ffffffffc02058d2 <sysfile_getdirentry+0x66>

ffffffffc020595c <sysfile_dup>:
ffffffffc020595c:	fdaff06f          	j	ffffffffc0205136 <file_dup>

ffffffffc0205960 <kernel_thread_entry>:
ffffffffc0205960:	8526                	mv	a0,s1
ffffffffc0205962:	9402                	jalr	s0
ffffffffc0205964:	67a000ef          	jal	ra,ffffffffc0205fde <do_exit>

ffffffffc0205968 <alloc_proc>:
ffffffffc0205968:	7179                	addi	sp,sp,-48
ffffffffc020596a:	15000513          	li	a0,336
ffffffffc020596e:	f022                	sd	s0,32(sp)
ffffffffc0205970:	f406                	sd	ra,40(sp)
ffffffffc0205972:	ec26                	sd	s1,24(sp)
ffffffffc0205974:	e84a                	sd	s2,16(sp)
ffffffffc0205976:	e44e                	sd	s3,8(sp)
ffffffffc0205978:	e052                	sd	s4,0(sp)
ffffffffc020597a:	e14fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020597e:	842a                	mv	s0,a0
ffffffffc0205980:	c17d                	beqz	a0,ffffffffc0205a66 <alloc_proc+0xfe>
ffffffffc0205982:	59fd                	li	s3,-1
ffffffffc0205984:	1982                	slli	s3,s3,0x20
ffffffffc0205986:	03050913          	addi	s2,a0,48
ffffffffc020598a:	07000613          	li	a2,112
ffffffffc020598e:	4581                	li	a1,0
ffffffffc0205990:	01353023          	sd	s3,0(a0)
ffffffffc0205994:	00052423          	sw	zero,8(a0)
ffffffffc0205998:	00053823          	sd	zero,16(a0)
ffffffffc020599c:	00053c23          	sd	zero,24(a0)
ffffffffc02059a0:	02053023          	sd	zero,32(a0)
ffffffffc02059a4:	02053423          	sd	zero,40(a0)
ffffffffc02059a8:	854a                	mv	a0,s2
ffffffffc02059aa:	62b050ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc02059ae:	00091a17          	auipc	s4,0x91
ffffffffc02059b2:	ee2a0a13          	addi	s4,s4,-286 # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc02059b6:	000a3783          	ld	a5,0(s4)
ffffffffc02059ba:	0b440493          	addi	s1,s0,180
ffffffffc02059be:	4641                	li	a2,16
ffffffffc02059c0:	4581                	li	a1,0
ffffffffc02059c2:	f45c                	sd	a5,168(s0)
ffffffffc02059c4:	0a043023          	sd	zero,160(s0)
ffffffffc02059c8:	0a042823          	sw	zero,176(s0)
ffffffffc02059cc:	8526                	mv	a0,s1
ffffffffc02059ce:	607050ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc02059d2:	0c840713          	addi	a4,s0,200
ffffffffc02059d6:	0d840793          	addi	a5,s0,216
ffffffffc02059da:	07000613          	li	a2,112
ffffffffc02059de:	4581                	li	a1,0
ffffffffc02059e0:	e878                	sd	a4,208(s0)
ffffffffc02059e2:	e478                	sd	a4,200(s0)
ffffffffc02059e4:	f07c                	sd	a5,224(s0)
ffffffffc02059e6:	ec7c                	sd	a5,216(s0)
ffffffffc02059e8:	0e043423          	sd	zero,232(s0)
ffffffffc02059ec:	0e043823          	sd	zero,240(s0)
ffffffffc02059f0:	0e043c23          	sd	zero,248(s0)
ffffffffc02059f4:	10043023          	sd	zero,256(s0)
ffffffffc02059f8:	01343023          	sd	s3,0(s0)
ffffffffc02059fc:	00042423          	sw	zero,8(s0)
ffffffffc0205a00:	00043823          	sd	zero,16(s0)
ffffffffc0205a04:	00043c23          	sd	zero,24(s0)
ffffffffc0205a08:	02043023          	sd	zero,32(s0)
ffffffffc0205a0c:	02043423          	sd	zero,40(s0)
ffffffffc0205a10:	854a                	mv	a0,s2
ffffffffc0205a12:	5c3050ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc0205a16:	000a3783          	ld	a5,0(s4)
ffffffffc0205a1a:	0a043023          	sd	zero,160(s0)
ffffffffc0205a1e:	0a042823          	sw	zero,176(s0)
ffffffffc0205a22:	f45c                	sd	a5,168(s0)
ffffffffc0205a24:	463d                	li	a2,15
ffffffffc0205a26:	4581                	li	a1,0
ffffffffc0205a28:	8526                	mv	a0,s1
ffffffffc0205a2a:	5ab050ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc0205a2e:	11040793          	addi	a5,s0,272
ffffffffc0205a32:	0e042623          	sw	zero,236(s0)
ffffffffc0205a36:	0e043c23          	sd	zero,248(s0)
ffffffffc0205a3a:	10043023          	sd	zero,256(s0)
ffffffffc0205a3e:	0e043823          	sd	zero,240(s0)
ffffffffc0205a42:	10043423          	sd	zero,264(s0)
ffffffffc0205a46:	10f43c23          	sd	a5,280(s0)
ffffffffc0205a4a:	10f43823          	sd	a5,272(s0)
ffffffffc0205a4e:	12042023          	sw	zero,288(s0)
ffffffffc0205a52:	12043423          	sd	zero,296(s0)
ffffffffc0205a56:	12043823          	sd	zero,304(s0)
ffffffffc0205a5a:	12043c23          	sd	zero,312(s0)
ffffffffc0205a5e:	14043023          	sd	zero,320(s0)
ffffffffc0205a62:	14043423          	sd	zero,328(s0)
ffffffffc0205a66:	70a2                	ld	ra,40(sp)
ffffffffc0205a68:	8522                	mv	a0,s0
ffffffffc0205a6a:	7402                	ld	s0,32(sp)
ffffffffc0205a6c:	64e2                	ld	s1,24(sp)
ffffffffc0205a6e:	6942                	ld	s2,16(sp)
ffffffffc0205a70:	69a2                	ld	s3,8(sp)
ffffffffc0205a72:	6a02                	ld	s4,0(sp)
ffffffffc0205a74:	6145                	addi	sp,sp,48
ffffffffc0205a76:	8082                	ret

ffffffffc0205a78 <forkret>:
ffffffffc0205a78:	00091797          	auipc	a5,0x91
ffffffffc0205a7c:	e487b783          	ld	a5,-440(a5) # ffffffffc02968c0 <current>
ffffffffc0205a80:	73c8                	ld	a0,160(a5)
ffffffffc0205a82:	829fb06f          	j	ffffffffc02012aa <forkrets>

ffffffffc0205a86 <pa2page.part.0>:
ffffffffc0205a86:	1141                	addi	sp,sp,-16
ffffffffc0205a88:	00007617          	auipc	a2,0x7
ffffffffc0205a8c:	e2060613          	addi	a2,a2,-480 # ffffffffc020c8a8 <default_pmm_manager+0x108>
ffffffffc0205a90:	06900593          	li	a1,105
ffffffffc0205a94:	00007517          	auipc	a0,0x7
ffffffffc0205a98:	d6c50513          	addi	a0,a0,-660 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc0205a9c:	e406                	sd	ra,8(sp)
ffffffffc0205a9e:	a01fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205aa2 <put_pgdir.isra.0>:
ffffffffc0205aa2:	1141                	addi	sp,sp,-16
ffffffffc0205aa4:	e406                	sd	ra,8(sp)
ffffffffc0205aa6:	c02007b7          	lui	a5,0xc0200
ffffffffc0205aaa:	02f56e63          	bltu	a0,a5,ffffffffc0205ae6 <put_pgdir.isra.0+0x44>
ffffffffc0205aae:	00091697          	auipc	a3,0x91
ffffffffc0205ab2:	e0a6b683          	ld	a3,-502(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205ab6:	8d15                	sub	a0,a0,a3
ffffffffc0205ab8:	8131                	srli	a0,a0,0xc
ffffffffc0205aba:	00091797          	auipc	a5,0x91
ffffffffc0205abe:	de67b783          	ld	a5,-538(a5) # ffffffffc02968a0 <npage>
ffffffffc0205ac2:	02f57f63          	bgeu	a0,a5,ffffffffc0205b00 <put_pgdir.isra.0+0x5e>
ffffffffc0205ac6:	0000a697          	auipc	a3,0xa
ffffffffc0205aca:	51a6b683          	ld	a3,1306(a3) # ffffffffc020ffe0 <nbase>
ffffffffc0205ace:	60a2                	ld	ra,8(sp)
ffffffffc0205ad0:	8d15                	sub	a0,a0,a3
ffffffffc0205ad2:	00091797          	auipc	a5,0x91
ffffffffc0205ad6:	dd67b783          	ld	a5,-554(a5) # ffffffffc02968a8 <pages>
ffffffffc0205ada:	051a                	slli	a0,a0,0x6
ffffffffc0205adc:	4585                	li	a1,1
ffffffffc0205ade:	953e                	add	a0,a0,a5
ffffffffc0205ae0:	0141                	addi	sp,sp,16
ffffffffc0205ae2:	ec8fc06f          	j	ffffffffc02021aa <free_pages>
ffffffffc0205ae6:	86aa                	mv	a3,a0
ffffffffc0205ae8:	00007617          	auipc	a2,0x7
ffffffffc0205aec:	d9860613          	addi	a2,a2,-616 # ffffffffc020c880 <default_pmm_manager+0xe0>
ffffffffc0205af0:	07700593          	li	a1,119
ffffffffc0205af4:	00007517          	auipc	a0,0x7
ffffffffc0205af8:	d0c50513          	addi	a0,a0,-756 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc0205afc:	9a3fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205b00:	f87ff0ef          	jal	ra,ffffffffc0205a86 <pa2page.part.0>

ffffffffc0205b04 <proc_run>:
ffffffffc0205b04:	7179                	addi	sp,sp,-48
ffffffffc0205b06:	f026                	sd	s1,32(sp)
ffffffffc0205b08:	00091497          	auipc	s1,0x91
ffffffffc0205b0c:	db848493          	addi	s1,s1,-584 # ffffffffc02968c0 <current>
ffffffffc0205b10:	6098                	ld	a4,0(s1)
ffffffffc0205b12:	f406                	sd	ra,40(sp)
ffffffffc0205b14:	ec4a                	sd	s2,24(sp)
ffffffffc0205b16:	02a70963          	beq	a4,a0,ffffffffc0205b48 <proc_run+0x44>
ffffffffc0205b1a:	100027f3          	csrr	a5,sstatus
ffffffffc0205b1e:	8b89                	andi	a5,a5,2
ffffffffc0205b20:	4901                	li	s2,0
ffffffffc0205b22:	ef95                	bnez	a5,ffffffffc0205b5e <proc_run+0x5a>
ffffffffc0205b24:	755c                	ld	a5,168(a0)
ffffffffc0205b26:	56fd                	li	a3,-1
ffffffffc0205b28:	16fe                	slli	a3,a3,0x3f
ffffffffc0205b2a:	83b1                	srli	a5,a5,0xc
ffffffffc0205b2c:	e088                	sd	a0,0(s1)
ffffffffc0205b2e:	8fd5                	or	a5,a5,a3
ffffffffc0205b30:	18079073          	csrw	satp,a5
ffffffffc0205b34:	12000073          	sfence.vma
ffffffffc0205b38:	03050593          	addi	a1,a0,48
ffffffffc0205b3c:	03070513          	addi	a0,a4,48
ffffffffc0205b40:	0d3010ef          	jal	ra,ffffffffc0207412 <switch_to>
ffffffffc0205b44:	00091763          	bnez	s2,ffffffffc0205b52 <proc_run+0x4e>
ffffffffc0205b48:	70a2                	ld	ra,40(sp)
ffffffffc0205b4a:	7482                	ld	s1,32(sp)
ffffffffc0205b4c:	6962                	ld	s2,24(sp)
ffffffffc0205b4e:	6145                	addi	sp,sp,48
ffffffffc0205b50:	8082                	ret
ffffffffc0205b52:	70a2                	ld	ra,40(sp)
ffffffffc0205b54:	7482                	ld	s1,32(sp)
ffffffffc0205b56:	6962                	ld	s2,24(sp)
ffffffffc0205b58:	6145                	addi	sp,sp,48
ffffffffc0205b5a:	912fb06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0205b5e:	e42a                	sd	a0,8(sp)
ffffffffc0205b60:	912fb0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205b64:	6098                	ld	a4,0(s1)
ffffffffc0205b66:	6522                	ld	a0,8(sp)
ffffffffc0205b68:	4905                	li	s2,1
ffffffffc0205b6a:	bf6d                	j	ffffffffc0205b24 <proc_run+0x20>

ffffffffc0205b6c <do_fork>:
ffffffffc0205b6c:	7119                	addi	sp,sp,-128
ffffffffc0205b6e:	e8d2                	sd	s4,80(sp)
ffffffffc0205b70:	00091a17          	auipc	s4,0x91
ffffffffc0205b74:	d68a0a13          	addi	s4,s4,-664 # ffffffffc02968d8 <nr_process>
ffffffffc0205b78:	000a2703          	lw	a4,0(s4)
ffffffffc0205b7c:	fc86                	sd	ra,120(sp)
ffffffffc0205b7e:	f8a2                	sd	s0,112(sp)
ffffffffc0205b80:	f4a6                	sd	s1,104(sp)
ffffffffc0205b82:	f0ca                	sd	s2,96(sp)
ffffffffc0205b84:	ecce                	sd	s3,88(sp)
ffffffffc0205b86:	e4d6                	sd	s5,72(sp)
ffffffffc0205b88:	e0da                	sd	s6,64(sp)
ffffffffc0205b8a:	fc5e                	sd	s7,56(sp)
ffffffffc0205b8c:	f862                	sd	s8,48(sp)
ffffffffc0205b8e:	f466                	sd	s9,40(sp)
ffffffffc0205b90:	f06a                	sd	s10,32(sp)
ffffffffc0205b92:	ec6e                	sd	s11,24(sp)
ffffffffc0205b94:	6785                	lui	a5,0x1
ffffffffc0205b96:	36f75563          	bge	a4,a5,ffffffffc0205f00 <do_fork+0x394>
ffffffffc0205b9a:	892a                	mv	s2,a0
ffffffffc0205b9c:	89ae                	mv	s3,a1
ffffffffc0205b9e:	8432                	mv	s0,a2
ffffffffc0205ba0:	dc9ff0ef          	jal	ra,ffffffffc0205968 <alloc_proc>
ffffffffc0205ba4:	84aa                	mv	s1,a0
ffffffffc0205ba6:	34050263          	beqz	a0,ffffffffc0205eea <do_fork+0x37e>
ffffffffc0205baa:	100027f3          	csrr	a5,sstatus
ffffffffc0205bae:	8b89                	andi	a5,a5,2
ffffffffc0205bb0:	00091c17          	auipc	s8,0x91
ffffffffc0205bb4:	d10c0c13          	addi	s8,s8,-752 # ffffffffc02968c0 <current>
ffffffffc0205bb8:	2c079c63          	bnez	a5,ffffffffc0205e90 <do_fork+0x324>
ffffffffc0205bbc:	000c3783          	ld	a5,0(s8)
ffffffffc0205bc0:	f11c                	sd	a5,32(a0)
ffffffffc0205bc2:	4509                	li	a0,2
ffffffffc0205bc4:	da8fc0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0205bc8:	30050e63          	beqz	a0,ffffffffc0205ee4 <do_fork+0x378>
ffffffffc0205bcc:	00091b97          	auipc	s7,0x91
ffffffffc0205bd0:	cdcb8b93          	addi	s7,s7,-804 # ffffffffc02968a8 <pages>
ffffffffc0205bd4:	000bb683          	ld	a3,0(s7)
ffffffffc0205bd8:	00091b17          	auipc	s6,0x91
ffffffffc0205bdc:	cc8b0b13          	addi	s6,s6,-824 # ffffffffc02968a0 <npage>
ffffffffc0205be0:	0000aa97          	auipc	s5,0xa
ffffffffc0205be4:	400aba83          	ld	s5,1024(s5) # ffffffffc020ffe0 <nbase>
ffffffffc0205be8:	40d506b3          	sub	a3,a0,a3
ffffffffc0205bec:	8699                	srai	a3,a3,0x6
ffffffffc0205bee:	5d7d                	li	s10,-1
ffffffffc0205bf0:	000b3783          	ld	a5,0(s6)
ffffffffc0205bf4:	96d6                	add	a3,a3,s5
ffffffffc0205bf6:	00cd5d13          	srli	s10,s10,0xc
ffffffffc0205bfa:	01a6f733          	and	a4,a3,s10
ffffffffc0205bfe:	06b2                	slli	a3,a3,0xc
ffffffffc0205c00:	32f77f63          	bgeu	a4,a5,ffffffffc0205f3e <do_fork+0x3d2>
ffffffffc0205c04:	000c3883          	ld	a7,0(s8)
ffffffffc0205c08:	00091c97          	auipc	s9,0x91
ffffffffc0205c0c:	cb0c8c93          	addi	s9,s9,-848 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205c10:	000cb703          	ld	a4,0(s9)
ffffffffc0205c14:	0288bd83          	ld	s11,40(a7) # 1028 <_binary_bin_swap_img_size-0x6cd8>
ffffffffc0205c18:	96ba                	add	a3,a3,a4
ffffffffc0205c1a:	e894                	sd	a3,16(s1)
ffffffffc0205c1c:	020d8a63          	beqz	s11,ffffffffc0205c50 <do_fork+0xe4>
ffffffffc0205c20:	10097713          	andi	a4,s2,256
ffffffffc0205c24:	1e070663          	beqz	a4,ffffffffc0205e10 <do_fork+0x2a4>
ffffffffc0205c28:	030da683          	lw	a3,48(s11)
ffffffffc0205c2c:	018db703          	ld	a4,24(s11)
ffffffffc0205c30:	c0200637          	lui	a2,0xc0200
ffffffffc0205c34:	2685                	addiw	a3,a3,1
ffffffffc0205c36:	02dda823          	sw	a3,48(s11)
ffffffffc0205c3a:	03b4b423          	sd	s11,40(s1)
ffffffffc0205c3e:	2ec76363          	bltu	a4,a2,ffffffffc0205f24 <do_fork+0x3b8>
ffffffffc0205c42:	000cb783          	ld	a5,0(s9)
ffffffffc0205c46:	000c3883          	ld	a7,0(s8)
ffffffffc0205c4a:	6894                	ld	a3,16(s1)
ffffffffc0205c4c:	8f1d                	sub	a4,a4,a5
ffffffffc0205c4e:	f4d8                	sd	a4,168(s1)
ffffffffc0205c50:	6789                	lui	a5,0x2
ffffffffc0205c52:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0205c56:	96be                	add	a3,a3,a5
ffffffffc0205c58:	f0d4                	sd	a3,160(s1)
ffffffffc0205c5a:	87b6                	mv	a5,a3
ffffffffc0205c5c:	12040813          	addi	a6,s0,288
ffffffffc0205c60:	6008                	ld	a0,0(s0)
ffffffffc0205c62:	640c                	ld	a1,8(s0)
ffffffffc0205c64:	6810                	ld	a2,16(s0)
ffffffffc0205c66:	6c18                	ld	a4,24(s0)
ffffffffc0205c68:	e388                	sd	a0,0(a5)
ffffffffc0205c6a:	e78c                	sd	a1,8(a5)
ffffffffc0205c6c:	eb90                	sd	a2,16(a5)
ffffffffc0205c6e:	ef98                	sd	a4,24(a5)
ffffffffc0205c70:	02040413          	addi	s0,s0,32
ffffffffc0205c74:	02078793          	addi	a5,a5,32
ffffffffc0205c78:	ff0414e3          	bne	s0,a6,ffffffffc0205c60 <do_fork+0xf4>
ffffffffc0205c7c:	0406b823          	sd	zero,80(a3)
ffffffffc0205c80:	14098e63          	beqz	s3,ffffffffc0205ddc <do_fork+0x270>
ffffffffc0205c84:	1488b403          	ld	s0,328(a7)
ffffffffc0205c88:	00000797          	auipc	a5,0x0
ffffffffc0205c8c:	df078793          	addi	a5,a5,-528 # ffffffffc0205a78 <forkret>
ffffffffc0205c90:	0136b823          	sd	s3,16(a3)
ffffffffc0205c94:	f89c                	sd	a5,48(s1)
ffffffffc0205c96:	fc94                	sd	a3,56(s1)
ffffffffc0205c98:	2c040b63          	beqz	s0,ffffffffc0205f6e <do_fork+0x402>
ffffffffc0205c9c:	00b95913          	srli	s2,s2,0xb
ffffffffc0205ca0:	00197913          	andi	s2,s2,1
ffffffffc0205ca4:	12090e63          	beqz	s2,ffffffffc0205de0 <do_fork+0x274>
ffffffffc0205ca8:	481c                	lw	a5,16(s0)
ffffffffc0205caa:	2785                	addiw	a5,a5,1
ffffffffc0205cac:	c81c                	sw	a5,16(s0)
ffffffffc0205cae:	1484b423          	sd	s0,328(s1)
ffffffffc0205cb2:	100027f3          	csrr	a5,sstatus
ffffffffc0205cb6:	8b89                	andi	a5,a5,2
ffffffffc0205cb8:	22079b63          	bnez	a5,ffffffffc0205eee <do_fork+0x382>
ffffffffc0205cbc:	4901                	li	s2,0
ffffffffc0205cbe:	0008b817          	auipc	a6,0x8b
ffffffffc0205cc2:	39a80813          	addi	a6,a6,922 # ffffffffc0291058 <last_pid.1>
ffffffffc0205cc6:	00082783          	lw	a5,0(a6)
ffffffffc0205cca:	6709                	lui	a4,0x2
ffffffffc0205ccc:	0017851b          	addiw	a0,a5,1
ffffffffc0205cd0:	00a82023          	sw	a0,0(a6)
ffffffffc0205cd4:	08e55d63          	bge	a0,a4,ffffffffc0205d6e <do_fork+0x202>
ffffffffc0205cd8:	0008b317          	auipc	t1,0x8b
ffffffffc0205cdc:	38430313          	addi	t1,t1,900 # ffffffffc029105c <next_safe.0>
ffffffffc0205ce0:	00032783          	lw	a5,0(t1)
ffffffffc0205ce4:	00090417          	auipc	s0,0x90
ffffffffc0205ce8:	adc40413          	addi	s0,s0,-1316 # ffffffffc02957c0 <proc_list>
ffffffffc0205cec:	08f55963          	bge	a0,a5,ffffffffc0205d7e <do_fork+0x212>
ffffffffc0205cf0:	c0c8                	sw	a0,4(s1)
ffffffffc0205cf2:	45a9                	li	a1,10
ffffffffc0205cf4:	2501                	sext.w	a0,a0
ffffffffc0205cf6:	5aa050ef          	jal	ra,ffffffffc020b2a0 <hash32>
ffffffffc0205cfa:	02051793          	slli	a5,a0,0x20
ffffffffc0205cfe:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0205d02:	0008c797          	auipc	a5,0x8c
ffffffffc0205d06:	abe78793          	addi	a5,a5,-1346 # ffffffffc02917c0 <hash_list>
ffffffffc0205d0a:	953e                	add	a0,a0,a5
ffffffffc0205d0c:	650c                	ld	a1,8(a0)
ffffffffc0205d0e:	7094                	ld	a3,32(s1)
ffffffffc0205d10:	0d848793          	addi	a5,s1,216
ffffffffc0205d14:	e19c                	sd	a5,0(a1)
ffffffffc0205d16:	6410                	ld	a2,8(s0)
ffffffffc0205d18:	e51c                	sd	a5,8(a0)
ffffffffc0205d1a:	7af8                	ld	a4,240(a3)
ffffffffc0205d1c:	0c848793          	addi	a5,s1,200
ffffffffc0205d20:	f0ec                	sd	a1,224(s1)
ffffffffc0205d22:	ece8                	sd	a0,216(s1)
ffffffffc0205d24:	e21c                	sd	a5,0(a2)
ffffffffc0205d26:	e41c                	sd	a5,8(s0)
ffffffffc0205d28:	e8f0                	sd	a2,208(s1)
ffffffffc0205d2a:	e4e0                	sd	s0,200(s1)
ffffffffc0205d2c:	0e04bc23          	sd	zero,248(s1)
ffffffffc0205d30:	10e4b023          	sd	a4,256(s1)
ffffffffc0205d34:	c311                	beqz	a4,ffffffffc0205d38 <do_fork+0x1cc>
ffffffffc0205d36:	ff64                	sd	s1,248(a4)
ffffffffc0205d38:	000a2783          	lw	a5,0(s4)
ffffffffc0205d3c:	fae4                	sd	s1,240(a3)
ffffffffc0205d3e:	2785                	addiw	a5,a5,1
ffffffffc0205d40:	00fa2023          	sw	a5,0(s4)
ffffffffc0205d44:	14091e63          	bnez	s2,ffffffffc0205ea0 <do_fork+0x334>
ffffffffc0205d48:	8526                	mv	a0,s1
ffffffffc0205d4a:	06d010ef          	jal	ra,ffffffffc02075b6 <wakeup_proc>
ffffffffc0205d4e:	40c8                	lw	a0,4(s1)
ffffffffc0205d50:	70e6                	ld	ra,120(sp)
ffffffffc0205d52:	7446                	ld	s0,112(sp)
ffffffffc0205d54:	74a6                	ld	s1,104(sp)
ffffffffc0205d56:	7906                	ld	s2,96(sp)
ffffffffc0205d58:	69e6                	ld	s3,88(sp)
ffffffffc0205d5a:	6a46                	ld	s4,80(sp)
ffffffffc0205d5c:	6aa6                	ld	s5,72(sp)
ffffffffc0205d5e:	6b06                	ld	s6,64(sp)
ffffffffc0205d60:	7be2                	ld	s7,56(sp)
ffffffffc0205d62:	7c42                	ld	s8,48(sp)
ffffffffc0205d64:	7ca2                	ld	s9,40(sp)
ffffffffc0205d66:	7d02                	ld	s10,32(sp)
ffffffffc0205d68:	6de2                	ld	s11,24(sp)
ffffffffc0205d6a:	6109                	addi	sp,sp,128
ffffffffc0205d6c:	8082                	ret
ffffffffc0205d6e:	4785                	li	a5,1
ffffffffc0205d70:	00f82023          	sw	a5,0(a6)
ffffffffc0205d74:	4505                	li	a0,1
ffffffffc0205d76:	0008b317          	auipc	t1,0x8b
ffffffffc0205d7a:	2e630313          	addi	t1,t1,742 # ffffffffc029105c <next_safe.0>
ffffffffc0205d7e:	00090417          	auipc	s0,0x90
ffffffffc0205d82:	a4240413          	addi	s0,s0,-1470 # ffffffffc02957c0 <proc_list>
ffffffffc0205d86:	00843e03          	ld	t3,8(s0)
ffffffffc0205d8a:	6789                	lui	a5,0x2
ffffffffc0205d8c:	00f32023          	sw	a5,0(t1)
ffffffffc0205d90:	86aa                	mv	a3,a0
ffffffffc0205d92:	4581                	li	a1,0
ffffffffc0205d94:	6e89                	lui	t4,0x2
ffffffffc0205d96:	168e0063          	beq	t3,s0,ffffffffc0205ef6 <do_fork+0x38a>
ffffffffc0205d9a:	88ae                	mv	a7,a1
ffffffffc0205d9c:	87f2                	mv	a5,t3
ffffffffc0205d9e:	6609                	lui	a2,0x2
ffffffffc0205da0:	a811                	j	ffffffffc0205db4 <do_fork+0x248>
ffffffffc0205da2:	00e6d663          	bge	a3,a4,ffffffffc0205dae <do_fork+0x242>
ffffffffc0205da6:	00c75463          	bge	a4,a2,ffffffffc0205dae <do_fork+0x242>
ffffffffc0205daa:	863a                	mv	a2,a4
ffffffffc0205dac:	4885                	li	a7,1
ffffffffc0205dae:	679c                	ld	a5,8(a5)
ffffffffc0205db0:	00878d63          	beq	a5,s0,ffffffffc0205dca <do_fork+0x25e>
ffffffffc0205db4:	f3c7a703          	lw	a4,-196(a5) # 1f3c <_binary_bin_swap_img_size-0x5dc4>
ffffffffc0205db8:	fed715e3          	bne	a4,a3,ffffffffc0205da2 <do_fork+0x236>
ffffffffc0205dbc:	2685                	addiw	a3,a3,1
ffffffffc0205dbe:	0ec6d463          	bge	a3,a2,ffffffffc0205ea6 <do_fork+0x33a>
ffffffffc0205dc2:	679c                	ld	a5,8(a5)
ffffffffc0205dc4:	4585                	li	a1,1
ffffffffc0205dc6:	fe8797e3          	bne	a5,s0,ffffffffc0205db4 <do_fork+0x248>
ffffffffc0205dca:	c581                	beqz	a1,ffffffffc0205dd2 <do_fork+0x266>
ffffffffc0205dcc:	00d82023          	sw	a3,0(a6)
ffffffffc0205dd0:	8536                	mv	a0,a3
ffffffffc0205dd2:	f0088fe3          	beqz	a7,ffffffffc0205cf0 <do_fork+0x184>
ffffffffc0205dd6:	00c32023          	sw	a2,0(t1)
ffffffffc0205dda:	bf19                	j	ffffffffc0205cf0 <do_fork+0x184>
ffffffffc0205ddc:	89b6                	mv	s3,a3
ffffffffc0205dde:	b55d                	j	ffffffffc0205c84 <do_fork+0x118>
ffffffffc0205de0:	beeff0ef          	jal	ra,ffffffffc02051ce <files_create>
ffffffffc0205de4:	892a                	mv	s2,a0
ffffffffc0205de6:	c911                	beqz	a0,ffffffffc0205dfa <do_fork+0x28e>
ffffffffc0205de8:	85a2                	mv	a1,s0
ffffffffc0205dea:	cb0ff0ef          	jal	ra,ffffffffc020529a <dup_files>
ffffffffc0205dee:	844a                	mv	s0,s2
ffffffffc0205df0:	ea050ce3          	beqz	a0,ffffffffc0205ca8 <do_fork+0x13c>
ffffffffc0205df4:	854a                	mv	a0,s2
ffffffffc0205df6:	c0eff0ef          	jal	ra,ffffffffc0205204 <files_destroy>
ffffffffc0205dfa:	1484b503          	ld	a0,328(s1)
ffffffffc0205dfe:	cd45                	beqz	a0,ffffffffc0205eb6 <do_fork+0x34a>
ffffffffc0205e00:	491c                	lw	a5,16(a0)
ffffffffc0205e02:	fff7871b          	addiw	a4,a5,-1
ffffffffc0205e06:	c918                	sw	a4,16(a0)
ffffffffc0205e08:	e75d                	bnez	a4,ffffffffc0205eb6 <do_fork+0x34a>
ffffffffc0205e0a:	bfaff0ef          	jal	ra,ffffffffc0205204 <files_destroy>
ffffffffc0205e0e:	a065                	j	ffffffffc0205eb6 <do_fork+0x34a>
ffffffffc0205e10:	df9fd0ef          	jal	ra,ffffffffc0203c08 <mm_create>
ffffffffc0205e14:	e02a                	sd	a0,0(sp)
ffffffffc0205e16:	c145                	beqz	a0,ffffffffc0205eb6 <do_fork+0x34a>
ffffffffc0205e18:	4505                	li	a0,1
ffffffffc0205e1a:	b52fc0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0205e1e:	c949                	beqz	a0,ffffffffc0205eb0 <do_fork+0x344>
ffffffffc0205e20:	000bb683          	ld	a3,0(s7)
ffffffffc0205e24:	000b3703          	ld	a4,0(s6)
ffffffffc0205e28:	40d506b3          	sub	a3,a0,a3
ffffffffc0205e2c:	8699                	srai	a3,a3,0x6
ffffffffc0205e2e:	96d6                	add	a3,a3,s5
ffffffffc0205e30:	01a6fd33          	and	s10,a3,s10
ffffffffc0205e34:	06b2                	slli	a3,a3,0xc
ffffffffc0205e36:	10ed7463          	bgeu	s10,a4,ffffffffc0205f3e <do_fork+0x3d2>
ffffffffc0205e3a:	000cbd03          	ld	s10,0(s9)
ffffffffc0205e3e:	6605                	lui	a2,0x1
ffffffffc0205e40:	00091597          	auipc	a1,0x91
ffffffffc0205e44:	a585b583          	ld	a1,-1448(a1) # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0205e48:	9d36                	add	s10,s10,a3
ffffffffc0205e4a:	856a                	mv	a0,s10
ffffffffc0205e4c:	1db050ef          	jal	ra,ffffffffc020b826 <memcpy>
ffffffffc0205e50:	6782                	ld	a5,0(sp)
ffffffffc0205e52:	038d8713          	addi	a4,s11,56
ffffffffc0205e56:	853a                	mv	a0,a4
ffffffffc0205e58:	01a7bc23          	sd	s10,24(a5)
ffffffffc0205e5c:	e43a                	sd	a4,8(sp)
ffffffffc0205e5e:	f06fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0205e62:	000c3683          	ld	a3,0(s8)
ffffffffc0205e66:	6722                	ld	a4,8(sp)
ffffffffc0205e68:	c681                	beqz	a3,ffffffffc0205e70 <do_fork+0x304>
ffffffffc0205e6a:	42d4                	lw	a3,4(a3)
ffffffffc0205e6c:	04dda823          	sw	a3,80(s11)
ffffffffc0205e70:	6502                	ld	a0,0(sp)
ffffffffc0205e72:	85ee                	mv	a1,s11
ffffffffc0205e74:	e43a                	sd	a4,8(sp)
ffffffffc0205e76:	fe3fd0ef          	jal	ra,ffffffffc0203e58 <dup_mmap>
ffffffffc0205e7a:	6722                	ld	a4,8(sp)
ffffffffc0205e7c:	8d2a                	mv	s10,a0
ffffffffc0205e7e:	853a                	mv	a0,a4
ffffffffc0205e80:	ee0fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205e84:	040da823          	sw	zero,80(s11)
ffffffffc0205e88:	080d1163          	bnez	s10,ffffffffc0205f0a <do_fork+0x39e>
ffffffffc0205e8c:	6d82                	ld	s11,0(sp)
ffffffffc0205e8e:	bb69                	j	ffffffffc0205c28 <do_fork+0xbc>
ffffffffc0205e90:	de3fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205e94:	000c3783          	ld	a5,0(s8)
ffffffffc0205e98:	f09c                	sd	a5,32(s1)
ffffffffc0205e9a:	dd3fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0205e9e:	b315                	j	ffffffffc0205bc2 <do_fork+0x56>
ffffffffc0205ea0:	dcdfa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0205ea4:	b555                	j	ffffffffc0205d48 <do_fork+0x1dc>
ffffffffc0205ea6:	01d6c363          	blt	a3,t4,ffffffffc0205eac <do_fork+0x340>
ffffffffc0205eaa:	4685                	li	a3,1
ffffffffc0205eac:	4585                	li	a1,1
ffffffffc0205eae:	b5e5                	j	ffffffffc0205d96 <do_fork+0x22a>
ffffffffc0205eb0:	6502                	ld	a0,0(sp)
ffffffffc0205eb2:	ea5fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0205eb6:	6894                	ld	a3,16(s1)
ffffffffc0205eb8:	c02007b7          	lui	a5,0xc0200
ffffffffc0205ebc:	08f6ed63          	bltu	a3,a5,ffffffffc0205f56 <do_fork+0x3ea>
ffffffffc0205ec0:	000cb783          	ld	a5,0(s9)
ffffffffc0205ec4:	000b3703          	ld	a4,0(s6)
ffffffffc0205ec8:	40f687b3          	sub	a5,a3,a5
ffffffffc0205ecc:	83b1                	srli	a5,a5,0xc
ffffffffc0205ece:	04e7f963          	bgeu	a5,a4,ffffffffc0205f20 <do_fork+0x3b4>
ffffffffc0205ed2:	000bb503          	ld	a0,0(s7)
ffffffffc0205ed6:	415787b3          	sub	a5,a5,s5
ffffffffc0205eda:	079a                	slli	a5,a5,0x6
ffffffffc0205edc:	4589                	li	a1,2
ffffffffc0205ede:	953e                	add	a0,a0,a5
ffffffffc0205ee0:	acafc0ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0205ee4:	8526                	mv	a0,s1
ffffffffc0205ee6:	958fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205eea:	5571                	li	a0,-4
ffffffffc0205eec:	b595                	j	ffffffffc0205d50 <do_fork+0x1e4>
ffffffffc0205eee:	d85fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205ef2:	4905                	li	s2,1
ffffffffc0205ef4:	b3e9                	j	ffffffffc0205cbe <do_fork+0x152>
ffffffffc0205ef6:	c599                	beqz	a1,ffffffffc0205f04 <do_fork+0x398>
ffffffffc0205ef8:	00d82023          	sw	a3,0(a6)
ffffffffc0205efc:	8536                	mv	a0,a3
ffffffffc0205efe:	bbcd                	j	ffffffffc0205cf0 <do_fork+0x184>
ffffffffc0205f00:	556d                	li	a0,-5
ffffffffc0205f02:	b5b9                	j	ffffffffc0205d50 <do_fork+0x1e4>
ffffffffc0205f04:	00082503          	lw	a0,0(a6)
ffffffffc0205f08:	b3e5                	j	ffffffffc0205cf0 <do_fork+0x184>
ffffffffc0205f0a:	6402                	ld	s0,0(sp)
ffffffffc0205f0c:	8522                	mv	a0,s0
ffffffffc0205f0e:	fe5fd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0205f12:	6c08                	ld	a0,24(s0)
ffffffffc0205f14:	b8fff0ef          	jal	ra,ffffffffc0205aa2 <put_pgdir.isra.0>
ffffffffc0205f18:	8522                	mv	a0,s0
ffffffffc0205f1a:	e3dfd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0205f1e:	bf61                	j	ffffffffc0205eb6 <do_fork+0x34a>
ffffffffc0205f20:	b67ff0ef          	jal	ra,ffffffffc0205a86 <pa2page.part.0>
ffffffffc0205f24:	86ba                	mv	a3,a4
ffffffffc0205f26:	00007617          	auipc	a2,0x7
ffffffffc0205f2a:	95a60613          	addi	a2,a2,-1702 # ffffffffc020c880 <default_pmm_manager+0xe0>
ffffffffc0205f2e:	1c300593          	li	a1,451
ffffffffc0205f32:	00008517          	auipc	a0,0x8
ffffffffc0205f36:	88650513          	addi	a0,a0,-1914 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0205f3a:	d64fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f3e:	00007617          	auipc	a2,0x7
ffffffffc0205f42:	89a60613          	addi	a2,a2,-1894 # ffffffffc020c7d8 <default_pmm_manager+0x38>
ffffffffc0205f46:	07100593          	li	a1,113
ffffffffc0205f4a:	00007517          	auipc	a0,0x7
ffffffffc0205f4e:	8b650513          	addi	a0,a0,-1866 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc0205f52:	d4cfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f56:	00007617          	auipc	a2,0x7
ffffffffc0205f5a:	92a60613          	addi	a2,a2,-1750 # ffffffffc020c880 <default_pmm_manager+0xe0>
ffffffffc0205f5e:	07700593          	li	a1,119
ffffffffc0205f62:	00007517          	auipc	a0,0x7
ffffffffc0205f66:	89e50513          	addi	a0,a0,-1890 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc0205f6a:	d34fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f6e:	00008697          	auipc	a3,0x8
ffffffffc0205f72:	86268693          	addi	a3,a3,-1950 # ffffffffc020d7d0 <CSWTCH.79+0x108>
ffffffffc0205f76:	00006617          	auipc	a2,0x6
ffffffffc0205f7a:	d4260613          	addi	a2,a2,-702 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0205f7e:	1e300593          	li	a1,483
ffffffffc0205f82:	00008517          	auipc	a0,0x8
ffffffffc0205f86:	83650513          	addi	a0,a0,-1994 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0205f8a:	d14fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205f8e <kernel_thread>:
ffffffffc0205f8e:	7129                	addi	sp,sp,-320
ffffffffc0205f90:	fa22                	sd	s0,304(sp)
ffffffffc0205f92:	f626                	sd	s1,296(sp)
ffffffffc0205f94:	f24a                	sd	s2,288(sp)
ffffffffc0205f96:	84ae                	mv	s1,a1
ffffffffc0205f98:	892a                	mv	s2,a0
ffffffffc0205f9a:	8432                	mv	s0,a2
ffffffffc0205f9c:	4581                	li	a1,0
ffffffffc0205f9e:	12000613          	li	a2,288
ffffffffc0205fa2:	850a                	mv	a0,sp
ffffffffc0205fa4:	fe06                	sd	ra,312(sp)
ffffffffc0205fa6:	02f050ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc0205faa:	e0ca                	sd	s2,64(sp)
ffffffffc0205fac:	e4a6                	sd	s1,72(sp)
ffffffffc0205fae:	100027f3          	csrr	a5,sstatus
ffffffffc0205fb2:	edd7f793          	andi	a5,a5,-291
ffffffffc0205fb6:	1207e793          	ori	a5,a5,288
ffffffffc0205fba:	e23e                	sd	a5,256(sp)
ffffffffc0205fbc:	860a                	mv	a2,sp
ffffffffc0205fbe:	10046513          	ori	a0,s0,256
ffffffffc0205fc2:	00000797          	auipc	a5,0x0
ffffffffc0205fc6:	99e78793          	addi	a5,a5,-1634 # ffffffffc0205960 <kernel_thread_entry>
ffffffffc0205fca:	4581                	li	a1,0
ffffffffc0205fcc:	e63e                	sd	a5,264(sp)
ffffffffc0205fce:	b9fff0ef          	jal	ra,ffffffffc0205b6c <do_fork>
ffffffffc0205fd2:	70f2                	ld	ra,312(sp)
ffffffffc0205fd4:	7452                	ld	s0,304(sp)
ffffffffc0205fd6:	74b2                	ld	s1,296(sp)
ffffffffc0205fd8:	7912                	ld	s2,288(sp)
ffffffffc0205fda:	6131                	addi	sp,sp,320
ffffffffc0205fdc:	8082                	ret

ffffffffc0205fde <do_exit>:
ffffffffc0205fde:	7179                	addi	sp,sp,-48
ffffffffc0205fe0:	f022                	sd	s0,32(sp)
ffffffffc0205fe2:	00091417          	auipc	s0,0x91
ffffffffc0205fe6:	8de40413          	addi	s0,s0,-1826 # ffffffffc02968c0 <current>
ffffffffc0205fea:	601c                	ld	a5,0(s0)
ffffffffc0205fec:	f406                	sd	ra,40(sp)
ffffffffc0205fee:	ec26                	sd	s1,24(sp)
ffffffffc0205ff0:	e84a                	sd	s2,16(sp)
ffffffffc0205ff2:	e44e                	sd	s3,8(sp)
ffffffffc0205ff4:	e052                	sd	s4,0(sp)
ffffffffc0205ff6:	00091717          	auipc	a4,0x91
ffffffffc0205ffa:	8d273703          	ld	a4,-1838(a4) # ffffffffc02968c8 <idleproc>
ffffffffc0205ffe:	0ee78763          	beq	a5,a4,ffffffffc02060ec <do_exit+0x10e>
ffffffffc0206002:	00091497          	auipc	s1,0x91
ffffffffc0206006:	8ce48493          	addi	s1,s1,-1842 # ffffffffc02968d0 <initproc>
ffffffffc020600a:	6098                	ld	a4,0(s1)
ffffffffc020600c:	10e78763          	beq	a5,a4,ffffffffc020611a <do_exit+0x13c>
ffffffffc0206010:	0287b983          	ld	s3,40(a5)
ffffffffc0206014:	892a                	mv	s2,a0
ffffffffc0206016:	02098e63          	beqz	s3,ffffffffc0206052 <do_exit+0x74>
ffffffffc020601a:	00091797          	auipc	a5,0x91
ffffffffc020601e:	8767b783          	ld	a5,-1930(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0206022:	577d                	li	a4,-1
ffffffffc0206024:	177e                	slli	a4,a4,0x3f
ffffffffc0206026:	83b1                	srli	a5,a5,0xc
ffffffffc0206028:	8fd9                	or	a5,a5,a4
ffffffffc020602a:	18079073          	csrw	satp,a5
ffffffffc020602e:	0309a783          	lw	a5,48(s3)
ffffffffc0206032:	fff7871b          	addiw	a4,a5,-1
ffffffffc0206036:	02e9a823          	sw	a4,48(s3)
ffffffffc020603a:	c769                	beqz	a4,ffffffffc0206104 <do_exit+0x126>
ffffffffc020603c:	601c                	ld	a5,0(s0)
ffffffffc020603e:	1487b503          	ld	a0,328(a5)
ffffffffc0206042:	0207b423          	sd	zero,40(a5)
ffffffffc0206046:	c511                	beqz	a0,ffffffffc0206052 <do_exit+0x74>
ffffffffc0206048:	491c                	lw	a5,16(a0)
ffffffffc020604a:	fff7871b          	addiw	a4,a5,-1
ffffffffc020604e:	c918                	sw	a4,16(a0)
ffffffffc0206050:	cb59                	beqz	a4,ffffffffc02060e6 <do_exit+0x108>
ffffffffc0206052:	601c                	ld	a5,0(s0)
ffffffffc0206054:	470d                	li	a4,3
ffffffffc0206056:	c398                	sw	a4,0(a5)
ffffffffc0206058:	0f27a423          	sw	s2,232(a5)
ffffffffc020605c:	100027f3          	csrr	a5,sstatus
ffffffffc0206060:	8b89                	andi	a5,a5,2
ffffffffc0206062:	4a01                	li	s4,0
ffffffffc0206064:	e7f9                	bnez	a5,ffffffffc0206132 <do_exit+0x154>
ffffffffc0206066:	6018                	ld	a4,0(s0)
ffffffffc0206068:	800007b7          	lui	a5,0x80000
ffffffffc020606c:	0785                	addi	a5,a5,1
ffffffffc020606e:	7308                	ld	a0,32(a4)
ffffffffc0206070:	0ec52703          	lw	a4,236(a0)
ffffffffc0206074:	0cf70363          	beq	a4,a5,ffffffffc020613a <do_exit+0x15c>
ffffffffc0206078:	6018                	ld	a4,0(s0)
ffffffffc020607a:	7b7c                	ld	a5,240(a4)
ffffffffc020607c:	c3a1                	beqz	a5,ffffffffc02060bc <do_exit+0xde>
ffffffffc020607e:	800009b7          	lui	s3,0x80000
ffffffffc0206082:	490d                	li	s2,3
ffffffffc0206084:	0985                	addi	s3,s3,1
ffffffffc0206086:	a021                	j	ffffffffc020608e <do_exit+0xb0>
ffffffffc0206088:	6018                	ld	a4,0(s0)
ffffffffc020608a:	7b7c                	ld	a5,240(a4)
ffffffffc020608c:	cb85                	beqz	a5,ffffffffc02060bc <do_exit+0xde>
ffffffffc020608e:	1007b683          	ld	a3,256(a5) # ffffffff80000100 <_binary_bin_sfs_img_size+0xffffffff7ff8ae00>
ffffffffc0206092:	6088                	ld	a0,0(s1)
ffffffffc0206094:	fb74                	sd	a3,240(a4)
ffffffffc0206096:	7978                	ld	a4,240(a0)
ffffffffc0206098:	0e07bc23          	sd	zero,248(a5)
ffffffffc020609c:	10e7b023          	sd	a4,256(a5)
ffffffffc02060a0:	c311                	beqz	a4,ffffffffc02060a4 <do_exit+0xc6>
ffffffffc02060a2:	ff7c                	sd	a5,248(a4)
ffffffffc02060a4:	4398                	lw	a4,0(a5)
ffffffffc02060a6:	f388                	sd	a0,32(a5)
ffffffffc02060a8:	f97c                	sd	a5,240(a0)
ffffffffc02060aa:	fd271fe3          	bne	a4,s2,ffffffffc0206088 <do_exit+0xaa>
ffffffffc02060ae:	0ec52783          	lw	a5,236(a0)
ffffffffc02060b2:	fd379be3          	bne	a5,s3,ffffffffc0206088 <do_exit+0xaa>
ffffffffc02060b6:	500010ef          	jal	ra,ffffffffc02075b6 <wakeup_proc>
ffffffffc02060ba:	b7f9                	j	ffffffffc0206088 <do_exit+0xaa>
ffffffffc02060bc:	020a1263          	bnez	s4,ffffffffc02060e0 <do_exit+0x102>
ffffffffc02060c0:	5a8010ef          	jal	ra,ffffffffc0207668 <schedule>
ffffffffc02060c4:	601c                	ld	a5,0(s0)
ffffffffc02060c6:	00007617          	auipc	a2,0x7
ffffffffc02060ca:	74260613          	addi	a2,a2,1858 # ffffffffc020d808 <CSWTCH.79+0x140>
ffffffffc02060ce:	2bb00593          	li	a1,699
ffffffffc02060d2:	43d4                	lw	a3,4(a5)
ffffffffc02060d4:	00007517          	auipc	a0,0x7
ffffffffc02060d8:	6e450513          	addi	a0,a0,1764 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc02060dc:	bc2fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02060e0:	b8dfa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02060e4:	bff1                	j	ffffffffc02060c0 <do_exit+0xe2>
ffffffffc02060e6:	91eff0ef          	jal	ra,ffffffffc0205204 <files_destroy>
ffffffffc02060ea:	b7a5                	j	ffffffffc0206052 <do_exit+0x74>
ffffffffc02060ec:	00007617          	auipc	a2,0x7
ffffffffc02060f0:	6fc60613          	addi	a2,a2,1788 # ffffffffc020d7e8 <CSWTCH.79+0x120>
ffffffffc02060f4:	28600593          	li	a1,646
ffffffffc02060f8:	00007517          	auipc	a0,0x7
ffffffffc02060fc:	6c050513          	addi	a0,a0,1728 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0206100:	b9efa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206104:	854e                	mv	a0,s3
ffffffffc0206106:	dedfd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc020610a:	0189b503          	ld	a0,24(s3) # ffffffff80000018 <_binary_bin_sfs_img_size+0xffffffff7ff8ad18>
ffffffffc020610e:	995ff0ef          	jal	ra,ffffffffc0205aa2 <put_pgdir.isra.0>
ffffffffc0206112:	854e                	mv	a0,s3
ffffffffc0206114:	c43fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206118:	b715                	j	ffffffffc020603c <do_exit+0x5e>
ffffffffc020611a:	00007617          	auipc	a2,0x7
ffffffffc020611e:	6de60613          	addi	a2,a2,1758 # ffffffffc020d7f8 <CSWTCH.79+0x130>
ffffffffc0206122:	28a00593          	li	a1,650
ffffffffc0206126:	00007517          	auipc	a0,0x7
ffffffffc020612a:	69250513          	addi	a0,a0,1682 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc020612e:	b70fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206132:	b41fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0206136:	4a05                	li	s4,1
ffffffffc0206138:	b73d                	j	ffffffffc0206066 <do_exit+0x88>
ffffffffc020613a:	47c010ef          	jal	ra,ffffffffc02075b6 <wakeup_proc>
ffffffffc020613e:	bf2d                	j	ffffffffc0206078 <do_exit+0x9a>

ffffffffc0206140 <do_wait.part.0>:
ffffffffc0206140:	715d                	addi	sp,sp,-80
ffffffffc0206142:	f84a                	sd	s2,48(sp)
ffffffffc0206144:	f44e                	sd	s3,40(sp)
ffffffffc0206146:	80000937          	lui	s2,0x80000
ffffffffc020614a:	6989                	lui	s3,0x2
ffffffffc020614c:	fc26                	sd	s1,56(sp)
ffffffffc020614e:	f052                	sd	s4,32(sp)
ffffffffc0206150:	ec56                	sd	s5,24(sp)
ffffffffc0206152:	e85a                	sd	s6,16(sp)
ffffffffc0206154:	e45e                	sd	s7,8(sp)
ffffffffc0206156:	e486                	sd	ra,72(sp)
ffffffffc0206158:	e0a2                	sd	s0,64(sp)
ffffffffc020615a:	84aa                	mv	s1,a0
ffffffffc020615c:	8a2e                	mv	s4,a1
ffffffffc020615e:	00090b97          	auipc	s7,0x90
ffffffffc0206162:	762b8b93          	addi	s7,s7,1890 # ffffffffc02968c0 <current>
ffffffffc0206166:	00050b1b          	sext.w	s6,a0
ffffffffc020616a:	fff50a9b          	addiw	s5,a0,-1
ffffffffc020616e:	19f9                	addi	s3,s3,-2
ffffffffc0206170:	0905                	addi	s2,s2,1
ffffffffc0206172:	ccbd                	beqz	s1,ffffffffc02061f0 <do_wait.part.0+0xb0>
ffffffffc0206174:	0359e863          	bltu	s3,s5,ffffffffc02061a4 <do_wait.part.0+0x64>
ffffffffc0206178:	45a9                	li	a1,10
ffffffffc020617a:	855a                	mv	a0,s6
ffffffffc020617c:	124050ef          	jal	ra,ffffffffc020b2a0 <hash32>
ffffffffc0206180:	02051793          	slli	a5,a0,0x20
ffffffffc0206184:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0206188:	0008b797          	auipc	a5,0x8b
ffffffffc020618c:	63878793          	addi	a5,a5,1592 # ffffffffc02917c0 <hash_list>
ffffffffc0206190:	953e                	add	a0,a0,a5
ffffffffc0206192:	842a                	mv	s0,a0
ffffffffc0206194:	a029                	j	ffffffffc020619e <do_wait.part.0+0x5e>
ffffffffc0206196:	f2c42783          	lw	a5,-212(s0)
ffffffffc020619a:	02978163          	beq	a5,s1,ffffffffc02061bc <do_wait.part.0+0x7c>
ffffffffc020619e:	6400                	ld	s0,8(s0)
ffffffffc02061a0:	fe851be3          	bne	a0,s0,ffffffffc0206196 <do_wait.part.0+0x56>
ffffffffc02061a4:	5579                	li	a0,-2
ffffffffc02061a6:	60a6                	ld	ra,72(sp)
ffffffffc02061a8:	6406                	ld	s0,64(sp)
ffffffffc02061aa:	74e2                	ld	s1,56(sp)
ffffffffc02061ac:	7942                	ld	s2,48(sp)
ffffffffc02061ae:	79a2                	ld	s3,40(sp)
ffffffffc02061b0:	7a02                	ld	s4,32(sp)
ffffffffc02061b2:	6ae2                	ld	s5,24(sp)
ffffffffc02061b4:	6b42                	ld	s6,16(sp)
ffffffffc02061b6:	6ba2                	ld	s7,8(sp)
ffffffffc02061b8:	6161                	addi	sp,sp,80
ffffffffc02061ba:	8082                	ret
ffffffffc02061bc:	000bb683          	ld	a3,0(s7)
ffffffffc02061c0:	f4843783          	ld	a5,-184(s0)
ffffffffc02061c4:	fed790e3          	bne	a5,a3,ffffffffc02061a4 <do_wait.part.0+0x64>
ffffffffc02061c8:	f2842703          	lw	a4,-216(s0)
ffffffffc02061cc:	478d                	li	a5,3
ffffffffc02061ce:	0ef70b63          	beq	a4,a5,ffffffffc02062c4 <do_wait.part.0+0x184>
ffffffffc02061d2:	4785                	li	a5,1
ffffffffc02061d4:	c29c                	sw	a5,0(a3)
ffffffffc02061d6:	0f26a623          	sw	s2,236(a3)
ffffffffc02061da:	48e010ef          	jal	ra,ffffffffc0207668 <schedule>
ffffffffc02061de:	000bb783          	ld	a5,0(s7)
ffffffffc02061e2:	0b07a783          	lw	a5,176(a5)
ffffffffc02061e6:	8b85                	andi	a5,a5,1
ffffffffc02061e8:	d7c9                	beqz	a5,ffffffffc0206172 <do_wait.part.0+0x32>
ffffffffc02061ea:	555d                	li	a0,-9
ffffffffc02061ec:	df3ff0ef          	jal	ra,ffffffffc0205fde <do_exit>
ffffffffc02061f0:	000bb683          	ld	a3,0(s7)
ffffffffc02061f4:	7ae0                	ld	s0,240(a3)
ffffffffc02061f6:	d45d                	beqz	s0,ffffffffc02061a4 <do_wait.part.0+0x64>
ffffffffc02061f8:	470d                	li	a4,3
ffffffffc02061fa:	a021                	j	ffffffffc0206202 <do_wait.part.0+0xc2>
ffffffffc02061fc:	10043403          	ld	s0,256(s0)
ffffffffc0206200:	d869                	beqz	s0,ffffffffc02061d2 <do_wait.part.0+0x92>
ffffffffc0206202:	401c                	lw	a5,0(s0)
ffffffffc0206204:	fee79ce3          	bne	a5,a4,ffffffffc02061fc <do_wait.part.0+0xbc>
ffffffffc0206208:	00090797          	auipc	a5,0x90
ffffffffc020620c:	6c07b783          	ld	a5,1728(a5) # ffffffffc02968c8 <idleproc>
ffffffffc0206210:	0c878963          	beq	a5,s0,ffffffffc02062e2 <do_wait.part.0+0x1a2>
ffffffffc0206214:	00090797          	auipc	a5,0x90
ffffffffc0206218:	6bc7b783          	ld	a5,1724(a5) # ffffffffc02968d0 <initproc>
ffffffffc020621c:	0cf40363          	beq	s0,a5,ffffffffc02062e2 <do_wait.part.0+0x1a2>
ffffffffc0206220:	000a0663          	beqz	s4,ffffffffc020622c <do_wait.part.0+0xec>
ffffffffc0206224:	0e842783          	lw	a5,232(s0)
ffffffffc0206228:	00fa2023          	sw	a5,0(s4)
ffffffffc020622c:	100027f3          	csrr	a5,sstatus
ffffffffc0206230:	8b89                	andi	a5,a5,2
ffffffffc0206232:	4581                	li	a1,0
ffffffffc0206234:	e7c1                	bnez	a5,ffffffffc02062bc <do_wait.part.0+0x17c>
ffffffffc0206236:	6c70                	ld	a2,216(s0)
ffffffffc0206238:	7074                	ld	a3,224(s0)
ffffffffc020623a:	10043703          	ld	a4,256(s0)
ffffffffc020623e:	7c7c                	ld	a5,248(s0)
ffffffffc0206240:	e614                	sd	a3,8(a2)
ffffffffc0206242:	e290                	sd	a2,0(a3)
ffffffffc0206244:	6470                	ld	a2,200(s0)
ffffffffc0206246:	6874                	ld	a3,208(s0)
ffffffffc0206248:	e614                	sd	a3,8(a2)
ffffffffc020624a:	e290                	sd	a2,0(a3)
ffffffffc020624c:	c319                	beqz	a4,ffffffffc0206252 <do_wait.part.0+0x112>
ffffffffc020624e:	ff7c                	sd	a5,248(a4)
ffffffffc0206250:	7c7c                	ld	a5,248(s0)
ffffffffc0206252:	c3b5                	beqz	a5,ffffffffc02062b6 <do_wait.part.0+0x176>
ffffffffc0206254:	10e7b023          	sd	a4,256(a5)
ffffffffc0206258:	00090717          	auipc	a4,0x90
ffffffffc020625c:	68070713          	addi	a4,a4,1664 # ffffffffc02968d8 <nr_process>
ffffffffc0206260:	431c                	lw	a5,0(a4)
ffffffffc0206262:	37fd                	addiw	a5,a5,-1
ffffffffc0206264:	c31c                	sw	a5,0(a4)
ffffffffc0206266:	e5a9                	bnez	a1,ffffffffc02062b0 <do_wait.part.0+0x170>
ffffffffc0206268:	6814                	ld	a3,16(s0)
ffffffffc020626a:	c02007b7          	lui	a5,0xc0200
ffffffffc020626e:	04f6ee63          	bltu	a3,a5,ffffffffc02062ca <do_wait.part.0+0x18a>
ffffffffc0206272:	00090797          	auipc	a5,0x90
ffffffffc0206276:	6467b783          	ld	a5,1606(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc020627a:	8e9d                	sub	a3,a3,a5
ffffffffc020627c:	82b1                	srli	a3,a3,0xc
ffffffffc020627e:	00090797          	auipc	a5,0x90
ffffffffc0206282:	6227b783          	ld	a5,1570(a5) # ffffffffc02968a0 <npage>
ffffffffc0206286:	06f6fa63          	bgeu	a3,a5,ffffffffc02062fa <do_wait.part.0+0x1ba>
ffffffffc020628a:	0000a517          	auipc	a0,0xa
ffffffffc020628e:	d5653503          	ld	a0,-682(a0) # ffffffffc020ffe0 <nbase>
ffffffffc0206292:	8e89                	sub	a3,a3,a0
ffffffffc0206294:	069a                	slli	a3,a3,0x6
ffffffffc0206296:	00090517          	auipc	a0,0x90
ffffffffc020629a:	61253503          	ld	a0,1554(a0) # ffffffffc02968a8 <pages>
ffffffffc020629e:	9536                	add	a0,a0,a3
ffffffffc02062a0:	4589                	li	a1,2
ffffffffc02062a2:	f09fb0ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02062a6:	8522                	mv	a0,s0
ffffffffc02062a8:	d97fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02062ac:	4501                	li	a0,0
ffffffffc02062ae:	bde5                	j	ffffffffc02061a6 <do_wait.part.0+0x66>
ffffffffc02062b0:	9bdfa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02062b4:	bf55                	j	ffffffffc0206268 <do_wait.part.0+0x128>
ffffffffc02062b6:	701c                	ld	a5,32(s0)
ffffffffc02062b8:	fbf8                	sd	a4,240(a5)
ffffffffc02062ba:	bf79                	j	ffffffffc0206258 <do_wait.part.0+0x118>
ffffffffc02062bc:	9b7fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02062c0:	4585                	li	a1,1
ffffffffc02062c2:	bf95                	j	ffffffffc0206236 <do_wait.part.0+0xf6>
ffffffffc02062c4:	f2840413          	addi	s0,s0,-216
ffffffffc02062c8:	b781                	j	ffffffffc0206208 <do_wait.part.0+0xc8>
ffffffffc02062ca:	00006617          	auipc	a2,0x6
ffffffffc02062ce:	5b660613          	addi	a2,a2,1462 # ffffffffc020c880 <default_pmm_manager+0xe0>
ffffffffc02062d2:	07700593          	li	a1,119
ffffffffc02062d6:	00006517          	auipc	a0,0x6
ffffffffc02062da:	52a50513          	addi	a0,a0,1322 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc02062de:	9c0fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02062e2:	00007617          	auipc	a2,0x7
ffffffffc02062e6:	54660613          	addi	a2,a2,1350 # ffffffffc020d828 <CSWTCH.79+0x160>
ffffffffc02062ea:	4c100593          	li	a1,1217
ffffffffc02062ee:	00007517          	auipc	a0,0x7
ffffffffc02062f2:	4ca50513          	addi	a0,a0,1226 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc02062f6:	9a8fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02062fa:	f8cff0ef          	jal	ra,ffffffffc0205a86 <pa2page.part.0>

ffffffffc02062fe <init_main>:
ffffffffc02062fe:	1101                	addi	sp,sp,-32
ffffffffc0206300:	00007517          	auipc	a0,0x7
ffffffffc0206304:	54850513          	addi	a0,a0,1352 # ffffffffc020d848 <CSWTCH.79+0x180>
ffffffffc0206308:	ec06                	sd	ra,24(sp)
ffffffffc020630a:	e822                	sd	s0,16(sp)
ffffffffc020630c:	e426                	sd	s1,8(sp)
ffffffffc020630e:	e04a                	sd	s2,0(sp)
ffffffffc0206310:	2c9010ef          	jal	ra,ffffffffc0207dd8 <vfs_set_bootfs>
ffffffffc0206314:	12051e63          	bnez	a0,ffffffffc0206450 <init_main+0x152>
ffffffffc0206318:	4581                	li	a1,0
ffffffffc020631a:	00007517          	auipc	a0,0x7
ffffffffc020631e:	55650513          	addi	a0,a0,1366 # ffffffffc020d870 <CSWTCH.79+0x1a8>
ffffffffc0206322:	998ff0ef          	jal	ra,ffffffffc02054ba <sysfile_open>
ffffffffc0206326:	842a                	mv	s0,a0
ffffffffc0206328:	4585                	li	a1,1
ffffffffc020632a:	00007517          	auipc	a0,0x7
ffffffffc020632e:	54e50513          	addi	a0,a0,1358 # ffffffffc020d878 <CSWTCH.79+0x1b0>
ffffffffc0206332:	988ff0ef          	jal	ra,ffffffffc02054ba <sysfile_open>
ffffffffc0206336:	84aa                	mv	s1,a0
ffffffffc0206338:	4585                	li	a1,1
ffffffffc020633a:	00007517          	auipc	a0,0x7
ffffffffc020633e:	53e50513          	addi	a0,a0,1342 # ffffffffc020d878 <CSWTCH.79+0x1b0>
ffffffffc0206342:	978ff0ef          	jal	ra,ffffffffc02054ba <sysfile_open>
ffffffffc0206346:	892a                	mv	s2,a0
ffffffffc0206348:	86aa                	mv	a3,a0
ffffffffc020634a:	8626                	mv	a2,s1
ffffffffc020634c:	85a2                	mv	a1,s0
ffffffffc020634e:	00007517          	auipc	a0,0x7
ffffffffc0206352:	53250513          	addi	a0,a0,1330 # ffffffffc020d880 <CSWTCH.79+0x1b8>
ffffffffc0206356:	e51f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020635a:	e045                	bnez	s0,ffffffffc02063fa <init_main+0xfc>
ffffffffc020635c:	4785                	li	a5,1
ffffffffc020635e:	08f49e63          	bne	s1,a5,ffffffffc02063fa <init_main+0xfc>
ffffffffc0206362:	4789                	li	a5,2
ffffffffc0206364:	08f91b63          	bne	s2,a5,ffffffffc02063fa <init_main+0xfc>
ffffffffc0206368:	e83fb0ef          	jal	ra,ffffffffc02021ea <nr_free_pages>
ffffffffc020636c:	c1ffb0ef          	jal	ra,ffffffffc0201f8a <kallocated>
ffffffffc0206370:	4601                	li	a2,0
ffffffffc0206372:	4581                	li	a1,0
ffffffffc0206374:	00001517          	auipc	a0,0x1
ffffffffc0206378:	c9050513          	addi	a0,a0,-880 # ffffffffc0207004 <user_main>
ffffffffc020637c:	c13ff0ef          	jal	ra,ffffffffc0205f8e <kernel_thread>
ffffffffc0206380:	00a04563          	bgtz	a0,ffffffffc020638a <init_main+0x8c>
ffffffffc0206384:	a855                	j	ffffffffc0206438 <init_main+0x13a>
ffffffffc0206386:	2e2010ef          	jal	ra,ffffffffc0207668 <schedule>
ffffffffc020638a:	4581                	li	a1,0
ffffffffc020638c:	4501                	li	a0,0
ffffffffc020638e:	db3ff0ef          	jal	ra,ffffffffc0206140 <do_wait.part.0>
ffffffffc0206392:	d975                	beqz	a0,ffffffffc0206386 <init_main+0x88>
ffffffffc0206394:	e2bfe0ef          	jal	ra,ffffffffc02051be <fs_cleanup>
ffffffffc0206398:	00007517          	auipc	a0,0x7
ffffffffc020639c:	59050513          	addi	a0,a0,1424 # ffffffffc020d928 <CSWTCH.79+0x260>
ffffffffc02063a0:	e07f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02063a4:	00090797          	auipc	a5,0x90
ffffffffc02063a8:	52c7b783          	ld	a5,1324(a5) # ffffffffc02968d0 <initproc>
ffffffffc02063ac:	7bf8                	ld	a4,240(a5)
ffffffffc02063ae:	e72d                	bnez	a4,ffffffffc0206418 <init_main+0x11a>
ffffffffc02063b0:	7ff8                	ld	a4,248(a5)
ffffffffc02063b2:	e33d                	bnez	a4,ffffffffc0206418 <init_main+0x11a>
ffffffffc02063b4:	1007b703          	ld	a4,256(a5)
ffffffffc02063b8:	e325                	bnez	a4,ffffffffc0206418 <init_main+0x11a>
ffffffffc02063ba:	00090697          	auipc	a3,0x90
ffffffffc02063be:	51e6a683          	lw	a3,1310(a3) # ffffffffc02968d8 <nr_process>
ffffffffc02063c2:	4709                	li	a4,2
ffffffffc02063c4:	0ee69363          	bne	a3,a4,ffffffffc02064aa <init_main+0x1ac>
ffffffffc02063c8:	0008f717          	auipc	a4,0x8f
ffffffffc02063cc:	3f870713          	addi	a4,a4,1016 # ffffffffc02957c0 <proc_list>
ffffffffc02063d0:	6714                	ld	a3,8(a4)
ffffffffc02063d2:	0c878793          	addi	a5,a5,200
ffffffffc02063d6:	0ad79a63          	bne	a5,a3,ffffffffc020648a <init_main+0x18c>
ffffffffc02063da:	6318                	ld	a4,0(a4)
ffffffffc02063dc:	08e79763          	bne	a5,a4,ffffffffc020646a <init_main+0x16c>
ffffffffc02063e0:	00007517          	auipc	a0,0x7
ffffffffc02063e4:	63050513          	addi	a0,a0,1584 # ffffffffc020da10 <CSWTCH.79+0x348>
ffffffffc02063e8:	dbff90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02063ec:	60e2                	ld	ra,24(sp)
ffffffffc02063ee:	6442                	ld	s0,16(sp)
ffffffffc02063f0:	64a2                	ld	s1,8(sp)
ffffffffc02063f2:	6902                	ld	s2,0(sp)
ffffffffc02063f4:	4501                	li	a0,0
ffffffffc02063f6:	6105                	addi	sp,sp,32
ffffffffc02063f8:	8082                	ret
ffffffffc02063fa:	87ca                	mv	a5,s2
ffffffffc02063fc:	8726                	mv	a4,s1
ffffffffc02063fe:	86a2                	mv	a3,s0
ffffffffc0206400:	00007617          	auipc	a2,0x7
ffffffffc0206404:	4c060613          	addi	a2,a2,1216 # ffffffffc020d8c0 <CSWTCH.79+0x1f8>
ffffffffc0206408:	52e00593          	li	a1,1326
ffffffffc020640c:	00007517          	auipc	a0,0x7
ffffffffc0206410:	3ac50513          	addi	a0,a0,940 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0206414:	88afa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206418:	00007697          	auipc	a3,0x7
ffffffffc020641c:	53868693          	addi	a3,a3,1336 # ffffffffc020d950 <CSWTCH.79+0x288>
ffffffffc0206420:	00006617          	auipc	a2,0x6
ffffffffc0206424:	89860613          	addi	a2,a2,-1896 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0206428:	54300593          	li	a1,1347
ffffffffc020642c:	00007517          	auipc	a0,0x7
ffffffffc0206430:	38c50513          	addi	a0,a0,908 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0206434:	86afa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206438:	00007617          	auipc	a2,0x7
ffffffffc020643c:	4d060613          	addi	a2,a2,1232 # ffffffffc020d908 <CSWTCH.79+0x240>
ffffffffc0206440:	53700593          	li	a1,1335
ffffffffc0206444:	00007517          	auipc	a0,0x7
ffffffffc0206448:	37450513          	addi	a0,a0,884 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc020644c:	852fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206450:	86aa                	mv	a3,a0
ffffffffc0206452:	00007617          	auipc	a2,0x7
ffffffffc0206456:	3fe60613          	addi	a2,a2,1022 # ffffffffc020d850 <CSWTCH.79+0x188>
ffffffffc020645a:	52200593          	li	a1,1314
ffffffffc020645e:	00007517          	auipc	a0,0x7
ffffffffc0206462:	35a50513          	addi	a0,a0,858 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0206466:	838fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020646a:	00007697          	auipc	a3,0x7
ffffffffc020646e:	57668693          	addi	a3,a3,1398 # ffffffffc020d9e0 <CSWTCH.79+0x318>
ffffffffc0206472:	00006617          	auipc	a2,0x6
ffffffffc0206476:	84660613          	addi	a2,a2,-1978 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020647a:	54600593          	li	a1,1350
ffffffffc020647e:	00007517          	auipc	a0,0x7
ffffffffc0206482:	33a50513          	addi	a0,a0,826 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0206486:	818fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020648a:	00007697          	auipc	a3,0x7
ffffffffc020648e:	52668693          	addi	a3,a3,1318 # ffffffffc020d9b0 <CSWTCH.79+0x2e8>
ffffffffc0206492:	00006617          	auipc	a2,0x6
ffffffffc0206496:	82660613          	addi	a2,a2,-2010 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020649a:	54500593          	li	a1,1349
ffffffffc020649e:	00007517          	auipc	a0,0x7
ffffffffc02064a2:	31a50513          	addi	a0,a0,794 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc02064a6:	ff9f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02064aa:	00007697          	auipc	a3,0x7
ffffffffc02064ae:	4f668693          	addi	a3,a3,1270 # ffffffffc020d9a0 <CSWTCH.79+0x2d8>
ffffffffc02064b2:	00006617          	auipc	a2,0x6
ffffffffc02064b6:	80660613          	addi	a2,a2,-2042 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02064ba:	54400593          	li	a1,1348
ffffffffc02064be:	00007517          	auipc	a0,0x7
ffffffffc02064c2:	2fa50513          	addi	a0,a0,762 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc02064c6:	fd9f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02064ca <do_execve>:
ffffffffc02064ca:	d8010113          	addi	sp,sp,-640
ffffffffc02064ce:	25413823          	sd	s4,592(sp)
ffffffffc02064d2:	00090a17          	auipc	s4,0x90
ffffffffc02064d6:	3eea0a13          	addi	s4,s4,1006 # ffffffffc02968c0 <current>
ffffffffc02064da:	000a3783          	ld	a5,0(s4)
ffffffffc02064de:	26813823          	sd	s0,624(sp)
ffffffffc02064e2:	842e                	mv	s0,a1
ffffffffc02064e4:	26913423          	sd	s1,616(sp)
ffffffffc02064e8:	25313c23          	sd	s3,600(sp)
ffffffffc02064ec:	25513423          	sd	s5,584(sp)
ffffffffc02064f0:	85aa                	mv	a1,a0
ffffffffc02064f2:	fff4099b          	addiw	s3,s0,-1
ffffffffc02064f6:	84aa                	mv	s1,a0
ffffffffc02064f8:	8ab2                	mv	s5,a2
ffffffffc02064fa:	00007517          	auipc	a0,0x7
ffffffffc02064fe:	53650513          	addi	a0,a0,1334 # ffffffffc020da30 <CSWTCH.79+0x368>
ffffffffc0206502:	8622                	mv	a2,s0
ffffffffc0206504:	27213023          	sd	s2,608(sp)
ffffffffc0206508:	26113c23          	sd	ra,632(sp)
ffffffffc020650c:	0287b903          	ld	s2,40(a5)
ffffffffc0206510:	25613023          	sd	s6,576(sp)
ffffffffc0206514:	23713c23          	sd	s7,568(sp)
ffffffffc0206518:	23813823          	sd	s8,560(sp)
ffffffffc020651c:	23913423          	sd	s9,552(sp)
ffffffffc0206520:	23a13023          	sd	s10,544(sp)
ffffffffc0206524:	21b13c23          	sd	s11,536(sp)
ffffffffc0206528:	d04e                	sw	s3,32(sp)
ffffffffc020652a:	c7df90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020652e:	0004069b          	sext.w	a3,s0
ffffffffc0206532:	0009871b          	sext.w	a4,s3
ffffffffc0206536:	47fd                	li	a5,31
ffffffffc0206538:	e4b6                	sd	a3,72(sp)
ffffffffc020653a:	0ce7e0e3          	bltu	a5,a4,ffffffffc0206dfa <do_execve+0x930>
ffffffffc020653e:	4641                	li	a2,16
ffffffffc0206540:	4581                	li	a1,0
ffffffffc0206542:	0128                	addi	a0,sp,136
ffffffffc0206544:	290050ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc0206548:	00090c63          	beqz	s2,ffffffffc0206560 <do_execve+0x96>
ffffffffc020654c:	03890513          	addi	a0,s2,56 # ffffffff80000038 <_binary_bin_sfs_img_size+0xffffffff7ff8ad38>
ffffffffc0206550:	814fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0206554:	000a3783          	ld	a5,0(s4)
ffffffffc0206558:	c781                	beqz	a5,ffffffffc0206560 <do_execve+0x96>
ffffffffc020655a:	43dc                	lw	a5,4(a5)
ffffffffc020655c:	04f92823          	sw	a5,80(s2)
ffffffffc0206560:	28048563          	beqz	s1,ffffffffc02067ea <do_execve+0x320>
ffffffffc0206564:	46c1                	li	a3,16
ffffffffc0206566:	8626                	mv	a2,s1
ffffffffc0206568:	012c                	addi	a1,sp,136
ffffffffc020656a:	854a                	mv	a0,s2
ffffffffc020656c:	e21fd0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc0206570:	08050be3          	beqz	a0,ffffffffc0206e06 <do_execve+0x93c>
ffffffffc0206574:	00341793          	slli	a5,s0,0x3
ffffffffc0206578:	4681                	li	a3,0
ffffffffc020657a:	863e                	mv	a2,a5
ffffffffc020657c:	85d6                	mv	a1,s5
ffffffffc020657e:	854a                	mv	a0,s2
ffffffffc0206580:	f43e                	sd	a5,40(sp)
ffffffffc0206582:	d11fd0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc0206586:	06050ee3          	beqz	a0,ffffffffc0206e02 <do_execve+0x938>
ffffffffc020658a:	11010d13          	addi	s10,sp,272
ffffffffc020658e:	8b6a                	mv	s6,s10
ffffffffc0206590:	4481                	li	s1,0
ffffffffc0206592:	6505                	lui	a0,0x1
ffffffffc0206594:	9fbfb0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0206598:	89aa                	mv	s3,a0
ffffffffc020659a:	1a050e63          	beqz	a0,ffffffffc0206756 <do_execve+0x28c>
ffffffffc020659e:	000ab603          	ld	a2,0(s5)
ffffffffc02065a2:	85aa                	mv	a1,a0
ffffffffc02065a4:	6685                	lui	a3,0x1
ffffffffc02065a6:	854a                	mv	a0,s2
ffffffffc02065a8:	de5fd0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc02065ac:	22050a63          	beqz	a0,ffffffffc02067e0 <do_execve+0x316>
ffffffffc02065b0:	013b3023          	sd	s3,0(s6)
ffffffffc02065b4:	2485                	addiw	s1,s1,1
ffffffffc02065b6:	0b21                	addi	s6,s6,8
ffffffffc02065b8:	0aa1                	addi	s5,s5,8
ffffffffc02065ba:	fc941ce3          	bne	s0,s1,ffffffffc0206592 <do_execve+0xc8>
ffffffffc02065be:	6cd2                	ld	s9,272(sp)
ffffffffc02065c0:	16090063          	beqz	s2,ffffffffc0206720 <do_execve+0x256>
ffffffffc02065c4:	03890513          	addi	a0,s2,56
ffffffffc02065c8:	f99fd0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02065cc:	85e6                	mv	a1,s9
ffffffffc02065ce:	04092823          	sw	zero,80(s2)
ffffffffc02065d2:	00007517          	auipc	a0,0x7
ffffffffc02065d6:	4de50513          	addi	a0,a0,1246 # ffffffffc020dab0 <CSWTCH.79+0x3e8>
ffffffffc02065da:	bcdf90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02065de:	4581                	li	a1,0
ffffffffc02065e0:	8566                	mv	a0,s9
ffffffffc02065e2:	ed9fe0ef          	jal	ra,ffffffffc02054ba <sysfile_open>
ffffffffc02065e6:	8baa                	mv	s7,a0
ffffffffc02065e8:	0a0546e3          	bltz	a0,ffffffffc0206e94 <do_execve+0x9ca>
ffffffffc02065ec:	85aa                	mv	a1,a0
ffffffffc02065ee:	00007517          	auipc	a0,0x7
ffffffffc02065f2:	50250513          	addi	a0,a0,1282 # ffffffffc020daf0 <CSWTCH.79+0x428>
ffffffffc02065f6:	bb1f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02065fa:	00008517          	auipc	a0,0x8
ffffffffc02065fe:	9e650513          	addi	a0,a0,-1562 # ffffffffc020dfe0 <CSWTCH.79+0x918>
ffffffffc0206602:	ba5f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206606:	00090797          	auipc	a5,0x90
ffffffffc020660a:	28a7b783          	ld	a5,650(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc020660e:	577d                	li	a4,-1
ffffffffc0206610:	177e                	slli	a4,a4,0x3f
ffffffffc0206612:	83b1                	srli	a5,a5,0xc
ffffffffc0206614:	8fd9                	or	a5,a5,a4
ffffffffc0206616:	18079073          	csrw	satp,a5
ffffffffc020661a:	03092783          	lw	a5,48(s2)
ffffffffc020661e:	fff7871b          	addiw	a4,a5,-1
ffffffffc0206622:	02e92823          	sw	a4,48(s2)
ffffffffc0206626:	1c070e63          	beqz	a4,ffffffffc0206802 <do_execve+0x338>
ffffffffc020662a:	000a3783          	ld	a5,0(s4)
ffffffffc020662e:	0207b423          	sd	zero,40(a5)
ffffffffc0206632:	85de                	mv	a1,s7
ffffffffc0206634:	00008517          	auipc	a0,0x8
ffffffffc0206638:	98450513          	addi	a0,a0,-1660 # ffffffffc020dfb8 <CSWTCH.79+0x8f0>
ffffffffc020663c:	b6bf90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206640:	000a3783          	ld	a5,0(s4)
ffffffffc0206644:	779c                	ld	a5,40(a5)
ffffffffc0206646:	060792e3          	bnez	a5,ffffffffc0206eaa <do_execve+0x9e0>
ffffffffc020664a:	dbefd0ef          	jal	ra,ffffffffc0203c08 <mm_create>
ffffffffc020664e:	892a                	mv	s2,a0
ffffffffc0206650:	10050163          	beqz	a0,ffffffffc0206752 <do_execve+0x288>
ffffffffc0206654:	4505                	li	a0,1
ffffffffc0206656:	b17fb0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020665a:	0e050963          	beqz	a0,ffffffffc020674c <do_execve+0x282>
ffffffffc020665e:	00090b17          	auipc	s6,0x90
ffffffffc0206662:	24ab0b13          	addi	s6,s6,586 # ffffffffc02968a8 <pages>
ffffffffc0206666:	000b3683          	ld	a3,0(s6)
ffffffffc020666a:	0000a717          	auipc	a4,0xa
ffffffffc020666e:	97673703          	ld	a4,-1674(a4) # ffffffffc020ffe0 <nbase>
ffffffffc0206672:	00090d97          	auipc	s11,0x90
ffffffffc0206676:	22ed8d93          	addi	s11,s11,558 # ffffffffc02968a0 <npage>
ffffffffc020667a:	40d506b3          	sub	a3,a0,a3
ffffffffc020667e:	8699                	srai	a3,a3,0x6
ffffffffc0206680:	96ba                	add	a3,a3,a4
ffffffffc0206682:	ec3a                	sd	a4,24(sp)
ffffffffc0206684:	000db783          	ld	a5,0(s11)
ffffffffc0206688:	577d                	li	a4,-1
ffffffffc020668a:	8331                	srli	a4,a4,0xc
ffffffffc020668c:	e83a                	sd	a4,16(sp)
ffffffffc020668e:	8f75                	and	a4,a4,a3
ffffffffc0206690:	06b2                	slli	a3,a3,0xc
ffffffffc0206692:	7ef77563          	bgeu	a4,a5,ffffffffc0206e7c <do_execve+0x9b2>
ffffffffc0206696:	00090797          	auipc	a5,0x90
ffffffffc020669a:	22278793          	addi	a5,a5,546 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020669e:	0007b983          	ld	s3,0(a5)
ffffffffc02066a2:	6605                	lui	a2,0x1
ffffffffc02066a4:	00090597          	auipc	a1,0x90
ffffffffc02066a8:	1f45b583          	ld	a1,500(a1) # ffffffffc0296898 <boot_pgdir_va>
ffffffffc02066ac:	99b6                	add	s3,s3,a3
ffffffffc02066ae:	854e                	mv	a0,s3
ffffffffc02066b0:	176050ef          	jal	ra,ffffffffc020b826 <memcpy>
ffffffffc02066b4:	4601                	li	a2,0
ffffffffc02066b6:	01393c23          	sd	s3,24(s2)
ffffffffc02066ba:	4581                	li	a1,0
ffffffffc02066bc:	855e                	mv	a0,s7
ffffffffc02066be:	862ff0ef          	jal	ra,ffffffffc0205720 <sysfile_seek>
ffffffffc02066c2:	89aa                	mv	s3,a0
ffffffffc02066c4:	14050a63          	beqz	a0,ffffffffc0206818 <do_execve+0x34e>
ffffffffc02066c8:	01893503          	ld	a0,24(s2)
ffffffffc02066cc:	bd6ff0ef          	jal	ra,ffffffffc0205aa2 <put_pgdir.isra.0>
ffffffffc02066d0:	854a                	mv	a0,s2
ffffffffc02066d2:	e84fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc02066d6:	85ce                	mv	a1,s3
ffffffffc02066d8:	00008517          	auipc	a0,0x8
ffffffffc02066dc:	88050513          	addi	a0,a0,-1920 # ffffffffc020df58 <CSWTCH.79+0x890>
ffffffffc02066e0:	ac7f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02066e4:	8bce                	mv	s7,s3
ffffffffc02066e6:	85de                	mv	a1,s7
ffffffffc02066e8:	00008517          	auipc	a0,0x8
ffffffffc02066ec:	8b050513          	addi	a0,a0,-1872 # ffffffffc020df98 <CSWTCH.79+0x8d0>
ffffffffc02066f0:	ab7f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02066f4:	77a2                	ld	a5,40(sp)
ffffffffc02066f6:	ff0d0493          	addi	s1,s10,-16
ffffffffc02066fa:	147d                	addi	s0,s0,-1
ffffffffc02066fc:	94be                	add	s1,s1,a5
ffffffffc02066fe:	7782                	ld	a5,32(sp)
ffffffffc0206700:	040e                	slli	s0,s0,0x3
ffffffffc0206702:	946a                	add	s0,s0,s10
ffffffffc0206704:	02079713          	slli	a4,a5,0x20
ffffffffc0206708:	01d75793          	srli	a5,a4,0x1d
ffffffffc020670c:	8c9d                	sub	s1,s1,a5
ffffffffc020670e:	6008                	ld	a0,0(s0)
ffffffffc0206710:	1461                	addi	s0,s0,-8
ffffffffc0206712:	92dfb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206716:	fe941ce3          	bne	s0,s1,ffffffffc020670e <do_execve+0x244>
ffffffffc020671a:	855e                	mv	a0,s7
ffffffffc020671c:	8c3ff0ef          	jal	ra,ffffffffc0205fde <do_exit>
ffffffffc0206720:	85e6                	mv	a1,s9
ffffffffc0206722:	00007517          	auipc	a0,0x7
ffffffffc0206726:	38e50513          	addi	a0,a0,910 # ffffffffc020dab0 <CSWTCH.79+0x3e8>
ffffffffc020672a:	a7df90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020672e:	4581                	li	a1,0
ffffffffc0206730:	8566                	mv	a0,s9
ffffffffc0206732:	d89fe0ef          	jal	ra,ffffffffc02054ba <sysfile_open>
ffffffffc0206736:	8baa                	mv	s7,a0
ffffffffc0206738:	74054e63          	bltz	a0,ffffffffc0206e94 <do_execve+0x9ca>
ffffffffc020673c:	85aa                	mv	a1,a0
ffffffffc020673e:	00007517          	auipc	a0,0x7
ffffffffc0206742:	3b250513          	addi	a0,a0,946 # ffffffffc020daf0 <CSWTCH.79+0x428>
ffffffffc0206746:	a61f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020674a:	b5e5                	j	ffffffffc0206632 <do_execve+0x168>
ffffffffc020674c:	854a                	mv	a0,s2
ffffffffc020674e:	e08fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206752:	59f1                	li	s3,-4
ffffffffc0206754:	b749                	j	ffffffffc02066d6 <do_execve+0x20c>
ffffffffc0206756:	59f1                	li	s3,-4
ffffffffc0206758:	c49d                	beqz	s1,ffffffffc0206786 <do_execve+0x2bc>
ffffffffc020675a:	00349713          	slli	a4,s1,0x3
ffffffffc020675e:	fff48413          	addi	s0,s1,-1
ffffffffc0206762:	ff0d0793          	addi	a5,s10,-16
ffffffffc0206766:	34fd                	addiw	s1,s1,-1
ffffffffc0206768:	97ba                	add	a5,a5,a4
ffffffffc020676a:	02049713          	slli	a4,s1,0x20
ffffffffc020676e:	040e                	slli	s0,s0,0x3
ffffffffc0206770:	01d75493          	srli	s1,a4,0x1d
ffffffffc0206774:	946a                	add	s0,s0,s10
ffffffffc0206776:	409784b3          	sub	s1,a5,s1
ffffffffc020677a:	6008                	ld	a0,0(s0)
ffffffffc020677c:	1461                	addi	s0,s0,-8
ffffffffc020677e:	8c1fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206782:	fe849ce3          	bne	s1,s0,ffffffffc020677a <do_execve+0x2b0>
ffffffffc0206786:	85ce                	mv	a1,s3
ffffffffc0206788:	00007517          	auipc	a0,0x7
ffffffffc020678c:	30050513          	addi	a0,a0,768 # ffffffffc020da88 <CSWTCH.79+0x3c0>
ffffffffc0206790:	a17f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206794:	00090863          	beqz	s2,ffffffffc02067a4 <do_execve+0x2da>
ffffffffc0206798:	03890513          	addi	a0,s2,56
ffffffffc020679c:	dc5fd0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02067a0:	04092823          	sw	zero,80(s2)
ffffffffc02067a4:	27813083          	ld	ra,632(sp)
ffffffffc02067a8:	27013403          	ld	s0,624(sp)
ffffffffc02067ac:	26813483          	ld	s1,616(sp)
ffffffffc02067b0:	26013903          	ld	s2,608(sp)
ffffffffc02067b4:	25013a03          	ld	s4,592(sp)
ffffffffc02067b8:	24813a83          	ld	s5,584(sp)
ffffffffc02067bc:	24013b03          	ld	s6,576(sp)
ffffffffc02067c0:	23813b83          	ld	s7,568(sp)
ffffffffc02067c4:	23013c03          	ld	s8,560(sp)
ffffffffc02067c8:	22813c83          	ld	s9,552(sp)
ffffffffc02067cc:	22013d03          	ld	s10,544(sp)
ffffffffc02067d0:	21813d83          	ld	s11,536(sp)
ffffffffc02067d4:	854e                	mv	a0,s3
ffffffffc02067d6:	25813983          	ld	s3,600(sp)
ffffffffc02067da:	28010113          	addi	sp,sp,640
ffffffffc02067de:	8082                	ret
ffffffffc02067e0:	854e                	mv	a0,s3
ffffffffc02067e2:	85dfb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02067e6:	59f5                	li	s3,-3
ffffffffc02067e8:	bf85                	j	ffffffffc0206758 <do_execve+0x28e>
ffffffffc02067ea:	000a3783          	ld	a5,0(s4)
ffffffffc02067ee:	00007617          	auipc	a2,0x7
ffffffffc02067f2:	26a60613          	addi	a2,a2,618 # ffffffffc020da58 <CSWTCH.79+0x390>
ffffffffc02067f6:	45c1                	li	a1,16
ffffffffc02067f8:	43d4                	lw	a3,4(a5)
ffffffffc02067fa:	0128                	addi	a0,sp,136
ffffffffc02067fc:	6e9040ef          	jal	ra,ffffffffc020b6e4 <snprintf>
ffffffffc0206800:	bb95                	j	ffffffffc0206574 <do_execve+0xaa>
ffffffffc0206802:	854a                	mv	a0,s2
ffffffffc0206804:	eeefd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0206808:	01893503          	ld	a0,24(s2)
ffffffffc020680c:	a96ff0ef          	jal	ra,ffffffffc0205aa2 <put_pgdir.isra.0>
ffffffffc0206810:	854a                	mv	a0,s2
ffffffffc0206812:	d44fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206816:	bd11                	j	ffffffffc020662a <do_execve+0x160>
ffffffffc0206818:	04000613          	li	a2,64
ffffffffc020681c:	098c                	addi	a1,sp,208
ffffffffc020681e:	855e                	mv	a0,s7
ffffffffc0206820:	cd3fe0ef          	jal	ra,ffffffffc02054f2 <sysfile_read>
ffffffffc0206824:	04000793          	li	a5,64
ffffffffc0206828:	00f50863          	beq	a0,a5,ffffffffc0206838 <do_execve+0x36e>
ffffffffc020682c:	0005099b          	sext.w	s3,a0
ffffffffc0206830:	e8054ce3          	bltz	a0,ffffffffc02066c8 <do_execve+0x1fe>
ffffffffc0206834:	59fd                	li	s3,-1
ffffffffc0206836:	bd49                	j	ffffffffc02066c8 <do_execve+0x1fe>
ffffffffc0206838:	474e                	lw	a4,208(sp)
ffffffffc020683a:	464c47b7          	lui	a5,0x464c4
ffffffffc020683e:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644f27f>
ffffffffc0206842:	48f71a63          	bne	a4,a5,ffffffffc0206cd6 <do_execve+0x80c>
ffffffffc0206846:	10815783          	lhu	a5,264(sp)
ffffffffc020684a:	f802                	sd	zero,48(sp)
ffffffffc020684c:	f082                	sd	zero,96(sp)
ffffffffc020684e:	16078a63          	beqz	a5,ffffffffc02069c2 <do_execve+0x4f8>
ffffffffc0206852:	f8a6                	sd	s1,112(sp)
ffffffffc0206854:	fce6                	sd	s9,120(sp)
ffffffffc0206856:	f4ce                	sd	s3,104(sp)
ffffffffc0206858:	eca2                	sd	s0,88(sp)
ffffffffc020685a:	75ce                	ld	a1,240(sp)
ffffffffc020685c:	77c2                	ld	a5,48(sp)
ffffffffc020685e:	4601                	li	a2,0
ffffffffc0206860:	855e                	mv	a0,s7
ffffffffc0206862:	95be                	add	a1,a1,a5
ffffffffc0206864:	ebdfe0ef          	jal	ra,ffffffffc0205720 <sysfile_seek>
ffffffffc0206868:	e42a                	sd	a0,8(sp)
ffffffffc020686a:	12051163          	bnez	a0,ffffffffc020698c <do_execve+0x4c2>
ffffffffc020686e:	03800613          	li	a2,56
ffffffffc0206872:	092c                	addi	a1,sp,152
ffffffffc0206874:	855e                	mv	a0,s7
ffffffffc0206876:	c7dfe0ef          	jal	ra,ffffffffc02054f2 <sysfile_read>
ffffffffc020687a:	03800793          	li	a5,56
ffffffffc020687e:	10f50963          	beq	a0,a5,ffffffffc0206990 <do_execve+0x4c6>
ffffffffc0206882:	6466                	ld	s0,88(sp)
ffffffffc0206884:	8c2a                	mv	s8,a0
ffffffffc0206886:	00054363          	bltz	a0,ffffffffc020688c <do_execve+0x3c2>
ffffffffc020688a:	5c7d                	li	s8,-1
ffffffffc020688c:	000c079b          	sext.w	a5,s8
ffffffffc0206890:	e43e                	sd	a5,8(sp)
ffffffffc0206892:	854a                	mv	a0,s2
ffffffffc0206894:	e5efd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0206898:	01893503          	ld	a0,24(s2)
ffffffffc020689c:	69a2                	ld	s3,8(sp)
ffffffffc020689e:	a04ff0ef          	jal	ra,ffffffffc0205aa2 <put_pgdir.isra.0>
ffffffffc02068a2:	854a                	mv	a0,s2
ffffffffc02068a4:	cb2fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc02068a8:	b53d                	j	ffffffffc02066d6 <do_execve+0x20c>
ffffffffc02068aa:	47fa                	lw	a5,156(sp)
ffffffffc02068ac:	4745                	li	a4,17
ffffffffc02068ae:	e8ba                	sd	a4,80(sp)
ffffffffc02068b0:	0047f693          	andi	a3,a5,4
ffffffffc02068b4:	c681                	beqz	a3,ffffffffc02068bc <do_execve+0x3f2>
ffffffffc02068b6:	474d                	li	a4,19
ffffffffc02068b8:	4685                	li	a3,1
ffffffffc02068ba:	e8ba                	sd	a4,80(sp)
ffffffffc02068bc:	0027f713          	andi	a4,a5,2
ffffffffc02068c0:	c709                	beqz	a4,ffffffffc02068ca <do_execve+0x400>
ffffffffc02068c2:	475d                	li	a4,23
ffffffffc02068c4:	0026e693          	ori	a3,a3,2
ffffffffc02068c8:	e8ba                	sd	a4,80(sp)
ffffffffc02068ca:	8b85                	andi	a5,a5,1
ffffffffc02068cc:	c799                	beqz	a5,ffffffffc02068da <do_execve+0x410>
ffffffffc02068ce:	67c6                	ld	a5,80(sp)
ffffffffc02068d0:	0046e693          	ori	a3,a3,4
ffffffffc02068d4:	0087e793          	ori	a5,a5,8
ffffffffc02068d8:	e8be                	sd	a5,80(sp)
ffffffffc02068da:	75aa                	ld	a1,168(sp)
ffffffffc02068dc:	4701                	li	a4,0
ffffffffc02068de:	854a                	mv	a0,s2
ffffffffc02068e0:	cc8fd0ef          	jal	ra,ffffffffc0203da8 <mm_map>
ffffffffc02068e4:	e42a                	sd	a0,8(sp)
ffffffffc02068e6:	e15d                	bnez	a0,ffffffffc020698c <do_execve+0x4c2>
ffffffffc02068e8:	7caa                	ld	s9,168(sp)
ffffffffc02068ea:	7c6a                	ld	s8,184(sp)
ffffffffc02068ec:	76fd                	lui	a3,0xfffff
ffffffffc02068ee:	00dcf4b3          	and	s1,s9,a3
ffffffffc02068f2:	9c66                	add	s8,s8,s9
ffffffffc02068f4:	538cfd63          	bgeu	s9,s8,ffffffffc0206e2e <do_execve+0x964>
ffffffffc02068f8:	57f1                	li	a5,-4
ffffffffc02068fa:	8426                	mv	s0,s1
ffffffffc02068fc:	e43e                	sd	a5,8(sp)
ffffffffc02068fe:	84e6                	mv	s1,s9
ffffffffc0206900:	a015                	j	ffffffffc0206924 <do_execve+0x45a>
ffffffffc0206902:	7762                	ld	a4,56(sp)
ffffffffc0206904:	6786                	ld	a5,64(sp)
ffffffffc0206906:	40848433          	sub	s0,s1,s0
ffffffffc020690a:	8656                	mv	a2,s5
ffffffffc020690c:	00f705b3          	add	a1,a4,a5
ffffffffc0206910:	95a2                	add	a1,a1,s0
ffffffffc0206912:	855e                	mv	a0,s7
ffffffffc0206914:	bdffe0ef          	jal	ra,ffffffffc02054f2 <sysfile_read>
ffffffffc0206918:	f6aa95e3          	bne	s5,a0,ffffffffc0206882 <do_execve+0x3b8>
ffffffffc020691c:	94d6                	add	s1,s1,s5
ffffffffc020691e:	8466                	mv	s0,s9
ffffffffc0206920:	4584f863          	bgeu	s1,s8,ffffffffc0206d70 <do_execve+0x8a6>
ffffffffc0206924:	01893503          	ld	a0,24(s2)
ffffffffc0206928:	6646                	ld	a2,80(sp)
ffffffffc020692a:	85a2                	mv	a1,s0
ffffffffc020692c:	9f6fd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206930:	89aa                	mv	s3,a0
ffffffffc0206932:	40050e63          	beqz	a0,ffffffffc0206d4e <do_execve+0x884>
ffffffffc0206936:	6785                	lui	a5,0x1
ffffffffc0206938:	00f40cb3          	add	s9,s0,a5
ffffffffc020693c:	409c8ab3          	sub	s5,s9,s1
ffffffffc0206940:	019c7463          	bgeu	s8,s9,ffffffffc0206948 <do_execve+0x47e>
ffffffffc0206944:	409c0ab3          	sub	s5,s8,s1
ffffffffc0206948:	000b3583          	ld	a1,0(s6)
ffffffffc020694c:	67e2                	ld	a5,24(sp)
ffffffffc020694e:	000db603          	ld	a2,0(s11)
ffffffffc0206952:	40b985b3          	sub	a1,s3,a1
ffffffffc0206956:	8599                	srai	a1,a1,0x6
ffffffffc0206958:	95be                	add	a1,a1,a5
ffffffffc020695a:	67c2                	ld	a5,16(sp)
ffffffffc020695c:	00f5f533          	and	a0,a1,a5
ffffffffc0206960:	00c59793          	slli	a5,a1,0xc
ffffffffc0206964:	fc3e                	sd	a5,56(sp)
ffffffffc0206966:	50c57a63          	bgeu	a0,a2,ffffffffc0206e7a <do_execve+0x9b0>
ffffffffc020696a:	758a                	ld	a1,160(sp)
ffffffffc020696c:	732a                	ld	t1,168(sp)
ffffffffc020696e:	00090797          	auipc	a5,0x90
ffffffffc0206972:	f4a78793          	addi	a5,a5,-182 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206976:	639c                	ld	a5,0(a5)
ffffffffc0206978:	406585b3          	sub	a1,a1,t1
ffffffffc020697c:	4601                	li	a2,0
ffffffffc020697e:	855e                	mv	a0,s7
ffffffffc0206980:	95a6                	add	a1,a1,s1
ffffffffc0206982:	e0be                	sd	a5,64(sp)
ffffffffc0206984:	d9dfe0ef          	jal	ra,ffffffffc0205720 <sysfile_seek>
ffffffffc0206988:	e42a                	sd	a0,8(sp)
ffffffffc020698a:	dd25                	beqz	a0,ffffffffc0206902 <do_execve+0x438>
ffffffffc020698c:	6466                	ld	s0,88(sp)
ffffffffc020698e:	b711                	j	ffffffffc0206892 <do_execve+0x3c8>
ffffffffc0206990:	47ea                	lw	a5,152(sp)
ffffffffc0206992:	4705                	li	a4,1
ffffffffc0206994:	00e79863          	bne	a5,a4,ffffffffc02069a4 <do_execve+0x4da>
ffffffffc0206998:	77ea                	ld	a5,184(sp)
ffffffffc020699a:	660e                	ld	a2,192(sp)
ffffffffc020699c:	48f66563          	bltu	a2,a5,ffffffffc0206e26 <do_execve+0x95c>
ffffffffc02069a0:	f00795e3          	bnez	a5,ffffffffc02068aa <do_execve+0x3e0>
ffffffffc02069a4:	7706                	ld	a4,96(sp)
ffffffffc02069a6:	76c2                	ld	a3,48(sp)
ffffffffc02069a8:	10815783          	lhu	a5,264(sp)
ffffffffc02069ac:	2705                	addiw	a4,a4,1
ffffffffc02069ae:	03868693          	addi	a3,a3,56 # fffffffffffff038 <end+0x3fd68728>
ffffffffc02069b2:	f0ba                	sd	a4,96(sp)
ffffffffc02069b4:	f836                	sd	a3,48(sp)
ffffffffc02069b6:	eaf762e3          	bltu	a4,a5,ffffffffc020685a <do_execve+0x390>
ffffffffc02069ba:	74c6                	ld	s1,112(sp)
ffffffffc02069bc:	7ce6                	ld	s9,120(sp)
ffffffffc02069be:	79a6                	ld	s3,104(sp)
ffffffffc02069c0:	6466                	ld	s0,88(sp)
ffffffffc02069c2:	855e                	mv	a0,s7
ffffffffc02069c4:	b2bfe0ef          	jal	ra,ffffffffc02054ee <sysfile_close>
ffffffffc02069c8:	4701                	li	a4,0
ffffffffc02069ca:	46ad                	li	a3,11
ffffffffc02069cc:	00100637          	lui	a2,0x100
ffffffffc02069d0:	7ff005b7          	lui	a1,0x7ff00
ffffffffc02069d4:	854a                	mv	a0,s2
ffffffffc02069d6:	bd2fd0ef          	jal	ra,ffffffffc0203da8 <mm_map>
ffffffffc02069da:	e42a                	sd	a0,8(sp)
ffffffffc02069dc:	ea051be3          	bnez	a0,ffffffffc0206892 <do_execve+0x3c8>
ffffffffc02069e0:	01893503          	ld	a0,24(s2)
ffffffffc02069e4:	465d                	li	a2,23
ffffffffc02069e6:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc02069ea:	938fd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc02069ee:	52050a63          	beqz	a0,ffffffffc0206f22 <do_execve+0xa58>
ffffffffc02069f2:	01893503          	ld	a0,24(s2)
ffffffffc02069f6:	465d                	li	a2,23
ffffffffc02069f8:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc02069fc:	926fd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206a00:	50050163          	beqz	a0,ffffffffc0206f02 <do_execve+0xa38>
ffffffffc0206a04:	01893503          	ld	a0,24(s2)
ffffffffc0206a08:	465d                	li	a2,23
ffffffffc0206a0a:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc0206a0e:	914fd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206a12:	4c050863          	beqz	a0,ffffffffc0206ee2 <do_execve+0xa18>
ffffffffc0206a16:	01893503          	ld	a0,24(s2)
ffffffffc0206a1a:	465d                	li	a2,23
ffffffffc0206a1c:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc0206a20:	902fd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206a24:	48050f63          	beqz	a0,ffffffffc0206ec2 <do_execve+0x9f8>
ffffffffc0206a28:	01893503          	ld	a0,24(s2)
ffffffffc0206a2c:	465d                	li	a2,23
ffffffffc0206a2e:	7fffb5b7          	lui	a1,0x7fffb
ffffffffc0206a32:	8f0fd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206a36:	5a050763          	beqz	a0,ffffffffc0206fe4 <do_execve+0xb1a>
ffffffffc0206a3a:	01893503          	ld	a0,24(s2)
ffffffffc0206a3e:	465d                	li	a2,23
ffffffffc0206a40:	7fffa5b7          	lui	a1,0x7fffa
ffffffffc0206a44:	8defd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206a48:	56050e63          	beqz	a0,ffffffffc0206fc4 <do_execve+0xafa>
ffffffffc0206a4c:	01893503          	ld	a0,24(s2)
ffffffffc0206a50:	465d                	li	a2,23
ffffffffc0206a52:	7fff95b7          	lui	a1,0x7fff9
ffffffffc0206a56:	8ccfd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206a5a:	54050563          	beqz	a0,ffffffffc0206fa4 <do_execve+0xada>
ffffffffc0206a5e:	01893503          	ld	a0,24(s2)
ffffffffc0206a62:	465d                	li	a2,23
ffffffffc0206a64:	7fff85b7          	lui	a1,0x7fff8
ffffffffc0206a68:	8bafd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206a6c:	50050c63          	beqz	a0,ffffffffc0206f84 <do_execve+0xaba>
ffffffffc0206a70:	6ba6                	ld	s7,72(sp)
ffffffffc0206a72:	11810b13          	addi	s6,sp,280
ffffffffc0206a76:	4c01                	li	s8,0
ffffffffc0206a78:	4a81                	li	s5,0
ffffffffc0206a7a:	8566                	mv	a0,s9
ffffffffc0206a7c:	a021                	j	ffffffffc0206a84 <do_execve+0x5ba>
ffffffffc0206a7e:	000b3503          	ld	a0,0(s6)
ffffffffc0206a82:	0b21                	addi	s6,s6,8
ffffffffc0206a84:	6585                	lui	a1,0x1
ffffffffc0206a86:	4c7040ef          	jal	ra,ffffffffc020b74c <strnlen>
ffffffffc0206a8a:	00150793          	addi	a5,a0,1
ffffffffc0206a8e:	2a85                	addiw	s5,s5,1
ffffffffc0206a90:	01878c3b          	addw	s8,a5,s8
ffffffffc0206a94:	ff7ae5e3          	bltu	s5,s7,ffffffffc0206a7e <do_execve+0x5b4>
ffffffffc0206a98:	10000bb7          	lui	s7,0x10000
ffffffffc0206a9c:	003c579b          	srliw	a5,s8,0x3
ffffffffc0206aa0:	1bfd                	addi	s7,s7,-1
ffffffffc0206aa2:	40fb8bb3          	sub	s7,s7,a5
ffffffffc0206aa6:	77a2                	ld	a5,40(sp)
ffffffffc0206aa8:	003b9613          	slli	a2,s7,0x3
ffffffffc0206aac:	8726                	mv	a4,s1
ffffffffc0206aae:	40f60b33          	sub	s6,a2,a5
ffffffffc0206ab2:	86da                	mv	a3,s6
ffffffffc0206ab4:	87e2                	mv	a5,s8
ffffffffc0206ab6:	800005b7          	lui	a1,0x80000
ffffffffc0206aba:	00007517          	auipc	a0,0x7
ffffffffc0206abe:	3be50513          	addi	a0,a0,958 # ffffffffc020de78 <CSWTCH.79+0x7b0>
ffffffffc0206ac2:	e0da                	sd	s6,64(sp)
ffffffffc0206ac4:	f832                	sd	a2,48(sp)
ffffffffc0206ac6:	ee0f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206aca:	57fd                	li	a5,-1
ffffffffc0206acc:	83b1                	srli	a5,a5,0xc
ffffffffc0206ace:	e43e                	sd	a5,8(sp)
ffffffffc0206ad0:	6785                	lui	a5,0x1
ffffffffc0206ad2:	17fd                	addi	a5,a5,-1
ffffffffc0206ad4:	e83e                	sd	a5,16(sp)
ffffffffc0206ad6:	41ab07b3          	sub	a5,s6,s10
ffffffffc0206ada:	6b62                	ld	s6,24(sp)
ffffffffc0206adc:	8aea                	mv	s5,s10
ffffffffc0206ade:	4c81                	li	s9,0
ffffffffc0206ae0:	4c01                	li	s8,0
ffffffffc0206ae2:	fc3e                	sd	a5,56(sp)
ffffffffc0206ae4:	e8a6                	sd	s1,80(sp)
ffffffffc0206ae6:	ecce                	sd	s3,88(sp)
ffffffffc0206ae8:	8ba2                	mv	s7,s0
ffffffffc0206aea:	77c2                	ld	a5,48(sp)
ffffffffc0206aec:	020c1713          	slli	a4,s8,0x20
ffffffffc0206af0:	9301                	srli	a4,a4,0x20
ffffffffc0206af2:	01893503          	ld	a0,24(s2)
ffffffffc0206af6:	00f704b3          	add	s1,a4,a5
ffffffffc0206afa:	4601                	li	a2,0
ffffffffc0206afc:	85a6                	mv	a1,s1
ffffffffc0206afe:	f26fb0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0206b02:	36050263          	beqz	a0,ffffffffc0206e66 <do_execve+0x99c>
ffffffffc0206b06:	611c                	ld	a5,0(a0)
ffffffffc0206b08:	0017f693          	andi	a3,a5,1
ffffffffc0206b0c:	34068d63          	beqz	a3,ffffffffc0206e66 <do_execve+0x99c>
ffffffffc0206b10:	000db603          	ld	a2,0(s11)
ffffffffc0206b14:	078a                	slli	a5,a5,0x2
ffffffffc0206b16:	83b1                	srli	a5,a5,0xc
ffffffffc0206b18:	38c7f763          	bgeu	a5,a2,ffffffffc0206ea6 <do_execve+0x9dc>
ffffffffc0206b1c:	416787b3          	sub	a5,a5,s6
ffffffffc0206b20:	6722                	ld	a4,8(sp)
ffffffffc0206b22:	079a                	slli	a5,a5,0x6
ffffffffc0206b24:	8799                	srai	a5,a5,0x6
ffffffffc0206b26:	97da                	add	a5,a5,s6
ffffffffc0206b28:	00e7f5b3          	and	a1,a5,a4
ffffffffc0206b2c:	07b2                	slli	a5,a5,0xc
ffffffffc0206b2e:	42c5fe63          	bgeu	a1,a2,ffffffffc0206f6a <do_execve+0xaa0>
ffffffffc0206b32:	66c2                	ld	a3,16(sp)
ffffffffc0206b34:	00090717          	auipc	a4,0x90
ffffffffc0206b38:	d8470713          	addi	a4,a4,-636 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206b3c:	6318                	ld	a4,0(a4)
ffffffffc0206b3e:	000ab983          	ld	s3,0(s5)
ffffffffc0206b42:	00d4f533          	and	a0,s1,a3
ffffffffc0206b46:	953a                	add	a0,a0,a4
ffffffffc0206b48:	85ce                	mv	a1,s3
ffffffffc0206b4a:	953e                	add	a0,a0,a5
ffffffffc0206b4c:	41d040ef          	jal	ra,ffffffffc020b768 <strcpy>
ffffffffc0206b50:	77e2                	ld	a5,56(sp)
ffffffffc0206b52:	01893503          	ld	a0,24(s2)
ffffffffc0206b56:	4601                	li	a2,0
ffffffffc0206b58:	01578433          	add	s0,a5,s5
ffffffffc0206b5c:	85a2                	mv	a1,s0
ffffffffc0206b5e:	ec6fb0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0206b62:	2c050b63          	beqz	a0,ffffffffc0206e38 <do_execve+0x96e>
ffffffffc0206b66:	611c                	ld	a5,0(a0)
ffffffffc0206b68:	0017f693          	andi	a3,a5,1
ffffffffc0206b6c:	2c068663          	beqz	a3,ffffffffc0206e38 <do_execve+0x96e>
ffffffffc0206b70:	000db603          	ld	a2,0(s11)
ffffffffc0206b74:	078a                	slli	a5,a5,0x2
ffffffffc0206b76:	83b1                	srli	a5,a5,0xc
ffffffffc0206b78:	32c7f763          	bgeu	a5,a2,ffffffffc0206ea6 <do_execve+0x9dc>
ffffffffc0206b7c:	416787b3          	sub	a5,a5,s6
ffffffffc0206b80:	6722                	ld	a4,8(sp)
ffffffffc0206b82:	079a                	slli	a5,a5,0x6
ffffffffc0206b84:	8799                	srai	a5,a5,0x6
ffffffffc0206b86:	97da                	add	a5,a5,s6
ffffffffc0206b88:	00e7f533          	and	a0,a5,a4
ffffffffc0206b8c:	00c79693          	slli	a3,a5,0xc
ffffffffc0206b90:	2ec57663          	bgeu	a0,a2,ffffffffc0206e7c <do_execve+0x9b2>
ffffffffc0206b94:	00090797          	auipc	a5,0x90
ffffffffc0206b98:	d2478793          	addi	a5,a5,-732 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206b9c:	6390                	ld	a2,0(a5)
ffffffffc0206b9e:	67c2                	ld	a5,16(sp)
ffffffffc0206ba0:	6585                	lui	a1,0x1
ffffffffc0206ba2:	854e                	mv	a0,s3
ffffffffc0206ba4:	8fe1                	and	a5,a5,s0
ffffffffc0206ba6:	97b6                	add	a5,a5,a3
ffffffffc0206ba8:	97b2                	add	a5,a5,a2
ffffffffc0206baa:	e384                	sd	s1,0(a5)
ffffffffc0206bac:	3a1040ef          	jal	ra,ffffffffc020b74c <strnlen>
ffffffffc0206bb0:	00150793          	addi	a5,a0,1
ffffffffc0206bb4:	01878c3b          	addw	s8,a5,s8
ffffffffc0206bb8:	67a6                	ld	a5,72(sp)
ffffffffc0206bba:	2c85                	addiw	s9,s9,1
ffffffffc0206bbc:	0aa1                	addi	s5,s5,8
ffffffffc0206bbe:	f2fce6e3          	bltu	s9,a5,ffffffffc0206aea <do_execve+0x620>
ffffffffc0206bc2:	6786                	ld	a5,64(sp)
ffffffffc0206bc4:	01893503          	ld	a0,24(s2)
ffffffffc0206bc8:	4601                	li	a2,0
ffffffffc0206bca:	ffc78c93          	addi	s9,a5,-4
ffffffffc0206bce:	85e6                	mv	a1,s9
ffffffffc0206bd0:	64c6                	ld	s1,80(sp)
ffffffffc0206bd2:	69e6                	ld	s3,88(sp)
ffffffffc0206bd4:	845e                	mv	s0,s7
ffffffffc0206bd6:	e4efb0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0206bda:	38050063          	beqz	a0,ffffffffc0206f5a <do_execve+0xa90>
ffffffffc0206bde:	611c                	ld	a5,0(a0)
ffffffffc0206be0:	0017f713          	andi	a4,a5,1
ffffffffc0206be4:	36070b63          	beqz	a4,ffffffffc0206f5a <do_execve+0xa90>
ffffffffc0206be8:	000db703          	ld	a4,0(s11)
ffffffffc0206bec:	078a                	slli	a5,a5,0x2
ffffffffc0206bee:	83b1                	srli	a5,a5,0xc
ffffffffc0206bf0:	2ae7fb63          	bgeu	a5,a4,ffffffffc0206ea6 <do_execve+0x9dc>
ffffffffc0206bf4:	65e2                	ld	a1,24(sp)
ffffffffc0206bf6:	567d                	li	a2,-1
ffffffffc0206bf8:	40b786b3          	sub	a3,a5,a1
ffffffffc0206bfc:	069a                	slli	a3,a3,0x6
ffffffffc0206bfe:	8699                	srai	a3,a3,0x6
ffffffffc0206c00:	96ae                	add	a3,a3,a1
ffffffffc0206c02:	00c65793          	srli	a5,a2,0xc
ffffffffc0206c06:	8ff5                	and	a5,a5,a3
ffffffffc0206c08:	06b2                	slli	a3,a3,0xc
ffffffffc0206c0a:	26e7f963          	bgeu	a5,a4,ffffffffc0206e7c <do_execve+0x9b2>
ffffffffc0206c0e:	00090797          	auipc	a5,0x90
ffffffffc0206c12:	caa78793          	addi	a5,a5,-854 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206c16:	638c                	ld	a1,0(a5)
ffffffffc0206c18:	6785                	lui	a5,0x1
ffffffffc0206c1a:	17fd                	addi	a5,a5,-1
ffffffffc0206c1c:	00fcf733          	and	a4,s9,a5
ffffffffc0206c20:	00b687b3          	add	a5,a3,a1
ffffffffc0206c24:	97ba                	add	a5,a5,a4
ffffffffc0206c26:	c384                	sw	s1,0(a5)
ffffffffc0206c28:	03092783          	lw	a5,48(s2)
ffffffffc0206c2c:	000a3703          	ld	a4,0(s4)
ffffffffc0206c30:	01893683          	ld	a3,24(s2)
ffffffffc0206c34:	2785                	addiw	a5,a5,1
ffffffffc0206c36:	02f92823          	sw	a5,48(s2)
ffffffffc0206c3a:	03273423          	sd	s2,40(a4)
ffffffffc0206c3e:	c02007b7          	lui	a5,0xc0200
ffffffffc0206c42:	30f6e063          	bltu	a3,a5,ffffffffc0206f42 <do_execve+0xa78>
ffffffffc0206c46:	8e8d                	sub	a3,a3,a1
ffffffffc0206c48:	00c6d793          	srli	a5,a3,0xc
ffffffffc0206c4c:	167e                	slli	a2,a2,0x3f
ffffffffc0206c4e:	f754                	sd	a3,168(a4)
ffffffffc0206c50:	8e5d                	or	a2,a2,a5
ffffffffc0206c52:	18061073          	csrw	satp,a2
ffffffffc0206c56:	12000073          	sfence.vma
ffffffffc0206c5a:	000a3783          	ld	a5,0(s4)
ffffffffc0206c5e:	12000613          	li	a2,288
ffffffffc0206c62:	4581                	li	a1,0
ffffffffc0206c64:	73c4                	ld	s1,160(a5)
ffffffffc0206c66:	8526                	mv	a0,s1
ffffffffc0206c68:	36d040ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc0206c6c:	77ae                	ld	a5,232(sp)
ffffffffc0206c6e:	0194b823          	sd	s9,16(s1)
ffffffffc0206c72:	10f4b423          	sd	a5,264(s1)
ffffffffc0206c76:	100027f3          	csrr	a5,sstatus
ffffffffc0206c7a:	edf7f793          	andi	a5,a5,-289
ffffffffc0206c7e:	0207e793          	ori	a5,a5,32
ffffffffc0206c82:	10f4b023          	sd	a5,256(s1)
ffffffffc0206c86:	77a2                	ld	a5,40(sp)
ffffffffc0206c88:	ff0d0493          	addi	s1,s10,-16
ffffffffc0206c8c:	147d                	addi	s0,s0,-1
ffffffffc0206c8e:	94be                	add	s1,s1,a5
ffffffffc0206c90:	7782                	ld	a5,32(sp)
ffffffffc0206c92:	040e                	slli	s0,s0,0x3
ffffffffc0206c94:	946a                	add	s0,s0,s10
ffffffffc0206c96:	02079713          	slli	a4,a5,0x20
ffffffffc0206c9a:	01d75793          	srli	a5,a4,0x1d
ffffffffc0206c9e:	8c9d                	sub	s1,s1,a5
ffffffffc0206ca0:	6008                	ld	a0,0(s0)
ffffffffc0206ca2:	1461                	addi	s0,s0,-8
ffffffffc0206ca4:	b9afb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206ca8:	fe849ce3          	bne	s1,s0,ffffffffc0206ca0 <do_execve+0x7d6>
ffffffffc0206cac:	000a3403          	ld	s0,0(s4)
ffffffffc0206cb0:	4641                	li	a2,16
ffffffffc0206cb2:	4581                	li	a1,0
ffffffffc0206cb4:	0b440413          	addi	s0,s0,180
ffffffffc0206cb8:	8522                	mv	a0,s0
ffffffffc0206cba:	31b040ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc0206cbe:	463d                	li	a2,15
ffffffffc0206cc0:	012c                	addi	a1,sp,136
ffffffffc0206cc2:	8522                	mv	a0,s0
ffffffffc0206cc4:	363040ef          	jal	ra,ffffffffc020b826 <memcpy>
ffffffffc0206cc8:	00007517          	auipc	a0,0x7
ffffffffc0206ccc:	2b850513          	addi	a0,a0,696 # ffffffffc020df80 <CSWTCH.79+0x8b8>
ffffffffc0206cd0:	cd6f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206cd4:	bcc1                	j	ffffffffc02067a4 <do_execve+0x2da>
ffffffffc0206cd6:	01893503          	ld	a0,24(s2)
ffffffffc0206cda:	59e1                	li	s3,-8
ffffffffc0206cdc:	dc7fe0ef          	jal	ra,ffffffffc0205aa2 <put_pgdir.isra.0>
ffffffffc0206ce0:	854a                	mv	a0,s2
ffffffffc0206ce2:	874fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206ce6:	bac5                	j	ffffffffc02066d6 <do_execve+0x20c>
ffffffffc0206ce8:	0f941963          	bne	s0,s9,ffffffffc0206dda <do_execve+0x910>
ffffffffc0206cec:	ca9cfce3          	bgeu	s9,s1,ffffffffc02069a4 <do_execve+0x4da>
ffffffffc0206cf0:	6ac6                	ld	s5,80(sp)
ffffffffc0206cf2:	6c62                	ld	s8,24(sp)
ffffffffc0206cf4:	a0a9                	j	ffffffffc0206d3e <do_execve+0x874>
ffffffffc0206cf6:	6785                	lui	a5,0x1
ffffffffc0206cf8:	408c8533          	sub	a0,s9,s0
ffffffffc0206cfc:	943e                	add	s0,s0,a5
ffffffffc0206cfe:	41940633          	sub	a2,s0,s9
ffffffffc0206d02:	0084f463          	bgeu	s1,s0,ffffffffc0206d0a <do_execve+0x840>
ffffffffc0206d06:	41948633          	sub	a2,s1,s9
ffffffffc0206d0a:	000b3783          	ld	a5,0(s6)
ffffffffc0206d0e:	66c2                	ld	a3,16(sp)
ffffffffc0206d10:	000db703          	ld	a4,0(s11)
ffffffffc0206d14:	40f987b3          	sub	a5,s3,a5
ffffffffc0206d18:	8799                	srai	a5,a5,0x6
ffffffffc0206d1a:	97e2                	add	a5,a5,s8
ffffffffc0206d1c:	8efd                	and	a3,a3,a5
ffffffffc0206d1e:	07b2                	slli	a5,a5,0xc
ffffffffc0206d20:	24e6f563          	bgeu	a3,a4,ffffffffc0206f6a <do_execve+0xaa0>
ffffffffc0206d24:	00090717          	auipc	a4,0x90
ffffffffc0206d28:	b9470713          	addi	a4,a4,-1132 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206d2c:	6318                	ld	a4,0(a4)
ffffffffc0206d2e:	9cb2                	add	s9,s9,a2
ffffffffc0206d30:	4581                	li	a1,0
ffffffffc0206d32:	97ba                	add	a5,a5,a4
ffffffffc0206d34:	953e                	add	a0,a0,a5
ffffffffc0206d36:	29f040ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc0206d3a:	0c9cf263          	bgeu	s9,s1,ffffffffc0206dfe <do_execve+0x934>
ffffffffc0206d3e:	01893503          	ld	a0,24(s2)
ffffffffc0206d42:	8656                	mv	a2,s5
ffffffffc0206d44:	85a2                	mv	a1,s0
ffffffffc0206d46:	dddfc0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206d4a:	89aa                	mv	s3,a0
ffffffffc0206d4c:	f54d                	bnez	a0,ffffffffc0206cf6 <do_execve+0x82c>
ffffffffc0206d4e:	854a                	mv	a0,s2
ffffffffc0206d50:	79a6                	ld	s3,104(sp)
ffffffffc0206d52:	6466                	ld	s0,88(sp)
ffffffffc0206d54:	99efd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0206d58:	01893503          	ld	a0,24(s2)
ffffffffc0206d5c:	d47fe0ef          	jal	ra,ffffffffc0205aa2 <put_pgdir.isra.0>
ffffffffc0206d60:	854a                	mv	a0,s2
ffffffffc0206d62:	ff5fc0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206d66:	67a2                	ld	a5,8(sp)
ffffffffc0206d68:	f0078fe3          	beqz	a5,ffffffffc0206c86 <do_execve+0x7bc>
ffffffffc0206d6c:	89be                	mv	s3,a5
ffffffffc0206d6e:	b2a5                	j	ffffffffc02066d6 <do_execve+0x20c>
ffffffffc0206d70:	77aa                	ld	a5,168(sp)
ffffffffc0206d72:	8ca6                	mv	s9,s1
ffffffffc0206d74:	fc4e                	sd	s3,56(sp)
ffffffffc0206d76:	668e                	ld	a3,192(sp)
ffffffffc0206d78:	00d784b3          	add	s1,a5,a3
ffffffffc0206d7c:	f68cf8e3          	bgeu	s9,s0,ffffffffc0206cec <do_execve+0x822>
ffffffffc0206d80:	c39482e3          	beq	s1,s9,ffffffffc02069a4 <do_execve+0x4da>
ffffffffc0206d84:	6785                	lui	a5,0x1
ffffffffc0206d86:	00fc8533          	add	a0,s9,a5
ffffffffc0206d8a:	8d01                	sub	a0,a0,s0
ffffffffc0206d8c:	41948ab3          	sub	s5,s1,s9
ffffffffc0206d90:	0084e463          	bltu	s1,s0,ffffffffc0206d98 <do_execve+0x8ce>
ffffffffc0206d94:	41940ab3          	sub	s5,s0,s9
ffffffffc0206d98:	77e2                	ld	a5,56(sp)
ffffffffc0206d9a:	000b3683          	ld	a3,0(s6)
ffffffffc0206d9e:	000db603          	ld	a2,0(s11)
ffffffffc0206da2:	40d786b3          	sub	a3,a5,a3
ffffffffc0206da6:	67e2                	ld	a5,24(sp)
ffffffffc0206da8:	8699                	srai	a3,a3,0x6
ffffffffc0206daa:	96be                	add	a3,a3,a5
ffffffffc0206dac:	67c2                	ld	a5,16(sp)
ffffffffc0206dae:	00f6f5b3          	and	a1,a3,a5
ffffffffc0206db2:	06b2                	slli	a3,a3,0xc
ffffffffc0206db4:	0cc5f463          	bgeu	a1,a2,ffffffffc0206e7c <do_execve+0x9b2>
ffffffffc0206db8:	00090797          	auipc	a5,0x90
ffffffffc0206dbc:	b0078793          	addi	a5,a5,-1280 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206dc0:	0007b803          	ld	a6,0(a5)
ffffffffc0206dc4:	8656                	mv	a2,s5
ffffffffc0206dc6:	4581                	li	a1,0
ffffffffc0206dc8:	96c2                	add	a3,a3,a6
ffffffffc0206dca:	9536                	add	a0,a0,a3
ffffffffc0206dcc:	209040ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc0206dd0:	9cd6                	add	s9,s9,s5
ffffffffc0206dd2:	f084fbe3          	bgeu	s1,s0,ffffffffc0206ce8 <do_execve+0x81e>
ffffffffc0206dd6:	bd9487e3          	beq	s1,s9,ffffffffc02069a4 <do_execve+0x4da>
ffffffffc0206dda:	00007697          	auipc	a3,0x7
ffffffffc0206dde:	d6668693          	addi	a3,a3,-666 # ffffffffc020db40 <CSWTCH.79+0x478>
ffffffffc0206de2:	00005617          	auipc	a2,0x5
ffffffffc0206de6:	ed660613          	addi	a2,a2,-298 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0206dea:	37300593          	li	a1,883
ffffffffc0206dee:	00007517          	auipc	a0,0x7
ffffffffc0206df2:	9ca50513          	addi	a0,a0,-1590 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0206df6:	ea8f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206dfa:	59f5                	li	s3,-3
ffffffffc0206dfc:	b265                	j	ffffffffc02067a4 <do_execve+0x2da>
ffffffffc0206dfe:	fc4e                	sd	s3,56(sp)
ffffffffc0206e00:	b655                	j	ffffffffc02069a4 <do_execve+0x4da>
ffffffffc0206e02:	59f5                	li	s3,-3
ffffffffc0206e04:	b249                	j	ffffffffc0206786 <do_execve+0x2bc>
ffffffffc0206e06:	00007517          	auipc	a0,0x7
ffffffffc0206e0a:	c6250513          	addi	a0,a0,-926 # ffffffffc020da68 <CSWTCH.79+0x3a0>
ffffffffc0206e0e:	b98f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206e12:	fe0904e3          	beqz	s2,ffffffffc0206dfa <do_execve+0x930>
ffffffffc0206e16:	03890513          	addi	a0,s2,56
ffffffffc0206e1a:	f46fd0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0206e1e:	59f5                	li	s3,-3
ffffffffc0206e20:	04092823          	sw	zero,80(s2)
ffffffffc0206e24:	b241                	j	ffffffffc02067a4 <do_execve+0x2da>
ffffffffc0206e26:	57e1                	li	a5,-8
ffffffffc0206e28:	6466                	ld	s0,88(sp)
ffffffffc0206e2a:	e43e                	sd	a5,8(sp)
ffffffffc0206e2c:	b49d                	j	ffffffffc0206892 <do_execve+0x3c8>
ffffffffc0206e2e:	5771                	li	a4,-4
ffffffffc0206e30:	87e6                	mv	a5,s9
ffffffffc0206e32:	8426                	mv	s0,s1
ffffffffc0206e34:	e43a                	sd	a4,8(sp)
ffffffffc0206e36:	b781                	j	ffffffffc0206d76 <do_execve+0x8ac>
ffffffffc0206e38:	85a2                	mv	a1,s0
ffffffffc0206e3a:	862e                	mv	a2,a1
ffffffffc0206e3c:	00007517          	auipc	a0,0x7
ffffffffc0206e40:	0c450513          	addi	a0,a0,196 # ffffffffc020df00 <CSWTCH.79+0x838>
ffffffffc0206e44:	85e6                	mv	a1,s9
ffffffffc0206e46:	845e                	mv	s0,s7
ffffffffc0206e48:	b5ef90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206e4c:	854a                	mv	a0,s2
ffffffffc0206e4e:	8a4fd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0206e52:	01893503          	ld	a0,24(s2)
ffffffffc0206e56:	59f5                	li	s3,-3
ffffffffc0206e58:	c4bfe0ef          	jal	ra,ffffffffc0205aa2 <put_pgdir.isra.0>
ffffffffc0206e5c:	854a                	mv	a0,s2
ffffffffc0206e5e:	ef9fc0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206e62:	875ff06f          	j	ffffffffc02066d6 <do_execve+0x20c>
ffffffffc0206e66:	8626                	mv	a2,s1
ffffffffc0206e68:	85e6                	mv	a1,s9
ffffffffc0206e6a:	00007517          	auipc	a0,0x7
ffffffffc0206e6e:	06650513          	addi	a0,a0,102 # ffffffffc020ded0 <CSWTCH.79+0x808>
ffffffffc0206e72:	845e                	mv	s0,s7
ffffffffc0206e74:	b32f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206e78:	bfd1                	j	ffffffffc0206e4c <do_execve+0x982>
ffffffffc0206e7a:	86be                	mv	a3,a5
ffffffffc0206e7c:	00006617          	auipc	a2,0x6
ffffffffc0206e80:	95c60613          	addi	a2,a2,-1700 # ffffffffc020c7d8 <default_pmm_manager+0x38>
ffffffffc0206e84:	07100593          	li	a1,113
ffffffffc0206e88:	00006517          	auipc	a0,0x6
ffffffffc0206e8c:	97850513          	addi	a0,a0,-1672 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc0206e90:	e0ef90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206e94:	85de                	mv	a1,s7
ffffffffc0206e96:	00007517          	auipc	a0,0x7
ffffffffc0206e9a:	c3250513          	addi	a0,a0,-974 # ffffffffc020dac8 <CSWTCH.79+0x400>
ffffffffc0206e9e:	b08f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206ea2:	845ff06f          	j	ffffffffc02066e6 <do_execve+0x21c>
ffffffffc0206ea6:	be1fe0ef          	jal	ra,ffffffffc0205a86 <pa2page.part.0>
ffffffffc0206eaa:	00007617          	auipc	a2,0x7
ffffffffc0206eae:	c6e60613          	addi	a2,a2,-914 # ffffffffc020db18 <CSWTCH.79+0x450>
ffffffffc0206eb2:	2f000593          	li	a1,752
ffffffffc0206eb6:	00007517          	auipc	a0,0x7
ffffffffc0206eba:	90250513          	addi	a0,a0,-1790 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0206ebe:	de0f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206ec2:	00007697          	auipc	a3,0x7
ffffffffc0206ec6:	dd668693          	addi	a3,a3,-554 # ffffffffc020dc98 <CSWTCH.79+0x5d0>
ffffffffc0206eca:	00005617          	auipc	a2,0x5
ffffffffc0206ece:	dee60613          	addi	a2,a2,-530 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0206ed2:	39800593          	li	a1,920
ffffffffc0206ed6:	00007517          	auipc	a0,0x7
ffffffffc0206eda:	8e250513          	addi	a0,a0,-1822 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0206ede:	dc0f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206ee2:	00007697          	auipc	a3,0x7
ffffffffc0206ee6:	d5668693          	addi	a3,a3,-682 # ffffffffc020dc38 <CSWTCH.79+0x570>
ffffffffc0206eea:	00005617          	auipc	a2,0x5
ffffffffc0206eee:	dce60613          	addi	a2,a2,-562 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0206ef2:	39700593          	li	a1,919
ffffffffc0206ef6:	00007517          	auipc	a0,0x7
ffffffffc0206efa:	8c250513          	addi	a0,a0,-1854 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0206efe:	da0f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f02:	00007697          	auipc	a3,0x7
ffffffffc0206f06:	cd668693          	addi	a3,a3,-810 # ffffffffc020dbd8 <CSWTCH.79+0x510>
ffffffffc0206f0a:	00005617          	auipc	a2,0x5
ffffffffc0206f0e:	dae60613          	addi	a2,a2,-594 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0206f12:	39600593          	li	a1,918
ffffffffc0206f16:	00007517          	auipc	a0,0x7
ffffffffc0206f1a:	8a250513          	addi	a0,a0,-1886 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0206f1e:	d80f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f22:	00007697          	auipc	a3,0x7
ffffffffc0206f26:	c5e68693          	addi	a3,a3,-930 # ffffffffc020db80 <CSWTCH.79+0x4b8>
ffffffffc0206f2a:	00005617          	auipc	a2,0x5
ffffffffc0206f2e:	d8e60613          	addi	a2,a2,-626 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0206f32:	39500593          	li	a1,917
ffffffffc0206f36:	00007517          	auipc	a0,0x7
ffffffffc0206f3a:	88250513          	addi	a0,a0,-1918 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0206f3e:	d60f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f42:	00006617          	auipc	a2,0x6
ffffffffc0206f46:	93e60613          	addi	a2,a2,-1730 # ffffffffc020c880 <default_pmm_manager+0xe0>
ffffffffc0206f4a:	3df00593          	li	a1,991
ffffffffc0206f4e:	00007517          	auipc	a0,0x7
ffffffffc0206f52:	86a50513          	addi	a0,a0,-1942 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0206f56:	d48f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f5a:	85e6                	mv	a1,s9
ffffffffc0206f5c:	00007517          	auipc	a0,0x7
ffffffffc0206f60:	fd450513          	addi	a0,a0,-44 # ffffffffc020df30 <CSWTCH.79+0x868>
ffffffffc0206f64:	a42f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206f68:	b5d5                	j	ffffffffc0206e4c <do_execve+0x982>
ffffffffc0206f6a:	86be                	mv	a3,a5
ffffffffc0206f6c:	00006617          	auipc	a2,0x6
ffffffffc0206f70:	86c60613          	addi	a2,a2,-1940 # ffffffffc020c7d8 <default_pmm_manager+0x38>
ffffffffc0206f74:	07100593          	li	a1,113
ffffffffc0206f78:	00006517          	auipc	a0,0x6
ffffffffc0206f7c:	88850513          	addi	a0,a0,-1912 # ffffffffc020c800 <default_pmm_manager+0x60>
ffffffffc0206f80:	d1ef90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f84:	00007697          	auipc	a3,0x7
ffffffffc0206f88:	e9468693          	addi	a3,a3,-364 # ffffffffc020de18 <CSWTCH.79+0x750>
ffffffffc0206f8c:	00005617          	auipc	a2,0x5
ffffffffc0206f90:	d2c60613          	addi	a2,a2,-724 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0206f94:	39c00593          	li	a1,924
ffffffffc0206f98:	00007517          	auipc	a0,0x7
ffffffffc0206f9c:	82050513          	addi	a0,a0,-2016 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0206fa0:	cfef90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206fa4:	00007697          	auipc	a3,0x7
ffffffffc0206fa8:	e1468693          	addi	a3,a3,-492 # ffffffffc020ddb8 <CSWTCH.79+0x6f0>
ffffffffc0206fac:	00005617          	auipc	a2,0x5
ffffffffc0206fb0:	d0c60613          	addi	a2,a2,-756 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0206fb4:	39b00593          	li	a1,923
ffffffffc0206fb8:	00007517          	auipc	a0,0x7
ffffffffc0206fbc:	80050513          	addi	a0,a0,-2048 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0206fc0:	cdef90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206fc4:	00007697          	auipc	a3,0x7
ffffffffc0206fc8:	d9468693          	addi	a3,a3,-620 # ffffffffc020dd58 <CSWTCH.79+0x690>
ffffffffc0206fcc:	00005617          	auipc	a2,0x5
ffffffffc0206fd0:	cec60613          	addi	a2,a2,-788 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0206fd4:	39a00593          	li	a1,922
ffffffffc0206fd8:	00006517          	auipc	a0,0x6
ffffffffc0206fdc:	7e050513          	addi	a0,a0,2016 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0206fe0:	cbef90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206fe4:	00007697          	auipc	a3,0x7
ffffffffc0206fe8:	d1468693          	addi	a3,a3,-748 # ffffffffc020dcf8 <CSWTCH.79+0x630>
ffffffffc0206fec:	00005617          	auipc	a2,0x5
ffffffffc0206ff0:	ccc60613          	addi	a2,a2,-820 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0206ff4:	39900593          	li	a1,921
ffffffffc0206ff8:	00006517          	auipc	a0,0x6
ffffffffc0206ffc:	7c050513          	addi	a0,a0,1984 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0207000:	c9ef90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207004 <user_main>:
ffffffffc0207004:	7179                	addi	sp,sp,-48
ffffffffc0207006:	e84a                	sd	s2,16(sp)
ffffffffc0207008:	00090917          	auipc	s2,0x90
ffffffffc020700c:	8b890913          	addi	s2,s2,-1864 # ffffffffc02968c0 <current>
ffffffffc0207010:	00093783          	ld	a5,0(s2)
ffffffffc0207014:	00007617          	auipc	a2,0x7
ffffffffc0207018:	ff460613          	addi	a2,a2,-12 # ffffffffc020e008 <CSWTCH.79+0x940>
ffffffffc020701c:	00007517          	auipc	a0,0x7
ffffffffc0207020:	ff450513          	addi	a0,a0,-12 # ffffffffc020e010 <CSWTCH.79+0x948>
ffffffffc0207024:	43cc                	lw	a1,4(a5)
ffffffffc0207026:	00007797          	auipc	a5,0x7
ffffffffc020702a:	fda78793          	addi	a5,a5,-38 # ffffffffc020e000 <CSWTCH.79+0x938>
ffffffffc020702e:	e03e                	sd	a5,0(sp)
ffffffffc0207030:	f406                	sd	ra,40(sp)
ffffffffc0207032:	f022                	sd	s0,32(sp)
ffffffffc0207034:	ec26                	sd	s1,24(sp)
ffffffffc0207036:	e402                	sd	zero,8(sp)
ffffffffc0207038:	96ef90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020703c:	6782                	ld	a5,0(sp)
ffffffffc020703e:	cfb9                	beqz	a5,ffffffffc020709c <user_main+0x98>
ffffffffc0207040:	003c                	addi	a5,sp,8
ffffffffc0207042:	4401                	li	s0,0
ffffffffc0207044:	6398                	ld	a4,0(a5)
ffffffffc0207046:	0405                	addi	s0,s0,1
ffffffffc0207048:	07a1                	addi	a5,a5,8
ffffffffc020704a:	ff6d                	bnez	a4,ffffffffc0207044 <user_main+0x40>
ffffffffc020704c:	00093783          	ld	a5,0(s2)
ffffffffc0207050:	12000613          	li	a2,288
ffffffffc0207054:	6b84                	ld	s1,16(a5)
ffffffffc0207056:	73cc                	ld	a1,160(a5)
ffffffffc0207058:	6789                	lui	a5,0x2
ffffffffc020705a:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc020705e:	94be                	add	s1,s1,a5
ffffffffc0207060:	8526                	mv	a0,s1
ffffffffc0207062:	7c4040ef          	jal	ra,ffffffffc020b826 <memcpy>
ffffffffc0207066:	00093783          	ld	a5,0(s2)
ffffffffc020706a:	860a                	mv	a2,sp
ffffffffc020706c:	0004059b          	sext.w	a1,s0
ffffffffc0207070:	f3c4                	sd	s1,160(a5)
ffffffffc0207072:	00007517          	auipc	a0,0x7
ffffffffc0207076:	f9650513          	addi	a0,a0,-106 # ffffffffc020e008 <CSWTCH.79+0x940>
ffffffffc020707a:	c50ff0ef          	jal	ra,ffffffffc02064ca <do_execve>
ffffffffc020707e:	8126                	mv	sp,s1
ffffffffc0207080:	9d0fa06f          	j	ffffffffc0201250 <__trapret>
ffffffffc0207084:	00007617          	auipc	a2,0x7
ffffffffc0207088:	fb460613          	addi	a2,a2,-76 # ffffffffc020e038 <CSWTCH.79+0x970>
ffffffffc020708c:	51800593          	li	a1,1304
ffffffffc0207090:	00006517          	auipc	a0,0x6
ffffffffc0207094:	72850513          	addi	a0,a0,1832 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0207098:	c06f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020709c:	4401                	li	s0,0
ffffffffc020709e:	b77d                	j	ffffffffc020704c <user_main+0x48>

ffffffffc02070a0 <do_yield>:
ffffffffc02070a0:	00090797          	auipc	a5,0x90
ffffffffc02070a4:	8207b783          	ld	a5,-2016(a5) # ffffffffc02968c0 <current>
ffffffffc02070a8:	4705                	li	a4,1
ffffffffc02070aa:	ef98                	sd	a4,24(a5)
ffffffffc02070ac:	4501                	li	a0,0
ffffffffc02070ae:	8082                	ret

ffffffffc02070b0 <do_wait>:
ffffffffc02070b0:	1101                	addi	sp,sp,-32
ffffffffc02070b2:	e822                	sd	s0,16(sp)
ffffffffc02070b4:	e426                	sd	s1,8(sp)
ffffffffc02070b6:	ec06                	sd	ra,24(sp)
ffffffffc02070b8:	842e                	mv	s0,a1
ffffffffc02070ba:	84aa                	mv	s1,a0
ffffffffc02070bc:	c999                	beqz	a1,ffffffffc02070d2 <do_wait+0x22>
ffffffffc02070be:	00090797          	auipc	a5,0x90
ffffffffc02070c2:	8027b783          	ld	a5,-2046(a5) # ffffffffc02968c0 <current>
ffffffffc02070c6:	7788                	ld	a0,40(a5)
ffffffffc02070c8:	4685                	li	a3,1
ffffffffc02070ca:	4611                	li	a2,4
ffffffffc02070cc:	9c6fd0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc02070d0:	c909                	beqz	a0,ffffffffc02070e2 <do_wait+0x32>
ffffffffc02070d2:	85a2                	mv	a1,s0
ffffffffc02070d4:	6442                	ld	s0,16(sp)
ffffffffc02070d6:	60e2                	ld	ra,24(sp)
ffffffffc02070d8:	8526                	mv	a0,s1
ffffffffc02070da:	64a2                	ld	s1,8(sp)
ffffffffc02070dc:	6105                	addi	sp,sp,32
ffffffffc02070de:	862ff06f          	j	ffffffffc0206140 <do_wait.part.0>
ffffffffc02070e2:	60e2                	ld	ra,24(sp)
ffffffffc02070e4:	6442                	ld	s0,16(sp)
ffffffffc02070e6:	64a2                	ld	s1,8(sp)
ffffffffc02070e8:	5575                	li	a0,-3
ffffffffc02070ea:	6105                	addi	sp,sp,32
ffffffffc02070ec:	8082                	ret

ffffffffc02070ee <do_kill>:
ffffffffc02070ee:	1141                	addi	sp,sp,-16
ffffffffc02070f0:	6789                	lui	a5,0x2
ffffffffc02070f2:	e406                	sd	ra,8(sp)
ffffffffc02070f4:	e022                	sd	s0,0(sp)
ffffffffc02070f6:	fff5071b          	addiw	a4,a0,-1
ffffffffc02070fa:	17f9                	addi	a5,a5,-2
ffffffffc02070fc:	02e7e963          	bltu	a5,a4,ffffffffc020712e <do_kill+0x40>
ffffffffc0207100:	842a                	mv	s0,a0
ffffffffc0207102:	45a9                	li	a1,10
ffffffffc0207104:	2501                	sext.w	a0,a0
ffffffffc0207106:	19a040ef          	jal	ra,ffffffffc020b2a0 <hash32>
ffffffffc020710a:	02051793          	slli	a5,a0,0x20
ffffffffc020710e:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0207112:	0008a797          	auipc	a5,0x8a
ffffffffc0207116:	6ae78793          	addi	a5,a5,1710 # ffffffffc02917c0 <hash_list>
ffffffffc020711a:	953e                	add	a0,a0,a5
ffffffffc020711c:	87aa                	mv	a5,a0
ffffffffc020711e:	a029                	j	ffffffffc0207128 <do_kill+0x3a>
ffffffffc0207120:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0207124:	00870b63          	beq	a4,s0,ffffffffc020713a <do_kill+0x4c>
ffffffffc0207128:	679c                	ld	a5,8(a5)
ffffffffc020712a:	fef51be3          	bne	a0,a5,ffffffffc0207120 <do_kill+0x32>
ffffffffc020712e:	5475                	li	s0,-3
ffffffffc0207130:	60a2                	ld	ra,8(sp)
ffffffffc0207132:	8522                	mv	a0,s0
ffffffffc0207134:	6402                	ld	s0,0(sp)
ffffffffc0207136:	0141                	addi	sp,sp,16
ffffffffc0207138:	8082                	ret
ffffffffc020713a:	fd87a703          	lw	a4,-40(a5)
ffffffffc020713e:	00177693          	andi	a3,a4,1
ffffffffc0207142:	e295                	bnez	a3,ffffffffc0207166 <do_kill+0x78>
ffffffffc0207144:	4bd4                	lw	a3,20(a5)
ffffffffc0207146:	00176713          	ori	a4,a4,1
ffffffffc020714a:	fce7ac23          	sw	a4,-40(a5)
ffffffffc020714e:	4401                	li	s0,0
ffffffffc0207150:	fe06d0e3          	bgez	a3,ffffffffc0207130 <do_kill+0x42>
ffffffffc0207154:	f2878513          	addi	a0,a5,-216
ffffffffc0207158:	45e000ef          	jal	ra,ffffffffc02075b6 <wakeup_proc>
ffffffffc020715c:	60a2                	ld	ra,8(sp)
ffffffffc020715e:	8522                	mv	a0,s0
ffffffffc0207160:	6402                	ld	s0,0(sp)
ffffffffc0207162:	0141                	addi	sp,sp,16
ffffffffc0207164:	8082                	ret
ffffffffc0207166:	545d                	li	s0,-9
ffffffffc0207168:	b7e1                	j	ffffffffc0207130 <do_kill+0x42>

ffffffffc020716a <proc_init>:
ffffffffc020716a:	1101                	addi	sp,sp,-32
ffffffffc020716c:	e426                	sd	s1,8(sp)
ffffffffc020716e:	0008e797          	auipc	a5,0x8e
ffffffffc0207172:	65278793          	addi	a5,a5,1618 # ffffffffc02957c0 <proc_list>
ffffffffc0207176:	ec06                	sd	ra,24(sp)
ffffffffc0207178:	e822                	sd	s0,16(sp)
ffffffffc020717a:	e04a                	sd	s2,0(sp)
ffffffffc020717c:	0008a497          	auipc	s1,0x8a
ffffffffc0207180:	64448493          	addi	s1,s1,1604 # ffffffffc02917c0 <hash_list>
ffffffffc0207184:	e79c                	sd	a5,8(a5)
ffffffffc0207186:	e39c                	sd	a5,0(a5)
ffffffffc0207188:	0008e717          	auipc	a4,0x8e
ffffffffc020718c:	63870713          	addi	a4,a4,1592 # ffffffffc02957c0 <proc_list>
ffffffffc0207190:	87a6                	mv	a5,s1
ffffffffc0207192:	e79c                	sd	a5,8(a5)
ffffffffc0207194:	e39c                	sd	a5,0(a5)
ffffffffc0207196:	07c1                	addi	a5,a5,16
ffffffffc0207198:	fef71de3          	bne	a4,a5,ffffffffc0207192 <proc_init+0x28>
ffffffffc020719c:	fccfe0ef          	jal	ra,ffffffffc0205968 <alloc_proc>
ffffffffc02071a0:	0008f917          	auipc	s2,0x8f
ffffffffc02071a4:	72890913          	addi	s2,s2,1832 # ffffffffc02968c8 <idleproc>
ffffffffc02071a8:	00a93023          	sd	a0,0(s2)
ffffffffc02071ac:	842a                	mv	s0,a0
ffffffffc02071ae:	12050a63          	beqz	a0,ffffffffc02072e2 <proc_init+0x178>
ffffffffc02071b2:	4789                	li	a5,2
ffffffffc02071b4:	e11c                	sd	a5,0(a0)
ffffffffc02071b6:	0000a797          	auipc	a5,0xa
ffffffffc02071ba:	e4a78793          	addi	a5,a5,-438 # ffffffffc0211000 <bootstack>
ffffffffc02071be:	e91c                	sd	a5,16(a0)
ffffffffc02071c0:	4785                	li	a5,1
ffffffffc02071c2:	ed1c                	sd	a5,24(a0)
ffffffffc02071c4:	80afe0ef          	jal	ra,ffffffffc02051ce <files_create>
ffffffffc02071c8:	14a43423          	sd	a0,328(s0)
ffffffffc02071cc:	0e050f63          	beqz	a0,ffffffffc02072ca <proc_init+0x160>
ffffffffc02071d0:	00093403          	ld	s0,0(s2)
ffffffffc02071d4:	4641                	li	a2,16
ffffffffc02071d6:	4581                	li	a1,0
ffffffffc02071d8:	14843703          	ld	a4,328(s0)
ffffffffc02071dc:	0b440413          	addi	s0,s0,180
ffffffffc02071e0:	8522                	mv	a0,s0
ffffffffc02071e2:	4b1c                	lw	a5,16(a4)
ffffffffc02071e4:	2785                	addiw	a5,a5,1
ffffffffc02071e6:	cb1c                	sw	a5,16(a4)
ffffffffc02071e8:	5ec040ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc02071ec:	463d                	li	a2,15
ffffffffc02071ee:	00007597          	auipc	a1,0x7
ffffffffc02071f2:	eaa58593          	addi	a1,a1,-342 # ffffffffc020e098 <CSWTCH.79+0x9d0>
ffffffffc02071f6:	8522                	mv	a0,s0
ffffffffc02071f8:	62e040ef          	jal	ra,ffffffffc020b826 <memcpy>
ffffffffc02071fc:	0008f717          	auipc	a4,0x8f
ffffffffc0207200:	6dc70713          	addi	a4,a4,1756 # ffffffffc02968d8 <nr_process>
ffffffffc0207204:	431c                	lw	a5,0(a4)
ffffffffc0207206:	00093683          	ld	a3,0(s2)
ffffffffc020720a:	6605                	lui	a2,0x1
ffffffffc020720c:	2785                	addiw	a5,a5,1
ffffffffc020720e:	80060613          	addi	a2,a2,-2048 # 800 <_binary_bin_swap_img_size-0x7500>
ffffffffc0207212:	4581                	li	a1,0
ffffffffc0207214:	fffff517          	auipc	a0,0xfffff
ffffffffc0207218:	0ea50513          	addi	a0,a0,234 # ffffffffc02062fe <init_main>
ffffffffc020721c:	c31c                	sw	a5,0(a4)
ffffffffc020721e:	0008f797          	auipc	a5,0x8f
ffffffffc0207222:	6ad7b123          	sd	a3,1698(a5) # ffffffffc02968c0 <current>
ffffffffc0207226:	d69fe0ef          	jal	ra,ffffffffc0205f8e <kernel_thread>
ffffffffc020722a:	842a                	mv	s0,a0
ffffffffc020722c:	08a05363          	blez	a0,ffffffffc02072b2 <proc_init+0x148>
ffffffffc0207230:	6789                	lui	a5,0x2
ffffffffc0207232:	fff5071b          	addiw	a4,a0,-1
ffffffffc0207236:	17f9                	addi	a5,a5,-2
ffffffffc0207238:	2501                	sext.w	a0,a0
ffffffffc020723a:	02e7e363          	bltu	a5,a4,ffffffffc0207260 <proc_init+0xf6>
ffffffffc020723e:	45a9                	li	a1,10
ffffffffc0207240:	060040ef          	jal	ra,ffffffffc020b2a0 <hash32>
ffffffffc0207244:	02051793          	slli	a5,a0,0x20
ffffffffc0207248:	01c7d693          	srli	a3,a5,0x1c
ffffffffc020724c:	96a6                	add	a3,a3,s1
ffffffffc020724e:	87b6                	mv	a5,a3
ffffffffc0207250:	a029                	j	ffffffffc020725a <proc_init+0xf0>
ffffffffc0207252:	f2c7a703          	lw	a4,-212(a5) # 1f2c <_binary_bin_swap_img_size-0x5dd4>
ffffffffc0207256:	04870b63          	beq	a4,s0,ffffffffc02072ac <proc_init+0x142>
ffffffffc020725a:	679c                	ld	a5,8(a5)
ffffffffc020725c:	fef69be3          	bne	a3,a5,ffffffffc0207252 <proc_init+0xe8>
ffffffffc0207260:	4781                	li	a5,0
ffffffffc0207262:	0b478493          	addi	s1,a5,180
ffffffffc0207266:	4641                	li	a2,16
ffffffffc0207268:	4581                	li	a1,0
ffffffffc020726a:	0008f417          	auipc	s0,0x8f
ffffffffc020726e:	66640413          	addi	s0,s0,1638 # ffffffffc02968d0 <initproc>
ffffffffc0207272:	8526                	mv	a0,s1
ffffffffc0207274:	e01c                	sd	a5,0(s0)
ffffffffc0207276:	55e040ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc020727a:	463d                	li	a2,15
ffffffffc020727c:	00007597          	auipc	a1,0x7
ffffffffc0207280:	e4458593          	addi	a1,a1,-444 # ffffffffc020e0c0 <CSWTCH.79+0x9f8>
ffffffffc0207284:	8526                	mv	a0,s1
ffffffffc0207286:	5a0040ef          	jal	ra,ffffffffc020b826 <memcpy>
ffffffffc020728a:	00093783          	ld	a5,0(s2)
ffffffffc020728e:	c7d1                	beqz	a5,ffffffffc020731a <proc_init+0x1b0>
ffffffffc0207290:	43dc                	lw	a5,4(a5)
ffffffffc0207292:	e7c1                	bnez	a5,ffffffffc020731a <proc_init+0x1b0>
ffffffffc0207294:	601c                	ld	a5,0(s0)
ffffffffc0207296:	c3b5                	beqz	a5,ffffffffc02072fa <proc_init+0x190>
ffffffffc0207298:	43d8                	lw	a4,4(a5)
ffffffffc020729a:	4785                	li	a5,1
ffffffffc020729c:	04f71f63          	bne	a4,a5,ffffffffc02072fa <proc_init+0x190>
ffffffffc02072a0:	60e2                	ld	ra,24(sp)
ffffffffc02072a2:	6442                	ld	s0,16(sp)
ffffffffc02072a4:	64a2                	ld	s1,8(sp)
ffffffffc02072a6:	6902                	ld	s2,0(sp)
ffffffffc02072a8:	6105                	addi	sp,sp,32
ffffffffc02072aa:	8082                	ret
ffffffffc02072ac:	f2878793          	addi	a5,a5,-216
ffffffffc02072b0:	bf4d                	j	ffffffffc0207262 <proc_init+0xf8>
ffffffffc02072b2:	00007617          	auipc	a2,0x7
ffffffffc02072b6:	dee60613          	addi	a2,a2,-530 # ffffffffc020e0a0 <CSWTCH.79+0x9d8>
ffffffffc02072ba:	57000593          	li	a1,1392
ffffffffc02072be:	00006517          	auipc	a0,0x6
ffffffffc02072c2:	4fa50513          	addi	a0,a0,1274 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc02072c6:	9d8f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02072ca:	00007617          	auipc	a2,0x7
ffffffffc02072ce:	da660613          	addi	a2,a2,-602 # ffffffffc020e070 <CSWTCH.79+0x9a8>
ffffffffc02072d2:	56400593          	li	a1,1380
ffffffffc02072d6:	00006517          	auipc	a0,0x6
ffffffffc02072da:	4e250513          	addi	a0,a0,1250 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc02072de:	9c0f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02072e2:	00007617          	auipc	a2,0x7
ffffffffc02072e6:	d7660613          	addi	a2,a2,-650 # ffffffffc020e058 <CSWTCH.79+0x990>
ffffffffc02072ea:	55a00593          	li	a1,1370
ffffffffc02072ee:	00006517          	auipc	a0,0x6
ffffffffc02072f2:	4ca50513          	addi	a0,a0,1226 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc02072f6:	9a8f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02072fa:	00007697          	auipc	a3,0x7
ffffffffc02072fe:	df668693          	addi	a3,a3,-522 # ffffffffc020e0f0 <CSWTCH.79+0xa28>
ffffffffc0207302:	00005617          	auipc	a2,0x5
ffffffffc0207306:	9b660613          	addi	a2,a2,-1610 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020730a:	57700593          	li	a1,1399
ffffffffc020730e:	00006517          	auipc	a0,0x6
ffffffffc0207312:	4aa50513          	addi	a0,a0,1194 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0207316:	988f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020731a:	00007697          	auipc	a3,0x7
ffffffffc020731e:	dae68693          	addi	a3,a3,-594 # ffffffffc020e0c8 <CSWTCH.79+0xa00>
ffffffffc0207322:	00005617          	auipc	a2,0x5
ffffffffc0207326:	99660613          	addi	a2,a2,-1642 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020732a:	57600593          	li	a1,1398
ffffffffc020732e:	00006517          	auipc	a0,0x6
ffffffffc0207332:	48a50513          	addi	a0,a0,1162 # ffffffffc020d7b8 <CSWTCH.79+0xf0>
ffffffffc0207336:	968f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020733a <cpu_idle>:
ffffffffc020733a:	1141                	addi	sp,sp,-16
ffffffffc020733c:	e022                	sd	s0,0(sp)
ffffffffc020733e:	e406                	sd	ra,8(sp)
ffffffffc0207340:	0008f417          	auipc	s0,0x8f
ffffffffc0207344:	58040413          	addi	s0,s0,1408 # ffffffffc02968c0 <current>
ffffffffc0207348:	6018                	ld	a4,0(s0)
ffffffffc020734a:	6f1c                	ld	a5,24(a4)
ffffffffc020734c:	dffd                	beqz	a5,ffffffffc020734a <cpu_idle+0x10>
ffffffffc020734e:	31a000ef          	jal	ra,ffffffffc0207668 <schedule>
ffffffffc0207352:	bfdd                	j	ffffffffc0207348 <cpu_idle+0xe>

ffffffffc0207354 <lab6_set_priority>:
ffffffffc0207354:	1141                	addi	sp,sp,-16
ffffffffc0207356:	e022                	sd	s0,0(sp)
ffffffffc0207358:	85aa                	mv	a1,a0
ffffffffc020735a:	842a                	mv	s0,a0
ffffffffc020735c:	00007517          	auipc	a0,0x7
ffffffffc0207360:	dbc50513          	addi	a0,a0,-580 # ffffffffc020e118 <CSWTCH.79+0xa50>
ffffffffc0207364:	e406                	sd	ra,8(sp)
ffffffffc0207366:	e41f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020736a:	0008f797          	auipc	a5,0x8f
ffffffffc020736e:	5567b783          	ld	a5,1366(a5) # ffffffffc02968c0 <current>
ffffffffc0207372:	e801                	bnez	s0,ffffffffc0207382 <lab6_set_priority+0x2e>
ffffffffc0207374:	60a2                	ld	ra,8(sp)
ffffffffc0207376:	6402                	ld	s0,0(sp)
ffffffffc0207378:	4705                	li	a4,1
ffffffffc020737a:	14e7a223          	sw	a4,324(a5)
ffffffffc020737e:	0141                	addi	sp,sp,16
ffffffffc0207380:	8082                	ret
ffffffffc0207382:	60a2                	ld	ra,8(sp)
ffffffffc0207384:	1487a223          	sw	s0,324(a5)
ffffffffc0207388:	6402                	ld	s0,0(sp)
ffffffffc020738a:	0141                	addi	sp,sp,16
ffffffffc020738c:	8082                	ret

ffffffffc020738e <do_sleep>:
ffffffffc020738e:	c539                	beqz	a0,ffffffffc02073dc <do_sleep+0x4e>
ffffffffc0207390:	7179                	addi	sp,sp,-48
ffffffffc0207392:	f022                	sd	s0,32(sp)
ffffffffc0207394:	f406                	sd	ra,40(sp)
ffffffffc0207396:	842a                	mv	s0,a0
ffffffffc0207398:	100027f3          	csrr	a5,sstatus
ffffffffc020739c:	8b89                	andi	a5,a5,2
ffffffffc020739e:	e3a9                	bnez	a5,ffffffffc02073e0 <do_sleep+0x52>
ffffffffc02073a0:	0008f797          	auipc	a5,0x8f
ffffffffc02073a4:	5207b783          	ld	a5,1312(a5) # ffffffffc02968c0 <current>
ffffffffc02073a8:	0818                	addi	a4,sp,16
ffffffffc02073aa:	c02a                	sw	a0,0(sp)
ffffffffc02073ac:	ec3a                	sd	a4,24(sp)
ffffffffc02073ae:	e83a                	sd	a4,16(sp)
ffffffffc02073b0:	e43e                	sd	a5,8(sp)
ffffffffc02073b2:	4705                	li	a4,1
ffffffffc02073b4:	c398                	sw	a4,0(a5)
ffffffffc02073b6:	80000737          	lui	a4,0x80000
ffffffffc02073ba:	840a                	mv	s0,sp
ffffffffc02073bc:	0709                	addi	a4,a4,2
ffffffffc02073be:	0ee7a623          	sw	a4,236(a5)
ffffffffc02073c2:	8522                	mv	a0,s0
ffffffffc02073c4:	364000ef          	jal	ra,ffffffffc0207728 <add_timer>
ffffffffc02073c8:	2a0000ef          	jal	ra,ffffffffc0207668 <schedule>
ffffffffc02073cc:	8522                	mv	a0,s0
ffffffffc02073ce:	422000ef          	jal	ra,ffffffffc02077f0 <del_timer>
ffffffffc02073d2:	70a2                	ld	ra,40(sp)
ffffffffc02073d4:	7402                	ld	s0,32(sp)
ffffffffc02073d6:	4501                	li	a0,0
ffffffffc02073d8:	6145                	addi	sp,sp,48
ffffffffc02073da:	8082                	ret
ffffffffc02073dc:	4501                	li	a0,0
ffffffffc02073de:	8082                	ret
ffffffffc02073e0:	893f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02073e4:	0008f797          	auipc	a5,0x8f
ffffffffc02073e8:	4dc7b783          	ld	a5,1244(a5) # ffffffffc02968c0 <current>
ffffffffc02073ec:	0818                	addi	a4,sp,16
ffffffffc02073ee:	c022                	sw	s0,0(sp)
ffffffffc02073f0:	e43e                	sd	a5,8(sp)
ffffffffc02073f2:	ec3a                	sd	a4,24(sp)
ffffffffc02073f4:	e83a                	sd	a4,16(sp)
ffffffffc02073f6:	4705                	li	a4,1
ffffffffc02073f8:	c398                	sw	a4,0(a5)
ffffffffc02073fa:	80000737          	lui	a4,0x80000
ffffffffc02073fe:	0709                	addi	a4,a4,2
ffffffffc0207400:	840a                	mv	s0,sp
ffffffffc0207402:	8522                	mv	a0,s0
ffffffffc0207404:	0ee7a623          	sw	a4,236(a5)
ffffffffc0207408:	320000ef          	jal	ra,ffffffffc0207728 <add_timer>
ffffffffc020740c:	861f90ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0207410:	bf65                	j	ffffffffc02073c8 <do_sleep+0x3a>

ffffffffc0207412 <switch_to>:
ffffffffc0207412:	00153023          	sd	ra,0(a0)
ffffffffc0207416:	00253423          	sd	sp,8(a0)
ffffffffc020741a:	e900                	sd	s0,16(a0)
ffffffffc020741c:	ed04                	sd	s1,24(a0)
ffffffffc020741e:	03253023          	sd	s2,32(a0)
ffffffffc0207422:	03353423          	sd	s3,40(a0)
ffffffffc0207426:	03453823          	sd	s4,48(a0)
ffffffffc020742a:	03553c23          	sd	s5,56(a0)
ffffffffc020742e:	05653023          	sd	s6,64(a0)
ffffffffc0207432:	05753423          	sd	s7,72(a0)
ffffffffc0207436:	05853823          	sd	s8,80(a0)
ffffffffc020743a:	05953c23          	sd	s9,88(a0)
ffffffffc020743e:	07a53023          	sd	s10,96(a0)
ffffffffc0207442:	07b53423          	sd	s11,104(a0)
ffffffffc0207446:	0005b083          	ld	ra,0(a1)
ffffffffc020744a:	0085b103          	ld	sp,8(a1)
ffffffffc020744e:	6980                	ld	s0,16(a1)
ffffffffc0207450:	6d84                	ld	s1,24(a1)
ffffffffc0207452:	0205b903          	ld	s2,32(a1)
ffffffffc0207456:	0285b983          	ld	s3,40(a1)
ffffffffc020745a:	0305ba03          	ld	s4,48(a1)
ffffffffc020745e:	0385ba83          	ld	s5,56(a1)
ffffffffc0207462:	0405bb03          	ld	s6,64(a1)
ffffffffc0207466:	0485bb83          	ld	s7,72(a1)
ffffffffc020746a:	0505bc03          	ld	s8,80(a1)
ffffffffc020746e:	0585bc83          	ld	s9,88(a1)
ffffffffc0207472:	0605bd03          	ld	s10,96(a1)
ffffffffc0207476:	0685bd83          	ld	s11,104(a1)
ffffffffc020747a:	8082                	ret

ffffffffc020747c <RR_init>:
ffffffffc020747c:	e508                	sd	a0,8(a0)
ffffffffc020747e:	e108                	sd	a0,0(a0)
ffffffffc0207480:	00052823          	sw	zero,16(a0)
ffffffffc0207484:	8082                	ret

ffffffffc0207486 <RR_pick_next>:
ffffffffc0207486:	651c                	ld	a5,8(a0)
ffffffffc0207488:	00f50563          	beq	a0,a5,ffffffffc0207492 <RR_pick_next+0xc>
ffffffffc020748c:	ef078513          	addi	a0,a5,-272
ffffffffc0207490:	8082                	ret
ffffffffc0207492:	4501                	li	a0,0
ffffffffc0207494:	8082                	ret

ffffffffc0207496 <RR_proc_tick>:
ffffffffc0207496:	1205a783          	lw	a5,288(a1)
ffffffffc020749a:	00f05563          	blez	a5,ffffffffc02074a4 <RR_proc_tick+0xe>
ffffffffc020749e:	37fd                	addiw	a5,a5,-1
ffffffffc02074a0:	12f5a023          	sw	a5,288(a1)
ffffffffc02074a4:	e399                	bnez	a5,ffffffffc02074aa <RR_proc_tick+0x14>
ffffffffc02074a6:	4785                	li	a5,1
ffffffffc02074a8:	ed9c                	sd	a5,24(a1)
ffffffffc02074aa:	8082                	ret

ffffffffc02074ac <RR_dequeue>:
ffffffffc02074ac:	1185b703          	ld	a4,280(a1)
ffffffffc02074b0:	11058793          	addi	a5,a1,272
ffffffffc02074b4:	02e78363          	beq	a5,a4,ffffffffc02074da <RR_dequeue+0x2e>
ffffffffc02074b8:	1085b683          	ld	a3,264(a1)
ffffffffc02074bc:	00a69f63          	bne	a3,a0,ffffffffc02074da <RR_dequeue+0x2e>
ffffffffc02074c0:	1105b503          	ld	a0,272(a1)
ffffffffc02074c4:	4a90                	lw	a2,16(a3)
ffffffffc02074c6:	e518                	sd	a4,8(a0)
ffffffffc02074c8:	e308                	sd	a0,0(a4)
ffffffffc02074ca:	10f5bc23          	sd	a5,280(a1)
ffffffffc02074ce:	10f5b823          	sd	a5,272(a1)
ffffffffc02074d2:	fff6079b          	addiw	a5,a2,-1
ffffffffc02074d6:	ca9c                	sw	a5,16(a3)
ffffffffc02074d8:	8082                	ret
ffffffffc02074da:	1141                	addi	sp,sp,-16
ffffffffc02074dc:	00007697          	auipc	a3,0x7
ffffffffc02074e0:	c5468693          	addi	a3,a3,-940 # ffffffffc020e130 <CSWTCH.79+0xa68>
ffffffffc02074e4:	00004617          	auipc	a2,0x4
ffffffffc02074e8:	7d460613          	addi	a2,a2,2004 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02074ec:	03c00593          	li	a1,60
ffffffffc02074f0:	00007517          	auipc	a0,0x7
ffffffffc02074f4:	c7850513          	addi	a0,a0,-904 # ffffffffc020e168 <CSWTCH.79+0xaa0>
ffffffffc02074f8:	e406                	sd	ra,8(sp)
ffffffffc02074fa:	fa5f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02074fe <RR_enqueue>:
ffffffffc02074fe:	1185b703          	ld	a4,280(a1)
ffffffffc0207502:	11058793          	addi	a5,a1,272
ffffffffc0207506:	02e79d63          	bne	a5,a4,ffffffffc0207540 <RR_enqueue+0x42>
ffffffffc020750a:	6118                	ld	a4,0(a0)
ffffffffc020750c:	1205a683          	lw	a3,288(a1)
ffffffffc0207510:	e11c                	sd	a5,0(a0)
ffffffffc0207512:	e71c                	sd	a5,8(a4)
ffffffffc0207514:	10a5bc23          	sd	a0,280(a1)
ffffffffc0207518:	10e5b823          	sd	a4,272(a1)
ffffffffc020751c:	495c                	lw	a5,20(a0)
ffffffffc020751e:	ea89                	bnez	a3,ffffffffc0207530 <RR_enqueue+0x32>
ffffffffc0207520:	12f5a023          	sw	a5,288(a1)
ffffffffc0207524:	491c                	lw	a5,16(a0)
ffffffffc0207526:	10a5b423          	sd	a0,264(a1)
ffffffffc020752a:	2785                	addiw	a5,a5,1
ffffffffc020752c:	c91c                	sw	a5,16(a0)
ffffffffc020752e:	8082                	ret
ffffffffc0207530:	fed7c8e3          	blt	a5,a3,ffffffffc0207520 <RR_enqueue+0x22>
ffffffffc0207534:	491c                	lw	a5,16(a0)
ffffffffc0207536:	10a5b423          	sd	a0,264(a1)
ffffffffc020753a:	2785                	addiw	a5,a5,1
ffffffffc020753c:	c91c                	sw	a5,16(a0)
ffffffffc020753e:	8082                	ret
ffffffffc0207540:	1141                	addi	sp,sp,-16
ffffffffc0207542:	00007697          	auipc	a3,0x7
ffffffffc0207546:	c4668693          	addi	a3,a3,-954 # ffffffffc020e188 <CSWTCH.79+0xac0>
ffffffffc020754a:	00004617          	auipc	a2,0x4
ffffffffc020754e:	76e60613          	addi	a2,a2,1902 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207552:	02800593          	li	a1,40
ffffffffc0207556:	00007517          	auipc	a0,0x7
ffffffffc020755a:	c1250513          	addi	a0,a0,-1006 # ffffffffc020e168 <CSWTCH.79+0xaa0>
ffffffffc020755e:	e406                	sd	ra,8(sp)
ffffffffc0207560:	f3ff80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207564 <sched_init>:
ffffffffc0207564:	1141                	addi	sp,sp,-16
ffffffffc0207566:	0008a717          	auipc	a4,0x8a
ffffffffc020756a:	aba70713          	addi	a4,a4,-1350 # ffffffffc0291020 <default_sched_class>
ffffffffc020756e:	e022                	sd	s0,0(sp)
ffffffffc0207570:	e406                	sd	ra,8(sp)
ffffffffc0207572:	0008e797          	auipc	a5,0x8e
ffffffffc0207576:	27e78793          	addi	a5,a5,638 # ffffffffc02957f0 <timer_list>
ffffffffc020757a:	6714                	ld	a3,8(a4)
ffffffffc020757c:	0008e517          	auipc	a0,0x8e
ffffffffc0207580:	25450513          	addi	a0,a0,596 # ffffffffc02957d0 <__rq>
ffffffffc0207584:	e79c                	sd	a5,8(a5)
ffffffffc0207586:	e39c                	sd	a5,0(a5)
ffffffffc0207588:	4795                	li	a5,5
ffffffffc020758a:	c95c                	sw	a5,20(a0)
ffffffffc020758c:	0008f417          	auipc	s0,0x8f
ffffffffc0207590:	35c40413          	addi	s0,s0,860 # ffffffffc02968e8 <sched_class>
ffffffffc0207594:	0008f797          	auipc	a5,0x8f
ffffffffc0207598:	34a7b623          	sd	a0,844(a5) # ffffffffc02968e0 <rq>
ffffffffc020759c:	e018                	sd	a4,0(s0)
ffffffffc020759e:	9682                	jalr	a3
ffffffffc02075a0:	601c                	ld	a5,0(s0)
ffffffffc02075a2:	6402                	ld	s0,0(sp)
ffffffffc02075a4:	60a2                	ld	ra,8(sp)
ffffffffc02075a6:	638c                	ld	a1,0(a5)
ffffffffc02075a8:	00007517          	auipc	a0,0x7
ffffffffc02075ac:	c1050513          	addi	a0,a0,-1008 # ffffffffc020e1b8 <CSWTCH.79+0xaf0>
ffffffffc02075b0:	0141                	addi	sp,sp,16
ffffffffc02075b2:	bf5f806f          	j	ffffffffc02001a6 <cprintf>

ffffffffc02075b6 <wakeup_proc>:
ffffffffc02075b6:	4118                	lw	a4,0(a0)
ffffffffc02075b8:	1101                	addi	sp,sp,-32
ffffffffc02075ba:	ec06                	sd	ra,24(sp)
ffffffffc02075bc:	e822                	sd	s0,16(sp)
ffffffffc02075be:	e426                	sd	s1,8(sp)
ffffffffc02075c0:	478d                	li	a5,3
ffffffffc02075c2:	08f70363          	beq	a4,a5,ffffffffc0207648 <wakeup_proc+0x92>
ffffffffc02075c6:	842a                	mv	s0,a0
ffffffffc02075c8:	100027f3          	csrr	a5,sstatus
ffffffffc02075cc:	8b89                	andi	a5,a5,2
ffffffffc02075ce:	4481                	li	s1,0
ffffffffc02075d0:	e7bd                	bnez	a5,ffffffffc020763e <wakeup_proc+0x88>
ffffffffc02075d2:	4789                	li	a5,2
ffffffffc02075d4:	04f70863          	beq	a4,a5,ffffffffc0207624 <wakeup_proc+0x6e>
ffffffffc02075d8:	c01c                	sw	a5,0(s0)
ffffffffc02075da:	0e042623          	sw	zero,236(s0)
ffffffffc02075de:	0008f797          	auipc	a5,0x8f
ffffffffc02075e2:	2e27b783          	ld	a5,738(a5) # ffffffffc02968c0 <current>
ffffffffc02075e6:	02878363          	beq	a5,s0,ffffffffc020760c <wakeup_proc+0x56>
ffffffffc02075ea:	0008f797          	auipc	a5,0x8f
ffffffffc02075ee:	2de7b783          	ld	a5,734(a5) # ffffffffc02968c8 <idleproc>
ffffffffc02075f2:	00f40d63          	beq	s0,a5,ffffffffc020760c <wakeup_proc+0x56>
ffffffffc02075f6:	0008f797          	auipc	a5,0x8f
ffffffffc02075fa:	2f27b783          	ld	a5,754(a5) # ffffffffc02968e8 <sched_class>
ffffffffc02075fe:	6b9c                	ld	a5,16(a5)
ffffffffc0207600:	85a2                	mv	a1,s0
ffffffffc0207602:	0008f517          	auipc	a0,0x8f
ffffffffc0207606:	2de53503          	ld	a0,734(a0) # ffffffffc02968e0 <rq>
ffffffffc020760a:	9782                	jalr	a5
ffffffffc020760c:	e491                	bnez	s1,ffffffffc0207618 <wakeup_proc+0x62>
ffffffffc020760e:	60e2                	ld	ra,24(sp)
ffffffffc0207610:	6442                	ld	s0,16(sp)
ffffffffc0207612:	64a2                	ld	s1,8(sp)
ffffffffc0207614:	6105                	addi	sp,sp,32
ffffffffc0207616:	8082                	ret
ffffffffc0207618:	6442                	ld	s0,16(sp)
ffffffffc020761a:	60e2                	ld	ra,24(sp)
ffffffffc020761c:	64a2                	ld	s1,8(sp)
ffffffffc020761e:	6105                	addi	sp,sp,32
ffffffffc0207620:	e4cf906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207624:	00007617          	auipc	a2,0x7
ffffffffc0207628:	be460613          	addi	a2,a2,-1052 # ffffffffc020e208 <CSWTCH.79+0xb40>
ffffffffc020762c:	05200593          	li	a1,82
ffffffffc0207630:	00007517          	auipc	a0,0x7
ffffffffc0207634:	bc050513          	addi	a0,a0,-1088 # ffffffffc020e1f0 <CSWTCH.79+0xb28>
ffffffffc0207638:	ecff80ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc020763c:	bfc1                	j	ffffffffc020760c <wakeup_proc+0x56>
ffffffffc020763e:	e34f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207642:	4018                	lw	a4,0(s0)
ffffffffc0207644:	4485                	li	s1,1
ffffffffc0207646:	b771                	j	ffffffffc02075d2 <wakeup_proc+0x1c>
ffffffffc0207648:	00007697          	auipc	a3,0x7
ffffffffc020764c:	b8868693          	addi	a3,a3,-1144 # ffffffffc020e1d0 <CSWTCH.79+0xb08>
ffffffffc0207650:	00004617          	auipc	a2,0x4
ffffffffc0207654:	66860613          	addi	a2,a2,1640 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207658:	04300593          	li	a1,67
ffffffffc020765c:	00007517          	auipc	a0,0x7
ffffffffc0207660:	b9450513          	addi	a0,a0,-1132 # ffffffffc020e1f0 <CSWTCH.79+0xb28>
ffffffffc0207664:	e3bf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207668 <schedule>:
ffffffffc0207668:	7179                	addi	sp,sp,-48
ffffffffc020766a:	f406                	sd	ra,40(sp)
ffffffffc020766c:	f022                	sd	s0,32(sp)
ffffffffc020766e:	ec26                	sd	s1,24(sp)
ffffffffc0207670:	e84a                	sd	s2,16(sp)
ffffffffc0207672:	e44e                	sd	s3,8(sp)
ffffffffc0207674:	e052                	sd	s4,0(sp)
ffffffffc0207676:	100027f3          	csrr	a5,sstatus
ffffffffc020767a:	8b89                	andi	a5,a5,2
ffffffffc020767c:	4a01                	li	s4,0
ffffffffc020767e:	e3cd                	bnez	a5,ffffffffc0207720 <schedule+0xb8>
ffffffffc0207680:	0008f497          	auipc	s1,0x8f
ffffffffc0207684:	24048493          	addi	s1,s1,576 # ffffffffc02968c0 <current>
ffffffffc0207688:	608c                	ld	a1,0(s1)
ffffffffc020768a:	0008f997          	auipc	s3,0x8f
ffffffffc020768e:	25e98993          	addi	s3,s3,606 # ffffffffc02968e8 <sched_class>
ffffffffc0207692:	0008f917          	auipc	s2,0x8f
ffffffffc0207696:	24e90913          	addi	s2,s2,590 # ffffffffc02968e0 <rq>
ffffffffc020769a:	4194                	lw	a3,0(a1)
ffffffffc020769c:	0005bc23          	sd	zero,24(a1)
ffffffffc02076a0:	4709                	li	a4,2
ffffffffc02076a2:	0009b783          	ld	a5,0(s3)
ffffffffc02076a6:	00093503          	ld	a0,0(s2)
ffffffffc02076aa:	04e68e63          	beq	a3,a4,ffffffffc0207706 <schedule+0x9e>
ffffffffc02076ae:	739c                	ld	a5,32(a5)
ffffffffc02076b0:	9782                	jalr	a5
ffffffffc02076b2:	842a                	mv	s0,a0
ffffffffc02076b4:	c521                	beqz	a0,ffffffffc02076fc <schedule+0x94>
ffffffffc02076b6:	0009b783          	ld	a5,0(s3)
ffffffffc02076ba:	00093503          	ld	a0,0(s2)
ffffffffc02076be:	85a2                	mv	a1,s0
ffffffffc02076c0:	6f9c                	ld	a5,24(a5)
ffffffffc02076c2:	9782                	jalr	a5
ffffffffc02076c4:	441c                	lw	a5,8(s0)
ffffffffc02076c6:	6098                	ld	a4,0(s1)
ffffffffc02076c8:	2785                	addiw	a5,a5,1
ffffffffc02076ca:	c41c                	sw	a5,8(s0)
ffffffffc02076cc:	00870563          	beq	a4,s0,ffffffffc02076d6 <schedule+0x6e>
ffffffffc02076d0:	8522                	mv	a0,s0
ffffffffc02076d2:	c32fe0ef          	jal	ra,ffffffffc0205b04 <proc_run>
ffffffffc02076d6:	000a1a63          	bnez	s4,ffffffffc02076ea <schedule+0x82>
ffffffffc02076da:	70a2                	ld	ra,40(sp)
ffffffffc02076dc:	7402                	ld	s0,32(sp)
ffffffffc02076de:	64e2                	ld	s1,24(sp)
ffffffffc02076e0:	6942                	ld	s2,16(sp)
ffffffffc02076e2:	69a2                	ld	s3,8(sp)
ffffffffc02076e4:	6a02                	ld	s4,0(sp)
ffffffffc02076e6:	6145                	addi	sp,sp,48
ffffffffc02076e8:	8082                	ret
ffffffffc02076ea:	7402                	ld	s0,32(sp)
ffffffffc02076ec:	70a2                	ld	ra,40(sp)
ffffffffc02076ee:	64e2                	ld	s1,24(sp)
ffffffffc02076f0:	6942                	ld	s2,16(sp)
ffffffffc02076f2:	69a2                	ld	s3,8(sp)
ffffffffc02076f4:	6a02                	ld	s4,0(sp)
ffffffffc02076f6:	6145                	addi	sp,sp,48
ffffffffc02076f8:	d74f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc02076fc:	0008f417          	auipc	s0,0x8f
ffffffffc0207700:	1cc43403          	ld	s0,460(s0) # ffffffffc02968c8 <idleproc>
ffffffffc0207704:	b7c1                	j	ffffffffc02076c4 <schedule+0x5c>
ffffffffc0207706:	0008f717          	auipc	a4,0x8f
ffffffffc020770a:	1c273703          	ld	a4,450(a4) # ffffffffc02968c8 <idleproc>
ffffffffc020770e:	fae580e3          	beq	a1,a4,ffffffffc02076ae <schedule+0x46>
ffffffffc0207712:	6b9c                	ld	a5,16(a5)
ffffffffc0207714:	9782                	jalr	a5
ffffffffc0207716:	0009b783          	ld	a5,0(s3)
ffffffffc020771a:	00093503          	ld	a0,0(s2)
ffffffffc020771e:	bf41                	j	ffffffffc02076ae <schedule+0x46>
ffffffffc0207720:	d52f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207724:	4a05                	li	s4,1
ffffffffc0207726:	bfa9                	j	ffffffffc0207680 <schedule+0x18>

ffffffffc0207728 <add_timer>:
ffffffffc0207728:	1141                	addi	sp,sp,-16
ffffffffc020772a:	e022                	sd	s0,0(sp)
ffffffffc020772c:	e406                	sd	ra,8(sp)
ffffffffc020772e:	842a                	mv	s0,a0
ffffffffc0207730:	100027f3          	csrr	a5,sstatus
ffffffffc0207734:	8b89                	andi	a5,a5,2
ffffffffc0207736:	4501                	li	a0,0
ffffffffc0207738:	eba5                	bnez	a5,ffffffffc02077a8 <add_timer+0x80>
ffffffffc020773a:	401c                	lw	a5,0(s0)
ffffffffc020773c:	cbb5                	beqz	a5,ffffffffc02077b0 <add_timer+0x88>
ffffffffc020773e:	6418                	ld	a4,8(s0)
ffffffffc0207740:	cb25                	beqz	a4,ffffffffc02077b0 <add_timer+0x88>
ffffffffc0207742:	6c18                	ld	a4,24(s0)
ffffffffc0207744:	01040593          	addi	a1,s0,16
ffffffffc0207748:	08e59463          	bne	a1,a4,ffffffffc02077d0 <add_timer+0xa8>
ffffffffc020774c:	0008e617          	auipc	a2,0x8e
ffffffffc0207750:	0a460613          	addi	a2,a2,164 # ffffffffc02957f0 <timer_list>
ffffffffc0207754:	6618                	ld	a4,8(a2)
ffffffffc0207756:	00c71863          	bne	a4,a2,ffffffffc0207766 <add_timer+0x3e>
ffffffffc020775a:	a80d                	j	ffffffffc020778c <add_timer+0x64>
ffffffffc020775c:	6718                	ld	a4,8(a4)
ffffffffc020775e:	9f95                	subw	a5,a5,a3
ffffffffc0207760:	c01c                	sw	a5,0(s0)
ffffffffc0207762:	02c70563          	beq	a4,a2,ffffffffc020778c <add_timer+0x64>
ffffffffc0207766:	ff072683          	lw	a3,-16(a4)
ffffffffc020776a:	fed7f9e3          	bgeu	a5,a3,ffffffffc020775c <add_timer+0x34>
ffffffffc020776e:	40f687bb          	subw	a5,a3,a5
ffffffffc0207772:	fef72823          	sw	a5,-16(a4)
ffffffffc0207776:	631c                	ld	a5,0(a4)
ffffffffc0207778:	e30c                	sd	a1,0(a4)
ffffffffc020777a:	e78c                	sd	a1,8(a5)
ffffffffc020777c:	ec18                	sd	a4,24(s0)
ffffffffc020777e:	e81c                	sd	a5,16(s0)
ffffffffc0207780:	c105                	beqz	a0,ffffffffc02077a0 <add_timer+0x78>
ffffffffc0207782:	6402                	ld	s0,0(sp)
ffffffffc0207784:	60a2                	ld	ra,8(sp)
ffffffffc0207786:	0141                	addi	sp,sp,16
ffffffffc0207788:	ce4f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc020778c:	0008e717          	auipc	a4,0x8e
ffffffffc0207790:	06470713          	addi	a4,a4,100 # ffffffffc02957f0 <timer_list>
ffffffffc0207794:	631c                	ld	a5,0(a4)
ffffffffc0207796:	e30c                	sd	a1,0(a4)
ffffffffc0207798:	e78c                	sd	a1,8(a5)
ffffffffc020779a:	ec18                	sd	a4,24(s0)
ffffffffc020779c:	e81c                	sd	a5,16(s0)
ffffffffc020779e:	f175                	bnez	a0,ffffffffc0207782 <add_timer+0x5a>
ffffffffc02077a0:	60a2                	ld	ra,8(sp)
ffffffffc02077a2:	6402                	ld	s0,0(sp)
ffffffffc02077a4:	0141                	addi	sp,sp,16
ffffffffc02077a6:	8082                	ret
ffffffffc02077a8:	ccaf90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02077ac:	4505                	li	a0,1
ffffffffc02077ae:	b771                	j	ffffffffc020773a <add_timer+0x12>
ffffffffc02077b0:	00007697          	auipc	a3,0x7
ffffffffc02077b4:	a7868693          	addi	a3,a3,-1416 # ffffffffc020e228 <CSWTCH.79+0xb60>
ffffffffc02077b8:	00004617          	auipc	a2,0x4
ffffffffc02077bc:	50060613          	addi	a2,a2,1280 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02077c0:	07a00593          	li	a1,122
ffffffffc02077c4:	00007517          	auipc	a0,0x7
ffffffffc02077c8:	a2c50513          	addi	a0,a0,-1492 # ffffffffc020e1f0 <CSWTCH.79+0xb28>
ffffffffc02077cc:	cd3f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02077d0:	00007697          	auipc	a3,0x7
ffffffffc02077d4:	a8868693          	addi	a3,a3,-1400 # ffffffffc020e258 <CSWTCH.79+0xb90>
ffffffffc02077d8:	00004617          	auipc	a2,0x4
ffffffffc02077dc:	4e060613          	addi	a2,a2,1248 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02077e0:	07b00593          	li	a1,123
ffffffffc02077e4:	00007517          	auipc	a0,0x7
ffffffffc02077e8:	a0c50513          	addi	a0,a0,-1524 # ffffffffc020e1f0 <CSWTCH.79+0xb28>
ffffffffc02077ec:	cb3f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02077f0 <del_timer>:
ffffffffc02077f0:	1101                	addi	sp,sp,-32
ffffffffc02077f2:	e822                	sd	s0,16(sp)
ffffffffc02077f4:	ec06                	sd	ra,24(sp)
ffffffffc02077f6:	e426                	sd	s1,8(sp)
ffffffffc02077f8:	842a                	mv	s0,a0
ffffffffc02077fa:	100027f3          	csrr	a5,sstatus
ffffffffc02077fe:	8b89                	andi	a5,a5,2
ffffffffc0207800:	01050493          	addi	s1,a0,16
ffffffffc0207804:	eb9d                	bnez	a5,ffffffffc020783a <del_timer+0x4a>
ffffffffc0207806:	6d1c                	ld	a5,24(a0)
ffffffffc0207808:	02978463          	beq	a5,s1,ffffffffc0207830 <del_timer+0x40>
ffffffffc020780c:	4114                	lw	a3,0(a0)
ffffffffc020780e:	6918                	ld	a4,16(a0)
ffffffffc0207810:	ce81                	beqz	a3,ffffffffc0207828 <del_timer+0x38>
ffffffffc0207812:	0008e617          	auipc	a2,0x8e
ffffffffc0207816:	fde60613          	addi	a2,a2,-34 # ffffffffc02957f0 <timer_list>
ffffffffc020781a:	00c78763          	beq	a5,a2,ffffffffc0207828 <del_timer+0x38>
ffffffffc020781e:	ff07a603          	lw	a2,-16(a5)
ffffffffc0207822:	9eb1                	addw	a3,a3,a2
ffffffffc0207824:	fed7a823          	sw	a3,-16(a5)
ffffffffc0207828:	e71c                	sd	a5,8(a4)
ffffffffc020782a:	e398                	sd	a4,0(a5)
ffffffffc020782c:	ec04                	sd	s1,24(s0)
ffffffffc020782e:	e804                	sd	s1,16(s0)
ffffffffc0207830:	60e2                	ld	ra,24(sp)
ffffffffc0207832:	6442                	ld	s0,16(sp)
ffffffffc0207834:	64a2                	ld	s1,8(sp)
ffffffffc0207836:	6105                	addi	sp,sp,32
ffffffffc0207838:	8082                	ret
ffffffffc020783a:	c38f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020783e:	6c1c                	ld	a5,24(s0)
ffffffffc0207840:	02978463          	beq	a5,s1,ffffffffc0207868 <del_timer+0x78>
ffffffffc0207844:	4014                	lw	a3,0(s0)
ffffffffc0207846:	6818                	ld	a4,16(s0)
ffffffffc0207848:	ce81                	beqz	a3,ffffffffc0207860 <del_timer+0x70>
ffffffffc020784a:	0008e617          	auipc	a2,0x8e
ffffffffc020784e:	fa660613          	addi	a2,a2,-90 # ffffffffc02957f0 <timer_list>
ffffffffc0207852:	00c78763          	beq	a5,a2,ffffffffc0207860 <del_timer+0x70>
ffffffffc0207856:	ff07a603          	lw	a2,-16(a5)
ffffffffc020785a:	9eb1                	addw	a3,a3,a2
ffffffffc020785c:	fed7a823          	sw	a3,-16(a5)
ffffffffc0207860:	e71c                	sd	a5,8(a4)
ffffffffc0207862:	e398                	sd	a4,0(a5)
ffffffffc0207864:	ec04                	sd	s1,24(s0)
ffffffffc0207866:	e804                	sd	s1,16(s0)
ffffffffc0207868:	6442                	ld	s0,16(sp)
ffffffffc020786a:	60e2                	ld	ra,24(sp)
ffffffffc020786c:	64a2                	ld	s1,8(sp)
ffffffffc020786e:	6105                	addi	sp,sp,32
ffffffffc0207870:	bfcf906f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc0207874 <run_timer_list>:
ffffffffc0207874:	7139                	addi	sp,sp,-64
ffffffffc0207876:	fc06                	sd	ra,56(sp)
ffffffffc0207878:	f822                	sd	s0,48(sp)
ffffffffc020787a:	f426                	sd	s1,40(sp)
ffffffffc020787c:	f04a                	sd	s2,32(sp)
ffffffffc020787e:	ec4e                	sd	s3,24(sp)
ffffffffc0207880:	e852                	sd	s4,16(sp)
ffffffffc0207882:	e456                	sd	s5,8(sp)
ffffffffc0207884:	e05a                	sd	s6,0(sp)
ffffffffc0207886:	100027f3          	csrr	a5,sstatus
ffffffffc020788a:	8b89                	andi	a5,a5,2
ffffffffc020788c:	4b01                	li	s6,0
ffffffffc020788e:	efe9                	bnez	a5,ffffffffc0207968 <run_timer_list+0xf4>
ffffffffc0207890:	0008e997          	auipc	s3,0x8e
ffffffffc0207894:	f6098993          	addi	s3,s3,-160 # ffffffffc02957f0 <timer_list>
ffffffffc0207898:	0089b403          	ld	s0,8(s3)
ffffffffc020789c:	07340a63          	beq	s0,s3,ffffffffc0207910 <run_timer_list+0x9c>
ffffffffc02078a0:	ff042783          	lw	a5,-16(s0)
ffffffffc02078a4:	ff040913          	addi	s2,s0,-16
ffffffffc02078a8:	0e078763          	beqz	a5,ffffffffc0207996 <run_timer_list+0x122>
ffffffffc02078ac:	fff7871b          	addiw	a4,a5,-1
ffffffffc02078b0:	fee42823          	sw	a4,-16(s0)
ffffffffc02078b4:	ef31                	bnez	a4,ffffffffc0207910 <run_timer_list+0x9c>
ffffffffc02078b6:	00007a97          	auipc	s5,0x7
ffffffffc02078ba:	a0aa8a93          	addi	s5,s5,-1526 # ffffffffc020e2c0 <CSWTCH.79+0xbf8>
ffffffffc02078be:	00007a17          	auipc	s4,0x7
ffffffffc02078c2:	932a0a13          	addi	s4,s4,-1742 # ffffffffc020e1f0 <CSWTCH.79+0xb28>
ffffffffc02078c6:	a005                	j	ffffffffc02078e6 <run_timer_list+0x72>
ffffffffc02078c8:	0a07d763          	bgez	a5,ffffffffc0207976 <run_timer_list+0x102>
ffffffffc02078cc:	8526                	mv	a0,s1
ffffffffc02078ce:	ce9ff0ef          	jal	ra,ffffffffc02075b6 <wakeup_proc>
ffffffffc02078d2:	854a                	mv	a0,s2
ffffffffc02078d4:	f1dff0ef          	jal	ra,ffffffffc02077f0 <del_timer>
ffffffffc02078d8:	03340c63          	beq	s0,s3,ffffffffc0207910 <run_timer_list+0x9c>
ffffffffc02078dc:	ff042783          	lw	a5,-16(s0)
ffffffffc02078e0:	ff040913          	addi	s2,s0,-16
ffffffffc02078e4:	e795                	bnez	a5,ffffffffc0207910 <run_timer_list+0x9c>
ffffffffc02078e6:	00893483          	ld	s1,8(s2)
ffffffffc02078ea:	6400                	ld	s0,8(s0)
ffffffffc02078ec:	0ec4a783          	lw	a5,236(s1)
ffffffffc02078f0:	ffe1                	bnez	a5,ffffffffc02078c8 <run_timer_list+0x54>
ffffffffc02078f2:	40d4                	lw	a3,4(s1)
ffffffffc02078f4:	8656                	mv	a2,s5
ffffffffc02078f6:	0ba00593          	li	a1,186
ffffffffc02078fa:	8552                	mv	a0,s4
ffffffffc02078fc:	c0bf80ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc0207900:	8526                	mv	a0,s1
ffffffffc0207902:	cb5ff0ef          	jal	ra,ffffffffc02075b6 <wakeup_proc>
ffffffffc0207906:	854a                	mv	a0,s2
ffffffffc0207908:	ee9ff0ef          	jal	ra,ffffffffc02077f0 <del_timer>
ffffffffc020790c:	fd3418e3          	bne	s0,s3,ffffffffc02078dc <run_timer_list+0x68>
ffffffffc0207910:	0008f597          	auipc	a1,0x8f
ffffffffc0207914:	fb05b583          	ld	a1,-80(a1) # ffffffffc02968c0 <current>
ffffffffc0207918:	c18d                	beqz	a1,ffffffffc020793a <run_timer_list+0xc6>
ffffffffc020791a:	0008f797          	auipc	a5,0x8f
ffffffffc020791e:	fae7b783          	ld	a5,-82(a5) # ffffffffc02968c8 <idleproc>
ffffffffc0207922:	04f58763          	beq	a1,a5,ffffffffc0207970 <run_timer_list+0xfc>
ffffffffc0207926:	0008f797          	auipc	a5,0x8f
ffffffffc020792a:	fc27b783          	ld	a5,-62(a5) # ffffffffc02968e8 <sched_class>
ffffffffc020792e:	779c                	ld	a5,40(a5)
ffffffffc0207930:	0008f517          	auipc	a0,0x8f
ffffffffc0207934:	fb053503          	ld	a0,-80(a0) # ffffffffc02968e0 <rq>
ffffffffc0207938:	9782                	jalr	a5
ffffffffc020793a:	000b1c63          	bnez	s6,ffffffffc0207952 <run_timer_list+0xde>
ffffffffc020793e:	70e2                	ld	ra,56(sp)
ffffffffc0207940:	7442                	ld	s0,48(sp)
ffffffffc0207942:	74a2                	ld	s1,40(sp)
ffffffffc0207944:	7902                	ld	s2,32(sp)
ffffffffc0207946:	69e2                	ld	s3,24(sp)
ffffffffc0207948:	6a42                	ld	s4,16(sp)
ffffffffc020794a:	6aa2                	ld	s5,8(sp)
ffffffffc020794c:	6b02                	ld	s6,0(sp)
ffffffffc020794e:	6121                	addi	sp,sp,64
ffffffffc0207950:	8082                	ret
ffffffffc0207952:	7442                	ld	s0,48(sp)
ffffffffc0207954:	70e2                	ld	ra,56(sp)
ffffffffc0207956:	74a2                	ld	s1,40(sp)
ffffffffc0207958:	7902                	ld	s2,32(sp)
ffffffffc020795a:	69e2                	ld	s3,24(sp)
ffffffffc020795c:	6a42                	ld	s4,16(sp)
ffffffffc020795e:	6aa2                	ld	s5,8(sp)
ffffffffc0207960:	6b02                	ld	s6,0(sp)
ffffffffc0207962:	6121                	addi	sp,sp,64
ffffffffc0207964:	b08f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207968:	b0af90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020796c:	4b05                	li	s6,1
ffffffffc020796e:	b70d                	j	ffffffffc0207890 <run_timer_list+0x1c>
ffffffffc0207970:	4785                	li	a5,1
ffffffffc0207972:	ed9c                	sd	a5,24(a1)
ffffffffc0207974:	b7d9                	j	ffffffffc020793a <run_timer_list+0xc6>
ffffffffc0207976:	00007697          	auipc	a3,0x7
ffffffffc020797a:	92268693          	addi	a3,a3,-1758 # ffffffffc020e298 <CSWTCH.79+0xbd0>
ffffffffc020797e:	00004617          	auipc	a2,0x4
ffffffffc0207982:	33a60613          	addi	a2,a2,826 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207986:	0b600593          	li	a1,182
ffffffffc020798a:	00007517          	auipc	a0,0x7
ffffffffc020798e:	86650513          	addi	a0,a0,-1946 # ffffffffc020e1f0 <CSWTCH.79+0xb28>
ffffffffc0207992:	b0df80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207996:	00007697          	auipc	a3,0x7
ffffffffc020799a:	8ea68693          	addi	a3,a3,-1814 # ffffffffc020e280 <CSWTCH.79+0xbb8>
ffffffffc020799e:	00004617          	auipc	a2,0x4
ffffffffc02079a2:	31a60613          	addi	a2,a2,794 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02079a6:	0ae00593          	li	a1,174
ffffffffc02079aa:	00007517          	auipc	a0,0x7
ffffffffc02079ae:	84650513          	addi	a0,a0,-1978 # ffffffffc020e1f0 <CSWTCH.79+0xb28>
ffffffffc02079b2:	aedf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02079b6 <sys_getpid>:
ffffffffc02079b6:	0008f797          	auipc	a5,0x8f
ffffffffc02079ba:	f0a7b783          	ld	a5,-246(a5) # ffffffffc02968c0 <current>
ffffffffc02079be:	43c8                	lw	a0,4(a5)
ffffffffc02079c0:	8082                	ret

ffffffffc02079c2 <sys_pgdir>:
ffffffffc02079c2:	4501                	li	a0,0
ffffffffc02079c4:	8082                	ret

ffffffffc02079c6 <sys_gettime>:
ffffffffc02079c6:	0008f797          	auipc	a5,0x8f
ffffffffc02079ca:	eaa7b783          	ld	a5,-342(a5) # ffffffffc0296870 <ticks>
ffffffffc02079ce:	0027951b          	slliw	a0,a5,0x2
ffffffffc02079d2:	9d3d                	addw	a0,a0,a5
ffffffffc02079d4:	0015151b          	slliw	a0,a0,0x1
ffffffffc02079d8:	8082                	ret

ffffffffc02079da <sys_lab6_set_priority>:
ffffffffc02079da:	4108                	lw	a0,0(a0)
ffffffffc02079dc:	1141                	addi	sp,sp,-16
ffffffffc02079de:	e406                	sd	ra,8(sp)
ffffffffc02079e0:	975ff0ef          	jal	ra,ffffffffc0207354 <lab6_set_priority>
ffffffffc02079e4:	60a2                	ld	ra,8(sp)
ffffffffc02079e6:	4501                	li	a0,0
ffffffffc02079e8:	0141                	addi	sp,sp,16
ffffffffc02079ea:	8082                	ret

ffffffffc02079ec <sys_dup>:
ffffffffc02079ec:	450c                	lw	a1,8(a0)
ffffffffc02079ee:	4108                	lw	a0,0(a0)
ffffffffc02079f0:	f6dfd06f          	j	ffffffffc020595c <sysfile_dup>

ffffffffc02079f4 <sys_getdirentry>:
ffffffffc02079f4:	650c                	ld	a1,8(a0)
ffffffffc02079f6:	4108                	lw	a0,0(a0)
ffffffffc02079f8:	e75fd06f          	j	ffffffffc020586c <sysfile_getdirentry>

ffffffffc02079fc <sys_getcwd>:
ffffffffc02079fc:	650c                	ld	a1,8(a0)
ffffffffc02079fe:	6108                	ld	a0,0(a0)
ffffffffc0207a00:	dc9fd06f          	j	ffffffffc02057c8 <sysfile_getcwd>

ffffffffc0207a04 <sys_fsync>:
ffffffffc0207a04:	4108                	lw	a0,0(a0)
ffffffffc0207a06:	dbffd06f          	j	ffffffffc02057c4 <sysfile_fsync>

ffffffffc0207a0a <sys_fstat>:
ffffffffc0207a0a:	650c                	ld	a1,8(a0)
ffffffffc0207a0c:	4108                	lw	a0,0(a0)
ffffffffc0207a0e:	d17fd06f          	j	ffffffffc0205724 <sysfile_fstat>

ffffffffc0207a12 <sys_seek>:
ffffffffc0207a12:	4910                	lw	a2,16(a0)
ffffffffc0207a14:	650c                	ld	a1,8(a0)
ffffffffc0207a16:	4108                	lw	a0,0(a0)
ffffffffc0207a18:	d09fd06f          	j	ffffffffc0205720 <sysfile_seek>

ffffffffc0207a1c <sys_write>:
ffffffffc0207a1c:	6910                	ld	a2,16(a0)
ffffffffc0207a1e:	650c                	ld	a1,8(a0)
ffffffffc0207a20:	4108                	lw	a0,0(a0)
ffffffffc0207a22:	be5fd06f          	j	ffffffffc0205606 <sysfile_write>

ffffffffc0207a26 <sys_read>:
ffffffffc0207a26:	6910                	ld	a2,16(a0)
ffffffffc0207a28:	650c                	ld	a1,8(a0)
ffffffffc0207a2a:	4108                	lw	a0,0(a0)
ffffffffc0207a2c:	ac7fd06f          	j	ffffffffc02054f2 <sysfile_read>

ffffffffc0207a30 <sys_close>:
ffffffffc0207a30:	4108                	lw	a0,0(a0)
ffffffffc0207a32:	abdfd06f          	j	ffffffffc02054ee <sysfile_close>

ffffffffc0207a36 <sys_open>:
ffffffffc0207a36:	450c                	lw	a1,8(a0)
ffffffffc0207a38:	6108                	ld	a0,0(a0)
ffffffffc0207a3a:	a81fd06f          	j	ffffffffc02054ba <sysfile_open>

ffffffffc0207a3e <sys_putc>:
ffffffffc0207a3e:	4108                	lw	a0,0(a0)
ffffffffc0207a40:	1141                	addi	sp,sp,-16
ffffffffc0207a42:	e406                	sd	ra,8(sp)
ffffffffc0207a44:	f9ef80ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0207a48:	60a2                	ld	ra,8(sp)
ffffffffc0207a4a:	4501                	li	a0,0
ffffffffc0207a4c:	0141                	addi	sp,sp,16
ffffffffc0207a4e:	8082                	ret

ffffffffc0207a50 <sys_kill>:
ffffffffc0207a50:	4108                	lw	a0,0(a0)
ffffffffc0207a52:	e9cff06f          	j	ffffffffc02070ee <do_kill>

ffffffffc0207a56 <sys_sleep>:
ffffffffc0207a56:	4108                	lw	a0,0(a0)
ffffffffc0207a58:	937ff06f          	j	ffffffffc020738e <do_sleep>

ffffffffc0207a5c <sys_yield>:
ffffffffc0207a5c:	e44ff06f          	j	ffffffffc02070a0 <do_yield>

ffffffffc0207a60 <sys_exec>:
ffffffffc0207a60:	6910                	ld	a2,16(a0)
ffffffffc0207a62:	450c                	lw	a1,8(a0)
ffffffffc0207a64:	6108                	ld	a0,0(a0)
ffffffffc0207a66:	a65fe06f          	j	ffffffffc02064ca <do_execve>

ffffffffc0207a6a <sys_wait>:
ffffffffc0207a6a:	650c                	ld	a1,8(a0)
ffffffffc0207a6c:	4108                	lw	a0,0(a0)
ffffffffc0207a6e:	e42ff06f          	j	ffffffffc02070b0 <do_wait>

ffffffffc0207a72 <sys_fork>:
ffffffffc0207a72:	0008f797          	auipc	a5,0x8f
ffffffffc0207a76:	e4e7b783          	ld	a5,-434(a5) # ffffffffc02968c0 <current>
ffffffffc0207a7a:	73d0                	ld	a2,160(a5)
ffffffffc0207a7c:	4501                	li	a0,0
ffffffffc0207a7e:	6a0c                	ld	a1,16(a2)
ffffffffc0207a80:	8ecfe06f          	j	ffffffffc0205b6c <do_fork>

ffffffffc0207a84 <sys_exit>:
ffffffffc0207a84:	4108                	lw	a0,0(a0)
ffffffffc0207a86:	d58fe06f          	j	ffffffffc0205fde <do_exit>

ffffffffc0207a8a <syscall>:
ffffffffc0207a8a:	715d                	addi	sp,sp,-80
ffffffffc0207a8c:	fc26                	sd	s1,56(sp)
ffffffffc0207a8e:	0008f497          	auipc	s1,0x8f
ffffffffc0207a92:	e3248493          	addi	s1,s1,-462 # ffffffffc02968c0 <current>
ffffffffc0207a96:	6098                	ld	a4,0(s1)
ffffffffc0207a98:	e0a2                	sd	s0,64(sp)
ffffffffc0207a9a:	f84a                	sd	s2,48(sp)
ffffffffc0207a9c:	7340                	ld	s0,160(a4)
ffffffffc0207a9e:	e486                	sd	ra,72(sp)
ffffffffc0207aa0:	0ff00793          	li	a5,255
ffffffffc0207aa4:	05042903          	lw	s2,80(s0)
ffffffffc0207aa8:	0327ee63          	bltu	a5,s2,ffffffffc0207ae4 <syscall+0x5a>
ffffffffc0207aac:	00391713          	slli	a4,s2,0x3
ffffffffc0207ab0:	00007797          	auipc	a5,0x7
ffffffffc0207ab4:	87878793          	addi	a5,a5,-1928 # ffffffffc020e328 <syscalls>
ffffffffc0207ab8:	97ba                	add	a5,a5,a4
ffffffffc0207aba:	639c                	ld	a5,0(a5)
ffffffffc0207abc:	c785                	beqz	a5,ffffffffc0207ae4 <syscall+0x5a>
ffffffffc0207abe:	6c28                	ld	a0,88(s0)
ffffffffc0207ac0:	702c                	ld	a1,96(s0)
ffffffffc0207ac2:	7430                	ld	a2,104(s0)
ffffffffc0207ac4:	7834                	ld	a3,112(s0)
ffffffffc0207ac6:	7c38                	ld	a4,120(s0)
ffffffffc0207ac8:	e42a                	sd	a0,8(sp)
ffffffffc0207aca:	e82e                	sd	a1,16(sp)
ffffffffc0207acc:	ec32                	sd	a2,24(sp)
ffffffffc0207ace:	f036                	sd	a3,32(sp)
ffffffffc0207ad0:	f43a                	sd	a4,40(sp)
ffffffffc0207ad2:	0028                	addi	a0,sp,8
ffffffffc0207ad4:	9782                	jalr	a5
ffffffffc0207ad6:	60a6                	ld	ra,72(sp)
ffffffffc0207ad8:	e828                	sd	a0,80(s0)
ffffffffc0207ada:	6406                	ld	s0,64(sp)
ffffffffc0207adc:	74e2                	ld	s1,56(sp)
ffffffffc0207ade:	7942                	ld	s2,48(sp)
ffffffffc0207ae0:	6161                	addi	sp,sp,80
ffffffffc0207ae2:	8082                	ret
ffffffffc0207ae4:	8522                	mv	a0,s0
ffffffffc0207ae6:	ca4f90ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc0207aea:	609c                	ld	a5,0(s1)
ffffffffc0207aec:	86ca                	mv	a3,s2
ffffffffc0207aee:	00006617          	auipc	a2,0x6
ffffffffc0207af2:	7f260613          	addi	a2,a2,2034 # ffffffffc020e2e0 <CSWTCH.79+0xc18>
ffffffffc0207af6:	43d8                	lw	a4,4(a5)
ffffffffc0207af8:	0d800593          	li	a1,216
ffffffffc0207afc:	0b478793          	addi	a5,a5,180
ffffffffc0207b00:	00007517          	auipc	a0,0x7
ffffffffc0207b04:	81050513          	addi	a0,a0,-2032 # ffffffffc020e310 <CSWTCH.79+0xc48>
ffffffffc0207b08:	997f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207b0c <__alloc_inode>:
ffffffffc0207b0c:	1141                	addi	sp,sp,-16
ffffffffc0207b0e:	e022                	sd	s0,0(sp)
ffffffffc0207b10:	842a                	mv	s0,a0
ffffffffc0207b12:	07800513          	li	a0,120
ffffffffc0207b16:	e406                	sd	ra,8(sp)
ffffffffc0207b18:	c76fa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0207b1c:	c111                	beqz	a0,ffffffffc0207b20 <__alloc_inode+0x14>
ffffffffc0207b1e:	cd20                	sw	s0,88(a0)
ffffffffc0207b20:	60a2                	ld	ra,8(sp)
ffffffffc0207b22:	6402                	ld	s0,0(sp)
ffffffffc0207b24:	0141                	addi	sp,sp,16
ffffffffc0207b26:	8082                	ret

ffffffffc0207b28 <inode_init>:
ffffffffc0207b28:	4785                	li	a5,1
ffffffffc0207b2a:	06052023          	sw	zero,96(a0)
ffffffffc0207b2e:	f92c                	sd	a1,112(a0)
ffffffffc0207b30:	f530                	sd	a2,104(a0)
ffffffffc0207b32:	cd7c                	sw	a5,92(a0)
ffffffffc0207b34:	8082                	ret

ffffffffc0207b36 <inode_kill>:
ffffffffc0207b36:	4d78                	lw	a4,92(a0)
ffffffffc0207b38:	1141                	addi	sp,sp,-16
ffffffffc0207b3a:	e406                	sd	ra,8(sp)
ffffffffc0207b3c:	e719                	bnez	a4,ffffffffc0207b4a <inode_kill+0x14>
ffffffffc0207b3e:	513c                	lw	a5,96(a0)
ffffffffc0207b40:	e78d                	bnez	a5,ffffffffc0207b6a <inode_kill+0x34>
ffffffffc0207b42:	60a2                	ld	ra,8(sp)
ffffffffc0207b44:	0141                	addi	sp,sp,16
ffffffffc0207b46:	cf8fa06f          	j	ffffffffc020203e <kfree>
ffffffffc0207b4a:	00007697          	auipc	a3,0x7
ffffffffc0207b4e:	fde68693          	addi	a3,a3,-34 # ffffffffc020eb28 <syscalls+0x800>
ffffffffc0207b52:	00004617          	auipc	a2,0x4
ffffffffc0207b56:	16660613          	addi	a2,a2,358 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207b5a:	02900593          	li	a1,41
ffffffffc0207b5e:	00007517          	auipc	a0,0x7
ffffffffc0207b62:	fea50513          	addi	a0,a0,-22 # ffffffffc020eb48 <syscalls+0x820>
ffffffffc0207b66:	939f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207b6a:	00007697          	auipc	a3,0x7
ffffffffc0207b6e:	ff668693          	addi	a3,a3,-10 # ffffffffc020eb60 <syscalls+0x838>
ffffffffc0207b72:	00004617          	auipc	a2,0x4
ffffffffc0207b76:	14660613          	addi	a2,a2,326 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207b7a:	02a00593          	li	a1,42
ffffffffc0207b7e:	00007517          	auipc	a0,0x7
ffffffffc0207b82:	fca50513          	addi	a0,a0,-54 # ffffffffc020eb48 <syscalls+0x820>
ffffffffc0207b86:	919f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207b8a <inode_ref_inc>:
ffffffffc0207b8a:	4d7c                	lw	a5,92(a0)
ffffffffc0207b8c:	2785                	addiw	a5,a5,1
ffffffffc0207b8e:	cd7c                	sw	a5,92(a0)
ffffffffc0207b90:	0007851b          	sext.w	a0,a5
ffffffffc0207b94:	8082                	ret

ffffffffc0207b96 <inode_open_inc>:
ffffffffc0207b96:	513c                	lw	a5,96(a0)
ffffffffc0207b98:	2785                	addiw	a5,a5,1
ffffffffc0207b9a:	d13c                	sw	a5,96(a0)
ffffffffc0207b9c:	0007851b          	sext.w	a0,a5
ffffffffc0207ba0:	8082                	ret

ffffffffc0207ba2 <inode_check>:
ffffffffc0207ba2:	1141                	addi	sp,sp,-16
ffffffffc0207ba4:	e406                	sd	ra,8(sp)
ffffffffc0207ba6:	c90d                	beqz	a0,ffffffffc0207bd8 <inode_check+0x36>
ffffffffc0207ba8:	793c                	ld	a5,112(a0)
ffffffffc0207baa:	c79d                	beqz	a5,ffffffffc0207bd8 <inode_check+0x36>
ffffffffc0207bac:	6398                	ld	a4,0(a5)
ffffffffc0207bae:	4625d7b7          	lui	a5,0x4625d
ffffffffc0207bb2:	0786                	slli	a5,a5,0x1
ffffffffc0207bb4:	47678793          	addi	a5,a5,1142 # 4625d476 <_binary_bin_sfs_img_size+0x461e8176>
ffffffffc0207bb8:	08f71063          	bne	a4,a5,ffffffffc0207c38 <inode_check+0x96>
ffffffffc0207bbc:	4d78                	lw	a4,92(a0)
ffffffffc0207bbe:	513c                	lw	a5,96(a0)
ffffffffc0207bc0:	04f74c63          	blt	a4,a5,ffffffffc0207c18 <inode_check+0x76>
ffffffffc0207bc4:	0407ca63          	bltz	a5,ffffffffc0207c18 <inode_check+0x76>
ffffffffc0207bc8:	66c1                	lui	a3,0x10
ffffffffc0207bca:	02d75763          	bge	a4,a3,ffffffffc0207bf8 <inode_check+0x56>
ffffffffc0207bce:	02d7d563          	bge	a5,a3,ffffffffc0207bf8 <inode_check+0x56>
ffffffffc0207bd2:	60a2                	ld	ra,8(sp)
ffffffffc0207bd4:	0141                	addi	sp,sp,16
ffffffffc0207bd6:	8082                	ret
ffffffffc0207bd8:	00007697          	auipc	a3,0x7
ffffffffc0207bdc:	fa868693          	addi	a3,a3,-88 # ffffffffc020eb80 <syscalls+0x858>
ffffffffc0207be0:	00004617          	auipc	a2,0x4
ffffffffc0207be4:	0d860613          	addi	a2,a2,216 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207be8:	06e00593          	li	a1,110
ffffffffc0207bec:	00007517          	auipc	a0,0x7
ffffffffc0207bf0:	f5c50513          	addi	a0,a0,-164 # ffffffffc020eb48 <syscalls+0x820>
ffffffffc0207bf4:	8abf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207bf8:	00007697          	auipc	a3,0x7
ffffffffc0207bfc:	00868693          	addi	a3,a3,8 # ffffffffc020ec00 <syscalls+0x8d8>
ffffffffc0207c00:	00004617          	auipc	a2,0x4
ffffffffc0207c04:	0b860613          	addi	a2,a2,184 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207c08:	07200593          	li	a1,114
ffffffffc0207c0c:	00007517          	auipc	a0,0x7
ffffffffc0207c10:	f3c50513          	addi	a0,a0,-196 # ffffffffc020eb48 <syscalls+0x820>
ffffffffc0207c14:	88bf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207c18:	00007697          	auipc	a3,0x7
ffffffffc0207c1c:	fb868693          	addi	a3,a3,-72 # ffffffffc020ebd0 <syscalls+0x8a8>
ffffffffc0207c20:	00004617          	auipc	a2,0x4
ffffffffc0207c24:	09860613          	addi	a2,a2,152 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207c28:	07100593          	li	a1,113
ffffffffc0207c2c:	00007517          	auipc	a0,0x7
ffffffffc0207c30:	f1c50513          	addi	a0,a0,-228 # ffffffffc020eb48 <syscalls+0x820>
ffffffffc0207c34:	86bf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207c38:	00007697          	auipc	a3,0x7
ffffffffc0207c3c:	f7068693          	addi	a3,a3,-144 # ffffffffc020eba8 <syscalls+0x880>
ffffffffc0207c40:	00004617          	auipc	a2,0x4
ffffffffc0207c44:	07860613          	addi	a2,a2,120 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207c48:	06f00593          	li	a1,111
ffffffffc0207c4c:	00007517          	auipc	a0,0x7
ffffffffc0207c50:	efc50513          	addi	a0,a0,-260 # ffffffffc020eb48 <syscalls+0x820>
ffffffffc0207c54:	84bf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207c58 <inode_ref_dec>:
ffffffffc0207c58:	4d7c                	lw	a5,92(a0)
ffffffffc0207c5a:	1101                	addi	sp,sp,-32
ffffffffc0207c5c:	ec06                	sd	ra,24(sp)
ffffffffc0207c5e:	e822                	sd	s0,16(sp)
ffffffffc0207c60:	e426                	sd	s1,8(sp)
ffffffffc0207c62:	e04a                	sd	s2,0(sp)
ffffffffc0207c64:	06f05e63          	blez	a5,ffffffffc0207ce0 <inode_ref_dec+0x88>
ffffffffc0207c68:	fff7849b          	addiw	s1,a5,-1
ffffffffc0207c6c:	cd64                	sw	s1,92(a0)
ffffffffc0207c6e:	842a                	mv	s0,a0
ffffffffc0207c70:	e09d                	bnez	s1,ffffffffc0207c96 <inode_ref_dec+0x3e>
ffffffffc0207c72:	793c                	ld	a5,112(a0)
ffffffffc0207c74:	c7b1                	beqz	a5,ffffffffc0207cc0 <inode_ref_dec+0x68>
ffffffffc0207c76:	0487b903          	ld	s2,72(a5)
ffffffffc0207c7a:	04090363          	beqz	s2,ffffffffc0207cc0 <inode_ref_dec+0x68>
ffffffffc0207c7e:	00007597          	auipc	a1,0x7
ffffffffc0207c82:	03258593          	addi	a1,a1,50 # ffffffffc020ecb0 <syscalls+0x988>
ffffffffc0207c86:	f1dff0ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc0207c8a:	8522                	mv	a0,s0
ffffffffc0207c8c:	9902                	jalr	s2
ffffffffc0207c8e:	c501                	beqz	a0,ffffffffc0207c96 <inode_ref_dec+0x3e>
ffffffffc0207c90:	57c5                	li	a5,-15
ffffffffc0207c92:	00f51963          	bne	a0,a5,ffffffffc0207ca4 <inode_ref_dec+0x4c>
ffffffffc0207c96:	60e2                	ld	ra,24(sp)
ffffffffc0207c98:	6442                	ld	s0,16(sp)
ffffffffc0207c9a:	6902                	ld	s2,0(sp)
ffffffffc0207c9c:	8526                	mv	a0,s1
ffffffffc0207c9e:	64a2                	ld	s1,8(sp)
ffffffffc0207ca0:	6105                	addi	sp,sp,32
ffffffffc0207ca2:	8082                	ret
ffffffffc0207ca4:	85aa                	mv	a1,a0
ffffffffc0207ca6:	00007517          	auipc	a0,0x7
ffffffffc0207caa:	01250513          	addi	a0,a0,18 # ffffffffc020ecb8 <syscalls+0x990>
ffffffffc0207cae:	cf8f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207cb2:	60e2                	ld	ra,24(sp)
ffffffffc0207cb4:	6442                	ld	s0,16(sp)
ffffffffc0207cb6:	6902                	ld	s2,0(sp)
ffffffffc0207cb8:	8526                	mv	a0,s1
ffffffffc0207cba:	64a2                	ld	s1,8(sp)
ffffffffc0207cbc:	6105                	addi	sp,sp,32
ffffffffc0207cbe:	8082                	ret
ffffffffc0207cc0:	00007697          	auipc	a3,0x7
ffffffffc0207cc4:	fa068693          	addi	a3,a3,-96 # ffffffffc020ec60 <syscalls+0x938>
ffffffffc0207cc8:	00004617          	auipc	a2,0x4
ffffffffc0207ccc:	ff060613          	addi	a2,a2,-16 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207cd0:	04400593          	li	a1,68
ffffffffc0207cd4:	00007517          	auipc	a0,0x7
ffffffffc0207cd8:	e7450513          	addi	a0,a0,-396 # ffffffffc020eb48 <syscalls+0x820>
ffffffffc0207cdc:	fc2f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207ce0:	00007697          	auipc	a3,0x7
ffffffffc0207ce4:	f6068693          	addi	a3,a3,-160 # ffffffffc020ec40 <syscalls+0x918>
ffffffffc0207ce8:	00004617          	auipc	a2,0x4
ffffffffc0207cec:	fd060613          	addi	a2,a2,-48 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207cf0:	03f00593          	li	a1,63
ffffffffc0207cf4:	00007517          	auipc	a0,0x7
ffffffffc0207cf8:	e5450513          	addi	a0,a0,-428 # ffffffffc020eb48 <syscalls+0x820>
ffffffffc0207cfc:	fa2f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207d00 <inode_open_dec>:
ffffffffc0207d00:	513c                	lw	a5,96(a0)
ffffffffc0207d02:	1101                	addi	sp,sp,-32
ffffffffc0207d04:	ec06                	sd	ra,24(sp)
ffffffffc0207d06:	e822                	sd	s0,16(sp)
ffffffffc0207d08:	e426                	sd	s1,8(sp)
ffffffffc0207d0a:	e04a                	sd	s2,0(sp)
ffffffffc0207d0c:	06f05b63          	blez	a5,ffffffffc0207d82 <inode_open_dec+0x82>
ffffffffc0207d10:	fff7849b          	addiw	s1,a5,-1
ffffffffc0207d14:	d124                	sw	s1,96(a0)
ffffffffc0207d16:	842a                	mv	s0,a0
ffffffffc0207d18:	e085                	bnez	s1,ffffffffc0207d38 <inode_open_dec+0x38>
ffffffffc0207d1a:	793c                	ld	a5,112(a0)
ffffffffc0207d1c:	c3b9                	beqz	a5,ffffffffc0207d62 <inode_open_dec+0x62>
ffffffffc0207d1e:	0107b903          	ld	s2,16(a5)
ffffffffc0207d22:	04090063          	beqz	s2,ffffffffc0207d62 <inode_open_dec+0x62>
ffffffffc0207d26:	00007597          	auipc	a1,0x7
ffffffffc0207d2a:	02258593          	addi	a1,a1,34 # ffffffffc020ed48 <syscalls+0xa20>
ffffffffc0207d2e:	e75ff0ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc0207d32:	8522                	mv	a0,s0
ffffffffc0207d34:	9902                	jalr	s2
ffffffffc0207d36:	e901                	bnez	a0,ffffffffc0207d46 <inode_open_dec+0x46>
ffffffffc0207d38:	60e2                	ld	ra,24(sp)
ffffffffc0207d3a:	6442                	ld	s0,16(sp)
ffffffffc0207d3c:	6902                	ld	s2,0(sp)
ffffffffc0207d3e:	8526                	mv	a0,s1
ffffffffc0207d40:	64a2                	ld	s1,8(sp)
ffffffffc0207d42:	6105                	addi	sp,sp,32
ffffffffc0207d44:	8082                	ret
ffffffffc0207d46:	85aa                	mv	a1,a0
ffffffffc0207d48:	00007517          	auipc	a0,0x7
ffffffffc0207d4c:	00850513          	addi	a0,a0,8 # ffffffffc020ed50 <syscalls+0xa28>
ffffffffc0207d50:	c56f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207d54:	60e2                	ld	ra,24(sp)
ffffffffc0207d56:	6442                	ld	s0,16(sp)
ffffffffc0207d58:	6902                	ld	s2,0(sp)
ffffffffc0207d5a:	8526                	mv	a0,s1
ffffffffc0207d5c:	64a2                	ld	s1,8(sp)
ffffffffc0207d5e:	6105                	addi	sp,sp,32
ffffffffc0207d60:	8082                	ret
ffffffffc0207d62:	00007697          	auipc	a3,0x7
ffffffffc0207d66:	f9668693          	addi	a3,a3,-106 # ffffffffc020ecf8 <syscalls+0x9d0>
ffffffffc0207d6a:	00004617          	auipc	a2,0x4
ffffffffc0207d6e:	f4e60613          	addi	a2,a2,-178 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207d72:	06100593          	li	a1,97
ffffffffc0207d76:	00007517          	auipc	a0,0x7
ffffffffc0207d7a:	dd250513          	addi	a0,a0,-558 # ffffffffc020eb48 <syscalls+0x820>
ffffffffc0207d7e:	f20f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207d82:	00007697          	auipc	a3,0x7
ffffffffc0207d86:	f5668693          	addi	a3,a3,-170 # ffffffffc020ecd8 <syscalls+0x9b0>
ffffffffc0207d8a:	00004617          	auipc	a2,0x4
ffffffffc0207d8e:	f2e60613          	addi	a2,a2,-210 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207d92:	05c00593          	li	a1,92
ffffffffc0207d96:	00007517          	auipc	a0,0x7
ffffffffc0207d9a:	db250513          	addi	a0,a0,-590 # ffffffffc020eb48 <syscalls+0x820>
ffffffffc0207d9e:	f00f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207da2 <__alloc_fs>:
ffffffffc0207da2:	1141                	addi	sp,sp,-16
ffffffffc0207da4:	e022                	sd	s0,0(sp)
ffffffffc0207da6:	842a                	mv	s0,a0
ffffffffc0207da8:	0d800513          	li	a0,216
ffffffffc0207dac:	e406                	sd	ra,8(sp)
ffffffffc0207dae:	9e0fa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0207db2:	c119                	beqz	a0,ffffffffc0207db8 <__alloc_fs+0x16>
ffffffffc0207db4:	0a852823          	sw	s0,176(a0)
ffffffffc0207db8:	60a2                	ld	ra,8(sp)
ffffffffc0207dba:	6402                	ld	s0,0(sp)
ffffffffc0207dbc:	0141                	addi	sp,sp,16
ffffffffc0207dbe:	8082                	ret

ffffffffc0207dc0 <vfs_init>:
ffffffffc0207dc0:	1141                	addi	sp,sp,-16
ffffffffc0207dc2:	4585                	li	a1,1
ffffffffc0207dc4:	0008e517          	auipc	a0,0x8e
ffffffffc0207dc8:	a3c50513          	addi	a0,a0,-1476 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207dcc:	e406                	sd	ra,8(sp)
ffffffffc0207dce:	f8cfc0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0207dd2:	60a2                	ld	ra,8(sp)
ffffffffc0207dd4:	0141                	addi	sp,sp,16
ffffffffc0207dd6:	a40d                	j	ffffffffc0207ff8 <vfs_devlist_init>

ffffffffc0207dd8 <vfs_set_bootfs>:
ffffffffc0207dd8:	7179                	addi	sp,sp,-48
ffffffffc0207dda:	f022                	sd	s0,32(sp)
ffffffffc0207ddc:	f406                	sd	ra,40(sp)
ffffffffc0207dde:	ec26                	sd	s1,24(sp)
ffffffffc0207de0:	e402                	sd	zero,8(sp)
ffffffffc0207de2:	842a                	mv	s0,a0
ffffffffc0207de4:	c915                	beqz	a0,ffffffffc0207e18 <vfs_set_bootfs+0x40>
ffffffffc0207de6:	03a00593          	li	a1,58
ffffffffc0207dea:	1d5030ef          	jal	ra,ffffffffc020b7be <strchr>
ffffffffc0207dee:	c135                	beqz	a0,ffffffffc0207e52 <vfs_set_bootfs+0x7a>
ffffffffc0207df0:	00154783          	lbu	a5,1(a0)
ffffffffc0207df4:	efb9                	bnez	a5,ffffffffc0207e52 <vfs_set_bootfs+0x7a>
ffffffffc0207df6:	8522                	mv	a0,s0
ffffffffc0207df8:	11f000ef          	jal	ra,ffffffffc0208716 <vfs_chdir>
ffffffffc0207dfc:	842a                	mv	s0,a0
ffffffffc0207dfe:	c519                	beqz	a0,ffffffffc0207e0c <vfs_set_bootfs+0x34>
ffffffffc0207e00:	70a2                	ld	ra,40(sp)
ffffffffc0207e02:	8522                	mv	a0,s0
ffffffffc0207e04:	7402                	ld	s0,32(sp)
ffffffffc0207e06:	64e2                	ld	s1,24(sp)
ffffffffc0207e08:	6145                	addi	sp,sp,48
ffffffffc0207e0a:	8082                	ret
ffffffffc0207e0c:	0028                	addi	a0,sp,8
ffffffffc0207e0e:	013000ef          	jal	ra,ffffffffc0208620 <vfs_get_curdir>
ffffffffc0207e12:	842a                	mv	s0,a0
ffffffffc0207e14:	f575                	bnez	a0,ffffffffc0207e00 <vfs_set_bootfs+0x28>
ffffffffc0207e16:	6422                	ld	s0,8(sp)
ffffffffc0207e18:	0008e517          	auipc	a0,0x8e
ffffffffc0207e1c:	9e850513          	addi	a0,a0,-1560 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207e20:	f44fc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207e24:	0008f797          	auipc	a5,0x8f
ffffffffc0207e28:	acc78793          	addi	a5,a5,-1332 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207e2c:	6384                	ld	s1,0(a5)
ffffffffc0207e2e:	0008e517          	auipc	a0,0x8e
ffffffffc0207e32:	9d250513          	addi	a0,a0,-1582 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207e36:	e380                	sd	s0,0(a5)
ffffffffc0207e38:	4401                	li	s0,0
ffffffffc0207e3a:	f26fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207e3e:	d0e9                	beqz	s1,ffffffffc0207e00 <vfs_set_bootfs+0x28>
ffffffffc0207e40:	8526                	mv	a0,s1
ffffffffc0207e42:	e17ff0ef          	jal	ra,ffffffffc0207c58 <inode_ref_dec>
ffffffffc0207e46:	70a2                	ld	ra,40(sp)
ffffffffc0207e48:	8522                	mv	a0,s0
ffffffffc0207e4a:	7402                	ld	s0,32(sp)
ffffffffc0207e4c:	64e2                	ld	s1,24(sp)
ffffffffc0207e4e:	6145                	addi	sp,sp,48
ffffffffc0207e50:	8082                	ret
ffffffffc0207e52:	5475                	li	s0,-3
ffffffffc0207e54:	b775                	j	ffffffffc0207e00 <vfs_set_bootfs+0x28>

ffffffffc0207e56 <vfs_get_bootfs>:
ffffffffc0207e56:	1101                	addi	sp,sp,-32
ffffffffc0207e58:	e426                	sd	s1,8(sp)
ffffffffc0207e5a:	0008f497          	auipc	s1,0x8f
ffffffffc0207e5e:	a9648493          	addi	s1,s1,-1386 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207e62:	609c                	ld	a5,0(s1)
ffffffffc0207e64:	ec06                	sd	ra,24(sp)
ffffffffc0207e66:	e822                	sd	s0,16(sp)
ffffffffc0207e68:	c3a1                	beqz	a5,ffffffffc0207ea8 <vfs_get_bootfs+0x52>
ffffffffc0207e6a:	842a                	mv	s0,a0
ffffffffc0207e6c:	0008e517          	auipc	a0,0x8e
ffffffffc0207e70:	99450513          	addi	a0,a0,-1644 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207e74:	ef0fc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207e78:	6084                	ld	s1,0(s1)
ffffffffc0207e7a:	c08d                	beqz	s1,ffffffffc0207e9c <vfs_get_bootfs+0x46>
ffffffffc0207e7c:	8526                	mv	a0,s1
ffffffffc0207e7e:	d0dff0ef          	jal	ra,ffffffffc0207b8a <inode_ref_inc>
ffffffffc0207e82:	0008e517          	auipc	a0,0x8e
ffffffffc0207e86:	97e50513          	addi	a0,a0,-1666 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207e8a:	ed6fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207e8e:	4501                	li	a0,0
ffffffffc0207e90:	e004                	sd	s1,0(s0)
ffffffffc0207e92:	60e2                	ld	ra,24(sp)
ffffffffc0207e94:	6442                	ld	s0,16(sp)
ffffffffc0207e96:	64a2                	ld	s1,8(sp)
ffffffffc0207e98:	6105                	addi	sp,sp,32
ffffffffc0207e9a:	8082                	ret
ffffffffc0207e9c:	0008e517          	auipc	a0,0x8e
ffffffffc0207ea0:	96450513          	addi	a0,a0,-1692 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207ea4:	ebcfc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207ea8:	5541                	li	a0,-16
ffffffffc0207eaa:	b7e5                	j	ffffffffc0207e92 <vfs_get_bootfs+0x3c>

ffffffffc0207eac <vfs_do_add>:
ffffffffc0207eac:	7139                	addi	sp,sp,-64
ffffffffc0207eae:	fc06                	sd	ra,56(sp)
ffffffffc0207eb0:	f822                	sd	s0,48(sp)
ffffffffc0207eb2:	f426                	sd	s1,40(sp)
ffffffffc0207eb4:	f04a                	sd	s2,32(sp)
ffffffffc0207eb6:	ec4e                	sd	s3,24(sp)
ffffffffc0207eb8:	e852                	sd	s4,16(sp)
ffffffffc0207eba:	e456                	sd	s5,8(sp)
ffffffffc0207ebc:	e05a                	sd	s6,0(sp)
ffffffffc0207ebe:	0e050b63          	beqz	a0,ffffffffc0207fb4 <vfs_do_add+0x108>
ffffffffc0207ec2:	842a                	mv	s0,a0
ffffffffc0207ec4:	8a2e                	mv	s4,a1
ffffffffc0207ec6:	8b32                	mv	s6,a2
ffffffffc0207ec8:	8ab6                	mv	s5,a3
ffffffffc0207eca:	c5cd                	beqz	a1,ffffffffc0207f74 <vfs_do_add+0xc8>
ffffffffc0207ecc:	4db8                	lw	a4,88(a1)
ffffffffc0207ece:	6785                	lui	a5,0x1
ffffffffc0207ed0:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207ed4:	0af71163          	bne	a4,a5,ffffffffc0207f76 <vfs_do_add+0xca>
ffffffffc0207ed8:	8522                	mv	a0,s0
ffffffffc0207eda:	059030ef          	jal	ra,ffffffffc020b732 <strlen>
ffffffffc0207ede:	47fd                	li	a5,31
ffffffffc0207ee0:	0ca7e663          	bltu	a5,a0,ffffffffc0207fac <vfs_do_add+0x100>
ffffffffc0207ee4:	8522                	mv	a0,s0
ffffffffc0207ee6:	b0ef80ef          	jal	ra,ffffffffc02001f4 <strdup>
ffffffffc0207eea:	84aa                	mv	s1,a0
ffffffffc0207eec:	c171                	beqz	a0,ffffffffc0207fb0 <vfs_do_add+0x104>
ffffffffc0207eee:	03000513          	li	a0,48
ffffffffc0207ef2:	89cfa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0207ef6:	89aa                	mv	s3,a0
ffffffffc0207ef8:	c92d                	beqz	a0,ffffffffc0207f6a <vfs_do_add+0xbe>
ffffffffc0207efa:	0008e517          	auipc	a0,0x8e
ffffffffc0207efe:	92e50513          	addi	a0,a0,-1746 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207f02:	0008e917          	auipc	s2,0x8e
ffffffffc0207f06:	91690913          	addi	s2,s2,-1770 # ffffffffc0295818 <vdev_list>
ffffffffc0207f0a:	e5afc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207f0e:	844a                	mv	s0,s2
ffffffffc0207f10:	a039                	j	ffffffffc0207f1e <vfs_do_add+0x72>
ffffffffc0207f12:	fe043503          	ld	a0,-32(s0)
ffffffffc0207f16:	85a6                	mv	a1,s1
ffffffffc0207f18:	063030ef          	jal	ra,ffffffffc020b77a <strcmp>
ffffffffc0207f1c:	cd2d                	beqz	a0,ffffffffc0207f96 <vfs_do_add+0xea>
ffffffffc0207f1e:	6400                	ld	s0,8(s0)
ffffffffc0207f20:	ff2419e3          	bne	s0,s2,ffffffffc0207f12 <vfs_do_add+0x66>
ffffffffc0207f24:	6418                	ld	a4,8(s0)
ffffffffc0207f26:	02098793          	addi	a5,s3,32
ffffffffc0207f2a:	0099b023          	sd	s1,0(s3)
ffffffffc0207f2e:	0149b423          	sd	s4,8(s3)
ffffffffc0207f32:	0159bc23          	sd	s5,24(s3)
ffffffffc0207f36:	0169b823          	sd	s6,16(s3)
ffffffffc0207f3a:	e31c                	sd	a5,0(a4)
ffffffffc0207f3c:	0289b023          	sd	s0,32(s3)
ffffffffc0207f40:	02e9b423          	sd	a4,40(s3)
ffffffffc0207f44:	0008e517          	auipc	a0,0x8e
ffffffffc0207f48:	8e450513          	addi	a0,a0,-1820 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207f4c:	e41c                	sd	a5,8(s0)
ffffffffc0207f4e:	4401                	li	s0,0
ffffffffc0207f50:	e10fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207f54:	70e2                	ld	ra,56(sp)
ffffffffc0207f56:	8522                	mv	a0,s0
ffffffffc0207f58:	7442                	ld	s0,48(sp)
ffffffffc0207f5a:	74a2                	ld	s1,40(sp)
ffffffffc0207f5c:	7902                	ld	s2,32(sp)
ffffffffc0207f5e:	69e2                	ld	s3,24(sp)
ffffffffc0207f60:	6a42                	ld	s4,16(sp)
ffffffffc0207f62:	6aa2                	ld	s5,8(sp)
ffffffffc0207f64:	6b02                	ld	s6,0(sp)
ffffffffc0207f66:	6121                	addi	sp,sp,64
ffffffffc0207f68:	8082                	ret
ffffffffc0207f6a:	5471                	li	s0,-4
ffffffffc0207f6c:	8526                	mv	a0,s1
ffffffffc0207f6e:	8d0fa0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0207f72:	b7cd                	j	ffffffffc0207f54 <vfs_do_add+0xa8>
ffffffffc0207f74:	d2b5                	beqz	a3,ffffffffc0207ed8 <vfs_do_add+0x2c>
ffffffffc0207f76:	00007697          	auipc	a3,0x7
ffffffffc0207f7a:	e2268693          	addi	a3,a3,-478 # ffffffffc020ed98 <syscalls+0xa70>
ffffffffc0207f7e:	00004617          	auipc	a2,0x4
ffffffffc0207f82:	d3a60613          	addi	a2,a2,-710 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207f86:	08f00593          	li	a1,143
ffffffffc0207f8a:	00007517          	auipc	a0,0x7
ffffffffc0207f8e:	df650513          	addi	a0,a0,-522 # ffffffffc020ed80 <syscalls+0xa58>
ffffffffc0207f92:	d0cf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207f96:	0008e517          	auipc	a0,0x8e
ffffffffc0207f9a:	89250513          	addi	a0,a0,-1902 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207f9e:	dc2fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207fa2:	854e                	mv	a0,s3
ffffffffc0207fa4:	89afa0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0207fa8:	5425                	li	s0,-23
ffffffffc0207faa:	b7c9                	j	ffffffffc0207f6c <vfs_do_add+0xc0>
ffffffffc0207fac:	5451                	li	s0,-12
ffffffffc0207fae:	b75d                	j	ffffffffc0207f54 <vfs_do_add+0xa8>
ffffffffc0207fb0:	5471                	li	s0,-4
ffffffffc0207fb2:	b74d                	j	ffffffffc0207f54 <vfs_do_add+0xa8>
ffffffffc0207fb4:	00007697          	auipc	a3,0x7
ffffffffc0207fb8:	dbc68693          	addi	a3,a3,-580 # ffffffffc020ed70 <syscalls+0xa48>
ffffffffc0207fbc:	00004617          	auipc	a2,0x4
ffffffffc0207fc0:	cfc60613          	addi	a2,a2,-772 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207fc4:	08e00593          	li	a1,142
ffffffffc0207fc8:	00007517          	auipc	a0,0x7
ffffffffc0207fcc:	db850513          	addi	a0,a0,-584 # ffffffffc020ed80 <syscalls+0xa58>
ffffffffc0207fd0:	ccef80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207fd4 <find_mount.part.0>:
ffffffffc0207fd4:	1141                	addi	sp,sp,-16
ffffffffc0207fd6:	00007697          	auipc	a3,0x7
ffffffffc0207fda:	d9a68693          	addi	a3,a3,-614 # ffffffffc020ed70 <syscalls+0xa48>
ffffffffc0207fde:	00004617          	auipc	a2,0x4
ffffffffc0207fe2:	cda60613          	addi	a2,a2,-806 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0207fe6:	0cd00593          	li	a1,205
ffffffffc0207fea:	00007517          	auipc	a0,0x7
ffffffffc0207fee:	d9650513          	addi	a0,a0,-618 # ffffffffc020ed80 <syscalls+0xa58>
ffffffffc0207ff2:	e406                	sd	ra,8(sp)
ffffffffc0207ff4:	caaf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207ff8 <vfs_devlist_init>:
ffffffffc0207ff8:	0008e797          	auipc	a5,0x8e
ffffffffc0207ffc:	82078793          	addi	a5,a5,-2016 # ffffffffc0295818 <vdev_list>
ffffffffc0208000:	4585                	li	a1,1
ffffffffc0208002:	0008e517          	auipc	a0,0x8e
ffffffffc0208006:	82650513          	addi	a0,a0,-2010 # ffffffffc0295828 <vdev_list_sem>
ffffffffc020800a:	e79c                	sd	a5,8(a5)
ffffffffc020800c:	e39c                	sd	a5,0(a5)
ffffffffc020800e:	d4cfc06f          	j	ffffffffc020455a <sem_init>

ffffffffc0208012 <vfs_cleanup>:
ffffffffc0208012:	1101                	addi	sp,sp,-32
ffffffffc0208014:	e426                	sd	s1,8(sp)
ffffffffc0208016:	0008e497          	auipc	s1,0x8e
ffffffffc020801a:	80248493          	addi	s1,s1,-2046 # ffffffffc0295818 <vdev_list>
ffffffffc020801e:	649c                	ld	a5,8(s1)
ffffffffc0208020:	ec06                	sd	ra,24(sp)
ffffffffc0208022:	e822                	sd	s0,16(sp)
ffffffffc0208024:	02978e63          	beq	a5,s1,ffffffffc0208060 <vfs_cleanup+0x4e>
ffffffffc0208028:	0008e517          	auipc	a0,0x8e
ffffffffc020802c:	80050513          	addi	a0,a0,-2048 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0208030:	d34fc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0208034:	6480                	ld	s0,8(s1)
ffffffffc0208036:	00940b63          	beq	s0,s1,ffffffffc020804c <vfs_cleanup+0x3a>
ffffffffc020803a:	ff043783          	ld	a5,-16(s0)
ffffffffc020803e:	853e                	mv	a0,a5
ffffffffc0208040:	c399                	beqz	a5,ffffffffc0208046 <vfs_cleanup+0x34>
ffffffffc0208042:	6bfc                	ld	a5,208(a5)
ffffffffc0208044:	9782                	jalr	a5
ffffffffc0208046:	6400                	ld	s0,8(s0)
ffffffffc0208048:	fe9419e3          	bne	s0,s1,ffffffffc020803a <vfs_cleanup+0x28>
ffffffffc020804c:	6442                	ld	s0,16(sp)
ffffffffc020804e:	60e2                	ld	ra,24(sp)
ffffffffc0208050:	64a2                	ld	s1,8(sp)
ffffffffc0208052:	0008d517          	auipc	a0,0x8d
ffffffffc0208056:	7d650513          	addi	a0,a0,2006 # ffffffffc0295828 <vdev_list_sem>
ffffffffc020805a:	6105                	addi	sp,sp,32
ffffffffc020805c:	d04fc06f          	j	ffffffffc0204560 <up>
ffffffffc0208060:	60e2                	ld	ra,24(sp)
ffffffffc0208062:	6442                	ld	s0,16(sp)
ffffffffc0208064:	64a2                	ld	s1,8(sp)
ffffffffc0208066:	6105                	addi	sp,sp,32
ffffffffc0208068:	8082                	ret

ffffffffc020806a <vfs_get_root>:
ffffffffc020806a:	7179                	addi	sp,sp,-48
ffffffffc020806c:	f406                	sd	ra,40(sp)
ffffffffc020806e:	f022                	sd	s0,32(sp)
ffffffffc0208070:	ec26                	sd	s1,24(sp)
ffffffffc0208072:	e84a                	sd	s2,16(sp)
ffffffffc0208074:	e44e                	sd	s3,8(sp)
ffffffffc0208076:	e052                	sd	s4,0(sp)
ffffffffc0208078:	c541                	beqz	a0,ffffffffc0208100 <vfs_get_root+0x96>
ffffffffc020807a:	0008d917          	auipc	s2,0x8d
ffffffffc020807e:	79e90913          	addi	s2,s2,1950 # ffffffffc0295818 <vdev_list>
ffffffffc0208082:	00893783          	ld	a5,8(s2)
ffffffffc0208086:	07278b63          	beq	a5,s2,ffffffffc02080fc <vfs_get_root+0x92>
ffffffffc020808a:	89aa                	mv	s3,a0
ffffffffc020808c:	0008d517          	auipc	a0,0x8d
ffffffffc0208090:	79c50513          	addi	a0,a0,1948 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0208094:	8a2e                	mv	s4,a1
ffffffffc0208096:	844a                	mv	s0,s2
ffffffffc0208098:	cccfc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020809c:	a801                	j	ffffffffc02080ac <vfs_get_root+0x42>
ffffffffc020809e:	fe043583          	ld	a1,-32(s0)
ffffffffc02080a2:	854e                	mv	a0,s3
ffffffffc02080a4:	6d6030ef          	jal	ra,ffffffffc020b77a <strcmp>
ffffffffc02080a8:	84aa                	mv	s1,a0
ffffffffc02080aa:	c505                	beqz	a0,ffffffffc02080d2 <vfs_get_root+0x68>
ffffffffc02080ac:	6400                	ld	s0,8(s0)
ffffffffc02080ae:	ff2418e3          	bne	s0,s2,ffffffffc020809e <vfs_get_root+0x34>
ffffffffc02080b2:	54cd                	li	s1,-13
ffffffffc02080b4:	0008d517          	auipc	a0,0x8d
ffffffffc02080b8:	77450513          	addi	a0,a0,1908 # ffffffffc0295828 <vdev_list_sem>
ffffffffc02080bc:	ca4fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02080c0:	70a2                	ld	ra,40(sp)
ffffffffc02080c2:	7402                	ld	s0,32(sp)
ffffffffc02080c4:	6942                	ld	s2,16(sp)
ffffffffc02080c6:	69a2                	ld	s3,8(sp)
ffffffffc02080c8:	6a02                	ld	s4,0(sp)
ffffffffc02080ca:	8526                	mv	a0,s1
ffffffffc02080cc:	64e2                	ld	s1,24(sp)
ffffffffc02080ce:	6145                	addi	sp,sp,48
ffffffffc02080d0:	8082                	ret
ffffffffc02080d2:	ff043503          	ld	a0,-16(s0)
ffffffffc02080d6:	c519                	beqz	a0,ffffffffc02080e4 <vfs_get_root+0x7a>
ffffffffc02080d8:	617c                	ld	a5,192(a0)
ffffffffc02080da:	9782                	jalr	a5
ffffffffc02080dc:	c519                	beqz	a0,ffffffffc02080ea <vfs_get_root+0x80>
ffffffffc02080de:	00aa3023          	sd	a0,0(s4)
ffffffffc02080e2:	bfc9                	j	ffffffffc02080b4 <vfs_get_root+0x4a>
ffffffffc02080e4:	ff843783          	ld	a5,-8(s0)
ffffffffc02080e8:	c399                	beqz	a5,ffffffffc02080ee <vfs_get_root+0x84>
ffffffffc02080ea:	54c9                	li	s1,-14
ffffffffc02080ec:	b7e1                	j	ffffffffc02080b4 <vfs_get_root+0x4a>
ffffffffc02080ee:	fe843503          	ld	a0,-24(s0)
ffffffffc02080f2:	a99ff0ef          	jal	ra,ffffffffc0207b8a <inode_ref_inc>
ffffffffc02080f6:	fe843503          	ld	a0,-24(s0)
ffffffffc02080fa:	b7cd                	j	ffffffffc02080dc <vfs_get_root+0x72>
ffffffffc02080fc:	54cd                	li	s1,-13
ffffffffc02080fe:	b7c9                	j	ffffffffc02080c0 <vfs_get_root+0x56>
ffffffffc0208100:	00007697          	auipc	a3,0x7
ffffffffc0208104:	c7068693          	addi	a3,a3,-912 # ffffffffc020ed70 <syscalls+0xa48>
ffffffffc0208108:	00004617          	auipc	a2,0x4
ffffffffc020810c:	bb060613          	addi	a2,a2,-1104 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208110:	04500593          	li	a1,69
ffffffffc0208114:	00007517          	auipc	a0,0x7
ffffffffc0208118:	c6c50513          	addi	a0,a0,-916 # ffffffffc020ed80 <syscalls+0xa58>
ffffffffc020811c:	b82f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208120 <vfs_get_devname>:
ffffffffc0208120:	0008d697          	auipc	a3,0x8d
ffffffffc0208124:	6f868693          	addi	a3,a3,1784 # ffffffffc0295818 <vdev_list>
ffffffffc0208128:	87b6                	mv	a5,a3
ffffffffc020812a:	e511                	bnez	a0,ffffffffc0208136 <vfs_get_devname+0x16>
ffffffffc020812c:	a829                	j	ffffffffc0208146 <vfs_get_devname+0x26>
ffffffffc020812e:	ff07b703          	ld	a4,-16(a5)
ffffffffc0208132:	00a70763          	beq	a4,a0,ffffffffc0208140 <vfs_get_devname+0x20>
ffffffffc0208136:	679c                	ld	a5,8(a5)
ffffffffc0208138:	fed79be3          	bne	a5,a3,ffffffffc020812e <vfs_get_devname+0xe>
ffffffffc020813c:	4501                	li	a0,0
ffffffffc020813e:	8082                	ret
ffffffffc0208140:	fe07b503          	ld	a0,-32(a5)
ffffffffc0208144:	8082                	ret
ffffffffc0208146:	1141                	addi	sp,sp,-16
ffffffffc0208148:	00007697          	auipc	a3,0x7
ffffffffc020814c:	cb068693          	addi	a3,a3,-848 # ffffffffc020edf8 <syscalls+0xad0>
ffffffffc0208150:	00004617          	auipc	a2,0x4
ffffffffc0208154:	b6860613          	addi	a2,a2,-1176 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208158:	06a00593          	li	a1,106
ffffffffc020815c:	00007517          	auipc	a0,0x7
ffffffffc0208160:	c2450513          	addi	a0,a0,-988 # ffffffffc020ed80 <syscalls+0xa58>
ffffffffc0208164:	e406                	sd	ra,8(sp)
ffffffffc0208166:	b38f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020816a <vfs_add_dev>:
ffffffffc020816a:	86b2                	mv	a3,a2
ffffffffc020816c:	4601                	li	a2,0
ffffffffc020816e:	d3fff06f          	j	ffffffffc0207eac <vfs_do_add>

ffffffffc0208172 <vfs_mount>:
ffffffffc0208172:	7179                	addi	sp,sp,-48
ffffffffc0208174:	e84a                	sd	s2,16(sp)
ffffffffc0208176:	892a                	mv	s2,a0
ffffffffc0208178:	0008d517          	auipc	a0,0x8d
ffffffffc020817c:	6b050513          	addi	a0,a0,1712 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0208180:	e44e                	sd	s3,8(sp)
ffffffffc0208182:	f406                	sd	ra,40(sp)
ffffffffc0208184:	f022                	sd	s0,32(sp)
ffffffffc0208186:	ec26                	sd	s1,24(sp)
ffffffffc0208188:	89ae                	mv	s3,a1
ffffffffc020818a:	bdafc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020818e:	08090a63          	beqz	s2,ffffffffc0208222 <vfs_mount+0xb0>
ffffffffc0208192:	0008d497          	auipc	s1,0x8d
ffffffffc0208196:	68648493          	addi	s1,s1,1670 # ffffffffc0295818 <vdev_list>
ffffffffc020819a:	6480                	ld	s0,8(s1)
ffffffffc020819c:	00941663          	bne	s0,s1,ffffffffc02081a8 <vfs_mount+0x36>
ffffffffc02081a0:	a8ad                	j	ffffffffc020821a <vfs_mount+0xa8>
ffffffffc02081a2:	6400                	ld	s0,8(s0)
ffffffffc02081a4:	06940b63          	beq	s0,s1,ffffffffc020821a <vfs_mount+0xa8>
ffffffffc02081a8:	ff843783          	ld	a5,-8(s0)
ffffffffc02081ac:	dbfd                	beqz	a5,ffffffffc02081a2 <vfs_mount+0x30>
ffffffffc02081ae:	fe043503          	ld	a0,-32(s0)
ffffffffc02081b2:	85ca                	mv	a1,s2
ffffffffc02081b4:	5c6030ef          	jal	ra,ffffffffc020b77a <strcmp>
ffffffffc02081b8:	f56d                	bnez	a0,ffffffffc02081a2 <vfs_mount+0x30>
ffffffffc02081ba:	ff043783          	ld	a5,-16(s0)
ffffffffc02081be:	e3a5                	bnez	a5,ffffffffc020821e <vfs_mount+0xac>
ffffffffc02081c0:	fe043783          	ld	a5,-32(s0)
ffffffffc02081c4:	c3c9                	beqz	a5,ffffffffc0208246 <vfs_mount+0xd4>
ffffffffc02081c6:	ff843783          	ld	a5,-8(s0)
ffffffffc02081ca:	cfb5                	beqz	a5,ffffffffc0208246 <vfs_mount+0xd4>
ffffffffc02081cc:	fe843503          	ld	a0,-24(s0)
ffffffffc02081d0:	c939                	beqz	a0,ffffffffc0208226 <vfs_mount+0xb4>
ffffffffc02081d2:	4d38                	lw	a4,88(a0)
ffffffffc02081d4:	6785                	lui	a5,0x1
ffffffffc02081d6:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02081da:	04f71663          	bne	a4,a5,ffffffffc0208226 <vfs_mount+0xb4>
ffffffffc02081de:	ff040593          	addi	a1,s0,-16
ffffffffc02081e2:	9982                	jalr	s3
ffffffffc02081e4:	84aa                	mv	s1,a0
ffffffffc02081e6:	ed01                	bnez	a0,ffffffffc02081fe <vfs_mount+0x8c>
ffffffffc02081e8:	ff043783          	ld	a5,-16(s0)
ffffffffc02081ec:	cfad                	beqz	a5,ffffffffc0208266 <vfs_mount+0xf4>
ffffffffc02081ee:	fe043583          	ld	a1,-32(s0)
ffffffffc02081f2:	00007517          	auipc	a0,0x7
ffffffffc02081f6:	c9650513          	addi	a0,a0,-874 # ffffffffc020ee88 <syscalls+0xb60>
ffffffffc02081fa:	fadf70ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02081fe:	0008d517          	auipc	a0,0x8d
ffffffffc0208202:	62a50513          	addi	a0,a0,1578 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0208206:	b5afc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020820a:	70a2                	ld	ra,40(sp)
ffffffffc020820c:	7402                	ld	s0,32(sp)
ffffffffc020820e:	6942                	ld	s2,16(sp)
ffffffffc0208210:	69a2                	ld	s3,8(sp)
ffffffffc0208212:	8526                	mv	a0,s1
ffffffffc0208214:	64e2                	ld	s1,24(sp)
ffffffffc0208216:	6145                	addi	sp,sp,48
ffffffffc0208218:	8082                	ret
ffffffffc020821a:	54cd                	li	s1,-13
ffffffffc020821c:	b7cd                	j	ffffffffc02081fe <vfs_mount+0x8c>
ffffffffc020821e:	54c5                	li	s1,-15
ffffffffc0208220:	bff9                	j	ffffffffc02081fe <vfs_mount+0x8c>
ffffffffc0208222:	db3ff0ef          	jal	ra,ffffffffc0207fd4 <find_mount.part.0>
ffffffffc0208226:	00007697          	auipc	a3,0x7
ffffffffc020822a:	c1268693          	addi	a3,a3,-1006 # ffffffffc020ee38 <syscalls+0xb10>
ffffffffc020822e:	00004617          	auipc	a2,0x4
ffffffffc0208232:	a8a60613          	addi	a2,a2,-1398 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208236:	0ed00593          	li	a1,237
ffffffffc020823a:	00007517          	auipc	a0,0x7
ffffffffc020823e:	b4650513          	addi	a0,a0,-1210 # ffffffffc020ed80 <syscalls+0xa58>
ffffffffc0208242:	a5cf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208246:	00007697          	auipc	a3,0x7
ffffffffc020824a:	bc268693          	addi	a3,a3,-1086 # ffffffffc020ee08 <syscalls+0xae0>
ffffffffc020824e:	00004617          	auipc	a2,0x4
ffffffffc0208252:	a6a60613          	addi	a2,a2,-1430 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208256:	0eb00593          	li	a1,235
ffffffffc020825a:	00007517          	auipc	a0,0x7
ffffffffc020825e:	b2650513          	addi	a0,a0,-1242 # ffffffffc020ed80 <syscalls+0xa58>
ffffffffc0208262:	a3cf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208266:	00007697          	auipc	a3,0x7
ffffffffc020826a:	c0a68693          	addi	a3,a3,-1014 # ffffffffc020ee70 <syscalls+0xb48>
ffffffffc020826e:	00004617          	auipc	a2,0x4
ffffffffc0208272:	a4a60613          	addi	a2,a2,-1462 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208276:	0ef00593          	li	a1,239
ffffffffc020827a:	00007517          	auipc	a0,0x7
ffffffffc020827e:	b0650513          	addi	a0,a0,-1274 # ffffffffc020ed80 <syscalls+0xa58>
ffffffffc0208282:	a1cf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208286 <vfs_open>:
ffffffffc0208286:	711d                	addi	sp,sp,-96
ffffffffc0208288:	e4a6                	sd	s1,72(sp)
ffffffffc020828a:	e0ca                	sd	s2,64(sp)
ffffffffc020828c:	fc4e                	sd	s3,56(sp)
ffffffffc020828e:	ec86                	sd	ra,88(sp)
ffffffffc0208290:	e8a2                	sd	s0,80(sp)
ffffffffc0208292:	f852                	sd	s4,48(sp)
ffffffffc0208294:	f456                	sd	s5,40(sp)
ffffffffc0208296:	0035f793          	andi	a5,a1,3
ffffffffc020829a:	84ae                	mv	s1,a1
ffffffffc020829c:	892a                	mv	s2,a0
ffffffffc020829e:	89b2                	mv	s3,a2
ffffffffc02082a0:	0e078663          	beqz	a5,ffffffffc020838c <vfs_open+0x106>
ffffffffc02082a4:	470d                	li	a4,3
ffffffffc02082a6:	0105fa93          	andi	s5,a1,16
ffffffffc02082aa:	0ce78f63          	beq	a5,a4,ffffffffc0208388 <vfs_open+0x102>
ffffffffc02082ae:	002c                	addi	a1,sp,8
ffffffffc02082b0:	854a                	mv	a0,s2
ffffffffc02082b2:	2ae000ef          	jal	ra,ffffffffc0208560 <vfs_lookup>
ffffffffc02082b6:	842a                	mv	s0,a0
ffffffffc02082b8:	0044fa13          	andi	s4,s1,4
ffffffffc02082bc:	e159                	bnez	a0,ffffffffc0208342 <vfs_open+0xbc>
ffffffffc02082be:	00c4f793          	andi	a5,s1,12
ffffffffc02082c2:	4731                	li	a4,12
ffffffffc02082c4:	0ee78263          	beq	a5,a4,ffffffffc02083a8 <vfs_open+0x122>
ffffffffc02082c8:	6422                	ld	s0,8(sp)
ffffffffc02082ca:	12040163          	beqz	s0,ffffffffc02083ec <vfs_open+0x166>
ffffffffc02082ce:	783c                	ld	a5,112(s0)
ffffffffc02082d0:	cff1                	beqz	a5,ffffffffc02083ac <vfs_open+0x126>
ffffffffc02082d2:	679c                	ld	a5,8(a5)
ffffffffc02082d4:	cfe1                	beqz	a5,ffffffffc02083ac <vfs_open+0x126>
ffffffffc02082d6:	8522                	mv	a0,s0
ffffffffc02082d8:	00007597          	auipc	a1,0x7
ffffffffc02082dc:	c9058593          	addi	a1,a1,-880 # ffffffffc020ef68 <syscalls+0xc40>
ffffffffc02082e0:	8c3ff0ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc02082e4:	783c                	ld	a5,112(s0)
ffffffffc02082e6:	6522                	ld	a0,8(sp)
ffffffffc02082e8:	85a6                	mv	a1,s1
ffffffffc02082ea:	679c                	ld	a5,8(a5)
ffffffffc02082ec:	9782                	jalr	a5
ffffffffc02082ee:	842a                	mv	s0,a0
ffffffffc02082f0:	6522                	ld	a0,8(sp)
ffffffffc02082f2:	e845                	bnez	s0,ffffffffc02083a2 <vfs_open+0x11c>
ffffffffc02082f4:	015a6a33          	or	s4,s4,s5
ffffffffc02082f8:	89fff0ef          	jal	ra,ffffffffc0207b96 <inode_open_inc>
ffffffffc02082fc:	020a0663          	beqz	s4,ffffffffc0208328 <vfs_open+0xa2>
ffffffffc0208300:	64a2                	ld	s1,8(sp)
ffffffffc0208302:	c4e9                	beqz	s1,ffffffffc02083cc <vfs_open+0x146>
ffffffffc0208304:	78bc                	ld	a5,112(s1)
ffffffffc0208306:	c3f9                	beqz	a5,ffffffffc02083cc <vfs_open+0x146>
ffffffffc0208308:	73bc                	ld	a5,96(a5)
ffffffffc020830a:	c3e9                	beqz	a5,ffffffffc02083cc <vfs_open+0x146>
ffffffffc020830c:	00007597          	auipc	a1,0x7
ffffffffc0208310:	cbc58593          	addi	a1,a1,-836 # ffffffffc020efc8 <syscalls+0xca0>
ffffffffc0208314:	8526                	mv	a0,s1
ffffffffc0208316:	88dff0ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc020831a:	78bc                	ld	a5,112(s1)
ffffffffc020831c:	6522                	ld	a0,8(sp)
ffffffffc020831e:	4581                	li	a1,0
ffffffffc0208320:	73bc                	ld	a5,96(a5)
ffffffffc0208322:	9782                	jalr	a5
ffffffffc0208324:	87aa                	mv	a5,a0
ffffffffc0208326:	e92d                	bnez	a0,ffffffffc0208398 <vfs_open+0x112>
ffffffffc0208328:	67a2                	ld	a5,8(sp)
ffffffffc020832a:	00f9b023          	sd	a5,0(s3)
ffffffffc020832e:	60e6                	ld	ra,88(sp)
ffffffffc0208330:	8522                	mv	a0,s0
ffffffffc0208332:	6446                	ld	s0,80(sp)
ffffffffc0208334:	64a6                	ld	s1,72(sp)
ffffffffc0208336:	6906                	ld	s2,64(sp)
ffffffffc0208338:	79e2                	ld	s3,56(sp)
ffffffffc020833a:	7a42                	ld	s4,48(sp)
ffffffffc020833c:	7aa2                	ld	s5,40(sp)
ffffffffc020833e:	6125                	addi	sp,sp,96
ffffffffc0208340:	8082                	ret
ffffffffc0208342:	57c1                	li	a5,-16
ffffffffc0208344:	fef515e3          	bne	a0,a5,ffffffffc020832e <vfs_open+0xa8>
ffffffffc0208348:	fe0a03e3          	beqz	s4,ffffffffc020832e <vfs_open+0xa8>
ffffffffc020834c:	0810                	addi	a2,sp,16
ffffffffc020834e:	082c                	addi	a1,sp,24
ffffffffc0208350:	854a                	mv	a0,s2
ffffffffc0208352:	2a4000ef          	jal	ra,ffffffffc02085f6 <vfs_lookup_parent>
ffffffffc0208356:	842a                	mv	s0,a0
ffffffffc0208358:	f979                	bnez	a0,ffffffffc020832e <vfs_open+0xa8>
ffffffffc020835a:	6462                	ld	s0,24(sp)
ffffffffc020835c:	c845                	beqz	s0,ffffffffc020840c <vfs_open+0x186>
ffffffffc020835e:	783c                	ld	a5,112(s0)
ffffffffc0208360:	c7d5                	beqz	a5,ffffffffc020840c <vfs_open+0x186>
ffffffffc0208362:	77bc                	ld	a5,104(a5)
ffffffffc0208364:	c7c5                	beqz	a5,ffffffffc020840c <vfs_open+0x186>
ffffffffc0208366:	8522                	mv	a0,s0
ffffffffc0208368:	00007597          	auipc	a1,0x7
ffffffffc020836c:	b9858593          	addi	a1,a1,-1128 # ffffffffc020ef00 <syscalls+0xbd8>
ffffffffc0208370:	833ff0ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc0208374:	783c                	ld	a5,112(s0)
ffffffffc0208376:	65c2                	ld	a1,16(sp)
ffffffffc0208378:	6562                	ld	a0,24(sp)
ffffffffc020837a:	77bc                	ld	a5,104(a5)
ffffffffc020837c:	4034d613          	srai	a2,s1,0x3
ffffffffc0208380:	0034                	addi	a3,sp,8
ffffffffc0208382:	8a05                	andi	a2,a2,1
ffffffffc0208384:	9782                	jalr	a5
ffffffffc0208386:	b789                	j	ffffffffc02082c8 <vfs_open+0x42>
ffffffffc0208388:	5475                	li	s0,-3
ffffffffc020838a:	b755                	j	ffffffffc020832e <vfs_open+0xa8>
ffffffffc020838c:	0105fa93          	andi	s5,a1,16
ffffffffc0208390:	5475                	li	s0,-3
ffffffffc0208392:	f80a9ee3          	bnez	s5,ffffffffc020832e <vfs_open+0xa8>
ffffffffc0208396:	bf21                	j	ffffffffc02082ae <vfs_open+0x28>
ffffffffc0208398:	6522                	ld	a0,8(sp)
ffffffffc020839a:	843e                	mv	s0,a5
ffffffffc020839c:	965ff0ef          	jal	ra,ffffffffc0207d00 <inode_open_dec>
ffffffffc02083a0:	6522                	ld	a0,8(sp)
ffffffffc02083a2:	8b7ff0ef          	jal	ra,ffffffffc0207c58 <inode_ref_dec>
ffffffffc02083a6:	b761                	j	ffffffffc020832e <vfs_open+0xa8>
ffffffffc02083a8:	5425                	li	s0,-23
ffffffffc02083aa:	b751                	j	ffffffffc020832e <vfs_open+0xa8>
ffffffffc02083ac:	00007697          	auipc	a3,0x7
ffffffffc02083b0:	b6c68693          	addi	a3,a3,-1172 # ffffffffc020ef18 <syscalls+0xbf0>
ffffffffc02083b4:	00004617          	auipc	a2,0x4
ffffffffc02083b8:	90460613          	addi	a2,a2,-1788 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02083bc:	03300593          	li	a1,51
ffffffffc02083c0:	00007517          	auipc	a0,0x7
ffffffffc02083c4:	b2850513          	addi	a0,a0,-1240 # ffffffffc020eee8 <syscalls+0xbc0>
ffffffffc02083c8:	8d6f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02083cc:	00007697          	auipc	a3,0x7
ffffffffc02083d0:	ba468693          	addi	a3,a3,-1116 # ffffffffc020ef70 <syscalls+0xc48>
ffffffffc02083d4:	00004617          	auipc	a2,0x4
ffffffffc02083d8:	8e460613          	addi	a2,a2,-1820 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02083dc:	03a00593          	li	a1,58
ffffffffc02083e0:	00007517          	auipc	a0,0x7
ffffffffc02083e4:	b0850513          	addi	a0,a0,-1272 # ffffffffc020eee8 <syscalls+0xbc0>
ffffffffc02083e8:	8b6f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02083ec:	00007697          	auipc	a3,0x7
ffffffffc02083f0:	b1c68693          	addi	a3,a3,-1252 # ffffffffc020ef08 <syscalls+0xbe0>
ffffffffc02083f4:	00004617          	auipc	a2,0x4
ffffffffc02083f8:	8c460613          	addi	a2,a2,-1852 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02083fc:	03100593          	li	a1,49
ffffffffc0208400:	00007517          	auipc	a0,0x7
ffffffffc0208404:	ae850513          	addi	a0,a0,-1304 # ffffffffc020eee8 <syscalls+0xbc0>
ffffffffc0208408:	896f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020840c:	00007697          	auipc	a3,0x7
ffffffffc0208410:	a8c68693          	addi	a3,a3,-1396 # ffffffffc020ee98 <syscalls+0xb70>
ffffffffc0208414:	00004617          	auipc	a2,0x4
ffffffffc0208418:	8a460613          	addi	a2,a2,-1884 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020841c:	02c00593          	li	a1,44
ffffffffc0208420:	00007517          	auipc	a0,0x7
ffffffffc0208424:	ac850513          	addi	a0,a0,-1336 # ffffffffc020eee8 <syscalls+0xbc0>
ffffffffc0208428:	876f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020842c <vfs_close>:
ffffffffc020842c:	1141                	addi	sp,sp,-16
ffffffffc020842e:	e406                	sd	ra,8(sp)
ffffffffc0208430:	e022                	sd	s0,0(sp)
ffffffffc0208432:	842a                	mv	s0,a0
ffffffffc0208434:	8cdff0ef          	jal	ra,ffffffffc0207d00 <inode_open_dec>
ffffffffc0208438:	8522                	mv	a0,s0
ffffffffc020843a:	81fff0ef          	jal	ra,ffffffffc0207c58 <inode_ref_dec>
ffffffffc020843e:	60a2                	ld	ra,8(sp)
ffffffffc0208440:	6402                	ld	s0,0(sp)
ffffffffc0208442:	4501                	li	a0,0
ffffffffc0208444:	0141                	addi	sp,sp,16
ffffffffc0208446:	8082                	ret

ffffffffc0208448 <get_device>:
ffffffffc0208448:	7179                	addi	sp,sp,-48
ffffffffc020844a:	ec26                	sd	s1,24(sp)
ffffffffc020844c:	e84a                	sd	s2,16(sp)
ffffffffc020844e:	f406                	sd	ra,40(sp)
ffffffffc0208450:	f022                	sd	s0,32(sp)
ffffffffc0208452:	00054303          	lbu	t1,0(a0)
ffffffffc0208456:	892e                	mv	s2,a1
ffffffffc0208458:	84b2                	mv	s1,a2
ffffffffc020845a:	02030463          	beqz	t1,ffffffffc0208482 <get_device+0x3a>
ffffffffc020845e:	00150413          	addi	s0,a0,1
ffffffffc0208462:	86a2                	mv	a3,s0
ffffffffc0208464:	879a                	mv	a5,t1
ffffffffc0208466:	4701                	li	a4,0
ffffffffc0208468:	03a00813          	li	a6,58
ffffffffc020846c:	02f00893          	li	a7,47
ffffffffc0208470:	03078263          	beq	a5,a6,ffffffffc0208494 <get_device+0x4c>
ffffffffc0208474:	05178963          	beq	a5,a7,ffffffffc02084c6 <get_device+0x7e>
ffffffffc0208478:	0006c783          	lbu	a5,0(a3)
ffffffffc020847c:	2705                	addiw	a4,a4,1
ffffffffc020847e:	0685                	addi	a3,a3,1
ffffffffc0208480:	fbe5                	bnez	a5,ffffffffc0208470 <get_device+0x28>
ffffffffc0208482:	7402                	ld	s0,32(sp)
ffffffffc0208484:	00a93023          	sd	a0,0(s2)
ffffffffc0208488:	70a2                	ld	ra,40(sp)
ffffffffc020848a:	6942                	ld	s2,16(sp)
ffffffffc020848c:	8526                	mv	a0,s1
ffffffffc020848e:	64e2                	ld	s1,24(sp)
ffffffffc0208490:	6145                	addi	sp,sp,48
ffffffffc0208492:	a279                	j	ffffffffc0208620 <vfs_get_curdir>
ffffffffc0208494:	cb15                	beqz	a4,ffffffffc02084c8 <get_device+0x80>
ffffffffc0208496:	00e507b3          	add	a5,a0,a4
ffffffffc020849a:	0705                	addi	a4,a4,1
ffffffffc020849c:	00078023          	sb	zero,0(a5)
ffffffffc02084a0:	972a                	add	a4,a4,a0
ffffffffc02084a2:	02f00613          	li	a2,47
ffffffffc02084a6:	00074783          	lbu	a5,0(a4)
ffffffffc02084aa:	86ba                	mv	a3,a4
ffffffffc02084ac:	0705                	addi	a4,a4,1
ffffffffc02084ae:	fec78ce3          	beq	a5,a2,ffffffffc02084a6 <get_device+0x5e>
ffffffffc02084b2:	7402                	ld	s0,32(sp)
ffffffffc02084b4:	70a2                	ld	ra,40(sp)
ffffffffc02084b6:	00d93023          	sd	a3,0(s2)
ffffffffc02084ba:	85a6                	mv	a1,s1
ffffffffc02084bc:	6942                	ld	s2,16(sp)
ffffffffc02084be:	64e2                	ld	s1,24(sp)
ffffffffc02084c0:	6145                	addi	sp,sp,48
ffffffffc02084c2:	ba9ff06f          	j	ffffffffc020806a <vfs_get_root>
ffffffffc02084c6:	ff55                	bnez	a4,ffffffffc0208482 <get_device+0x3a>
ffffffffc02084c8:	02f00793          	li	a5,47
ffffffffc02084cc:	04f30563          	beq	t1,a5,ffffffffc0208516 <get_device+0xce>
ffffffffc02084d0:	03a00793          	li	a5,58
ffffffffc02084d4:	06f31663          	bne	t1,a5,ffffffffc0208540 <get_device+0xf8>
ffffffffc02084d8:	0028                	addi	a0,sp,8
ffffffffc02084da:	146000ef          	jal	ra,ffffffffc0208620 <vfs_get_curdir>
ffffffffc02084de:	e515                	bnez	a0,ffffffffc020850a <get_device+0xc2>
ffffffffc02084e0:	67a2                	ld	a5,8(sp)
ffffffffc02084e2:	77a8                	ld	a0,104(a5)
ffffffffc02084e4:	cd15                	beqz	a0,ffffffffc0208520 <get_device+0xd8>
ffffffffc02084e6:	617c                	ld	a5,192(a0)
ffffffffc02084e8:	9782                	jalr	a5
ffffffffc02084ea:	87aa                	mv	a5,a0
ffffffffc02084ec:	6522                	ld	a0,8(sp)
ffffffffc02084ee:	e09c                	sd	a5,0(s1)
ffffffffc02084f0:	f68ff0ef          	jal	ra,ffffffffc0207c58 <inode_ref_dec>
ffffffffc02084f4:	02f00713          	li	a4,47
ffffffffc02084f8:	a011                	j	ffffffffc02084fc <get_device+0xb4>
ffffffffc02084fa:	0405                	addi	s0,s0,1
ffffffffc02084fc:	00044783          	lbu	a5,0(s0)
ffffffffc0208500:	fee78de3          	beq	a5,a4,ffffffffc02084fa <get_device+0xb2>
ffffffffc0208504:	00893023          	sd	s0,0(s2)
ffffffffc0208508:	4501                	li	a0,0
ffffffffc020850a:	70a2                	ld	ra,40(sp)
ffffffffc020850c:	7402                	ld	s0,32(sp)
ffffffffc020850e:	64e2                	ld	s1,24(sp)
ffffffffc0208510:	6942                	ld	s2,16(sp)
ffffffffc0208512:	6145                	addi	sp,sp,48
ffffffffc0208514:	8082                	ret
ffffffffc0208516:	8526                	mv	a0,s1
ffffffffc0208518:	93fff0ef          	jal	ra,ffffffffc0207e56 <vfs_get_bootfs>
ffffffffc020851c:	dd61                	beqz	a0,ffffffffc02084f4 <get_device+0xac>
ffffffffc020851e:	b7f5                	j	ffffffffc020850a <get_device+0xc2>
ffffffffc0208520:	00007697          	auipc	a3,0x7
ffffffffc0208524:	ae068693          	addi	a3,a3,-1312 # ffffffffc020f000 <syscalls+0xcd8>
ffffffffc0208528:	00003617          	auipc	a2,0x3
ffffffffc020852c:	79060613          	addi	a2,a2,1936 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208530:	03900593          	li	a1,57
ffffffffc0208534:	00007517          	auipc	a0,0x7
ffffffffc0208538:	ab450513          	addi	a0,a0,-1356 # ffffffffc020efe8 <syscalls+0xcc0>
ffffffffc020853c:	f63f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208540:	00007697          	auipc	a3,0x7
ffffffffc0208544:	a9868693          	addi	a3,a3,-1384 # ffffffffc020efd8 <syscalls+0xcb0>
ffffffffc0208548:	00003617          	auipc	a2,0x3
ffffffffc020854c:	77060613          	addi	a2,a2,1904 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208550:	03300593          	li	a1,51
ffffffffc0208554:	00007517          	auipc	a0,0x7
ffffffffc0208558:	a9450513          	addi	a0,a0,-1388 # ffffffffc020efe8 <syscalls+0xcc0>
ffffffffc020855c:	f43f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208560 <vfs_lookup>:
ffffffffc0208560:	7139                	addi	sp,sp,-64
ffffffffc0208562:	f426                	sd	s1,40(sp)
ffffffffc0208564:	0830                	addi	a2,sp,24
ffffffffc0208566:	84ae                	mv	s1,a1
ffffffffc0208568:	002c                	addi	a1,sp,8
ffffffffc020856a:	f822                	sd	s0,48(sp)
ffffffffc020856c:	fc06                	sd	ra,56(sp)
ffffffffc020856e:	f04a                	sd	s2,32(sp)
ffffffffc0208570:	e42a                	sd	a0,8(sp)
ffffffffc0208572:	ed7ff0ef          	jal	ra,ffffffffc0208448 <get_device>
ffffffffc0208576:	842a                	mv	s0,a0
ffffffffc0208578:	ed1d                	bnez	a0,ffffffffc02085b6 <vfs_lookup+0x56>
ffffffffc020857a:	67a2                	ld	a5,8(sp)
ffffffffc020857c:	6962                	ld	s2,24(sp)
ffffffffc020857e:	0007c783          	lbu	a5,0(a5)
ffffffffc0208582:	c3a9                	beqz	a5,ffffffffc02085c4 <vfs_lookup+0x64>
ffffffffc0208584:	04090963          	beqz	s2,ffffffffc02085d6 <vfs_lookup+0x76>
ffffffffc0208588:	07093783          	ld	a5,112(s2)
ffffffffc020858c:	c7a9                	beqz	a5,ffffffffc02085d6 <vfs_lookup+0x76>
ffffffffc020858e:	7bbc                	ld	a5,112(a5)
ffffffffc0208590:	c3b9                	beqz	a5,ffffffffc02085d6 <vfs_lookup+0x76>
ffffffffc0208592:	854a                	mv	a0,s2
ffffffffc0208594:	00007597          	auipc	a1,0x7
ffffffffc0208598:	ad458593          	addi	a1,a1,-1324 # ffffffffc020f068 <syscalls+0xd40>
ffffffffc020859c:	e06ff0ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc02085a0:	07093783          	ld	a5,112(s2)
ffffffffc02085a4:	65a2                	ld	a1,8(sp)
ffffffffc02085a6:	6562                	ld	a0,24(sp)
ffffffffc02085a8:	7bbc                	ld	a5,112(a5)
ffffffffc02085aa:	8626                	mv	a2,s1
ffffffffc02085ac:	9782                	jalr	a5
ffffffffc02085ae:	842a                	mv	s0,a0
ffffffffc02085b0:	6562                	ld	a0,24(sp)
ffffffffc02085b2:	ea6ff0ef          	jal	ra,ffffffffc0207c58 <inode_ref_dec>
ffffffffc02085b6:	70e2                	ld	ra,56(sp)
ffffffffc02085b8:	8522                	mv	a0,s0
ffffffffc02085ba:	7442                	ld	s0,48(sp)
ffffffffc02085bc:	74a2                	ld	s1,40(sp)
ffffffffc02085be:	7902                	ld	s2,32(sp)
ffffffffc02085c0:	6121                	addi	sp,sp,64
ffffffffc02085c2:	8082                	ret
ffffffffc02085c4:	70e2                	ld	ra,56(sp)
ffffffffc02085c6:	8522                	mv	a0,s0
ffffffffc02085c8:	7442                	ld	s0,48(sp)
ffffffffc02085ca:	0124b023          	sd	s2,0(s1)
ffffffffc02085ce:	74a2                	ld	s1,40(sp)
ffffffffc02085d0:	7902                	ld	s2,32(sp)
ffffffffc02085d2:	6121                	addi	sp,sp,64
ffffffffc02085d4:	8082                	ret
ffffffffc02085d6:	00007697          	auipc	a3,0x7
ffffffffc02085da:	a4268693          	addi	a3,a3,-1470 # ffffffffc020f018 <syscalls+0xcf0>
ffffffffc02085de:	00003617          	auipc	a2,0x3
ffffffffc02085e2:	6da60613          	addi	a2,a2,1754 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02085e6:	04f00593          	li	a1,79
ffffffffc02085ea:	00007517          	auipc	a0,0x7
ffffffffc02085ee:	9fe50513          	addi	a0,a0,-1538 # ffffffffc020efe8 <syscalls+0xcc0>
ffffffffc02085f2:	eadf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02085f6 <vfs_lookup_parent>:
ffffffffc02085f6:	7139                	addi	sp,sp,-64
ffffffffc02085f8:	f822                	sd	s0,48(sp)
ffffffffc02085fa:	f426                	sd	s1,40(sp)
ffffffffc02085fc:	842e                	mv	s0,a1
ffffffffc02085fe:	84b2                	mv	s1,a2
ffffffffc0208600:	002c                	addi	a1,sp,8
ffffffffc0208602:	0830                	addi	a2,sp,24
ffffffffc0208604:	fc06                	sd	ra,56(sp)
ffffffffc0208606:	e42a                	sd	a0,8(sp)
ffffffffc0208608:	e41ff0ef          	jal	ra,ffffffffc0208448 <get_device>
ffffffffc020860c:	e509                	bnez	a0,ffffffffc0208616 <vfs_lookup_parent+0x20>
ffffffffc020860e:	67a2                	ld	a5,8(sp)
ffffffffc0208610:	e09c                	sd	a5,0(s1)
ffffffffc0208612:	67e2                	ld	a5,24(sp)
ffffffffc0208614:	e01c                	sd	a5,0(s0)
ffffffffc0208616:	70e2                	ld	ra,56(sp)
ffffffffc0208618:	7442                	ld	s0,48(sp)
ffffffffc020861a:	74a2                	ld	s1,40(sp)
ffffffffc020861c:	6121                	addi	sp,sp,64
ffffffffc020861e:	8082                	ret

ffffffffc0208620 <vfs_get_curdir>:
ffffffffc0208620:	0008e797          	auipc	a5,0x8e
ffffffffc0208624:	2a07b783          	ld	a5,672(a5) # ffffffffc02968c0 <current>
ffffffffc0208628:	1487b783          	ld	a5,328(a5)
ffffffffc020862c:	1101                	addi	sp,sp,-32
ffffffffc020862e:	e426                	sd	s1,8(sp)
ffffffffc0208630:	6384                	ld	s1,0(a5)
ffffffffc0208632:	ec06                	sd	ra,24(sp)
ffffffffc0208634:	e822                	sd	s0,16(sp)
ffffffffc0208636:	cc81                	beqz	s1,ffffffffc020864e <vfs_get_curdir+0x2e>
ffffffffc0208638:	842a                	mv	s0,a0
ffffffffc020863a:	8526                	mv	a0,s1
ffffffffc020863c:	d4eff0ef          	jal	ra,ffffffffc0207b8a <inode_ref_inc>
ffffffffc0208640:	4501                	li	a0,0
ffffffffc0208642:	e004                	sd	s1,0(s0)
ffffffffc0208644:	60e2                	ld	ra,24(sp)
ffffffffc0208646:	6442                	ld	s0,16(sp)
ffffffffc0208648:	64a2                	ld	s1,8(sp)
ffffffffc020864a:	6105                	addi	sp,sp,32
ffffffffc020864c:	8082                	ret
ffffffffc020864e:	5541                	li	a0,-16
ffffffffc0208650:	bfd5                	j	ffffffffc0208644 <vfs_get_curdir+0x24>

ffffffffc0208652 <vfs_set_curdir>:
ffffffffc0208652:	7139                	addi	sp,sp,-64
ffffffffc0208654:	f04a                	sd	s2,32(sp)
ffffffffc0208656:	0008e917          	auipc	s2,0x8e
ffffffffc020865a:	26a90913          	addi	s2,s2,618 # ffffffffc02968c0 <current>
ffffffffc020865e:	00093783          	ld	a5,0(s2)
ffffffffc0208662:	f822                	sd	s0,48(sp)
ffffffffc0208664:	842a                	mv	s0,a0
ffffffffc0208666:	1487b503          	ld	a0,328(a5)
ffffffffc020866a:	ec4e                	sd	s3,24(sp)
ffffffffc020866c:	fc06                	sd	ra,56(sp)
ffffffffc020866e:	f426                	sd	s1,40(sp)
ffffffffc0208670:	b53fc0ef          	jal	ra,ffffffffc02051c2 <lock_files>
ffffffffc0208674:	00093783          	ld	a5,0(s2)
ffffffffc0208678:	1487b503          	ld	a0,328(a5)
ffffffffc020867c:	00053983          	ld	s3,0(a0)
ffffffffc0208680:	07340963          	beq	s0,s3,ffffffffc02086f2 <vfs_set_curdir+0xa0>
ffffffffc0208684:	cc39                	beqz	s0,ffffffffc02086e2 <vfs_set_curdir+0x90>
ffffffffc0208686:	783c                	ld	a5,112(s0)
ffffffffc0208688:	c7bd                	beqz	a5,ffffffffc02086f6 <vfs_set_curdir+0xa4>
ffffffffc020868a:	6bbc                	ld	a5,80(a5)
ffffffffc020868c:	c7ad                	beqz	a5,ffffffffc02086f6 <vfs_set_curdir+0xa4>
ffffffffc020868e:	00007597          	auipc	a1,0x7
ffffffffc0208692:	a4a58593          	addi	a1,a1,-1462 # ffffffffc020f0d8 <syscalls+0xdb0>
ffffffffc0208696:	8522                	mv	a0,s0
ffffffffc0208698:	d0aff0ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc020869c:	783c                	ld	a5,112(s0)
ffffffffc020869e:	006c                	addi	a1,sp,12
ffffffffc02086a0:	8522                	mv	a0,s0
ffffffffc02086a2:	6bbc                	ld	a5,80(a5)
ffffffffc02086a4:	9782                	jalr	a5
ffffffffc02086a6:	84aa                	mv	s1,a0
ffffffffc02086a8:	e901                	bnez	a0,ffffffffc02086b8 <vfs_set_curdir+0x66>
ffffffffc02086aa:	47b2                	lw	a5,12(sp)
ffffffffc02086ac:	669d                	lui	a3,0x7
ffffffffc02086ae:	6709                	lui	a4,0x2
ffffffffc02086b0:	8ff5                	and	a5,a5,a3
ffffffffc02086b2:	54b9                	li	s1,-18
ffffffffc02086b4:	02e78063          	beq	a5,a4,ffffffffc02086d4 <vfs_set_curdir+0x82>
ffffffffc02086b8:	00093783          	ld	a5,0(s2)
ffffffffc02086bc:	1487b503          	ld	a0,328(a5)
ffffffffc02086c0:	b09fc0ef          	jal	ra,ffffffffc02051c8 <unlock_files>
ffffffffc02086c4:	70e2                	ld	ra,56(sp)
ffffffffc02086c6:	7442                	ld	s0,48(sp)
ffffffffc02086c8:	7902                	ld	s2,32(sp)
ffffffffc02086ca:	69e2                	ld	s3,24(sp)
ffffffffc02086cc:	8526                	mv	a0,s1
ffffffffc02086ce:	74a2                	ld	s1,40(sp)
ffffffffc02086d0:	6121                	addi	sp,sp,64
ffffffffc02086d2:	8082                	ret
ffffffffc02086d4:	8522                	mv	a0,s0
ffffffffc02086d6:	cb4ff0ef          	jal	ra,ffffffffc0207b8a <inode_ref_inc>
ffffffffc02086da:	00093783          	ld	a5,0(s2)
ffffffffc02086de:	1487b503          	ld	a0,328(a5)
ffffffffc02086e2:	e100                	sd	s0,0(a0)
ffffffffc02086e4:	4481                	li	s1,0
ffffffffc02086e6:	fc098de3          	beqz	s3,ffffffffc02086c0 <vfs_set_curdir+0x6e>
ffffffffc02086ea:	854e                	mv	a0,s3
ffffffffc02086ec:	d6cff0ef          	jal	ra,ffffffffc0207c58 <inode_ref_dec>
ffffffffc02086f0:	b7e1                	j	ffffffffc02086b8 <vfs_set_curdir+0x66>
ffffffffc02086f2:	4481                	li	s1,0
ffffffffc02086f4:	b7f1                	j	ffffffffc02086c0 <vfs_set_curdir+0x6e>
ffffffffc02086f6:	00007697          	auipc	a3,0x7
ffffffffc02086fa:	97a68693          	addi	a3,a3,-1670 # ffffffffc020f070 <syscalls+0xd48>
ffffffffc02086fe:	00003617          	auipc	a2,0x3
ffffffffc0208702:	5ba60613          	addi	a2,a2,1466 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208706:	04300593          	li	a1,67
ffffffffc020870a:	00007517          	auipc	a0,0x7
ffffffffc020870e:	9b650513          	addi	a0,a0,-1610 # ffffffffc020f0c0 <syscalls+0xd98>
ffffffffc0208712:	d8df70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208716 <vfs_chdir>:
ffffffffc0208716:	1101                	addi	sp,sp,-32
ffffffffc0208718:	002c                	addi	a1,sp,8
ffffffffc020871a:	e822                	sd	s0,16(sp)
ffffffffc020871c:	ec06                	sd	ra,24(sp)
ffffffffc020871e:	e43ff0ef          	jal	ra,ffffffffc0208560 <vfs_lookup>
ffffffffc0208722:	842a                	mv	s0,a0
ffffffffc0208724:	c511                	beqz	a0,ffffffffc0208730 <vfs_chdir+0x1a>
ffffffffc0208726:	60e2                	ld	ra,24(sp)
ffffffffc0208728:	8522                	mv	a0,s0
ffffffffc020872a:	6442                	ld	s0,16(sp)
ffffffffc020872c:	6105                	addi	sp,sp,32
ffffffffc020872e:	8082                	ret
ffffffffc0208730:	6522                	ld	a0,8(sp)
ffffffffc0208732:	f21ff0ef          	jal	ra,ffffffffc0208652 <vfs_set_curdir>
ffffffffc0208736:	842a                	mv	s0,a0
ffffffffc0208738:	6522                	ld	a0,8(sp)
ffffffffc020873a:	d1eff0ef          	jal	ra,ffffffffc0207c58 <inode_ref_dec>
ffffffffc020873e:	60e2                	ld	ra,24(sp)
ffffffffc0208740:	8522                	mv	a0,s0
ffffffffc0208742:	6442                	ld	s0,16(sp)
ffffffffc0208744:	6105                	addi	sp,sp,32
ffffffffc0208746:	8082                	ret

ffffffffc0208748 <vfs_getcwd>:
ffffffffc0208748:	0008e797          	auipc	a5,0x8e
ffffffffc020874c:	1787b783          	ld	a5,376(a5) # ffffffffc02968c0 <current>
ffffffffc0208750:	1487b783          	ld	a5,328(a5)
ffffffffc0208754:	7179                	addi	sp,sp,-48
ffffffffc0208756:	ec26                	sd	s1,24(sp)
ffffffffc0208758:	6384                	ld	s1,0(a5)
ffffffffc020875a:	f406                	sd	ra,40(sp)
ffffffffc020875c:	f022                	sd	s0,32(sp)
ffffffffc020875e:	e84a                	sd	s2,16(sp)
ffffffffc0208760:	ccbd                	beqz	s1,ffffffffc02087de <vfs_getcwd+0x96>
ffffffffc0208762:	892a                	mv	s2,a0
ffffffffc0208764:	8526                	mv	a0,s1
ffffffffc0208766:	c24ff0ef          	jal	ra,ffffffffc0207b8a <inode_ref_inc>
ffffffffc020876a:	74a8                	ld	a0,104(s1)
ffffffffc020876c:	c93d                	beqz	a0,ffffffffc02087e2 <vfs_getcwd+0x9a>
ffffffffc020876e:	9b3ff0ef          	jal	ra,ffffffffc0208120 <vfs_get_devname>
ffffffffc0208772:	842a                	mv	s0,a0
ffffffffc0208774:	7bf020ef          	jal	ra,ffffffffc020b732 <strlen>
ffffffffc0208778:	862a                	mv	a2,a0
ffffffffc020877a:	85a2                	mv	a1,s0
ffffffffc020877c:	4701                	li	a4,0
ffffffffc020877e:	4685                	li	a3,1
ffffffffc0208780:	854a                	mv	a0,s2
ffffffffc0208782:	bfffc0ef          	jal	ra,ffffffffc0205380 <iobuf_move>
ffffffffc0208786:	842a                	mv	s0,a0
ffffffffc0208788:	c919                	beqz	a0,ffffffffc020879e <vfs_getcwd+0x56>
ffffffffc020878a:	8526                	mv	a0,s1
ffffffffc020878c:	cccff0ef          	jal	ra,ffffffffc0207c58 <inode_ref_dec>
ffffffffc0208790:	70a2                	ld	ra,40(sp)
ffffffffc0208792:	8522                	mv	a0,s0
ffffffffc0208794:	7402                	ld	s0,32(sp)
ffffffffc0208796:	64e2                	ld	s1,24(sp)
ffffffffc0208798:	6942                	ld	s2,16(sp)
ffffffffc020879a:	6145                	addi	sp,sp,48
ffffffffc020879c:	8082                	ret
ffffffffc020879e:	03a00793          	li	a5,58
ffffffffc02087a2:	4701                	li	a4,0
ffffffffc02087a4:	4685                	li	a3,1
ffffffffc02087a6:	4605                	li	a2,1
ffffffffc02087a8:	00f10593          	addi	a1,sp,15
ffffffffc02087ac:	854a                	mv	a0,s2
ffffffffc02087ae:	00f107a3          	sb	a5,15(sp)
ffffffffc02087b2:	bcffc0ef          	jal	ra,ffffffffc0205380 <iobuf_move>
ffffffffc02087b6:	842a                	mv	s0,a0
ffffffffc02087b8:	f969                	bnez	a0,ffffffffc020878a <vfs_getcwd+0x42>
ffffffffc02087ba:	78bc                	ld	a5,112(s1)
ffffffffc02087bc:	c3b9                	beqz	a5,ffffffffc0208802 <vfs_getcwd+0xba>
ffffffffc02087be:	7f9c                	ld	a5,56(a5)
ffffffffc02087c0:	c3a9                	beqz	a5,ffffffffc0208802 <vfs_getcwd+0xba>
ffffffffc02087c2:	00007597          	auipc	a1,0x7
ffffffffc02087c6:	97658593          	addi	a1,a1,-1674 # ffffffffc020f138 <syscalls+0xe10>
ffffffffc02087ca:	8526                	mv	a0,s1
ffffffffc02087cc:	bd6ff0ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc02087d0:	78bc                	ld	a5,112(s1)
ffffffffc02087d2:	85ca                	mv	a1,s2
ffffffffc02087d4:	8526                	mv	a0,s1
ffffffffc02087d6:	7f9c                	ld	a5,56(a5)
ffffffffc02087d8:	9782                	jalr	a5
ffffffffc02087da:	842a                	mv	s0,a0
ffffffffc02087dc:	b77d                	j	ffffffffc020878a <vfs_getcwd+0x42>
ffffffffc02087de:	5441                	li	s0,-16
ffffffffc02087e0:	bf45                	j	ffffffffc0208790 <vfs_getcwd+0x48>
ffffffffc02087e2:	00007697          	auipc	a3,0x7
ffffffffc02087e6:	81e68693          	addi	a3,a3,-2018 # ffffffffc020f000 <syscalls+0xcd8>
ffffffffc02087ea:	00003617          	auipc	a2,0x3
ffffffffc02087ee:	4ce60613          	addi	a2,a2,1230 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02087f2:	06e00593          	li	a1,110
ffffffffc02087f6:	00007517          	auipc	a0,0x7
ffffffffc02087fa:	8ca50513          	addi	a0,a0,-1846 # ffffffffc020f0c0 <syscalls+0xd98>
ffffffffc02087fe:	ca1f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208802:	00007697          	auipc	a3,0x7
ffffffffc0208806:	8de68693          	addi	a3,a3,-1826 # ffffffffc020f0e0 <syscalls+0xdb8>
ffffffffc020880a:	00003617          	auipc	a2,0x3
ffffffffc020880e:	4ae60613          	addi	a2,a2,1198 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208812:	07800593          	li	a1,120
ffffffffc0208816:	00007517          	auipc	a0,0x7
ffffffffc020881a:	8aa50513          	addi	a0,a0,-1878 # ffffffffc020f0c0 <syscalls+0xd98>
ffffffffc020881e:	c81f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208822 <dev_lookup>:
ffffffffc0208822:	0005c783          	lbu	a5,0(a1)
ffffffffc0208826:	e385                	bnez	a5,ffffffffc0208846 <dev_lookup+0x24>
ffffffffc0208828:	1101                	addi	sp,sp,-32
ffffffffc020882a:	e822                	sd	s0,16(sp)
ffffffffc020882c:	e426                	sd	s1,8(sp)
ffffffffc020882e:	ec06                	sd	ra,24(sp)
ffffffffc0208830:	84aa                	mv	s1,a0
ffffffffc0208832:	8432                	mv	s0,a2
ffffffffc0208834:	b56ff0ef          	jal	ra,ffffffffc0207b8a <inode_ref_inc>
ffffffffc0208838:	60e2                	ld	ra,24(sp)
ffffffffc020883a:	e004                	sd	s1,0(s0)
ffffffffc020883c:	6442                	ld	s0,16(sp)
ffffffffc020883e:	64a2                	ld	s1,8(sp)
ffffffffc0208840:	4501                	li	a0,0
ffffffffc0208842:	6105                	addi	sp,sp,32
ffffffffc0208844:	8082                	ret
ffffffffc0208846:	5541                	li	a0,-16
ffffffffc0208848:	8082                	ret

ffffffffc020884a <dev_fstat>:
ffffffffc020884a:	1101                	addi	sp,sp,-32
ffffffffc020884c:	e426                	sd	s1,8(sp)
ffffffffc020884e:	84ae                	mv	s1,a1
ffffffffc0208850:	e822                	sd	s0,16(sp)
ffffffffc0208852:	02000613          	li	a2,32
ffffffffc0208856:	842a                	mv	s0,a0
ffffffffc0208858:	4581                	li	a1,0
ffffffffc020885a:	8526                	mv	a0,s1
ffffffffc020885c:	ec06                	sd	ra,24(sp)
ffffffffc020885e:	777020ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc0208862:	c429                	beqz	s0,ffffffffc02088ac <dev_fstat+0x62>
ffffffffc0208864:	783c                	ld	a5,112(s0)
ffffffffc0208866:	c3b9                	beqz	a5,ffffffffc02088ac <dev_fstat+0x62>
ffffffffc0208868:	6bbc                	ld	a5,80(a5)
ffffffffc020886a:	c3a9                	beqz	a5,ffffffffc02088ac <dev_fstat+0x62>
ffffffffc020886c:	00007597          	auipc	a1,0x7
ffffffffc0208870:	86c58593          	addi	a1,a1,-1940 # ffffffffc020f0d8 <syscalls+0xdb0>
ffffffffc0208874:	8522                	mv	a0,s0
ffffffffc0208876:	b2cff0ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc020887a:	783c                	ld	a5,112(s0)
ffffffffc020887c:	85a6                	mv	a1,s1
ffffffffc020887e:	8522                	mv	a0,s0
ffffffffc0208880:	6bbc                	ld	a5,80(a5)
ffffffffc0208882:	9782                	jalr	a5
ffffffffc0208884:	ed19                	bnez	a0,ffffffffc02088a2 <dev_fstat+0x58>
ffffffffc0208886:	4c38                	lw	a4,88(s0)
ffffffffc0208888:	6785                	lui	a5,0x1
ffffffffc020888a:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020888e:	02f71f63          	bne	a4,a5,ffffffffc02088cc <dev_fstat+0x82>
ffffffffc0208892:	6018                	ld	a4,0(s0)
ffffffffc0208894:	641c                	ld	a5,8(s0)
ffffffffc0208896:	4685                	li	a3,1
ffffffffc0208898:	e494                	sd	a3,8(s1)
ffffffffc020889a:	02e787b3          	mul	a5,a5,a4
ffffffffc020889e:	e898                	sd	a4,16(s1)
ffffffffc02088a0:	ec9c                	sd	a5,24(s1)
ffffffffc02088a2:	60e2                	ld	ra,24(sp)
ffffffffc02088a4:	6442                	ld	s0,16(sp)
ffffffffc02088a6:	64a2                	ld	s1,8(sp)
ffffffffc02088a8:	6105                	addi	sp,sp,32
ffffffffc02088aa:	8082                	ret
ffffffffc02088ac:	00006697          	auipc	a3,0x6
ffffffffc02088b0:	7c468693          	addi	a3,a3,1988 # ffffffffc020f070 <syscalls+0xd48>
ffffffffc02088b4:	00003617          	auipc	a2,0x3
ffffffffc02088b8:	40460613          	addi	a2,a2,1028 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02088bc:	04200593          	li	a1,66
ffffffffc02088c0:	00007517          	auipc	a0,0x7
ffffffffc02088c4:	88850513          	addi	a0,a0,-1912 # ffffffffc020f148 <syscalls+0xe20>
ffffffffc02088c8:	bd7f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02088cc:	00006697          	auipc	a3,0x6
ffffffffc02088d0:	56c68693          	addi	a3,a3,1388 # ffffffffc020ee38 <syscalls+0xb10>
ffffffffc02088d4:	00003617          	auipc	a2,0x3
ffffffffc02088d8:	3e460613          	addi	a2,a2,996 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02088dc:	04500593          	li	a1,69
ffffffffc02088e0:	00007517          	auipc	a0,0x7
ffffffffc02088e4:	86850513          	addi	a0,a0,-1944 # ffffffffc020f148 <syscalls+0xe20>
ffffffffc02088e8:	bb7f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02088ec <dev_ioctl>:
ffffffffc02088ec:	c909                	beqz	a0,ffffffffc02088fe <dev_ioctl+0x12>
ffffffffc02088ee:	4d34                	lw	a3,88(a0)
ffffffffc02088f0:	6705                	lui	a4,0x1
ffffffffc02088f2:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02088f6:	00e69463          	bne	a3,a4,ffffffffc02088fe <dev_ioctl+0x12>
ffffffffc02088fa:	751c                	ld	a5,40(a0)
ffffffffc02088fc:	8782                	jr	a5
ffffffffc02088fe:	1141                	addi	sp,sp,-16
ffffffffc0208900:	00006697          	auipc	a3,0x6
ffffffffc0208904:	53868693          	addi	a3,a3,1336 # ffffffffc020ee38 <syscalls+0xb10>
ffffffffc0208908:	00003617          	auipc	a2,0x3
ffffffffc020890c:	3b060613          	addi	a2,a2,944 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208910:	03500593          	li	a1,53
ffffffffc0208914:	00007517          	auipc	a0,0x7
ffffffffc0208918:	83450513          	addi	a0,a0,-1996 # ffffffffc020f148 <syscalls+0xe20>
ffffffffc020891c:	e406                	sd	ra,8(sp)
ffffffffc020891e:	b81f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208922 <dev_tryseek>:
ffffffffc0208922:	c51d                	beqz	a0,ffffffffc0208950 <dev_tryseek+0x2e>
ffffffffc0208924:	4d38                	lw	a4,88(a0)
ffffffffc0208926:	6785                	lui	a5,0x1
ffffffffc0208928:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020892c:	02f71263          	bne	a4,a5,ffffffffc0208950 <dev_tryseek+0x2e>
ffffffffc0208930:	611c                	ld	a5,0(a0)
ffffffffc0208932:	cf89                	beqz	a5,ffffffffc020894c <dev_tryseek+0x2a>
ffffffffc0208934:	6518                	ld	a4,8(a0)
ffffffffc0208936:	02e5f6b3          	remu	a3,a1,a4
ffffffffc020893a:	ea89                	bnez	a3,ffffffffc020894c <dev_tryseek+0x2a>
ffffffffc020893c:	0005c863          	bltz	a1,ffffffffc020894c <dev_tryseek+0x2a>
ffffffffc0208940:	02e787b3          	mul	a5,a5,a4
ffffffffc0208944:	00f5f463          	bgeu	a1,a5,ffffffffc020894c <dev_tryseek+0x2a>
ffffffffc0208948:	4501                	li	a0,0
ffffffffc020894a:	8082                	ret
ffffffffc020894c:	5575                	li	a0,-3
ffffffffc020894e:	8082                	ret
ffffffffc0208950:	1141                	addi	sp,sp,-16
ffffffffc0208952:	00006697          	auipc	a3,0x6
ffffffffc0208956:	4e668693          	addi	a3,a3,1254 # ffffffffc020ee38 <syscalls+0xb10>
ffffffffc020895a:	00003617          	auipc	a2,0x3
ffffffffc020895e:	35e60613          	addi	a2,a2,862 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208962:	05f00593          	li	a1,95
ffffffffc0208966:	00006517          	auipc	a0,0x6
ffffffffc020896a:	7e250513          	addi	a0,a0,2018 # ffffffffc020f148 <syscalls+0xe20>
ffffffffc020896e:	e406                	sd	ra,8(sp)
ffffffffc0208970:	b2ff70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208974 <dev_gettype>:
ffffffffc0208974:	c10d                	beqz	a0,ffffffffc0208996 <dev_gettype+0x22>
ffffffffc0208976:	4d38                	lw	a4,88(a0)
ffffffffc0208978:	6785                	lui	a5,0x1
ffffffffc020897a:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020897e:	00f71c63          	bne	a4,a5,ffffffffc0208996 <dev_gettype+0x22>
ffffffffc0208982:	6118                	ld	a4,0(a0)
ffffffffc0208984:	6795                	lui	a5,0x5
ffffffffc0208986:	c701                	beqz	a4,ffffffffc020898e <dev_gettype+0x1a>
ffffffffc0208988:	c19c                	sw	a5,0(a1)
ffffffffc020898a:	4501                	li	a0,0
ffffffffc020898c:	8082                	ret
ffffffffc020898e:	6791                	lui	a5,0x4
ffffffffc0208990:	c19c                	sw	a5,0(a1)
ffffffffc0208992:	4501                	li	a0,0
ffffffffc0208994:	8082                	ret
ffffffffc0208996:	1141                	addi	sp,sp,-16
ffffffffc0208998:	00006697          	auipc	a3,0x6
ffffffffc020899c:	4a068693          	addi	a3,a3,1184 # ffffffffc020ee38 <syscalls+0xb10>
ffffffffc02089a0:	00003617          	auipc	a2,0x3
ffffffffc02089a4:	31860613          	addi	a2,a2,792 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02089a8:	05300593          	li	a1,83
ffffffffc02089ac:	00006517          	auipc	a0,0x6
ffffffffc02089b0:	79c50513          	addi	a0,a0,1948 # ffffffffc020f148 <syscalls+0xe20>
ffffffffc02089b4:	e406                	sd	ra,8(sp)
ffffffffc02089b6:	ae9f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02089ba <dev_write>:
ffffffffc02089ba:	c911                	beqz	a0,ffffffffc02089ce <dev_write+0x14>
ffffffffc02089bc:	4d34                	lw	a3,88(a0)
ffffffffc02089be:	6705                	lui	a4,0x1
ffffffffc02089c0:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02089c4:	00e69563          	bne	a3,a4,ffffffffc02089ce <dev_write+0x14>
ffffffffc02089c8:	711c                	ld	a5,32(a0)
ffffffffc02089ca:	4605                	li	a2,1
ffffffffc02089cc:	8782                	jr	a5
ffffffffc02089ce:	1141                	addi	sp,sp,-16
ffffffffc02089d0:	00006697          	auipc	a3,0x6
ffffffffc02089d4:	46868693          	addi	a3,a3,1128 # ffffffffc020ee38 <syscalls+0xb10>
ffffffffc02089d8:	00003617          	auipc	a2,0x3
ffffffffc02089dc:	2e060613          	addi	a2,a2,736 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02089e0:	02c00593          	li	a1,44
ffffffffc02089e4:	00006517          	auipc	a0,0x6
ffffffffc02089e8:	76450513          	addi	a0,a0,1892 # ffffffffc020f148 <syscalls+0xe20>
ffffffffc02089ec:	e406                	sd	ra,8(sp)
ffffffffc02089ee:	ab1f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02089f2 <dev_read>:
ffffffffc02089f2:	c911                	beqz	a0,ffffffffc0208a06 <dev_read+0x14>
ffffffffc02089f4:	4d34                	lw	a3,88(a0)
ffffffffc02089f6:	6705                	lui	a4,0x1
ffffffffc02089f8:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02089fc:	00e69563          	bne	a3,a4,ffffffffc0208a06 <dev_read+0x14>
ffffffffc0208a00:	711c                	ld	a5,32(a0)
ffffffffc0208a02:	4601                	li	a2,0
ffffffffc0208a04:	8782                	jr	a5
ffffffffc0208a06:	1141                	addi	sp,sp,-16
ffffffffc0208a08:	00006697          	auipc	a3,0x6
ffffffffc0208a0c:	43068693          	addi	a3,a3,1072 # ffffffffc020ee38 <syscalls+0xb10>
ffffffffc0208a10:	00003617          	auipc	a2,0x3
ffffffffc0208a14:	2a860613          	addi	a2,a2,680 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208a18:	02300593          	li	a1,35
ffffffffc0208a1c:	00006517          	auipc	a0,0x6
ffffffffc0208a20:	72c50513          	addi	a0,a0,1836 # ffffffffc020f148 <syscalls+0xe20>
ffffffffc0208a24:	e406                	sd	ra,8(sp)
ffffffffc0208a26:	a79f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208a2a <dev_close>:
ffffffffc0208a2a:	c909                	beqz	a0,ffffffffc0208a3c <dev_close+0x12>
ffffffffc0208a2c:	4d34                	lw	a3,88(a0)
ffffffffc0208a2e:	6705                	lui	a4,0x1
ffffffffc0208a30:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208a34:	00e69463          	bne	a3,a4,ffffffffc0208a3c <dev_close+0x12>
ffffffffc0208a38:	6d1c                	ld	a5,24(a0)
ffffffffc0208a3a:	8782                	jr	a5
ffffffffc0208a3c:	1141                	addi	sp,sp,-16
ffffffffc0208a3e:	00006697          	auipc	a3,0x6
ffffffffc0208a42:	3fa68693          	addi	a3,a3,1018 # ffffffffc020ee38 <syscalls+0xb10>
ffffffffc0208a46:	00003617          	auipc	a2,0x3
ffffffffc0208a4a:	27260613          	addi	a2,a2,626 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208a4e:	45e9                	li	a1,26
ffffffffc0208a50:	00006517          	auipc	a0,0x6
ffffffffc0208a54:	6f850513          	addi	a0,a0,1784 # ffffffffc020f148 <syscalls+0xe20>
ffffffffc0208a58:	e406                	sd	ra,8(sp)
ffffffffc0208a5a:	a45f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208a5e <dev_open>:
ffffffffc0208a5e:	03c5f713          	andi	a4,a1,60
ffffffffc0208a62:	eb11                	bnez	a4,ffffffffc0208a76 <dev_open+0x18>
ffffffffc0208a64:	c919                	beqz	a0,ffffffffc0208a7a <dev_open+0x1c>
ffffffffc0208a66:	4d34                	lw	a3,88(a0)
ffffffffc0208a68:	6705                	lui	a4,0x1
ffffffffc0208a6a:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208a6e:	00e69663          	bne	a3,a4,ffffffffc0208a7a <dev_open+0x1c>
ffffffffc0208a72:	691c                	ld	a5,16(a0)
ffffffffc0208a74:	8782                	jr	a5
ffffffffc0208a76:	5575                	li	a0,-3
ffffffffc0208a78:	8082                	ret
ffffffffc0208a7a:	1141                	addi	sp,sp,-16
ffffffffc0208a7c:	00006697          	auipc	a3,0x6
ffffffffc0208a80:	3bc68693          	addi	a3,a3,956 # ffffffffc020ee38 <syscalls+0xb10>
ffffffffc0208a84:	00003617          	auipc	a2,0x3
ffffffffc0208a88:	23460613          	addi	a2,a2,564 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208a8c:	45c5                	li	a1,17
ffffffffc0208a8e:	00006517          	auipc	a0,0x6
ffffffffc0208a92:	6ba50513          	addi	a0,a0,1722 # ffffffffc020f148 <syscalls+0xe20>
ffffffffc0208a96:	e406                	sd	ra,8(sp)
ffffffffc0208a98:	a07f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208a9c <dev_init>:
ffffffffc0208a9c:	1141                	addi	sp,sp,-16
ffffffffc0208a9e:	e406                	sd	ra,8(sp)
ffffffffc0208aa0:	542000ef          	jal	ra,ffffffffc0208fe2 <dev_init_stdin>
ffffffffc0208aa4:	65a000ef          	jal	ra,ffffffffc02090fe <dev_init_stdout>
ffffffffc0208aa8:	60a2                	ld	ra,8(sp)
ffffffffc0208aaa:	0141                	addi	sp,sp,16
ffffffffc0208aac:	a439                	j	ffffffffc0208cba <dev_init_disk0>

ffffffffc0208aae <dev_create_inode>:
ffffffffc0208aae:	6505                	lui	a0,0x1
ffffffffc0208ab0:	1141                	addi	sp,sp,-16
ffffffffc0208ab2:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208ab6:	e022                	sd	s0,0(sp)
ffffffffc0208ab8:	e406                	sd	ra,8(sp)
ffffffffc0208aba:	852ff0ef          	jal	ra,ffffffffc0207b0c <__alloc_inode>
ffffffffc0208abe:	842a                	mv	s0,a0
ffffffffc0208ac0:	c901                	beqz	a0,ffffffffc0208ad0 <dev_create_inode+0x22>
ffffffffc0208ac2:	4601                	li	a2,0
ffffffffc0208ac4:	00006597          	auipc	a1,0x6
ffffffffc0208ac8:	69c58593          	addi	a1,a1,1692 # ffffffffc020f160 <dev_node_ops>
ffffffffc0208acc:	85cff0ef          	jal	ra,ffffffffc0207b28 <inode_init>
ffffffffc0208ad0:	60a2                	ld	ra,8(sp)
ffffffffc0208ad2:	8522                	mv	a0,s0
ffffffffc0208ad4:	6402                	ld	s0,0(sp)
ffffffffc0208ad6:	0141                	addi	sp,sp,16
ffffffffc0208ad8:	8082                	ret

ffffffffc0208ada <disk0_open>:
ffffffffc0208ada:	4501                	li	a0,0
ffffffffc0208adc:	8082                	ret

ffffffffc0208ade <disk0_close>:
ffffffffc0208ade:	4501                	li	a0,0
ffffffffc0208ae0:	8082                	ret

ffffffffc0208ae2 <disk0_ioctl>:
ffffffffc0208ae2:	5531                	li	a0,-20
ffffffffc0208ae4:	8082                	ret

ffffffffc0208ae6 <disk0_io>:
ffffffffc0208ae6:	659c                	ld	a5,8(a1)
ffffffffc0208ae8:	7159                	addi	sp,sp,-112
ffffffffc0208aea:	eca6                	sd	s1,88(sp)
ffffffffc0208aec:	f45e                	sd	s7,40(sp)
ffffffffc0208aee:	6d84                	ld	s1,24(a1)
ffffffffc0208af0:	6b85                	lui	s7,0x1
ffffffffc0208af2:	1bfd                	addi	s7,s7,-1
ffffffffc0208af4:	e4ce                	sd	s3,72(sp)
ffffffffc0208af6:	43f7d993          	srai	s3,a5,0x3f
ffffffffc0208afa:	0179f9b3          	and	s3,s3,s7
ffffffffc0208afe:	99be                	add	s3,s3,a5
ffffffffc0208b00:	8fc5                	or	a5,a5,s1
ffffffffc0208b02:	f486                	sd	ra,104(sp)
ffffffffc0208b04:	f0a2                	sd	s0,96(sp)
ffffffffc0208b06:	e8ca                	sd	s2,80(sp)
ffffffffc0208b08:	e0d2                	sd	s4,64(sp)
ffffffffc0208b0a:	fc56                	sd	s5,56(sp)
ffffffffc0208b0c:	f85a                	sd	s6,48(sp)
ffffffffc0208b0e:	f062                	sd	s8,32(sp)
ffffffffc0208b10:	ec66                	sd	s9,24(sp)
ffffffffc0208b12:	e86a                	sd	s10,16(sp)
ffffffffc0208b14:	0177f7b3          	and	a5,a5,s7
ffffffffc0208b18:	10079d63          	bnez	a5,ffffffffc0208c32 <disk0_io+0x14c>
ffffffffc0208b1c:	40c9d993          	srai	s3,s3,0xc
ffffffffc0208b20:	00c4d713          	srli	a4,s1,0xc
ffffffffc0208b24:	2981                	sext.w	s3,s3
ffffffffc0208b26:	2701                	sext.w	a4,a4
ffffffffc0208b28:	00e987bb          	addw	a5,s3,a4
ffffffffc0208b2c:	6114                	ld	a3,0(a0)
ffffffffc0208b2e:	1782                	slli	a5,a5,0x20
ffffffffc0208b30:	9381                	srli	a5,a5,0x20
ffffffffc0208b32:	10f6e063          	bltu	a3,a5,ffffffffc0208c32 <disk0_io+0x14c>
ffffffffc0208b36:	4501                	li	a0,0
ffffffffc0208b38:	ef19                	bnez	a4,ffffffffc0208b56 <disk0_io+0x70>
ffffffffc0208b3a:	70a6                	ld	ra,104(sp)
ffffffffc0208b3c:	7406                	ld	s0,96(sp)
ffffffffc0208b3e:	64e6                	ld	s1,88(sp)
ffffffffc0208b40:	6946                	ld	s2,80(sp)
ffffffffc0208b42:	69a6                	ld	s3,72(sp)
ffffffffc0208b44:	6a06                	ld	s4,64(sp)
ffffffffc0208b46:	7ae2                	ld	s5,56(sp)
ffffffffc0208b48:	7b42                	ld	s6,48(sp)
ffffffffc0208b4a:	7ba2                	ld	s7,40(sp)
ffffffffc0208b4c:	7c02                	ld	s8,32(sp)
ffffffffc0208b4e:	6ce2                	ld	s9,24(sp)
ffffffffc0208b50:	6d42                	ld	s10,16(sp)
ffffffffc0208b52:	6165                	addi	sp,sp,112
ffffffffc0208b54:	8082                	ret
ffffffffc0208b56:	0008d517          	auipc	a0,0x8d
ffffffffc0208b5a:	cea50513          	addi	a0,a0,-790 # ffffffffc0295840 <disk0_sem>
ffffffffc0208b5e:	8b2e                	mv	s6,a1
ffffffffc0208b60:	8c32                	mv	s8,a2
ffffffffc0208b62:	0008ea97          	auipc	s5,0x8e
ffffffffc0208b66:	d96a8a93          	addi	s5,s5,-618 # ffffffffc02968f8 <disk0_buffer>
ffffffffc0208b6a:	9fbfb0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0208b6e:	6c91                	lui	s9,0x4
ffffffffc0208b70:	e4b9                	bnez	s1,ffffffffc0208bbe <disk0_io+0xd8>
ffffffffc0208b72:	a845                	j	ffffffffc0208c22 <disk0_io+0x13c>
ffffffffc0208b74:	00c4d413          	srli	s0,s1,0xc
ffffffffc0208b78:	0034169b          	slliw	a3,s0,0x3
ffffffffc0208b7c:	00068d1b          	sext.w	s10,a3
ffffffffc0208b80:	1682                	slli	a3,a3,0x20
ffffffffc0208b82:	2401                	sext.w	s0,s0
ffffffffc0208b84:	9281                	srli	a3,a3,0x20
ffffffffc0208b86:	8926                	mv	s2,s1
ffffffffc0208b88:	00399a1b          	slliw	s4,s3,0x3
ffffffffc0208b8c:	862e                	mv	a2,a1
ffffffffc0208b8e:	4509                	li	a0,2
ffffffffc0208b90:	85d2                	mv	a1,s4
ffffffffc0208b92:	faff70ef          	jal	ra,ffffffffc0200b40 <ide_read_secs>
ffffffffc0208b96:	e165                	bnez	a0,ffffffffc0208c76 <disk0_io+0x190>
ffffffffc0208b98:	000ab583          	ld	a1,0(s5)
ffffffffc0208b9c:	0038                	addi	a4,sp,8
ffffffffc0208b9e:	4685                	li	a3,1
ffffffffc0208ba0:	864a                	mv	a2,s2
ffffffffc0208ba2:	855a                	mv	a0,s6
ffffffffc0208ba4:	fdcfc0ef          	jal	ra,ffffffffc0205380 <iobuf_move>
ffffffffc0208ba8:	67a2                	ld	a5,8(sp)
ffffffffc0208baa:	09279663          	bne	a5,s2,ffffffffc0208c36 <disk0_io+0x150>
ffffffffc0208bae:	017977b3          	and	a5,s2,s7
ffffffffc0208bb2:	e3d1                	bnez	a5,ffffffffc0208c36 <disk0_io+0x150>
ffffffffc0208bb4:	412484b3          	sub	s1,s1,s2
ffffffffc0208bb8:	013409bb          	addw	s3,s0,s3
ffffffffc0208bbc:	c0bd                	beqz	s1,ffffffffc0208c22 <disk0_io+0x13c>
ffffffffc0208bbe:	000ab583          	ld	a1,0(s5)
ffffffffc0208bc2:	000c1b63          	bnez	s8,ffffffffc0208bd8 <disk0_io+0xf2>
ffffffffc0208bc6:	fb94e7e3          	bltu	s1,s9,ffffffffc0208b74 <disk0_io+0x8e>
ffffffffc0208bca:	02000693          	li	a3,32
ffffffffc0208bce:	02000d13          	li	s10,32
ffffffffc0208bd2:	4411                	li	s0,4
ffffffffc0208bd4:	6911                	lui	s2,0x4
ffffffffc0208bd6:	bf4d                	j	ffffffffc0208b88 <disk0_io+0xa2>
ffffffffc0208bd8:	0038                	addi	a4,sp,8
ffffffffc0208bda:	4681                	li	a3,0
ffffffffc0208bdc:	6611                	lui	a2,0x4
ffffffffc0208bde:	855a                	mv	a0,s6
ffffffffc0208be0:	fa0fc0ef          	jal	ra,ffffffffc0205380 <iobuf_move>
ffffffffc0208be4:	6422                	ld	s0,8(sp)
ffffffffc0208be6:	c825                	beqz	s0,ffffffffc0208c56 <disk0_io+0x170>
ffffffffc0208be8:	0684e763          	bltu	s1,s0,ffffffffc0208c56 <disk0_io+0x170>
ffffffffc0208bec:	017477b3          	and	a5,s0,s7
ffffffffc0208bf0:	e3bd                	bnez	a5,ffffffffc0208c56 <disk0_io+0x170>
ffffffffc0208bf2:	8031                	srli	s0,s0,0xc
ffffffffc0208bf4:	0034179b          	slliw	a5,s0,0x3
ffffffffc0208bf8:	000ab603          	ld	a2,0(s5)
ffffffffc0208bfc:	0039991b          	slliw	s2,s3,0x3
ffffffffc0208c00:	02079693          	slli	a3,a5,0x20
ffffffffc0208c04:	9281                	srli	a3,a3,0x20
ffffffffc0208c06:	85ca                	mv	a1,s2
ffffffffc0208c08:	4509                	li	a0,2
ffffffffc0208c0a:	2401                	sext.w	s0,s0
ffffffffc0208c0c:	00078a1b          	sext.w	s4,a5
ffffffffc0208c10:	fc7f70ef          	jal	ra,ffffffffc0200bd6 <ide_write_secs>
ffffffffc0208c14:	e151                	bnez	a0,ffffffffc0208c98 <disk0_io+0x1b2>
ffffffffc0208c16:	6922                	ld	s2,8(sp)
ffffffffc0208c18:	013409bb          	addw	s3,s0,s3
ffffffffc0208c1c:	412484b3          	sub	s1,s1,s2
ffffffffc0208c20:	fcd9                	bnez	s1,ffffffffc0208bbe <disk0_io+0xd8>
ffffffffc0208c22:	0008d517          	auipc	a0,0x8d
ffffffffc0208c26:	c1e50513          	addi	a0,a0,-994 # ffffffffc0295840 <disk0_sem>
ffffffffc0208c2a:	937fb0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0208c2e:	4501                	li	a0,0
ffffffffc0208c30:	b729                	j	ffffffffc0208b3a <disk0_io+0x54>
ffffffffc0208c32:	5575                	li	a0,-3
ffffffffc0208c34:	b719                	j	ffffffffc0208b3a <disk0_io+0x54>
ffffffffc0208c36:	00006697          	auipc	a3,0x6
ffffffffc0208c3a:	6a268693          	addi	a3,a3,1698 # ffffffffc020f2d8 <dev_node_ops+0x178>
ffffffffc0208c3e:	00003617          	auipc	a2,0x3
ffffffffc0208c42:	07a60613          	addi	a2,a2,122 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208c46:	06200593          	li	a1,98
ffffffffc0208c4a:	00006517          	auipc	a0,0x6
ffffffffc0208c4e:	5d650513          	addi	a0,a0,1494 # ffffffffc020f220 <dev_node_ops+0xc0>
ffffffffc0208c52:	84df70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208c56:	00006697          	auipc	a3,0x6
ffffffffc0208c5a:	58a68693          	addi	a3,a3,1418 # ffffffffc020f1e0 <dev_node_ops+0x80>
ffffffffc0208c5e:	00003617          	auipc	a2,0x3
ffffffffc0208c62:	05a60613          	addi	a2,a2,90 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208c66:	05700593          	li	a1,87
ffffffffc0208c6a:	00006517          	auipc	a0,0x6
ffffffffc0208c6e:	5b650513          	addi	a0,a0,1462 # ffffffffc020f220 <dev_node_ops+0xc0>
ffffffffc0208c72:	82df70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208c76:	88aa                	mv	a7,a0
ffffffffc0208c78:	886a                	mv	a6,s10
ffffffffc0208c7a:	87a2                	mv	a5,s0
ffffffffc0208c7c:	8752                	mv	a4,s4
ffffffffc0208c7e:	86ce                	mv	a3,s3
ffffffffc0208c80:	00006617          	auipc	a2,0x6
ffffffffc0208c84:	61060613          	addi	a2,a2,1552 # ffffffffc020f290 <dev_node_ops+0x130>
ffffffffc0208c88:	02d00593          	li	a1,45
ffffffffc0208c8c:	00006517          	auipc	a0,0x6
ffffffffc0208c90:	59450513          	addi	a0,a0,1428 # ffffffffc020f220 <dev_node_ops+0xc0>
ffffffffc0208c94:	80bf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208c98:	88aa                	mv	a7,a0
ffffffffc0208c9a:	8852                	mv	a6,s4
ffffffffc0208c9c:	87a2                	mv	a5,s0
ffffffffc0208c9e:	874a                	mv	a4,s2
ffffffffc0208ca0:	86ce                	mv	a3,s3
ffffffffc0208ca2:	00006617          	auipc	a2,0x6
ffffffffc0208ca6:	59e60613          	addi	a2,a2,1438 # ffffffffc020f240 <dev_node_ops+0xe0>
ffffffffc0208caa:	03700593          	li	a1,55
ffffffffc0208cae:	00006517          	auipc	a0,0x6
ffffffffc0208cb2:	57250513          	addi	a0,a0,1394 # ffffffffc020f220 <dev_node_ops+0xc0>
ffffffffc0208cb6:	fe8f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208cba <dev_init_disk0>:
ffffffffc0208cba:	1101                	addi	sp,sp,-32
ffffffffc0208cbc:	ec06                	sd	ra,24(sp)
ffffffffc0208cbe:	e822                	sd	s0,16(sp)
ffffffffc0208cc0:	e426                	sd	s1,8(sp)
ffffffffc0208cc2:	dedff0ef          	jal	ra,ffffffffc0208aae <dev_create_inode>
ffffffffc0208cc6:	c541                	beqz	a0,ffffffffc0208d4e <dev_init_disk0+0x94>
ffffffffc0208cc8:	4d38                	lw	a4,88(a0)
ffffffffc0208cca:	6485                	lui	s1,0x1
ffffffffc0208ccc:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208cd0:	842a                	mv	s0,a0
ffffffffc0208cd2:	0cf71f63          	bne	a4,a5,ffffffffc0208db0 <dev_init_disk0+0xf6>
ffffffffc0208cd6:	4509                	li	a0,2
ffffffffc0208cd8:	e1df70ef          	jal	ra,ffffffffc0200af4 <ide_device_valid>
ffffffffc0208cdc:	cd55                	beqz	a0,ffffffffc0208d98 <dev_init_disk0+0xde>
ffffffffc0208cde:	4509                	li	a0,2
ffffffffc0208ce0:	e39f70ef          	jal	ra,ffffffffc0200b18 <ide_device_size>
ffffffffc0208ce4:	00355793          	srli	a5,a0,0x3
ffffffffc0208ce8:	e01c                	sd	a5,0(s0)
ffffffffc0208cea:	00000797          	auipc	a5,0x0
ffffffffc0208cee:	df078793          	addi	a5,a5,-528 # ffffffffc0208ada <disk0_open>
ffffffffc0208cf2:	e81c                	sd	a5,16(s0)
ffffffffc0208cf4:	00000797          	auipc	a5,0x0
ffffffffc0208cf8:	dea78793          	addi	a5,a5,-534 # ffffffffc0208ade <disk0_close>
ffffffffc0208cfc:	ec1c                	sd	a5,24(s0)
ffffffffc0208cfe:	00000797          	auipc	a5,0x0
ffffffffc0208d02:	de878793          	addi	a5,a5,-536 # ffffffffc0208ae6 <disk0_io>
ffffffffc0208d06:	f01c                	sd	a5,32(s0)
ffffffffc0208d08:	00000797          	auipc	a5,0x0
ffffffffc0208d0c:	dda78793          	addi	a5,a5,-550 # ffffffffc0208ae2 <disk0_ioctl>
ffffffffc0208d10:	f41c                	sd	a5,40(s0)
ffffffffc0208d12:	4585                	li	a1,1
ffffffffc0208d14:	0008d517          	auipc	a0,0x8d
ffffffffc0208d18:	b2c50513          	addi	a0,a0,-1236 # ffffffffc0295840 <disk0_sem>
ffffffffc0208d1c:	e404                	sd	s1,8(s0)
ffffffffc0208d1e:	83dfb0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0208d22:	6511                	lui	a0,0x4
ffffffffc0208d24:	a6af90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208d28:	0008e797          	auipc	a5,0x8e
ffffffffc0208d2c:	bca7b823          	sd	a0,-1072(a5) # ffffffffc02968f8 <disk0_buffer>
ffffffffc0208d30:	c921                	beqz	a0,ffffffffc0208d80 <dev_init_disk0+0xc6>
ffffffffc0208d32:	4605                	li	a2,1
ffffffffc0208d34:	85a2                	mv	a1,s0
ffffffffc0208d36:	00006517          	auipc	a0,0x6
ffffffffc0208d3a:	63250513          	addi	a0,a0,1586 # ffffffffc020f368 <dev_node_ops+0x208>
ffffffffc0208d3e:	c2cff0ef          	jal	ra,ffffffffc020816a <vfs_add_dev>
ffffffffc0208d42:	e115                	bnez	a0,ffffffffc0208d66 <dev_init_disk0+0xac>
ffffffffc0208d44:	60e2                	ld	ra,24(sp)
ffffffffc0208d46:	6442                	ld	s0,16(sp)
ffffffffc0208d48:	64a2                	ld	s1,8(sp)
ffffffffc0208d4a:	6105                	addi	sp,sp,32
ffffffffc0208d4c:	8082                	ret
ffffffffc0208d4e:	00006617          	auipc	a2,0x6
ffffffffc0208d52:	5ba60613          	addi	a2,a2,1466 # ffffffffc020f308 <dev_node_ops+0x1a8>
ffffffffc0208d56:	08700593          	li	a1,135
ffffffffc0208d5a:	00006517          	auipc	a0,0x6
ffffffffc0208d5e:	4c650513          	addi	a0,a0,1222 # ffffffffc020f220 <dev_node_ops+0xc0>
ffffffffc0208d62:	f3cf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208d66:	86aa                	mv	a3,a0
ffffffffc0208d68:	00006617          	auipc	a2,0x6
ffffffffc0208d6c:	60860613          	addi	a2,a2,1544 # ffffffffc020f370 <dev_node_ops+0x210>
ffffffffc0208d70:	08d00593          	li	a1,141
ffffffffc0208d74:	00006517          	auipc	a0,0x6
ffffffffc0208d78:	4ac50513          	addi	a0,a0,1196 # ffffffffc020f220 <dev_node_ops+0xc0>
ffffffffc0208d7c:	f22f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208d80:	00006617          	auipc	a2,0x6
ffffffffc0208d84:	5c860613          	addi	a2,a2,1480 # ffffffffc020f348 <dev_node_ops+0x1e8>
ffffffffc0208d88:	07f00593          	li	a1,127
ffffffffc0208d8c:	00006517          	auipc	a0,0x6
ffffffffc0208d90:	49450513          	addi	a0,a0,1172 # ffffffffc020f220 <dev_node_ops+0xc0>
ffffffffc0208d94:	f0af70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208d98:	00006617          	auipc	a2,0x6
ffffffffc0208d9c:	59060613          	addi	a2,a2,1424 # ffffffffc020f328 <dev_node_ops+0x1c8>
ffffffffc0208da0:	07300593          	li	a1,115
ffffffffc0208da4:	00006517          	auipc	a0,0x6
ffffffffc0208da8:	47c50513          	addi	a0,a0,1148 # ffffffffc020f220 <dev_node_ops+0xc0>
ffffffffc0208dac:	ef2f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208db0:	00006697          	auipc	a3,0x6
ffffffffc0208db4:	08868693          	addi	a3,a3,136 # ffffffffc020ee38 <syscalls+0xb10>
ffffffffc0208db8:	00003617          	auipc	a2,0x3
ffffffffc0208dbc:	f0060613          	addi	a2,a2,-256 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0208dc0:	08900593          	li	a1,137
ffffffffc0208dc4:	00006517          	auipc	a0,0x6
ffffffffc0208dc8:	45c50513          	addi	a0,a0,1116 # ffffffffc020f220 <dev_node_ops+0xc0>
ffffffffc0208dcc:	ed2f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208dd0 <stdin_open>:
ffffffffc0208dd0:	4501                	li	a0,0
ffffffffc0208dd2:	e191                	bnez	a1,ffffffffc0208dd6 <stdin_open+0x6>
ffffffffc0208dd4:	8082                	ret
ffffffffc0208dd6:	5575                	li	a0,-3
ffffffffc0208dd8:	8082                	ret

ffffffffc0208dda <stdin_close>:
ffffffffc0208dda:	4501                	li	a0,0
ffffffffc0208ddc:	8082                	ret

ffffffffc0208dde <stdin_ioctl>:
ffffffffc0208dde:	5575                	li	a0,-3
ffffffffc0208de0:	8082                	ret

ffffffffc0208de2 <stdin_io>:
ffffffffc0208de2:	7135                	addi	sp,sp,-160
ffffffffc0208de4:	ed06                	sd	ra,152(sp)
ffffffffc0208de6:	e922                	sd	s0,144(sp)
ffffffffc0208de8:	e526                	sd	s1,136(sp)
ffffffffc0208dea:	e14a                	sd	s2,128(sp)
ffffffffc0208dec:	fcce                	sd	s3,120(sp)
ffffffffc0208dee:	f8d2                	sd	s4,112(sp)
ffffffffc0208df0:	f4d6                	sd	s5,104(sp)
ffffffffc0208df2:	f0da                	sd	s6,96(sp)
ffffffffc0208df4:	ecde                	sd	s7,88(sp)
ffffffffc0208df6:	e8e2                	sd	s8,80(sp)
ffffffffc0208df8:	e4e6                	sd	s9,72(sp)
ffffffffc0208dfa:	e0ea                	sd	s10,64(sp)
ffffffffc0208dfc:	fc6e                	sd	s11,56(sp)
ffffffffc0208dfe:	14061163          	bnez	a2,ffffffffc0208f40 <stdin_io+0x15e>
ffffffffc0208e02:	0005bd83          	ld	s11,0(a1)
ffffffffc0208e06:	0185bd03          	ld	s10,24(a1)
ffffffffc0208e0a:	8b2e                	mv	s6,a1
ffffffffc0208e0c:	100027f3          	csrr	a5,sstatus
ffffffffc0208e10:	8b89                	andi	a5,a5,2
ffffffffc0208e12:	10079e63          	bnez	a5,ffffffffc0208f2e <stdin_io+0x14c>
ffffffffc0208e16:	4401                	li	s0,0
ffffffffc0208e18:	100d0963          	beqz	s10,ffffffffc0208f2a <stdin_io+0x148>
ffffffffc0208e1c:	0008e997          	auipc	s3,0x8e
ffffffffc0208e20:	ae498993          	addi	s3,s3,-1308 # ffffffffc0296900 <p_rpos>
ffffffffc0208e24:	0009b783          	ld	a5,0(s3)
ffffffffc0208e28:	800004b7          	lui	s1,0x80000
ffffffffc0208e2c:	6c85                	lui	s9,0x1
ffffffffc0208e2e:	4a81                	li	s5,0
ffffffffc0208e30:	0008ea17          	auipc	s4,0x8e
ffffffffc0208e34:	ad8a0a13          	addi	s4,s4,-1320 # ffffffffc0296908 <p_wpos>
ffffffffc0208e38:	0491                	addi	s1,s1,4
ffffffffc0208e3a:	0008d917          	auipc	s2,0x8d
ffffffffc0208e3e:	a1e90913          	addi	s2,s2,-1506 # ffffffffc0295858 <__wait_queue>
ffffffffc0208e42:	1cfd                	addi	s9,s9,-1
ffffffffc0208e44:	000a3703          	ld	a4,0(s4)
ffffffffc0208e48:	000a8c1b          	sext.w	s8,s5
ffffffffc0208e4c:	8be2                	mv	s7,s8
ffffffffc0208e4e:	02e7d763          	bge	a5,a4,ffffffffc0208e7c <stdin_io+0x9a>
ffffffffc0208e52:	a859                	j	ffffffffc0208ee8 <stdin_io+0x106>
ffffffffc0208e54:	815fe0ef          	jal	ra,ffffffffc0207668 <schedule>
ffffffffc0208e58:	100027f3          	csrr	a5,sstatus
ffffffffc0208e5c:	8b89                	andi	a5,a5,2
ffffffffc0208e5e:	4401                	li	s0,0
ffffffffc0208e60:	ef8d                	bnez	a5,ffffffffc0208e9a <stdin_io+0xb8>
ffffffffc0208e62:	0028                	addi	a0,sp,8
ffffffffc0208e64:	f92fb0ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc0208e68:	e121                	bnez	a0,ffffffffc0208ea8 <stdin_io+0xc6>
ffffffffc0208e6a:	47c2                	lw	a5,16(sp)
ffffffffc0208e6c:	04979563          	bne	a5,s1,ffffffffc0208eb6 <stdin_io+0xd4>
ffffffffc0208e70:	0009b783          	ld	a5,0(s3)
ffffffffc0208e74:	000a3703          	ld	a4,0(s4)
ffffffffc0208e78:	06e7c863          	blt	a5,a4,ffffffffc0208ee8 <stdin_io+0x106>
ffffffffc0208e7c:	8626                	mv	a2,s1
ffffffffc0208e7e:	002c                	addi	a1,sp,8
ffffffffc0208e80:	854a                	mv	a0,s2
ffffffffc0208e82:	89ffb0ef          	jal	ra,ffffffffc0204720 <wait_current_set>
ffffffffc0208e86:	d479                	beqz	s0,ffffffffc0208e54 <stdin_io+0x72>
ffffffffc0208e88:	de5f70ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208e8c:	fdcfe0ef          	jal	ra,ffffffffc0207668 <schedule>
ffffffffc0208e90:	100027f3          	csrr	a5,sstatus
ffffffffc0208e94:	8b89                	andi	a5,a5,2
ffffffffc0208e96:	4401                	li	s0,0
ffffffffc0208e98:	d7e9                	beqz	a5,ffffffffc0208e62 <stdin_io+0x80>
ffffffffc0208e9a:	dd9f70ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208e9e:	0028                	addi	a0,sp,8
ffffffffc0208ea0:	4405                	li	s0,1
ffffffffc0208ea2:	f54fb0ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc0208ea6:	d171                	beqz	a0,ffffffffc0208e6a <stdin_io+0x88>
ffffffffc0208ea8:	002c                	addi	a1,sp,8
ffffffffc0208eaa:	854a                	mv	a0,s2
ffffffffc0208eac:	ef0fb0ef          	jal	ra,ffffffffc020459c <wait_queue_del>
ffffffffc0208eb0:	47c2                	lw	a5,16(sp)
ffffffffc0208eb2:	fa978fe3          	beq	a5,s1,ffffffffc0208e70 <stdin_io+0x8e>
ffffffffc0208eb6:	e435                	bnez	s0,ffffffffc0208f22 <stdin_io+0x140>
ffffffffc0208eb8:	060b8963          	beqz	s7,ffffffffc0208f2a <stdin_io+0x148>
ffffffffc0208ebc:	018b3783          	ld	a5,24(s6)
ffffffffc0208ec0:	41578ab3          	sub	s5,a5,s5
ffffffffc0208ec4:	015b3c23          	sd	s5,24(s6)
ffffffffc0208ec8:	60ea                	ld	ra,152(sp)
ffffffffc0208eca:	644a                	ld	s0,144(sp)
ffffffffc0208ecc:	64aa                	ld	s1,136(sp)
ffffffffc0208ece:	690a                	ld	s2,128(sp)
ffffffffc0208ed0:	79e6                	ld	s3,120(sp)
ffffffffc0208ed2:	7a46                	ld	s4,112(sp)
ffffffffc0208ed4:	7aa6                	ld	s5,104(sp)
ffffffffc0208ed6:	7b06                	ld	s6,96(sp)
ffffffffc0208ed8:	6c46                	ld	s8,80(sp)
ffffffffc0208eda:	6ca6                	ld	s9,72(sp)
ffffffffc0208edc:	6d06                	ld	s10,64(sp)
ffffffffc0208ede:	7de2                	ld	s11,56(sp)
ffffffffc0208ee0:	855e                	mv	a0,s7
ffffffffc0208ee2:	6be6                	ld	s7,88(sp)
ffffffffc0208ee4:	610d                	addi	sp,sp,160
ffffffffc0208ee6:	8082                	ret
ffffffffc0208ee8:	43f7d713          	srai	a4,a5,0x3f
ffffffffc0208eec:	03475693          	srli	a3,a4,0x34
ffffffffc0208ef0:	00d78733          	add	a4,a5,a3
ffffffffc0208ef4:	01977733          	and	a4,a4,s9
ffffffffc0208ef8:	8f15                	sub	a4,a4,a3
ffffffffc0208efa:	0008d697          	auipc	a3,0x8d
ffffffffc0208efe:	96e68693          	addi	a3,a3,-1682 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208f02:	9736                	add	a4,a4,a3
ffffffffc0208f04:	00074683          	lbu	a3,0(a4)
ffffffffc0208f08:	0785                	addi	a5,a5,1
ffffffffc0208f0a:	015d8733          	add	a4,s11,s5
ffffffffc0208f0e:	00d70023          	sb	a3,0(a4)
ffffffffc0208f12:	00f9b023          	sd	a5,0(s3)
ffffffffc0208f16:	0a85                	addi	s5,s5,1
ffffffffc0208f18:	001c0b9b          	addiw	s7,s8,1
ffffffffc0208f1c:	f3aae4e3          	bltu	s5,s10,ffffffffc0208e44 <stdin_io+0x62>
ffffffffc0208f20:	dc51                	beqz	s0,ffffffffc0208ebc <stdin_io+0xda>
ffffffffc0208f22:	d4bf70ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208f26:	f80b9be3          	bnez	s7,ffffffffc0208ebc <stdin_io+0xda>
ffffffffc0208f2a:	4b81                	li	s7,0
ffffffffc0208f2c:	bf71                	j	ffffffffc0208ec8 <stdin_io+0xe6>
ffffffffc0208f2e:	d45f70ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208f32:	4405                	li	s0,1
ffffffffc0208f34:	ee0d14e3          	bnez	s10,ffffffffc0208e1c <stdin_io+0x3a>
ffffffffc0208f38:	d35f70ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208f3c:	4b81                	li	s7,0
ffffffffc0208f3e:	b769                	j	ffffffffc0208ec8 <stdin_io+0xe6>
ffffffffc0208f40:	5bf5                	li	s7,-3
ffffffffc0208f42:	b759                	j	ffffffffc0208ec8 <stdin_io+0xe6>

ffffffffc0208f44 <dev_stdin_write>:
ffffffffc0208f44:	e111                	bnez	a0,ffffffffc0208f48 <dev_stdin_write+0x4>
ffffffffc0208f46:	8082                	ret
ffffffffc0208f48:	1101                	addi	sp,sp,-32
ffffffffc0208f4a:	e822                	sd	s0,16(sp)
ffffffffc0208f4c:	ec06                	sd	ra,24(sp)
ffffffffc0208f4e:	e426                	sd	s1,8(sp)
ffffffffc0208f50:	842a                	mv	s0,a0
ffffffffc0208f52:	100027f3          	csrr	a5,sstatus
ffffffffc0208f56:	8b89                	andi	a5,a5,2
ffffffffc0208f58:	4481                	li	s1,0
ffffffffc0208f5a:	e3c1                	bnez	a5,ffffffffc0208fda <dev_stdin_write+0x96>
ffffffffc0208f5c:	0008e597          	auipc	a1,0x8e
ffffffffc0208f60:	9ac58593          	addi	a1,a1,-1620 # ffffffffc0296908 <p_wpos>
ffffffffc0208f64:	6198                	ld	a4,0(a1)
ffffffffc0208f66:	6605                	lui	a2,0x1
ffffffffc0208f68:	fff60513          	addi	a0,a2,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0208f6c:	43f75693          	srai	a3,a4,0x3f
ffffffffc0208f70:	92d1                	srli	a3,a3,0x34
ffffffffc0208f72:	00d707b3          	add	a5,a4,a3
ffffffffc0208f76:	8fe9                	and	a5,a5,a0
ffffffffc0208f78:	8f95                	sub	a5,a5,a3
ffffffffc0208f7a:	0008d697          	auipc	a3,0x8d
ffffffffc0208f7e:	8ee68693          	addi	a3,a3,-1810 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208f82:	97b6                	add	a5,a5,a3
ffffffffc0208f84:	00878023          	sb	s0,0(a5)
ffffffffc0208f88:	0008e797          	auipc	a5,0x8e
ffffffffc0208f8c:	9787b783          	ld	a5,-1672(a5) # ffffffffc0296900 <p_rpos>
ffffffffc0208f90:	40f707b3          	sub	a5,a4,a5
ffffffffc0208f94:	00c7d463          	bge	a5,a2,ffffffffc0208f9c <dev_stdin_write+0x58>
ffffffffc0208f98:	0705                	addi	a4,a4,1
ffffffffc0208f9a:	e198                	sd	a4,0(a1)
ffffffffc0208f9c:	0008d517          	auipc	a0,0x8d
ffffffffc0208fa0:	8bc50513          	addi	a0,a0,-1860 # ffffffffc0295858 <__wait_queue>
ffffffffc0208fa4:	e46fb0ef          	jal	ra,ffffffffc02045ea <wait_queue_empty>
ffffffffc0208fa8:	cd09                	beqz	a0,ffffffffc0208fc2 <dev_stdin_write+0x7e>
ffffffffc0208faa:	e491                	bnez	s1,ffffffffc0208fb6 <dev_stdin_write+0x72>
ffffffffc0208fac:	60e2                	ld	ra,24(sp)
ffffffffc0208fae:	6442                	ld	s0,16(sp)
ffffffffc0208fb0:	64a2                	ld	s1,8(sp)
ffffffffc0208fb2:	6105                	addi	sp,sp,32
ffffffffc0208fb4:	8082                	ret
ffffffffc0208fb6:	6442                	ld	s0,16(sp)
ffffffffc0208fb8:	60e2                	ld	ra,24(sp)
ffffffffc0208fba:	64a2                	ld	s1,8(sp)
ffffffffc0208fbc:	6105                	addi	sp,sp,32
ffffffffc0208fbe:	caff706f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0208fc2:	800005b7          	lui	a1,0x80000
ffffffffc0208fc6:	4605                	li	a2,1
ffffffffc0208fc8:	0591                	addi	a1,a1,4
ffffffffc0208fca:	0008d517          	auipc	a0,0x8d
ffffffffc0208fce:	88e50513          	addi	a0,a0,-1906 # ffffffffc0295858 <__wait_queue>
ffffffffc0208fd2:	e80fb0ef          	jal	ra,ffffffffc0204652 <wakeup_queue>
ffffffffc0208fd6:	d8f9                	beqz	s1,ffffffffc0208fac <dev_stdin_write+0x68>
ffffffffc0208fd8:	bff9                	j	ffffffffc0208fb6 <dev_stdin_write+0x72>
ffffffffc0208fda:	c99f70ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208fde:	4485                	li	s1,1
ffffffffc0208fe0:	bfb5                	j	ffffffffc0208f5c <dev_stdin_write+0x18>

ffffffffc0208fe2 <dev_init_stdin>:
ffffffffc0208fe2:	1141                	addi	sp,sp,-16
ffffffffc0208fe4:	e406                	sd	ra,8(sp)
ffffffffc0208fe6:	e022                	sd	s0,0(sp)
ffffffffc0208fe8:	ac7ff0ef          	jal	ra,ffffffffc0208aae <dev_create_inode>
ffffffffc0208fec:	c93d                	beqz	a0,ffffffffc0209062 <dev_init_stdin+0x80>
ffffffffc0208fee:	4d38                	lw	a4,88(a0)
ffffffffc0208ff0:	6785                	lui	a5,0x1
ffffffffc0208ff2:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208ff6:	842a                	mv	s0,a0
ffffffffc0208ff8:	08f71e63          	bne	a4,a5,ffffffffc0209094 <dev_init_stdin+0xb2>
ffffffffc0208ffc:	4785                	li	a5,1
ffffffffc0208ffe:	e41c                	sd	a5,8(s0)
ffffffffc0209000:	00000797          	auipc	a5,0x0
ffffffffc0209004:	dd078793          	addi	a5,a5,-560 # ffffffffc0208dd0 <stdin_open>
ffffffffc0209008:	e81c                	sd	a5,16(s0)
ffffffffc020900a:	00000797          	auipc	a5,0x0
ffffffffc020900e:	dd078793          	addi	a5,a5,-560 # ffffffffc0208dda <stdin_close>
ffffffffc0209012:	ec1c                	sd	a5,24(s0)
ffffffffc0209014:	00000797          	auipc	a5,0x0
ffffffffc0209018:	dce78793          	addi	a5,a5,-562 # ffffffffc0208de2 <stdin_io>
ffffffffc020901c:	f01c                	sd	a5,32(s0)
ffffffffc020901e:	00000797          	auipc	a5,0x0
ffffffffc0209022:	dc078793          	addi	a5,a5,-576 # ffffffffc0208dde <stdin_ioctl>
ffffffffc0209026:	f41c                	sd	a5,40(s0)
ffffffffc0209028:	0008d517          	auipc	a0,0x8d
ffffffffc020902c:	83050513          	addi	a0,a0,-2000 # ffffffffc0295858 <__wait_queue>
ffffffffc0209030:	00043023          	sd	zero,0(s0)
ffffffffc0209034:	0008e797          	auipc	a5,0x8e
ffffffffc0209038:	8c07ba23          	sd	zero,-1836(a5) # ffffffffc0296908 <p_wpos>
ffffffffc020903c:	0008e797          	auipc	a5,0x8e
ffffffffc0209040:	8c07b223          	sd	zero,-1852(a5) # ffffffffc0296900 <p_rpos>
ffffffffc0209044:	d52fb0ef          	jal	ra,ffffffffc0204596 <wait_queue_init>
ffffffffc0209048:	4601                	li	a2,0
ffffffffc020904a:	85a2                	mv	a1,s0
ffffffffc020904c:	00006517          	auipc	a0,0x6
ffffffffc0209050:	38450513          	addi	a0,a0,900 # ffffffffc020f3d0 <dev_node_ops+0x270>
ffffffffc0209054:	916ff0ef          	jal	ra,ffffffffc020816a <vfs_add_dev>
ffffffffc0209058:	e10d                	bnez	a0,ffffffffc020907a <dev_init_stdin+0x98>
ffffffffc020905a:	60a2                	ld	ra,8(sp)
ffffffffc020905c:	6402                	ld	s0,0(sp)
ffffffffc020905e:	0141                	addi	sp,sp,16
ffffffffc0209060:	8082                	ret
ffffffffc0209062:	00006617          	auipc	a2,0x6
ffffffffc0209066:	32e60613          	addi	a2,a2,814 # ffffffffc020f390 <dev_node_ops+0x230>
ffffffffc020906a:	07500593          	li	a1,117
ffffffffc020906e:	00006517          	auipc	a0,0x6
ffffffffc0209072:	34250513          	addi	a0,a0,834 # ffffffffc020f3b0 <dev_node_ops+0x250>
ffffffffc0209076:	c28f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020907a:	86aa                	mv	a3,a0
ffffffffc020907c:	00006617          	auipc	a2,0x6
ffffffffc0209080:	35c60613          	addi	a2,a2,860 # ffffffffc020f3d8 <dev_node_ops+0x278>
ffffffffc0209084:	07b00593          	li	a1,123
ffffffffc0209088:	00006517          	auipc	a0,0x6
ffffffffc020908c:	32850513          	addi	a0,a0,808 # ffffffffc020f3b0 <dev_node_ops+0x250>
ffffffffc0209090:	c0ef70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209094:	00006697          	auipc	a3,0x6
ffffffffc0209098:	da468693          	addi	a3,a3,-604 # ffffffffc020ee38 <syscalls+0xb10>
ffffffffc020909c:	00003617          	auipc	a2,0x3
ffffffffc02090a0:	c1c60613          	addi	a2,a2,-996 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02090a4:	07700593          	li	a1,119
ffffffffc02090a8:	00006517          	auipc	a0,0x6
ffffffffc02090ac:	30850513          	addi	a0,a0,776 # ffffffffc020f3b0 <dev_node_ops+0x250>
ffffffffc02090b0:	beef70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02090b4 <stdout_open>:
ffffffffc02090b4:	4785                	li	a5,1
ffffffffc02090b6:	4501                	li	a0,0
ffffffffc02090b8:	00f59363          	bne	a1,a5,ffffffffc02090be <stdout_open+0xa>
ffffffffc02090bc:	8082                	ret
ffffffffc02090be:	5575                	li	a0,-3
ffffffffc02090c0:	8082                	ret

ffffffffc02090c2 <stdout_close>:
ffffffffc02090c2:	4501                	li	a0,0
ffffffffc02090c4:	8082                	ret

ffffffffc02090c6 <stdout_ioctl>:
ffffffffc02090c6:	5575                	li	a0,-3
ffffffffc02090c8:	8082                	ret

ffffffffc02090ca <stdout_io>:
ffffffffc02090ca:	ca05                	beqz	a2,ffffffffc02090fa <stdout_io+0x30>
ffffffffc02090cc:	6d9c                	ld	a5,24(a1)
ffffffffc02090ce:	1101                	addi	sp,sp,-32
ffffffffc02090d0:	e822                	sd	s0,16(sp)
ffffffffc02090d2:	e426                	sd	s1,8(sp)
ffffffffc02090d4:	ec06                	sd	ra,24(sp)
ffffffffc02090d6:	6180                	ld	s0,0(a1)
ffffffffc02090d8:	84ae                	mv	s1,a1
ffffffffc02090da:	cb91                	beqz	a5,ffffffffc02090ee <stdout_io+0x24>
ffffffffc02090dc:	00044503          	lbu	a0,0(s0)
ffffffffc02090e0:	0405                	addi	s0,s0,1
ffffffffc02090e2:	900f70ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc02090e6:	6c9c                	ld	a5,24(s1)
ffffffffc02090e8:	17fd                	addi	a5,a5,-1
ffffffffc02090ea:	ec9c                	sd	a5,24(s1)
ffffffffc02090ec:	fbe5                	bnez	a5,ffffffffc02090dc <stdout_io+0x12>
ffffffffc02090ee:	60e2                	ld	ra,24(sp)
ffffffffc02090f0:	6442                	ld	s0,16(sp)
ffffffffc02090f2:	64a2                	ld	s1,8(sp)
ffffffffc02090f4:	4501                	li	a0,0
ffffffffc02090f6:	6105                	addi	sp,sp,32
ffffffffc02090f8:	8082                	ret
ffffffffc02090fa:	5575                	li	a0,-3
ffffffffc02090fc:	8082                	ret

ffffffffc02090fe <dev_init_stdout>:
ffffffffc02090fe:	1141                	addi	sp,sp,-16
ffffffffc0209100:	e406                	sd	ra,8(sp)
ffffffffc0209102:	9adff0ef          	jal	ra,ffffffffc0208aae <dev_create_inode>
ffffffffc0209106:	c939                	beqz	a0,ffffffffc020915c <dev_init_stdout+0x5e>
ffffffffc0209108:	4d38                	lw	a4,88(a0)
ffffffffc020910a:	6785                	lui	a5,0x1
ffffffffc020910c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0209110:	85aa                	mv	a1,a0
ffffffffc0209112:	06f71e63          	bne	a4,a5,ffffffffc020918e <dev_init_stdout+0x90>
ffffffffc0209116:	4785                	li	a5,1
ffffffffc0209118:	e51c                	sd	a5,8(a0)
ffffffffc020911a:	00000797          	auipc	a5,0x0
ffffffffc020911e:	f9a78793          	addi	a5,a5,-102 # ffffffffc02090b4 <stdout_open>
ffffffffc0209122:	e91c                	sd	a5,16(a0)
ffffffffc0209124:	00000797          	auipc	a5,0x0
ffffffffc0209128:	f9e78793          	addi	a5,a5,-98 # ffffffffc02090c2 <stdout_close>
ffffffffc020912c:	ed1c                	sd	a5,24(a0)
ffffffffc020912e:	00000797          	auipc	a5,0x0
ffffffffc0209132:	f9c78793          	addi	a5,a5,-100 # ffffffffc02090ca <stdout_io>
ffffffffc0209136:	f11c                	sd	a5,32(a0)
ffffffffc0209138:	00000797          	auipc	a5,0x0
ffffffffc020913c:	f8e78793          	addi	a5,a5,-114 # ffffffffc02090c6 <stdout_ioctl>
ffffffffc0209140:	00053023          	sd	zero,0(a0)
ffffffffc0209144:	f51c                	sd	a5,40(a0)
ffffffffc0209146:	4601                	li	a2,0
ffffffffc0209148:	00006517          	auipc	a0,0x6
ffffffffc020914c:	2f050513          	addi	a0,a0,752 # ffffffffc020f438 <dev_node_ops+0x2d8>
ffffffffc0209150:	81aff0ef          	jal	ra,ffffffffc020816a <vfs_add_dev>
ffffffffc0209154:	e105                	bnez	a0,ffffffffc0209174 <dev_init_stdout+0x76>
ffffffffc0209156:	60a2                	ld	ra,8(sp)
ffffffffc0209158:	0141                	addi	sp,sp,16
ffffffffc020915a:	8082                	ret
ffffffffc020915c:	00006617          	auipc	a2,0x6
ffffffffc0209160:	29c60613          	addi	a2,a2,668 # ffffffffc020f3f8 <dev_node_ops+0x298>
ffffffffc0209164:	03700593          	li	a1,55
ffffffffc0209168:	00006517          	auipc	a0,0x6
ffffffffc020916c:	2b050513          	addi	a0,a0,688 # ffffffffc020f418 <dev_node_ops+0x2b8>
ffffffffc0209170:	b2ef70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209174:	86aa                	mv	a3,a0
ffffffffc0209176:	00006617          	auipc	a2,0x6
ffffffffc020917a:	2ca60613          	addi	a2,a2,714 # ffffffffc020f440 <dev_node_ops+0x2e0>
ffffffffc020917e:	03d00593          	li	a1,61
ffffffffc0209182:	00006517          	auipc	a0,0x6
ffffffffc0209186:	29650513          	addi	a0,a0,662 # ffffffffc020f418 <dev_node_ops+0x2b8>
ffffffffc020918a:	b14f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020918e:	00006697          	auipc	a3,0x6
ffffffffc0209192:	caa68693          	addi	a3,a3,-854 # ffffffffc020ee38 <syscalls+0xb10>
ffffffffc0209196:	00003617          	auipc	a2,0x3
ffffffffc020919a:	b2260613          	addi	a2,a2,-1246 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020919e:	03900593          	li	a1,57
ffffffffc02091a2:	00006517          	auipc	a0,0x6
ffffffffc02091a6:	27650513          	addi	a0,a0,630 # ffffffffc020f418 <dev_node_ops+0x2b8>
ffffffffc02091aa:	af4f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02091ae <bitmap_translate.part.0>:
ffffffffc02091ae:	1141                	addi	sp,sp,-16
ffffffffc02091b0:	00006697          	auipc	a3,0x6
ffffffffc02091b4:	2b068693          	addi	a3,a3,688 # ffffffffc020f460 <dev_node_ops+0x300>
ffffffffc02091b8:	00003617          	auipc	a2,0x3
ffffffffc02091bc:	b0060613          	addi	a2,a2,-1280 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02091c0:	04c00593          	li	a1,76
ffffffffc02091c4:	00006517          	auipc	a0,0x6
ffffffffc02091c8:	2b450513          	addi	a0,a0,692 # ffffffffc020f478 <dev_node_ops+0x318>
ffffffffc02091cc:	e406                	sd	ra,8(sp)
ffffffffc02091ce:	ad0f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02091d2 <bitmap_create>:
ffffffffc02091d2:	7139                	addi	sp,sp,-64
ffffffffc02091d4:	fc06                	sd	ra,56(sp)
ffffffffc02091d6:	f822                	sd	s0,48(sp)
ffffffffc02091d8:	f426                	sd	s1,40(sp)
ffffffffc02091da:	f04a                	sd	s2,32(sp)
ffffffffc02091dc:	ec4e                	sd	s3,24(sp)
ffffffffc02091de:	e852                	sd	s4,16(sp)
ffffffffc02091e0:	e456                	sd	s5,8(sp)
ffffffffc02091e2:	c14d                	beqz	a0,ffffffffc0209284 <bitmap_create+0xb2>
ffffffffc02091e4:	842a                	mv	s0,a0
ffffffffc02091e6:	4541                	li	a0,16
ffffffffc02091e8:	da7f80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02091ec:	84aa                	mv	s1,a0
ffffffffc02091ee:	cd25                	beqz	a0,ffffffffc0209266 <bitmap_create+0x94>
ffffffffc02091f0:	02041a13          	slli	s4,s0,0x20
ffffffffc02091f4:	020a5a13          	srli	s4,s4,0x20
ffffffffc02091f8:	01fa0793          	addi	a5,s4,31
ffffffffc02091fc:	0057d993          	srli	s3,a5,0x5
ffffffffc0209200:	00299a93          	slli	s5,s3,0x2
ffffffffc0209204:	8556                	mv	a0,s5
ffffffffc0209206:	894e                	mv	s2,s3
ffffffffc0209208:	d87f80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020920c:	c53d                	beqz	a0,ffffffffc020927a <bitmap_create+0xa8>
ffffffffc020920e:	0134a223          	sw	s3,4(s1) # ffffffff80000004 <_binary_bin_sfs_img_size+0xffffffff7ff8ad04>
ffffffffc0209212:	c080                	sw	s0,0(s1)
ffffffffc0209214:	8656                	mv	a2,s5
ffffffffc0209216:	0ff00593          	li	a1,255
ffffffffc020921a:	5ba020ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc020921e:	e488                	sd	a0,8(s1)
ffffffffc0209220:	0996                	slli	s3,s3,0x5
ffffffffc0209222:	053a0263          	beq	s4,s3,ffffffffc0209266 <bitmap_create+0x94>
ffffffffc0209226:	fff9079b          	addiw	a5,s2,-1
ffffffffc020922a:	0057969b          	slliw	a3,a5,0x5
ffffffffc020922e:	0054561b          	srliw	a2,s0,0x5
ffffffffc0209232:	40d4073b          	subw	a4,s0,a3
ffffffffc0209236:	0054541b          	srliw	s0,s0,0x5
ffffffffc020923a:	08f61463          	bne	a2,a5,ffffffffc02092c2 <bitmap_create+0xf0>
ffffffffc020923e:	fff7069b          	addiw	a3,a4,-1
ffffffffc0209242:	47f9                	li	a5,30
ffffffffc0209244:	04d7ef63          	bltu	a5,a3,ffffffffc02092a2 <bitmap_create+0xd0>
ffffffffc0209248:	1402                	slli	s0,s0,0x20
ffffffffc020924a:	8079                	srli	s0,s0,0x1e
ffffffffc020924c:	9522                	add	a0,a0,s0
ffffffffc020924e:	411c                	lw	a5,0(a0)
ffffffffc0209250:	4585                	li	a1,1
ffffffffc0209252:	02000613          	li	a2,32
ffffffffc0209256:	00e596bb          	sllw	a3,a1,a4
ffffffffc020925a:	8fb5                	xor	a5,a5,a3
ffffffffc020925c:	2705                	addiw	a4,a4,1
ffffffffc020925e:	2781                	sext.w	a5,a5
ffffffffc0209260:	fec71be3          	bne	a4,a2,ffffffffc0209256 <bitmap_create+0x84>
ffffffffc0209264:	c11c                	sw	a5,0(a0)
ffffffffc0209266:	70e2                	ld	ra,56(sp)
ffffffffc0209268:	7442                	ld	s0,48(sp)
ffffffffc020926a:	7902                	ld	s2,32(sp)
ffffffffc020926c:	69e2                	ld	s3,24(sp)
ffffffffc020926e:	6a42                	ld	s4,16(sp)
ffffffffc0209270:	6aa2                	ld	s5,8(sp)
ffffffffc0209272:	8526                	mv	a0,s1
ffffffffc0209274:	74a2                	ld	s1,40(sp)
ffffffffc0209276:	6121                	addi	sp,sp,64
ffffffffc0209278:	8082                	ret
ffffffffc020927a:	8526                	mv	a0,s1
ffffffffc020927c:	dc3f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209280:	4481                	li	s1,0
ffffffffc0209282:	b7d5                	j	ffffffffc0209266 <bitmap_create+0x94>
ffffffffc0209284:	00006697          	auipc	a3,0x6
ffffffffc0209288:	20c68693          	addi	a3,a3,524 # ffffffffc020f490 <dev_node_ops+0x330>
ffffffffc020928c:	00003617          	auipc	a2,0x3
ffffffffc0209290:	a2c60613          	addi	a2,a2,-1492 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209294:	45d5                	li	a1,21
ffffffffc0209296:	00006517          	auipc	a0,0x6
ffffffffc020929a:	1e250513          	addi	a0,a0,482 # ffffffffc020f478 <dev_node_ops+0x318>
ffffffffc020929e:	a00f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02092a2:	00006697          	auipc	a3,0x6
ffffffffc02092a6:	22e68693          	addi	a3,a3,558 # ffffffffc020f4d0 <dev_node_ops+0x370>
ffffffffc02092aa:	00003617          	auipc	a2,0x3
ffffffffc02092ae:	a0e60613          	addi	a2,a2,-1522 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02092b2:	02b00593          	li	a1,43
ffffffffc02092b6:	00006517          	auipc	a0,0x6
ffffffffc02092ba:	1c250513          	addi	a0,a0,450 # ffffffffc020f478 <dev_node_ops+0x318>
ffffffffc02092be:	9e0f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02092c2:	00006697          	auipc	a3,0x6
ffffffffc02092c6:	1f668693          	addi	a3,a3,502 # ffffffffc020f4b8 <dev_node_ops+0x358>
ffffffffc02092ca:	00003617          	auipc	a2,0x3
ffffffffc02092ce:	9ee60613          	addi	a2,a2,-1554 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02092d2:	02a00593          	li	a1,42
ffffffffc02092d6:	00006517          	auipc	a0,0x6
ffffffffc02092da:	1a250513          	addi	a0,a0,418 # ffffffffc020f478 <dev_node_ops+0x318>
ffffffffc02092de:	9c0f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02092e2 <bitmap_alloc>:
ffffffffc02092e2:	4150                	lw	a2,4(a0)
ffffffffc02092e4:	651c                	ld	a5,8(a0)
ffffffffc02092e6:	c231                	beqz	a2,ffffffffc020932a <bitmap_alloc+0x48>
ffffffffc02092e8:	4701                	li	a4,0
ffffffffc02092ea:	a029                	j	ffffffffc02092f4 <bitmap_alloc+0x12>
ffffffffc02092ec:	2705                	addiw	a4,a4,1
ffffffffc02092ee:	0791                	addi	a5,a5,4
ffffffffc02092f0:	02e60d63          	beq	a2,a4,ffffffffc020932a <bitmap_alloc+0x48>
ffffffffc02092f4:	4394                	lw	a3,0(a5)
ffffffffc02092f6:	dafd                	beqz	a3,ffffffffc02092ec <bitmap_alloc+0xa>
ffffffffc02092f8:	4501                	li	a0,0
ffffffffc02092fa:	4885                	li	a7,1
ffffffffc02092fc:	8e36                	mv	t3,a3
ffffffffc02092fe:	02000313          	li	t1,32
ffffffffc0209302:	a021                	j	ffffffffc020930a <bitmap_alloc+0x28>
ffffffffc0209304:	2505                	addiw	a0,a0,1
ffffffffc0209306:	02650463          	beq	a0,t1,ffffffffc020932e <bitmap_alloc+0x4c>
ffffffffc020930a:	00a8983b          	sllw	a6,a7,a0
ffffffffc020930e:	0106f633          	and	a2,a3,a6
ffffffffc0209312:	2601                	sext.w	a2,a2
ffffffffc0209314:	da65                	beqz	a2,ffffffffc0209304 <bitmap_alloc+0x22>
ffffffffc0209316:	010e4833          	xor	a6,t3,a6
ffffffffc020931a:	0057171b          	slliw	a4,a4,0x5
ffffffffc020931e:	9f29                	addw	a4,a4,a0
ffffffffc0209320:	0107a023          	sw	a6,0(a5)
ffffffffc0209324:	c198                	sw	a4,0(a1)
ffffffffc0209326:	4501                	li	a0,0
ffffffffc0209328:	8082                	ret
ffffffffc020932a:	5571                	li	a0,-4
ffffffffc020932c:	8082                	ret
ffffffffc020932e:	1141                	addi	sp,sp,-16
ffffffffc0209330:	00004697          	auipc	a3,0x4
ffffffffc0209334:	a0868693          	addi	a3,a3,-1528 # ffffffffc020cd38 <default_pmm_manager+0x598>
ffffffffc0209338:	00003617          	auipc	a2,0x3
ffffffffc020933c:	98060613          	addi	a2,a2,-1664 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209340:	04300593          	li	a1,67
ffffffffc0209344:	00006517          	auipc	a0,0x6
ffffffffc0209348:	13450513          	addi	a0,a0,308 # ffffffffc020f478 <dev_node_ops+0x318>
ffffffffc020934c:	e406                	sd	ra,8(sp)
ffffffffc020934e:	950f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209352 <bitmap_test>:
ffffffffc0209352:	411c                	lw	a5,0(a0)
ffffffffc0209354:	00f5ff63          	bgeu	a1,a5,ffffffffc0209372 <bitmap_test+0x20>
ffffffffc0209358:	651c                	ld	a5,8(a0)
ffffffffc020935a:	0055d71b          	srliw	a4,a1,0x5
ffffffffc020935e:	070a                	slli	a4,a4,0x2
ffffffffc0209360:	97ba                	add	a5,a5,a4
ffffffffc0209362:	4388                	lw	a0,0(a5)
ffffffffc0209364:	4785                	li	a5,1
ffffffffc0209366:	00b795bb          	sllw	a1,a5,a1
ffffffffc020936a:	8d6d                	and	a0,a0,a1
ffffffffc020936c:	1502                	slli	a0,a0,0x20
ffffffffc020936e:	9101                	srli	a0,a0,0x20
ffffffffc0209370:	8082                	ret
ffffffffc0209372:	1141                	addi	sp,sp,-16
ffffffffc0209374:	e406                	sd	ra,8(sp)
ffffffffc0209376:	e39ff0ef          	jal	ra,ffffffffc02091ae <bitmap_translate.part.0>

ffffffffc020937a <bitmap_free>:
ffffffffc020937a:	411c                	lw	a5,0(a0)
ffffffffc020937c:	1141                	addi	sp,sp,-16
ffffffffc020937e:	e406                	sd	ra,8(sp)
ffffffffc0209380:	02f5f463          	bgeu	a1,a5,ffffffffc02093a8 <bitmap_free+0x2e>
ffffffffc0209384:	651c                	ld	a5,8(a0)
ffffffffc0209386:	0055d71b          	srliw	a4,a1,0x5
ffffffffc020938a:	070a                	slli	a4,a4,0x2
ffffffffc020938c:	97ba                	add	a5,a5,a4
ffffffffc020938e:	4398                	lw	a4,0(a5)
ffffffffc0209390:	4685                	li	a3,1
ffffffffc0209392:	00b695bb          	sllw	a1,a3,a1
ffffffffc0209396:	00b776b3          	and	a3,a4,a1
ffffffffc020939a:	2681                	sext.w	a3,a3
ffffffffc020939c:	ea81                	bnez	a3,ffffffffc02093ac <bitmap_free+0x32>
ffffffffc020939e:	60a2                	ld	ra,8(sp)
ffffffffc02093a0:	8f4d                	or	a4,a4,a1
ffffffffc02093a2:	c398                	sw	a4,0(a5)
ffffffffc02093a4:	0141                	addi	sp,sp,16
ffffffffc02093a6:	8082                	ret
ffffffffc02093a8:	e07ff0ef          	jal	ra,ffffffffc02091ae <bitmap_translate.part.0>
ffffffffc02093ac:	00006697          	auipc	a3,0x6
ffffffffc02093b0:	14c68693          	addi	a3,a3,332 # ffffffffc020f4f8 <dev_node_ops+0x398>
ffffffffc02093b4:	00003617          	auipc	a2,0x3
ffffffffc02093b8:	90460613          	addi	a2,a2,-1788 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02093bc:	05f00593          	li	a1,95
ffffffffc02093c0:	00006517          	auipc	a0,0x6
ffffffffc02093c4:	0b850513          	addi	a0,a0,184 # ffffffffc020f478 <dev_node_ops+0x318>
ffffffffc02093c8:	8d6f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02093cc <bitmap_destroy>:
ffffffffc02093cc:	1141                	addi	sp,sp,-16
ffffffffc02093ce:	e022                	sd	s0,0(sp)
ffffffffc02093d0:	842a                	mv	s0,a0
ffffffffc02093d2:	6508                	ld	a0,8(a0)
ffffffffc02093d4:	e406                	sd	ra,8(sp)
ffffffffc02093d6:	c69f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02093da:	8522                	mv	a0,s0
ffffffffc02093dc:	6402                	ld	s0,0(sp)
ffffffffc02093de:	60a2                	ld	ra,8(sp)
ffffffffc02093e0:	0141                	addi	sp,sp,16
ffffffffc02093e2:	c5df806f          	j	ffffffffc020203e <kfree>

ffffffffc02093e6 <bitmap_getdata>:
ffffffffc02093e6:	c589                	beqz	a1,ffffffffc02093f0 <bitmap_getdata+0xa>
ffffffffc02093e8:	00456783          	lwu	a5,4(a0)
ffffffffc02093ec:	078a                	slli	a5,a5,0x2
ffffffffc02093ee:	e19c                	sd	a5,0(a1)
ffffffffc02093f0:	6508                	ld	a0,8(a0)
ffffffffc02093f2:	8082                	ret

ffffffffc02093f4 <sfs_init>:
ffffffffc02093f4:	1141                	addi	sp,sp,-16
ffffffffc02093f6:	00006517          	auipc	a0,0x6
ffffffffc02093fa:	f7250513          	addi	a0,a0,-142 # ffffffffc020f368 <dev_node_ops+0x208>
ffffffffc02093fe:	e406                	sd	ra,8(sp)
ffffffffc0209400:	554000ef          	jal	ra,ffffffffc0209954 <sfs_mount>
ffffffffc0209404:	e501                	bnez	a0,ffffffffc020940c <sfs_init+0x18>
ffffffffc0209406:	60a2                	ld	ra,8(sp)
ffffffffc0209408:	0141                	addi	sp,sp,16
ffffffffc020940a:	8082                	ret
ffffffffc020940c:	86aa                	mv	a3,a0
ffffffffc020940e:	00006617          	auipc	a2,0x6
ffffffffc0209412:	0fa60613          	addi	a2,a2,250 # ffffffffc020f508 <dev_node_ops+0x3a8>
ffffffffc0209416:	45c1                	li	a1,16
ffffffffc0209418:	00006517          	auipc	a0,0x6
ffffffffc020941c:	11050513          	addi	a0,a0,272 # ffffffffc020f528 <dev_node_ops+0x3c8>
ffffffffc0209420:	87ef70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209424 <sfs_unmount>:
ffffffffc0209424:	1141                	addi	sp,sp,-16
ffffffffc0209426:	e406                	sd	ra,8(sp)
ffffffffc0209428:	e022                	sd	s0,0(sp)
ffffffffc020942a:	cd1d                	beqz	a0,ffffffffc0209468 <sfs_unmount+0x44>
ffffffffc020942c:	0b052783          	lw	a5,176(a0)
ffffffffc0209430:	842a                	mv	s0,a0
ffffffffc0209432:	eb9d                	bnez	a5,ffffffffc0209468 <sfs_unmount+0x44>
ffffffffc0209434:	7158                	ld	a4,160(a0)
ffffffffc0209436:	09850793          	addi	a5,a0,152
ffffffffc020943a:	02f71563          	bne	a4,a5,ffffffffc0209464 <sfs_unmount+0x40>
ffffffffc020943e:	613c                	ld	a5,64(a0)
ffffffffc0209440:	e7a1                	bnez	a5,ffffffffc0209488 <sfs_unmount+0x64>
ffffffffc0209442:	7d08                	ld	a0,56(a0)
ffffffffc0209444:	f89ff0ef          	jal	ra,ffffffffc02093cc <bitmap_destroy>
ffffffffc0209448:	6428                	ld	a0,72(s0)
ffffffffc020944a:	bf5f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020944e:	7448                	ld	a0,168(s0)
ffffffffc0209450:	beff80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209454:	8522                	mv	a0,s0
ffffffffc0209456:	be9f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020945a:	4501                	li	a0,0
ffffffffc020945c:	60a2                	ld	ra,8(sp)
ffffffffc020945e:	6402                	ld	s0,0(sp)
ffffffffc0209460:	0141                	addi	sp,sp,16
ffffffffc0209462:	8082                	ret
ffffffffc0209464:	5545                	li	a0,-15
ffffffffc0209466:	bfdd                	j	ffffffffc020945c <sfs_unmount+0x38>
ffffffffc0209468:	00006697          	auipc	a3,0x6
ffffffffc020946c:	0d868693          	addi	a3,a3,216 # ffffffffc020f540 <dev_node_ops+0x3e0>
ffffffffc0209470:	00003617          	auipc	a2,0x3
ffffffffc0209474:	84860613          	addi	a2,a2,-1976 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209478:	04100593          	li	a1,65
ffffffffc020947c:	00006517          	auipc	a0,0x6
ffffffffc0209480:	0f450513          	addi	a0,a0,244 # ffffffffc020f570 <dev_node_ops+0x410>
ffffffffc0209484:	81af70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209488:	00006697          	auipc	a3,0x6
ffffffffc020948c:	10068693          	addi	a3,a3,256 # ffffffffc020f588 <dev_node_ops+0x428>
ffffffffc0209490:	00003617          	auipc	a2,0x3
ffffffffc0209494:	82860613          	addi	a2,a2,-2008 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209498:	04500593          	li	a1,69
ffffffffc020949c:	00006517          	auipc	a0,0x6
ffffffffc02094a0:	0d450513          	addi	a0,a0,212 # ffffffffc020f570 <dev_node_ops+0x410>
ffffffffc02094a4:	ffbf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02094a8 <sfs_cleanup>:
ffffffffc02094a8:	1101                	addi	sp,sp,-32
ffffffffc02094aa:	ec06                	sd	ra,24(sp)
ffffffffc02094ac:	e822                	sd	s0,16(sp)
ffffffffc02094ae:	e426                	sd	s1,8(sp)
ffffffffc02094b0:	e04a                	sd	s2,0(sp)
ffffffffc02094b2:	c525                	beqz	a0,ffffffffc020951a <sfs_cleanup+0x72>
ffffffffc02094b4:	0b052783          	lw	a5,176(a0)
ffffffffc02094b8:	84aa                	mv	s1,a0
ffffffffc02094ba:	e3a5                	bnez	a5,ffffffffc020951a <sfs_cleanup+0x72>
ffffffffc02094bc:	4158                	lw	a4,4(a0)
ffffffffc02094be:	4514                	lw	a3,8(a0)
ffffffffc02094c0:	00c50913          	addi	s2,a0,12
ffffffffc02094c4:	85ca                	mv	a1,s2
ffffffffc02094c6:	40d7063b          	subw	a2,a4,a3
ffffffffc02094ca:	00006517          	auipc	a0,0x6
ffffffffc02094ce:	0d650513          	addi	a0,a0,214 # ffffffffc020f5a0 <dev_node_ops+0x440>
ffffffffc02094d2:	cd5f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02094d6:	02000413          	li	s0,32
ffffffffc02094da:	a019                	j	ffffffffc02094e0 <sfs_cleanup+0x38>
ffffffffc02094dc:	347d                	addiw	s0,s0,-1
ffffffffc02094de:	c819                	beqz	s0,ffffffffc02094f4 <sfs_cleanup+0x4c>
ffffffffc02094e0:	7cdc                	ld	a5,184(s1)
ffffffffc02094e2:	8526                	mv	a0,s1
ffffffffc02094e4:	9782                	jalr	a5
ffffffffc02094e6:	f97d                	bnez	a0,ffffffffc02094dc <sfs_cleanup+0x34>
ffffffffc02094e8:	60e2                	ld	ra,24(sp)
ffffffffc02094ea:	6442                	ld	s0,16(sp)
ffffffffc02094ec:	64a2                	ld	s1,8(sp)
ffffffffc02094ee:	6902                	ld	s2,0(sp)
ffffffffc02094f0:	6105                	addi	sp,sp,32
ffffffffc02094f2:	8082                	ret
ffffffffc02094f4:	6442                	ld	s0,16(sp)
ffffffffc02094f6:	60e2                	ld	ra,24(sp)
ffffffffc02094f8:	64a2                	ld	s1,8(sp)
ffffffffc02094fa:	86ca                	mv	a3,s2
ffffffffc02094fc:	6902                	ld	s2,0(sp)
ffffffffc02094fe:	872a                	mv	a4,a0
ffffffffc0209500:	00006617          	auipc	a2,0x6
ffffffffc0209504:	0c060613          	addi	a2,a2,192 # ffffffffc020f5c0 <dev_node_ops+0x460>
ffffffffc0209508:	05f00593          	li	a1,95
ffffffffc020950c:	00006517          	auipc	a0,0x6
ffffffffc0209510:	06450513          	addi	a0,a0,100 # ffffffffc020f570 <dev_node_ops+0x410>
ffffffffc0209514:	6105                	addi	sp,sp,32
ffffffffc0209516:	ff1f606f          	j	ffffffffc0200506 <__warn>
ffffffffc020951a:	00006697          	auipc	a3,0x6
ffffffffc020951e:	02668693          	addi	a3,a3,38 # ffffffffc020f540 <dev_node_ops+0x3e0>
ffffffffc0209522:	00002617          	auipc	a2,0x2
ffffffffc0209526:	79660613          	addi	a2,a2,1942 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020952a:	05400593          	li	a1,84
ffffffffc020952e:	00006517          	auipc	a0,0x6
ffffffffc0209532:	04250513          	addi	a0,a0,66 # ffffffffc020f570 <dev_node_ops+0x410>
ffffffffc0209536:	f69f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020953a <sfs_sync>:
ffffffffc020953a:	7179                	addi	sp,sp,-48
ffffffffc020953c:	f406                	sd	ra,40(sp)
ffffffffc020953e:	f022                	sd	s0,32(sp)
ffffffffc0209540:	ec26                	sd	s1,24(sp)
ffffffffc0209542:	e84a                	sd	s2,16(sp)
ffffffffc0209544:	e44e                	sd	s3,8(sp)
ffffffffc0209546:	e052                	sd	s4,0(sp)
ffffffffc0209548:	cd4d                	beqz	a0,ffffffffc0209602 <sfs_sync+0xc8>
ffffffffc020954a:	0b052783          	lw	a5,176(a0)
ffffffffc020954e:	8a2a                	mv	s4,a0
ffffffffc0209550:	ebcd                	bnez	a5,ffffffffc0209602 <sfs_sync+0xc8>
ffffffffc0209552:	52f010ef          	jal	ra,ffffffffc020b280 <lock_sfs_fs>
ffffffffc0209556:	0a0a3403          	ld	s0,160(s4)
ffffffffc020955a:	098a0913          	addi	s2,s4,152
ffffffffc020955e:	02890763          	beq	s2,s0,ffffffffc020958c <sfs_sync+0x52>
ffffffffc0209562:	00004997          	auipc	s3,0x4
ffffffffc0209566:	0de98993          	addi	s3,s3,222 # ffffffffc020d640 <default_pmm_manager+0xea0>
ffffffffc020956a:	7c1c                	ld	a5,56(s0)
ffffffffc020956c:	fc840493          	addi	s1,s0,-56
ffffffffc0209570:	cbb5                	beqz	a5,ffffffffc02095e4 <sfs_sync+0xaa>
ffffffffc0209572:	7b9c                	ld	a5,48(a5)
ffffffffc0209574:	cba5                	beqz	a5,ffffffffc02095e4 <sfs_sync+0xaa>
ffffffffc0209576:	85ce                	mv	a1,s3
ffffffffc0209578:	8526                	mv	a0,s1
ffffffffc020957a:	e28fe0ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc020957e:	7c1c                	ld	a5,56(s0)
ffffffffc0209580:	8526                	mv	a0,s1
ffffffffc0209582:	7b9c                	ld	a5,48(a5)
ffffffffc0209584:	9782                	jalr	a5
ffffffffc0209586:	6400                	ld	s0,8(s0)
ffffffffc0209588:	fe8911e3          	bne	s2,s0,ffffffffc020956a <sfs_sync+0x30>
ffffffffc020958c:	8552                	mv	a0,s4
ffffffffc020958e:	503010ef          	jal	ra,ffffffffc020b290 <unlock_sfs_fs>
ffffffffc0209592:	040a3783          	ld	a5,64(s4)
ffffffffc0209596:	4501                	li	a0,0
ffffffffc0209598:	eb89                	bnez	a5,ffffffffc02095aa <sfs_sync+0x70>
ffffffffc020959a:	70a2                	ld	ra,40(sp)
ffffffffc020959c:	7402                	ld	s0,32(sp)
ffffffffc020959e:	64e2                	ld	s1,24(sp)
ffffffffc02095a0:	6942                	ld	s2,16(sp)
ffffffffc02095a2:	69a2                	ld	s3,8(sp)
ffffffffc02095a4:	6a02                	ld	s4,0(sp)
ffffffffc02095a6:	6145                	addi	sp,sp,48
ffffffffc02095a8:	8082                	ret
ffffffffc02095aa:	040a3023          	sd	zero,64(s4)
ffffffffc02095ae:	8552                	mv	a0,s4
ffffffffc02095b0:	3b5010ef          	jal	ra,ffffffffc020b164 <sfs_sync_super>
ffffffffc02095b4:	cd01                	beqz	a0,ffffffffc02095cc <sfs_sync+0x92>
ffffffffc02095b6:	70a2                	ld	ra,40(sp)
ffffffffc02095b8:	7402                	ld	s0,32(sp)
ffffffffc02095ba:	4785                	li	a5,1
ffffffffc02095bc:	04fa3023          	sd	a5,64(s4)
ffffffffc02095c0:	64e2                	ld	s1,24(sp)
ffffffffc02095c2:	6942                	ld	s2,16(sp)
ffffffffc02095c4:	69a2                	ld	s3,8(sp)
ffffffffc02095c6:	6a02                	ld	s4,0(sp)
ffffffffc02095c8:	6145                	addi	sp,sp,48
ffffffffc02095ca:	8082                	ret
ffffffffc02095cc:	8552                	mv	a0,s4
ffffffffc02095ce:	3dd010ef          	jal	ra,ffffffffc020b1aa <sfs_sync_freemap>
ffffffffc02095d2:	f175                	bnez	a0,ffffffffc02095b6 <sfs_sync+0x7c>
ffffffffc02095d4:	70a2                	ld	ra,40(sp)
ffffffffc02095d6:	7402                	ld	s0,32(sp)
ffffffffc02095d8:	64e2                	ld	s1,24(sp)
ffffffffc02095da:	6942                	ld	s2,16(sp)
ffffffffc02095dc:	69a2                	ld	s3,8(sp)
ffffffffc02095de:	6a02                	ld	s4,0(sp)
ffffffffc02095e0:	6145                	addi	sp,sp,48
ffffffffc02095e2:	8082                	ret
ffffffffc02095e4:	00004697          	auipc	a3,0x4
ffffffffc02095e8:	00c68693          	addi	a3,a3,12 # ffffffffc020d5f0 <default_pmm_manager+0xe50>
ffffffffc02095ec:	00002617          	auipc	a2,0x2
ffffffffc02095f0:	6cc60613          	addi	a2,a2,1740 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02095f4:	45ed                	li	a1,27
ffffffffc02095f6:	00006517          	auipc	a0,0x6
ffffffffc02095fa:	f7a50513          	addi	a0,a0,-134 # ffffffffc020f570 <dev_node_ops+0x410>
ffffffffc02095fe:	ea1f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209602:	00006697          	auipc	a3,0x6
ffffffffc0209606:	f3e68693          	addi	a3,a3,-194 # ffffffffc020f540 <dev_node_ops+0x3e0>
ffffffffc020960a:	00002617          	auipc	a2,0x2
ffffffffc020960e:	6ae60613          	addi	a2,a2,1710 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209612:	45d5                	li	a1,21
ffffffffc0209614:	00006517          	auipc	a0,0x6
ffffffffc0209618:	f5c50513          	addi	a0,a0,-164 # ffffffffc020f570 <dev_node_ops+0x410>
ffffffffc020961c:	e83f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209620 <sfs_get_root>:
ffffffffc0209620:	1101                	addi	sp,sp,-32
ffffffffc0209622:	ec06                	sd	ra,24(sp)
ffffffffc0209624:	cd09                	beqz	a0,ffffffffc020963e <sfs_get_root+0x1e>
ffffffffc0209626:	0b052783          	lw	a5,176(a0)
ffffffffc020962a:	eb91                	bnez	a5,ffffffffc020963e <sfs_get_root+0x1e>
ffffffffc020962c:	4605                	li	a2,1
ffffffffc020962e:	002c                	addi	a1,sp,8
ffffffffc0209630:	366010ef          	jal	ra,ffffffffc020a996 <sfs_load_inode>
ffffffffc0209634:	e50d                	bnez	a0,ffffffffc020965e <sfs_get_root+0x3e>
ffffffffc0209636:	60e2                	ld	ra,24(sp)
ffffffffc0209638:	6522                	ld	a0,8(sp)
ffffffffc020963a:	6105                	addi	sp,sp,32
ffffffffc020963c:	8082                	ret
ffffffffc020963e:	00006697          	auipc	a3,0x6
ffffffffc0209642:	f0268693          	addi	a3,a3,-254 # ffffffffc020f540 <dev_node_ops+0x3e0>
ffffffffc0209646:	00002617          	auipc	a2,0x2
ffffffffc020964a:	67260613          	addi	a2,a2,1650 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020964e:	03600593          	li	a1,54
ffffffffc0209652:	00006517          	auipc	a0,0x6
ffffffffc0209656:	f1e50513          	addi	a0,a0,-226 # ffffffffc020f570 <dev_node_ops+0x410>
ffffffffc020965a:	e45f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020965e:	86aa                	mv	a3,a0
ffffffffc0209660:	00006617          	auipc	a2,0x6
ffffffffc0209664:	f8060613          	addi	a2,a2,-128 # ffffffffc020f5e0 <dev_node_ops+0x480>
ffffffffc0209668:	03700593          	li	a1,55
ffffffffc020966c:	00006517          	auipc	a0,0x6
ffffffffc0209670:	f0450513          	addi	a0,a0,-252 # ffffffffc020f570 <dev_node_ops+0x410>
ffffffffc0209674:	e2bf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209678 <sfs_do_mount>:
ffffffffc0209678:	6518                	ld	a4,8(a0)
ffffffffc020967a:	7171                	addi	sp,sp,-176
ffffffffc020967c:	f506                	sd	ra,168(sp)
ffffffffc020967e:	f122                	sd	s0,160(sp)
ffffffffc0209680:	ed26                	sd	s1,152(sp)
ffffffffc0209682:	e94a                	sd	s2,144(sp)
ffffffffc0209684:	e54e                	sd	s3,136(sp)
ffffffffc0209686:	e152                	sd	s4,128(sp)
ffffffffc0209688:	fcd6                	sd	s5,120(sp)
ffffffffc020968a:	f8da                	sd	s6,112(sp)
ffffffffc020968c:	f4de                	sd	s7,104(sp)
ffffffffc020968e:	f0e2                	sd	s8,96(sp)
ffffffffc0209690:	ece6                	sd	s9,88(sp)
ffffffffc0209692:	e8ea                	sd	s10,80(sp)
ffffffffc0209694:	e4ee                	sd	s11,72(sp)
ffffffffc0209696:	6785                	lui	a5,0x1
ffffffffc0209698:	24f71663          	bne	a4,a5,ffffffffc02098e4 <sfs_do_mount+0x26c>
ffffffffc020969c:	892a                	mv	s2,a0
ffffffffc020969e:	4501                	li	a0,0
ffffffffc02096a0:	8aae                	mv	s5,a1
ffffffffc02096a2:	f00fe0ef          	jal	ra,ffffffffc0207da2 <__alloc_fs>
ffffffffc02096a6:	842a                	mv	s0,a0
ffffffffc02096a8:	24050463          	beqz	a0,ffffffffc02098f0 <sfs_do_mount+0x278>
ffffffffc02096ac:	0b052b03          	lw	s6,176(a0)
ffffffffc02096b0:	260b1263          	bnez	s6,ffffffffc0209914 <sfs_do_mount+0x29c>
ffffffffc02096b4:	03253823          	sd	s2,48(a0)
ffffffffc02096b8:	6505                	lui	a0,0x1
ffffffffc02096ba:	8d5f80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02096be:	e428                	sd	a0,72(s0)
ffffffffc02096c0:	84aa                	mv	s1,a0
ffffffffc02096c2:	16050363          	beqz	a0,ffffffffc0209828 <sfs_do_mount+0x1b0>
ffffffffc02096c6:	85aa                	mv	a1,a0
ffffffffc02096c8:	4681                	li	a3,0
ffffffffc02096ca:	6605                	lui	a2,0x1
ffffffffc02096cc:	1008                	addi	a0,sp,32
ffffffffc02096ce:	ca9fb0ef          	jal	ra,ffffffffc0205376 <iobuf_init>
ffffffffc02096d2:	02093783          	ld	a5,32(s2)
ffffffffc02096d6:	85aa                	mv	a1,a0
ffffffffc02096d8:	4601                	li	a2,0
ffffffffc02096da:	854a                	mv	a0,s2
ffffffffc02096dc:	9782                	jalr	a5
ffffffffc02096de:	8a2a                	mv	s4,a0
ffffffffc02096e0:	10051e63          	bnez	a0,ffffffffc02097fc <sfs_do_mount+0x184>
ffffffffc02096e4:	408c                	lw	a1,0(s1)
ffffffffc02096e6:	2f8dc637          	lui	a2,0x2f8dc
ffffffffc02096ea:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f866b2a>
ffffffffc02096ee:	14c59863          	bne	a1,a2,ffffffffc020983e <sfs_do_mount+0x1c6>
ffffffffc02096f2:	40dc                	lw	a5,4(s1)
ffffffffc02096f4:	00093603          	ld	a2,0(s2)
ffffffffc02096f8:	02079713          	slli	a4,a5,0x20
ffffffffc02096fc:	9301                	srli	a4,a4,0x20
ffffffffc02096fe:	12e66763          	bltu	a2,a4,ffffffffc020982c <sfs_do_mount+0x1b4>
ffffffffc0209702:	020485a3          	sb	zero,43(s1)
ffffffffc0209706:	0084af03          	lw	t5,8(s1)
ffffffffc020970a:	00c4ae83          	lw	t4,12(s1)
ffffffffc020970e:	0104ae03          	lw	t3,16(s1)
ffffffffc0209712:	0144a303          	lw	t1,20(s1)
ffffffffc0209716:	0184a883          	lw	a7,24(s1)
ffffffffc020971a:	01c4a803          	lw	a6,28(s1)
ffffffffc020971e:	5090                	lw	a2,32(s1)
ffffffffc0209720:	50d4                	lw	a3,36(s1)
ffffffffc0209722:	5498                	lw	a4,40(s1)
ffffffffc0209724:	6511                	lui	a0,0x4
ffffffffc0209726:	c00c                	sw	a1,0(s0)
ffffffffc0209728:	c05c                	sw	a5,4(s0)
ffffffffc020972a:	01e42423          	sw	t5,8(s0)
ffffffffc020972e:	01d42623          	sw	t4,12(s0)
ffffffffc0209732:	01c42823          	sw	t3,16(s0)
ffffffffc0209736:	00642a23          	sw	t1,20(s0)
ffffffffc020973a:	01142c23          	sw	a7,24(s0)
ffffffffc020973e:	01042e23          	sw	a6,28(s0)
ffffffffc0209742:	d010                	sw	a2,32(s0)
ffffffffc0209744:	d054                	sw	a3,36(s0)
ffffffffc0209746:	d418                	sw	a4,40(s0)
ffffffffc0209748:	847f80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020974c:	f448                	sd	a0,168(s0)
ffffffffc020974e:	8c2a                	mv	s8,a0
ffffffffc0209750:	18050c63          	beqz	a0,ffffffffc02098e8 <sfs_do_mount+0x270>
ffffffffc0209754:	6711                	lui	a4,0x4
ffffffffc0209756:	87aa                	mv	a5,a0
ffffffffc0209758:	972a                	add	a4,a4,a0
ffffffffc020975a:	e79c                	sd	a5,8(a5)
ffffffffc020975c:	e39c                	sd	a5,0(a5)
ffffffffc020975e:	07c1                	addi	a5,a5,16
ffffffffc0209760:	fee79de3          	bne	a5,a4,ffffffffc020975a <sfs_do_mount+0xe2>
ffffffffc0209764:	0044eb83          	lwu	s7,4(s1)
ffffffffc0209768:	67a1                	lui	a5,0x8
ffffffffc020976a:	fff78993          	addi	s3,a5,-1 # 7fff <_binary_bin_swap_img_size+0x2ff>
ffffffffc020976e:	9bce                	add	s7,s7,s3
ffffffffc0209770:	77e1                	lui	a5,0xffff8
ffffffffc0209772:	00fbfbb3          	and	s7,s7,a5
ffffffffc0209776:	2b81                	sext.w	s7,s7
ffffffffc0209778:	855e                	mv	a0,s7
ffffffffc020977a:	a59ff0ef          	jal	ra,ffffffffc02091d2 <bitmap_create>
ffffffffc020977e:	fc08                	sd	a0,56(s0)
ffffffffc0209780:	8d2a                	mv	s10,a0
ffffffffc0209782:	14050f63          	beqz	a0,ffffffffc02098e0 <sfs_do_mount+0x268>
ffffffffc0209786:	0044e783          	lwu	a5,4(s1)
ffffffffc020978a:	082c                	addi	a1,sp,24
ffffffffc020978c:	97ce                	add	a5,a5,s3
ffffffffc020978e:	00f7d713          	srli	a4,a5,0xf
ffffffffc0209792:	e43a                	sd	a4,8(sp)
ffffffffc0209794:	40f7d993          	srai	s3,a5,0xf
ffffffffc0209798:	c4fff0ef          	jal	ra,ffffffffc02093e6 <bitmap_getdata>
ffffffffc020979c:	14050c63          	beqz	a0,ffffffffc02098f4 <sfs_do_mount+0x27c>
ffffffffc02097a0:	00c9979b          	slliw	a5,s3,0xc
ffffffffc02097a4:	66e2                	ld	a3,24(sp)
ffffffffc02097a6:	1782                	slli	a5,a5,0x20
ffffffffc02097a8:	9381                	srli	a5,a5,0x20
ffffffffc02097aa:	14d79563          	bne	a5,a3,ffffffffc02098f4 <sfs_do_mount+0x27c>
ffffffffc02097ae:	6722                	ld	a4,8(sp)
ffffffffc02097b0:	6d89                	lui	s11,0x2
ffffffffc02097b2:	89aa                	mv	s3,a0
ffffffffc02097b4:	00c71c93          	slli	s9,a4,0xc
ffffffffc02097b8:	9caa                	add	s9,s9,a0
ffffffffc02097ba:	40ad8dbb          	subw	s11,s11,a0
ffffffffc02097be:	e711                	bnez	a4,ffffffffc02097ca <sfs_do_mount+0x152>
ffffffffc02097c0:	a079                	j	ffffffffc020984e <sfs_do_mount+0x1d6>
ffffffffc02097c2:	6785                	lui	a5,0x1
ffffffffc02097c4:	99be                	add	s3,s3,a5
ffffffffc02097c6:	093c8463          	beq	s9,s3,ffffffffc020984e <sfs_do_mount+0x1d6>
ffffffffc02097ca:	013d86bb          	addw	a3,s11,s3
ffffffffc02097ce:	1682                	slli	a3,a3,0x20
ffffffffc02097d0:	6605                	lui	a2,0x1
ffffffffc02097d2:	85ce                	mv	a1,s3
ffffffffc02097d4:	9281                	srli	a3,a3,0x20
ffffffffc02097d6:	1008                	addi	a0,sp,32
ffffffffc02097d8:	b9ffb0ef          	jal	ra,ffffffffc0205376 <iobuf_init>
ffffffffc02097dc:	02093783          	ld	a5,32(s2)
ffffffffc02097e0:	85aa                	mv	a1,a0
ffffffffc02097e2:	4601                	li	a2,0
ffffffffc02097e4:	854a                	mv	a0,s2
ffffffffc02097e6:	9782                	jalr	a5
ffffffffc02097e8:	dd69                	beqz	a0,ffffffffc02097c2 <sfs_do_mount+0x14a>
ffffffffc02097ea:	e42a                	sd	a0,8(sp)
ffffffffc02097ec:	856a                	mv	a0,s10
ffffffffc02097ee:	bdfff0ef          	jal	ra,ffffffffc02093cc <bitmap_destroy>
ffffffffc02097f2:	67a2                	ld	a5,8(sp)
ffffffffc02097f4:	8a3e                	mv	s4,a5
ffffffffc02097f6:	8562                	mv	a0,s8
ffffffffc02097f8:	847f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02097fc:	8526                	mv	a0,s1
ffffffffc02097fe:	841f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209802:	8522                	mv	a0,s0
ffffffffc0209804:	83bf80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209808:	70aa                	ld	ra,168(sp)
ffffffffc020980a:	740a                	ld	s0,160(sp)
ffffffffc020980c:	64ea                	ld	s1,152(sp)
ffffffffc020980e:	694a                	ld	s2,144(sp)
ffffffffc0209810:	69aa                	ld	s3,136(sp)
ffffffffc0209812:	7ae6                	ld	s5,120(sp)
ffffffffc0209814:	7b46                	ld	s6,112(sp)
ffffffffc0209816:	7ba6                	ld	s7,104(sp)
ffffffffc0209818:	7c06                	ld	s8,96(sp)
ffffffffc020981a:	6ce6                	ld	s9,88(sp)
ffffffffc020981c:	6d46                	ld	s10,80(sp)
ffffffffc020981e:	6da6                	ld	s11,72(sp)
ffffffffc0209820:	8552                	mv	a0,s4
ffffffffc0209822:	6a0a                	ld	s4,128(sp)
ffffffffc0209824:	614d                	addi	sp,sp,176
ffffffffc0209826:	8082                	ret
ffffffffc0209828:	5a71                	li	s4,-4
ffffffffc020982a:	bfe1                	j	ffffffffc0209802 <sfs_do_mount+0x18a>
ffffffffc020982c:	85be                	mv	a1,a5
ffffffffc020982e:	00006517          	auipc	a0,0x6
ffffffffc0209832:	e0a50513          	addi	a0,a0,-502 # ffffffffc020f638 <dev_node_ops+0x4d8>
ffffffffc0209836:	971f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020983a:	5a75                	li	s4,-3
ffffffffc020983c:	b7c1                	j	ffffffffc02097fc <sfs_do_mount+0x184>
ffffffffc020983e:	00006517          	auipc	a0,0x6
ffffffffc0209842:	dc250513          	addi	a0,a0,-574 # ffffffffc020f600 <dev_node_ops+0x4a0>
ffffffffc0209846:	961f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020984a:	5a75                	li	s4,-3
ffffffffc020984c:	bf45                	j	ffffffffc02097fc <sfs_do_mount+0x184>
ffffffffc020984e:	00442903          	lw	s2,4(s0)
ffffffffc0209852:	4481                	li	s1,0
ffffffffc0209854:	080b8c63          	beqz	s7,ffffffffc02098ec <sfs_do_mount+0x274>
ffffffffc0209858:	85a6                	mv	a1,s1
ffffffffc020985a:	856a                	mv	a0,s10
ffffffffc020985c:	af7ff0ef          	jal	ra,ffffffffc0209352 <bitmap_test>
ffffffffc0209860:	c111                	beqz	a0,ffffffffc0209864 <sfs_do_mount+0x1ec>
ffffffffc0209862:	2b05                	addiw	s6,s6,1
ffffffffc0209864:	2485                	addiw	s1,s1,1
ffffffffc0209866:	fe9b99e3          	bne	s7,s1,ffffffffc0209858 <sfs_do_mount+0x1e0>
ffffffffc020986a:	441c                	lw	a5,8(s0)
ffffffffc020986c:	0d679463          	bne	a5,s6,ffffffffc0209934 <sfs_do_mount+0x2bc>
ffffffffc0209870:	4585                	li	a1,1
ffffffffc0209872:	05040513          	addi	a0,s0,80
ffffffffc0209876:	04043023          	sd	zero,64(s0)
ffffffffc020987a:	ce1fa0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc020987e:	4585                	li	a1,1
ffffffffc0209880:	06840513          	addi	a0,s0,104
ffffffffc0209884:	cd7fa0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0209888:	4585                	li	a1,1
ffffffffc020988a:	08040513          	addi	a0,s0,128
ffffffffc020988e:	ccdfa0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0209892:	09840793          	addi	a5,s0,152
ffffffffc0209896:	f05c                	sd	a5,160(s0)
ffffffffc0209898:	ec5c                	sd	a5,152(s0)
ffffffffc020989a:	874a                	mv	a4,s2
ffffffffc020989c:	86da                	mv	a3,s6
ffffffffc020989e:	4169063b          	subw	a2,s2,s6
ffffffffc02098a2:	00c40593          	addi	a1,s0,12
ffffffffc02098a6:	00006517          	auipc	a0,0x6
ffffffffc02098aa:	e2250513          	addi	a0,a0,-478 # ffffffffc020f6c8 <dev_node_ops+0x568>
ffffffffc02098ae:	8f9f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02098b2:	00000797          	auipc	a5,0x0
ffffffffc02098b6:	c8878793          	addi	a5,a5,-888 # ffffffffc020953a <sfs_sync>
ffffffffc02098ba:	fc5c                	sd	a5,184(s0)
ffffffffc02098bc:	00000797          	auipc	a5,0x0
ffffffffc02098c0:	d6478793          	addi	a5,a5,-668 # ffffffffc0209620 <sfs_get_root>
ffffffffc02098c4:	e07c                	sd	a5,192(s0)
ffffffffc02098c6:	00000797          	auipc	a5,0x0
ffffffffc02098ca:	b5e78793          	addi	a5,a5,-1186 # ffffffffc0209424 <sfs_unmount>
ffffffffc02098ce:	e47c                	sd	a5,200(s0)
ffffffffc02098d0:	00000797          	auipc	a5,0x0
ffffffffc02098d4:	bd878793          	addi	a5,a5,-1064 # ffffffffc02094a8 <sfs_cleanup>
ffffffffc02098d8:	e87c                	sd	a5,208(s0)
ffffffffc02098da:	008ab023          	sd	s0,0(s5)
ffffffffc02098de:	b72d                	j	ffffffffc0209808 <sfs_do_mount+0x190>
ffffffffc02098e0:	5a71                	li	s4,-4
ffffffffc02098e2:	bf11                	j	ffffffffc02097f6 <sfs_do_mount+0x17e>
ffffffffc02098e4:	5a49                	li	s4,-14
ffffffffc02098e6:	b70d                	j	ffffffffc0209808 <sfs_do_mount+0x190>
ffffffffc02098e8:	5a71                	li	s4,-4
ffffffffc02098ea:	bf09                	j	ffffffffc02097fc <sfs_do_mount+0x184>
ffffffffc02098ec:	4b01                	li	s6,0
ffffffffc02098ee:	bfb5                	j	ffffffffc020986a <sfs_do_mount+0x1f2>
ffffffffc02098f0:	5a71                	li	s4,-4
ffffffffc02098f2:	bf19                	j	ffffffffc0209808 <sfs_do_mount+0x190>
ffffffffc02098f4:	00006697          	auipc	a3,0x6
ffffffffc02098f8:	d7468693          	addi	a3,a3,-652 # ffffffffc020f668 <dev_node_ops+0x508>
ffffffffc02098fc:	00002617          	auipc	a2,0x2
ffffffffc0209900:	3bc60613          	addi	a2,a2,956 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209904:	08300593          	li	a1,131
ffffffffc0209908:	00006517          	auipc	a0,0x6
ffffffffc020990c:	c6850513          	addi	a0,a0,-920 # ffffffffc020f570 <dev_node_ops+0x410>
ffffffffc0209910:	b8ff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209914:	00006697          	auipc	a3,0x6
ffffffffc0209918:	c2c68693          	addi	a3,a3,-980 # ffffffffc020f540 <dev_node_ops+0x3e0>
ffffffffc020991c:	00002617          	auipc	a2,0x2
ffffffffc0209920:	39c60613          	addi	a2,a2,924 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209924:	0a300593          	li	a1,163
ffffffffc0209928:	00006517          	auipc	a0,0x6
ffffffffc020992c:	c4850513          	addi	a0,a0,-952 # ffffffffc020f570 <dev_node_ops+0x410>
ffffffffc0209930:	b6ff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209934:	00006697          	auipc	a3,0x6
ffffffffc0209938:	d6468693          	addi	a3,a3,-668 # ffffffffc020f698 <dev_node_ops+0x538>
ffffffffc020993c:	00002617          	auipc	a2,0x2
ffffffffc0209940:	37c60613          	addi	a2,a2,892 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209944:	0e000593          	li	a1,224
ffffffffc0209948:	00006517          	auipc	a0,0x6
ffffffffc020994c:	c2850513          	addi	a0,a0,-984 # ffffffffc020f570 <dev_node_ops+0x410>
ffffffffc0209950:	b4ff60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209954 <sfs_mount>:
ffffffffc0209954:	00000597          	auipc	a1,0x0
ffffffffc0209958:	d2458593          	addi	a1,a1,-732 # ffffffffc0209678 <sfs_do_mount>
ffffffffc020995c:	817fe06f          	j	ffffffffc0208172 <vfs_mount>

ffffffffc0209960 <sfs_opendir>:
ffffffffc0209960:	0235f593          	andi	a1,a1,35
ffffffffc0209964:	4501                	li	a0,0
ffffffffc0209966:	e191                	bnez	a1,ffffffffc020996a <sfs_opendir+0xa>
ffffffffc0209968:	8082                	ret
ffffffffc020996a:	553d                	li	a0,-17
ffffffffc020996c:	8082                	ret

ffffffffc020996e <sfs_openfile>:
ffffffffc020996e:	4501                	li	a0,0
ffffffffc0209970:	8082                	ret

ffffffffc0209972 <sfs_gettype>:
ffffffffc0209972:	1141                	addi	sp,sp,-16
ffffffffc0209974:	e406                	sd	ra,8(sp)
ffffffffc0209976:	c939                	beqz	a0,ffffffffc02099cc <sfs_gettype+0x5a>
ffffffffc0209978:	4d34                	lw	a3,88(a0)
ffffffffc020997a:	6785                	lui	a5,0x1
ffffffffc020997c:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209980:	04e69663          	bne	a3,a4,ffffffffc02099cc <sfs_gettype+0x5a>
ffffffffc0209984:	6114                	ld	a3,0(a0)
ffffffffc0209986:	4709                	li	a4,2
ffffffffc0209988:	0046d683          	lhu	a3,4(a3)
ffffffffc020998c:	02e68a63          	beq	a3,a4,ffffffffc02099c0 <sfs_gettype+0x4e>
ffffffffc0209990:	470d                	li	a4,3
ffffffffc0209992:	02e68163          	beq	a3,a4,ffffffffc02099b4 <sfs_gettype+0x42>
ffffffffc0209996:	4705                	li	a4,1
ffffffffc0209998:	00e68f63          	beq	a3,a4,ffffffffc02099b6 <sfs_gettype+0x44>
ffffffffc020999c:	00006617          	auipc	a2,0x6
ffffffffc02099a0:	d9c60613          	addi	a2,a2,-612 # ffffffffc020f738 <dev_node_ops+0x5d8>
ffffffffc02099a4:	3a800593          	li	a1,936
ffffffffc02099a8:	00006517          	auipc	a0,0x6
ffffffffc02099ac:	d7850513          	addi	a0,a0,-648 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc02099b0:	aeff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02099b4:	678d                	lui	a5,0x3
ffffffffc02099b6:	60a2                	ld	ra,8(sp)
ffffffffc02099b8:	c19c                	sw	a5,0(a1)
ffffffffc02099ba:	4501                	li	a0,0
ffffffffc02099bc:	0141                	addi	sp,sp,16
ffffffffc02099be:	8082                	ret
ffffffffc02099c0:	60a2                	ld	ra,8(sp)
ffffffffc02099c2:	6789                	lui	a5,0x2
ffffffffc02099c4:	c19c                	sw	a5,0(a1)
ffffffffc02099c6:	4501                	li	a0,0
ffffffffc02099c8:	0141                	addi	sp,sp,16
ffffffffc02099ca:	8082                	ret
ffffffffc02099cc:	00006697          	auipc	a3,0x6
ffffffffc02099d0:	d1c68693          	addi	a3,a3,-740 # ffffffffc020f6e8 <dev_node_ops+0x588>
ffffffffc02099d4:	00002617          	auipc	a2,0x2
ffffffffc02099d8:	2e460613          	addi	a2,a2,740 # ffffffffc020bcb8 <commands+0x210>
ffffffffc02099dc:	39c00593          	li	a1,924
ffffffffc02099e0:	00006517          	auipc	a0,0x6
ffffffffc02099e4:	d4050513          	addi	a0,a0,-704 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc02099e8:	ab7f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02099ec <sfs_fsync>:
ffffffffc02099ec:	7179                	addi	sp,sp,-48
ffffffffc02099ee:	ec26                	sd	s1,24(sp)
ffffffffc02099f0:	7524                	ld	s1,104(a0)
ffffffffc02099f2:	f406                	sd	ra,40(sp)
ffffffffc02099f4:	f022                	sd	s0,32(sp)
ffffffffc02099f6:	e84a                	sd	s2,16(sp)
ffffffffc02099f8:	e44e                	sd	s3,8(sp)
ffffffffc02099fa:	c4bd                	beqz	s1,ffffffffc0209a68 <sfs_fsync+0x7c>
ffffffffc02099fc:	0b04a783          	lw	a5,176(s1)
ffffffffc0209a00:	e7a5                	bnez	a5,ffffffffc0209a68 <sfs_fsync+0x7c>
ffffffffc0209a02:	4d38                	lw	a4,88(a0)
ffffffffc0209a04:	6785                	lui	a5,0x1
ffffffffc0209a06:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209a0a:	842a                	mv	s0,a0
ffffffffc0209a0c:	06f71e63          	bne	a4,a5,ffffffffc0209a88 <sfs_fsync+0x9c>
ffffffffc0209a10:	691c                	ld	a5,16(a0)
ffffffffc0209a12:	4901                	li	s2,0
ffffffffc0209a14:	eb89                	bnez	a5,ffffffffc0209a26 <sfs_fsync+0x3a>
ffffffffc0209a16:	70a2                	ld	ra,40(sp)
ffffffffc0209a18:	7402                	ld	s0,32(sp)
ffffffffc0209a1a:	64e2                	ld	s1,24(sp)
ffffffffc0209a1c:	69a2                	ld	s3,8(sp)
ffffffffc0209a1e:	854a                	mv	a0,s2
ffffffffc0209a20:	6942                	ld	s2,16(sp)
ffffffffc0209a22:	6145                	addi	sp,sp,48
ffffffffc0209a24:	8082                	ret
ffffffffc0209a26:	02050993          	addi	s3,a0,32
ffffffffc0209a2a:	854e                	mv	a0,s3
ffffffffc0209a2c:	b39fa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0209a30:	681c                	ld	a5,16(s0)
ffffffffc0209a32:	ef81                	bnez	a5,ffffffffc0209a4a <sfs_fsync+0x5e>
ffffffffc0209a34:	854e                	mv	a0,s3
ffffffffc0209a36:	b2bfa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0209a3a:	70a2                	ld	ra,40(sp)
ffffffffc0209a3c:	7402                	ld	s0,32(sp)
ffffffffc0209a3e:	64e2                	ld	s1,24(sp)
ffffffffc0209a40:	69a2                	ld	s3,8(sp)
ffffffffc0209a42:	854a                	mv	a0,s2
ffffffffc0209a44:	6942                	ld	s2,16(sp)
ffffffffc0209a46:	6145                	addi	sp,sp,48
ffffffffc0209a48:	8082                	ret
ffffffffc0209a4a:	4414                	lw	a3,8(s0)
ffffffffc0209a4c:	600c                	ld	a1,0(s0)
ffffffffc0209a4e:	00043823          	sd	zero,16(s0)
ffffffffc0209a52:	4701                	li	a4,0
ffffffffc0209a54:	04000613          	li	a2,64
ffffffffc0209a58:	8526                	mv	a0,s1
ffffffffc0209a5a:	676010ef          	jal	ra,ffffffffc020b0d0 <sfs_wbuf>
ffffffffc0209a5e:	892a                	mv	s2,a0
ffffffffc0209a60:	d971                	beqz	a0,ffffffffc0209a34 <sfs_fsync+0x48>
ffffffffc0209a62:	4785                	li	a5,1
ffffffffc0209a64:	e81c                	sd	a5,16(s0)
ffffffffc0209a66:	b7f9                	j	ffffffffc0209a34 <sfs_fsync+0x48>
ffffffffc0209a68:	00006697          	auipc	a3,0x6
ffffffffc0209a6c:	ad868693          	addi	a3,a3,-1320 # ffffffffc020f540 <dev_node_ops+0x3e0>
ffffffffc0209a70:	00002617          	auipc	a2,0x2
ffffffffc0209a74:	24860613          	addi	a2,a2,584 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209a78:	2e000593          	li	a1,736
ffffffffc0209a7c:	00006517          	auipc	a0,0x6
ffffffffc0209a80:	ca450513          	addi	a0,a0,-860 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209a84:	a1bf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209a88:	00006697          	auipc	a3,0x6
ffffffffc0209a8c:	c6068693          	addi	a3,a3,-928 # ffffffffc020f6e8 <dev_node_ops+0x588>
ffffffffc0209a90:	00002617          	auipc	a2,0x2
ffffffffc0209a94:	22860613          	addi	a2,a2,552 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209a98:	2e100593          	li	a1,737
ffffffffc0209a9c:	00006517          	auipc	a0,0x6
ffffffffc0209aa0:	c8450513          	addi	a0,a0,-892 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209aa4:	9fbf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209aa8 <sfs_fstat>:
ffffffffc0209aa8:	1101                	addi	sp,sp,-32
ffffffffc0209aaa:	e426                	sd	s1,8(sp)
ffffffffc0209aac:	84ae                	mv	s1,a1
ffffffffc0209aae:	e822                	sd	s0,16(sp)
ffffffffc0209ab0:	02000613          	li	a2,32
ffffffffc0209ab4:	842a                	mv	s0,a0
ffffffffc0209ab6:	4581                	li	a1,0
ffffffffc0209ab8:	8526                	mv	a0,s1
ffffffffc0209aba:	ec06                	sd	ra,24(sp)
ffffffffc0209abc:	519010ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc0209ac0:	c439                	beqz	s0,ffffffffc0209b0e <sfs_fstat+0x66>
ffffffffc0209ac2:	783c                	ld	a5,112(s0)
ffffffffc0209ac4:	c7a9                	beqz	a5,ffffffffc0209b0e <sfs_fstat+0x66>
ffffffffc0209ac6:	6bbc                	ld	a5,80(a5)
ffffffffc0209ac8:	c3b9                	beqz	a5,ffffffffc0209b0e <sfs_fstat+0x66>
ffffffffc0209aca:	00005597          	auipc	a1,0x5
ffffffffc0209ace:	60e58593          	addi	a1,a1,1550 # ffffffffc020f0d8 <syscalls+0xdb0>
ffffffffc0209ad2:	8522                	mv	a0,s0
ffffffffc0209ad4:	8cefe0ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc0209ad8:	783c                	ld	a5,112(s0)
ffffffffc0209ada:	85a6                	mv	a1,s1
ffffffffc0209adc:	8522                	mv	a0,s0
ffffffffc0209ade:	6bbc                	ld	a5,80(a5)
ffffffffc0209ae0:	9782                	jalr	a5
ffffffffc0209ae2:	e10d                	bnez	a0,ffffffffc0209b04 <sfs_fstat+0x5c>
ffffffffc0209ae4:	4c38                	lw	a4,88(s0)
ffffffffc0209ae6:	6785                	lui	a5,0x1
ffffffffc0209ae8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209aec:	04f71163          	bne	a4,a5,ffffffffc0209b2e <sfs_fstat+0x86>
ffffffffc0209af0:	601c                	ld	a5,0(s0)
ffffffffc0209af2:	0067d683          	lhu	a3,6(a5)
ffffffffc0209af6:	0087e703          	lwu	a4,8(a5)
ffffffffc0209afa:	0007e783          	lwu	a5,0(a5)
ffffffffc0209afe:	e494                	sd	a3,8(s1)
ffffffffc0209b00:	e898                	sd	a4,16(s1)
ffffffffc0209b02:	ec9c                	sd	a5,24(s1)
ffffffffc0209b04:	60e2                	ld	ra,24(sp)
ffffffffc0209b06:	6442                	ld	s0,16(sp)
ffffffffc0209b08:	64a2                	ld	s1,8(sp)
ffffffffc0209b0a:	6105                	addi	sp,sp,32
ffffffffc0209b0c:	8082                	ret
ffffffffc0209b0e:	00005697          	auipc	a3,0x5
ffffffffc0209b12:	56268693          	addi	a3,a3,1378 # ffffffffc020f070 <syscalls+0xd48>
ffffffffc0209b16:	00002617          	auipc	a2,0x2
ffffffffc0209b1a:	1a260613          	addi	a2,a2,418 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209b1e:	2d100593          	li	a1,721
ffffffffc0209b22:	00006517          	auipc	a0,0x6
ffffffffc0209b26:	bfe50513          	addi	a0,a0,-1026 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209b2a:	975f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209b2e:	00006697          	auipc	a3,0x6
ffffffffc0209b32:	bba68693          	addi	a3,a3,-1094 # ffffffffc020f6e8 <dev_node_ops+0x588>
ffffffffc0209b36:	00002617          	auipc	a2,0x2
ffffffffc0209b3a:	18260613          	addi	a2,a2,386 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209b3e:	2d400593          	li	a1,724
ffffffffc0209b42:	00006517          	auipc	a0,0x6
ffffffffc0209b46:	bde50513          	addi	a0,a0,-1058 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209b4a:	955f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209b4e <sfs_tryseek>:
ffffffffc0209b4e:	080007b7          	lui	a5,0x8000
ffffffffc0209b52:	04f5fd63          	bgeu	a1,a5,ffffffffc0209bac <sfs_tryseek+0x5e>
ffffffffc0209b56:	1101                	addi	sp,sp,-32
ffffffffc0209b58:	e822                	sd	s0,16(sp)
ffffffffc0209b5a:	ec06                	sd	ra,24(sp)
ffffffffc0209b5c:	e426                	sd	s1,8(sp)
ffffffffc0209b5e:	842a                	mv	s0,a0
ffffffffc0209b60:	c921                	beqz	a0,ffffffffc0209bb0 <sfs_tryseek+0x62>
ffffffffc0209b62:	4d38                	lw	a4,88(a0)
ffffffffc0209b64:	6785                	lui	a5,0x1
ffffffffc0209b66:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209b6a:	04f71363          	bne	a4,a5,ffffffffc0209bb0 <sfs_tryseek+0x62>
ffffffffc0209b6e:	611c                	ld	a5,0(a0)
ffffffffc0209b70:	84ae                	mv	s1,a1
ffffffffc0209b72:	0007e783          	lwu	a5,0(a5)
ffffffffc0209b76:	02b7d563          	bge	a5,a1,ffffffffc0209ba0 <sfs_tryseek+0x52>
ffffffffc0209b7a:	793c                	ld	a5,112(a0)
ffffffffc0209b7c:	cbb1                	beqz	a5,ffffffffc0209bd0 <sfs_tryseek+0x82>
ffffffffc0209b7e:	73bc                	ld	a5,96(a5)
ffffffffc0209b80:	cba1                	beqz	a5,ffffffffc0209bd0 <sfs_tryseek+0x82>
ffffffffc0209b82:	00005597          	auipc	a1,0x5
ffffffffc0209b86:	44658593          	addi	a1,a1,1094 # ffffffffc020efc8 <syscalls+0xca0>
ffffffffc0209b8a:	818fe0ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc0209b8e:	783c                	ld	a5,112(s0)
ffffffffc0209b90:	8522                	mv	a0,s0
ffffffffc0209b92:	6442                	ld	s0,16(sp)
ffffffffc0209b94:	60e2                	ld	ra,24(sp)
ffffffffc0209b96:	73bc                	ld	a5,96(a5)
ffffffffc0209b98:	85a6                	mv	a1,s1
ffffffffc0209b9a:	64a2                	ld	s1,8(sp)
ffffffffc0209b9c:	6105                	addi	sp,sp,32
ffffffffc0209b9e:	8782                	jr	a5
ffffffffc0209ba0:	60e2                	ld	ra,24(sp)
ffffffffc0209ba2:	6442                	ld	s0,16(sp)
ffffffffc0209ba4:	64a2                	ld	s1,8(sp)
ffffffffc0209ba6:	4501                	li	a0,0
ffffffffc0209ba8:	6105                	addi	sp,sp,32
ffffffffc0209baa:	8082                	ret
ffffffffc0209bac:	5575                	li	a0,-3
ffffffffc0209bae:	8082                	ret
ffffffffc0209bb0:	00006697          	auipc	a3,0x6
ffffffffc0209bb4:	b3868693          	addi	a3,a3,-1224 # ffffffffc020f6e8 <dev_node_ops+0x588>
ffffffffc0209bb8:	00002617          	auipc	a2,0x2
ffffffffc0209bbc:	10060613          	addi	a2,a2,256 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209bc0:	3b300593          	li	a1,947
ffffffffc0209bc4:	00006517          	auipc	a0,0x6
ffffffffc0209bc8:	b5c50513          	addi	a0,a0,-1188 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209bcc:	8d3f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209bd0:	00005697          	auipc	a3,0x5
ffffffffc0209bd4:	3a068693          	addi	a3,a3,928 # ffffffffc020ef70 <syscalls+0xc48>
ffffffffc0209bd8:	00002617          	auipc	a2,0x2
ffffffffc0209bdc:	0e060613          	addi	a2,a2,224 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209be0:	3b500593          	li	a1,949
ffffffffc0209be4:	00006517          	auipc	a0,0x6
ffffffffc0209be8:	b3c50513          	addi	a0,a0,-1220 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209bec:	8b3f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209bf0 <sfs_close>:
ffffffffc0209bf0:	1141                	addi	sp,sp,-16
ffffffffc0209bf2:	e406                	sd	ra,8(sp)
ffffffffc0209bf4:	e022                	sd	s0,0(sp)
ffffffffc0209bf6:	c11d                	beqz	a0,ffffffffc0209c1c <sfs_close+0x2c>
ffffffffc0209bf8:	793c                	ld	a5,112(a0)
ffffffffc0209bfa:	842a                	mv	s0,a0
ffffffffc0209bfc:	c385                	beqz	a5,ffffffffc0209c1c <sfs_close+0x2c>
ffffffffc0209bfe:	7b9c                	ld	a5,48(a5)
ffffffffc0209c00:	cf91                	beqz	a5,ffffffffc0209c1c <sfs_close+0x2c>
ffffffffc0209c02:	00004597          	auipc	a1,0x4
ffffffffc0209c06:	a3e58593          	addi	a1,a1,-1474 # ffffffffc020d640 <default_pmm_manager+0xea0>
ffffffffc0209c0a:	f99fd0ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc0209c0e:	783c                	ld	a5,112(s0)
ffffffffc0209c10:	8522                	mv	a0,s0
ffffffffc0209c12:	6402                	ld	s0,0(sp)
ffffffffc0209c14:	60a2                	ld	ra,8(sp)
ffffffffc0209c16:	7b9c                	ld	a5,48(a5)
ffffffffc0209c18:	0141                	addi	sp,sp,16
ffffffffc0209c1a:	8782                	jr	a5
ffffffffc0209c1c:	00004697          	auipc	a3,0x4
ffffffffc0209c20:	9d468693          	addi	a3,a3,-1580 # ffffffffc020d5f0 <default_pmm_manager+0xe50>
ffffffffc0209c24:	00002617          	auipc	a2,0x2
ffffffffc0209c28:	09460613          	addi	a2,a2,148 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209c2c:	21c00593          	li	a1,540
ffffffffc0209c30:	00006517          	auipc	a0,0x6
ffffffffc0209c34:	af050513          	addi	a0,a0,-1296 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209c38:	867f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209c3c <sfs_io.part.0>:
ffffffffc0209c3c:	1141                	addi	sp,sp,-16
ffffffffc0209c3e:	00006697          	auipc	a3,0x6
ffffffffc0209c42:	aaa68693          	addi	a3,a3,-1366 # ffffffffc020f6e8 <dev_node_ops+0x588>
ffffffffc0209c46:	00002617          	auipc	a2,0x2
ffffffffc0209c4a:	07260613          	addi	a2,a2,114 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209c4e:	2b000593          	li	a1,688
ffffffffc0209c52:	00006517          	auipc	a0,0x6
ffffffffc0209c56:	ace50513          	addi	a0,a0,-1330 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209c5a:	e406                	sd	ra,8(sp)
ffffffffc0209c5c:	843f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209c60 <sfs_block_free>:
ffffffffc0209c60:	1101                	addi	sp,sp,-32
ffffffffc0209c62:	e426                	sd	s1,8(sp)
ffffffffc0209c64:	ec06                	sd	ra,24(sp)
ffffffffc0209c66:	e822                	sd	s0,16(sp)
ffffffffc0209c68:	4154                	lw	a3,4(a0)
ffffffffc0209c6a:	84ae                	mv	s1,a1
ffffffffc0209c6c:	c595                	beqz	a1,ffffffffc0209c98 <sfs_block_free+0x38>
ffffffffc0209c6e:	02d5f563          	bgeu	a1,a3,ffffffffc0209c98 <sfs_block_free+0x38>
ffffffffc0209c72:	842a                	mv	s0,a0
ffffffffc0209c74:	7d08                	ld	a0,56(a0)
ffffffffc0209c76:	edcff0ef          	jal	ra,ffffffffc0209352 <bitmap_test>
ffffffffc0209c7a:	ed05                	bnez	a0,ffffffffc0209cb2 <sfs_block_free+0x52>
ffffffffc0209c7c:	7c08                	ld	a0,56(s0)
ffffffffc0209c7e:	85a6                	mv	a1,s1
ffffffffc0209c80:	efaff0ef          	jal	ra,ffffffffc020937a <bitmap_free>
ffffffffc0209c84:	441c                	lw	a5,8(s0)
ffffffffc0209c86:	4705                	li	a4,1
ffffffffc0209c88:	60e2                	ld	ra,24(sp)
ffffffffc0209c8a:	2785                	addiw	a5,a5,1
ffffffffc0209c8c:	e038                	sd	a4,64(s0)
ffffffffc0209c8e:	c41c                	sw	a5,8(s0)
ffffffffc0209c90:	6442                	ld	s0,16(sp)
ffffffffc0209c92:	64a2                	ld	s1,8(sp)
ffffffffc0209c94:	6105                	addi	sp,sp,32
ffffffffc0209c96:	8082                	ret
ffffffffc0209c98:	8726                	mv	a4,s1
ffffffffc0209c9a:	00006617          	auipc	a2,0x6
ffffffffc0209c9e:	ab660613          	addi	a2,a2,-1354 # ffffffffc020f750 <dev_node_ops+0x5f0>
ffffffffc0209ca2:	05300593          	li	a1,83
ffffffffc0209ca6:	00006517          	auipc	a0,0x6
ffffffffc0209caa:	a7a50513          	addi	a0,a0,-1414 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209cae:	ff0f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209cb2:	00006697          	auipc	a3,0x6
ffffffffc0209cb6:	ad668693          	addi	a3,a3,-1322 # ffffffffc020f788 <dev_node_ops+0x628>
ffffffffc0209cba:	00002617          	auipc	a2,0x2
ffffffffc0209cbe:	ffe60613          	addi	a2,a2,-2 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209cc2:	06a00593          	li	a1,106
ffffffffc0209cc6:	00006517          	auipc	a0,0x6
ffffffffc0209cca:	a5a50513          	addi	a0,a0,-1446 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209cce:	fd0f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209cd2 <sfs_reclaim>:
ffffffffc0209cd2:	1101                	addi	sp,sp,-32
ffffffffc0209cd4:	e426                	sd	s1,8(sp)
ffffffffc0209cd6:	7524                	ld	s1,104(a0)
ffffffffc0209cd8:	ec06                	sd	ra,24(sp)
ffffffffc0209cda:	e822                	sd	s0,16(sp)
ffffffffc0209cdc:	e04a                	sd	s2,0(sp)
ffffffffc0209cde:	0e048a63          	beqz	s1,ffffffffc0209dd2 <sfs_reclaim+0x100>
ffffffffc0209ce2:	0b04a783          	lw	a5,176(s1)
ffffffffc0209ce6:	0e079663          	bnez	a5,ffffffffc0209dd2 <sfs_reclaim+0x100>
ffffffffc0209cea:	4d38                	lw	a4,88(a0)
ffffffffc0209cec:	6785                	lui	a5,0x1
ffffffffc0209cee:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209cf2:	842a                	mv	s0,a0
ffffffffc0209cf4:	10f71f63          	bne	a4,a5,ffffffffc0209e12 <sfs_reclaim+0x140>
ffffffffc0209cf8:	8526                	mv	a0,s1
ffffffffc0209cfa:	586010ef          	jal	ra,ffffffffc020b280 <lock_sfs_fs>
ffffffffc0209cfe:	4c1c                	lw	a5,24(s0)
ffffffffc0209d00:	0ef05963          	blez	a5,ffffffffc0209df2 <sfs_reclaim+0x120>
ffffffffc0209d04:	fff7871b          	addiw	a4,a5,-1
ffffffffc0209d08:	cc18                	sw	a4,24(s0)
ffffffffc0209d0a:	eb59                	bnez	a4,ffffffffc0209da0 <sfs_reclaim+0xce>
ffffffffc0209d0c:	05c42903          	lw	s2,92(s0)
ffffffffc0209d10:	08091863          	bnez	s2,ffffffffc0209da0 <sfs_reclaim+0xce>
ffffffffc0209d14:	601c                	ld	a5,0(s0)
ffffffffc0209d16:	0067d783          	lhu	a5,6(a5)
ffffffffc0209d1a:	e785                	bnez	a5,ffffffffc0209d42 <sfs_reclaim+0x70>
ffffffffc0209d1c:	783c                	ld	a5,112(s0)
ffffffffc0209d1e:	10078a63          	beqz	a5,ffffffffc0209e32 <sfs_reclaim+0x160>
ffffffffc0209d22:	73bc                	ld	a5,96(a5)
ffffffffc0209d24:	10078763          	beqz	a5,ffffffffc0209e32 <sfs_reclaim+0x160>
ffffffffc0209d28:	00005597          	auipc	a1,0x5
ffffffffc0209d2c:	2a058593          	addi	a1,a1,672 # ffffffffc020efc8 <syscalls+0xca0>
ffffffffc0209d30:	8522                	mv	a0,s0
ffffffffc0209d32:	e71fd0ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc0209d36:	783c                	ld	a5,112(s0)
ffffffffc0209d38:	4581                	li	a1,0
ffffffffc0209d3a:	8522                	mv	a0,s0
ffffffffc0209d3c:	73bc                	ld	a5,96(a5)
ffffffffc0209d3e:	9782                	jalr	a5
ffffffffc0209d40:	e559                	bnez	a0,ffffffffc0209dce <sfs_reclaim+0xfc>
ffffffffc0209d42:	681c                	ld	a5,16(s0)
ffffffffc0209d44:	c39d                	beqz	a5,ffffffffc0209d6a <sfs_reclaim+0x98>
ffffffffc0209d46:	783c                	ld	a5,112(s0)
ffffffffc0209d48:	10078563          	beqz	a5,ffffffffc0209e52 <sfs_reclaim+0x180>
ffffffffc0209d4c:	7b9c                	ld	a5,48(a5)
ffffffffc0209d4e:	10078263          	beqz	a5,ffffffffc0209e52 <sfs_reclaim+0x180>
ffffffffc0209d52:	8522                	mv	a0,s0
ffffffffc0209d54:	00004597          	auipc	a1,0x4
ffffffffc0209d58:	8ec58593          	addi	a1,a1,-1812 # ffffffffc020d640 <default_pmm_manager+0xea0>
ffffffffc0209d5c:	e47fd0ef          	jal	ra,ffffffffc0207ba2 <inode_check>
ffffffffc0209d60:	783c                	ld	a5,112(s0)
ffffffffc0209d62:	8522                	mv	a0,s0
ffffffffc0209d64:	7b9c                	ld	a5,48(a5)
ffffffffc0209d66:	9782                	jalr	a5
ffffffffc0209d68:	e13d                	bnez	a0,ffffffffc0209dce <sfs_reclaim+0xfc>
ffffffffc0209d6a:	7c18                	ld	a4,56(s0)
ffffffffc0209d6c:	603c                	ld	a5,64(s0)
ffffffffc0209d6e:	8526                	mv	a0,s1
ffffffffc0209d70:	e71c                	sd	a5,8(a4)
ffffffffc0209d72:	e398                	sd	a4,0(a5)
ffffffffc0209d74:	6438                	ld	a4,72(s0)
ffffffffc0209d76:	683c                	ld	a5,80(s0)
ffffffffc0209d78:	e71c                	sd	a5,8(a4)
ffffffffc0209d7a:	e398                	sd	a4,0(a5)
ffffffffc0209d7c:	514010ef          	jal	ra,ffffffffc020b290 <unlock_sfs_fs>
ffffffffc0209d80:	6008                	ld	a0,0(s0)
ffffffffc0209d82:	00655783          	lhu	a5,6(a0)
ffffffffc0209d86:	cb85                	beqz	a5,ffffffffc0209db6 <sfs_reclaim+0xe4>
ffffffffc0209d88:	ab6f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209d8c:	8522                	mv	a0,s0
ffffffffc0209d8e:	da9fd0ef          	jal	ra,ffffffffc0207b36 <inode_kill>
ffffffffc0209d92:	60e2                	ld	ra,24(sp)
ffffffffc0209d94:	6442                	ld	s0,16(sp)
ffffffffc0209d96:	64a2                	ld	s1,8(sp)
ffffffffc0209d98:	854a                	mv	a0,s2
ffffffffc0209d9a:	6902                	ld	s2,0(sp)
ffffffffc0209d9c:	6105                	addi	sp,sp,32
ffffffffc0209d9e:	8082                	ret
ffffffffc0209da0:	5945                	li	s2,-15
ffffffffc0209da2:	8526                	mv	a0,s1
ffffffffc0209da4:	4ec010ef          	jal	ra,ffffffffc020b290 <unlock_sfs_fs>
ffffffffc0209da8:	60e2                	ld	ra,24(sp)
ffffffffc0209daa:	6442                	ld	s0,16(sp)
ffffffffc0209dac:	64a2                	ld	s1,8(sp)
ffffffffc0209dae:	854a                	mv	a0,s2
ffffffffc0209db0:	6902                	ld	s2,0(sp)
ffffffffc0209db2:	6105                	addi	sp,sp,32
ffffffffc0209db4:	8082                	ret
ffffffffc0209db6:	440c                	lw	a1,8(s0)
ffffffffc0209db8:	8526                	mv	a0,s1
ffffffffc0209dba:	ea7ff0ef          	jal	ra,ffffffffc0209c60 <sfs_block_free>
ffffffffc0209dbe:	6008                	ld	a0,0(s0)
ffffffffc0209dc0:	5d4c                	lw	a1,60(a0)
ffffffffc0209dc2:	d1f9                	beqz	a1,ffffffffc0209d88 <sfs_reclaim+0xb6>
ffffffffc0209dc4:	8526                	mv	a0,s1
ffffffffc0209dc6:	e9bff0ef          	jal	ra,ffffffffc0209c60 <sfs_block_free>
ffffffffc0209dca:	6008                	ld	a0,0(s0)
ffffffffc0209dcc:	bf75                	j	ffffffffc0209d88 <sfs_reclaim+0xb6>
ffffffffc0209dce:	892a                	mv	s2,a0
ffffffffc0209dd0:	bfc9                	j	ffffffffc0209da2 <sfs_reclaim+0xd0>
ffffffffc0209dd2:	00005697          	auipc	a3,0x5
ffffffffc0209dd6:	76e68693          	addi	a3,a3,1902 # ffffffffc020f540 <dev_node_ops+0x3e0>
ffffffffc0209dda:	00002617          	auipc	a2,0x2
ffffffffc0209dde:	ede60613          	addi	a2,a2,-290 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209de2:	37100593          	li	a1,881
ffffffffc0209de6:	00006517          	auipc	a0,0x6
ffffffffc0209dea:	93a50513          	addi	a0,a0,-1734 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209dee:	eb0f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209df2:	00006697          	auipc	a3,0x6
ffffffffc0209df6:	9b668693          	addi	a3,a3,-1610 # ffffffffc020f7a8 <dev_node_ops+0x648>
ffffffffc0209dfa:	00002617          	auipc	a2,0x2
ffffffffc0209dfe:	ebe60613          	addi	a2,a2,-322 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209e02:	37700593          	li	a1,887
ffffffffc0209e06:	00006517          	auipc	a0,0x6
ffffffffc0209e0a:	91a50513          	addi	a0,a0,-1766 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209e0e:	e90f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209e12:	00006697          	auipc	a3,0x6
ffffffffc0209e16:	8d668693          	addi	a3,a3,-1834 # ffffffffc020f6e8 <dev_node_ops+0x588>
ffffffffc0209e1a:	00002617          	auipc	a2,0x2
ffffffffc0209e1e:	e9e60613          	addi	a2,a2,-354 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209e22:	37200593          	li	a1,882
ffffffffc0209e26:	00006517          	auipc	a0,0x6
ffffffffc0209e2a:	8fa50513          	addi	a0,a0,-1798 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209e2e:	e70f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209e32:	00005697          	auipc	a3,0x5
ffffffffc0209e36:	13e68693          	addi	a3,a3,318 # ffffffffc020ef70 <syscalls+0xc48>
ffffffffc0209e3a:	00002617          	auipc	a2,0x2
ffffffffc0209e3e:	e7e60613          	addi	a2,a2,-386 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209e42:	37c00593          	li	a1,892
ffffffffc0209e46:	00006517          	auipc	a0,0x6
ffffffffc0209e4a:	8da50513          	addi	a0,a0,-1830 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209e4e:	e50f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209e52:	00003697          	auipc	a3,0x3
ffffffffc0209e56:	79e68693          	addi	a3,a3,1950 # ffffffffc020d5f0 <default_pmm_manager+0xe50>
ffffffffc0209e5a:	00002617          	auipc	a2,0x2
ffffffffc0209e5e:	e5e60613          	addi	a2,a2,-418 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209e62:	38100593          	li	a1,897
ffffffffc0209e66:	00006517          	auipc	a0,0x6
ffffffffc0209e6a:	8ba50513          	addi	a0,a0,-1862 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209e6e:	e30f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209e72 <sfs_block_alloc>:
ffffffffc0209e72:	1101                	addi	sp,sp,-32
ffffffffc0209e74:	e822                	sd	s0,16(sp)
ffffffffc0209e76:	842a                	mv	s0,a0
ffffffffc0209e78:	7d08                	ld	a0,56(a0)
ffffffffc0209e7a:	e426                	sd	s1,8(sp)
ffffffffc0209e7c:	ec06                	sd	ra,24(sp)
ffffffffc0209e7e:	84ae                	mv	s1,a1
ffffffffc0209e80:	c62ff0ef          	jal	ra,ffffffffc02092e2 <bitmap_alloc>
ffffffffc0209e84:	e90d                	bnez	a0,ffffffffc0209eb6 <sfs_block_alloc+0x44>
ffffffffc0209e86:	441c                	lw	a5,8(s0)
ffffffffc0209e88:	cbad                	beqz	a5,ffffffffc0209efa <sfs_block_alloc+0x88>
ffffffffc0209e8a:	37fd                	addiw	a5,a5,-1
ffffffffc0209e8c:	c41c                	sw	a5,8(s0)
ffffffffc0209e8e:	408c                	lw	a1,0(s1)
ffffffffc0209e90:	4785                	li	a5,1
ffffffffc0209e92:	e03c                	sd	a5,64(s0)
ffffffffc0209e94:	4054                	lw	a3,4(s0)
ffffffffc0209e96:	c58d                	beqz	a1,ffffffffc0209ec0 <sfs_block_alloc+0x4e>
ffffffffc0209e98:	02d5f463          	bgeu	a1,a3,ffffffffc0209ec0 <sfs_block_alloc+0x4e>
ffffffffc0209e9c:	7c08                	ld	a0,56(s0)
ffffffffc0209e9e:	cb4ff0ef          	jal	ra,ffffffffc0209352 <bitmap_test>
ffffffffc0209ea2:	ed05                	bnez	a0,ffffffffc0209eda <sfs_block_alloc+0x68>
ffffffffc0209ea4:	8522                	mv	a0,s0
ffffffffc0209ea6:	6442                	ld	s0,16(sp)
ffffffffc0209ea8:	408c                	lw	a1,0(s1)
ffffffffc0209eaa:	60e2                	ld	ra,24(sp)
ffffffffc0209eac:	64a2                	ld	s1,8(sp)
ffffffffc0209eae:	4605                	li	a2,1
ffffffffc0209eb0:	6105                	addi	sp,sp,32
ffffffffc0209eb2:	36e0106f          	j	ffffffffc020b220 <sfs_clear_block>
ffffffffc0209eb6:	60e2                	ld	ra,24(sp)
ffffffffc0209eb8:	6442                	ld	s0,16(sp)
ffffffffc0209eba:	64a2                	ld	s1,8(sp)
ffffffffc0209ebc:	6105                	addi	sp,sp,32
ffffffffc0209ebe:	8082                	ret
ffffffffc0209ec0:	872e                	mv	a4,a1
ffffffffc0209ec2:	00006617          	auipc	a2,0x6
ffffffffc0209ec6:	88e60613          	addi	a2,a2,-1906 # ffffffffc020f750 <dev_node_ops+0x5f0>
ffffffffc0209eca:	05300593          	li	a1,83
ffffffffc0209ece:	00006517          	auipc	a0,0x6
ffffffffc0209ed2:	85250513          	addi	a0,a0,-1966 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209ed6:	dc8f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209eda:	00006697          	auipc	a3,0x6
ffffffffc0209ede:	90668693          	addi	a3,a3,-1786 # ffffffffc020f7e0 <dev_node_ops+0x680>
ffffffffc0209ee2:	00002617          	auipc	a2,0x2
ffffffffc0209ee6:	dd660613          	addi	a2,a2,-554 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209eea:	06100593          	li	a1,97
ffffffffc0209eee:	00006517          	auipc	a0,0x6
ffffffffc0209ef2:	83250513          	addi	a0,a0,-1998 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209ef6:	da8f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209efa:	00006697          	auipc	a3,0x6
ffffffffc0209efe:	8c668693          	addi	a3,a3,-1850 # ffffffffc020f7c0 <dev_node_ops+0x660>
ffffffffc0209f02:	00002617          	auipc	a2,0x2
ffffffffc0209f06:	db660613          	addi	a2,a2,-586 # ffffffffc020bcb8 <commands+0x210>
ffffffffc0209f0a:	05f00593          	li	a1,95
ffffffffc0209f0e:	00006517          	auipc	a0,0x6
ffffffffc0209f12:	81250513          	addi	a0,a0,-2030 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209f16:	d88f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209f1a <sfs_bmap_load_nolock>:
ffffffffc0209f1a:	7159                	addi	sp,sp,-112
ffffffffc0209f1c:	f85a                	sd	s6,48(sp)
ffffffffc0209f1e:	0005bb03          	ld	s6,0(a1)
ffffffffc0209f22:	f45e                	sd	s7,40(sp)
ffffffffc0209f24:	f486                	sd	ra,104(sp)
ffffffffc0209f26:	008b2b83          	lw	s7,8(s6)
ffffffffc0209f2a:	f0a2                	sd	s0,96(sp)
ffffffffc0209f2c:	eca6                	sd	s1,88(sp)
ffffffffc0209f2e:	e8ca                	sd	s2,80(sp)
ffffffffc0209f30:	e4ce                	sd	s3,72(sp)
ffffffffc0209f32:	e0d2                	sd	s4,64(sp)
ffffffffc0209f34:	fc56                	sd	s5,56(sp)
ffffffffc0209f36:	f062                	sd	s8,32(sp)
ffffffffc0209f38:	ec66                	sd	s9,24(sp)
ffffffffc0209f3a:	18cbe363          	bltu	s7,a2,ffffffffc020a0c0 <sfs_bmap_load_nolock+0x1a6>
ffffffffc0209f3e:	47ad                	li	a5,11
ffffffffc0209f40:	8aae                	mv	s5,a1
ffffffffc0209f42:	8432                	mv	s0,a2
ffffffffc0209f44:	84aa                	mv	s1,a0
ffffffffc0209f46:	89b6                	mv	s3,a3
ffffffffc0209f48:	04c7f563          	bgeu	a5,a2,ffffffffc0209f92 <sfs_bmap_load_nolock+0x78>
ffffffffc0209f4c:	ff46071b          	addiw	a4,a2,-12
ffffffffc0209f50:	0007069b          	sext.w	a3,a4
ffffffffc0209f54:	3ff00793          	li	a5,1023
ffffffffc0209f58:	1ad7e163          	bltu	a5,a3,ffffffffc020a0fa <sfs_bmap_load_nolock+0x1e0>
ffffffffc0209f5c:	03cb2a03          	lw	s4,60(s6)
ffffffffc0209f60:	02071793          	slli	a5,a4,0x20
ffffffffc0209f64:	c602                	sw	zero,12(sp)
ffffffffc0209f66:	c452                	sw	s4,8(sp)
ffffffffc0209f68:	01e7dc13          	srli	s8,a5,0x1e
ffffffffc0209f6c:	0e0a1e63          	bnez	s4,ffffffffc020a068 <sfs_bmap_load_nolock+0x14e>
ffffffffc0209f70:	0acb8663          	beq	s7,a2,ffffffffc020a01c <sfs_bmap_load_nolock+0x102>
ffffffffc0209f74:	4a01                	li	s4,0
ffffffffc0209f76:	40d4                	lw	a3,4(s1)
ffffffffc0209f78:	8752                	mv	a4,s4
ffffffffc0209f7a:	00005617          	auipc	a2,0x5
ffffffffc0209f7e:	7d660613          	addi	a2,a2,2006 # ffffffffc020f750 <dev_node_ops+0x5f0>
ffffffffc0209f82:	05300593          	li	a1,83
ffffffffc0209f86:	00005517          	auipc	a0,0x5
ffffffffc0209f8a:	79a50513          	addi	a0,a0,1946 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc0209f8e:	d10f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209f92:	02061793          	slli	a5,a2,0x20
ffffffffc0209f96:	01e7da13          	srli	s4,a5,0x1e
ffffffffc0209f9a:	9a5a                	add	s4,s4,s6
ffffffffc0209f9c:	00ca2583          	lw	a1,12(s4)
ffffffffc0209fa0:	c22e                	sw	a1,4(sp)
ffffffffc0209fa2:	ed99                	bnez	a1,ffffffffc0209fc0 <sfs_bmap_load_nolock+0xa6>
ffffffffc0209fa4:	fccb98e3          	bne	s7,a2,ffffffffc0209f74 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209fa8:	004c                	addi	a1,sp,4
ffffffffc0209faa:	ec9ff0ef          	jal	ra,ffffffffc0209e72 <sfs_block_alloc>
ffffffffc0209fae:	892a                	mv	s2,a0
ffffffffc0209fb0:	e921                	bnez	a0,ffffffffc020a000 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209fb2:	4592                	lw	a1,4(sp)
ffffffffc0209fb4:	4705                	li	a4,1
ffffffffc0209fb6:	00ba2623          	sw	a1,12(s4)
ffffffffc0209fba:	00eab823          	sd	a4,16(s5)
ffffffffc0209fbe:	d9dd                	beqz	a1,ffffffffc0209f74 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209fc0:	40d4                	lw	a3,4(s1)
ffffffffc0209fc2:	10d5ff63          	bgeu	a1,a3,ffffffffc020a0e0 <sfs_bmap_load_nolock+0x1c6>
ffffffffc0209fc6:	7c88                	ld	a0,56(s1)
ffffffffc0209fc8:	b8aff0ef          	jal	ra,ffffffffc0209352 <bitmap_test>
ffffffffc0209fcc:	18051363          	bnez	a0,ffffffffc020a152 <sfs_bmap_load_nolock+0x238>
ffffffffc0209fd0:	4a12                	lw	s4,4(sp)
ffffffffc0209fd2:	fa0a02e3          	beqz	s4,ffffffffc0209f76 <sfs_bmap_load_nolock+0x5c>
ffffffffc0209fd6:	40dc                	lw	a5,4(s1)
ffffffffc0209fd8:	f8fa7fe3          	bgeu	s4,a5,ffffffffc0209f76 <sfs_bmap_load_nolock+0x5c>
ffffffffc0209fdc:	7c88                	ld	a0,56(s1)
ffffffffc0209fde:	85d2                	mv	a1,s4
ffffffffc0209fe0:	b72ff0ef          	jal	ra,ffffffffc0209352 <bitmap_test>
ffffffffc0209fe4:	12051763          	bnez	a0,ffffffffc020a112 <sfs_bmap_load_nolock+0x1f8>
ffffffffc0209fe8:	008b9763          	bne	s7,s0,ffffffffc0209ff6 <sfs_bmap_load_nolock+0xdc>
ffffffffc0209fec:	008b2783          	lw	a5,8(s6)
ffffffffc0209ff0:	2785                	addiw	a5,a5,1
ffffffffc0209ff2:	00fb2423          	sw	a5,8(s6)
ffffffffc0209ff6:	4901                	li	s2,0
ffffffffc0209ff8:	00098463          	beqz	s3,ffffffffc020a000 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209ffc:	0149a023          	sw	s4,0(s3)
ffffffffc020a000:	70a6                	ld	ra,104(sp)
ffffffffc020a002:	7406                	ld	s0,96(sp)
ffffffffc020a004:	64e6                	ld	s1,88(sp)
ffffffffc020a006:	69a6                	ld	s3,72(sp)
ffffffffc020a008:	6a06                	ld	s4,64(sp)
ffffffffc020a00a:	7ae2                	ld	s5,56(sp)
ffffffffc020a00c:	7b42                	ld	s6,48(sp)
ffffffffc020a00e:	7ba2                	ld	s7,40(sp)
ffffffffc020a010:	7c02                	ld	s8,32(sp)
ffffffffc020a012:	6ce2                	ld	s9,24(sp)
ffffffffc020a014:	854a                	mv	a0,s2
ffffffffc020a016:	6946                	ld	s2,80(sp)
ffffffffc020a018:	6165                	addi	sp,sp,112
ffffffffc020a01a:	8082                	ret
ffffffffc020a01c:	002c                	addi	a1,sp,8
ffffffffc020a01e:	e55ff0ef          	jal	ra,ffffffffc0209e72 <sfs_block_alloc>
ffffffffc020a022:	892a                	mv	s2,a0
ffffffffc020a024:	00c10c93          	addi	s9,sp,12
ffffffffc020a028:	fd61                	bnez	a0,ffffffffc020a000 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a02a:	85e6                	mv	a1,s9
ffffffffc020a02c:	8526                	mv	a0,s1
ffffffffc020a02e:	e45ff0ef          	jal	ra,ffffffffc0209e72 <sfs_block_alloc>
ffffffffc020a032:	892a                	mv	s2,a0
ffffffffc020a034:	e925                	bnez	a0,ffffffffc020a0a4 <sfs_bmap_load_nolock+0x18a>
ffffffffc020a036:	46a2                	lw	a3,8(sp)
ffffffffc020a038:	85e6                	mv	a1,s9
ffffffffc020a03a:	8762                	mv	a4,s8
ffffffffc020a03c:	4611                	li	a2,4
ffffffffc020a03e:	8526                	mv	a0,s1
ffffffffc020a040:	090010ef          	jal	ra,ffffffffc020b0d0 <sfs_wbuf>
ffffffffc020a044:	45b2                	lw	a1,12(sp)
ffffffffc020a046:	892a                	mv	s2,a0
ffffffffc020a048:	e939                	bnez	a0,ffffffffc020a09e <sfs_bmap_load_nolock+0x184>
ffffffffc020a04a:	03cb2683          	lw	a3,60(s6)
ffffffffc020a04e:	4722                	lw	a4,8(sp)
ffffffffc020a050:	c22e                	sw	a1,4(sp)
ffffffffc020a052:	f6d706e3          	beq	a4,a3,ffffffffc0209fbe <sfs_bmap_load_nolock+0xa4>
ffffffffc020a056:	eef1                	bnez	a3,ffffffffc020a132 <sfs_bmap_load_nolock+0x218>
ffffffffc020a058:	02eb2e23          	sw	a4,60(s6)
ffffffffc020a05c:	4705                	li	a4,1
ffffffffc020a05e:	00eab823          	sd	a4,16(s5)
ffffffffc020a062:	f00589e3          	beqz	a1,ffffffffc0209f74 <sfs_bmap_load_nolock+0x5a>
ffffffffc020a066:	bfa9                	j	ffffffffc0209fc0 <sfs_bmap_load_nolock+0xa6>
ffffffffc020a068:	00c10c93          	addi	s9,sp,12
ffffffffc020a06c:	8762                	mv	a4,s8
ffffffffc020a06e:	86d2                	mv	a3,s4
ffffffffc020a070:	4611                	li	a2,4
ffffffffc020a072:	85e6                	mv	a1,s9
ffffffffc020a074:	7dd000ef          	jal	ra,ffffffffc020b050 <sfs_rbuf>
ffffffffc020a078:	892a                	mv	s2,a0
ffffffffc020a07a:	f159                	bnez	a0,ffffffffc020a000 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a07c:	45b2                	lw	a1,12(sp)
ffffffffc020a07e:	e995                	bnez	a1,ffffffffc020a0b2 <sfs_bmap_load_nolock+0x198>
ffffffffc020a080:	fa8b85e3          	beq	s7,s0,ffffffffc020a02a <sfs_bmap_load_nolock+0x110>
ffffffffc020a084:	03cb2703          	lw	a4,60(s6)
ffffffffc020a088:	47a2                	lw	a5,8(sp)
ffffffffc020a08a:	c202                	sw	zero,4(sp)
ffffffffc020a08c:	eee784e3          	beq	a5,a4,ffffffffc0209f74 <sfs_bmap_load_nolock+0x5a>
ffffffffc020a090:	e34d                	bnez	a4,ffffffffc020a132 <sfs_bmap_load_nolock+0x218>
ffffffffc020a092:	02fb2e23          	sw	a5,60(s6)
ffffffffc020a096:	4785                	li	a5,1
ffffffffc020a098:	00fab823          	sd	a5,16(s5)
ffffffffc020a09c:	bde1                	j	ffffffffc0209f74 <sfs_bmap_load_nolock+0x5a>
ffffffffc020a09e:	8526                	mv	a0,s1
ffffffffc020a0a0:	bc1ff0ef          	jal	ra,ffffffffc0209c60 <sfs_block_free>
ffffffffc020a0a4:	45a2                	lw	a1,8(sp)
ffffffffc020a0a6:	f4ba0de3          	beq	s4,a1,ffffffffc020a000 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a0aa:	8526                	mv	a0,s1
ffffffffc020a0ac:	bb5ff0ef          	jal	ra,ffffffffc0209c60 <sfs_block_free>
ffffffffc020a0b0:	bf81                	j	ffffffffc020a000 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a0b2:	03cb2683          	lw	a3,60(s6)
ffffffffc020a0b6:	4722                	lw	a4,8(sp)
ffffffffc020a0b8:	c22e                	sw	a1,4(sp)
ffffffffc020a0ba:	f8e69ee3          	bne	a3,a4,ffffffffc020a056 <sfs_bmap_load_nolock+0x13c>
ffffffffc020a0be:	b709                	j	ffffffffc0209fc0 <sfs_bmap_load_nolock+0xa6>
ffffffffc020a0c0:	00005697          	auipc	a3,0x5
ffffffffc020a0c4:	74868693          	addi	a3,a3,1864 # ffffffffc020f808 <dev_node_ops+0x6a8>
ffffffffc020a0c8:	00002617          	auipc	a2,0x2
ffffffffc020a0cc:	bf060613          	addi	a2,a2,-1040 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a0d0:	16400593          	li	a1,356
ffffffffc020a0d4:	00005517          	auipc	a0,0x5
ffffffffc020a0d8:	64c50513          	addi	a0,a0,1612 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a0dc:	bc2f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a0e0:	872e                	mv	a4,a1
ffffffffc020a0e2:	00005617          	auipc	a2,0x5
ffffffffc020a0e6:	66e60613          	addi	a2,a2,1646 # ffffffffc020f750 <dev_node_ops+0x5f0>
ffffffffc020a0ea:	05300593          	li	a1,83
ffffffffc020a0ee:	00005517          	auipc	a0,0x5
ffffffffc020a0f2:	63250513          	addi	a0,a0,1586 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a0f6:	ba8f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a0fa:	00005617          	auipc	a2,0x5
ffffffffc020a0fe:	73e60613          	addi	a2,a2,1854 # ffffffffc020f838 <dev_node_ops+0x6d8>
ffffffffc020a102:	11e00593          	li	a1,286
ffffffffc020a106:	00005517          	auipc	a0,0x5
ffffffffc020a10a:	61a50513          	addi	a0,a0,1562 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a10e:	b90f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a112:	00005697          	auipc	a3,0x5
ffffffffc020a116:	67668693          	addi	a3,a3,1654 # ffffffffc020f788 <dev_node_ops+0x628>
ffffffffc020a11a:	00002617          	auipc	a2,0x2
ffffffffc020a11e:	b9e60613          	addi	a2,a2,-1122 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a122:	16b00593          	li	a1,363
ffffffffc020a126:	00005517          	auipc	a0,0x5
ffffffffc020a12a:	5fa50513          	addi	a0,a0,1530 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a12e:	b70f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a132:	00005697          	auipc	a3,0x5
ffffffffc020a136:	6ee68693          	addi	a3,a3,1774 # ffffffffc020f820 <dev_node_ops+0x6c0>
ffffffffc020a13a:	00002617          	auipc	a2,0x2
ffffffffc020a13e:	b7e60613          	addi	a2,a2,-1154 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a142:	11800593          	li	a1,280
ffffffffc020a146:	00005517          	auipc	a0,0x5
ffffffffc020a14a:	5da50513          	addi	a0,a0,1498 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a14e:	b50f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a152:	00005697          	auipc	a3,0x5
ffffffffc020a156:	71668693          	addi	a3,a3,1814 # ffffffffc020f868 <dev_node_ops+0x708>
ffffffffc020a15a:	00002617          	auipc	a2,0x2
ffffffffc020a15e:	b5e60613          	addi	a2,a2,-1186 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a162:	12100593          	li	a1,289
ffffffffc020a166:	00005517          	auipc	a0,0x5
ffffffffc020a16a:	5ba50513          	addi	a0,a0,1466 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a16e:	b30f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a172 <sfs_io_nolock>:
ffffffffc020a172:	7175                	addi	sp,sp,-144
ffffffffc020a174:	f0d2                	sd	s4,96(sp)
ffffffffc020a176:	8a2e                	mv	s4,a1
ffffffffc020a178:	618c                	ld	a1,0(a1)
ffffffffc020a17a:	e506                	sd	ra,136(sp)
ffffffffc020a17c:	e122                	sd	s0,128(sp)
ffffffffc020a17e:	0045d883          	lhu	a7,4(a1)
ffffffffc020a182:	fca6                	sd	s1,120(sp)
ffffffffc020a184:	f8ca                	sd	s2,112(sp)
ffffffffc020a186:	f4ce                	sd	s3,104(sp)
ffffffffc020a188:	ecd6                	sd	s5,88(sp)
ffffffffc020a18a:	e8da                	sd	s6,80(sp)
ffffffffc020a18c:	e4de                	sd	s7,72(sp)
ffffffffc020a18e:	e0e2                	sd	s8,64(sp)
ffffffffc020a190:	fc66                	sd	s9,56(sp)
ffffffffc020a192:	f86a                	sd	s10,48(sp)
ffffffffc020a194:	f46e                	sd	s11,40(sp)
ffffffffc020a196:	4809                	li	a6,2
ffffffffc020a198:	19088763          	beq	a7,a6,ffffffffc020a326 <sfs_io_nolock+0x1b4>
ffffffffc020a19c:	00073a83          	ld	s5,0(a4) # 4000 <_binary_bin_swap_img_size-0x3d00>
ffffffffc020a1a0:	8c3a                	mv	s8,a4
ffffffffc020a1a2:	000c3023          	sd	zero,0(s8)
ffffffffc020a1a6:	08000737          	lui	a4,0x8000
ffffffffc020a1aa:	84b6                	mv	s1,a3
ffffffffc020a1ac:	8d36                	mv	s10,a3
ffffffffc020a1ae:	9ab6                	add	s5,s5,a3
ffffffffc020a1b0:	16e6f963          	bgeu	a3,a4,ffffffffc020a322 <sfs_io_nolock+0x1b0>
ffffffffc020a1b4:	16dac763          	blt	s5,a3,ffffffffc020a322 <sfs_io_nolock+0x1b0>
ffffffffc020a1b8:	892a                	mv	s2,a0
ffffffffc020a1ba:	4501                	li	a0,0
ffffffffc020a1bc:	0d568263          	beq	a3,s5,ffffffffc020a280 <sfs_io_nolock+0x10e>
ffffffffc020a1c0:	8432                	mv	s0,a2
ffffffffc020a1c2:	01577463          	bgeu	a4,s5,ffffffffc020a1ca <sfs_io_nolock+0x58>
ffffffffc020a1c6:	08000ab7          	lui	s5,0x8000
ffffffffc020a1ca:	cbf1                	beqz	a5,ffffffffc020a29e <sfs_io_nolock+0x12c>
ffffffffc020a1cc:	00001797          	auipc	a5,0x1
ffffffffc020a1d0:	f0478793          	addi	a5,a5,-252 # ffffffffc020b0d0 <sfs_wbuf>
ffffffffc020a1d4:	00001c97          	auipc	s9,0x1
ffffffffc020a1d8:	e1cc8c93          	addi	s9,s9,-484 # ffffffffc020aff0 <sfs_wblock>
ffffffffc020a1dc:	e43e                	sd	a5,8(sp)
ffffffffc020a1de:	6705                	lui	a4,0x1
ffffffffc020a1e0:	40c4dd93          	srai	s11,s1,0xc
ffffffffc020a1e4:	40cadb13          	srai	s6,s5,0xc
ffffffffc020a1e8:	fff70b93          	addi	s7,a4,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc020a1ec:	41bb07bb          	subw	a5,s6,s11
ffffffffc020a1f0:	0174fbb3          	and	s7,s1,s7
ffffffffc020a1f4:	8b3e                	mv	s6,a5
ffffffffc020a1f6:	2d81                	sext.w	s11,s11
ffffffffc020a1f8:	89de                	mv	s3,s7
ffffffffc020a1fa:	020b8c63          	beqz	s7,ffffffffc020a232 <sfs_io_nolock+0xc0>
ffffffffc020a1fe:	409a89b3          	sub	s3,s5,s1
ffffffffc020a202:	efdd                	bnez	a5,ffffffffc020a2c0 <sfs_io_nolock+0x14e>
ffffffffc020a204:	0874                	addi	a3,sp,28
ffffffffc020a206:	866e                	mv	a2,s11
ffffffffc020a208:	85d2                	mv	a1,s4
ffffffffc020a20a:	854a                	mv	a0,s2
ffffffffc020a20c:	d0fff0ef          	jal	ra,ffffffffc0209f1a <sfs_bmap_load_nolock>
ffffffffc020a210:	e169                	bnez	a0,ffffffffc020a2d2 <sfs_io_nolock+0x160>
ffffffffc020a212:	46f2                	lw	a3,28(sp)
ffffffffc020a214:	67a2                	ld	a5,8(sp)
ffffffffc020a216:	875e                	mv	a4,s7
ffffffffc020a218:	864e                	mv	a2,s3
ffffffffc020a21a:	85a2                	mv	a1,s0
ffffffffc020a21c:	854a                	mv	a0,s2
ffffffffc020a21e:	9782                	jalr	a5
ffffffffc020a220:	e94d                	bnez	a0,ffffffffc020a2d2 <sfs_io_nolock+0x160>
ffffffffc020a222:	409a87b3          	sub	a5,s5,s1
ffffffffc020a226:	03378d63          	beq	a5,s3,ffffffffc020a260 <sfs_io_nolock+0xee>
ffffffffc020a22a:	944e                	add	s0,s0,s3
ffffffffc020a22c:	2d85                	addiw	s11,s11,1
ffffffffc020a22e:	fffb079b          	addiw	a5,s6,-1
ffffffffc020a232:	cfcd                	beqz	a5,ffffffffc020a2ec <sfs_io_nolock+0x17a>
ffffffffc020a234:	01b78bbb          	addw	s7,a5,s11
ffffffffc020a238:	6b05                	lui	s6,0x1
ffffffffc020a23a:	a821                	j	ffffffffc020a252 <sfs_io_nolock+0xe0>
ffffffffc020a23c:	4672                	lw	a2,28(sp)
ffffffffc020a23e:	4685                	li	a3,1
ffffffffc020a240:	85a2                	mv	a1,s0
ffffffffc020a242:	854a                	mv	a0,s2
ffffffffc020a244:	9c82                	jalr	s9
ffffffffc020a246:	ed09                	bnez	a0,ffffffffc020a260 <sfs_io_nolock+0xee>
ffffffffc020a248:	2d85                	addiw	s11,s11,1
ffffffffc020a24a:	99da                	add	s3,s3,s6
ffffffffc020a24c:	945a                	add	s0,s0,s6
ffffffffc020a24e:	0b7d8063          	beq	s11,s7,ffffffffc020a2ee <sfs_io_nolock+0x17c>
ffffffffc020a252:	0874                	addi	a3,sp,28
ffffffffc020a254:	866e                	mv	a2,s11
ffffffffc020a256:	85d2                	mv	a1,s4
ffffffffc020a258:	854a                	mv	a0,s2
ffffffffc020a25a:	cc1ff0ef          	jal	ra,ffffffffc0209f1a <sfs_bmap_load_nolock>
ffffffffc020a25e:	dd79                	beqz	a0,ffffffffc020a23c <sfs_io_nolock+0xca>
ffffffffc020a260:	01348d33          	add	s10,s1,s3
ffffffffc020a264:	000a3783          	ld	a5,0(s4)
ffffffffc020a268:	013c3023          	sd	s3,0(s8)
ffffffffc020a26c:	0007e703          	lwu	a4,0(a5)
ffffffffc020a270:	01a77863          	bgeu	a4,s10,ffffffffc020a280 <sfs_io_nolock+0x10e>
ffffffffc020a274:	013484bb          	addw	s1,s1,s3
ffffffffc020a278:	c384                	sw	s1,0(a5)
ffffffffc020a27a:	4785                	li	a5,1
ffffffffc020a27c:	00fa3823          	sd	a5,16(s4)
ffffffffc020a280:	60aa                	ld	ra,136(sp)
ffffffffc020a282:	640a                	ld	s0,128(sp)
ffffffffc020a284:	74e6                	ld	s1,120(sp)
ffffffffc020a286:	7946                	ld	s2,112(sp)
ffffffffc020a288:	79a6                	ld	s3,104(sp)
ffffffffc020a28a:	7a06                	ld	s4,96(sp)
ffffffffc020a28c:	6ae6                	ld	s5,88(sp)
ffffffffc020a28e:	6b46                	ld	s6,80(sp)
ffffffffc020a290:	6ba6                	ld	s7,72(sp)
ffffffffc020a292:	6c06                	ld	s8,64(sp)
ffffffffc020a294:	7ce2                	ld	s9,56(sp)
ffffffffc020a296:	7d42                	ld	s10,48(sp)
ffffffffc020a298:	7da2                	ld	s11,40(sp)
ffffffffc020a29a:	6149                	addi	sp,sp,144
ffffffffc020a29c:	8082                	ret
ffffffffc020a29e:	0005e783          	lwu	a5,0(a1)
ffffffffc020a2a2:	4501                	li	a0,0
ffffffffc020a2a4:	fcf4dee3          	bge	s1,a5,ffffffffc020a280 <sfs_io_nolock+0x10e>
ffffffffc020a2a8:	0357c763          	blt	a5,s5,ffffffffc020a2d6 <sfs_io_nolock+0x164>
ffffffffc020a2ac:	00001797          	auipc	a5,0x1
ffffffffc020a2b0:	da478793          	addi	a5,a5,-604 # ffffffffc020b050 <sfs_rbuf>
ffffffffc020a2b4:	00001c97          	auipc	s9,0x1
ffffffffc020a2b8:	cdcc8c93          	addi	s9,s9,-804 # ffffffffc020af90 <sfs_rblock>
ffffffffc020a2bc:	e43e                	sd	a5,8(sp)
ffffffffc020a2be:	b705                	j	ffffffffc020a1de <sfs_io_nolock+0x6c>
ffffffffc020a2c0:	0874                	addi	a3,sp,28
ffffffffc020a2c2:	866e                	mv	a2,s11
ffffffffc020a2c4:	85d2                	mv	a1,s4
ffffffffc020a2c6:	854a                	mv	a0,s2
ffffffffc020a2c8:	417709b3          	sub	s3,a4,s7
ffffffffc020a2cc:	c4fff0ef          	jal	ra,ffffffffc0209f1a <sfs_bmap_load_nolock>
ffffffffc020a2d0:	d129                	beqz	a0,ffffffffc020a212 <sfs_io_nolock+0xa0>
ffffffffc020a2d2:	4981                	li	s3,0
ffffffffc020a2d4:	bf41                	j	ffffffffc020a264 <sfs_io_nolock+0xf2>
ffffffffc020a2d6:	8abe                	mv	s5,a5
ffffffffc020a2d8:	00001797          	auipc	a5,0x1
ffffffffc020a2dc:	d7878793          	addi	a5,a5,-648 # ffffffffc020b050 <sfs_rbuf>
ffffffffc020a2e0:	00001c97          	auipc	s9,0x1
ffffffffc020a2e4:	cb0c8c93          	addi	s9,s9,-848 # ffffffffc020af90 <sfs_rblock>
ffffffffc020a2e8:	e43e                	sd	a5,8(sp)
ffffffffc020a2ea:	bdd5                	j	ffffffffc020a1de <sfs_io_nolock+0x6c>
ffffffffc020a2ec:	8bee                	mv	s7,s11
ffffffffc020a2ee:	1ad2                	slli	s5,s5,0x34
ffffffffc020a2f0:	034adb13          	srli	s6,s5,0x34
ffffffffc020a2f4:	000a9663          	bnez	s5,ffffffffc020a300 <sfs_io_nolock+0x18e>
ffffffffc020a2f8:	01348d33          	add	s10,s1,s3
ffffffffc020a2fc:	4501                	li	a0,0
ffffffffc020a2fe:	b79d                	j	ffffffffc020a264 <sfs_io_nolock+0xf2>
ffffffffc020a300:	0874                	addi	a3,sp,28
ffffffffc020a302:	865e                	mv	a2,s7
ffffffffc020a304:	85d2                	mv	a1,s4
ffffffffc020a306:	854a                	mv	a0,s2
ffffffffc020a308:	c13ff0ef          	jal	ra,ffffffffc0209f1a <sfs_bmap_load_nolock>
ffffffffc020a30c:	f931                	bnez	a0,ffffffffc020a260 <sfs_io_nolock+0xee>
ffffffffc020a30e:	46f2                	lw	a3,28(sp)
ffffffffc020a310:	67a2                	ld	a5,8(sp)
ffffffffc020a312:	4701                	li	a4,0
ffffffffc020a314:	865a                	mv	a2,s6
ffffffffc020a316:	85a2                	mv	a1,s0
ffffffffc020a318:	854a                	mv	a0,s2
ffffffffc020a31a:	9782                	jalr	a5
ffffffffc020a31c:	f131                	bnez	a0,ffffffffc020a260 <sfs_io_nolock+0xee>
ffffffffc020a31e:	99da                	add	s3,s3,s6
ffffffffc020a320:	b781                	j	ffffffffc020a260 <sfs_io_nolock+0xee>
ffffffffc020a322:	5575                	li	a0,-3
ffffffffc020a324:	bfb1                	j	ffffffffc020a280 <sfs_io_nolock+0x10e>
ffffffffc020a326:	00005697          	auipc	a3,0x5
ffffffffc020a32a:	56a68693          	addi	a3,a3,1386 # ffffffffc020f890 <dev_node_ops+0x730>
ffffffffc020a32e:	00002617          	auipc	a2,0x2
ffffffffc020a332:	98a60613          	addi	a2,a2,-1654 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a336:	22b00593          	li	a1,555
ffffffffc020a33a:	00005517          	auipc	a0,0x5
ffffffffc020a33e:	3e650513          	addi	a0,a0,998 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a342:	95cf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a346 <sfs_read>:
ffffffffc020a346:	7139                	addi	sp,sp,-64
ffffffffc020a348:	f04a                	sd	s2,32(sp)
ffffffffc020a34a:	06853903          	ld	s2,104(a0)
ffffffffc020a34e:	fc06                	sd	ra,56(sp)
ffffffffc020a350:	f822                	sd	s0,48(sp)
ffffffffc020a352:	f426                	sd	s1,40(sp)
ffffffffc020a354:	ec4e                	sd	s3,24(sp)
ffffffffc020a356:	04090f63          	beqz	s2,ffffffffc020a3b4 <sfs_read+0x6e>
ffffffffc020a35a:	0b092783          	lw	a5,176(s2)
ffffffffc020a35e:	ebb9                	bnez	a5,ffffffffc020a3b4 <sfs_read+0x6e>
ffffffffc020a360:	4d38                	lw	a4,88(a0)
ffffffffc020a362:	6785                	lui	a5,0x1
ffffffffc020a364:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a368:	842a                	mv	s0,a0
ffffffffc020a36a:	06f71563          	bne	a4,a5,ffffffffc020a3d4 <sfs_read+0x8e>
ffffffffc020a36e:	02050993          	addi	s3,a0,32
ffffffffc020a372:	854e                	mv	a0,s3
ffffffffc020a374:	84ae                	mv	s1,a1
ffffffffc020a376:	9eefa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a37a:	0184b803          	ld	a6,24(s1)
ffffffffc020a37e:	6494                	ld	a3,8(s1)
ffffffffc020a380:	6090                	ld	a2,0(s1)
ffffffffc020a382:	85a2                	mv	a1,s0
ffffffffc020a384:	4781                	li	a5,0
ffffffffc020a386:	0038                	addi	a4,sp,8
ffffffffc020a388:	854a                	mv	a0,s2
ffffffffc020a38a:	e442                	sd	a6,8(sp)
ffffffffc020a38c:	de7ff0ef          	jal	ra,ffffffffc020a172 <sfs_io_nolock>
ffffffffc020a390:	65a2                	ld	a1,8(sp)
ffffffffc020a392:	842a                	mv	s0,a0
ffffffffc020a394:	ed81                	bnez	a1,ffffffffc020a3ac <sfs_read+0x66>
ffffffffc020a396:	854e                	mv	a0,s3
ffffffffc020a398:	9c8fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a39c:	70e2                	ld	ra,56(sp)
ffffffffc020a39e:	8522                	mv	a0,s0
ffffffffc020a3a0:	7442                	ld	s0,48(sp)
ffffffffc020a3a2:	74a2                	ld	s1,40(sp)
ffffffffc020a3a4:	7902                	ld	s2,32(sp)
ffffffffc020a3a6:	69e2                	ld	s3,24(sp)
ffffffffc020a3a8:	6121                	addi	sp,sp,64
ffffffffc020a3aa:	8082                	ret
ffffffffc020a3ac:	8526                	mv	a0,s1
ffffffffc020a3ae:	83efb0ef          	jal	ra,ffffffffc02053ec <iobuf_skip>
ffffffffc020a3b2:	b7d5                	j	ffffffffc020a396 <sfs_read+0x50>
ffffffffc020a3b4:	00005697          	auipc	a3,0x5
ffffffffc020a3b8:	18c68693          	addi	a3,a3,396 # ffffffffc020f540 <dev_node_ops+0x3e0>
ffffffffc020a3bc:	00002617          	auipc	a2,0x2
ffffffffc020a3c0:	8fc60613          	addi	a2,a2,-1796 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a3c4:	2af00593          	li	a1,687
ffffffffc020a3c8:	00005517          	auipc	a0,0x5
ffffffffc020a3cc:	35850513          	addi	a0,a0,856 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a3d0:	8cef60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a3d4:	869ff0ef          	jal	ra,ffffffffc0209c3c <sfs_io.part.0>

ffffffffc020a3d8 <sfs_write>:
ffffffffc020a3d8:	7139                	addi	sp,sp,-64
ffffffffc020a3da:	f04a                	sd	s2,32(sp)
ffffffffc020a3dc:	06853903          	ld	s2,104(a0)
ffffffffc020a3e0:	fc06                	sd	ra,56(sp)
ffffffffc020a3e2:	f822                	sd	s0,48(sp)
ffffffffc020a3e4:	f426                	sd	s1,40(sp)
ffffffffc020a3e6:	ec4e                	sd	s3,24(sp)
ffffffffc020a3e8:	04090f63          	beqz	s2,ffffffffc020a446 <sfs_write+0x6e>
ffffffffc020a3ec:	0b092783          	lw	a5,176(s2)
ffffffffc020a3f0:	ebb9                	bnez	a5,ffffffffc020a446 <sfs_write+0x6e>
ffffffffc020a3f2:	4d38                	lw	a4,88(a0)
ffffffffc020a3f4:	6785                	lui	a5,0x1
ffffffffc020a3f6:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a3fa:	842a                	mv	s0,a0
ffffffffc020a3fc:	06f71563          	bne	a4,a5,ffffffffc020a466 <sfs_write+0x8e>
ffffffffc020a400:	02050993          	addi	s3,a0,32
ffffffffc020a404:	854e                	mv	a0,s3
ffffffffc020a406:	84ae                	mv	s1,a1
ffffffffc020a408:	95cfa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a40c:	0184b803          	ld	a6,24(s1)
ffffffffc020a410:	6494                	ld	a3,8(s1)
ffffffffc020a412:	6090                	ld	a2,0(s1)
ffffffffc020a414:	85a2                	mv	a1,s0
ffffffffc020a416:	4785                	li	a5,1
ffffffffc020a418:	0038                	addi	a4,sp,8
ffffffffc020a41a:	854a                	mv	a0,s2
ffffffffc020a41c:	e442                	sd	a6,8(sp)
ffffffffc020a41e:	d55ff0ef          	jal	ra,ffffffffc020a172 <sfs_io_nolock>
ffffffffc020a422:	65a2                	ld	a1,8(sp)
ffffffffc020a424:	842a                	mv	s0,a0
ffffffffc020a426:	ed81                	bnez	a1,ffffffffc020a43e <sfs_write+0x66>
ffffffffc020a428:	854e                	mv	a0,s3
ffffffffc020a42a:	936fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a42e:	70e2                	ld	ra,56(sp)
ffffffffc020a430:	8522                	mv	a0,s0
ffffffffc020a432:	7442                	ld	s0,48(sp)
ffffffffc020a434:	74a2                	ld	s1,40(sp)
ffffffffc020a436:	7902                	ld	s2,32(sp)
ffffffffc020a438:	69e2                	ld	s3,24(sp)
ffffffffc020a43a:	6121                	addi	sp,sp,64
ffffffffc020a43c:	8082                	ret
ffffffffc020a43e:	8526                	mv	a0,s1
ffffffffc020a440:	fadfa0ef          	jal	ra,ffffffffc02053ec <iobuf_skip>
ffffffffc020a444:	b7d5                	j	ffffffffc020a428 <sfs_write+0x50>
ffffffffc020a446:	00005697          	auipc	a3,0x5
ffffffffc020a44a:	0fa68693          	addi	a3,a3,250 # ffffffffc020f540 <dev_node_ops+0x3e0>
ffffffffc020a44e:	00002617          	auipc	a2,0x2
ffffffffc020a452:	86a60613          	addi	a2,a2,-1942 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a456:	2af00593          	li	a1,687
ffffffffc020a45a:	00005517          	auipc	a0,0x5
ffffffffc020a45e:	2c650513          	addi	a0,a0,710 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a462:	83cf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a466:	fd6ff0ef          	jal	ra,ffffffffc0209c3c <sfs_io.part.0>

ffffffffc020a46a <sfs_dirent_read_nolock>:
ffffffffc020a46a:	6198                	ld	a4,0(a1)
ffffffffc020a46c:	7179                	addi	sp,sp,-48
ffffffffc020a46e:	f406                	sd	ra,40(sp)
ffffffffc020a470:	00475883          	lhu	a7,4(a4)
ffffffffc020a474:	f022                	sd	s0,32(sp)
ffffffffc020a476:	ec26                	sd	s1,24(sp)
ffffffffc020a478:	4809                	li	a6,2
ffffffffc020a47a:	05089b63          	bne	a7,a6,ffffffffc020a4d0 <sfs_dirent_read_nolock+0x66>
ffffffffc020a47e:	4718                	lw	a4,8(a4)
ffffffffc020a480:	87b2                	mv	a5,a2
ffffffffc020a482:	2601                	sext.w	a2,a2
ffffffffc020a484:	04e7f663          	bgeu	a5,a4,ffffffffc020a4d0 <sfs_dirent_read_nolock+0x66>
ffffffffc020a488:	84b6                	mv	s1,a3
ffffffffc020a48a:	0074                	addi	a3,sp,12
ffffffffc020a48c:	842a                	mv	s0,a0
ffffffffc020a48e:	a8dff0ef          	jal	ra,ffffffffc0209f1a <sfs_bmap_load_nolock>
ffffffffc020a492:	c511                	beqz	a0,ffffffffc020a49e <sfs_dirent_read_nolock+0x34>
ffffffffc020a494:	70a2                	ld	ra,40(sp)
ffffffffc020a496:	7402                	ld	s0,32(sp)
ffffffffc020a498:	64e2                	ld	s1,24(sp)
ffffffffc020a49a:	6145                	addi	sp,sp,48
ffffffffc020a49c:	8082                	ret
ffffffffc020a49e:	45b2                	lw	a1,12(sp)
ffffffffc020a4a0:	4054                	lw	a3,4(s0)
ffffffffc020a4a2:	c5b9                	beqz	a1,ffffffffc020a4f0 <sfs_dirent_read_nolock+0x86>
ffffffffc020a4a4:	04d5f663          	bgeu	a1,a3,ffffffffc020a4f0 <sfs_dirent_read_nolock+0x86>
ffffffffc020a4a8:	7c08                	ld	a0,56(s0)
ffffffffc020a4aa:	ea9fe0ef          	jal	ra,ffffffffc0209352 <bitmap_test>
ffffffffc020a4ae:	ed31                	bnez	a0,ffffffffc020a50a <sfs_dirent_read_nolock+0xa0>
ffffffffc020a4b0:	46b2                	lw	a3,12(sp)
ffffffffc020a4b2:	4701                	li	a4,0
ffffffffc020a4b4:	10400613          	li	a2,260
ffffffffc020a4b8:	85a6                	mv	a1,s1
ffffffffc020a4ba:	8522                	mv	a0,s0
ffffffffc020a4bc:	395000ef          	jal	ra,ffffffffc020b050 <sfs_rbuf>
ffffffffc020a4c0:	f971                	bnez	a0,ffffffffc020a494 <sfs_dirent_read_nolock+0x2a>
ffffffffc020a4c2:	100481a3          	sb	zero,259(s1)
ffffffffc020a4c6:	70a2                	ld	ra,40(sp)
ffffffffc020a4c8:	7402                	ld	s0,32(sp)
ffffffffc020a4ca:	64e2                	ld	s1,24(sp)
ffffffffc020a4cc:	6145                	addi	sp,sp,48
ffffffffc020a4ce:	8082                	ret
ffffffffc020a4d0:	00005697          	auipc	a3,0x5
ffffffffc020a4d4:	3e068693          	addi	a3,a3,992 # ffffffffc020f8b0 <dev_node_ops+0x750>
ffffffffc020a4d8:	00001617          	auipc	a2,0x1
ffffffffc020a4dc:	7e060613          	addi	a2,a2,2016 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a4e0:	18e00593          	li	a1,398
ffffffffc020a4e4:	00005517          	auipc	a0,0x5
ffffffffc020a4e8:	23c50513          	addi	a0,a0,572 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a4ec:	fb3f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a4f0:	872e                	mv	a4,a1
ffffffffc020a4f2:	00005617          	auipc	a2,0x5
ffffffffc020a4f6:	25e60613          	addi	a2,a2,606 # ffffffffc020f750 <dev_node_ops+0x5f0>
ffffffffc020a4fa:	05300593          	li	a1,83
ffffffffc020a4fe:	00005517          	auipc	a0,0x5
ffffffffc020a502:	22250513          	addi	a0,a0,546 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a506:	f99f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a50a:	00005697          	auipc	a3,0x5
ffffffffc020a50e:	27e68693          	addi	a3,a3,638 # ffffffffc020f788 <dev_node_ops+0x628>
ffffffffc020a512:	00001617          	auipc	a2,0x1
ffffffffc020a516:	7a660613          	addi	a2,a2,1958 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a51a:	19500593          	li	a1,405
ffffffffc020a51e:	00005517          	auipc	a0,0x5
ffffffffc020a522:	20250513          	addi	a0,a0,514 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a526:	f79f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a52a <sfs_getdirentry>:
ffffffffc020a52a:	715d                	addi	sp,sp,-80
ffffffffc020a52c:	ec56                	sd	s5,24(sp)
ffffffffc020a52e:	8aaa                	mv	s5,a0
ffffffffc020a530:	10400513          	li	a0,260
ffffffffc020a534:	e85a                	sd	s6,16(sp)
ffffffffc020a536:	e486                	sd	ra,72(sp)
ffffffffc020a538:	e0a2                	sd	s0,64(sp)
ffffffffc020a53a:	fc26                	sd	s1,56(sp)
ffffffffc020a53c:	f84a                	sd	s2,48(sp)
ffffffffc020a53e:	f44e                	sd	s3,40(sp)
ffffffffc020a540:	f052                	sd	s4,32(sp)
ffffffffc020a542:	e45e                	sd	s7,8(sp)
ffffffffc020a544:	e062                	sd	s8,0(sp)
ffffffffc020a546:	8b2e                	mv	s6,a1
ffffffffc020a548:	a47f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a54c:	cd61                	beqz	a0,ffffffffc020a624 <sfs_getdirentry+0xfa>
ffffffffc020a54e:	068abb83          	ld	s7,104(s5) # 8000068 <_binary_bin_sfs_img_size+0x7f8ad68>
ffffffffc020a552:	0c0b8b63          	beqz	s7,ffffffffc020a628 <sfs_getdirentry+0xfe>
ffffffffc020a556:	0b0ba783          	lw	a5,176(s7) # 10b0 <_binary_bin_swap_img_size-0x6c50>
ffffffffc020a55a:	e7f9                	bnez	a5,ffffffffc020a628 <sfs_getdirentry+0xfe>
ffffffffc020a55c:	058aa703          	lw	a4,88(s5)
ffffffffc020a560:	6785                	lui	a5,0x1
ffffffffc020a562:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a566:	0ef71163          	bne	a4,a5,ffffffffc020a648 <sfs_getdirentry+0x11e>
ffffffffc020a56a:	008b3983          	ld	s3,8(s6) # 1008 <_binary_bin_swap_img_size-0x6cf8>
ffffffffc020a56e:	892a                	mv	s2,a0
ffffffffc020a570:	0a09c163          	bltz	s3,ffffffffc020a612 <sfs_getdirentry+0xe8>
ffffffffc020a574:	0ff9f793          	zext.b	a5,s3
ffffffffc020a578:	efc9                	bnez	a5,ffffffffc020a612 <sfs_getdirentry+0xe8>
ffffffffc020a57a:	000ab783          	ld	a5,0(s5)
ffffffffc020a57e:	0089d993          	srli	s3,s3,0x8
ffffffffc020a582:	2981                	sext.w	s3,s3
ffffffffc020a584:	479c                	lw	a5,8(a5)
ffffffffc020a586:	0937eb63          	bltu	a5,s3,ffffffffc020a61c <sfs_getdirentry+0xf2>
ffffffffc020a58a:	020a8c13          	addi	s8,s5,32
ffffffffc020a58e:	8562                	mv	a0,s8
ffffffffc020a590:	fd5f90ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a594:	000ab783          	ld	a5,0(s5)
ffffffffc020a598:	0087aa03          	lw	s4,8(a5)
ffffffffc020a59c:	07405663          	blez	s4,ffffffffc020a608 <sfs_getdirentry+0xde>
ffffffffc020a5a0:	4481                	li	s1,0
ffffffffc020a5a2:	a811                	j	ffffffffc020a5b6 <sfs_getdirentry+0x8c>
ffffffffc020a5a4:	00092783          	lw	a5,0(s2)
ffffffffc020a5a8:	c781                	beqz	a5,ffffffffc020a5b0 <sfs_getdirentry+0x86>
ffffffffc020a5aa:	02098263          	beqz	s3,ffffffffc020a5ce <sfs_getdirentry+0xa4>
ffffffffc020a5ae:	39fd                	addiw	s3,s3,-1
ffffffffc020a5b0:	2485                	addiw	s1,s1,1
ffffffffc020a5b2:	049a0b63          	beq	s4,s1,ffffffffc020a608 <sfs_getdirentry+0xde>
ffffffffc020a5b6:	86ca                	mv	a3,s2
ffffffffc020a5b8:	8626                	mv	a2,s1
ffffffffc020a5ba:	85d6                	mv	a1,s5
ffffffffc020a5bc:	855e                	mv	a0,s7
ffffffffc020a5be:	eadff0ef          	jal	ra,ffffffffc020a46a <sfs_dirent_read_nolock>
ffffffffc020a5c2:	842a                	mv	s0,a0
ffffffffc020a5c4:	d165                	beqz	a0,ffffffffc020a5a4 <sfs_getdirentry+0x7a>
ffffffffc020a5c6:	8562                	mv	a0,s8
ffffffffc020a5c8:	f99f90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a5cc:	a831                	j	ffffffffc020a5e8 <sfs_getdirentry+0xbe>
ffffffffc020a5ce:	8562                	mv	a0,s8
ffffffffc020a5d0:	f91f90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a5d4:	4701                	li	a4,0
ffffffffc020a5d6:	4685                	li	a3,1
ffffffffc020a5d8:	10000613          	li	a2,256
ffffffffc020a5dc:	00490593          	addi	a1,s2,4
ffffffffc020a5e0:	855a                	mv	a0,s6
ffffffffc020a5e2:	d9ffa0ef          	jal	ra,ffffffffc0205380 <iobuf_move>
ffffffffc020a5e6:	842a                	mv	s0,a0
ffffffffc020a5e8:	854a                	mv	a0,s2
ffffffffc020a5ea:	a55f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a5ee:	60a6                	ld	ra,72(sp)
ffffffffc020a5f0:	8522                	mv	a0,s0
ffffffffc020a5f2:	6406                	ld	s0,64(sp)
ffffffffc020a5f4:	74e2                	ld	s1,56(sp)
ffffffffc020a5f6:	7942                	ld	s2,48(sp)
ffffffffc020a5f8:	79a2                	ld	s3,40(sp)
ffffffffc020a5fa:	7a02                	ld	s4,32(sp)
ffffffffc020a5fc:	6ae2                	ld	s5,24(sp)
ffffffffc020a5fe:	6b42                	ld	s6,16(sp)
ffffffffc020a600:	6ba2                	ld	s7,8(sp)
ffffffffc020a602:	6c02                	ld	s8,0(sp)
ffffffffc020a604:	6161                	addi	sp,sp,80
ffffffffc020a606:	8082                	ret
ffffffffc020a608:	8562                	mv	a0,s8
ffffffffc020a60a:	5441                	li	s0,-16
ffffffffc020a60c:	f55f90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a610:	bfe1                	j	ffffffffc020a5e8 <sfs_getdirentry+0xbe>
ffffffffc020a612:	854a                	mv	a0,s2
ffffffffc020a614:	a2bf70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a618:	5475                	li	s0,-3
ffffffffc020a61a:	bfd1                	j	ffffffffc020a5ee <sfs_getdirentry+0xc4>
ffffffffc020a61c:	a23f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a620:	5441                	li	s0,-16
ffffffffc020a622:	b7f1                	j	ffffffffc020a5ee <sfs_getdirentry+0xc4>
ffffffffc020a624:	5471                	li	s0,-4
ffffffffc020a626:	b7e1                	j	ffffffffc020a5ee <sfs_getdirentry+0xc4>
ffffffffc020a628:	00005697          	auipc	a3,0x5
ffffffffc020a62c:	f1868693          	addi	a3,a3,-232 # ffffffffc020f540 <dev_node_ops+0x3e0>
ffffffffc020a630:	00001617          	auipc	a2,0x1
ffffffffc020a634:	68860613          	addi	a2,a2,1672 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a638:	35300593          	li	a1,851
ffffffffc020a63c:	00005517          	auipc	a0,0x5
ffffffffc020a640:	0e450513          	addi	a0,a0,228 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a644:	e5bf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a648:	00005697          	auipc	a3,0x5
ffffffffc020a64c:	0a068693          	addi	a3,a3,160 # ffffffffc020f6e8 <dev_node_ops+0x588>
ffffffffc020a650:	00001617          	auipc	a2,0x1
ffffffffc020a654:	66860613          	addi	a2,a2,1640 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a658:	35400593          	li	a1,852
ffffffffc020a65c:	00005517          	auipc	a0,0x5
ffffffffc020a660:	0c450513          	addi	a0,a0,196 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a664:	e3bf50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a668 <sfs_dirent_search_nolock.constprop.0>:
ffffffffc020a668:	715d                	addi	sp,sp,-80
ffffffffc020a66a:	f052                	sd	s4,32(sp)
ffffffffc020a66c:	8a2a                	mv	s4,a0
ffffffffc020a66e:	8532                	mv	a0,a2
ffffffffc020a670:	f44e                	sd	s3,40(sp)
ffffffffc020a672:	e85a                	sd	s6,16(sp)
ffffffffc020a674:	e45e                	sd	s7,8(sp)
ffffffffc020a676:	e486                	sd	ra,72(sp)
ffffffffc020a678:	e0a2                	sd	s0,64(sp)
ffffffffc020a67a:	fc26                	sd	s1,56(sp)
ffffffffc020a67c:	f84a                	sd	s2,48(sp)
ffffffffc020a67e:	ec56                	sd	s5,24(sp)
ffffffffc020a680:	e062                	sd	s8,0(sp)
ffffffffc020a682:	8b32                	mv	s6,a2
ffffffffc020a684:	89ae                	mv	s3,a1
ffffffffc020a686:	8bb6                	mv	s7,a3
ffffffffc020a688:	0aa010ef          	jal	ra,ffffffffc020b732 <strlen>
ffffffffc020a68c:	0ff00793          	li	a5,255
ffffffffc020a690:	06a7ef63          	bltu	a5,a0,ffffffffc020a70e <sfs_dirent_search_nolock.constprop.0+0xa6>
ffffffffc020a694:	10400513          	li	a0,260
ffffffffc020a698:	8f7f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a69c:	892a                	mv	s2,a0
ffffffffc020a69e:	c535                	beqz	a0,ffffffffc020a70a <sfs_dirent_search_nolock.constprop.0+0xa2>
ffffffffc020a6a0:	0009b783          	ld	a5,0(s3)
ffffffffc020a6a4:	0087aa83          	lw	s5,8(a5)
ffffffffc020a6a8:	05505a63          	blez	s5,ffffffffc020a6fc <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a6ac:	4481                	li	s1,0
ffffffffc020a6ae:	00450c13          	addi	s8,a0,4
ffffffffc020a6b2:	a829                	j	ffffffffc020a6cc <sfs_dirent_search_nolock.constprop.0+0x64>
ffffffffc020a6b4:	00092783          	lw	a5,0(s2)
ffffffffc020a6b8:	c799                	beqz	a5,ffffffffc020a6c6 <sfs_dirent_search_nolock.constprop.0+0x5e>
ffffffffc020a6ba:	85e2                	mv	a1,s8
ffffffffc020a6bc:	855a                	mv	a0,s6
ffffffffc020a6be:	0bc010ef          	jal	ra,ffffffffc020b77a <strcmp>
ffffffffc020a6c2:	842a                	mv	s0,a0
ffffffffc020a6c4:	cd15                	beqz	a0,ffffffffc020a700 <sfs_dirent_search_nolock.constprop.0+0x98>
ffffffffc020a6c6:	2485                	addiw	s1,s1,1
ffffffffc020a6c8:	029a8a63          	beq	s5,s1,ffffffffc020a6fc <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a6cc:	86ca                	mv	a3,s2
ffffffffc020a6ce:	8626                	mv	a2,s1
ffffffffc020a6d0:	85ce                	mv	a1,s3
ffffffffc020a6d2:	8552                	mv	a0,s4
ffffffffc020a6d4:	d97ff0ef          	jal	ra,ffffffffc020a46a <sfs_dirent_read_nolock>
ffffffffc020a6d8:	842a                	mv	s0,a0
ffffffffc020a6da:	dd69                	beqz	a0,ffffffffc020a6b4 <sfs_dirent_search_nolock.constprop.0+0x4c>
ffffffffc020a6dc:	854a                	mv	a0,s2
ffffffffc020a6de:	961f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a6e2:	60a6                	ld	ra,72(sp)
ffffffffc020a6e4:	8522                	mv	a0,s0
ffffffffc020a6e6:	6406                	ld	s0,64(sp)
ffffffffc020a6e8:	74e2                	ld	s1,56(sp)
ffffffffc020a6ea:	7942                	ld	s2,48(sp)
ffffffffc020a6ec:	79a2                	ld	s3,40(sp)
ffffffffc020a6ee:	7a02                	ld	s4,32(sp)
ffffffffc020a6f0:	6ae2                	ld	s5,24(sp)
ffffffffc020a6f2:	6b42                	ld	s6,16(sp)
ffffffffc020a6f4:	6ba2                	ld	s7,8(sp)
ffffffffc020a6f6:	6c02                	ld	s8,0(sp)
ffffffffc020a6f8:	6161                	addi	sp,sp,80
ffffffffc020a6fa:	8082                	ret
ffffffffc020a6fc:	5441                	li	s0,-16
ffffffffc020a6fe:	bff9                	j	ffffffffc020a6dc <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a700:	00092783          	lw	a5,0(s2)
ffffffffc020a704:	00fba023          	sw	a5,0(s7)
ffffffffc020a708:	bfd1                	j	ffffffffc020a6dc <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a70a:	5471                	li	s0,-4
ffffffffc020a70c:	bfd9                	j	ffffffffc020a6e2 <sfs_dirent_search_nolock.constprop.0+0x7a>
ffffffffc020a70e:	00005697          	auipc	a3,0x5
ffffffffc020a712:	1f268693          	addi	a3,a3,498 # ffffffffc020f900 <dev_node_ops+0x7a0>
ffffffffc020a716:	00001617          	auipc	a2,0x1
ffffffffc020a71a:	5a260613          	addi	a2,a2,1442 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a71e:	1ba00593          	li	a1,442
ffffffffc020a722:	00005517          	auipc	a0,0x5
ffffffffc020a726:	ffe50513          	addi	a0,a0,-2 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a72a:	d75f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a72e <sfs_truncfile>:
ffffffffc020a72e:	7175                	addi	sp,sp,-144
ffffffffc020a730:	e506                	sd	ra,136(sp)
ffffffffc020a732:	e122                	sd	s0,128(sp)
ffffffffc020a734:	fca6                	sd	s1,120(sp)
ffffffffc020a736:	f8ca                	sd	s2,112(sp)
ffffffffc020a738:	f4ce                	sd	s3,104(sp)
ffffffffc020a73a:	f0d2                	sd	s4,96(sp)
ffffffffc020a73c:	ecd6                	sd	s5,88(sp)
ffffffffc020a73e:	e8da                	sd	s6,80(sp)
ffffffffc020a740:	e4de                	sd	s7,72(sp)
ffffffffc020a742:	e0e2                	sd	s8,64(sp)
ffffffffc020a744:	fc66                	sd	s9,56(sp)
ffffffffc020a746:	f86a                	sd	s10,48(sp)
ffffffffc020a748:	f46e                	sd	s11,40(sp)
ffffffffc020a74a:	080007b7          	lui	a5,0x8000
ffffffffc020a74e:	16b7e463          	bltu	a5,a1,ffffffffc020a8b6 <sfs_truncfile+0x188>
ffffffffc020a752:	06853c83          	ld	s9,104(a0)
ffffffffc020a756:	89aa                	mv	s3,a0
ffffffffc020a758:	160c8163          	beqz	s9,ffffffffc020a8ba <sfs_truncfile+0x18c>
ffffffffc020a75c:	0b0ca783          	lw	a5,176(s9)
ffffffffc020a760:	14079d63          	bnez	a5,ffffffffc020a8ba <sfs_truncfile+0x18c>
ffffffffc020a764:	4d38                	lw	a4,88(a0)
ffffffffc020a766:	6405                	lui	s0,0x1
ffffffffc020a768:	23540793          	addi	a5,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a76c:	16f71763          	bne	a4,a5,ffffffffc020a8da <sfs_truncfile+0x1ac>
ffffffffc020a770:	00053a83          	ld	s5,0(a0)
ffffffffc020a774:	147d                	addi	s0,s0,-1
ffffffffc020a776:	942e                	add	s0,s0,a1
ffffffffc020a778:	000ae783          	lwu	a5,0(s5)
ffffffffc020a77c:	8031                	srli	s0,s0,0xc
ffffffffc020a77e:	8a2e                	mv	s4,a1
ffffffffc020a780:	2401                	sext.w	s0,s0
ffffffffc020a782:	02b79763          	bne	a5,a1,ffffffffc020a7b0 <sfs_truncfile+0x82>
ffffffffc020a786:	008aa783          	lw	a5,8(s5)
ffffffffc020a78a:	4901                	li	s2,0
ffffffffc020a78c:	18879763          	bne	a5,s0,ffffffffc020a91a <sfs_truncfile+0x1ec>
ffffffffc020a790:	60aa                	ld	ra,136(sp)
ffffffffc020a792:	640a                	ld	s0,128(sp)
ffffffffc020a794:	74e6                	ld	s1,120(sp)
ffffffffc020a796:	79a6                	ld	s3,104(sp)
ffffffffc020a798:	7a06                	ld	s4,96(sp)
ffffffffc020a79a:	6ae6                	ld	s5,88(sp)
ffffffffc020a79c:	6b46                	ld	s6,80(sp)
ffffffffc020a79e:	6ba6                	ld	s7,72(sp)
ffffffffc020a7a0:	6c06                	ld	s8,64(sp)
ffffffffc020a7a2:	7ce2                	ld	s9,56(sp)
ffffffffc020a7a4:	7d42                	ld	s10,48(sp)
ffffffffc020a7a6:	7da2                	ld	s11,40(sp)
ffffffffc020a7a8:	854a                	mv	a0,s2
ffffffffc020a7aa:	7946                	ld	s2,112(sp)
ffffffffc020a7ac:	6149                	addi	sp,sp,144
ffffffffc020a7ae:	8082                	ret
ffffffffc020a7b0:	02050b13          	addi	s6,a0,32
ffffffffc020a7b4:	855a                	mv	a0,s6
ffffffffc020a7b6:	daff90ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a7ba:	008aa483          	lw	s1,8(s5)
ffffffffc020a7be:	0a84e663          	bltu	s1,s0,ffffffffc020a86a <sfs_truncfile+0x13c>
ffffffffc020a7c2:	0c947163          	bgeu	s0,s1,ffffffffc020a884 <sfs_truncfile+0x156>
ffffffffc020a7c6:	4dad                	li	s11,11
ffffffffc020a7c8:	4b85                	li	s7,1
ffffffffc020a7ca:	a09d                	j	ffffffffc020a830 <sfs_truncfile+0x102>
ffffffffc020a7cc:	ff37091b          	addiw	s2,a4,-13
ffffffffc020a7d0:	0009079b          	sext.w	a5,s2
ffffffffc020a7d4:	3ff00713          	li	a4,1023
ffffffffc020a7d8:	04f76563          	bltu	a4,a5,ffffffffc020a822 <sfs_truncfile+0xf4>
ffffffffc020a7dc:	03cd2c03          	lw	s8,60(s10)
ffffffffc020a7e0:	040c0163          	beqz	s8,ffffffffc020a822 <sfs_truncfile+0xf4>
ffffffffc020a7e4:	004ca783          	lw	a5,4(s9)
ffffffffc020a7e8:	18fc7963          	bgeu	s8,a5,ffffffffc020a97a <sfs_truncfile+0x24c>
ffffffffc020a7ec:	038cb503          	ld	a0,56(s9)
ffffffffc020a7f0:	85e2                	mv	a1,s8
ffffffffc020a7f2:	b61fe0ef          	jal	ra,ffffffffc0209352 <bitmap_test>
ffffffffc020a7f6:	16051263          	bnez	a0,ffffffffc020a95a <sfs_truncfile+0x22c>
ffffffffc020a7fa:	02091793          	slli	a5,s2,0x20
ffffffffc020a7fe:	01e7d713          	srli	a4,a5,0x1e
ffffffffc020a802:	86e2                	mv	a3,s8
ffffffffc020a804:	4611                	li	a2,4
ffffffffc020a806:	082c                	addi	a1,sp,24
ffffffffc020a808:	8566                	mv	a0,s9
ffffffffc020a80a:	e43a                	sd	a4,8(sp)
ffffffffc020a80c:	ce02                	sw	zero,28(sp)
ffffffffc020a80e:	043000ef          	jal	ra,ffffffffc020b050 <sfs_rbuf>
ffffffffc020a812:	892a                	mv	s2,a0
ffffffffc020a814:	e141                	bnez	a0,ffffffffc020a894 <sfs_truncfile+0x166>
ffffffffc020a816:	47e2                	lw	a5,24(sp)
ffffffffc020a818:	6722                	ld	a4,8(sp)
ffffffffc020a81a:	e3c9                	bnez	a5,ffffffffc020a89c <sfs_truncfile+0x16e>
ffffffffc020a81c:	008d2603          	lw	a2,8(s10)
ffffffffc020a820:	367d                	addiw	a2,a2,-1
ffffffffc020a822:	00cd2423          	sw	a2,8(s10)
ffffffffc020a826:	0179b823          	sd	s7,16(s3)
ffffffffc020a82a:	34fd                	addiw	s1,s1,-1
ffffffffc020a82c:	04940a63          	beq	s0,s1,ffffffffc020a880 <sfs_truncfile+0x152>
ffffffffc020a830:	0009bd03          	ld	s10,0(s3)
ffffffffc020a834:	008d2703          	lw	a4,8(s10)
ffffffffc020a838:	c369                	beqz	a4,ffffffffc020a8fa <sfs_truncfile+0x1cc>
ffffffffc020a83a:	fff7079b          	addiw	a5,a4,-1
ffffffffc020a83e:	0007861b          	sext.w	a2,a5
ffffffffc020a842:	f8cde5e3          	bltu	s11,a2,ffffffffc020a7cc <sfs_truncfile+0x9e>
ffffffffc020a846:	02079713          	slli	a4,a5,0x20
ffffffffc020a84a:	01e75793          	srli	a5,a4,0x1e
ffffffffc020a84e:	00fd0933          	add	s2,s10,a5
ffffffffc020a852:	00c92583          	lw	a1,12(s2)
ffffffffc020a856:	d5f1                	beqz	a1,ffffffffc020a822 <sfs_truncfile+0xf4>
ffffffffc020a858:	8566                	mv	a0,s9
ffffffffc020a85a:	c06ff0ef          	jal	ra,ffffffffc0209c60 <sfs_block_free>
ffffffffc020a85e:	00092623          	sw	zero,12(s2)
ffffffffc020a862:	008d2603          	lw	a2,8(s10)
ffffffffc020a866:	367d                	addiw	a2,a2,-1
ffffffffc020a868:	bf6d                	j	ffffffffc020a822 <sfs_truncfile+0xf4>
ffffffffc020a86a:	4681                	li	a3,0
ffffffffc020a86c:	8626                	mv	a2,s1
ffffffffc020a86e:	85ce                	mv	a1,s3
ffffffffc020a870:	8566                	mv	a0,s9
ffffffffc020a872:	ea8ff0ef          	jal	ra,ffffffffc0209f1a <sfs_bmap_load_nolock>
ffffffffc020a876:	892a                	mv	s2,a0
ffffffffc020a878:	ed11                	bnez	a0,ffffffffc020a894 <sfs_truncfile+0x166>
ffffffffc020a87a:	2485                	addiw	s1,s1,1
ffffffffc020a87c:	fe9417e3          	bne	s0,s1,ffffffffc020a86a <sfs_truncfile+0x13c>
ffffffffc020a880:	008aa483          	lw	s1,8(s5)
ffffffffc020a884:	0a941b63          	bne	s0,s1,ffffffffc020a93a <sfs_truncfile+0x20c>
ffffffffc020a888:	014aa023          	sw	s4,0(s5)
ffffffffc020a88c:	4785                	li	a5,1
ffffffffc020a88e:	00f9b823          	sd	a5,16(s3)
ffffffffc020a892:	4901                	li	s2,0
ffffffffc020a894:	855a                	mv	a0,s6
ffffffffc020a896:	ccbf90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a89a:	bddd                	j	ffffffffc020a790 <sfs_truncfile+0x62>
ffffffffc020a89c:	86e2                	mv	a3,s8
ffffffffc020a89e:	4611                	li	a2,4
ffffffffc020a8a0:	086c                	addi	a1,sp,28
ffffffffc020a8a2:	8566                	mv	a0,s9
ffffffffc020a8a4:	02d000ef          	jal	ra,ffffffffc020b0d0 <sfs_wbuf>
ffffffffc020a8a8:	892a                	mv	s2,a0
ffffffffc020a8aa:	f56d                	bnez	a0,ffffffffc020a894 <sfs_truncfile+0x166>
ffffffffc020a8ac:	45e2                	lw	a1,24(sp)
ffffffffc020a8ae:	8566                	mv	a0,s9
ffffffffc020a8b0:	bb0ff0ef          	jal	ra,ffffffffc0209c60 <sfs_block_free>
ffffffffc020a8b4:	b7a5                	j	ffffffffc020a81c <sfs_truncfile+0xee>
ffffffffc020a8b6:	5975                	li	s2,-3
ffffffffc020a8b8:	bde1                	j	ffffffffc020a790 <sfs_truncfile+0x62>
ffffffffc020a8ba:	00005697          	auipc	a3,0x5
ffffffffc020a8be:	c8668693          	addi	a3,a3,-890 # ffffffffc020f540 <dev_node_ops+0x3e0>
ffffffffc020a8c2:	00001617          	auipc	a2,0x1
ffffffffc020a8c6:	3f660613          	addi	a2,a2,1014 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a8ca:	3c200593          	li	a1,962
ffffffffc020a8ce:	00005517          	auipc	a0,0x5
ffffffffc020a8d2:	e5250513          	addi	a0,a0,-430 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a8d6:	bc9f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a8da:	00005697          	auipc	a3,0x5
ffffffffc020a8de:	e0e68693          	addi	a3,a3,-498 # ffffffffc020f6e8 <dev_node_ops+0x588>
ffffffffc020a8e2:	00001617          	auipc	a2,0x1
ffffffffc020a8e6:	3d660613          	addi	a2,a2,982 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a8ea:	3c300593          	li	a1,963
ffffffffc020a8ee:	00005517          	auipc	a0,0x5
ffffffffc020a8f2:	e3250513          	addi	a0,a0,-462 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a8f6:	ba9f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a8fa:	00005697          	auipc	a3,0x5
ffffffffc020a8fe:	04668693          	addi	a3,a3,70 # ffffffffc020f940 <dev_node_ops+0x7e0>
ffffffffc020a902:	00001617          	auipc	a2,0x1
ffffffffc020a906:	3b660613          	addi	a2,a2,950 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a90a:	17b00593          	li	a1,379
ffffffffc020a90e:	00005517          	auipc	a0,0x5
ffffffffc020a912:	e1250513          	addi	a0,a0,-494 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a916:	b89f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a91a:	00005697          	auipc	a3,0x5
ffffffffc020a91e:	00e68693          	addi	a3,a3,14 # ffffffffc020f928 <dev_node_ops+0x7c8>
ffffffffc020a922:	00001617          	auipc	a2,0x1
ffffffffc020a926:	39660613          	addi	a2,a2,918 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a92a:	3ca00593          	li	a1,970
ffffffffc020a92e:	00005517          	auipc	a0,0x5
ffffffffc020a932:	df250513          	addi	a0,a0,-526 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a936:	b69f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a93a:	00005697          	auipc	a3,0x5
ffffffffc020a93e:	05668693          	addi	a3,a3,86 # ffffffffc020f990 <dev_node_ops+0x830>
ffffffffc020a942:	00001617          	auipc	a2,0x1
ffffffffc020a946:	37660613          	addi	a2,a2,886 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a94a:	3e300593          	li	a1,995
ffffffffc020a94e:	00005517          	auipc	a0,0x5
ffffffffc020a952:	dd250513          	addi	a0,a0,-558 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a956:	b49f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a95a:	00005697          	auipc	a3,0x5
ffffffffc020a95e:	ffe68693          	addi	a3,a3,-2 # ffffffffc020f958 <dev_node_ops+0x7f8>
ffffffffc020a962:	00001617          	auipc	a2,0x1
ffffffffc020a966:	35660613          	addi	a2,a2,854 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020a96a:	12b00593          	li	a1,299
ffffffffc020a96e:	00005517          	auipc	a0,0x5
ffffffffc020a972:	db250513          	addi	a0,a0,-590 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a976:	b29f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a97a:	8762                	mv	a4,s8
ffffffffc020a97c:	86be                	mv	a3,a5
ffffffffc020a97e:	00005617          	auipc	a2,0x5
ffffffffc020a982:	dd260613          	addi	a2,a2,-558 # ffffffffc020f750 <dev_node_ops+0x5f0>
ffffffffc020a986:	05300593          	li	a1,83
ffffffffc020a98a:	00005517          	auipc	a0,0x5
ffffffffc020a98e:	d9650513          	addi	a0,a0,-618 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020a992:	b0df50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a996 <sfs_load_inode>:
ffffffffc020a996:	7139                	addi	sp,sp,-64
ffffffffc020a998:	fc06                	sd	ra,56(sp)
ffffffffc020a99a:	f822                	sd	s0,48(sp)
ffffffffc020a99c:	f426                	sd	s1,40(sp)
ffffffffc020a99e:	f04a                	sd	s2,32(sp)
ffffffffc020a9a0:	84b2                	mv	s1,a2
ffffffffc020a9a2:	892a                	mv	s2,a0
ffffffffc020a9a4:	ec4e                	sd	s3,24(sp)
ffffffffc020a9a6:	e852                	sd	s4,16(sp)
ffffffffc020a9a8:	89ae                	mv	s3,a1
ffffffffc020a9aa:	e456                	sd	s5,8(sp)
ffffffffc020a9ac:	0d5000ef          	jal	ra,ffffffffc020b280 <lock_sfs_fs>
ffffffffc020a9b0:	45a9                	li	a1,10
ffffffffc020a9b2:	8526                	mv	a0,s1
ffffffffc020a9b4:	0a893403          	ld	s0,168(s2)
ffffffffc020a9b8:	0e9000ef          	jal	ra,ffffffffc020b2a0 <hash32>
ffffffffc020a9bc:	02051793          	slli	a5,a0,0x20
ffffffffc020a9c0:	01c7d713          	srli	a4,a5,0x1c
ffffffffc020a9c4:	9722                	add	a4,a4,s0
ffffffffc020a9c6:	843a                	mv	s0,a4
ffffffffc020a9c8:	a029                	j	ffffffffc020a9d2 <sfs_load_inode+0x3c>
ffffffffc020a9ca:	fc042783          	lw	a5,-64(s0)
ffffffffc020a9ce:	10978863          	beq	a5,s1,ffffffffc020aade <sfs_load_inode+0x148>
ffffffffc020a9d2:	6400                	ld	s0,8(s0)
ffffffffc020a9d4:	fe871be3          	bne	a4,s0,ffffffffc020a9ca <sfs_load_inode+0x34>
ffffffffc020a9d8:	04000513          	li	a0,64
ffffffffc020a9dc:	db2f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a9e0:	8aaa                	mv	s5,a0
ffffffffc020a9e2:	16050563          	beqz	a0,ffffffffc020ab4c <sfs_load_inode+0x1b6>
ffffffffc020a9e6:	00492683          	lw	a3,4(s2)
ffffffffc020a9ea:	18048363          	beqz	s1,ffffffffc020ab70 <sfs_load_inode+0x1da>
ffffffffc020a9ee:	18d4f163          	bgeu	s1,a3,ffffffffc020ab70 <sfs_load_inode+0x1da>
ffffffffc020a9f2:	03893503          	ld	a0,56(s2)
ffffffffc020a9f6:	85a6                	mv	a1,s1
ffffffffc020a9f8:	95bfe0ef          	jal	ra,ffffffffc0209352 <bitmap_test>
ffffffffc020a9fc:	18051763          	bnez	a0,ffffffffc020ab8a <sfs_load_inode+0x1f4>
ffffffffc020aa00:	4701                	li	a4,0
ffffffffc020aa02:	86a6                	mv	a3,s1
ffffffffc020aa04:	04000613          	li	a2,64
ffffffffc020aa08:	85d6                	mv	a1,s5
ffffffffc020aa0a:	854a                	mv	a0,s2
ffffffffc020aa0c:	644000ef          	jal	ra,ffffffffc020b050 <sfs_rbuf>
ffffffffc020aa10:	842a                	mv	s0,a0
ffffffffc020aa12:	0e051563          	bnez	a0,ffffffffc020aafc <sfs_load_inode+0x166>
ffffffffc020aa16:	006ad783          	lhu	a5,6(s5)
ffffffffc020aa1a:	12078b63          	beqz	a5,ffffffffc020ab50 <sfs_load_inode+0x1ba>
ffffffffc020aa1e:	6405                	lui	s0,0x1
ffffffffc020aa20:	23540513          	addi	a0,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020aa24:	8e8fd0ef          	jal	ra,ffffffffc0207b0c <__alloc_inode>
ffffffffc020aa28:	8a2a                	mv	s4,a0
ffffffffc020aa2a:	c961                	beqz	a0,ffffffffc020aafa <sfs_load_inode+0x164>
ffffffffc020aa2c:	004ad683          	lhu	a3,4(s5)
ffffffffc020aa30:	4785                	li	a5,1
ffffffffc020aa32:	0cf69c63          	bne	a3,a5,ffffffffc020ab0a <sfs_load_inode+0x174>
ffffffffc020aa36:	864a                	mv	a2,s2
ffffffffc020aa38:	00005597          	auipc	a1,0x5
ffffffffc020aa3c:	06858593          	addi	a1,a1,104 # ffffffffc020faa0 <sfs_node_fileops>
ffffffffc020aa40:	8e8fd0ef          	jal	ra,ffffffffc0207b28 <inode_init>
ffffffffc020aa44:	058a2783          	lw	a5,88(s4)
ffffffffc020aa48:	23540413          	addi	s0,s0,565
ffffffffc020aa4c:	0e879063          	bne	a5,s0,ffffffffc020ab2c <sfs_load_inode+0x196>
ffffffffc020aa50:	4785                	li	a5,1
ffffffffc020aa52:	00fa2c23          	sw	a5,24(s4)
ffffffffc020aa56:	015a3023          	sd	s5,0(s4)
ffffffffc020aa5a:	009a2423          	sw	s1,8(s4)
ffffffffc020aa5e:	000a3823          	sd	zero,16(s4)
ffffffffc020aa62:	4585                	li	a1,1
ffffffffc020aa64:	020a0513          	addi	a0,s4,32
ffffffffc020aa68:	af3f90ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc020aa6c:	058a2703          	lw	a4,88(s4)
ffffffffc020aa70:	6785                	lui	a5,0x1
ffffffffc020aa72:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020aa76:	14f71663          	bne	a4,a5,ffffffffc020abc2 <sfs_load_inode+0x22c>
ffffffffc020aa7a:	0a093703          	ld	a4,160(s2)
ffffffffc020aa7e:	038a0793          	addi	a5,s4,56
ffffffffc020aa82:	008a2503          	lw	a0,8(s4)
ffffffffc020aa86:	e31c                	sd	a5,0(a4)
ffffffffc020aa88:	0af93023          	sd	a5,160(s2)
ffffffffc020aa8c:	09890793          	addi	a5,s2,152
ffffffffc020aa90:	0a893403          	ld	s0,168(s2)
ffffffffc020aa94:	45a9                	li	a1,10
ffffffffc020aa96:	04ea3023          	sd	a4,64(s4)
ffffffffc020aa9a:	02fa3c23          	sd	a5,56(s4)
ffffffffc020aa9e:	003000ef          	jal	ra,ffffffffc020b2a0 <hash32>
ffffffffc020aaa2:	02051713          	slli	a4,a0,0x20
ffffffffc020aaa6:	01c75793          	srli	a5,a4,0x1c
ffffffffc020aaaa:	97a2                	add	a5,a5,s0
ffffffffc020aaac:	6798                	ld	a4,8(a5)
ffffffffc020aaae:	048a0693          	addi	a3,s4,72
ffffffffc020aab2:	e314                	sd	a3,0(a4)
ffffffffc020aab4:	e794                	sd	a3,8(a5)
ffffffffc020aab6:	04ea3823          	sd	a4,80(s4)
ffffffffc020aaba:	04fa3423          	sd	a5,72(s4)
ffffffffc020aabe:	854a                	mv	a0,s2
ffffffffc020aac0:	7d0000ef          	jal	ra,ffffffffc020b290 <unlock_sfs_fs>
ffffffffc020aac4:	4401                	li	s0,0
ffffffffc020aac6:	0149b023          	sd	s4,0(s3)
ffffffffc020aaca:	70e2                	ld	ra,56(sp)
ffffffffc020aacc:	8522                	mv	a0,s0
ffffffffc020aace:	7442                	ld	s0,48(sp)
ffffffffc020aad0:	74a2                	ld	s1,40(sp)
ffffffffc020aad2:	7902                	ld	s2,32(sp)
ffffffffc020aad4:	69e2                	ld	s3,24(sp)
ffffffffc020aad6:	6a42                	ld	s4,16(sp)
ffffffffc020aad8:	6aa2                	ld	s5,8(sp)
ffffffffc020aada:	6121                	addi	sp,sp,64
ffffffffc020aadc:	8082                	ret
ffffffffc020aade:	fb840a13          	addi	s4,s0,-72
ffffffffc020aae2:	8552                	mv	a0,s4
ffffffffc020aae4:	8a6fd0ef          	jal	ra,ffffffffc0207b8a <inode_ref_inc>
ffffffffc020aae8:	4785                	li	a5,1
ffffffffc020aaea:	fcf51ae3          	bne	a0,a5,ffffffffc020aabe <sfs_load_inode+0x128>
ffffffffc020aaee:	fd042783          	lw	a5,-48(s0)
ffffffffc020aaf2:	2785                	addiw	a5,a5,1
ffffffffc020aaf4:	fcf42823          	sw	a5,-48(s0)
ffffffffc020aaf8:	b7d9                	j	ffffffffc020aabe <sfs_load_inode+0x128>
ffffffffc020aafa:	5471                	li	s0,-4
ffffffffc020aafc:	8556                	mv	a0,s5
ffffffffc020aafe:	d40f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020ab02:	854a                	mv	a0,s2
ffffffffc020ab04:	78c000ef          	jal	ra,ffffffffc020b290 <unlock_sfs_fs>
ffffffffc020ab08:	b7c9                	j	ffffffffc020aaca <sfs_load_inode+0x134>
ffffffffc020ab0a:	4789                	li	a5,2
ffffffffc020ab0c:	08f69f63          	bne	a3,a5,ffffffffc020abaa <sfs_load_inode+0x214>
ffffffffc020ab10:	864a                	mv	a2,s2
ffffffffc020ab12:	00005597          	auipc	a1,0x5
ffffffffc020ab16:	f0e58593          	addi	a1,a1,-242 # ffffffffc020fa20 <sfs_node_dirops>
ffffffffc020ab1a:	80efd0ef          	jal	ra,ffffffffc0207b28 <inode_init>
ffffffffc020ab1e:	058a2703          	lw	a4,88(s4)
ffffffffc020ab22:	6785                	lui	a5,0x1
ffffffffc020ab24:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020ab28:	f2f704e3          	beq	a4,a5,ffffffffc020aa50 <sfs_load_inode+0xba>
ffffffffc020ab2c:	00005697          	auipc	a3,0x5
ffffffffc020ab30:	bbc68693          	addi	a3,a3,-1092 # ffffffffc020f6e8 <dev_node_ops+0x588>
ffffffffc020ab34:	00001617          	auipc	a2,0x1
ffffffffc020ab38:	18460613          	addi	a2,a2,388 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020ab3c:	07700593          	li	a1,119
ffffffffc020ab40:	00005517          	auipc	a0,0x5
ffffffffc020ab44:	be050513          	addi	a0,a0,-1056 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020ab48:	957f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ab4c:	5471                	li	s0,-4
ffffffffc020ab4e:	bf55                	j	ffffffffc020ab02 <sfs_load_inode+0x16c>
ffffffffc020ab50:	00005697          	auipc	a3,0x5
ffffffffc020ab54:	e5868693          	addi	a3,a3,-424 # ffffffffc020f9a8 <dev_node_ops+0x848>
ffffffffc020ab58:	00001617          	auipc	a2,0x1
ffffffffc020ab5c:	16060613          	addi	a2,a2,352 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020ab60:	0ad00593          	li	a1,173
ffffffffc020ab64:	00005517          	auipc	a0,0x5
ffffffffc020ab68:	bbc50513          	addi	a0,a0,-1092 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020ab6c:	933f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ab70:	8726                	mv	a4,s1
ffffffffc020ab72:	00005617          	auipc	a2,0x5
ffffffffc020ab76:	bde60613          	addi	a2,a2,-1058 # ffffffffc020f750 <dev_node_ops+0x5f0>
ffffffffc020ab7a:	05300593          	li	a1,83
ffffffffc020ab7e:	00005517          	auipc	a0,0x5
ffffffffc020ab82:	ba250513          	addi	a0,a0,-1118 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020ab86:	919f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ab8a:	00005697          	auipc	a3,0x5
ffffffffc020ab8e:	bfe68693          	addi	a3,a3,-1026 # ffffffffc020f788 <dev_node_ops+0x628>
ffffffffc020ab92:	00001617          	auipc	a2,0x1
ffffffffc020ab96:	12660613          	addi	a2,a2,294 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020ab9a:	0a800593          	li	a1,168
ffffffffc020ab9e:	00005517          	auipc	a0,0x5
ffffffffc020aba2:	b8250513          	addi	a0,a0,-1150 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020aba6:	8f9f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020abaa:	00005617          	auipc	a2,0x5
ffffffffc020abae:	b8e60613          	addi	a2,a2,-1138 # ffffffffc020f738 <dev_node_ops+0x5d8>
ffffffffc020abb2:	02e00593          	li	a1,46
ffffffffc020abb6:	00005517          	auipc	a0,0x5
ffffffffc020abba:	b6a50513          	addi	a0,a0,-1174 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020abbe:	8e1f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020abc2:	00005697          	auipc	a3,0x5
ffffffffc020abc6:	b2668693          	addi	a3,a3,-1242 # ffffffffc020f6e8 <dev_node_ops+0x588>
ffffffffc020abca:	00001617          	auipc	a2,0x1
ffffffffc020abce:	0ee60613          	addi	a2,a2,238 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020abd2:	0b100593          	li	a1,177
ffffffffc020abd6:	00005517          	auipc	a0,0x5
ffffffffc020abda:	b4a50513          	addi	a0,a0,-1206 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020abde:	8c1f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020abe2 <sfs_lookup>:
ffffffffc020abe2:	7139                	addi	sp,sp,-64
ffffffffc020abe4:	ec4e                	sd	s3,24(sp)
ffffffffc020abe6:	06853983          	ld	s3,104(a0)
ffffffffc020abea:	fc06                	sd	ra,56(sp)
ffffffffc020abec:	f822                	sd	s0,48(sp)
ffffffffc020abee:	f426                	sd	s1,40(sp)
ffffffffc020abf0:	f04a                	sd	s2,32(sp)
ffffffffc020abf2:	e852                	sd	s4,16(sp)
ffffffffc020abf4:	0a098c63          	beqz	s3,ffffffffc020acac <sfs_lookup+0xca>
ffffffffc020abf8:	0b09a783          	lw	a5,176(s3)
ffffffffc020abfc:	ebc5                	bnez	a5,ffffffffc020acac <sfs_lookup+0xca>
ffffffffc020abfe:	0005c783          	lbu	a5,0(a1)
ffffffffc020ac02:	84ae                	mv	s1,a1
ffffffffc020ac04:	c7c1                	beqz	a5,ffffffffc020ac8c <sfs_lookup+0xaa>
ffffffffc020ac06:	02f00713          	li	a4,47
ffffffffc020ac0a:	08e78163          	beq	a5,a4,ffffffffc020ac8c <sfs_lookup+0xaa>
ffffffffc020ac0e:	842a                	mv	s0,a0
ffffffffc020ac10:	8a32                	mv	s4,a2
ffffffffc020ac12:	f79fc0ef          	jal	ra,ffffffffc0207b8a <inode_ref_inc>
ffffffffc020ac16:	4c38                	lw	a4,88(s0)
ffffffffc020ac18:	6785                	lui	a5,0x1
ffffffffc020ac1a:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020ac1e:	0af71763          	bne	a4,a5,ffffffffc020accc <sfs_lookup+0xea>
ffffffffc020ac22:	6018                	ld	a4,0(s0)
ffffffffc020ac24:	4789                	li	a5,2
ffffffffc020ac26:	00475703          	lhu	a4,4(a4)
ffffffffc020ac2a:	04f71c63          	bne	a4,a5,ffffffffc020ac82 <sfs_lookup+0xa0>
ffffffffc020ac2e:	02040913          	addi	s2,s0,32
ffffffffc020ac32:	854a                	mv	a0,s2
ffffffffc020ac34:	931f90ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020ac38:	8626                	mv	a2,s1
ffffffffc020ac3a:	0054                	addi	a3,sp,4
ffffffffc020ac3c:	85a2                	mv	a1,s0
ffffffffc020ac3e:	854e                	mv	a0,s3
ffffffffc020ac40:	a29ff0ef          	jal	ra,ffffffffc020a668 <sfs_dirent_search_nolock.constprop.0>
ffffffffc020ac44:	84aa                	mv	s1,a0
ffffffffc020ac46:	854a                	mv	a0,s2
ffffffffc020ac48:	919f90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020ac4c:	cc89                	beqz	s1,ffffffffc020ac66 <sfs_lookup+0x84>
ffffffffc020ac4e:	8522                	mv	a0,s0
ffffffffc020ac50:	808fd0ef          	jal	ra,ffffffffc0207c58 <inode_ref_dec>
ffffffffc020ac54:	70e2                	ld	ra,56(sp)
ffffffffc020ac56:	7442                	ld	s0,48(sp)
ffffffffc020ac58:	7902                	ld	s2,32(sp)
ffffffffc020ac5a:	69e2                	ld	s3,24(sp)
ffffffffc020ac5c:	6a42                	ld	s4,16(sp)
ffffffffc020ac5e:	8526                	mv	a0,s1
ffffffffc020ac60:	74a2                	ld	s1,40(sp)
ffffffffc020ac62:	6121                	addi	sp,sp,64
ffffffffc020ac64:	8082                	ret
ffffffffc020ac66:	4612                	lw	a2,4(sp)
ffffffffc020ac68:	002c                	addi	a1,sp,8
ffffffffc020ac6a:	854e                	mv	a0,s3
ffffffffc020ac6c:	d2bff0ef          	jal	ra,ffffffffc020a996 <sfs_load_inode>
ffffffffc020ac70:	84aa                	mv	s1,a0
ffffffffc020ac72:	8522                	mv	a0,s0
ffffffffc020ac74:	fe5fc0ef          	jal	ra,ffffffffc0207c58 <inode_ref_dec>
ffffffffc020ac78:	fcf1                	bnez	s1,ffffffffc020ac54 <sfs_lookup+0x72>
ffffffffc020ac7a:	67a2                	ld	a5,8(sp)
ffffffffc020ac7c:	00fa3023          	sd	a5,0(s4)
ffffffffc020ac80:	bfd1                	j	ffffffffc020ac54 <sfs_lookup+0x72>
ffffffffc020ac82:	8522                	mv	a0,s0
ffffffffc020ac84:	fd5fc0ef          	jal	ra,ffffffffc0207c58 <inode_ref_dec>
ffffffffc020ac88:	54b9                	li	s1,-18
ffffffffc020ac8a:	b7e9                	j	ffffffffc020ac54 <sfs_lookup+0x72>
ffffffffc020ac8c:	00005697          	auipc	a3,0x5
ffffffffc020ac90:	d3468693          	addi	a3,a3,-716 # ffffffffc020f9c0 <dev_node_ops+0x860>
ffffffffc020ac94:	00001617          	auipc	a2,0x1
ffffffffc020ac98:	02460613          	addi	a2,a2,36 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020ac9c:	3f400593          	li	a1,1012
ffffffffc020aca0:	00005517          	auipc	a0,0x5
ffffffffc020aca4:	a8050513          	addi	a0,a0,-1408 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020aca8:	ff6f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020acac:	00005697          	auipc	a3,0x5
ffffffffc020acb0:	89468693          	addi	a3,a3,-1900 # ffffffffc020f540 <dev_node_ops+0x3e0>
ffffffffc020acb4:	00001617          	auipc	a2,0x1
ffffffffc020acb8:	00460613          	addi	a2,a2,4 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020acbc:	3f300593          	li	a1,1011
ffffffffc020acc0:	00005517          	auipc	a0,0x5
ffffffffc020acc4:	a6050513          	addi	a0,a0,-1440 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020acc8:	fd6f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020accc:	00005697          	auipc	a3,0x5
ffffffffc020acd0:	a1c68693          	addi	a3,a3,-1508 # ffffffffc020f6e8 <dev_node_ops+0x588>
ffffffffc020acd4:	00001617          	auipc	a2,0x1
ffffffffc020acd8:	fe460613          	addi	a2,a2,-28 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020acdc:	3f600593          	li	a1,1014
ffffffffc020ace0:	00005517          	auipc	a0,0x5
ffffffffc020ace4:	a4050513          	addi	a0,a0,-1472 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020ace8:	fb6f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020acec <sfs_namefile>:
ffffffffc020acec:	6d98                	ld	a4,24(a1)
ffffffffc020acee:	7175                	addi	sp,sp,-144
ffffffffc020acf0:	e506                	sd	ra,136(sp)
ffffffffc020acf2:	e122                	sd	s0,128(sp)
ffffffffc020acf4:	fca6                	sd	s1,120(sp)
ffffffffc020acf6:	f8ca                	sd	s2,112(sp)
ffffffffc020acf8:	f4ce                	sd	s3,104(sp)
ffffffffc020acfa:	f0d2                	sd	s4,96(sp)
ffffffffc020acfc:	ecd6                	sd	s5,88(sp)
ffffffffc020acfe:	e8da                	sd	s6,80(sp)
ffffffffc020ad00:	e4de                	sd	s7,72(sp)
ffffffffc020ad02:	e0e2                	sd	s8,64(sp)
ffffffffc020ad04:	fc66                	sd	s9,56(sp)
ffffffffc020ad06:	f86a                	sd	s10,48(sp)
ffffffffc020ad08:	f46e                	sd	s11,40(sp)
ffffffffc020ad0a:	e42e                	sd	a1,8(sp)
ffffffffc020ad0c:	4789                	li	a5,2
ffffffffc020ad0e:	1ae7f363          	bgeu	a5,a4,ffffffffc020aeb4 <sfs_namefile+0x1c8>
ffffffffc020ad12:	89aa                	mv	s3,a0
ffffffffc020ad14:	10400513          	li	a0,260
ffffffffc020ad18:	a76f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020ad1c:	842a                	mv	s0,a0
ffffffffc020ad1e:	18050b63          	beqz	a0,ffffffffc020aeb4 <sfs_namefile+0x1c8>
ffffffffc020ad22:	0689b483          	ld	s1,104(s3)
ffffffffc020ad26:	1e048963          	beqz	s1,ffffffffc020af18 <sfs_namefile+0x22c>
ffffffffc020ad2a:	0b04a783          	lw	a5,176(s1)
ffffffffc020ad2e:	1e079563          	bnez	a5,ffffffffc020af18 <sfs_namefile+0x22c>
ffffffffc020ad32:	0589ac83          	lw	s9,88(s3)
ffffffffc020ad36:	6785                	lui	a5,0x1
ffffffffc020ad38:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020ad3c:	1afc9e63          	bne	s9,a5,ffffffffc020aef8 <sfs_namefile+0x20c>
ffffffffc020ad40:	6722                	ld	a4,8(sp)
ffffffffc020ad42:	854e                	mv	a0,s3
ffffffffc020ad44:	8ace                	mv	s5,s3
ffffffffc020ad46:	6f1c                	ld	a5,24(a4)
ffffffffc020ad48:	00073b03          	ld	s6,0(a4)
ffffffffc020ad4c:	02098a13          	addi	s4,s3,32
ffffffffc020ad50:	ffe78b93          	addi	s7,a5,-2
ffffffffc020ad54:	9b3e                	add	s6,s6,a5
ffffffffc020ad56:	00005d17          	auipc	s10,0x5
ffffffffc020ad5a:	c8ad0d13          	addi	s10,s10,-886 # ffffffffc020f9e0 <dev_node_ops+0x880>
ffffffffc020ad5e:	e2dfc0ef          	jal	ra,ffffffffc0207b8a <inode_ref_inc>
ffffffffc020ad62:	00440c13          	addi	s8,s0,4
ffffffffc020ad66:	e066                	sd	s9,0(sp)
ffffffffc020ad68:	8552                	mv	a0,s4
ffffffffc020ad6a:	ffaf90ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020ad6e:	0854                	addi	a3,sp,20
ffffffffc020ad70:	866a                	mv	a2,s10
ffffffffc020ad72:	85d6                	mv	a1,s5
ffffffffc020ad74:	8526                	mv	a0,s1
ffffffffc020ad76:	8f3ff0ef          	jal	ra,ffffffffc020a668 <sfs_dirent_search_nolock.constprop.0>
ffffffffc020ad7a:	8daa                	mv	s11,a0
ffffffffc020ad7c:	8552                	mv	a0,s4
ffffffffc020ad7e:	fe2f90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020ad82:	020d8863          	beqz	s11,ffffffffc020adb2 <sfs_namefile+0xc6>
ffffffffc020ad86:	854e                	mv	a0,s3
ffffffffc020ad88:	ed1fc0ef          	jal	ra,ffffffffc0207c58 <inode_ref_dec>
ffffffffc020ad8c:	8522                	mv	a0,s0
ffffffffc020ad8e:	ab0f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020ad92:	60aa                	ld	ra,136(sp)
ffffffffc020ad94:	640a                	ld	s0,128(sp)
ffffffffc020ad96:	74e6                	ld	s1,120(sp)
ffffffffc020ad98:	7946                	ld	s2,112(sp)
ffffffffc020ad9a:	79a6                	ld	s3,104(sp)
ffffffffc020ad9c:	7a06                	ld	s4,96(sp)
ffffffffc020ad9e:	6ae6                	ld	s5,88(sp)
ffffffffc020ada0:	6b46                	ld	s6,80(sp)
ffffffffc020ada2:	6ba6                	ld	s7,72(sp)
ffffffffc020ada4:	6c06                	ld	s8,64(sp)
ffffffffc020ada6:	7ce2                	ld	s9,56(sp)
ffffffffc020ada8:	7d42                	ld	s10,48(sp)
ffffffffc020adaa:	856e                	mv	a0,s11
ffffffffc020adac:	7da2                	ld	s11,40(sp)
ffffffffc020adae:	6149                	addi	sp,sp,144
ffffffffc020adb0:	8082                	ret
ffffffffc020adb2:	4652                	lw	a2,20(sp)
ffffffffc020adb4:	082c                	addi	a1,sp,24
ffffffffc020adb6:	8526                	mv	a0,s1
ffffffffc020adb8:	bdfff0ef          	jal	ra,ffffffffc020a996 <sfs_load_inode>
ffffffffc020adbc:	8daa                	mv	s11,a0
ffffffffc020adbe:	f561                	bnez	a0,ffffffffc020ad86 <sfs_namefile+0x9a>
ffffffffc020adc0:	854e                	mv	a0,s3
ffffffffc020adc2:	008aa903          	lw	s2,8(s5)
ffffffffc020adc6:	e93fc0ef          	jal	ra,ffffffffc0207c58 <inode_ref_dec>
ffffffffc020adca:	6ce2                	ld	s9,24(sp)
ffffffffc020adcc:	0b3c8463          	beq	s9,s3,ffffffffc020ae74 <sfs_namefile+0x188>
ffffffffc020add0:	100c8463          	beqz	s9,ffffffffc020aed8 <sfs_namefile+0x1ec>
ffffffffc020add4:	058ca703          	lw	a4,88(s9)
ffffffffc020add8:	6782                	ld	a5,0(sp)
ffffffffc020adda:	0ef71f63          	bne	a4,a5,ffffffffc020aed8 <sfs_namefile+0x1ec>
ffffffffc020adde:	008ca703          	lw	a4,8(s9)
ffffffffc020ade2:	8ae6                	mv	s5,s9
ffffffffc020ade4:	0d270a63          	beq	a4,s2,ffffffffc020aeb8 <sfs_namefile+0x1cc>
ffffffffc020ade8:	000cb703          	ld	a4,0(s9)
ffffffffc020adec:	4789                	li	a5,2
ffffffffc020adee:	00475703          	lhu	a4,4(a4)
ffffffffc020adf2:	0cf71363          	bne	a4,a5,ffffffffc020aeb8 <sfs_namefile+0x1cc>
ffffffffc020adf6:	020c8a13          	addi	s4,s9,32
ffffffffc020adfa:	8552                	mv	a0,s4
ffffffffc020adfc:	f68f90ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020ae00:	000cb703          	ld	a4,0(s9)
ffffffffc020ae04:	00872983          	lw	s3,8(a4)
ffffffffc020ae08:	01304963          	bgtz	s3,ffffffffc020ae1a <sfs_namefile+0x12e>
ffffffffc020ae0c:	a899                	j	ffffffffc020ae62 <sfs_namefile+0x176>
ffffffffc020ae0e:	4018                	lw	a4,0(s0)
ffffffffc020ae10:	01270e63          	beq	a4,s2,ffffffffc020ae2c <sfs_namefile+0x140>
ffffffffc020ae14:	2d85                	addiw	s11,s11,1
ffffffffc020ae16:	05b98663          	beq	s3,s11,ffffffffc020ae62 <sfs_namefile+0x176>
ffffffffc020ae1a:	86a2                	mv	a3,s0
ffffffffc020ae1c:	866e                	mv	a2,s11
ffffffffc020ae1e:	85e6                	mv	a1,s9
ffffffffc020ae20:	8526                	mv	a0,s1
ffffffffc020ae22:	e48ff0ef          	jal	ra,ffffffffc020a46a <sfs_dirent_read_nolock>
ffffffffc020ae26:	872a                	mv	a4,a0
ffffffffc020ae28:	d17d                	beqz	a0,ffffffffc020ae0e <sfs_namefile+0x122>
ffffffffc020ae2a:	a82d                	j	ffffffffc020ae64 <sfs_namefile+0x178>
ffffffffc020ae2c:	8552                	mv	a0,s4
ffffffffc020ae2e:	f32f90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020ae32:	8562                	mv	a0,s8
ffffffffc020ae34:	0ff000ef          	jal	ra,ffffffffc020b732 <strlen>
ffffffffc020ae38:	00150793          	addi	a5,a0,1
ffffffffc020ae3c:	862a                	mv	a2,a0
ffffffffc020ae3e:	06fbe863          	bltu	s7,a5,ffffffffc020aeae <sfs_namefile+0x1c2>
ffffffffc020ae42:	fff64913          	not	s2,a2
ffffffffc020ae46:	995a                	add	s2,s2,s6
ffffffffc020ae48:	85e2                	mv	a1,s8
ffffffffc020ae4a:	854a                	mv	a0,s2
ffffffffc020ae4c:	40fb8bb3          	sub	s7,s7,a5
ffffffffc020ae50:	1d7000ef          	jal	ra,ffffffffc020b826 <memcpy>
ffffffffc020ae54:	02f00793          	li	a5,47
ffffffffc020ae58:	fefb0fa3          	sb	a5,-1(s6)
ffffffffc020ae5c:	89e6                	mv	s3,s9
ffffffffc020ae5e:	8b4a                	mv	s6,s2
ffffffffc020ae60:	b721                	j	ffffffffc020ad68 <sfs_namefile+0x7c>
ffffffffc020ae62:	5741                	li	a4,-16
ffffffffc020ae64:	8552                	mv	a0,s4
ffffffffc020ae66:	e03a                	sd	a4,0(sp)
ffffffffc020ae68:	ef8f90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020ae6c:	6702                	ld	a4,0(sp)
ffffffffc020ae6e:	89e6                	mv	s3,s9
ffffffffc020ae70:	8dba                	mv	s11,a4
ffffffffc020ae72:	bf11                	j	ffffffffc020ad86 <sfs_namefile+0x9a>
ffffffffc020ae74:	854e                	mv	a0,s3
ffffffffc020ae76:	de3fc0ef          	jal	ra,ffffffffc0207c58 <inode_ref_dec>
ffffffffc020ae7a:	64a2                	ld	s1,8(sp)
ffffffffc020ae7c:	85da                	mv	a1,s6
ffffffffc020ae7e:	6c98                	ld	a4,24(s1)
ffffffffc020ae80:	6088                	ld	a0,0(s1)
ffffffffc020ae82:	1779                	addi	a4,a4,-2
ffffffffc020ae84:	41770bb3          	sub	s7,a4,s7
ffffffffc020ae88:	865e                	mv	a2,s7
ffffffffc020ae8a:	0505                	addi	a0,a0,1
ffffffffc020ae8c:	15b000ef          	jal	ra,ffffffffc020b7e6 <memmove>
ffffffffc020ae90:	02f00713          	li	a4,47
ffffffffc020ae94:	fee50fa3          	sb	a4,-1(a0)
ffffffffc020ae98:	955e                	add	a0,a0,s7
ffffffffc020ae9a:	00050023          	sb	zero,0(a0)
ffffffffc020ae9e:	85de                	mv	a1,s7
ffffffffc020aea0:	8526                	mv	a0,s1
ffffffffc020aea2:	d4afa0ef          	jal	ra,ffffffffc02053ec <iobuf_skip>
ffffffffc020aea6:	8522                	mv	a0,s0
ffffffffc020aea8:	996f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020aeac:	b5dd                	j	ffffffffc020ad92 <sfs_namefile+0xa6>
ffffffffc020aeae:	89e6                	mv	s3,s9
ffffffffc020aeb0:	5df1                	li	s11,-4
ffffffffc020aeb2:	bdd1                	j	ffffffffc020ad86 <sfs_namefile+0x9a>
ffffffffc020aeb4:	5df1                	li	s11,-4
ffffffffc020aeb6:	bdf1                	j	ffffffffc020ad92 <sfs_namefile+0xa6>
ffffffffc020aeb8:	00005697          	auipc	a3,0x5
ffffffffc020aebc:	b3068693          	addi	a3,a3,-1232 # ffffffffc020f9e8 <dev_node_ops+0x888>
ffffffffc020aec0:	00001617          	auipc	a2,0x1
ffffffffc020aec4:	df860613          	addi	a2,a2,-520 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020aec8:	31200593          	li	a1,786
ffffffffc020aecc:	00005517          	auipc	a0,0x5
ffffffffc020aed0:	85450513          	addi	a0,a0,-1964 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020aed4:	dcaf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020aed8:	00005697          	auipc	a3,0x5
ffffffffc020aedc:	81068693          	addi	a3,a3,-2032 # ffffffffc020f6e8 <dev_node_ops+0x588>
ffffffffc020aee0:	00001617          	auipc	a2,0x1
ffffffffc020aee4:	dd860613          	addi	a2,a2,-552 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020aee8:	31100593          	li	a1,785
ffffffffc020aeec:	00005517          	auipc	a0,0x5
ffffffffc020aef0:	83450513          	addi	a0,a0,-1996 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020aef4:	daaf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020aef8:	00004697          	auipc	a3,0x4
ffffffffc020aefc:	7f068693          	addi	a3,a3,2032 # ffffffffc020f6e8 <dev_node_ops+0x588>
ffffffffc020af00:	00001617          	auipc	a2,0x1
ffffffffc020af04:	db860613          	addi	a2,a2,-584 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020af08:	2fe00593          	li	a1,766
ffffffffc020af0c:	00005517          	auipc	a0,0x5
ffffffffc020af10:	81450513          	addi	a0,a0,-2028 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020af14:	d8af50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020af18:	00004697          	auipc	a3,0x4
ffffffffc020af1c:	62868693          	addi	a3,a3,1576 # ffffffffc020f540 <dev_node_ops+0x3e0>
ffffffffc020af20:	00001617          	auipc	a2,0x1
ffffffffc020af24:	d9860613          	addi	a2,a2,-616 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020af28:	2fd00593          	li	a1,765
ffffffffc020af2c:	00004517          	auipc	a0,0x4
ffffffffc020af30:	7f450513          	addi	a0,a0,2036 # ffffffffc020f720 <dev_node_ops+0x5c0>
ffffffffc020af34:	d6af50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020af38 <sfs_rwblock_nolock>:
ffffffffc020af38:	7139                	addi	sp,sp,-64
ffffffffc020af3a:	f822                	sd	s0,48(sp)
ffffffffc020af3c:	f426                	sd	s1,40(sp)
ffffffffc020af3e:	fc06                	sd	ra,56(sp)
ffffffffc020af40:	842a                	mv	s0,a0
ffffffffc020af42:	84b6                	mv	s1,a3
ffffffffc020af44:	e211                	bnez	a2,ffffffffc020af48 <sfs_rwblock_nolock+0x10>
ffffffffc020af46:	e715                	bnez	a4,ffffffffc020af72 <sfs_rwblock_nolock+0x3a>
ffffffffc020af48:	405c                	lw	a5,4(s0)
ffffffffc020af4a:	02f67463          	bgeu	a2,a5,ffffffffc020af72 <sfs_rwblock_nolock+0x3a>
ffffffffc020af4e:	00c6169b          	slliw	a3,a2,0xc
ffffffffc020af52:	1682                	slli	a3,a3,0x20
ffffffffc020af54:	6605                	lui	a2,0x1
ffffffffc020af56:	9281                	srli	a3,a3,0x20
ffffffffc020af58:	850a                	mv	a0,sp
ffffffffc020af5a:	c1cfa0ef          	jal	ra,ffffffffc0205376 <iobuf_init>
ffffffffc020af5e:	85aa                	mv	a1,a0
ffffffffc020af60:	7808                	ld	a0,48(s0)
ffffffffc020af62:	8626                	mv	a2,s1
ffffffffc020af64:	7118                	ld	a4,32(a0)
ffffffffc020af66:	9702                	jalr	a4
ffffffffc020af68:	70e2                	ld	ra,56(sp)
ffffffffc020af6a:	7442                	ld	s0,48(sp)
ffffffffc020af6c:	74a2                	ld	s1,40(sp)
ffffffffc020af6e:	6121                	addi	sp,sp,64
ffffffffc020af70:	8082                	ret
ffffffffc020af72:	00005697          	auipc	a3,0x5
ffffffffc020af76:	bae68693          	addi	a3,a3,-1106 # ffffffffc020fb20 <sfs_node_fileops+0x80>
ffffffffc020af7a:	00001617          	auipc	a2,0x1
ffffffffc020af7e:	d3e60613          	addi	a2,a2,-706 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020af82:	45d5                	li	a1,21
ffffffffc020af84:	00005517          	auipc	a0,0x5
ffffffffc020af88:	bd450513          	addi	a0,a0,-1068 # ffffffffc020fb58 <sfs_node_fileops+0xb8>
ffffffffc020af8c:	d12f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020af90 <sfs_rblock>:
ffffffffc020af90:	7139                	addi	sp,sp,-64
ffffffffc020af92:	ec4e                	sd	s3,24(sp)
ffffffffc020af94:	89b6                	mv	s3,a3
ffffffffc020af96:	f822                	sd	s0,48(sp)
ffffffffc020af98:	f04a                	sd	s2,32(sp)
ffffffffc020af9a:	e852                	sd	s4,16(sp)
ffffffffc020af9c:	fc06                	sd	ra,56(sp)
ffffffffc020af9e:	f426                	sd	s1,40(sp)
ffffffffc020afa0:	e456                	sd	s5,8(sp)
ffffffffc020afa2:	8a2a                	mv	s4,a0
ffffffffc020afa4:	892e                	mv	s2,a1
ffffffffc020afa6:	8432                	mv	s0,a2
ffffffffc020afa8:	2e0000ef          	jal	ra,ffffffffc020b288 <lock_sfs_io>
ffffffffc020afac:	04098063          	beqz	s3,ffffffffc020afec <sfs_rblock+0x5c>
ffffffffc020afb0:	013409bb          	addw	s3,s0,s3
ffffffffc020afb4:	6a85                	lui	s5,0x1
ffffffffc020afb6:	a021                	j	ffffffffc020afbe <sfs_rblock+0x2e>
ffffffffc020afb8:	9956                	add	s2,s2,s5
ffffffffc020afba:	02898963          	beq	s3,s0,ffffffffc020afec <sfs_rblock+0x5c>
ffffffffc020afbe:	8622                	mv	a2,s0
ffffffffc020afc0:	85ca                	mv	a1,s2
ffffffffc020afc2:	4705                	li	a4,1
ffffffffc020afc4:	4681                	li	a3,0
ffffffffc020afc6:	8552                	mv	a0,s4
ffffffffc020afc8:	f71ff0ef          	jal	ra,ffffffffc020af38 <sfs_rwblock_nolock>
ffffffffc020afcc:	84aa                	mv	s1,a0
ffffffffc020afce:	2405                	addiw	s0,s0,1
ffffffffc020afd0:	d565                	beqz	a0,ffffffffc020afb8 <sfs_rblock+0x28>
ffffffffc020afd2:	8552                	mv	a0,s4
ffffffffc020afd4:	2c4000ef          	jal	ra,ffffffffc020b298 <unlock_sfs_io>
ffffffffc020afd8:	70e2                	ld	ra,56(sp)
ffffffffc020afda:	7442                	ld	s0,48(sp)
ffffffffc020afdc:	7902                	ld	s2,32(sp)
ffffffffc020afde:	69e2                	ld	s3,24(sp)
ffffffffc020afe0:	6a42                	ld	s4,16(sp)
ffffffffc020afe2:	6aa2                	ld	s5,8(sp)
ffffffffc020afe4:	8526                	mv	a0,s1
ffffffffc020afe6:	74a2                	ld	s1,40(sp)
ffffffffc020afe8:	6121                	addi	sp,sp,64
ffffffffc020afea:	8082                	ret
ffffffffc020afec:	4481                	li	s1,0
ffffffffc020afee:	b7d5                	j	ffffffffc020afd2 <sfs_rblock+0x42>

ffffffffc020aff0 <sfs_wblock>:
ffffffffc020aff0:	7139                	addi	sp,sp,-64
ffffffffc020aff2:	ec4e                	sd	s3,24(sp)
ffffffffc020aff4:	89b6                	mv	s3,a3
ffffffffc020aff6:	f822                	sd	s0,48(sp)
ffffffffc020aff8:	f04a                	sd	s2,32(sp)
ffffffffc020affa:	e852                	sd	s4,16(sp)
ffffffffc020affc:	fc06                	sd	ra,56(sp)
ffffffffc020affe:	f426                	sd	s1,40(sp)
ffffffffc020b000:	e456                	sd	s5,8(sp)
ffffffffc020b002:	8a2a                	mv	s4,a0
ffffffffc020b004:	892e                	mv	s2,a1
ffffffffc020b006:	8432                	mv	s0,a2
ffffffffc020b008:	280000ef          	jal	ra,ffffffffc020b288 <lock_sfs_io>
ffffffffc020b00c:	04098063          	beqz	s3,ffffffffc020b04c <sfs_wblock+0x5c>
ffffffffc020b010:	013409bb          	addw	s3,s0,s3
ffffffffc020b014:	6a85                	lui	s5,0x1
ffffffffc020b016:	a021                	j	ffffffffc020b01e <sfs_wblock+0x2e>
ffffffffc020b018:	9956                	add	s2,s2,s5
ffffffffc020b01a:	02898963          	beq	s3,s0,ffffffffc020b04c <sfs_wblock+0x5c>
ffffffffc020b01e:	8622                	mv	a2,s0
ffffffffc020b020:	85ca                	mv	a1,s2
ffffffffc020b022:	4705                	li	a4,1
ffffffffc020b024:	4685                	li	a3,1
ffffffffc020b026:	8552                	mv	a0,s4
ffffffffc020b028:	f11ff0ef          	jal	ra,ffffffffc020af38 <sfs_rwblock_nolock>
ffffffffc020b02c:	84aa                	mv	s1,a0
ffffffffc020b02e:	2405                	addiw	s0,s0,1
ffffffffc020b030:	d565                	beqz	a0,ffffffffc020b018 <sfs_wblock+0x28>
ffffffffc020b032:	8552                	mv	a0,s4
ffffffffc020b034:	264000ef          	jal	ra,ffffffffc020b298 <unlock_sfs_io>
ffffffffc020b038:	70e2                	ld	ra,56(sp)
ffffffffc020b03a:	7442                	ld	s0,48(sp)
ffffffffc020b03c:	7902                	ld	s2,32(sp)
ffffffffc020b03e:	69e2                	ld	s3,24(sp)
ffffffffc020b040:	6a42                	ld	s4,16(sp)
ffffffffc020b042:	6aa2                	ld	s5,8(sp)
ffffffffc020b044:	8526                	mv	a0,s1
ffffffffc020b046:	74a2                	ld	s1,40(sp)
ffffffffc020b048:	6121                	addi	sp,sp,64
ffffffffc020b04a:	8082                	ret
ffffffffc020b04c:	4481                	li	s1,0
ffffffffc020b04e:	b7d5                	j	ffffffffc020b032 <sfs_wblock+0x42>

ffffffffc020b050 <sfs_rbuf>:
ffffffffc020b050:	7179                	addi	sp,sp,-48
ffffffffc020b052:	f406                	sd	ra,40(sp)
ffffffffc020b054:	f022                	sd	s0,32(sp)
ffffffffc020b056:	ec26                	sd	s1,24(sp)
ffffffffc020b058:	e84a                	sd	s2,16(sp)
ffffffffc020b05a:	e44e                	sd	s3,8(sp)
ffffffffc020b05c:	e052                	sd	s4,0(sp)
ffffffffc020b05e:	6785                	lui	a5,0x1
ffffffffc020b060:	04f77863          	bgeu	a4,a5,ffffffffc020b0b0 <sfs_rbuf+0x60>
ffffffffc020b064:	84ba                	mv	s1,a4
ffffffffc020b066:	9732                	add	a4,a4,a2
ffffffffc020b068:	89b2                	mv	s3,a2
ffffffffc020b06a:	04e7e363          	bltu	a5,a4,ffffffffc020b0b0 <sfs_rbuf+0x60>
ffffffffc020b06e:	8936                	mv	s2,a3
ffffffffc020b070:	842a                	mv	s0,a0
ffffffffc020b072:	8a2e                	mv	s4,a1
ffffffffc020b074:	214000ef          	jal	ra,ffffffffc020b288 <lock_sfs_io>
ffffffffc020b078:	642c                	ld	a1,72(s0)
ffffffffc020b07a:	864a                	mv	a2,s2
ffffffffc020b07c:	4705                	li	a4,1
ffffffffc020b07e:	4681                	li	a3,0
ffffffffc020b080:	8522                	mv	a0,s0
ffffffffc020b082:	eb7ff0ef          	jal	ra,ffffffffc020af38 <sfs_rwblock_nolock>
ffffffffc020b086:	892a                	mv	s2,a0
ffffffffc020b088:	cd09                	beqz	a0,ffffffffc020b0a2 <sfs_rbuf+0x52>
ffffffffc020b08a:	8522                	mv	a0,s0
ffffffffc020b08c:	20c000ef          	jal	ra,ffffffffc020b298 <unlock_sfs_io>
ffffffffc020b090:	70a2                	ld	ra,40(sp)
ffffffffc020b092:	7402                	ld	s0,32(sp)
ffffffffc020b094:	64e2                	ld	s1,24(sp)
ffffffffc020b096:	69a2                	ld	s3,8(sp)
ffffffffc020b098:	6a02                	ld	s4,0(sp)
ffffffffc020b09a:	854a                	mv	a0,s2
ffffffffc020b09c:	6942                	ld	s2,16(sp)
ffffffffc020b09e:	6145                	addi	sp,sp,48
ffffffffc020b0a0:	8082                	ret
ffffffffc020b0a2:	642c                	ld	a1,72(s0)
ffffffffc020b0a4:	864e                	mv	a2,s3
ffffffffc020b0a6:	8552                	mv	a0,s4
ffffffffc020b0a8:	95a6                	add	a1,a1,s1
ffffffffc020b0aa:	77c000ef          	jal	ra,ffffffffc020b826 <memcpy>
ffffffffc020b0ae:	bff1                	j	ffffffffc020b08a <sfs_rbuf+0x3a>
ffffffffc020b0b0:	00005697          	auipc	a3,0x5
ffffffffc020b0b4:	ac068693          	addi	a3,a3,-1344 # ffffffffc020fb70 <sfs_node_fileops+0xd0>
ffffffffc020b0b8:	00001617          	auipc	a2,0x1
ffffffffc020b0bc:	c0060613          	addi	a2,a2,-1024 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020b0c0:	05500593          	li	a1,85
ffffffffc020b0c4:	00005517          	auipc	a0,0x5
ffffffffc020b0c8:	a9450513          	addi	a0,a0,-1388 # ffffffffc020fb58 <sfs_node_fileops+0xb8>
ffffffffc020b0cc:	bd2f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020b0d0 <sfs_wbuf>:
ffffffffc020b0d0:	7139                	addi	sp,sp,-64
ffffffffc020b0d2:	fc06                	sd	ra,56(sp)
ffffffffc020b0d4:	f822                	sd	s0,48(sp)
ffffffffc020b0d6:	f426                	sd	s1,40(sp)
ffffffffc020b0d8:	f04a                	sd	s2,32(sp)
ffffffffc020b0da:	ec4e                	sd	s3,24(sp)
ffffffffc020b0dc:	e852                	sd	s4,16(sp)
ffffffffc020b0de:	e456                	sd	s5,8(sp)
ffffffffc020b0e0:	6785                	lui	a5,0x1
ffffffffc020b0e2:	06f77163          	bgeu	a4,a5,ffffffffc020b144 <sfs_wbuf+0x74>
ffffffffc020b0e6:	893a                	mv	s2,a4
ffffffffc020b0e8:	9732                	add	a4,a4,a2
ffffffffc020b0ea:	8a32                	mv	s4,a2
ffffffffc020b0ec:	04e7ec63          	bltu	a5,a4,ffffffffc020b144 <sfs_wbuf+0x74>
ffffffffc020b0f0:	842a                	mv	s0,a0
ffffffffc020b0f2:	89b6                	mv	s3,a3
ffffffffc020b0f4:	8aae                	mv	s5,a1
ffffffffc020b0f6:	192000ef          	jal	ra,ffffffffc020b288 <lock_sfs_io>
ffffffffc020b0fa:	642c                	ld	a1,72(s0)
ffffffffc020b0fc:	4705                	li	a4,1
ffffffffc020b0fe:	4681                	li	a3,0
ffffffffc020b100:	864e                	mv	a2,s3
ffffffffc020b102:	8522                	mv	a0,s0
ffffffffc020b104:	e35ff0ef          	jal	ra,ffffffffc020af38 <sfs_rwblock_nolock>
ffffffffc020b108:	84aa                	mv	s1,a0
ffffffffc020b10a:	cd11                	beqz	a0,ffffffffc020b126 <sfs_wbuf+0x56>
ffffffffc020b10c:	8522                	mv	a0,s0
ffffffffc020b10e:	18a000ef          	jal	ra,ffffffffc020b298 <unlock_sfs_io>
ffffffffc020b112:	70e2                	ld	ra,56(sp)
ffffffffc020b114:	7442                	ld	s0,48(sp)
ffffffffc020b116:	7902                	ld	s2,32(sp)
ffffffffc020b118:	69e2                	ld	s3,24(sp)
ffffffffc020b11a:	6a42                	ld	s4,16(sp)
ffffffffc020b11c:	6aa2                	ld	s5,8(sp)
ffffffffc020b11e:	8526                	mv	a0,s1
ffffffffc020b120:	74a2                	ld	s1,40(sp)
ffffffffc020b122:	6121                	addi	sp,sp,64
ffffffffc020b124:	8082                	ret
ffffffffc020b126:	6428                	ld	a0,72(s0)
ffffffffc020b128:	8652                	mv	a2,s4
ffffffffc020b12a:	85d6                	mv	a1,s5
ffffffffc020b12c:	954a                	add	a0,a0,s2
ffffffffc020b12e:	6f8000ef          	jal	ra,ffffffffc020b826 <memcpy>
ffffffffc020b132:	642c                	ld	a1,72(s0)
ffffffffc020b134:	4705                	li	a4,1
ffffffffc020b136:	4685                	li	a3,1
ffffffffc020b138:	864e                	mv	a2,s3
ffffffffc020b13a:	8522                	mv	a0,s0
ffffffffc020b13c:	dfdff0ef          	jal	ra,ffffffffc020af38 <sfs_rwblock_nolock>
ffffffffc020b140:	84aa                	mv	s1,a0
ffffffffc020b142:	b7e9                	j	ffffffffc020b10c <sfs_wbuf+0x3c>
ffffffffc020b144:	00005697          	auipc	a3,0x5
ffffffffc020b148:	a2c68693          	addi	a3,a3,-1492 # ffffffffc020fb70 <sfs_node_fileops+0xd0>
ffffffffc020b14c:	00001617          	auipc	a2,0x1
ffffffffc020b150:	b6c60613          	addi	a2,a2,-1172 # ffffffffc020bcb8 <commands+0x210>
ffffffffc020b154:	06b00593          	li	a1,107
ffffffffc020b158:	00005517          	auipc	a0,0x5
ffffffffc020b15c:	a0050513          	addi	a0,a0,-1536 # ffffffffc020fb58 <sfs_node_fileops+0xb8>
ffffffffc020b160:	b3ef50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020b164 <sfs_sync_super>:
ffffffffc020b164:	1101                	addi	sp,sp,-32
ffffffffc020b166:	ec06                	sd	ra,24(sp)
ffffffffc020b168:	e822                	sd	s0,16(sp)
ffffffffc020b16a:	e426                	sd	s1,8(sp)
ffffffffc020b16c:	842a                	mv	s0,a0
ffffffffc020b16e:	11a000ef          	jal	ra,ffffffffc020b288 <lock_sfs_io>
ffffffffc020b172:	6428                	ld	a0,72(s0)
ffffffffc020b174:	6605                	lui	a2,0x1
ffffffffc020b176:	4581                	li	a1,0
ffffffffc020b178:	65c000ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc020b17c:	6428                	ld	a0,72(s0)
ffffffffc020b17e:	85a2                	mv	a1,s0
ffffffffc020b180:	02c00613          	li	a2,44
ffffffffc020b184:	6a2000ef          	jal	ra,ffffffffc020b826 <memcpy>
ffffffffc020b188:	642c                	ld	a1,72(s0)
ffffffffc020b18a:	4701                	li	a4,0
ffffffffc020b18c:	4685                	li	a3,1
ffffffffc020b18e:	4601                	li	a2,0
ffffffffc020b190:	8522                	mv	a0,s0
ffffffffc020b192:	da7ff0ef          	jal	ra,ffffffffc020af38 <sfs_rwblock_nolock>
ffffffffc020b196:	84aa                	mv	s1,a0
ffffffffc020b198:	8522                	mv	a0,s0
ffffffffc020b19a:	0fe000ef          	jal	ra,ffffffffc020b298 <unlock_sfs_io>
ffffffffc020b19e:	60e2                	ld	ra,24(sp)
ffffffffc020b1a0:	6442                	ld	s0,16(sp)
ffffffffc020b1a2:	8526                	mv	a0,s1
ffffffffc020b1a4:	64a2                	ld	s1,8(sp)
ffffffffc020b1a6:	6105                	addi	sp,sp,32
ffffffffc020b1a8:	8082                	ret

ffffffffc020b1aa <sfs_sync_freemap>:
ffffffffc020b1aa:	7139                	addi	sp,sp,-64
ffffffffc020b1ac:	ec4e                	sd	s3,24(sp)
ffffffffc020b1ae:	e852                	sd	s4,16(sp)
ffffffffc020b1b0:	00456983          	lwu	s3,4(a0)
ffffffffc020b1b4:	8a2a                	mv	s4,a0
ffffffffc020b1b6:	7d08                	ld	a0,56(a0)
ffffffffc020b1b8:	67a1                	lui	a5,0x8
ffffffffc020b1ba:	17fd                	addi	a5,a5,-1
ffffffffc020b1bc:	4581                	li	a1,0
ffffffffc020b1be:	f822                	sd	s0,48(sp)
ffffffffc020b1c0:	fc06                	sd	ra,56(sp)
ffffffffc020b1c2:	f426                	sd	s1,40(sp)
ffffffffc020b1c4:	f04a                	sd	s2,32(sp)
ffffffffc020b1c6:	e456                	sd	s5,8(sp)
ffffffffc020b1c8:	99be                	add	s3,s3,a5
ffffffffc020b1ca:	a1cfe0ef          	jal	ra,ffffffffc02093e6 <bitmap_getdata>
ffffffffc020b1ce:	00f9d993          	srli	s3,s3,0xf
ffffffffc020b1d2:	842a                	mv	s0,a0
ffffffffc020b1d4:	8552                	mv	a0,s4
ffffffffc020b1d6:	0b2000ef          	jal	ra,ffffffffc020b288 <lock_sfs_io>
ffffffffc020b1da:	04098163          	beqz	s3,ffffffffc020b21c <sfs_sync_freemap+0x72>
ffffffffc020b1de:	09b2                	slli	s3,s3,0xc
ffffffffc020b1e0:	99a2                	add	s3,s3,s0
ffffffffc020b1e2:	4909                	li	s2,2
ffffffffc020b1e4:	6a85                	lui	s5,0x1
ffffffffc020b1e6:	a021                	j	ffffffffc020b1ee <sfs_sync_freemap+0x44>
ffffffffc020b1e8:	2905                	addiw	s2,s2,1
ffffffffc020b1ea:	02898963          	beq	s3,s0,ffffffffc020b21c <sfs_sync_freemap+0x72>
ffffffffc020b1ee:	85a2                	mv	a1,s0
ffffffffc020b1f0:	864a                	mv	a2,s2
ffffffffc020b1f2:	4705                	li	a4,1
ffffffffc020b1f4:	4685                	li	a3,1
ffffffffc020b1f6:	8552                	mv	a0,s4
ffffffffc020b1f8:	d41ff0ef          	jal	ra,ffffffffc020af38 <sfs_rwblock_nolock>
ffffffffc020b1fc:	84aa                	mv	s1,a0
ffffffffc020b1fe:	9456                	add	s0,s0,s5
ffffffffc020b200:	d565                	beqz	a0,ffffffffc020b1e8 <sfs_sync_freemap+0x3e>
ffffffffc020b202:	8552                	mv	a0,s4
ffffffffc020b204:	094000ef          	jal	ra,ffffffffc020b298 <unlock_sfs_io>
ffffffffc020b208:	70e2                	ld	ra,56(sp)
ffffffffc020b20a:	7442                	ld	s0,48(sp)
ffffffffc020b20c:	7902                	ld	s2,32(sp)
ffffffffc020b20e:	69e2                	ld	s3,24(sp)
ffffffffc020b210:	6a42                	ld	s4,16(sp)
ffffffffc020b212:	6aa2                	ld	s5,8(sp)
ffffffffc020b214:	8526                	mv	a0,s1
ffffffffc020b216:	74a2                	ld	s1,40(sp)
ffffffffc020b218:	6121                	addi	sp,sp,64
ffffffffc020b21a:	8082                	ret
ffffffffc020b21c:	4481                	li	s1,0
ffffffffc020b21e:	b7d5                	j	ffffffffc020b202 <sfs_sync_freemap+0x58>

ffffffffc020b220 <sfs_clear_block>:
ffffffffc020b220:	7179                	addi	sp,sp,-48
ffffffffc020b222:	f022                	sd	s0,32(sp)
ffffffffc020b224:	e84a                	sd	s2,16(sp)
ffffffffc020b226:	e44e                	sd	s3,8(sp)
ffffffffc020b228:	f406                	sd	ra,40(sp)
ffffffffc020b22a:	89b2                	mv	s3,a2
ffffffffc020b22c:	ec26                	sd	s1,24(sp)
ffffffffc020b22e:	892a                	mv	s2,a0
ffffffffc020b230:	842e                	mv	s0,a1
ffffffffc020b232:	056000ef          	jal	ra,ffffffffc020b288 <lock_sfs_io>
ffffffffc020b236:	04893503          	ld	a0,72(s2)
ffffffffc020b23a:	6605                	lui	a2,0x1
ffffffffc020b23c:	4581                	li	a1,0
ffffffffc020b23e:	596000ef          	jal	ra,ffffffffc020b7d4 <memset>
ffffffffc020b242:	02098d63          	beqz	s3,ffffffffc020b27c <sfs_clear_block+0x5c>
ffffffffc020b246:	013409bb          	addw	s3,s0,s3
ffffffffc020b24a:	a019                	j	ffffffffc020b250 <sfs_clear_block+0x30>
ffffffffc020b24c:	02898863          	beq	s3,s0,ffffffffc020b27c <sfs_clear_block+0x5c>
ffffffffc020b250:	04893583          	ld	a1,72(s2)
ffffffffc020b254:	8622                	mv	a2,s0
ffffffffc020b256:	4705                	li	a4,1
ffffffffc020b258:	4685                	li	a3,1
ffffffffc020b25a:	854a                	mv	a0,s2
ffffffffc020b25c:	cddff0ef          	jal	ra,ffffffffc020af38 <sfs_rwblock_nolock>
ffffffffc020b260:	84aa                	mv	s1,a0
ffffffffc020b262:	2405                	addiw	s0,s0,1
ffffffffc020b264:	d565                	beqz	a0,ffffffffc020b24c <sfs_clear_block+0x2c>
ffffffffc020b266:	854a                	mv	a0,s2
ffffffffc020b268:	030000ef          	jal	ra,ffffffffc020b298 <unlock_sfs_io>
ffffffffc020b26c:	70a2                	ld	ra,40(sp)
ffffffffc020b26e:	7402                	ld	s0,32(sp)
ffffffffc020b270:	6942                	ld	s2,16(sp)
ffffffffc020b272:	69a2                	ld	s3,8(sp)
ffffffffc020b274:	8526                	mv	a0,s1
ffffffffc020b276:	64e2                	ld	s1,24(sp)
ffffffffc020b278:	6145                	addi	sp,sp,48
ffffffffc020b27a:	8082                	ret
ffffffffc020b27c:	4481                	li	s1,0
ffffffffc020b27e:	b7e5                	j	ffffffffc020b266 <sfs_clear_block+0x46>

ffffffffc020b280 <lock_sfs_fs>:
ffffffffc020b280:	05050513          	addi	a0,a0,80
ffffffffc020b284:	ae0f906f          	j	ffffffffc0204564 <down>

ffffffffc020b288 <lock_sfs_io>:
ffffffffc020b288:	06850513          	addi	a0,a0,104
ffffffffc020b28c:	ad8f906f          	j	ffffffffc0204564 <down>

ffffffffc020b290 <unlock_sfs_fs>:
ffffffffc020b290:	05050513          	addi	a0,a0,80
ffffffffc020b294:	accf906f          	j	ffffffffc0204560 <up>

ffffffffc020b298 <unlock_sfs_io>:
ffffffffc020b298:	06850513          	addi	a0,a0,104
ffffffffc020b29c:	ac4f906f          	j	ffffffffc0204560 <up>

ffffffffc020b2a0 <hash32>:
ffffffffc020b2a0:	9e3707b7          	lui	a5,0x9e370
ffffffffc020b2a4:	2785                	addiw	a5,a5,1
ffffffffc020b2a6:	02a7853b          	mulw	a0,a5,a0
ffffffffc020b2aa:	02000793          	li	a5,32
ffffffffc020b2ae:	9f8d                	subw	a5,a5,a1
ffffffffc020b2b0:	00f5553b          	srlw	a0,a0,a5
ffffffffc020b2b4:	8082                	ret

ffffffffc020b2b6 <printnum>:
ffffffffc020b2b6:	02071893          	slli	a7,a4,0x20
ffffffffc020b2ba:	7139                	addi	sp,sp,-64
ffffffffc020b2bc:	0208d893          	srli	a7,a7,0x20
ffffffffc020b2c0:	e456                	sd	s5,8(sp)
ffffffffc020b2c2:	0316fab3          	remu	s5,a3,a7
ffffffffc020b2c6:	f822                	sd	s0,48(sp)
ffffffffc020b2c8:	f426                	sd	s1,40(sp)
ffffffffc020b2ca:	f04a                	sd	s2,32(sp)
ffffffffc020b2cc:	ec4e                	sd	s3,24(sp)
ffffffffc020b2ce:	fc06                	sd	ra,56(sp)
ffffffffc020b2d0:	e852                	sd	s4,16(sp)
ffffffffc020b2d2:	84aa                	mv	s1,a0
ffffffffc020b2d4:	89ae                	mv	s3,a1
ffffffffc020b2d6:	8932                	mv	s2,a2
ffffffffc020b2d8:	fff7841b          	addiw	s0,a5,-1
ffffffffc020b2dc:	2a81                	sext.w	s5,s5
ffffffffc020b2de:	0516f163          	bgeu	a3,a7,ffffffffc020b320 <printnum+0x6a>
ffffffffc020b2e2:	8a42                	mv	s4,a6
ffffffffc020b2e4:	00805863          	blez	s0,ffffffffc020b2f4 <printnum+0x3e>
ffffffffc020b2e8:	347d                	addiw	s0,s0,-1
ffffffffc020b2ea:	864e                	mv	a2,s3
ffffffffc020b2ec:	85ca                	mv	a1,s2
ffffffffc020b2ee:	8552                	mv	a0,s4
ffffffffc020b2f0:	9482                	jalr	s1
ffffffffc020b2f2:	f87d                	bnez	s0,ffffffffc020b2e8 <printnum+0x32>
ffffffffc020b2f4:	1a82                	slli	s5,s5,0x20
ffffffffc020b2f6:	00005797          	auipc	a5,0x5
ffffffffc020b2fa:	8c278793          	addi	a5,a5,-1854 # ffffffffc020fbb8 <sfs_node_fileops+0x118>
ffffffffc020b2fe:	020ada93          	srli	s5,s5,0x20
ffffffffc020b302:	9abe                	add	s5,s5,a5
ffffffffc020b304:	7442                	ld	s0,48(sp)
ffffffffc020b306:	000ac503          	lbu	a0,0(s5) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc020b30a:	70e2                	ld	ra,56(sp)
ffffffffc020b30c:	6a42                	ld	s4,16(sp)
ffffffffc020b30e:	6aa2                	ld	s5,8(sp)
ffffffffc020b310:	864e                	mv	a2,s3
ffffffffc020b312:	85ca                	mv	a1,s2
ffffffffc020b314:	69e2                	ld	s3,24(sp)
ffffffffc020b316:	7902                	ld	s2,32(sp)
ffffffffc020b318:	87a6                	mv	a5,s1
ffffffffc020b31a:	74a2                	ld	s1,40(sp)
ffffffffc020b31c:	6121                	addi	sp,sp,64
ffffffffc020b31e:	8782                	jr	a5
ffffffffc020b320:	0316d6b3          	divu	a3,a3,a7
ffffffffc020b324:	87a2                	mv	a5,s0
ffffffffc020b326:	f91ff0ef          	jal	ra,ffffffffc020b2b6 <printnum>
ffffffffc020b32a:	b7e9                	j	ffffffffc020b2f4 <printnum+0x3e>

ffffffffc020b32c <sprintputch>:
ffffffffc020b32c:	499c                	lw	a5,16(a1)
ffffffffc020b32e:	6198                	ld	a4,0(a1)
ffffffffc020b330:	6594                	ld	a3,8(a1)
ffffffffc020b332:	2785                	addiw	a5,a5,1
ffffffffc020b334:	c99c                	sw	a5,16(a1)
ffffffffc020b336:	00d77763          	bgeu	a4,a3,ffffffffc020b344 <sprintputch+0x18>
ffffffffc020b33a:	00170793          	addi	a5,a4,1
ffffffffc020b33e:	e19c                	sd	a5,0(a1)
ffffffffc020b340:	00a70023          	sb	a0,0(a4)
ffffffffc020b344:	8082                	ret

ffffffffc020b346 <vprintfmt>:
ffffffffc020b346:	7119                	addi	sp,sp,-128
ffffffffc020b348:	f4a6                	sd	s1,104(sp)
ffffffffc020b34a:	f0ca                	sd	s2,96(sp)
ffffffffc020b34c:	ecce                	sd	s3,88(sp)
ffffffffc020b34e:	e8d2                	sd	s4,80(sp)
ffffffffc020b350:	e4d6                	sd	s5,72(sp)
ffffffffc020b352:	e0da                	sd	s6,64(sp)
ffffffffc020b354:	fc5e                	sd	s7,56(sp)
ffffffffc020b356:	ec6e                	sd	s11,24(sp)
ffffffffc020b358:	fc86                	sd	ra,120(sp)
ffffffffc020b35a:	f8a2                	sd	s0,112(sp)
ffffffffc020b35c:	f862                	sd	s8,48(sp)
ffffffffc020b35e:	f466                	sd	s9,40(sp)
ffffffffc020b360:	f06a                	sd	s10,32(sp)
ffffffffc020b362:	89aa                	mv	s3,a0
ffffffffc020b364:	892e                	mv	s2,a1
ffffffffc020b366:	84b2                	mv	s1,a2
ffffffffc020b368:	8db6                	mv	s11,a3
ffffffffc020b36a:	8aba                	mv	s5,a4
ffffffffc020b36c:	02500a13          	li	s4,37
ffffffffc020b370:	5bfd                	li	s7,-1
ffffffffc020b372:	00005b17          	auipc	s6,0x5
ffffffffc020b376:	872b0b13          	addi	s6,s6,-1934 # ffffffffc020fbe4 <sfs_node_fileops+0x144>
ffffffffc020b37a:	000dc503          	lbu	a0,0(s11) # 2000 <_binary_bin_swap_img_size-0x5d00>
ffffffffc020b37e:	001d8413          	addi	s0,s11,1
ffffffffc020b382:	01450b63          	beq	a0,s4,ffffffffc020b398 <vprintfmt+0x52>
ffffffffc020b386:	c129                	beqz	a0,ffffffffc020b3c8 <vprintfmt+0x82>
ffffffffc020b388:	864a                	mv	a2,s2
ffffffffc020b38a:	85a6                	mv	a1,s1
ffffffffc020b38c:	0405                	addi	s0,s0,1
ffffffffc020b38e:	9982                	jalr	s3
ffffffffc020b390:	fff44503          	lbu	a0,-1(s0)
ffffffffc020b394:	ff4519e3          	bne	a0,s4,ffffffffc020b386 <vprintfmt+0x40>
ffffffffc020b398:	00044583          	lbu	a1,0(s0)
ffffffffc020b39c:	02000813          	li	a6,32
ffffffffc020b3a0:	4d01                	li	s10,0
ffffffffc020b3a2:	4301                	li	t1,0
ffffffffc020b3a4:	5cfd                	li	s9,-1
ffffffffc020b3a6:	5c7d                	li	s8,-1
ffffffffc020b3a8:	05500513          	li	a0,85
ffffffffc020b3ac:	48a5                	li	a7,9
ffffffffc020b3ae:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020b3b2:	0ff67613          	zext.b	a2,a2
ffffffffc020b3b6:	00140d93          	addi	s11,s0,1
ffffffffc020b3ba:	04c56263          	bltu	a0,a2,ffffffffc020b3fe <vprintfmt+0xb8>
ffffffffc020b3be:	060a                	slli	a2,a2,0x2
ffffffffc020b3c0:	965a                	add	a2,a2,s6
ffffffffc020b3c2:	4214                	lw	a3,0(a2)
ffffffffc020b3c4:	96da                	add	a3,a3,s6
ffffffffc020b3c6:	8682                	jr	a3
ffffffffc020b3c8:	70e6                	ld	ra,120(sp)
ffffffffc020b3ca:	7446                	ld	s0,112(sp)
ffffffffc020b3cc:	74a6                	ld	s1,104(sp)
ffffffffc020b3ce:	7906                	ld	s2,96(sp)
ffffffffc020b3d0:	69e6                	ld	s3,88(sp)
ffffffffc020b3d2:	6a46                	ld	s4,80(sp)
ffffffffc020b3d4:	6aa6                	ld	s5,72(sp)
ffffffffc020b3d6:	6b06                	ld	s6,64(sp)
ffffffffc020b3d8:	7be2                	ld	s7,56(sp)
ffffffffc020b3da:	7c42                	ld	s8,48(sp)
ffffffffc020b3dc:	7ca2                	ld	s9,40(sp)
ffffffffc020b3de:	7d02                	ld	s10,32(sp)
ffffffffc020b3e0:	6de2                	ld	s11,24(sp)
ffffffffc020b3e2:	6109                	addi	sp,sp,128
ffffffffc020b3e4:	8082                	ret
ffffffffc020b3e6:	882e                	mv	a6,a1
ffffffffc020b3e8:	00144583          	lbu	a1,1(s0)
ffffffffc020b3ec:	846e                	mv	s0,s11
ffffffffc020b3ee:	00140d93          	addi	s11,s0,1
ffffffffc020b3f2:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020b3f6:	0ff67613          	zext.b	a2,a2
ffffffffc020b3fa:	fcc572e3          	bgeu	a0,a2,ffffffffc020b3be <vprintfmt+0x78>
ffffffffc020b3fe:	864a                	mv	a2,s2
ffffffffc020b400:	85a6                	mv	a1,s1
ffffffffc020b402:	02500513          	li	a0,37
ffffffffc020b406:	9982                	jalr	s3
ffffffffc020b408:	fff44783          	lbu	a5,-1(s0)
ffffffffc020b40c:	8da2                	mv	s11,s0
ffffffffc020b40e:	f74786e3          	beq	a5,s4,ffffffffc020b37a <vprintfmt+0x34>
ffffffffc020b412:	ffedc783          	lbu	a5,-2(s11)
ffffffffc020b416:	1dfd                	addi	s11,s11,-1
ffffffffc020b418:	ff479de3          	bne	a5,s4,ffffffffc020b412 <vprintfmt+0xcc>
ffffffffc020b41c:	bfb9                	j	ffffffffc020b37a <vprintfmt+0x34>
ffffffffc020b41e:	fd058c9b          	addiw	s9,a1,-48
ffffffffc020b422:	00144583          	lbu	a1,1(s0)
ffffffffc020b426:	846e                	mv	s0,s11
ffffffffc020b428:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b42c:	0005861b          	sext.w	a2,a1
ffffffffc020b430:	02d8e463          	bltu	a7,a3,ffffffffc020b458 <vprintfmt+0x112>
ffffffffc020b434:	00144583          	lbu	a1,1(s0)
ffffffffc020b438:	002c969b          	slliw	a3,s9,0x2
ffffffffc020b43c:	0196873b          	addw	a4,a3,s9
ffffffffc020b440:	0017171b          	slliw	a4,a4,0x1
ffffffffc020b444:	9f31                	addw	a4,a4,a2
ffffffffc020b446:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b44a:	0405                	addi	s0,s0,1
ffffffffc020b44c:	fd070c9b          	addiw	s9,a4,-48
ffffffffc020b450:	0005861b          	sext.w	a2,a1
ffffffffc020b454:	fed8f0e3          	bgeu	a7,a3,ffffffffc020b434 <vprintfmt+0xee>
ffffffffc020b458:	f40c5be3          	bgez	s8,ffffffffc020b3ae <vprintfmt+0x68>
ffffffffc020b45c:	8c66                	mv	s8,s9
ffffffffc020b45e:	5cfd                	li	s9,-1
ffffffffc020b460:	b7b9                	j	ffffffffc020b3ae <vprintfmt+0x68>
ffffffffc020b462:	fffc4693          	not	a3,s8
ffffffffc020b466:	96fd                	srai	a3,a3,0x3f
ffffffffc020b468:	00dc77b3          	and	a5,s8,a3
ffffffffc020b46c:	00144583          	lbu	a1,1(s0)
ffffffffc020b470:	00078c1b          	sext.w	s8,a5
ffffffffc020b474:	846e                	mv	s0,s11
ffffffffc020b476:	bf25                	j	ffffffffc020b3ae <vprintfmt+0x68>
ffffffffc020b478:	000aac83          	lw	s9,0(s5)
ffffffffc020b47c:	00144583          	lbu	a1,1(s0)
ffffffffc020b480:	0aa1                	addi	s5,s5,8
ffffffffc020b482:	846e                	mv	s0,s11
ffffffffc020b484:	bfd1                	j	ffffffffc020b458 <vprintfmt+0x112>
ffffffffc020b486:	4705                	li	a4,1
ffffffffc020b488:	008a8613          	addi	a2,s5,8
ffffffffc020b48c:	00674463          	blt	a4,t1,ffffffffc020b494 <vprintfmt+0x14e>
ffffffffc020b490:	1c030c63          	beqz	t1,ffffffffc020b668 <vprintfmt+0x322>
ffffffffc020b494:	000ab683          	ld	a3,0(s5)
ffffffffc020b498:	4741                	li	a4,16
ffffffffc020b49a:	8ab2                	mv	s5,a2
ffffffffc020b49c:	2801                	sext.w	a6,a6
ffffffffc020b49e:	87e2                	mv	a5,s8
ffffffffc020b4a0:	8626                	mv	a2,s1
ffffffffc020b4a2:	85ca                	mv	a1,s2
ffffffffc020b4a4:	854e                	mv	a0,s3
ffffffffc020b4a6:	e11ff0ef          	jal	ra,ffffffffc020b2b6 <printnum>
ffffffffc020b4aa:	bdc1                	j	ffffffffc020b37a <vprintfmt+0x34>
ffffffffc020b4ac:	000aa503          	lw	a0,0(s5)
ffffffffc020b4b0:	864a                	mv	a2,s2
ffffffffc020b4b2:	85a6                	mv	a1,s1
ffffffffc020b4b4:	0aa1                	addi	s5,s5,8
ffffffffc020b4b6:	9982                	jalr	s3
ffffffffc020b4b8:	b5c9                	j	ffffffffc020b37a <vprintfmt+0x34>
ffffffffc020b4ba:	4705                	li	a4,1
ffffffffc020b4bc:	008a8613          	addi	a2,s5,8
ffffffffc020b4c0:	00674463          	blt	a4,t1,ffffffffc020b4c8 <vprintfmt+0x182>
ffffffffc020b4c4:	18030d63          	beqz	t1,ffffffffc020b65e <vprintfmt+0x318>
ffffffffc020b4c8:	000ab683          	ld	a3,0(s5)
ffffffffc020b4cc:	4729                	li	a4,10
ffffffffc020b4ce:	8ab2                	mv	s5,a2
ffffffffc020b4d0:	b7f1                	j	ffffffffc020b49c <vprintfmt+0x156>
ffffffffc020b4d2:	00144583          	lbu	a1,1(s0)
ffffffffc020b4d6:	4d05                	li	s10,1
ffffffffc020b4d8:	846e                	mv	s0,s11
ffffffffc020b4da:	bdd1                	j	ffffffffc020b3ae <vprintfmt+0x68>
ffffffffc020b4dc:	864a                	mv	a2,s2
ffffffffc020b4de:	85a6                	mv	a1,s1
ffffffffc020b4e0:	02500513          	li	a0,37
ffffffffc020b4e4:	9982                	jalr	s3
ffffffffc020b4e6:	bd51                	j	ffffffffc020b37a <vprintfmt+0x34>
ffffffffc020b4e8:	00144583          	lbu	a1,1(s0)
ffffffffc020b4ec:	2305                	addiw	t1,t1,1
ffffffffc020b4ee:	846e                	mv	s0,s11
ffffffffc020b4f0:	bd7d                	j	ffffffffc020b3ae <vprintfmt+0x68>
ffffffffc020b4f2:	4705                	li	a4,1
ffffffffc020b4f4:	008a8613          	addi	a2,s5,8
ffffffffc020b4f8:	00674463          	blt	a4,t1,ffffffffc020b500 <vprintfmt+0x1ba>
ffffffffc020b4fc:	14030c63          	beqz	t1,ffffffffc020b654 <vprintfmt+0x30e>
ffffffffc020b500:	000ab683          	ld	a3,0(s5)
ffffffffc020b504:	4721                	li	a4,8
ffffffffc020b506:	8ab2                	mv	s5,a2
ffffffffc020b508:	bf51                	j	ffffffffc020b49c <vprintfmt+0x156>
ffffffffc020b50a:	03000513          	li	a0,48
ffffffffc020b50e:	864a                	mv	a2,s2
ffffffffc020b510:	85a6                	mv	a1,s1
ffffffffc020b512:	e042                	sd	a6,0(sp)
ffffffffc020b514:	9982                	jalr	s3
ffffffffc020b516:	864a                	mv	a2,s2
ffffffffc020b518:	85a6                	mv	a1,s1
ffffffffc020b51a:	07800513          	li	a0,120
ffffffffc020b51e:	9982                	jalr	s3
ffffffffc020b520:	0aa1                	addi	s5,s5,8
ffffffffc020b522:	6802                	ld	a6,0(sp)
ffffffffc020b524:	4741                	li	a4,16
ffffffffc020b526:	ff8ab683          	ld	a3,-8(s5)
ffffffffc020b52a:	bf8d                	j	ffffffffc020b49c <vprintfmt+0x156>
ffffffffc020b52c:	000ab403          	ld	s0,0(s5)
ffffffffc020b530:	008a8793          	addi	a5,s5,8
ffffffffc020b534:	e03e                	sd	a5,0(sp)
ffffffffc020b536:	14040c63          	beqz	s0,ffffffffc020b68e <vprintfmt+0x348>
ffffffffc020b53a:	11805063          	blez	s8,ffffffffc020b63a <vprintfmt+0x2f4>
ffffffffc020b53e:	02d00693          	li	a3,45
ffffffffc020b542:	0cd81963          	bne	a6,a3,ffffffffc020b614 <vprintfmt+0x2ce>
ffffffffc020b546:	00044683          	lbu	a3,0(s0)
ffffffffc020b54a:	0006851b          	sext.w	a0,a3
ffffffffc020b54e:	ce8d                	beqz	a3,ffffffffc020b588 <vprintfmt+0x242>
ffffffffc020b550:	00140a93          	addi	s5,s0,1
ffffffffc020b554:	05e00413          	li	s0,94
ffffffffc020b558:	000cc563          	bltz	s9,ffffffffc020b562 <vprintfmt+0x21c>
ffffffffc020b55c:	3cfd                	addiw	s9,s9,-1
ffffffffc020b55e:	037c8363          	beq	s9,s7,ffffffffc020b584 <vprintfmt+0x23e>
ffffffffc020b562:	864a                	mv	a2,s2
ffffffffc020b564:	85a6                	mv	a1,s1
ffffffffc020b566:	100d0663          	beqz	s10,ffffffffc020b672 <vprintfmt+0x32c>
ffffffffc020b56a:	3681                	addiw	a3,a3,-32
ffffffffc020b56c:	10d47363          	bgeu	s0,a3,ffffffffc020b672 <vprintfmt+0x32c>
ffffffffc020b570:	03f00513          	li	a0,63
ffffffffc020b574:	9982                	jalr	s3
ffffffffc020b576:	000ac683          	lbu	a3,0(s5)
ffffffffc020b57a:	3c7d                	addiw	s8,s8,-1
ffffffffc020b57c:	0a85                	addi	s5,s5,1
ffffffffc020b57e:	0006851b          	sext.w	a0,a3
ffffffffc020b582:	faf9                	bnez	a3,ffffffffc020b558 <vprintfmt+0x212>
ffffffffc020b584:	01805a63          	blez	s8,ffffffffc020b598 <vprintfmt+0x252>
ffffffffc020b588:	3c7d                	addiw	s8,s8,-1
ffffffffc020b58a:	864a                	mv	a2,s2
ffffffffc020b58c:	85a6                	mv	a1,s1
ffffffffc020b58e:	02000513          	li	a0,32
ffffffffc020b592:	9982                	jalr	s3
ffffffffc020b594:	fe0c1ae3          	bnez	s8,ffffffffc020b588 <vprintfmt+0x242>
ffffffffc020b598:	6a82                	ld	s5,0(sp)
ffffffffc020b59a:	b3c5                	j	ffffffffc020b37a <vprintfmt+0x34>
ffffffffc020b59c:	4705                	li	a4,1
ffffffffc020b59e:	008a8d13          	addi	s10,s5,8
ffffffffc020b5a2:	00674463          	blt	a4,t1,ffffffffc020b5aa <vprintfmt+0x264>
ffffffffc020b5a6:	0a030463          	beqz	t1,ffffffffc020b64e <vprintfmt+0x308>
ffffffffc020b5aa:	000ab403          	ld	s0,0(s5)
ffffffffc020b5ae:	0c044463          	bltz	s0,ffffffffc020b676 <vprintfmt+0x330>
ffffffffc020b5b2:	86a2                	mv	a3,s0
ffffffffc020b5b4:	8aea                	mv	s5,s10
ffffffffc020b5b6:	4729                	li	a4,10
ffffffffc020b5b8:	b5d5                	j	ffffffffc020b49c <vprintfmt+0x156>
ffffffffc020b5ba:	000aa783          	lw	a5,0(s5)
ffffffffc020b5be:	46e1                	li	a3,24
ffffffffc020b5c0:	0aa1                	addi	s5,s5,8
ffffffffc020b5c2:	41f7d71b          	sraiw	a4,a5,0x1f
ffffffffc020b5c6:	8fb9                	xor	a5,a5,a4
ffffffffc020b5c8:	40e7873b          	subw	a4,a5,a4
ffffffffc020b5cc:	02e6c663          	blt	a3,a4,ffffffffc020b5f8 <vprintfmt+0x2b2>
ffffffffc020b5d0:	00371793          	slli	a5,a4,0x3
ffffffffc020b5d4:	00005697          	auipc	a3,0x5
ffffffffc020b5d8:	94468693          	addi	a3,a3,-1724 # ffffffffc020ff18 <error_string>
ffffffffc020b5dc:	97b6                	add	a5,a5,a3
ffffffffc020b5de:	639c                	ld	a5,0(a5)
ffffffffc020b5e0:	cf81                	beqz	a5,ffffffffc020b5f8 <vprintfmt+0x2b2>
ffffffffc020b5e2:	873e                	mv	a4,a5
ffffffffc020b5e4:	00000697          	auipc	a3,0x0
ffffffffc020b5e8:	28468693          	addi	a3,a3,644 # ffffffffc020b868 <etext+0x2a>
ffffffffc020b5ec:	8626                	mv	a2,s1
ffffffffc020b5ee:	85ca                	mv	a1,s2
ffffffffc020b5f0:	854e                	mv	a0,s3
ffffffffc020b5f2:	0d4000ef          	jal	ra,ffffffffc020b6c6 <printfmt>
ffffffffc020b5f6:	b351                	j	ffffffffc020b37a <vprintfmt+0x34>
ffffffffc020b5f8:	00004697          	auipc	a3,0x4
ffffffffc020b5fc:	5e068693          	addi	a3,a3,1504 # ffffffffc020fbd8 <sfs_node_fileops+0x138>
ffffffffc020b600:	8626                	mv	a2,s1
ffffffffc020b602:	85ca                	mv	a1,s2
ffffffffc020b604:	854e                	mv	a0,s3
ffffffffc020b606:	0c0000ef          	jal	ra,ffffffffc020b6c6 <printfmt>
ffffffffc020b60a:	bb85                	j	ffffffffc020b37a <vprintfmt+0x34>
ffffffffc020b60c:	00004417          	auipc	s0,0x4
ffffffffc020b610:	5c440413          	addi	s0,s0,1476 # ffffffffc020fbd0 <sfs_node_fileops+0x130>
ffffffffc020b614:	85e6                	mv	a1,s9
ffffffffc020b616:	8522                	mv	a0,s0
ffffffffc020b618:	e442                	sd	a6,8(sp)
ffffffffc020b61a:	132000ef          	jal	ra,ffffffffc020b74c <strnlen>
ffffffffc020b61e:	40ac0c3b          	subw	s8,s8,a0
ffffffffc020b622:	01805c63          	blez	s8,ffffffffc020b63a <vprintfmt+0x2f4>
ffffffffc020b626:	6822                	ld	a6,8(sp)
ffffffffc020b628:	00080a9b          	sext.w	s5,a6
ffffffffc020b62c:	3c7d                	addiw	s8,s8,-1
ffffffffc020b62e:	864a                	mv	a2,s2
ffffffffc020b630:	85a6                	mv	a1,s1
ffffffffc020b632:	8556                	mv	a0,s5
ffffffffc020b634:	9982                	jalr	s3
ffffffffc020b636:	fe0c1be3          	bnez	s8,ffffffffc020b62c <vprintfmt+0x2e6>
ffffffffc020b63a:	00044683          	lbu	a3,0(s0)
ffffffffc020b63e:	00140a93          	addi	s5,s0,1
ffffffffc020b642:	0006851b          	sext.w	a0,a3
ffffffffc020b646:	daa9                	beqz	a3,ffffffffc020b598 <vprintfmt+0x252>
ffffffffc020b648:	05e00413          	li	s0,94
ffffffffc020b64c:	b731                	j	ffffffffc020b558 <vprintfmt+0x212>
ffffffffc020b64e:	000aa403          	lw	s0,0(s5)
ffffffffc020b652:	bfb1                	j	ffffffffc020b5ae <vprintfmt+0x268>
ffffffffc020b654:	000ae683          	lwu	a3,0(s5)
ffffffffc020b658:	4721                	li	a4,8
ffffffffc020b65a:	8ab2                	mv	s5,a2
ffffffffc020b65c:	b581                	j	ffffffffc020b49c <vprintfmt+0x156>
ffffffffc020b65e:	000ae683          	lwu	a3,0(s5)
ffffffffc020b662:	4729                	li	a4,10
ffffffffc020b664:	8ab2                	mv	s5,a2
ffffffffc020b666:	bd1d                	j	ffffffffc020b49c <vprintfmt+0x156>
ffffffffc020b668:	000ae683          	lwu	a3,0(s5)
ffffffffc020b66c:	4741                	li	a4,16
ffffffffc020b66e:	8ab2                	mv	s5,a2
ffffffffc020b670:	b535                	j	ffffffffc020b49c <vprintfmt+0x156>
ffffffffc020b672:	9982                	jalr	s3
ffffffffc020b674:	b709                	j	ffffffffc020b576 <vprintfmt+0x230>
ffffffffc020b676:	864a                	mv	a2,s2
ffffffffc020b678:	85a6                	mv	a1,s1
ffffffffc020b67a:	02d00513          	li	a0,45
ffffffffc020b67e:	e042                	sd	a6,0(sp)
ffffffffc020b680:	9982                	jalr	s3
ffffffffc020b682:	6802                	ld	a6,0(sp)
ffffffffc020b684:	8aea                	mv	s5,s10
ffffffffc020b686:	408006b3          	neg	a3,s0
ffffffffc020b68a:	4729                	li	a4,10
ffffffffc020b68c:	bd01                	j	ffffffffc020b49c <vprintfmt+0x156>
ffffffffc020b68e:	03805163          	blez	s8,ffffffffc020b6b0 <vprintfmt+0x36a>
ffffffffc020b692:	02d00693          	li	a3,45
ffffffffc020b696:	f6d81be3          	bne	a6,a3,ffffffffc020b60c <vprintfmt+0x2c6>
ffffffffc020b69a:	00004417          	auipc	s0,0x4
ffffffffc020b69e:	53640413          	addi	s0,s0,1334 # ffffffffc020fbd0 <sfs_node_fileops+0x130>
ffffffffc020b6a2:	02800693          	li	a3,40
ffffffffc020b6a6:	02800513          	li	a0,40
ffffffffc020b6aa:	00140a93          	addi	s5,s0,1
ffffffffc020b6ae:	b55d                	j	ffffffffc020b554 <vprintfmt+0x20e>
ffffffffc020b6b0:	00004a97          	auipc	s5,0x4
ffffffffc020b6b4:	521a8a93          	addi	s5,s5,1313 # ffffffffc020fbd1 <sfs_node_fileops+0x131>
ffffffffc020b6b8:	02800513          	li	a0,40
ffffffffc020b6bc:	02800693          	li	a3,40
ffffffffc020b6c0:	05e00413          	li	s0,94
ffffffffc020b6c4:	bd51                	j	ffffffffc020b558 <vprintfmt+0x212>

ffffffffc020b6c6 <printfmt>:
ffffffffc020b6c6:	7139                	addi	sp,sp,-64
ffffffffc020b6c8:	02010313          	addi	t1,sp,32
ffffffffc020b6cc:	f03a                	sd	a4,32(sp)
ffffffffc020b6ce:	871a                	mv	a4,t1
ffffffffc020b6d0:	ec06                	sd	ra,24(sp)
ffffffffc020b6d2:	f43e                	sd	a5,40(sp)
ffffffffc020b6d4:	f842                	sd	a6,48(sp)
ffffffffc020b6d6:	fc46                	sd	a7,56(sp)
ffffffffc020b6d8:	e41a                	sd	t1,8(sp)
ffffffffc020b6da:	c6dff0ef          	jal	ra,ffffffffc020b346 <vprintfmt>
ffffffffc020b6de:	60e2                	ld	ra,24(sp)
ffffffffc020b6e0:	6121                	addi	sp,sp,64
ffffffffc020b6e2:	8082                	ret

ffffffffc020b6e4 <snprintf>:
ffffffffc020b6e4:	711d                	addi	sp,sp,-96
ffffffffc020b6e6:	15fd                	addi	a1,a1,-1
ffffffffc020b6e8:	03810313          	addi	t1,sp,56
ffffffffc020b6ec:	95aa                	add	a1,a1,a0
ffffffffc020b6ee:	f406                	sd	ra,40(sp)
ffffffffc020b6f0:	fc36                	sd	a3,56(sp)
ffffffffc020b6f2:	e0ba                	sd	a4,64(sp)
ffffffffc020b6f4:	e4be                	sd	a5,72(sp)
ffffffffc020b6f6:	e8c2                	sd	a6,80(sp)
ffffffffc020b6f8:	ecc6                	sd	a7,88(sp)
ffffffffc020b6fa:	e01a                	sd	t1,0(sp)
ffffffffc020b6fc:	e42a                	sd	a0,8(sp)
ffffffffc020b6fe:	e82e                	sd	a1,16(sp)
ffffffffc020b700:	cc02                	sw	zero,24(sp)
ffffffffc020b702:	c515                	beqz	a0,ffffffffc020b72e <snprintf+0x4a>
ffffffffc020b704:	02a5e563          	bltu	a1,a0,ffffffffc020b72e <snprintf+0x4a>
ffffffffc020b708:	75dd                	lui	a1,0xffff7
ffffffffc020b70a:	86b2                	mv	a3,a2
ffffffffc020b70c:	00000517          	auipc	a0,0x0
ffffffffc020b710:	c2050513          	addi	a0,a0,-992 # ffffffffc020b32c <sprintputch>
ffffffffc020b714:	871a                	mv	a4,t1
ffffffffc020b716:	0030                	addi	a2,sp,8
ffffffffc020b718:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc020b71c:	c2bff0ef          	jal	ra,ffffffffc020b346 <vprintfmt>
ffffffffc020b720:	67a2                	ld	a5,8(sp)
ffffffffc020b722:	00078023          	sb	zero,0(a5)
ffffffffc020b726:	4562                	lw	a0,24(sp)
ffffffffc020b728:	70a2                	ld	ra,40(sp)
ffffffffc020b72a:	6125                	addi	sp,sp,96
ffffffffc020b72c:	8082                	ret
ffffffffc020b72e:	5575                	li	a0,-3
ffffffffc020b730:	bfe5                	j	ffffffffc020b728 <snprintf+0x44>

ffffffffc020b732 <strlen>:
ffffffffc020b732:	00054783          	lbu	a5,0(a0)
ffffffffc020b736:	872a                	mv	a4,a0
ffffffffc020b738:	4501                	li	a0,0
ffffffffc020b73a:	cb81                	beqz	a5,ffffffffc020b74a <strlen+0x18>
ffffffffc020b73c:	0505                	addi	a0,a0,1
ffffffffc020b73e:	00a707b3          	add	a5,a4,a0
ffffffffc020b742:	0007c783          	lbu	a5,0(a5)
ffffffffc020b746:	fbfd                	bnez	a5,ffffffffc020b73c <strlen+0xa>
ffffffffc020b748:	8082                	ret
ffffffffc020b74a:	8082                	ret

ffffffffc020b74c <strnlen>:
ffffffffc020b74c:	4781                	li	a5,0
ffffffffc020b74e:	e589                	bnez	a1,ffffffffc020b758 <strnlen+0xc>
ffffffffc020b750:	a811                	j	ffffffffc020b764 <strnlen+0x18>
ffffffffc020b752:	0785                	addi	a5,a5,1
ffffffffc020b754:	00f58863          	beq	a1,a5,ffffffffc020b764 <strnlen+0x18>
ffffffffc020b758:	00f50733          	add	a4,a0,a5
ffffffffc020b75c:	00074703          	lbu	a4,0(a4)
ffffffffc020b760:	fb6d                	bnez	a4,ffffffffc020b752 <strnlen+0x6>
ffffffffc020b762:	85be                	mv	a1,a5
ffffffffc020b764:	852e                	mv	a0,a1
ffffffffc020b766:	8082                	ret

ffffffffc020b768 <strcpy>:
ffffffffc020b768:	87aa                	mv	a5,a0
ffffffffc020b76a:	0005c703          	lbu	a4,0(a1)
ffffffffc020b76e:	0785                	addi	a5,a5,1
ffffffffc020b770:	0585                	addi	a1,a1,1
ffffffffc020b772:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b776:	fb75                	bnez	a4,ffffffffc020b76a <strcpy+0x2>
ffffffffc020b778:	8082                	ret

ffffffffc020b77a <strcmp>:
ffffffffc020b77a:	00054783          	lbu	a5,0(a0)
ffffffffc020b77e:	0005c703          	lbu	a4,0(a1)
ffffffffc020b782:	cb89                	beqz	a5,ffffffffc020b794 <strcmp+0x1a>
ffffffffc020b784:	0505                	addi	a0,a0,1
ffffffffc020b786:	0585                	addi	a1,a1,1
ffffffffc020b788:	fee789e3          	beq	a5,a4,ffffffffc020b77a <strcmp>
ffffffffc020b78c:	0007851b          	sext.w	a0,a5
ffffffffc020b790:	9d19                	subw	a0,a0,a4
ffffffffc020b792:	8082                	ret
ffffffffc020b794:	4501                	li	a0,0
ffffffffc020b796:	bfed                	j	ffffffffc020b790 <strcmp+0x16>

ffffffffc020b798 <strncmp>:
ffffffffc020b798:	c20d                	beqz	a2,ffffffffc020b7ba <strncmp+0x22>
ffffffffc020b79a:	962e                	add	a2,a2,a1
ffffffffc020b79c:	a031                	j	ffffffffc020b7a8 <strncmp+0x10>
ffffffffc020b79e:	0505                	addi	a0,a0,1
ffffffffc020b7a0:	00e79a63          	bne	a5,a4,ffffffffc020b7b4 <strncmp+0x1c>
ffffffffc020b7a4:	00b60b63          	beq	a2,a1,ffffffffc020b7ba <strncmp+0x22>
ffffffffc020b7a8:	00054783          	lbu	a5,0(a0)
ffffffffc020b7ac:	0585                	addi	a1,a1,1
ffffffffc020b7ae:	fff5c703          	lbu	a4,-1(a1)
ffffffffc020b7b2:	f7f5                	bnez	a5,ffffffffc020b79e <strncmp+0x6>
ffffffffc020b7b4:	40e7853b          	subw	a0,a5,a4
ffffffffc020b7b8:	8082                	ret
ffffffffc020b7ba:	4501                	li	a0,0
ffffffffc020b7bc:	8082                	ret

ffffffffc020b7be <strchr>:
ffffffffc020b7be:	00054783          	lbu	a5,0(a0)
ffffffffc020b7c2:	c799                	beqz	a5,ffffffffc020b7d0 <strchr+0x12>
ffffffffc020b7c4:	00f58763          	beq	a1,a5,ffffffffc020b7d2 <strchr+0x14>
ffffffffc020b7c8:	00154783          	lbu	a5,1(a0)
ffffffffc020b7cc:	0505                	addi	a0,a0,1
ffffffffc020b7ce:	fbfd                	bnez	a5,ffffffffc020b7c4 <strchr+0x6>
ffffffffc020b7d0:	4501                	li	a0,0
ffffffffc020b7d2:	8082                	ret

ffffffffc020b7d4 <memset>:
ffffffffc020b7d4:	ca01                	beqz	a2,ffffffffc020b7e4 <memset+0x10>
ffffffffc020b7d6:	962a                	add	a2,a2,a0
ffffffffc020b7d8:	87aa                	mv	a5,a0
ffffffffc020b7da:	0785                	addi	a5,a5,1
ffffffffc020b7dc:	feb78fa3          	sb	a1,-1(a5)
ffffffffc020b7e0:	fec79de3          	bne	a5,a2,ffffffffc020b7da <memset+0x6>
ffffffffc020b7e4:	8082                	ret

ffffffffc020b7e6 <memmove>:
ffffffffc020b7e6:	02a5f263          	bgeu	a1,a0,ffffffffc020b80a <memmove+0x24>
ffffffffc020b7ea:	00c587b3          	add	a5,a1,a2
ffffffffc020b7ee:	00f57e63          	bgeu	a0,a5,ffffffffc020b80a <memmove+0x24>
ffffffffc020b7f2:	00c50733          	add	a4,a0,a2
ffffffffc020b7f6:	c615                	beqz	a2,ffffffffc020b822 <memmove+0x3c>
ffffffffc020b7f8:	fff7c683          	lbu	a3,-1(a5)
ffffffffc020b7fc:	17fd                	addi	a5,a5,-1
ffffffffc020b7fe:	177d                	addi	a4,a4,-1
ffffffffc020b800:	00d70023          	sb	a3,0(a4)
ffffffffc020b804:	fef59ae3          	bne	a1,a5,ffffffffc020b7f8 <memmove+0x12>
ffffffffc020b808:	8082                	ret
ffffffffc020b80a:	00c586b3          	add	a3,a1,a2
ffffffffc020b80e:	87aa                	mv	a5,a0
ffffffffc020b810:	ca11                	beqz	a2,ffffffffc020b824 <memmove+0x3e>
ffffffffc020b812:	0005c703          	lbu	a4,0(a1)
ffffffffc020b816:	0585                	addi	a1,a1,1
ffffffffc020b818:	0785                	addi	a5,a5,1
ffffffffc020b81a:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b81e:	fed59ae3          	bne	a1,a3,ffffffffc020b812 <memmove+0x2c>
ffffffffc020b822:	8082                	ret
ffffffffc020b824:	8082                	ret

ffffffffc020b826 <memcpy>:
ffffffffc020b826:	ca19                	beqz	a2,ffffffffc020b83c <memcpy+0x16>
ffffffffc020b828:	962e                	add	a2,a2,a1
ffffffffc020b82a:	87aa                	mv	a5,a0
ffffffffc020b82c:	0005c703          	lbu	a4,0(a1)
ffffffffc020b830:	0585                	addi	a1,a1,1
ffffffffc020b832:	0785                	addi	a5,a5,1
ffffffffc020b834:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b838:	fec59ae3          	bne	a1,a2,ffffffffc020b82c <memcpy+0x6>
ffffffffc020b83c:	8082                	ret
