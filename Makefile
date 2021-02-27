##
## EPITECH PROJECT, 2021
## AutoMakefile
## File description:
## Makefile for the AutoMakefile project
##

############################################################
########################## Flags ###########################
############################################################

MAKEFLAGS	+=	--no-print-directory

SOFTNAME	=	bin

LINKLIB	=	-L./lib -lmy

LINKHEADER	=	-I./include

CCFLAGS	=	-g3 -fno-builtin

OBJ	=	$(SRC:.c=.o)


