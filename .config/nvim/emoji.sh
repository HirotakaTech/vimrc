#!/bin/bash

cat ~/emoji | fzf | awk '{print $1}' | wl-copy
