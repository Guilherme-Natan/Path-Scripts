#!/bin/bash

if [[ $1 == "-e" ]]; then
    mlp="$HOME/.local/share/man"
    md_file="$mlp/markdown/$2.md"

    if [[ ! -f "$md_file" ]]; then
        cat "$mlp/template.md" | sed "s|%name|$2|g" > "$md_file"
    fi

    nvim "$md_file"
    kramdown --output man "$md_file" > "$mlp/mangnfb/$2.gnfb"
    exit 0
fi

man gnfb $1
