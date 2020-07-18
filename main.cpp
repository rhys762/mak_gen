#include <iostream>
#include "read_includes.h"
/*
 *	Rhys Trueman || 18/7/2020
 *
 *	makefile generator hoepfully
 */

int main(int argc, char * argv[])
{
	for(auto & l : read_includes("main.cpp"))
	{
		std::cout << l << std::endl;
	}

	return 0;
}
