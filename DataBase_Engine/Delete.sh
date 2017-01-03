#!/bin/bash 

case $1 in
db)
exist_flag="false"
		for element in `ls ../Data`
			do
			if test $2 == $element
				then
				rm -rf ../Data/$2
				exist_flag="true"
				break
			fi
			done
	if test $exist_flag = "true"
	then
	echo DataBase Deleted 
	else
	echo "Error DataBase Doesn't exist"
	fi
;;
table)
exist_flag="false"
                for element in `ls ../Data/$2`
                        do
                        if test $3 == $element
                                then
                                rm ../Data/$2/$3
                                exist_flag="true"
                                break
                        fi
                        done
        if test $exist_flag = "true"
        then
        echo table Deleted 
        else
        echo "Error table Doesn't exist"
        fi
;;
raw)

;;
esac
