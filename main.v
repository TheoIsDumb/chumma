import os

__global (
	prompt_str string
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
	content := os.read_file('options.ini') or {
		panic("error")
	}

	lines := content.trim("\n").split("\n")
	for f in lines {
		line := f.split("=")

		if line[0] == "prompt_str" {
			prompt_str = line[1]
		}
	}

	for {
		prompt()
	}
}
