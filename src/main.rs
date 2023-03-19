use std::env;
use std::process;
use gnostr_grep::Config;
fn main() {

    let args: Vec<String> = env::args().collect();

    let dirname = &args[0];
    let config = Config::build(&args).unwrap_or_else(|err| {
        println!("Problem parsing arguments: {err}");
        process::exit(1);
    });

    println!("Searching in {}", dirname);
    println!("Searching for {}", config.query);
    println!("In file {}", config.file_path);

    if let Err(e) = gnostr_grep::run(config) {
        println!("Application error: {e}");
        process::exit(1);
    }

}
