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
 #$#                                                                              #$#
 #$#                                                                              #$#
 #$#                                                                              #$#
 #$#                                                                              #$#
 #$#                                                                              #$#
 #$#                                                                              #$#
 #$#                                                                              #$#
 #$#                                                                              #$#
 #$#                                                                              #$#
 #$#                                                                              #$#
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

# Will silence your Makefile if set to 1,
# Base is 0.
# If you set COLOR to 1, I suggest you to set SILENCED to 1.
SILENCED=0

# Will define the name of folders, base they are 3 letters , but change it the
# way you want, keep in mind that if you wanna use lazymake on existing project, you
# will have to match the folder name with the standar written here.
LIBRARY="lib"
INCLUDE="inc"
SOURCES="src"

# If set to 1, Will init an empty repository after running a simple lazymake,
# init consist of copying the content of your template, create a src and tests folders
# and create all the makefile you need.
# What you want your template folder to look like
# .
# ├── inc
# │   └── my.h
# └── lib
#     └── my
#         ├── my_getnbr.c
#         ├── my_itoa.c
#         ├── my_putchar.c
#         ├── my_put_nbr.c
#         ├── my_putstr.c
#         ├── my_revstr.c
#         ├── my_strcat.c
#         ├── my_strcmp.c
#         ├── my_strcpy.c
#         ├── my_strlen.c
#         ├── my_strncmp.c
#         └── my_strncpy.c
INIT_IF_EMPTY=0
## ABSOLUTE PATH NEEDED
PATH_TO_TEMPLATE="/home/enzoreverdi/Delivery/perso/Template"

# If you want to add another lib than "my" add it here.
# example:
#       your lib is named "libbestlib.a" , you need to add the flag "-lbestlib"
# Do not add CSFML or Ncurse here , because it's already handled by command line
# arguments. 1 for CSFML, 2 for Ncurse
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
# "Vrai homme dit rien au pedagos"
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
###### FROM THIS POINT DON'T TOUCH ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING ######
######################################################################################

ACTUAL_DIR=${PWD##*/}

BIN_NAME="bin"

MAX_LEN=0

LEN=0

IDX=0

FIND_BUFFERS=""

NB_SPACE=0

CSFML_OR_NCURSES=${1}

YEAR=$(date +'%Y')

IS_CHEATED=0

######################################################################################
#                  ____  ____  ____  ____  ____  ____  ____  ____                    #
#                 ||F ||||u ||||n ||||c ||||t ||||i ||||o ||||n ||                   #
#                 ||__||||__||||__||||__||||__||||__||||__||||__||                   #
#                 |/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\|                   #
#                                                                                    #
######################################################################################

main() {
	if [[ $ACTUAL_DIR = $LIBRARY ]]; then
		create_main_lib_makefile
		exit 0
	else
		check_major_folders
	fi
	create_main_makefile
	if [[ $PERF -eq 0 ]]; then
		cd ${LIBRARY} && create_main_lib_makefile && cd ..
	fi
}

create_main_makefile() {
	local check_makefile=$(ls | grep Makefile)
	local lib_line="LINKLIB\t=\t${LIB_ARG}"
	local bin_line="SOFTNAME\t=\tbin"
	local cflags="CCFLAGS\t=\t${CCFLAGS}"
	unit_tests_line="UNI\t=\t\$(filter-out src/main.c, \$(SRC)) tests/*.c \$(LINKLIB)"

	if [[ $check_makefile = "Makefile"  ]]
	then
		lib_line=$(sed -n 16p Makefile)
		bin_line=$(sed -n 14p Makefile)
		cflags=$(sed -n 20p Makefile)
		unit_tests_line=$(sed -n 24p Makefile)
	else
		if [[ $CHEAT -eq 1 ]]; then
			while true; do
				read -p "Do you wish to cheat the unit tests? [Y/n]" yn
				case $yn in
				[Yy]* )create_cheated_tests; break;;
				[Nn]* ) break;;
				* ) echo "Please answer [y/n]";;
			esac
		done
		fi
	fi

	if [[ $CSFML_OR_NCURSES -eq 1 ]]; then
    lib_line="LINKLIB\t=\t${LIB_ARG} -lcsfml-graphics -lcsfml-window -lcsfml-system"
	fi
	if [[ $CSFML_OR_NCURSES -eq 2 ]]; then
    lib_line="LINKLIB\t=\t${LIB_ARG} -lncurses"
	fi

	printf "##\n## EPITECH PROJECT, ${YEAR}\n## ${ACTUAL_DIR}\n## File description:\n## \
Makefile for the ${ACTUAL_DIR} project\n##\n\n" > Makefile
	print_flags_banner
	print_makeflags
	printf "${bin_line}\n\n" >> Makefile
	printf "${lib_line}\n\n" >> Makefile
	printf "LINKHEADER\t=\t-I./${INCLUDE}\n\n" >> Makefile
	printf "${cflags}\n\n" >> Makefile
	printf "OBJ\t=\t\$(SRC:.c=.o)\n\n" >> Makefile
	printf "${unit_tests_line}\n\n" >> Makefile

	printf "SRC\t=" >> Makefile
	reset_before_find
	for FIND_BUFFERS in $(find src -name '*.c' ); 
	do
		LEN=$((${#FIND_BUFFERS} + 2))
		if [[ $LEN -gt $MAX_LEN ]]
		then
			MAX_LEN=$LEN
		fi
	done

	for FIND_BUFFERS in $( find src -name '*.c' ); 
	do
		LEN=${#FIND_BUFFERS}
		NB_SPACE=$((${MAX_LEN} - ${LEN}))
		if [[ $IDX -eq 0 ]]
		then
			printf "   $FIND_BUFFERS% *s" ${NB_SPACE} "\\" >> Makefile
		else
			printf "\t\t$FIND_BUFFERS% *s" ${NB_SPACE} "\\" >> Makefile
		fi
		printf "\n" >> Makefile
		IDX=$((${IDX} + 1))
	done
	printf "\n\n" >> Makefile

	print_func_banner

	printf ".PHONY:\tall clean fclean re\n\n" >> Makefile
	printf "all:\t\$(SOFTNAME)\n\n" >> Makefile

	printf ".c.o:\n\tgcc \$(CCFLAGS) -c  $< -o \$@ \$(LINKHEADER)\n\n" >> Makefile

	printf "\$(SOFTNAME):\t\$(OBJ)\n" >> Makefile
	printf "\tmake -C ${LIBRARY}\n" >> Makefile
	printf "\tgcc \$(CCFLAGS) -o \$(SOFTNAME) \$(OBJ) \$(LINKHEADER) \$(LINKLIB)\n\n" >> Makefile

	printf "clean:\n" >> Makefile
	printf "\tmake clean -C ${LIBRARY}\n" >> Makefile
	printf "\trm -rf \$(OBJ)\n\n" >> Makefile

	printf "fclean:\tclean\n" >> Makefile
	printf "\tmake fclean -C ${LIBRARY}\n" >> Makefile
	printf "\trm -rf \$(SOFTNAME) *.gcno *.gcda unit_tests\n\n" >> Makefile

	printf "re:\tfclean all\n\n" >> Makefile

	printf "unit_tests:\tre\n" >> Makefile
	printf "\tgcc -o unit_tests \$(UNI) \$(LINKHEADER) --coverage -lcriterion\n" >> Makefile
	printf "\t./unit_tests\n\n" >> Makefile

	printf "tests_run:\tunit_tests\n\n" >> Makefile

	printf "gcovr:\ttests_run\n" >> Makefile
	printf "\tgcovr --exclude tests/\n" >> Makefile
	printf "\tgcovr --exclude tests/ --branches\n" >> Makefile
}

check_major_folders() {
	local res=0
	local buffer=$(ls | grep ${SOURCES})

	if [[ $buffer = $SOURCES ]]; then
		res=$(( $res + 1 ))
	fi

	buffer=$(ls | grep ${LIBRARY})
	if [[ $buffer = $LIBRARY ]]; then
		res=$(( $res + 1 ))
	fi

	buffer=$(ls | grep ${INCLUDE})
	if [[ $buffer = $INCLUDE ]]; then
		res=$(( $res + 1 ))
	fi

	if [[ $res == 3 ]]; then
		return 0
	fi

	if [ $res -eq 0 -a $INIT_IF_EMPTY -eq 1 ]; then
		while true; do
			read -p "Do you wish to init this repo ? [Y/n]" yn
			case $yn in
				[Yy]* )init_repo;;
				[Nn]* ) exit 0;;
				* ) echo "Please answer [y/n]";;
			esac
		done
	fi

	printf "ERROR: Failed to locate one or two of the following directory, ${SOURCES}, \
${LIBRARY}, ${INCLUDE}\n"
	exit 1
}

create_mainc() {
	printf "/*\n** EPITECH PROJECT, ${YEAR}\n** Main\n** File description:\n** \
Main for the ${ACTUAL_DIR} project\n*/\n\n" > main.c
	printf "#include \"my.h\"\n\n" >> main.c
	printf "int main(int ac, char **av)\n{\n\n}\n" >> main.c
}

init_repo() {
	cp -r ${PATH_TO_TEMPLATE}/* .
	local buffer=$(ls | grep ${LIBRARY})
	if [[ $buffer = $LIBRARY ]]; then
		mkdir ${SOURCES} tests
		cd ${LIBRARY} && create_main_lib_makefile && cd ..
		cd ${SOURCES} && create_mainc && cd ..
		create_main_makefile
		exit 0
	else
		printf "ERROR: Failed to locate one or two of the following directory, ${SOURCES}, \
${LIBRARY}, ${INCLUDE}\n"
		exit 1
	fi
}

create_main_lib_makefile() {
	buffertucoco=""
	printf "##\n## EPITECH PROJECT, ${YEAR}\n## ${LIBRARY}\n## File description:\n\
## Makefile used to build all the lib contained here\n##\n\n" > Makefile
	print_flags_banner
	print_makeflags

	printf "SRC\t=\t" >> Makefile
	reset_before_find
	for FIND_BUFFERS in $(find . -maxdepth 1 -type d );
	do
		if [[ $FIND_BUFFERS = "." ]]; then
			continue
		fi
		cd $FIND_BUFFERS && create_lib_makefile && cd ..
		buffertucoco="${FIND_BUFFERS}"
		LEN=$((${#buffertucoco} + 2))
		if [[ $LEN -gt $MAX_LEN ]]
		then
			MAX_LEN=$LEN
		fi
	done

	for FIND_BUFFERS in $(find . -maxdepth 1 -type d );
	do
		if [[ $FIND_BUFFERS = "." ]]; then
			continue
		fi
		buffertucoco="${FIND_BUFFERS}"
		LEN=${#buffertucoco}
		NB_SPACE=$((${MAX_LEN} - ${LEN}))
		if [[ $IDX -eq 0 ]]
		then
			printf "   $buffertucoco% *s" ${NB_SPACE} "\\" >> Makefile
		else
			printf "\t\t$buffertucoco% *s" ${NB_SPACE} "\\" >> Makefile
		fi
		printf "\n" >> Makefile
		IDX=$((${IDX} + 1))
	done
	printf "\n" >> Makefile

	print_func_banner

	printf ".PHONY:	all clean fclean re\n\n" >> Makefile

	printf "all:\n" >> Makefile
	printf "\tmake -C \$(SRC)\n\n" >> Makefile

	printf "clean:\n" >> Makefile
	printf "\tmake clean -C \$(SRC)\n\n" >> Makefile

	printf "fclean:\n" >> Makefile
	printf "\tmake fclean -C \$(SRC)\n\n" >> Makefile

	printf "re:\n" >> Makefile
	printf "\tmake re -C \$(SRC)\n" >> Makefile
}

########## need to test this
i_hope_you_will_not_get_busted() {
	local name="${ACTUAL_DIR}_test.c"
	printf "/*\n** EPITECH PROJECT, ${YEAR}\n** ${ACTUAL_DIR}\n** File description:\n** \
Test for ${ACTUAL_DIR} project\n*/\n\n" > $name

	printf "#include <criterion/criterion.h>\n" >> $name
	printf "#include <criterion/redirect.h>\n" >> $name
	printf "#include \"my.h\"\n\n" >> $name
	printf "Test(${ACTUAL_DIR}, test_of_${ACTUAL_DIR})\n{\n" >> $name
	printf "\tint i = my_strlen(\"Raclerie2.0\");\n" >> $name
	printf "\tcr_assert(i - 11 == 0);\n}\n" >> $name
}

create_cheated_tests() {
	local check_fold=$(ls | grep tests)
	if [[ $check_fold != "tests" ]]; then
		mkdir tests
	fi
	unit_tests_line="UNI\t=\t\$(find . -name 'my_strlen.c') tests/*.c"
	check_fold=$(ls tests)
	if [[ $check_fold != "" ]]; then
		printf "The directory \"tests\" already contain a test, lazymake assumes that it is the cheated test\
 ,if it's not then remove the content of the test folder and the root makefile and run lazymake again"
		return 0
	fi
	cd tests && i_hope_you_will_not_get_busted && cd ..
}
##########

create_lib_makefile() {
	local dir=${PWD##*/}
	local bislen=0
	local bisfind_buffers=""
	local bismax_len=0
	local bisidx=0
	local bisnb_space=0

	printf "##\n## EPITECH PROJECT, ${YEAR}\n## ${dir} lib\n## File description:\n\
## Makefile used to build the ${dir} lib\n##\n\n" > Makefile
	print_flags_banner
	print_makeflags

	printf "LIBNAME\t=\tlib${dir}.a\n\n" >> Makefile

	printf "LINKHEADER\t=\t-I../../${INCLUDE}\n\n" >> Makefile

	printf "CCFLAGS\t=\t${CCFLAGS}\n\n" >> Makefile

	printf "OBJ\t=\t\$(SRC:.c=.o)\n\n" >> Makefile

	printf "SRC\t=" >> Makefile

	for bisfind_buffers in $(find . -name '*.c' ); 
	do
		bislen=$((${#bisfind_buffers} + 2))
		if [[ $bislen -gt $bismax_len ]]
		then
			bismax_len=$bislen
		fi
	done

	for bisfind_buffers in $(find . -name '*.c' ); 
	do
		bislen=${#bisfind_buffers}
		bisnb_space=$((${bismax_len} - ${bislen}))
		if [[ $bisidx -eq 0 ]]
		then
			printf "   $bisfind_buffers% *s" ${bisnb_space} "\\" >> Makefile
		else
			printf "\t\t$bisfind_buffers% *s" ${bisnb_space} "\\" >> Makefile
		fi
		printf "\n" >> Makefile
		bisidx=$((${bisidx} + 1))
	done
	printf "\n" >> Makefile

	print_func_banner

	printf ".PHONY:	all clean fclean re\n\n" >> Makefile

	printf "all:\t\$(LIBNAME)\n\n" >> Makefile
	printf ".c.o:\n\tgcc \$(CCFLAGS) -c  $< -o \$@ \$(LINKHEADER)\n\n" >> Makefile

	printf "\$(LIBNAME):\t\$(OBJ)\n" >> Makefile
	printf "\tar rcs \$(LIBNAME) \$(OBJ)\n" >> Makefile
	printf "\tcp \$(LIBNAME) ..\n\n" >> Makefile

	printf "clean:\n" >> Makefile
	printf "\trm -rf *.o\n\n" >> Makefile

	printf "fclean:\tclean\n" >> Makefile
	printf "\trm -rf ../\$(LIBNAME)\n" >> Makefile
	printf "\trm -rf \$(LIBNAME)\n\n" >> Makefile

	printf "re: fclean all" >> Makefile
}

print_flags_banner() {
	printf "############################################################\n" >> Makefile
	printf "########################## Flags ###########################\n" >> Makefile
	printf "############################################################\n\n" >> Makefile
}

print_func_banner() {
	printf "############################################################\n" >> Makefile
	printf "########################## Func ############################\n" >> Makefile
	printf "############################################################\n\n" >> Makefile
}

print_color_banner() {
	printf "############################################################\n" >> Makefile
	printf "########################## Colors ##########################\n" >> Makefile
	printf "############################################################\n\n" >> Makefile
}

print_makeflags() {
	if [ $SILENCED -eq 0 ]; then
		printf "# " >> Makefile
	fi
	printf "MAKEFLAGS\t+=\t--no-print-directory -s\n\n" >> Makefile
}

reset_before_find() {
	LEN=0
	FIND_BUFFERS=""
	MAX_LEN=0
	IDX=0
	NB_SPACE=0
}

main "$@"