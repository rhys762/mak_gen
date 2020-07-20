#!/bin/bash
# makefile generator

# first scoop up all the source files
SRC_FILES=$(ls *.cpp)
BIN=/home/rhys/src/mak_gen

EXEC_NAME="prog"
C_FLAGS="-Wall"
L_FLAGS=""

# for a given source file, find its dependencies, that is included header files without matching source files
# arg is the source file
find_deps(){
	INCLUDES=$($BIN/ri $1)
	for I in $INCLUDES
	do
		# s is the source name for the include
		S=$(echo $I | $BIN/change_extension "h" "cpp")
		# if the source file doesnt exist then:
		if [ ! -f $S ]; then
			# send the header to output
			echo -n $I" "
		fi
	done		
}

# for a given source file, write its rule to standard out:
# param should be the source file name
write_rule(){
	# this writes the first part of the rule, the .o file name
	echo $1 | $BIN/change_extension "cpp" "o"
	# write the semi colon
	echo -n ": "
	# list the dependencies: the source file and any headers without .cpp files (templates etc)
	find_deps $1
	echo $1
	# write the compile command:
	echo -e "\tg++ -c "$1
}

# write the entire makefile to stdout
write_makefile(){

	for FILE in $SRC_FILES
	do
		write_rule $FILE
	done
}

if [ -f makefile ]; then

else

fi


