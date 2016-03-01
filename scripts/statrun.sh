#/bin/sh!
#START
#N=20
dirs="InnerDetector  InstallArea"
files="joboptions.py  run_job.sh start.sh "
SRCDIR='pnpi/test/test_suite'
OUTDIR='pnpi/test/zar/out'
JOBDIR=`mktemp -d --tmpdir=$PWD`

if [ ! -e $OUTDIR ]; then
	echo "crete output dir"
	mkdir $OUTDIR;
	if [ ! "$?" = "0" ]; then
		echo "problem with  $OUTDIR create";
		exit 2;
	fi
fi
if [ ! -d $OUTDIR ]; then 
	echo "$OUTDIR is nod directory! Chek:"
	rm -f $OUTDIR;
	mkdir $OUTDIR;
	if [ ! "$?" = "0" ]; then
                echo "problem with  $OUTDIR create";
                exit 2;
        fi
fi

rm -f $OUTDIR/*
	

N=20
mkdir $JOBDIR/result
mkdir $JOBDIR/data
WORKDIR=$JOBDIR/data;
cd $WORKDIR

source $SRCDIR/start.sh
for i in {1..1}; do
	for ff in  $dirs; do ln -s  /$SRCDIR/$ff $WORKDIR/$ff; done
	cp $SRCDIR/joboptions.py ./
	sed s\#OUT.ESD.pool.root\#root://$OS_MGM_URL//eos/$OUTDIR/$i.OUT.ESD.pool.root\# $SRCDIR/run_job.sh > run_job.sh
        sed s\#./RDO.05320071._000826.pool.root.1\#root://$OS_MGM_URL//eos/$SRCDIR/RDO.05320071._000826.pool.root.1\# -i run_job.sh

#	source run_job.sh
#	parsing
#	cp log.RAWtoESD $OUTDIR/$i.log.RAWtoESD
#	cp basic.root $OUTDIR/$i.basic.root
#	rm -f ./*

#	cat run_job.sh


done

echo "JOBDIR = $JOBDIR"
