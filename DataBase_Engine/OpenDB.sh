#!/bin/bash
#Open Data Base for manipulating 
select x in "Create Table" "Insert In a Table" "Display Table" "Update Table" "Delete Row" "Delete Tabel" "Go to Main"
do
case $REPLY in
1) echo Create Table
./mktable.sh $1
;;
2) echo Insert In a Table
echo Enter Table name
read
exist_flag="false"
                for element in `ls ../Data/$1`
                        do
                        if test $REPLY == $element
                                then
                             	./Insert.sh $1 $REPLY
                                exist_flag="true"
                                break
                        fi
                        done
if test $exist_flag == "false"
then
echo "Table Doesn't Exist"
fi
#./Insert.sh $1 $REPLY
;;
3) echo Display Table
echo Enter Table name
read
exist_flag="false"
                for element in `ls ../Data/$1`
                        do
                        if test $REPLY == $element
                                then
                             	awk -F"|" '{print $0}' ../Data/$1/$REPLY
                                exist_flag="true"
                                break
                        fi
                        done
if test $exist_flag == "false"
then
echo "Table Doesn't Exist"
fi
;;
4) echo Update Table
;;
5) echo Delete Row 
;;
6) echo Delete Table
echo Enter Table name to Delete
read
./Delete.sh "table" $1 $REPLY
;;
7) echo Main
break
esac
done

