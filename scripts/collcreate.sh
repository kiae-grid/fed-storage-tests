#/bin/sh!

LISTUI=~/eosui
FILEPREF="alice_c"
KPATH=~/eos/fedcloud/zar/alice0/
for i in `cat $LISTUI`; do 
	~/scripts/list_b_random  ~/eos/fedcloud/zar/alice_c 3  | sed s/,/" "/g > ${FILEPREF}_$i; 
	s=0;
	for r in `cat ${FILEPREF}_$i`; do 
		l=`du $KPATH/$r| awk '{print $1}'`; 
		s=`expr $l + $s` ;
	done
	echo $s > ${FILEPREF}_S_$i

done
