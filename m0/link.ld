OUTPUT_ARCH(RISCV)
ENTRY(_start)
MEMORY {
    xip_memory  (rx)  : ORIGIN = 0x58000000, LENGTH = 32M
    itcm_memory (rx)  : ORIGIN = 0x62028000, LENGTH = 28K
    dtcm_memory (rx)  : ORIGIN = 0x6202F000, LENGTH = 4K
    nocache_ram_memory (!rx) : ORIGIN = 0x22030000, LENGTH = 0K
    ram_memory  (!rx) : ORIGIN = 0x62030000, LENGTH = 160K
    xram_memory  (!rx) : ORIGIN = 0x40000000, LENGTH = 16K
}
PROVIDE(stext = 0x58000000);

SECTIONS {
    .text stext : {
        stext = .;
        *(.text.entry)
        *(.text .text.*)
        . = ALIGN(4);
        etext = .;
    } > xip_memory

    .rodata : ALIGN(4) {
        srodata = .;
        *(.rodata .rodata.*)
        *(.srodata .srodata.*)
        . = ALIGN(4);
        erodata = .;
    } > ram_memory

    .data : ALIGN(4) {
        PROVIDE( __global_pointer$ = . + 0x800 );
        sidata = LOADADDR(.data);
        sdata = .;
        *(.data .data.*)
        *(.sdata .sdata.*)
        . = ALIGN(4);
        edata = .;
    } > ram_memory

    .bss (NOLOAD) : ALIGN(4) {
        *(.bss.uninit)
        sbss = .;
        *(.bss .bss.*)
        *(.sbss .sbss.*)
        . = ALIGN(4);
        ebss = .;
    } > ram_memory
}
