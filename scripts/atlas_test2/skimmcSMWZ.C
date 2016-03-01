#define skimmcSMWZ_cxx
#include "skimmcSMWZ.h"
#include <TH2.h>
#include <TStyle.h>
#include <TCanvas.h>

void skimmcSMWZ::Loop()
{

if (fChain == 0) return;
 fChain->SetBranchStatus("*",1);

  TFile *D3PDfile   = new TFile("ZnunuggD3PD.root","recreate");
  TTree *CopyTree    = new TTree("physics","");

//// all need branches
CopyTree = fChain->CloneTree(0);

int number=0;

   Long64_t nentries = fChain->GetEntriesFast();

   Long64_t nbytes = 0, nb = 0;
   for (Long64_t jentry=0; jentry<nentries;jentry++) {
      Long64_t ientry = LoadTree(jentry);
      if (ientry < 0) break;
      nb = fChain->GetEntry(jentry);   nbytes += nb;

cout << "event = " << number << endl;
number++;

if(EF_2g20vh_medium==0) continue;
if (MET_RefFinal_et<50000) continue;

cout << "event selected" << endl;

/*
myphot.clear ();
myelec.clear ();

 for (int ph = 0; ph != ph_n; ph++)
  {
if (ph_pt->at(ph)>20000)
{
myphot.push_back(ph);
}}

 for (int el = 0; el != el_n; el++)
  {
if (el_pt->at(el)>20000)
{
myelec.push_back(el);
}}

if (myphot.size()+myelec.size()<2) continue;
*/
CopyTree->Fill();

   }


   printf("writing...\n");
   D3PDfile->cd();
   D3PDfile->Write();
   D3PDfile->Close();
   printf("done.\n");

}

