# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/inside GIT repository (\1)/'
}

PROMPT_COMMAND=__prompt_command

__prompt_command() {
	local EXIT="$?"
	
	local DARK_GRAY="\[\e[30;1m\]"
	local LIGHT_CYAN="\[\e[36;1m\]"
	local RED="\[\e[31;1m\]"
	local LIGHT_GREEN="\[\e[32;1m\]"
	local PURPLE="\[\e[35;1m\]"
	local LIGHT_RED="\[\e[31;1m\]"
	local YELLOW="\[\e[33;1m\]"
	local LIGHT_GRAY="\[\e[37;1m\]"
	local NO_COLOR="\[\e[0m\]"

	PS1="\n${DARK_GRAY}(${LIGHT_CYAN}\u${YELLOW}@${PURPLE}\h${DARK_GRAY})-(${LIGHT_GRAY}\w${DARK_GRAY})-("

	if [ $EXIT != 0 ]; then
		PS1+="${RED}e#${EXIT}"

	else
		PS1+="${LIGHT_GREEN}OK"
	fi
	PS1+="${DARK_GRAY})-->${NO_COLOR} "
	PS1="${DARK_GRAY}$(parse_git_branch)"$PS1
	


}

alias ls='ls --color=auto'
S1='[\u@\h \W]\$ '

alias thunderbolt_authorize="sudo /root/scripts/authorize-thunderbolt-device.sh"
alias poweroff="sudo poweroff"
alias reboot="sudo reboot"
alias xbps-query="sudo xbps-query"
alias brightnessctl="sudo brightnessctl"
alias startx="$HOME/.config/startx_menu.sh"

export ELECTRON_TRASH=gio
