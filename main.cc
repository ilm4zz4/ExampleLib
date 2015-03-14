#include "somma.h"
#include "mult.h"
#include <iostream>

int main(int argc, char* argv[]){

	int a=3;
	int b=7;
	
	std::cerr << a << " + " << b << " = " << somma(a,b) << std::endl;
	std::cerr << a << " * " << b << " = " << mult(a,b) << std::endl;
	
	return 0;
}
