#!/bin/sh

genpass() {
	[ -n $1 ] && len=$1 || len=16
	cat /dev/urandom|tr -dc 'a-zA-Z0-9'|fold -w $len|head -n 1
}
