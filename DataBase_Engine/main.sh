#!/bin/bash

typeset -i counter=1
function main
{
#Display menu
select x in "Create new DataBase" "Open DataBase" "Delete DataBase" "Exit"
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
3) echo WARNING: you are about to delete the entire DataBase ARE you sure [y/n]
read
if [[ $REPLY == "y" ]]
then 
echo Enter Database name to Delete
read
./Delete.sh "db" $REPLY
fi
;;
4) echo Exit
break $counter
;;
esac
done
}

main
