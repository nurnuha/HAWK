void
ReadToTree()
{
  TTree* t = new TTree("T", "X-sections");
  TFile fout("pth.root","RECREATE");
  t->ReadFile("dat.pth",
	      "kine/D:"
	      "aBorn:eBorn:");
	      // "aComplete:eComplete:"
      	      //"aEW:eEW:"
	      //"aQCD:eQCD:"
	      //"aGamma:eGamma:"
	      //"aGluon:eGluon");
  //  t->Fill("aBorn:kine", "", "*");
  //  t->Write();
    t->Print();
    t->Draw("aBorn:kine", "", "*");
	      // t->Draw("aComplete:kine", "", "* same");
	      //  t->Draw("aEW:kine", "", "* same");
	      // t->Draw("aQCD:kine", "", "* same");
	      // t->Draw("aGamma:kine", "", "* same");
	      // t->Draw("aGluon:kine", "", "* same");
}

