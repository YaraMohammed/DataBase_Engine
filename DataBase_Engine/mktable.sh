#!/bin/bash 
if test $# -eq 0
then
echo "Error: mkTable should take DB name"
else

DB_name=$1
db_path=../Data/$DB_name
#ask user for table name
echo "Enter table name and colomns number seperated by space: "
read Tname Colnum
while [ -z $Colnum ]
do
  echo "Error: There is no colomn number Plese Re-enter table name and number: "
  read Tname Colnum
done
files_num=`ls $db_path|wc -l`

flag=true
while [ $flag == true ] 
do
	for name in `ls $db_path`
	do
  	if [ $name == $Tname ]
  	then	
		echo "Error: $Tname table name exist"
		flag=true
		echo "Error: $Tname table name exist Plese Re-enter table name and colomn number: " 
                read Tname Colnum
		break
  	else 
    		flag=false
  	fi
	done
	
done
colnum=1
Tschema=$Tname
while [ $colnum -le $Colnum ]
do
	#ask user for colomn name
	echo Enter colomn $colnum Name and type seperated by space: 
	read ColName ColType
	while [ -z $ColType ]
	do
	  echo "Error: There is no colomn type please Re-enter"
	  read ColName ColType
	done
	Tschema="$Tschema $ColName:$ColType"
	((colnum=colnum + 1))
done

echo $Tschema>> $db_path/Schema
touch $db_path/$Tname
fi


