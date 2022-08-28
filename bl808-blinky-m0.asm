
D:\RustSBI\bl808-blinky\target\riscv32imac-unknown-none-elf\release\bl808-blinky-m0:	file format elf32-littleriscv

Disassembly of section .text:

58000000 <stext>:
58000000: 17 81 ff e6  	auipc	sp, 946168
58000004: 13 01 01 00  	mv	sp, sp
58000008: 93 02 00 40  	li	t0, 1024
5800000c: 16 91        	add	sp, sp, t0
5800000e: 97 00 00 00  	auipc	ra, 0
58000012: e7 80 20 01  	jalr	18(ra)
58000016: 97 00 00 00  	auipc	ra, 0
5800001a: e7 80 c0 00  	jalr	12(ra)
5800001e: 00 00        	unimp	

58000020 <_ZN15bl808_blinky_m04main17hd65ffb62cc638caeE>:
58000020: 82 80        	ret

58000022 <_ZN15bl808_blinky_m08finalize17h741820cec11be23cE>:
58000022: 0f 00 00 01  	fence	w, unknown
58000026: f5 bf        	j	0x58000022 <_ZN15bl808_blinky_m08finalize17h741820cec11be23cE>
