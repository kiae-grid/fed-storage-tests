#!/bin/bash
filelist=$1
name=$2
(time -p for i in `cat $filelist`;do 
	root -b -q  start.C\(\"$i\"\);
done) 2>&1 |(while read line; do
	tt=`echo $line | awk '{print $1}'`
	val=`echo $line |awk '{print $2}'`
	case $tt in
                "real")
                export real="$val";
                ;;
                "user")
                user="$val";
                ;;
                "sys")
                sys="$val";
                ;;
                *)
		
	esac
	if [ "$val" == "events" ]; then 
		echo $line;
	fi
		
done;
#echo AA
#echo D $sys + $user;
tot=`echo "$sys + $user"| bc`;

echo "0,0,$name,$real,$user,$sys,$tot")



