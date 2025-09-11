#include <stdio.h>

#include "cpu.h"
#include "computer.h"
// #include "include/diagnosys.h"

int main(void) {
    print_computer_name();

    int n = get_cpu_count();
    printf("CPU count is: %d\n", n);
    return 0;
}