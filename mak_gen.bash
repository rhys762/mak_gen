#!/bin/bash
# makefile generator

# first scoop up all the source files
SRC_FILES=$(ls *.cpp)

EXEC_NAME="prog"
C_FLAGS="-Wall"
L_FLAGS=""

# extracts included header files from a given file
# arg is the file to read
# sends headers through STDOUT
find_included_headers(){
	awk -F "\"" '/#include "/ {print $2}' $1
}

#changes a file extension from one to another
#arg1 is the extension to replace
#arg2 is the extension to replace with
#input filenames through STDIN
#output new filenames through STDOUT
change_extension(){
	awk '{gsub("'$1'","'$2'",$0); printf "%s", $1}'	
}

# for a given source file, find its dependencies, that is included header files without matching source files
# arg is the source file
find_deps(){
	INCLUDES=$(find_included_headers $1)
	for I in $INCLUDES
	do
		# s is the source name for the include
		S=$(echo $I | change_extension ".hpp" ".cpp")
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
	echo -n $1 | change_extension "cpp" "o"
	# write the semi colon
	echo -n ": "
	# list the dependencies: the source file and any headers without .cpp files (templates etc)
	find_deps $1
	echo $1
	# write the compile command:
	echo -e "\tg++ -c "$1
	echo
}

# write the entire makefile to stdout
write_makefile(){
	#first write out the variables:
	echo EXEC_NAME=$EXEC_NAME
	echo C_FLAGS=$C_FLAGS
	echo L_FLAGS=$L_FLAGS

	for FILE in $SRC_FILES
	do
		write_rule $FILE
	done
}

write_makefile

if [ -f makefile ]; then

else

fi


