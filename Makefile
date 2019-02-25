# Download page: https://www.mathworks.com/products/compiler/matlab-runtime.html
MATLAB_RUNTIME=/usr/local/MATLAB/MATLAB_Runtime/v95
INCDIRS= -I$(MATLAB_RUNTIME)/extern/include
LIBDIRS= -L$(MATLAB_RUNTIME)/bin/glnxa64
LIBS= -lmx -lmat -Wl,-rpath,"$(MATLAB_RUNTIME)/bin/glnxa64"
# -lmex -lm
# -Wl,--version-script,$(MATLAB_RUNTIME)/extern/lib/glnxa64/c_exportsmexfileversion.map
MATCC=gcc $(INCDIRS) $(LIBDIRS) $(LIBS)

all: matcreat

clean:
	rm -rf matcreat matdgns

matcreat: matcreat.c
	gcc $(INCDIRS) matcreat.c $(LIBDIRS) $(LIBS) -o matcreat

matdgns: matdgns.c
	$(MATCC) matdgns.c -o matdgns

