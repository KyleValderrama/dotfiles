#
# ~/.bash_profile
#
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -z "$SSH_AUTH_SOCK" ]; then
	eval `ssh-agent -s`
	ssh-add ~/.ssh/id_gh
fi
