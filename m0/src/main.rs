#![feature(naked_functions, asm_sym, asm_const)]
#![no_std]
#![no_main]
use core::arch::asm;

const LEN_STACK_M0: usize = 1 * 1024;

#[naked]
#[link_section = ".text.entry"]
#[export_name = "_start"]
unsafe extern "C" fn entry() -> ! {
    #[link_section = ".bss.uninit"]
    static mut STACK: [u8; LEN_STACK_M0] = [0; LEN_STACK_M0];
    asm!(
        "   la      sp, {stack}
            li      t0, {hart_stack_size}
            add     sp, sp, t0",
        "   call    {main}",
        "   call    {finalize}",  
        stack = sym STACK,
        hart_stack_size = const LEN_STACK_M0,
        main = sym main,
        finalize = sym finalize,
        options(noreturn)
    )
}

extern "C" fn main() {
    
}

extern "C" fn finalize() {
    loop {
        core::hint::spin_loop(); // todo
    }
}

#[cfg_attr(test, allow(unused))]
#[cfg_attr(not(test), panic_handler)]
fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop {
        core::hint::spin_loop(); // todo
    }
}
