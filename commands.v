fn upper(cmd []string) {
	println(cmd[1..].join(' ').to_upper())
}

fn echo(cmd []string) {
	println(cmd[1..].join(' '))
}

fn help() {
	println("available commands are upper, echo, help")
}