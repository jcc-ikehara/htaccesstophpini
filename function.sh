#!/bin/sh

genpass() {
        len=12
        [ $# -eq 1 ] && [ $1 -gt 1 ] && len=$1
        cat /dev/urandom|tr -dc 'a-zA-Z0-9'|fold -w $len|head -n 1
}
