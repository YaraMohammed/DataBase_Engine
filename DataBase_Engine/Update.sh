#!/bin/bash 
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
                raw=`sed -i $raw_num'd' ../Data/$1/$2`
		flag=false
        else
                echo "There is no raw with that PK: " $pk
		flag=true
		
        fi
done
echo Enter new raw values
./Insert.sh $1 $2

echo "Raw updated ^_^"


