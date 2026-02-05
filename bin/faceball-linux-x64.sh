#!/bin/sh
printf '\033c\033]0;%s\a' MidiMaze
base_path="$(dirname "$(realpath "$0")")"
"$base_path/faceball-linux-x64.x86_64" "$@"
