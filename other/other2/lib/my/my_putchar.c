/*
** EPITECH PROJECT, 2020
** my_putchar
** File description:
** put a char
*/

#include "my.h"

void my_putchar(char c)
{
    write(1, &c, 1);
}
