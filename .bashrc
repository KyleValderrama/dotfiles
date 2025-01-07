#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"
source /usr/share/nvm/init-nvm.sh

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
PS1='\W \$ '
