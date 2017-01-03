#!/bin/bash

typeset -i counter=1
function main
{
#Display menu
select x in "Create new DataBase" "Open DataBase" "Display Existing DataBase" "Delete DataBase" "Exit"
do
case $REPLY in
1) echo Create new DataBase
./Create_DB.sh
;;
2) echo Open DataBase
echo Enter DataBase name
read
./OpenDB.sh $REPLY
#count number of time main function is called to pass to break at exit
counter+=1
main
;;
3) echo Display DataBase
;;
4) echo Delete Database
;;
5) echo Exit
break $counter
;;
esac
done
}

main
