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
#unicodechars=($'\xf0\x9f\x98\x81' $'\xe2\x98\xa3' $'\xf0\x9f\x90\xb1' $'\xe2\x98\xa2')
unicodechars=($'\xf0\x9f\x98\x81')

function select_random(){
	RANDOM=$$$(date +%s)
	echo ${unicodechars[$RANDOM%${#unicodechars[@]}]}
}

function git_branch(){
	GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

	# Change color if files have been modified
	if [[ $(git status -s 2> /dev/null | wc -l | bc ) -gt 0 ]]; then
		BRANCH_COLOR="01;33m"
	else
		BRANCH_COLOR="01;32m"
	fi

	if [[ $GIT_BRANCH = "" ]]; then
		echo ""
	else
		echo -e "(\e[$BRANCH_COLOR$GIT_BRANCH\e[0m) "
	fi
}

function jobs_running(){
	if [ $(jobs | wc -l) -gt 0 ]; then
		echo -e "\e[92m"
	else
		echo -e "\e[0m"
	fi
}

#PS1=$"\$(select_random) \[\e[01;35m\]\u\[\e[0m@\]\[\e[01;96m\]\h\[\e[0m\] \$(select_random) \w\$\] "
PS1=$"\$(select_random) \[\e[01;35m\]\u\[\e[0m@\]\[\e[01;96m\]\h\[\e[0m\] \$(select_random) \w \$(git_branch)\[\$(jobs_running)\]\$\[\e[0m\] "

export DIFFPROG="nvim -d" 			# Set diff program
export EDITOR="nvim"				# Set Editor
source ~/.bash_aliases				# Set Aliases

if [ $XDG_SESSION_TYPE == "X11" ]; then
	setxkbmap -option caps:swapescape 	# If not on Wayland swap escape and caps
elif [ $DESKTOP_SESSION == "gnome" ]; then
	gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']" # use gsettings when on gnome
fi

bind "set completion-ignore-case on" # Ignore case in file complete
bind 'set show-all-if-ambiguous on'
bind "TAB:menu-complete"
