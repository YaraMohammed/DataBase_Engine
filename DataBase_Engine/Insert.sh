#!/bin/bash 

#function to keep calling type_check string incase of wrong data type
function check
{
	echo Invalid data type please enter $1
	read
	./type_check.sh $1 $REPLY
	while [ $? -ne 0 ]
		do
		echo Invalid data type please renter $1
		read
		./type_check.sh $1 $REPLY
		done
	row+="|"$value
}

#check primary key
function check_pk
{
if [ -z "$value" ]; then
null="true"
echo "Primary Key Can't Be NULL"
else
for col in $arr
do
if test $value == $col
then
null="false"
pkExist="true"
break
else
null="false"
pkExist="false"
fi
done
fi
}

touch temp
row=""
#get table schema from schema file and echo to temp
x=`cat ../Data/$1/Schema|grep -w $2`
echo $x > temp
typeset -i counter=`wc -w temp|cut -f1 -d" "`
counter=$counter-1 
typeset -i y=2
pk=`cut -f2 -d" " temp|cut -f1 -d:`
pkExist="false"
arr=`cut -f1 -d"|" ../Data/$1/$2`

#take each column data from user
while test $counter -gt 0
	do 
	column=`cut -f$y -d" " temp|cut -f1 -d:`
	type=`cut -f$y -d" " temp|cut -f2 -d:`
	counter=$counter-1
	y=$y+1
	echo Enter $column value
	read value
	
	#check for pk
        if test $y -eq 3
        then
        check_pk
null="true"
        while [$pkExist == "true" ]
        do
        echo Primary Key Exist Enter Valid Primary Key
        read value
        check_pk
	#./type_check.sh $type $value
        done
	
	 ./type_check.sh $type $value
        #check for script exit status to validate type
        if [ $? -eq 0 ]
        then
	check_pk
	if test $pkExist == "false"
	then
        row+=$value
	else
	echo Invalid Primary Key Back to Open DB menu
	fi
        else
        check $type
        fi

	else
	 ./type_check.sh $type $value
	#check for script exit status to validate type
	if [ $? -eq 0 ]
	then
	row+="|"$value 
	else
	check $type
	fi
	fi
done

echo $row >> ../Data/$1/$2
rm temp
