import os
import time

__global (
	config			Config
	sw					time.StopWatch
)

struct Config {
	mut:
		prompt_str string
		exec_time	bool
}

fn prompt() {
	command := os.input("${config.prompt_str} ").split(' ')

	if config.exec_time == true {
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

	if config.exec_time == true {
		println(sw.elapsed())
	}
}

fn initialize() {
	filename := "${os.getenv("HOME")}/.config/chumma.ini"
	config_text := "prompt_str=$\nexec_time=true"

	if os.exists(filename) == false {
		os.write_file(filename, config_text) or {
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
			config.prompt_str = line[1]
			println("prompt str: ${config.prompt_str}")
		} else if line[0] == "exec_time" {
			config.exec_time = if line[1] == "true" { true } else { false }
		}
	}
}

fn main() {
	initialize()

	for {
		prompt()
	}
}
