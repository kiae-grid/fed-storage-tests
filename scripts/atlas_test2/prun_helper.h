#ifndef PRUN_HELPER_HH
#define PRUN_HELPER_HH

std::string getArgStr(TString inputfiletxt) {

  std::string argStr;
 

  char buf[256+1];
  unsigned int delpos;
  std::ifstream ifs(inputfiletxt);

  if(!ifs.good()) return std::string("");

  while (true)
    {
      ifs.read(buf,256);
      if (ifs.eof())
        {
          if (ifs.gcount() == 0) break;
          delpos = ifs.gcount()-1;
        }
      else
        {
          delpos = ifs.gcount();
        }
      buf[delpos] = 0x00;
      argStr += buf;
    }

  return argStr;

}

std::vector<std::string> getFileList(TString inputfiletxt) {

  std::string argStr = getArgStr(inputfiletxt);

  // split by ','
  std::vector<std::string> fileList;

  if(argStr.empty()) return fileList;

  for (size_t i=0,n; i <= argStr.length(); i=n+1)
    {
      n = argStr.find_first_of(',',i);
      if (n == string::npos)
        n = argStr.length();
      string tmp = argStr.substr(i,n-i);
      fileList.push_back(tmp);
    }

  return fileList;

}

void openFromFileList(TString inputfiletxt, TChain* chain) {

  //  std::cout << "openFromFileList\n";

  std::vector<std::string> fileList = getFileList(inputfiletxt);

  // open input files

  for (unsigned int iFile=0; iFile<fileList.size(); ++iFile)
    {
      std::cout << "open " << fileList[iFile].c_str() << std::endl;
      chain->Add(fileList[iFile].c_str());
    }

}

#endif
