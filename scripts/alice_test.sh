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

wget http://alice22.spbu.ru/distr/zar/alicelists/$SOURCEFILE -O /tmp/$SOURCEFILE
wget http://alice22.spbu.ru/distr/zar/alicelists/$SIZEFILE -O /tmp/$SIZEFILE

#echo 2

RPATH=root://muon.grid.kiae.ru//eos/fedcloud/zar/alice
cat $INFILE
echo $PATH

for i in {0..2}; do
	cat /tmp/$SOURCEFILE
	for file in `/bin/cat /tmp/$SOURCEFILE`; do 
		echo ${RPATH}$i/$file; 
	done > $INFILE; 
	/bin/cat /tmp/$SIZEFILE > ${FILEOUT}.$i
	./alicetest.sh $INFILE `/bin/hostname -f` >> ${FILEOUT}.$i
	xrdcp ${FILEOUT}.$i root://muon.grid.kiae.ru//eos/fedcloud/zar/alice_c.$i.`hostname -f`.`date +%s`
done

echo $FILEOUT

#echo 4
