#include <iostream>
#include "read_includes.h"
/*
 *	Rhys Trueman || 18/7/2020
 *
 *	reads the includes from files given as command arguements, sends them through standard out
 */

int main(int argc, char * argv[])
{
	for(int i = 1; i < argc; i++)
	{
		for(auto & l : read_includes(argv[i]))
		{
			std::cout << l << std::endl;
		}
	}
	return 0;
}
