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

phoenix_template() {
  mix phx.new $1 --live --no-ecto --no-gettext --no-dashboard --no-mailer --install
}

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

export PROMPT_COMMAND='$($HOME/bin/prompt-command.sh)'

# PS1
# GIT_PROMPT_START="\n \u@\h in \w"
# GIT_PROMPT_END="\n   \@  "
GIT_PROMPT_START="\[\033[1;034m\]\n \[\033[1;035m\]\u\[\033[1;034m\]@\[\033[1;036m\]\h \[\033[1;034m\]in \[\033[1;039m\]\w\[\033[0m\]"
GIT_PROMPT_END="\n \[\033[1;${foreground}m\]\[\033[${background}m\]\[\033[0m\]\[\033[0m\] \[\033[32m\]\@ >>>>>\[\033[0m\] "

source $HOME/bin/git-completion.bash
source $HOME/bin/.bash-git-prompt/gitprompt.sh

### chruby
# Debian default install location
test -s /usr/local/share/chruby/chruby.sh && source /usr/local/share/chruby/chruby.sh && chruby ruby-2.7.2

# Arch default install
test -s /usr/share/chruby/chruby.sh && source /usr/share/chruby/chruby.sh && chruby ruby-2.7.1

### kiex
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

### nvm
test -s /usr/share/nvm/init-nvm.sh && source /usr/share/nvm/init-nvm.sh

### elixir
# Enable history in iex
export ERL_AFLAGS="-kernel shell_history enabled"

export EDITOR=nvim

### Drip
# Add a new path for drip scripts
if [ -d "$HOME/.drv" ]
then
  source "$HOME/.drv/drv.env"
  export PATH=$HOME/.drv/bin:$PATH
  source $HOME/Documents/Drip/foundation-tools/share/bash_profile
fi

# Add a new path to put scripts/executables/bins/etc.
export PATH=$HOME/bin:$PATH

# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  # exec tmux
# fi

FNDIR=$HOME/lib/sh
if [ -d $FNDIR ]
then
  for f in $FNDIR/*.sh
  do
     test -x $f && source $f
  done
fi
