#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Unlimited History
HISTSIZE=-1
HISTFILESIZE=-1
# Ignore and erase duplicates
HISTCONTROL=ignoredups


# Aliases
alias vim='nvim'
alias ls='ls -l --color=auto'
alias la='ls -la --color=auto'

alias dco='docker-compose '

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

GIT_PROMPT_START="\[\033[1;034m\]\n \[\033[1;035m\]\u\[\033[1;034m\]@\[\033[1;036m\]\h \[\033[1;034m\]in \[\033[1;039m\]\w\[\033[0m\]"
GIT_PROMPT_END="\n \[\033[1;${foreground}m\]\[\033[${background}m\]\[\033[0m\]\[\033[0m\]  \[\033[32m\]\@\[\033[0m\]  "


source ~/git-completion.bash
source ~/.bash-git-prompt/gitprompt.sh

source /usr/share/chruby/chruby.sh
chruby ruby-2.4.2
source /usr/share/chruby/auto.sh

[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"
