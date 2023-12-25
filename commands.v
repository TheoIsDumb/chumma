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

fn cd(cmd []string) {
	if cmd.len == 1 {
		// os.chdir(os.getenv("HOME"))
		os.chdir(os.home_dir()) or {
			println(err)
		}
	} else {
		os.chdir(cmd[1]) or {
			println(err)
		}
	}
}

fn clear() {
	if os.user_os() == "windows" {
		os.system('cls')
	} else {
		os.system('clear')
	}
}

fn ps1(cmd []string) {
	prompt_str = cmd[1]
}