
D:\RustSBI\bl808-blinky\target\riscv32imac-unknown-none-elf\release\bl808-blinky-m0:	file format elf32-littleriscv

Disassembly of section .text:

58000000 <stext>:
58000000: 17 01 03 0a  	auipc	sp, 41008
58000004: 13 01 01 00  	mv	sp, sp
58000008: 93 02 00 40  	li	t0, 1024
5800000c: 16 91        	add	sp, sp, t0
5800000e: 97 00 00 00  	auipc	ra, 0
58000012: e7 80 20 01  	jalr	18(ra)
58000016: 97 00 00 00  	auipc	ra, 0
5800001a: e7 80 20 04  	jalr	66(ra)
5800001e: 00 00        	unimp	

58000020 <_ZN15bl808_blinky_m04main17h566997be83d5fd7dE>:
58000020: 37 05 03 62  	lui	a0, 401456
58000024: 85 45        	li	a1, 1
58000026: 23 00 b5 40  	sb	a1, 1024(a0)
5800002a: 37 15 00 20  	lui	a0, 131073
5800002e: 83 25 45 8e  	lw	a1, -1820(a0)
58000032: 37 06 00 40  	lui	a2, 262144
58000036: 13 06 e6 fa  	addi	a2, a2, -82
5800003a: f1 8d        	and	a1, a1, a2
5800003c: b2 95        	add	a1, a1, a2
5800003e: 93 85 25 0a  	addi	a1, a1, 162
58000042: 23 22 b5 8e  	sw	a1, -1820(a0)
58000046: 83 25 45 8e  	lw	a1, -1820(a0)
5800004a: 37 06 00 fe  	lui	a2, 1040384
5800004e: 7d 16        	addi	a2, a2, -1
58000050: f1 8d        	and	a1, a1, a2
58000052: 23 22 b5 8e  	sw	a1, -1820(a0)
58000056: 82 80        	ret

58000058 <_ZN15bl808_blinky_m08finalize17hb5e236640154f1faE>:
58000058: 73 00 50 10  	wfi	
5800005c: f5 bf        	j	0x58000058 <_ZN15bl808_blinky_m08finalize17hb5e236640154f1faE>
5800005e: 00 00        	unimp	
