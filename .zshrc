# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
EDITOR=vim
editor=vim

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gentoo"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# mkdir, cd into it
mkcd () {
    mkdir -p "$*"
    cd "$*"
}

cdl () {
    cd "$*"
    ls -la
}

alias -s html=vim
alias -s php=vim
alias -s css=vim
alias -s js=vim
alias -s py=vim
alias -s sql=vim
alias -s cpp=vim
alias -s y=vim
alias -s c=vim
alias -s h=vim
alias -s txt=vim

bindkey -v
bindkey '^R' history-incremental-search-backward

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/games:/home/dionyziz/.rvm/bin
