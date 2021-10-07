#!/bin/bash

function md() {
  if [ -z "$TMUX" ]; then
    tmux new-session -As __home -c $HOME
  else
    sessions=($(tmux list-sessions | cut -d":" -f1))
    if [ $# -eq 0 ]; then
      if [[ "${sessions[*]}" =~ "__home" ]]; then
        tmux switch -t __home
        return
      fi
      if [[ ! "${sessions[*]}" =~ "__home" ]]; then
        tmux new-session -ds "__home" -c $HOME
        tmux switch -t __home
      fi
    fi
    if [[ "${sessions[*]}" =~ "${1}" ]]; then
      tmux switch -t $1
    fi
    if [[ ! "${sessions[*]}" =~ "${1}" ]]; then
      tmux new-session -ds $1 -c $HOME/Documents/MyDocuments/$1
      tmux switch -t $1
    fi
  fi
}

function md_completions() {
  options=($(ls $HOME/Documents/MyDocuments))
  COMPREPLY=($(compgen -W "${options[*]}" "${COMP_WORDS[${COMP_CWORD}]}"))
}

complete -F md_completions md
