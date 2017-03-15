#/bin/bash!

source ./atlas.init
filelist=$1
for i in {1..5}; do (time -p root -b -q run.C\(\"$filelist\"\)) > ~/atlas_out.$i; done | grep 'real\|user\|sys'


