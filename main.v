import os

fn main() {
	for {
		command := os.input("$ ")
		println("${command.to_upper()}")
	}
}