#include "cpu.h"
#include "platform.h"

int get_cpu_count(void) {
    return platform_get_cpu_count();
}