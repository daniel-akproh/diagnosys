#include "unity.h"
#include "diagnosys.h"

void setUp(void) {

}

void test_add(void) {
    TEST_ASSERT_EQUAL_INT(5, add(2, 3));
    TEST_ASSERT_EQUAL_INT(10, add(5, 5));
}

void test_multiply(void) {
    TEST_ASSERT_EQUAL_INT(6, multiply(3, 2));
    TEST_ASSERT_EQUAL_INT(10, multiply(1, 10));
}

void tearDown(void) {
    
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_add);
    RUN_TEST(test_multiply);
    return UNITY_END();
}

