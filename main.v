import os

fn upper(cmd []string) {
	println(cmd[1..].join(' ').to_upper())
}

fn echo(cmd []string) {
	println(cmd[1..].join(' '))
}

fn help() {
	println("available commands are upper, echo, help")
}

fn prompt(prompt_str string) {
	command := os.input(prompt_str).split(' ')

	if command[0] == "upper" {
		upper(command)
	} else if command[0] == "echo" {
		echo(command)
	} else if command[0] == "help" {
		help()
	} else {
		println("${command[0]}: command not found")
	}
}

fn main() {
	prompt_str := "$ "
	for {
		prompt(prompt_str)
	}
}