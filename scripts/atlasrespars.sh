#!/bin/sh
inputfile=$1
ui=$2
#grep -v event $inputfile  |awk '{{if ($3=="-q") split($4,name,"_")};{if ($1=="real")print name[2]"_"name[3]"_"name[4]" "$2}}'|sed s/"\")"//g| sort
grep -v event $inputfile  |awk -v ui=$ui '{{if ($3=="-q") split($4,name,"_")};{if ($1=="real")print ui"_"name[3]"_"name[4]" "$2}}'|sed s/"\")"//g| sort | sed s/"\."/","/g

