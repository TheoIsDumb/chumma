import os

fn prompt() {
	command := os.input("$ ").split(' ')
	println(command)
}

fn main() {
	for {
		prompt()
	}
}