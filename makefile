mg: main.o load_file.o read_includes.o
	g++ main.o load_file.o read_includes.o -o mg

main.o: main.cpp
	g++ -c main.cpp

load_file.o: load_file.cpp
	g++ -c load_file.cpp

read_includes.o: read_includes.cpp
	g++ -c read_includes.cpp

clean:
	rm *.o mg
