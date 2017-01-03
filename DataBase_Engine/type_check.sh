#!/bin/bash

case $1 in
int)
if [[ $2 == +([[:digit:]]) ]]
then
exit 0
else 
exit 1
fi
;;

str)
if [[ $2 == +([[:upper:]]|[[:lower:]]) ]] 
then
exit 0
else
exit 1
fi
;;
mix)
if [[ $2 == +([[:upper:]]|[[:lower:]]|[[:digit:]]) ]] 
then
exit 0
else
exit 1
fi
;;

esac
