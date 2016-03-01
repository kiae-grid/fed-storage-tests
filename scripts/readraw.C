#include <Riostream.h>
#include <AliRawReader.h>
#include <AliRawVEvent.h>
#include <AliRawVEquipment.h>
#include <AliRawData.h>


using std::cout;
using std::endl;

void readraw(const char * filename = "15000225050023.110.root") {

  AliRawReader * reader = AliRawReader::Create(filename);

  Int_t iEvent = 0;
  Int_t maxEvSize = 0;

  while(reader->NextEvent()) {

    AliRawVEvent * event = const_cast<AliRawVEvent*>(reader->GetEvent());
    if (event) {

      Int_t evSize = 0;
      for (Int_t ldcCounter=0; ldcCounter < event->GetNSubEvents(); ldcCounter++) {
	AliRawVEvent *subEvent = event->GetSubEvent(ldcCounter);
	if (!subEvent) continue;
	
	for (Int_t eqCounter=0; eqCounter < subEvent->GetNEquipments(); eqCounter++) {
	  AliRawVEquipment *eq = subEvent->GetEquipment(eqCounter);
	  if (!eq) continue;
	  
	  AliRawData * rawData = eq->GetRawData();
	  if (rawData) evSize += rawData->GetSize();
	}
      }
    
      if (maxEvSize<evSize) {
	maxEvSize = evSize;
	cout << "Event " << iEvent << endl;
	cout << "New max event size: " << maxEvSize << endl;
      }
    }

    iEvent++;
  }
  cout << iEvent << " events in the file" << endl;
  delete reader;
}
