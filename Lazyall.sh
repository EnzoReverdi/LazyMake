#! /bin/bash

######################################################################################
#                                                                                    #
#       .##..........###....########.##....##.##.....##....###....##....##.########  #
#      .##.........##.##........##...##..##..###...###...##.##...##...##..##......   #
#     .##........##...##......##.....####...####.####..##...##..##..##...##......    #
#    .##.......##.....##....##.......##....##.###.##.##.....##.#####....######..     #
#   .##.......#########...##........##....##.....##.#########.##..##...##......      #
#  .##.......##.....##..##.........##....##.....##.##.....##.##...##..##......       #
# .########.##.....##.########....##....##.....##.##.....##.##....##.########        #
#                                                                                    #
#  By Enzo REVERDI || RACLERIE 2.0™ Powered                                          #
######################################################################################

######################################################################################
#                  ____  ____  ____  ____  ____  ____  ____  ____                    #
#                 ||V ||||a ||||r ||||i ||||a ||||b ||||l ||||e ||                   #
#                 ||__||||__||||__||||__||||__||||__||||__||||__||                   #
#                 |/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\|                   #
#                                                                                    #
######################################################################################

# Will make the output of your Makefile colored if set to 1, Base is 0.
# If set to 1, I suggest you to set SILENCED to 1.
COLOR=0

# Will silence all the line of your Makefile with a '@' before each line if set to 1,
# Base is 0.
# If you set COLOR to 1, I suggest you to set SILENCED to 1.
SILENCED=0

# Will define the name of folders, base they are 3 letters , but change it the
# way you want, keep in mind that if you wanna use lazymake on existing project, you
# will have to match the folder name with the standars written there, or modify it.
LIBRARY="lib"
INCLUDE="inc"
SOURCES="src"

# If set to 1, it will init your project with all you need to start working directly
# if your folder is empty, to init he need to know the location of your template
# You need to specify it in the var PATH_TO_TEMPLATE, Your template folder should only
# contain your libs , since it's gonna be copied to the lib folder.
INIT_IF_EMPTY=0
PATH_TO_TEMPLATE="~/PATH/TO/YOUR/TEMPLATE/FOLDER"

# If you want to add another lib than "my" add it here.
# example:
#       your lib is named "libbestlib.a" , you need to add the flag "-lbestlib"
# Do not add CSFML or Ncurse here , because it's already handled by command line
# arguments. run "lazymake -h" to know more
LIB_ARG="-L./${LIBRARY} -lmy"

# If you want to add flags to your compilation add it here.
CCFLAGS="-g3 -fno-builtin"

# If you want to save some performance, you can set this to 1, it will not regenerate
# automaticly a makefile for the lib each time you call Lazymake. You will need to go
# in your lib directory and call Lazymake to update your differents lib's Makefile
PERF=0

### !!DISCLAIMER!! ##################################################################
# Do not set this to 1 on a project you want to bring on a review, You will get a -42
# it's here only to make your my.epitech.eu pretty
# "Vraie homme ne dit rien au pedagos"
#######      ########################      ##################     ###################
# if set to 1,
# Will create a tests folder if there is not one already, and put a criterion test in
# it, it will test the "my_strlen.c" file wich should be in your "my" lib, and since
# it's the only thing that will be tested in the project, you gonna get those sweet 
# green 100% test and coverage.
# Your "my_strlen.c" need to contain only the my_strlen function
# base is 0.
CHEAT=0

######################################################################################
###### FROM THIS POINT DON'T TOUTCH ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING ######
######################################################################################

ACTUAL_DIR=${PWD##*/}

BIN_NAME="bin"

MAX_LEN=0

LEN=0

IDX=0

FIND_BUFFERS=""

NB_SPACE=0

CSFML_OR_NCURSES=${1}

######################################################################################
#                  ____  ____  ____  ____  ____  ____  ____  ____                    #
#                 ||F ||||u ||||n ||||c ||||t ||||i ||||o ||||n ||                   #
#                 ||__||||__||||__||||__||||__||||__||||__||||__||                   #
#                 |/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\|                   #
#                                                                                    #
######################################################################################

main() {

}

check_major_folders() {
	local res=0
	local buffer="ls | grep ${SOURCES}"

	if [[ $buffer = $SOURCES ]]; then
		res=$(( res + 1))
	fi

	local buffer="ls | grep ${LIBRARY}"
	if [[ $buffer = $LIBRARY ]]; then
		res=$(( res + 1))
	fi

	local buffer="ls | grep ${INCLUDE}"
	if [[ $buffer = $INCLUDE ]]; then
		res=$(( res + 1))
	fi

	if [[ $res -eq 3 ]]; then
		return 0
	fi

	if [[ $res -eq 0 -a ${INIT_IF_EMPTY} -eq 1 ]]; then
		init_repo()
		exit 0
	fi

	printf "ERROR: Failed to locate one of the following directory, ${SOURCES}, \
	${LIBRARY}, ${INCLUDE}"
	exit 1
}

init_repo() {
	mkdir ${SOURCES} ${LIBRARY} ${INCLUDE} tests
	cd ${LIBRARY}
	cp -rf ${PATH_TO_TEMPLATE}/* .
	cd -1
}


main "$@"