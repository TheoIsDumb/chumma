import os

fn upper(cmd []string) {
	println(cmd[1..].join(' ').to_upper())
}

fn echo(cmd []string) {
	println(cmd[1..].join(' '))
}

fn prompt(prompt_str string) {
	command := os.input(prompt_str).split(' ')

	if command[0] == "upper" {
		upper(command)
	} else if command[0] == "echo" {
		echo(command)
	}
}

fn main() {
	prompt_str := "$ "
	for {
		prompt(prompt_str)
	}
}