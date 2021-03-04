/*
** EPITECH PROJECT, 2020
** my_strcat
** File description:
** reproduce strcatfrom libc behavior
*/

#include "my.h"

char *my_strcat(char *dest, char const *src)
{
    int i = 0;
    int len_des = my_strlen(dest);

    while (src[i] != '\0') {
        dest[len_des + i] = src[i];
        i++;
    }
    dest[len_des + i] = '\0';
    return (dest);
}
