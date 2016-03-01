
void run(TString inputfiles)
{

gROOT->ProcessLine(".L skimmcSMWZ.C+");
skimmcSMWZ t(inputfiles);

t.Loop();
}


