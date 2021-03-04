/*
** EPITECH PROJECT, 2020
** my_h
** File description:
** header file T02
*/

#ifndef MY_H
#define MY_H

#include <stdlib.h>
#include <stdarg.h>
#include <stdio.h>
#include <unistd.h>
#include <stddef.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <dirent.h>
#include <pwd.h>
#include <grp.h>
#include <string.h>
#include <time.h>
#include <getopt.h>
#include <fcntl.h>
#include <string.h>
#include <getopt.h>
#include <signal.h>

//////////////////////////////////////////////////////////////////////////////
/// \brief Copy the content of a string into an another, Dest string should
/// already be malloced to the right size
/// \param dest string to be copyed into
/// \param src string copied
/// \return string copied with a '\\0' at the end of it
//////////////////////////////////////////////////////////////////////////////
char *my_strcpy(char *dest, char const *src);

//////////////////////////////////////////////////////////////////////////////
/// \brief Get the number contained in the string, the string should start by
/// a number, othewise it will return 0
/// \param str string containing the number, verifications should be done prior
/// \return An int equal to the number contained in the string
//////////////////////////////////////////////////////////////////////////////
int my_getnbr(char const *str);

//////////////////////////////////////////////////////////////////////////////
/// \brief Print the int passed to the standard input
/// \return Always 0, for the sake of the recursive
//////////////////////////////////////////////////////////////////////////////
int my_put_nbr(int nb);

//////////////////////////////////////////////////////////////////////////////
/// \brief Print the given charact to the standard input
//////////////////////////////////////////////////////////////////////////////
void my_putchar(char c);

//////////////////////////////////////////////////////////////////////////////
/// \brief Reverse a string
/// \param str The string to reverse, it must contain a '\\0' to work
/// \return The string reversed string
//////////////////////////////////////////////////////////////////////////////
char *my_revstr(char *str);

//////////////////////////////////////////////////////////////////////////////
/// \brief Count the length of a string
/// \param str the string to know the length of, must be terminated with a
/// '\\0' charact
/// \return An int equal to the string length
//////////////////////////////////////////////////////////////////////////////
int my_strlen(char const *str);

//////////////////////////////////////////////////////////////////////////////
/// \brief Print the given string to the standard input
/// \param str the string to print , must be terminated with a '\\0' charact
/// \return An int equal to the number of charact printed
//////////////////////////////////////////////////////////////////////////////
int my_putstr(char const *str);

//////////////////////////////////////////////////////////////////////////////
/// \brief Transform an int into a string
/// \param nb The int to transform
/// \return Return a malloc' string containig the number given
//////////////////////////////////////////////////////////////////////////////
char *my_itoa(int nb);

//////////////////////////////////////////////////////////////////////////////
/// \brief Transform an unsigned int into a string
/// \param nb The unsigned int to transform
/// \return Return a malloc' string containig the number given
//////////////////////////////////////////////////////////////////////////////
char *my_itoa_u(size_t nb);

//////////////////////////////////////////////////////////////////////////////
/// \brief DON T USE IT
//////////////////////////////////////////////////////////////////////////////
char *my_strcat(char *dest, char const *src);

//////////////////////////////////////////////////////////////////////////////
/// \brief
/// \param
/// \return
//////////////////////////////////////////////////////////////////////////////
int my_strncmp(const char *s1, const char *s2, int n);

//////////////////////////////////////////////////////////////////////////////
/// \brief
/// \param
/// \param
/// \param
/// \return
//////////////////////////////////////////////////////////////////////////////
char *my_strncpy(char *dest, char const *src, int n);

//////////////////////////////////////////////////////////////////////////////
/// \brief Compare a string with another one , both should be terminated
/// by a NULL character
/// \param s1 String to compare
/// \param s2 String which is the 'base'
/// \return 1 if S1 is the same as s2, 0 otherwise
//////////////////////////////////////////////////////////////////////////////
int my_strcmp(char *s1, char *s2);

//////////////////////////////////////////////////////////////////////////////
/// \brief
/// \param
/// \param
/// \param
/// \return
//////////////////////////////////////////////////////////////////////////////
int my_getnbr_offset(char const *str, unsigned long long i);

#endif
