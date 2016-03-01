#!/bin/bash
fileres=~/file.`date +%s`.atlas.out
hostname >> $fileres

filelist="/home/zar/list_atlas_f_pnpi  /home/zar/list_atlas_f_spbu  /home/zar/list_atlas_x_pnpi  /home/zar/list_atlas_x_spbu /home/zar/list_atlas_x_all /home/zar/list_atlas_f_all"
#filelist="/home/zar/list_atlas_f_pnpi"

cd ~/scripts/atlas_test2/

#source ~/eos/spbcloud/test/scripts/atlasinit_spbu.sh

for i in {1..4}; do
	echo "*******************  $i *************************";
	for file in $filelist; do
		ls -la $file
		echo root -b -q run.C\(\"$file\"\);
		(time -p root -b -q run.C\(\"$file\"\)) 2>&1
	done
done| tee   $fileres

echo $fileres








