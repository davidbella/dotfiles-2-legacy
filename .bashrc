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

alias be='bundle exec '

alias dco='docker-compose '
alias dcof='docker-compose -f $HOME/Documents/StellaService/connect-stack/docker-compose.yml'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# shows changed and untracked files in git
# useful for `vim $(gcf)`
alias gcf='git status -s | sed -e "s?^\s??" | cut -d" " -f2'

# Scripts
#
# runs docker-compose s.t. the user is mirrored for my host machine's user
# ensures that files created in docker are permissioned as $USER
dcome() {
  docker-compose "$1" -u $(id -u):$(id -g) "${@:2}"
}
dcofme() {
  dcof "$1" -u $(id -u):$(id -g) "${@:2}"
}

contains () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

tmux_session_name () {
  if pgrep tmux > /dev/null
  then
    directory_name="$(pwd | rev | cut -d"/" -f1 | rev)"

    case "$directory_name" in
      $(echo $USER))
        array=(`tmux list-sessions | cut -d":" -f1` "openvpn")

        if [[ ${array[@]} =~ $directory_name ]]; then
          echo "$(tmux display-message -p '#S')"
        else
          echo "__home"
        fi
        ;;
      openvpn)
        array=(`tmux list-sessions | cut -d":" -f1` $USER)

        if [[ ${array[@]} =~ $directory_name ]]; then
          echo "$(tmux display-message -p '#S')"
        else
          echo "_priv"
        fi
        ;;
      *)
        array=(`tmux list-sessions | cut -d":" -f1` $USER "openvpn")

        if [[ ${array[@]} =~ $directory_name ]]; then
          echo "$(tmux display-message -p '#S')"
        else
          echo "$directory_name"
        fi
        ;;
    esac
  fi
}

export PROMPT_COMMAND='$( [ -n $TMUX ] && tmux setenv -g TMUX_PWD_$(tmux display -p "#D" | tr -d %) $PWD)'
export PROMPT_COMMAND='$( [ -n $TMUX ] && tmux rename-session $(tmux_session_name) 2>/dev/null)'

GIT_PROMPT_START="\[\033[1;034m\]\n \[\033[1;035m\]\u\[\033[1;034m\]@\[\033[1;036m\]\h \[\033[1;034m\]in \[\033[1;039m\]\w\[\033[0m\]"
GIT_PROMPT_END="\n \[\033[1;${foreground}m\]\[\033[${background}m\]\[\033[0m\]\[\033[0m\]  \[\033[32m\]\@\[\033[0m\]  "

source ~/git-completion.bash
source ~/.bash-git-prompt/gitprompt.sh

source /usr/share/chruby/chruby.sh
chruby ruby-2.6.0
source /usr/share/chruby/auto.sh

[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

# bash snippet to install yarn dependencies without installing yarn
alias dockeryarn='docker run --rm -it -v $(pwd):/app -w /app node yarn'
