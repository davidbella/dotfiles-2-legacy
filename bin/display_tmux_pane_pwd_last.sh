#!/bin/bash

tmux showenv -g TMUX_PWD_$(tmux display -p "#D" | tr -d %) | sed 's/^.*=//' | sed 's/\/home\/'"$USER"'/~/' | rev | cut -d"/" -f1 | rev