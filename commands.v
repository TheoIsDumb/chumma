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

fn ls() {
	files := os.ls(os.getwd()) or {
		println(err)
		return
	}

	println(files)
}