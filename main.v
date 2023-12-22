import os

fn prompt(prompt_str string) {
	command := os.input(prompt_str).split(' ')

	match command[0] {
		'upper' { upper(command) }
		'echo' { echo(command) }
		'help' { help() }
		else { println("${command[0]}: command not found.") }
	}
}

fn main() {
	prompt_str := "$ "
	for {
		prompt(prompt_str)
	}
}