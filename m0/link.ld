OUTPUT_ARCH(RISCV)
ENTRY(_start)
MEMORY {
    xip_memory  (rx)  : ORIGIN = 0x90000000, LENGTH = 32M
    itcm_memory (rx)  : ORIGIN = 0x62028000, LENGTH = 48K
    dtcm_memory (rx)  : ORIGIN = 0x62034000, LENGTH = 16K
    ram_memory  (!rx) : ORIGIN = 0x62038000, LENGTH = 32K
    xram_memory (!rx) : ORIGIN = 0x40000000, LENGTH = 16K
}
PROVIDE(stext = 0x90000000);

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
