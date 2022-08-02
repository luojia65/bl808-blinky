fn main() {
    println!("cargo:rerun-if-changed=build.rs");
    println!("cargo:rustc-link-arg=-Tm0/link.ld");
}
