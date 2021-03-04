/*
** EPITECH PROJECT, 2020
** my_put_nbr
** File description:
** put nbr
*/

#include "my.h"

int my_put_nbr(int nb)
{
    int buffer = 0;

    if (nb < 0) {
        my_putchar(45);
        nb *= -1;
    }
    if (nb >= 10) {
        buffer = nb % 10;
        nb /= 10;
        my_put_nbr(nb);
        my_putchar(buffer + 48);
    } else
        my_putchar(nb + 48);
    return (0);
}
