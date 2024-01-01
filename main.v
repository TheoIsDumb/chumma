import os
import time

__global (
	prompt_str	string
	exec_time		bool
	sw					time.StopWatch
)

fn prompt() {
	command := os.input("${prompt_str} ").split(' ')

	if exec_time == true {
		sw = time.new_stopwatch()
	}

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

	if exec_time == true {
		println(sw.elapsed())
	}
}

fn initialize() {
	filename := "${os.getenv("HOME")}/.config/chumma.ini"
	config := "prompt_str=$\nexec_time=true"

	if os.exists(filename) == false {
		os.write_file(filename, config) or {
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
		} else if line[0] == "exec_time" {
			exec_time = if line[1] == "true" { true } else { false }
		}
	}
}

fn main() {
	initialize()

	for {
		prompt()
	}
}
