#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"

session_name="main"

# 1. First you check if a tmux session exists with a given name.
tmux has-session -t=$session_name 2> /dev/null

# 2. Create the session if it doesn't exists.
if [[ $? -ne 0 ]]; then
  TMUX='' tmux new-session -d -s "$session_name"
fi

# 3. Attach if outside of tmux, switch if you're in tmux.
if [[ -z "$TMUX" ]]; then
  tmux attach -t "$session_name"
else
  tmux switch-client -t "$session_name"
fi


source /usr/share/nvm/init-nvm.sh

alias python='/usr/bin/python3.9'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
PS1='\W \$ '
