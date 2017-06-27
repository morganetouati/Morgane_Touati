#!/bin/bash

choix () { 
rand=$[ 1 + $[ RANDOM % 4  ]]
case $rand in
	1)		ans='rock' ;;
	2) 		ans='paper' ;;
	3)		ans='scissors' ;;
	4)		ans='tornado' ;;
esac
}