#include <stdio.h>

#include "computer.h"
#include "platform.h"

void print_computer_name(void) {
    const char* name = get_computer_name();
    printf("Computer name: %s\n", name);
}