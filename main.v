import os
import time
import term

__global (
	config			Config
	sw					time.StopWatch
)

struct Config {
	mut:
		prompt_str string
		exec_time	bool
}

fn print_info() {
	print(term.bright_blue("
                      MMM MMMMMMMMM cccccccc;.ccccccccc                  
                      oMM OMMNNNWMM xMMKKKKKWMNMMXKKKKNMK.                
                      oMM OMW   oMM xMN     'NMMM.    .0MN.               
                      oMM OMW   oMM xMN      .NMM.      OMW               
             ddddddd, oMM OMW   oMM xMN      ;MMM.     .NMM               
             MMWO0MMl oMM OMW   oMM xMN     ,WMMM.    .koMM               
             MM0 .MMl oMM       oMM xMN    ,WMNMM.    . .MM               
             MM0 .MMl oMM       oMM xMN   'WMloMM.      .MM               
             MM0 .MMl oMM       oMM xMN  'WMl oMM.      .MM
             MM0 .MMl oMM       oMM xMN .NMc  oMM.      .MM               
             MM0 .MMl oMM       oMM xMN.NMc   oMM.      .MM               
                 ;MMl oMM    .:OWMK xMWXW:    oMM.      .MM               
               ,OMMk  oMM  ;kWMMK,  xMMW,     oMM.      .MM               
  .,,,,,,,,,,:0MMNo,,,kMM kMMxOWMWO xMMo,,,,,,kMMc,,,,,,cMM MMM          
  xMMMMMMMMMMMMMMMMMMMMMM OMW   kMM xMMMMMMMMMMMMMMMMMWWWWW XMN           
                          OMW   dMM.                                      
                          OMW   dMM.                                      
                          OMW   dMM.                                      
                          OMW...kMM.                                      
                          OMMMMMMMM.                                      
	"))
	println('\na "shell" made in V.')
	help()
}

fn prompt() {
	command := os.input("\n${term.bright_blue(config.prompt_str)} ").split(' ')

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
		else { println(term.bright_red("${command[0]}: command not found.")) }
	}

	if config.exec_time == true && command[0] != "clear" {
		println(term.bg_magenta("  ") +
			term.magenta("") + " " +
			term.bright_blue(sw.elapsed().str()))
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
		} else if line[0] == "exec_time" {
			config.exec_time = if line[1] == "true" { true } else { false }
		}
	}
}

fn main() {
	print_info()
	initialize()

	for {
		prompt()
	}
}
