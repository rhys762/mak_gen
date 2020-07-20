ri: ri_main.o load_file.o read_includes.o
	g++ main.o load_file.o read_includes.o -o ri

ri_main.o: ri_main.cpp
	g++ -c ri_main.cpp

load_file.o: load_file.cpp
	g++ -c load_file.cpp

read_includes.o: read_includes.cpp
	g++ -c read_includes.cpp

clean:
	rm *.o ri
