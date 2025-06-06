use std::net::TcpListener;

use zero2prod::startup::run;

#[tokio::main]
async fn main() -> Result<(), std::io::Error> {
    let ip = "127.0.0.1";
    let listener = TcpListener::bind(format!("{}:0", ip)).expect("Failed to bind random port");
    let port = listener.local_addr().unwrap().port();
    println!("Running server on http://{}:{}", ip, port);
    run(listener)?.await
}
