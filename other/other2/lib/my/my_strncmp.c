/*
** EPITECH PROJECT, 2020
** my_strncp
** File description:
** reproduce the behavior of strncmpp func
*/

#include "my.h"

int my_strncmp(const char *s1, const char *s2, int n)
{
    int stack = 0;
    int stack_bis = 0;
    int res = 0;

    for (int i = 0; s1[i] != '\0' && i < n; i++)
        stack += s1[i];
    for (int j = 0; s2[j] != '\0' && j < n; j++)
        stack_bis += s2[j];
    res = stack - stack_bis;
    if (res == 0)
        return (res);
    if (res < 0)
        return (-1);
    if (res > 0)
        return (1);
    return 0;
}
