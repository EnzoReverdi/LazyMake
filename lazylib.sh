#! /bin/bash
i=0
len=0
max_len=0
idx=0
nb_space=0

printf "##\n## EPITECH PROJECT, 2021\n## "my" lib\n## File description:\n## Makefile used to build the "my" lib\n##\n\n" > Makefile

printf "############################################################\n" >> Makefile
printf "########################## Flags ###########################\n" >> Makefile
printf "############################################################\n\n" >> Makefile

printf "MAKEFLAGS\t+=\t--no-print-directory\n\n" >> Makefile

printf "LIBNAME\t=\tlibmy.a\n\n" >> Makefile

printf "LINKHEADER\t=\t-I../../inc\n\n" >> Makefile

printf "CCFLAGS\t=\t-g3 -fno-builtin\n\n" >> Makefile

printf "OBJ\t=\t\$(SRC:.c=.o)\n\n" >> Makefile

printf "SRC\t=" >> Makefile

for i in $(find . -name '*.c' ); 
do
    len=$((${#i} + 2))
    if [[ $len -gt $max_len ]]
    then
        max_len=$len
    fi
done

for i in $(find . -name '*.c' ); 
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

printf "############################################################\n" >> Makefile
printf "########################## Func ############################\n" >> Makefile
printf "############################################################\n\n" >> Makefile

printf ".PHONY:	all clean fclean re\n\n" >> Makefile

printf "all:\t\$(LIBNAME)\n\n" >> Makefile

printf ".c.o:\n\t@gcc \$(CCFLAGS) -c  $< -o \$@ \$(LINKHEADER)\n\n" >> Makefile

printf "\$(LIBNAME):\t\$(OBJ)\n" >> Makefile
printf "\t@ar rcs \$(LIBNAME) \$(OBJ)\n" >> Makefile
printf "\t@cp \$(LIBNAME) ..\n\n" >> Makefile

printf "clean:\n" >> Makefile
printf "\t@rm -rf *.o\n\n" >> Makefile

printf "fclean:\tclean\n" >> Makefile
printf "\t@rm -rf ../\$(LIBNAME)\n" >> Makefile
printf "\t@rm -rf \$(LIBNAME)\n\n" >> Makefile

printf "re: fclean all" >> Makefile