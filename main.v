import os

__global (
	prompt_str = "$"
)

fn prompt() {
	command := os.input("${prompt_str} ").split(' ')

	match command[0] {
		'upper' { upper(command) }
		'echo' { echo(command) }
		'ps1' { ps1(command) }
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
	for {
		prompt()
	}
}