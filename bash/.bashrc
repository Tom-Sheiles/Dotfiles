#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# disable terminal suspension
stty -ixon


PATH=$PATH:~/bin	# Append directories to path


# Shell prompt
unicodechars=($'\xf0\x9f\x98\x81' $'\xe2\x98\xa3' $'\xf0\x9f\x90\xb1' $'\xe2\x98\xa2')

select_random(){
	RANDOM=$$$(date +%s)
	echo ${unicodechars[$RANDOM%${#unicodechars[@]}]}
}

PS1=$"\$(select_random) \e[35m\u\e[0m@\e[96m\h\e[0m \$(select_random) \w\$ "


source .bash_aliases				# Set Aliases
export DIFFPROG="nvim -d" 			# Set diff program
setxkbmap -option caps:swapescape 	# swap escape and caps

bind "set completion-ignore-case on" # Ignore case in file complete

