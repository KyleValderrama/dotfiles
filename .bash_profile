#
# ~/.bash_profile
#
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

ssh-add &>/dev/null || eval `ssh-agent` &>/dev/null
[ $? -eq 0 ] && {                                     
	ssh-add ~/.ssh/id_gh &>/dev/null 
}
