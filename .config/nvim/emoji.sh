#!/bin/sh

fzf < ~/.config/nvim/emoji | awk '{print $1}' | wl-copy
