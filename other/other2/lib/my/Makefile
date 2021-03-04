##
## EPITECH PROJECT, 2021
## my lib
## File description:
## Makefile used to build the my lib
##

############################################################
########################## Flags ###########################
############################################################

# MAKEFLAGS	+=	--no-print-directory -s

LIBNAME	=	libmy.a

LINKHEADER	=	-I../../inc

CCFLAGS	=	-g3 -fno-builtin

OBJ	=	$(SRC:.c=.o)

SRC	=   ./my_getnbr.c  \
		./my_itoa.c    \
		./my_put_nbr.c \
		./my_putchar.c \
		./my_putstr.c  \
		./my_revstr.c  \
		./my_strcat.c  \
		./my_strcmp.c  \
		./my_strcpy.c  \
		./my_strlen.c  \
		./my_strncmp.c \
		./my_strncpy.c \

############################################################
########################## Func ############################
############################################################

.PHONY:	all clean fclean re

all:	$(LIBNAME)

.c.o:
	gcc $(CCFLAGS) -c  $< -o $@ $(LINKHEADER)

$(LIBNAME):	$(OBJ)
	ar rcs $(LIBNAME) $(OBJ)
	cp $(LIBNAME) ..

clean:
	rm -rf *.o

fclean:	clean
	rm -rf ../$(LIBNAME)
	rm -rf $(LIBNAME)

re: fclean all