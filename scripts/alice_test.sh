#/bin/sh!
FILEOUT=~/alice_out.`date +%s`
INFILE=`mktemp`;
SOURCEFILE=alice_c_`hostname -f`
SIZEFILE=alice_c_S_`hostname -f`
cd ~/scripts
#echo 1
#source aliceinit.sh
source ALEIN.env
#export X509_CERT_DIR=/etc/grid-security/certificates/

wget http://alice22.spbu.ru/distr/zar/$SOURCEFILE -O /tmp/$SOURCEFILE
wget http://alice22.spbu.ru/distr/zar/$SIZEFILE -O /tmp/$SIZEFILE

#echo 2

RPATH=root://muon.grid.kiae.ru//eos/fedcloud/zar/alice

for i in {0..2}; do
	for file in `cat /tmp/$SOURCEFILE`; do 
		echo ${RPATH}$i/$file; 
	done > $INFILE 
	cat /tmp/$SIZEFILE > ${FILEOUT}.$i
	./alicetest.sh $INFILE `hostname -f` >> ${FILEOUT}.$i
done

echo $FILEOUT

#echo 4
