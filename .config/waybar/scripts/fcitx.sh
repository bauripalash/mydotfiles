#!/bin/bash
IM=$(fcitx5-remote -n)
case "$IM" in
    "keyboard-us")
        echo "en"
        ;;
    "openbangla")
        echo "bn"
        ;;
    *)
        echo "$IM"
        ;;
esac
