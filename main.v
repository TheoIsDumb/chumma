import os
import time

__global (
	prompt_str string
)

fn prompt() {
	command := os.input("${prompt_str} ").split(' ')

	sw := time.new_stopwatch()

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

	println(sw.elapsed())
}

fn initialize() {
	filename := "${os.getenv("HOME")}/.config/chumma.ini"

	if os.exists(filename) == false {
		os.write_file(filename, "prompt_str=$") or {
			panic(err)
		}
	}

	content := os.read_file(filename) or {
		panic(err)
	}

	lines := content.trim("\n").split("\n")
	for f in lines {
		line := f.split("=")

		if line[0] == "prompt_str" {
			prompt_str = line[1]
		}
	}
}

fn main() {
	initialize()

	for {
		prompt()
	}
}
