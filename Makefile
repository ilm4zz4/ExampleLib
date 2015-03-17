BIN=fun.bin
LIB=dynamic
OBJs=somma.o mult.o

shared:  libshared main.o 	
	 @g++ -L$(CURDIR)  -o $(BIN) main.o -l$(LIB) 
	 @echo "Linking is done..."

static:  libstatic main.o
	 g++ main.o -L . -o $(BIN)  -l$(LIB) 
	 @echo "Linking is done..."

multilib: $(OBJs) main.o
	 @ar rcs  libComplex.a somma.o 
	 @ar rcs  libMult.a mult.o 
	 @ar rcs libComplex.a libMult.a  
	 @g++ -L$(CURDIR)  -o $(BIN) main.o -lComplex

libshared: $(OBJs) 
	@g++  -shared -Wl,-soname, -o lib$(LIB).so $(OBJs) -lc
	@echo "Shared library is done..."

libstatic: $(OBJs)
	@ar rc  lib$(LIB).a $(OBJs) 
	@echo "static library is done..."

%.o:%.cc 
	 g++ -c -fPIC -MD -MF $(patsubst %.o,%.d,$@) -o $@  $<

clean:
	@rm -rf  lib* $(BIN) *o *d
	@echo "clean all..."
