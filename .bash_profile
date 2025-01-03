#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc



if [ -z "$SSH_AUTH_SOCK" ]; then
	eval `ssh-agent -s` > out.log 2> /dev/null
	ssh-add ~/.ssh/id_gh > out.log 2> /dev/null
fi
