#!/bin/bash
select x in "Create new DataBase" "Display Existing DataBase" "Delete DataBase" "Exit"
do
case $REPLY in
1) echo Create DataBase
;;
2) echo Display DataBase
;;
3) echo Delete Database
;;
4) echo Exit
break
;;
esac
done
