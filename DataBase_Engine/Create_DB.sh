#!/bin/bash 

function Create_DB
{
	exist_flag=true
	while test $exist_flag == "true"
	do
		echo Enter DataBase name
		read
		#check if database exists
		for element in `ls ../Data`
			do
				if test $REPLY == $element
				then
				echo "DataBase already exists"
				exist_flag=true
				break
				else
				exist_flag=false
				fi
			done
	done

	#create Database directory and Schema
	mkdir ../Data/$REPLY
	touch ../Data/$REPLY/Schema

	#test DataBase creation then echo successful msg
	while test $exist_flag == "false"
		do
		for element in `ls ../Data`
			do
			if test $REPLY == $element
				then
				echo "DataBase Successfully Created ^_^"
				exist_flag="true"
			fi
		done
	done
} 

Create_DB
