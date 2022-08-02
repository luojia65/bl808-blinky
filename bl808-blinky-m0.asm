
D:\RustSBI\bl808-blinky\target\riscv64imac-unknown-none-elf\release\bl808-blinky-m0:	file format elf64-littleriscv

Disassembly of section .text:

0000000050100000 <stext>:
50100000: 17 81 f3 11  	auipc	sp, 73528
50100004: 13 01 01 00  	mv	sp, sp
50100008: 93 02 00 40  	li	t0, 1024
5010000c: 16 91        	add	sp, sp, t0
5010000e: 97 00 00 00  	auipc	ra, 0
50100012: e7 80 20 01  	jalr	18(ra)
50100016: 97 00 00 00  	auipc	ra, 0
5010001a: e7 80 c0 00  	jalr	12(ra)
5010001e: 00 00        	unimp	

0000000050100020 <_ZN15bl808_blinky_m04main17h0d684832d2af0508E>:
50100020: 82 80        	ret

0000000050100022 <_ZN15bl808_blinky_m08finalize17h6bb6c7745b35ef1bE>:
50100022: 0f 00 00 01  	fence	w, unknown
50100026: f5 bf        	j	0x50100022 <_ZN15bl808_blinky_m08finalize17h6bb6c7745b35ef1bE>
