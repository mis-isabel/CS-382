/*Isabel Sutedjo
I pledge my honor that I have abided by the Stevens Honor System.*/
#include <stdio.h>
#include <stdlib.h>

void display(int8_t bit) {
    putchar(bit + 48);
}

void display_32(int32_t num) {
    int i = 31;
    while (i >= 0) {
        if ((num >> i)&1 == 1) {
            display(1);
        }
        else{
            display(0);
        }
        i--;
    }

}

int main(int argc, char const *argv[]) {

    display_32(1993);

    return 0;
}
