import os

fn upper(cmd []string) {
	// println(cmd[1..].map(it.to_upper()).join(' '))
	println(cmd[1..].join(' ').to_upper())
}

fn prompt(prompt_str string) {
	command := os.input(prompt_str).split(' ')

	if command[0] == "upper" {
		upper(command)
	} else {
		println(command)
	}
}

fn main() {
	prompt_str := "$ "
	for {
		prompt(prompt_str)
	}
}