import os

fn prompt(prompt_str string) {
	command := os.input(prompt_str).split(' ')

	match command[0] {
		'upper' { upper(command) }
		'echo' { echo(command) }
		'help' { help() }
		'ls' { ls() }
		'cd' { cd(command) }
		'pwd' { println(os.getwd()) }
		'clear' { clear() }
		'exit', '<EOF>' { println("\nPax."); exit(0) }
		else { println("${command[0]}: command not found.") }
	}
}

fn main() {
	prompt_str := "$ "
	for {
		prompt(prompt_str)
	}
}