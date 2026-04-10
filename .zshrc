# Zsh setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"

plugins=(git virtualenv)
VIRTUAL_ENV_DISABLE_PROMPT=0

source $ZSH/oh-my-zsh.sh


# Tools env
export EDITOR="code --wait"


# Aliases
alias ls="ls -h --color"
alias lll="ls -al"
