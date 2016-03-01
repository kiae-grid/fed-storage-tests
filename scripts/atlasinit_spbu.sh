# Run me as '. start.sh'


## Site tunables
CVMFS="/cvmfs/atlas.cern.ch"
SQUIDS="alice25.spbu.ru:3128 alice22.spbu.ru.ru:3128"


## Experiment tunables
RELEASE="19.1.1.10"
BUILD="x86_64-slc6-gcc48-opt"
FRONTIERS="(serverurl=http://ccfrontier.in2p3.fr:23128/ccin2p3-AtlasFrontier)(serverurl=http://ccsqfatlasli02.in2p3.fr:23128/ccin2p3-AtlasFrontier)(serverurl=http://ccsqfatlasli01.in2p3.fr:23128/ccin2p3-AtlasFrontier)(serverurl=http://lcgft-atlas.gridpp.rl.ac.uk:3128/frontierATLAS)(serverurl=http://lcgvo-frontier03.gridpp.rl.ac.uk:3128/frontierATLAS)(serverurl=http://lcgvo-frontier02.gridpp.rl.ac.uk:3128/frontierATLAS)(serverurl=http://lcgvo-frontier01.gridpp.rl.ac.uk:3128/frontierATLAS)"


## Main stuff

rel_3digit=$(echo "$RELEASE" | tail -1 | egrep -o '^[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+')

source "$CVMFS"/repo/sw/software/"$BUILD"/"${rel_3digit}"/cmtsite/asetup.sh "$RELEASE",64,here --cmtconfig "$BUILD"

FRONTIER_SERVER="$FRONTIERS"
for squid in $SQUIDS; do
	FRONTIER_SERVER="${FRONTIER_SERVER}(proxyurl=http://${squid}/)"
done
export FRONTIER_SERVER

export ATLAS_POOLCOND_PATH="$CVMFS"/repo/conditions
