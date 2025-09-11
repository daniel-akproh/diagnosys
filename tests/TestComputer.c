#include <windows.h>

#include "unity.h"
#include "platform.h"

void setUp(void) {}
void tearDown(void) {}

void test_get_computer_name_not_null(void) {
    const char *name = get_computer_name();
    TEST_ASSERT_NOT_NULL(name);
}

void test_get_computer_name_not_empty(void) {
    const char *name = get_computer_name();

    // message will only print when assertion fails.
    TEST_ASSERT_TRUE_MESSAGE(name[0] != '\0', "computer name is empty");
}

void test_get_computer_name_length_valid(void) {
    const char *name = get_computer_name();
    size_t len = strlen(name);
    TEST_ASSERT_TRUE(len > 0 && len <= MAX_COMPUTERNAME_LENGTH);
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_get_computer_name_not_null);
    RUN_TEST(test_get_computer_name_not_empty);
    RUN_TEST(test_get_computer_name_length_valid);
    return UNITY_END();
}