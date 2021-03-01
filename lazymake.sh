#! /bin/bash

dir=${PWD##*/}

check_makefile=$(ls | grep Makefile)

lib_line="LINKLIB\t=\t-L./lib -lmy"

bin_line="SOFTNAME\t=\tbin"

ccflags="CCFLAGS\t=\t-g3 -fno-builtin"

max_len=0

idx=0

if [[ $check_makefile = "Makefile"  ]]
then
    lib_line=$(sed -n 16p Makefile)
    bin_line=$(sed -n 14p Makefile)
    ccflags=$(sed -n 20p Makefile)
fi

if [[ $1 -eq 1 ]]
then
    lib_line="LINKLIB\t=\t-L./lib -lmy -lcsfml-graphics -lcsfml-window -lcsfml-system"
fi
if [[ $1 -eq 2 ]]
then
    lib_line="LINKLIB\t=\t-L./lib -lmy -lncurses"
fi

## print the var part
printf "##\n## EPITECH PROJECT, 2021\n## ${dir}\n## File description:\n## Makefile for the ${dir} project\n##\n\n" > Makefile

printf "############################################################\n" >> Makefile
printf "########################## Flags ###########################\n" >> Makefile
printf "############################################################\n\n" >> Makefile

printf "MAKEFLAGS\t+=\t--no-print-directory\n\n" >> Makefile

printf "${bin_line}\n\n" >> Makefile

printf "${lib_line}\n\n" >> Makefile

printf "LINKHEADER\t=\t-I./inc\n\n" >> Makefile

printf "${ccflags}\n\n" >> Makefile

printf "SRC\t=" >> Makefile

for i in $(find src -name '*.c' ); 
do
    len=$((${#i} + 2))
    if [[ $len -gt $max_len ]]
    then
        max_len=$len
    fi
done

for i in $(find src -name '*.c' ); 
do
    len=${#i}
    nb_space=$((${max_len} - ${len}))
    if [[ $idx -eq 0 ]]
    then
        printf "   $i% *s" ${nb_space} "\\" >> Makefile
    else
        printf "\t\t$i% *s" ${nb_space} "\\" >> Makefile
    fi
	printf "\n" >> Makefile
    idx=$((${idx} + 1))
done
printf "\n" >> Makefile

printf "OBJ\t=\t" >> Makefile
echo "\$(SRC:.c=.o)" >> Makefile
printf "\n" >> Makefile

## print the all func

printf "############################################################\n" >> Makefile
printf "########################## Func ############################\n" >> Makefile
printf "############################################################\n\n" >> Makefile

printf ".PHONY:\tall clean fclean re\n\n" >> Makefile
printf "all:\t\$(SOFTNAME)\n\n" >> Makefile

printf ".c.o:\n\t@gcc \$(CCFLAGS) -c  $< -o \$@ \$(LINKHEADER) \$(LINKLIB)\n\n" >> Makefile

printf "\$(SOFTNAME):\t\$(OBJ)\n" >> Makefile
printf "\t@make -s -C lib/my\n" >> Makefile
printf "\t@gcc \$(CCFLAGS) -o \$(SOFTNAME) \$(OBJ) \$(LINKHEADER) \$(LINKLIB)\n\n" >> Makefile

printf "clean:\n" >> Makefile
printf "\t@make clean -s -C lib/my\n" >> Makefile
printf "\t@rm -rf \$(OBJ)\n\n" >> Makefile

printf "fclean:\tclean\n" >> Makefile
printf "\t@make fclean -s -C lib/my\n" >> Makefile
printf "\t@rm -rf \$(SOFTNAME) *.gcno *.gcda unit_tests\n\n" >> Makefile

####### unit test part ###

printf "unit_tests:\tre\n" >> Makefile
printf "\t@gcc -o unit_tests \$(filter-out src/main.c, \$(SRC)) tests/*.c \$(LINKHEADER) \$(LINKLIB) --coverage -lcriterion\n" >> Makefile
printf "\t@./unit_tests\n\n" >> Makefile

printf "tests_run:\tunit_tests\n\n" >> Makefile

printf "gcovr:\ttests_run\n" >> Makefile
printf "\t@gcovr --exclude tests/\n" >> Makefile
printf "\t@gcovr --exclude tests/ --branches\n\n" >> Makefile

printf "re:\tfclean all" >> Makefile