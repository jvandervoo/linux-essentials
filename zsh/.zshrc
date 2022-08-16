PATH="$HOME/.composer/vendor/bin:$PATH"
PATH="./node_modules/.bin:$PATH"
PATH="$HOME/go/bin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="$HOME/bin:$PATH"
# PATH="$HOME/.krew/bin:$PATH"
NVIM_INIT="$HOME/.config/nvim/init.lua"

#Remove user@computer
USER=``

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'
export VISUAL='nvim'

ZSH_THEME="agnoster"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Generic aliases
source "$HOME/.config/zsh/.zsh_aliases"

# Generic functions
source "$HOME/.config/zsh/.zsh_functions"

# Work stuff
source "$HOME/.config/zsh/.zsh_work"
