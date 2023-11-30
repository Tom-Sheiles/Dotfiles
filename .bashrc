# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# disable terminal suspension
stty -ixon

# check window size after each command
shopt -s checkwinsize 

PATH=$PATH:~/bin	# Append directories to path

HISTCONTROL=ignoredups:ignorespace
shopt -s histappend


# Shell prompt
unicodechars=($'\xf0\x9f\x98\x81' $'\xe2\x98\xa3' $'\xf0\x9f\x90\xb1' $'\xe2\x98\xa2')

select_random(){
	RANDOM=$$$(date +%s)
	echo ${unicodechars[$RANDOM%${#unicodechars[@]}]}
}

#PS1=$"\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$" deb default
#PS1=$"\$(select_random) \[\e[01;35m\]\u\[\e[0m@\]\[\e[01;96m\]\h\[\e[0m\] \$(select_random) \w\$\] "
PS1=$"\[\e[01;35m\]\u\[\e[0m@\]\[\e[01;96m\]\h\[\e[0m\] \w\$\] "

export DIFFPROG="nvim -d" 			# Set diff program
export EDITOR="nvim"				# Set Editor
source .bash_aliases				# Set Aliases
setxkbmap -option caps:swapescape 	# swap escape and caps

bind "set completion-ignore-case on" # Ignore case in file complete
bind 'set show-all-if-ambiguous on'
bind "TAB:menu-complete"

