/*
** EPITECH PROJECT, 2020
** my_itoa
** File description:
** my_itoa
*/

#include "my.h"

static char *my_strcpy_rm(char *dest, char *src, int first)
{
    int i = 0;
    int j = 0;

    if (src[i] == '-')
        i++;
    if (first == 1)
        if (dest[0] == '-')
            j++;
    for (; src[i] == '0' && src[i + 1] != '\0'; i++);
    while (src[i] != '\0') {
        dest[j] = src[i];
        i++;
        j++;
    }
    dest[j] = '\0';
    return (dest);
}

char *my_itoa(int nb)
{
    int nb_bis = nb;
    int len = 1;
    int neg = (nb < 0) ? -1 : 1;
    char *res;

    for (; nb_bis != 0; nb_bis /= 10, len++);
    res = malloc(sizeof(char) * (len + 1));
    res[len] = '\0';
    len--;
    for (; len != 0; nb /= 10, len--)
        res[len] = nb % 10 * neg + '0';
    res[0] = (neg == -1) ? '-' : '0';
    my_strcpy_rm(res, res, 1);
    return (res);
}

char *my_itoa_u(size_t nb)
{
    size_t nb_bis = nb;
    int len = 1;
    char *res;

    for (; nb_bis != 0; nb_bis /= 10, len++);
    res = malloc(sizeof(char) * (len + 1));
    res[len] = '\0';
    len--;
    for (; len != 0; nb /= 10, len--)
        res[len] = nb % 10 + '0';
    res[0] = '0';
    my_strcpy_rm(res, res, 1);
    return (res);
}
