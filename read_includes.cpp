#include "read_includes.h"
#include "load_file.h"

//return a vector of the included .h files
std::vector<std::string> read_includes(const std::string & filename)
{
	//lh is the lhs of what we're looking for
	const std::string lh = "#include \"";
	size_t i,j;
	std::vector<std::string> includes;

	for(auto & l : load_file(filename))
	{
		i = l.find(lh);
		if(i == 0)
		{
			i += lh.length();
			j = l.find("\"", i);
			includes.push_back(l.substr(i, j-i));
		}
	}
	return includes;
}
