/*
** EPITECH PROJECT, 2020
** my_getnbr
** File description:
** wazzup marvin
*/

#include "my.h"

int my_getnbr(char const *str)
{
    int i = 0;
    int sum = 0;
    int neg = 1;

    if (str[i] == '-') {
        neg = -1;
        i++;
    }
    while (str[i] != '\0')
    {
        if (str[i] >= 48 && str[i] <= 57) {
            sum *= 10;
            sum += str[i] - 48;
            i++;
        } else
            return (sum * neg);
    }
    return (sum * neg);
}

int my_getnbr_offset(char const *str, unsigned long long i)
{
    int sum = 0;
    int neg = 1;

    if (str[i] == '-') {
        neg = -1;
        i++;
    }
    while (str[i] != '\0')
    {
        if (str[i] >= 48 && str[i] <= 57) {
            sum *= 10;
            sum += str[i] - 48;
            i++;
        } else
            return (sum * neg);
    }
    return (sum * neg);
}
