/*
** EPITECH PROJECT, 2020
** my_strncpy
** File description:
** yo Marvin
*/

#include "my.h"

char *my_strncpy(char *dest, char const *src, int n)
{
    int i = 0;

    for (i = 0; i < n && src[i] != '\0'; i++)
        dest[i] = src[i];
    if (n > i)
        dest[i] = '\0';
    return (dest);
}
