# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# disable terminal suspension
stty -ixon

HISTCONTROL=ignoredups:ignorespace 	# Don't add empty space or re-run commands to history
PATH=$PATH:~/bin 										# Append directories to path
shopt -s checkwinsize 							# Check if term width has changed
shopt -s histappend 								# Append to history file

export DIFFPROG="nvim -d" 	# Set diff program
export EDITOR="nvim" 				# Set Editor
source ~/.bash_aliases 			# Set Aliases

if [ $XDG_SESSION_TYPE != "wayland" ]; then
	setxkbmap -option caps:swapescape 	# If not on Wayland swap escape and caps
elif [ $DESKTOP_SESSION == "gnome" ]; then
	gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']" # use gsettings when on gnome
fi

bind "set completion-ignore-case on" 	# Ignore case in file complete
bind "set show-all-if-ambiguous on" 	# List all files if names match on tab
bind "TAB:menu-complete" 							# Cycle choices when pressing tab

# ---------------------

#unicodechars=($'\xf0\x9f\x98\x81' $'\xe2\x98\xa3' $'\xf0\x9f\x90\xb1' $'\xe2\x98\xa2')
unicodechars=($'\xf0\x9f\x98\x81')

# Select a random character from the 'unicodechars' array and echo it
function select_random(){
	RANDOM=$$$(date +%s)
	echo ${unicodechars[$RANDOM%${#unicodechars[@]}]}
}

# Echo the git branch pointed to by HEAD if one exists
# will be green if no files have been modified on this branch
# and yellow if they have.
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
		echo -e "(\001\e[$BRANCH_COLOR\002$GIT_BRANCH\001\e[0m\002) "
	fi
}

# Returns the color green if a background job is running
function jobs_running(){
	if [ $(jobs | wc -l) -gt 0 ]; then
		echo -e "\001\e[92m\002"
	else
		echo -e "\001\e[0m\002"
	fi
}

PS1="\$(select_random) \[\e[01;35m\]\u\[\e[0m\]@\[\e[01;96m\]\h\[\e[0m\] \$(select_random) \w \$(git_branch)\$(jobs_running)\$\[\e[0m\] "

