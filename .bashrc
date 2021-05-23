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

# BIG TECH
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export _JAVA_AWT_WM_NONREPARENTING=1

# Aliases
alias sudo='sudo '

alias vim='nvim'
alias ls='ls -lh --color=auto'
alias la='ls -lha --color=auto'
alias lsd='ls -lth --color=auto'
alias lsdr='ls -lthr --color=auto'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias todo='grep "\[ \]" $HOME/Documents/MyDocuments/**/TODO.yml -RI | grep -v Manual | cut -d"/" -f6-8 | sed -e "s?\/.*\[? [?" | sed -e "s?\"\$??" '
alias onetodo='todo | shuf | head -1'

alias recent_files='find . -name code -prune -o -type f -mtime -2 -print'

### Can I do this kind of stuff more generally? Or extract this?
# Docker
# pgme() {
  # docker run --rm --name postgres -p 5432:5432 -d postgres
# }

alias pgme='docker run --rm --name postgres -p 5432:5432 -d -e POSTGRES_PASSWORD=postgres postgres'

# rewrite this to take an arg
alias dockerpsql='docker run --rm --name $(echo $(pwd | rev | cut -d"/" -f 1 | rev)) -p 5432:5432 -d postgres'

redisme() {
  docker run --rm --name redis -p 6379:6379 -d redis
}

# install yarn dependencies without installing yarn
alias dockeryarn='docker run --rm -it -v $(pwd):/app -w /app node yarn'
###

export PROMPT_COMMAND='$(~/prompt-command.sh)'

# GIT_PROMPT_START="\n \u@\h in \w"
# GIT_PROMPT_END="\n   \@  "
GIT_PROMPT_START="\[\033[1;034m\]\n \[\033[1;035m\]\u\[\033[1;034m\]@\[\033[1;036m\]\h \[\033[1;034m\]in \[\033[1;039m\]\w\[\033[0m\]"
GIT_PROMPT_END="\n \[\033[1;${foreground}m\]\[\033[${background}m\]\[\033[0m\]\[\033[0m\]  \[\033[32m\]\@\[\033[0m\]  "

source ~/git-completion.bash
source ~/.bash-git-prompt/gitprompt.sh
test -s /usr/share/chruby/chruby.sh && source /usr/share/chruby/chruby.sh
chruby ruby-2.7.1

test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

test -s /usr/share/nvm/init-nvm.sh && source /usr/share/nvm/init-nvm.sh

export ERL_AFLAGS="-kernel shell_history enabled"
export EDITOR=nvim

# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  # exec tmux
# fi
