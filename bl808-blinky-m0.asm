
D:\RustSBI\bl808-blinky\target\riscv64imac-unknown-none-elf\release\bl808-blinky-m0:	file format elf64-littleriscv

Disassembly of section .text:

0000000090000000 <stext>:
90000000: 17 81 03 d2  	auipc	sp, 860216
90000004: 13 01 01 00  	mv	sp, sp
90000008: 93 02 00 40  	li	t0, 1024
9000000c: 16 91        	add	sp, sp, t0
9000000e: 97 00 00 00  	auipc	ra, 0
90000012: e7 80 20 01  	jalr	18(ra)
90000016: 97 00 00 00  	auipc	ra, 0
9000001a: e7 80 c0 00  	jalr	12(ra)
9000001e: 00 00        	unimp	

0000000090000020 <_ZN15bl808_blinky_m04main17h0d684832d2af0508E>:
90000020: 82 80        	ret

0000000090000022 <_ZN15bl808_blinky_m08finalize17h6bb6c7745b35ef1bE>:
90000022: 0f 00 00 01  	fence	w, unknown
90000026: f5 bf        	j	0x90000022 <_ZN15bl808_blinky_m08finalize17h6bb6c7745b35ef1bE>
