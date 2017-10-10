gnuplot << _plotend
set term pslatex color
set output "v$$.plot"
set title ""
set lmargin 21
set format x "{&small \$%g\$}"
set format y "{&small \$%g&qquad\$}"

set style line 1 lt 1 lw 4 lc 1
set style line 2 lt 1 lw 4 lc 2
set style line 11 lt 1 lw 1 lc 1
set style line 12 lt 1 lw 1 lc 2
set style line 15 lt 2 lw 4 lc 1
set style line 25 lt 2 lw 4 lc 2
set style line 9 lt 1 lw 4 lc 9
set style line 6 lt 2 lw 4 lc 6

fitnlomin = 0.01
fitnlomax = 2.00
ynlomin = 1.215e0
ynlomax = 1.223e0

nloresult = 1.2224094e0

rvaluennlo = 0.10
fitnnlomin = 0.01
fitnnlomax = 0.50
ynnlomin = 1.310e0
ynnlomax = 1.332e0

# extrapolation result
nnloresult = 1.32e0
nnloerror = 0.008

set multiplot

set size 1.,1.
set lmargin 21

set xlabel "\$r=&mathrm\{cut\}_{q_&mathrm{T}/q\}[&%]$" 0,0
set label "\$\{&mathrm{pp&to &mu^-&mu^+H+X}\}\$ \@ 14 TeV" at graph 0.5, graph 1.06 center
set label "\$\&sigma\{[&mathrm{fb/GeV}]\}\$" rotate by 90 at graph -0.17, graph .5 center 
#set label "\$\&sigma\{[&mathrm{fb/GeV}]\}\$" rotate by 90 at graph -0.17, graph .5 center 

set xrange [0.:1000.];
#set xrange [0.:2.];
#set yrange [ynlomin/nloresult-1:ynlomax/nloresult-1];
set yrange [1.e-5:0.02];
set logscale y
set key graph 0.20, graph 0.8 Left width -64 spacing 1.5
set xtics 
#set xtics mirror ("&small 0" 0, "" 0.1 1, "&small 0.2" 0.2, "" 0.3 1, "&small 0.4" 0.4, "" 0.5 1, "&small 0.6" 0.6, "" 0.7 1, "&small 0.8" 0.8, "" 0.9 1, "&small 1.0" 1.0, "" 1.1 1, "&small 1.2" 1.2, "" 1.3 1, "&small 1.4" 1.4, "" 1.5 1, "&small 1.6" 1.6, "" 1.7 1, "&small 1.8" 1.8, "" 1.9 1, "&small 2.0" 2.0) 
#set xtics mirror ("" 0, "" 0.1 1, "" 0.2, "" 0.3 1, "" 0.4, "" 0.5 1, "" 0.6, "" 0.7 1, "" 0.8, "" 0.9 1, "" 1.0, "" 1.1 1, "" 1.2, "" 1.3 1, "" 1.4, "" 1.5 1, "" 1.6, "" 1.7 1, "" 1.8, "" 1.9 1, "" 2.0) 
set ytics
#set ytics ("\$&small -3\$" -0.03, "\$&small -2.5\$" -0.025, "\$&small -2\$" -0.02, "\$&small -1.5\$" -0.015, "\$&small -1\$" -0.01, "\$&small -0.5\$" -0.005, "\$&small 0\$" 0., "\$&small +0.5\$" 0.005, "\$&small +1\$" 0.01, "\$&small +1.5\$" 0.015, "\$&small +2\$" 0.02, "\$&small +2.5\$" 0.025, "\$&small +3\$" 0.03)

#nlofit(t) = nloa + nlob * t + t*t * (nlol0 + nlol1 * log(t) + nlol2 * log(t)*log(t))
#fit [fitnlomin:fitnlomax] nlofit(x) "../result.NLO.QT.LO/CV/equal/plot.qTcut.NLO.QCD.dat" using (\$1):(\$4/nloresult):(\$5/nloresult) via nloa, nlob, nlol0, nlol1, nlol2

#set arrow 1 ls 9 from rvaluennlo, ynnlomin to rvaluennlo, ynnlomax nohead 
#set arrow 2 ls 6 from fitnlomin, ynlomin to fitnlomin, ynlomax nohead
#set arrow 3 ls 6 from fitnlomax, ynlomin to fitnlomax, ynlomax nohead 

plot 'dat.mzh' us (\$1):(\$2) t '&rlap{\$&sigma_{&mathrm{&scriptstyle LO}}\$}' w steps ls 1,\
     'dat.mzh' us (\$1):(\$4) t '&rlap{\$&sigma_{&mathrm{&scriptstyle NLO}}^{&mathrm{CS}}\$}' w steps ls 2
#     'dat.mzh' us (\$1):(\$2):(\$3) t '' w errorbars ls 11,\
#     'dat.mzh' us (\$1):(\$4):(\$5) t '' w errorbars ls 12
#     '../result.NLO.CS.LO/CV/equal/plot.qTcut.NLO.QCD.dat' us (\$1):(\$4/nloresult-\$5/nloresult-1) t '' smooth unique ls 15,\
#     '../result.NLO.CS.LO/CV/equal/plot.qTcut.NLO.QCD.dat' us (\$1):(\$4/nloresult-1) t '&rlap{\$&sigma_{&mathrm{&scriptstyle NLO}}^{&mathrm{CS}}\$}' smooth unique ls 1,\
#     '../result.NLO.CS.LO/CV/equal/plot.qTcut.NLO.QCD.dat' us (\$1):(\$4/nloresult+\$5/nloresult-1) t '' smooth unique ls 15,\
#     '../result.NLO.QT.LO/CV/equal/plot.qTcut.NLO.QCD.dat' us (\$1):(\$4/nloresult-1):(\$5/nloresult) w errorbars t '&rlap{\$&sigma_{&mathrm{&scriptstyle NLO}}^{q_{&mathrm{T}}}(r)\$}' pt 1 ps 1 lt 1 lc 3 #,\
#     nlofit(x) t '&rlap{\$&sigma_{&mathrm{&scriptstyle NLO}}^{q_{&mathrm{T}}}(0)+b_{&mathrm{&scriptstyle NLO}}&,r+r^2&sum_{i=0}^{2}c_{&mathrm{&scriptstyle NLO}}^i&log^i r\$}' ls 1
    
_plotend

cat << _texstuff > v$$.tex
\\documentclass[11pt]{article}
\\usepackage{color}
\\newcommand{\\Black}{\\textcolor{black}}
\\newcommand{\\Red}{\\textcolor{red}}
\\newcommand{\\Green}{\\textcolor{green}}
\\newcommand{\\Blue}{\\textcolor{blue}}
\\newcommand{\\Cyan}{\\textcolor{cyan}}
\\newcommand{\\Magenta}{\\textcolor{magenta}}
\\newcommand{\\Yellow}{\\textcolor{yellow}}
\\newcommand{\\Pe}{\\mathrm{e}}
\\newcommand{\\GeV}{\\unskip\,\\mathrm{GeV}}
\\oddsidemargin=0pt
\\evensidemargin=0pt
\\parindent=0pt
\\pagestyle{empty}
\\def\\dfrac#1#2{{\\displaystyle{#1\\over #2}}} 
\\def\\d{\\mathrm{d}}
\\begin{document}
_texstuff
sed \
  -e 's/&/\\/g' \
  -e "s/\\[4 dl 3 dl 1 dl 3 dl\\] 1 1 0/\\[5 dl 2 dl 1 dl 2 dl 1 dl 2 dl\\] 0 1 1/g" \
  -e "s/e+0/e+/g" -e "s/e-0/e-/g" \
  -e "s/\endinput//g" \
  -e "s/1.0e+/10^{/g" -e "s/1.0e-/10^{-/g" \
  -e "s/e+/\\\times 10^{/g" -e "s/e-/\\\times 10^{-/g" \
  -e "s/10^{[-0-9]*/&}/g" v$$.plot >> v$$.tex

cat << _texstuff2 >> v$$.tex
\\end{document}
_texstuff2

epsfile="`basename $0 .gpl`.eps"
latex v$$.tex
dvips -E -o $epsfile v$$.dvi
rm -f v$$.plot v$$.tex v$$.aux v$$.log v$$.dvi
#gv -magstep 2 $epsfile
#gv $epsfile
