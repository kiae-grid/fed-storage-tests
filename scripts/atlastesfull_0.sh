#/bin/bash!

filelist=$1
for i in {1..5}; do (time -p root -b -q run.C\(\"$filelist\"\)) > ~/atlas_out.$i; done > ${filelist}.out  2>&1 

