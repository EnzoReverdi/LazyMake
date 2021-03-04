/*
** EPITECH PROJECT, 2020
** my_revstr
** File description:
** reverse a string
*/

#include "my.h"

char *my_revstr(char *str)
{
    char buffer;
    int lenght;

    for (int i = 0; str[i] != '\0'; i++)
        lenght++;
    lenght = lenght - 1;
    for (int j = 0; j < lenght; j++) {
        buffer = str[j];
        str[j] = str[lenght];
        str[lenght] = buffer;
        lenght--;
    }
    return (str);
}
