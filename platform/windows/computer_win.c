#include <windows.h>
#include "platform.h"

const char* get_computer_name(void) {
    static char name[MAX_COMPUTERNAME_LENGTH + 1];
    DWORD size = sizeof(name);

    GetComputerNameA(name, &size);
    return name;
}