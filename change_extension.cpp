/*
 *	Rhys Trueman ||20/07/2020
 *
 *	Change an extension, which could be done entirely with awk
 *	echo "main.h" | change_extension h cpp
 *	will output main.cpp 
 */

#include <string>
#include <iostream>

int main(int argc, char * argv[])
{
	//enforce two args
	if(argc != 3)
	{
		return 1;
	}
	
	std::string original_ext = argv[1];
	std::string new_ext = argv[2];

	size_t i;

	std::string filename;
	if(std::cin >> filename)
	{
		i = filename.find("." + original_ext);
		if(i != std::string::npos)
		{
			std::cout << filename.substr(0,i+1) + new_ext;
		}

	}

	while(std::cin >> filename)
	{
		i = filename.find("." + original_ext);
		if(i != std::string::npos)
		{
			std::cout <<  ' ' + filename.substr(0,i+1) + new_ext;
		}
	}


	return 0;
}
