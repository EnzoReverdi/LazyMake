/*
** EPITECH PROJECT, 2020
** my_putstr
** File description:
** wazzup marvin
*/

#include "my.h"

int my_putstr(char const *str)
{
    int i = 0;
    for (i = 0; str[i] != '\0' ; i++)
        my_putchar(str[i]);
    return (i);
}
