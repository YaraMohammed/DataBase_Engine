#!/bin/bash 

function Create_DB
{
exist_flag=true
while test $exist_flag == "true"
do
echo Enter DataBase name
read
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
mkdir ../Data/$REPLY
touch ../Data/$REPLY/Scehma
} 

Create_DB
