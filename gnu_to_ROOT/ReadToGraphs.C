TGraphErrors*
MakeGraph(const char* name, const char* title, Color_t col)
{
  TGraphErrors* g = new TGraphErrors;
  g->SetName(name);
  g->SetTitle(title);
  g->SetLineColor(col);
  g->SetFillColor(col);
  g->SetMarkerColor(col);
  g->SetFillStyle(3001);
  g->SetMarkerStyle(20);
  g->SetLineStyle(1);
  g->SetLineWidth(1);
  return g;
}
    

void
ReadToGraphs()
{
  std::ifstream in("data.dat"); 
  TMultiGraph*  mg       = new TMultiGraph;
  
  mg->Add(MakeGraph("born",     "born",     kRed-3));
  mg->Add(MakeGraph("complete", "complete", kGreen-3));
  mg->Add(MakeGraph("ew",       "ew",       kBlue-3));
  mg->Add(MakeGraph("qcd",      "qcd",      kCyan-3));
  mg->Add(MakeGraph("gamma",    "gamma",    kMagenta-3));
  mg->Add(MakeGraph("gluon",    "gluon",    kYellow-3));

  TIter next(mg->GetListOfGraphs());
  TGraphErrors* ge = 0;
  
  Int_t cnt = 0;
  do {
    std::string l;
    std::getline(in, l);
    if (in.bad()) break;

    if (l[0] == '#') continue;

    std::stringstream parse(l);
    Double_t x;
    parse >> x;

    next.Reset();
    while ((ge = static_cast<TGraphErrors*>(next()))) {
      Double_t y, e;
      parse >> y >> e;
      ge->SetPoint(cnt, x, y);
      ge->SetPointError(cnt, 0, e);
    }
    cnt++;
  } while (!in.eof());

  TCanvas* c = new TCanvas("c", "C");
  mg->Draw("ap");

  c->BuildLegend(.2, .6, .5, .85);
  
}

