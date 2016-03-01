#!/bin/bash
fileres=~/file.`date +%s`.alice.out
hostname >> $fileres

flist="../list_spbu_5_fuse ../list_spbu_5_xrootd ../list_pnpi_5_fuse  ../list_pnpi_5_xrootd  ../list_10_xrootd"
#flist="../list_spbu_5_xrootd ../list_pnpi_5_fuse  ../list_pnpi_5_xrootd  ../list_10_xrootd"
#flist="../list_spbu_5_fuse"

time for i in {1..4}; do 
	echo "*******************  $i *************************";
	for l in $flist; do 
		echo "================ $l =====================";
		date;
		echo ./alicetest.sh $l ;
		ls -la $l;
		./alicetest.sh $l ; 
	done
done | tee   $fileres
echo $fileres

