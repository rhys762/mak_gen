#include "load_file.h"
#include<fstream>


//load a file from path and store it in a vector by line
std::vector<std::string> load_file(const std::string & path)
{
	std::vector<std::string> lines;
	std::string line;
	std::fstream file (path, std::fstream::in);

	while(getline(file, line))
	{
		lines.push_back(line);
	}

	return lines;
}
