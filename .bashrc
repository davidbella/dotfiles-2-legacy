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
alias ls='ls -lh --color=auto'
alias la='ls -lha --color=auto'

alias dco='docker-compose '
alias dcof='docker-compose -f $HOME/Documents/StellaService/connect-stack/docker-compose.yml'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

contains () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

tmux_session_name () {
  directory_name="$(pwd | rev | cut -d"/" -f1 | rev)"

  array=(`tmux list-sessions | cut -d":" -f1` $USER "openvpn")

  if [[ ${array[@]} =~ $directory_name ]]; then
    echo "$(tmux display-message -p '#S')"
  else
    case "$directory_name" in
      $(echo $USER))
        echo "__home"
        ;;
      openvpn)
        echo "_priv"
        ;;
      *)
        echo "$directory_name"
        ;;
    esac
  fi
}

export PROMPT_COMMAND=$PROMPT_COMMAND'$( [ -n $TMUX ] && tmux setenv -g TMUX_PWD_$(tmux display -p "#D" | tr -d %) $PWD)'
export PROMPT_COMMAND=$PROMPT_COMMAND'$( [ -n $TMUX ] && tmux rename-session $(tmux_session_name))'

GIT_PROMPT_START="\[\033[1;034m\]\n \[\033[1;035m\]\u\[\033[1;034m\]@\[\033[1;036m\]\h \[\033[1;034m\]in \[\033[1;039m\]\w\[\033[0m\]"
GIT_PROMPT_END="\n \[\033[1;${foreground}m\]\[\033[${background}m\]\[\033[0m\]\[\033[0m\]  \[\033[32m\]\@\[\033[0m\]  "


source ~/git-completion.bash
source ~/.bash-git-prompt/gitprompt.sh

source /usr/share/chruby/chruby.sh
chruby ruby-2.5.3
source /usr/share/chruby/auto.sh

[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

# bash snippet to install yarn dependencies without installing yarn
alias dockeryarn='docker run --rm -it -v $(pwd):/app -w /app node yarn'
