#!/bin/bash -x
#$1:DB $2:t
function getraw {
        #$1: Dbname, $2: Tablename, $3: what we search (table name,raw pk), $4: delemiter
        typeset -i counter=1
        typeset keys=`cut -d "$4" -f1 ../Data/$1/$2`
        for key in $keys
        do
                if [ $3 == $key ]
                then
                        rawnum=$counter
                        break
                fi
                ((counter=counter+1))
        done
        return $rawnum

}
flag=true
while [ $flag == true ]
do
echo Enter PK
read pk
getraw $1 $2 $pk "|"
        raw_num=$rawnum
        if [ $raw_num ]
        then
                raw=`sed -n $raw_num'p' ../Data/$1/$2`
		flag=false
        else
                echo "There is no raw with that PK: " $pk
		flag=true
		
        fi
done
touch temp
row=""
#get table schema from schema file and echo to temp
x=`cat ../Data/$1/Schema|grep -w $2`
echo $x > temp
typeset -i counter=`wc -w temp|cut -f1 -d" "`
counter=$counter-1
typeset -i y=2

typeset -i count=0
#take each column data from user
while test $counter -gt 0
        do
        column[$count]=`cut -f$y -d" " temp|cut -f1 -d:`
        type[$count]=`cut -f$y -d" " temp|cut -f2 -d:`
        counter=$counter-1
       	y=$y+1
	count=$count+1
	done

echo ${column[*]}
echo Enter edit column name
read col
exist=false

while [ $exist == false ]
do
typeset -i excount=0
for x in ${column[*]}
do
excount=$excount+1
if [ $col == $x ]
then
	
	exist=true
	break 2
fi
done
echo Error Enter edit column name
read col
done
echo $excount
echo $raw
rawarr=$(echo $raw | tr "|" " ")
echo ${rawarr[*]}
#echo ${rawarr}
for y in ${rawarr[@]}
do

		echo "$y"
done
	
