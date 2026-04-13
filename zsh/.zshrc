# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"
plugins=(
    branch
    dotenv
    fzf
    git
    uv
    virtualenv
    zsh-autosuggestions
    zsh-syntax-highlighting
)
VIRTUAL_ENV_DISABLE_PROMPT=0
source $ZSH/oh-my-zsh.sh

# env
export EDITOR="code --wait"

# aliases
alias ls="ls -h --color"
alias lll="ls -al"
