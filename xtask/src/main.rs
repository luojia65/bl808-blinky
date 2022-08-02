#[macro_use]
extern crate clap;
use clap::Parser;
use command_ext::{BinUtil, Cargo, CommandExt};
use std::{
    fs,
    path::{Path, PathBuf},
};

lazy_static::lazy_static! {
    static ref PROJECT_DIR: &'static Path = Path::new(std::env!("CARGO_MANIFEST_DIR")).parent().unwrap();
    static ref TARGET: PathBuf = PROJECT_DIR.join("target");
}

#[derive(Parser)]
#[clap(name = "bl808-blinky")]
#[clap(version, about, long_about = None)]
struct Cli {
    #[clap(subcommand)]
    command: Commands,
}

#[derive(Subcommand)]
enum Commands {
    Make(BuildArgs),
    Asm(AsmArgs),
}

fn main() {
    use Commands::*;
    match Cli::parse().command {
        Make(args) => args.make(),
        Asm(args) => args.dump(),
    }
}

#[derive(Args, Default)]
struct BuildArgs {
    /// Target arch.
    #[clap(long)]
    target: Option<String>,
    /// Build in debug mode.
    #[clap(long)]
    debug: bool,
}

impl BuildArgs {
    /// Returns the build target name.
    fn target(&self) -> &str {
        self.target
            .as_ref()
            .map_or("riscv64imac-unknown-none-elf", |s| s.as_str())
    }

    fn arch(&self) -> &str {
        if self
            .target
            .as_ref()
            .map_or(false, |t| t.contains("riscv32"))
        {
            "riscv32"
        } else {
            "riscv64"
        }
    }

    /// Returns the dir of target files.
    fn dir(&self) -> PathBuf {
        PROJECT_DIR
            .join("target")
            .join(self.target())
            .join(if self.debug { "debug" } else { "release" })
    }

    fn make(&self) {
        self.make_package("bl808-blinky-m0");
    }

    fn make_package(&self, package: &str) {
        // 生成
        Cargo::build()
            .package(package)
            .conditional(!self.debug, |sbi| {
                sbi.release();
            })
            .target(self.target())
            .invoke();
        // 裁剪
        let target = self.dir().join(package);
        BinUtil::objcopy()
            .arg(format!("--binary-architecture={}", self.arch()))
            .arg(&target)
            .arg("--strip-all")
            .arg("-O")
            .arg("binary")
            .arg(target.with_extension("bin"))
            .invoke();
    }
}

#[derive(Args)]
struct AsmArgs {
    #[clap(flatten)]
    build: BuildArgs,
    /// Output file.
    #[clap(short, long)]
    output: Option<String>,
}

impl AsmArgs {
    fn dump(self) {
        self.build.make();
        let bin = self.build.dir().join("bl808-blinky-m0");
        let out = PROJECT_DIR.join(self.output.unwrap_or(format!(
            "{}.asm",
            bin.file_stem().unwrap().to_string_lossy()
        )));
        println!("Asm file dumps to '{}'.", out.display());
        fs::write(out, BinUtil::objdump().arg(bin).arg("-d").output().stdout).unwrap();
    }
}
