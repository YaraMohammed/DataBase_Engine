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
	row+=$value"::"
}

touch temp
row=""
#insert a row in the table
#get from table schema from schema file and echo to temp
x=`cat ../Data/$1/Schema|grep -w $2`
echo $x > temp
typeset -i counter=`wc -w temp|cut -f1 -d" "`
counter=$counter-1 
typeset -i y=2

#take each column data from user
while test $counter -gt 0
	do 
	column=`cut -f$y -d" " temp|cut -f1 -d:`
	type=`cut -f$y -d" " temp|cut -f2 -d:`
	counter=$counter-1
	y=$y+1
	echo Enter $column value
	read value
	./type_check.sh $type $value

	#check for script exit status to validate type
	if [ $? -eq 0 ]
	then
	row+=$value"::" 
	else
	check $type
	fi
done

echo $row > ../Data/$1/$2
rm temp
