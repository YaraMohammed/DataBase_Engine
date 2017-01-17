#!/bin/bash 
shopt -s extglob
if test $# -eq 0
then
echo "Error: mkTable should take DB name"
else

DB_name=$1
db_path=../Data/$DB_name
#ask user for table name
echo "Enter table name and colomns number seperated by space: "
read Tname Colnum
#check for colomns number it should be number
colnflag=true
while [ $colnflag == true ]
do
  case $Colnum in
  +([0-9]))
	colnflag=false
  ;;
  *)
	echo "Error: There is no colomn number Plese Re-enter table name and number: "
 	read Tname Colnum
  ;;
  esac
done
files_num=`ls $db_path|wc -l`

flag=true
while [ $flag == true ] 
do
	for name in `ls $db_path`
	do
  	if [ $name == $Tname ]
  	then	
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
	#entering PK at first
	if [ $colnum -eq 1 ]
	then
		echo Enter Primarykey colomn Name and type seperated by space:
	else
		echo Enter colomn $colnum Name and type seperated by space: 
	fi
	read ColName ColType
	typer=true
	#check what column type is
	while [ $typer == true ]
	do
	case $ColType in 
	"int")
		typer=false
	;;
	"str")
		typer=false
	;;
	"mix")
	   typer=false
	;;
	*)
        if [ $colnum -eq 1 ]
        then
	          echo "Error: Invalid colomn type please Re-enter colomn PrimaryKey Name and type seperated by space (type should be str or int or mix)"
        else
	          echo "Error: Invalid colomn type please Re-enter colomn $colnum Name and type seperated by space (type should be str or int or mix)"

        fi

          read ColName ColType
	;;
	esac
	done
	#save table schema at string
	Tschema="$Tschema $ColName:$ColType"
	((colnum=colnum + 1))
	
done
#write table @ schema file
echo $Tschema>> $db_path/Schema
#create  table file
touch $db_path/$Tname

echo "Table created ^_^"
fi


