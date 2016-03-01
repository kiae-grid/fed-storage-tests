void start(char *str)
{
gROOT->ProcessLine(Form(".include %s/include",gSystem->ExpandPathName("$ALICE_ROOT")));
gROOT->ProcessLine(".L readraw.C");
readraw(str);
}
