ARCH          = linuxdeb

CXX           =
ObjSuf        = o
SrcSuf        = cpp
ExeSuf        =
DllSuf        = so
OutPutOpt     = -o 

### NOTE, FOR THE NEXT 3 LINES TO WORK YOU HAVE TO 
### HAVE $(ROOTSYS)/bin in your path
ROOTCFLAGS   := $(shell root-config --cflags)
ROOTLIBS     := $(shell root-config --libs)
ROOTGLIBS    := $(shell root-config --glibs)


CXX           = g++
CXXFLAGS      = -O -Wall -fPIC
LD            = g++
LDFLAGS       = -O
SOFLAGS       = -shared

CXXFLAGS     += $(ROOTCFLAGS)
LIBS          = $(ROOTLIBS) $(SYSLIBS)
GLIBS         = $(ROOTGLIBS) $(SYSLIBS)

########################################################
# here is where you define the files that will be used 
# and the output file that will be created.
OBJS          = spectrum.o
PROGRAMS      = SpecTcl2Root
#######################################################


.SUFFIXES: .$(SrcSuf) .$(ObjSuf) .$(DllSuf)


$(PROGRAMS):     $(OBJS)
		$(LD) $(LDFLAGS) $^ $(LIBS) $(OutPutOpt)$@
		@echo "$@ done"

clean:
		@rm -f $(OBJS) core
		@rm -f $(PROGRAMS)



.$(SrcSuf).$(ObjSuf):
	$(CXX) $(CXXFLAGS) -c $<