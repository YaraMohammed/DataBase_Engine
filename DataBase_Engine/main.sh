#!/bin/bash
select x in "Create new DataBase" "Open DataBase" "Display Existing DataBase" "Delete DataBase" "Exit"
do
case $REPLY in
1) echo Create new DataBase
./Create_DB.sh
;;
2) echo Open DataBase
echo Enter DataBase name
read
;;
3) echo Display DataBase
;;
4) echo Delete Database
;;
5) echo Exit
break
;;
esac
done
