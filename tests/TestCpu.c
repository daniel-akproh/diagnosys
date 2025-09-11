#include "unity.h"
#include "Cpu.h"

void setUp(void) {

}

void tearDown() {

}

void test_cpu_count_limits(void) {
    int n = get_cpu_count();
    TEST_ASSERT_TRUE_MESSAGE(n >= 1, "CPU count >= 1");
    TEST_ASSERT_TRUE_MESSAGE(n <= 512, "CPU count <= 512");
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_cpu_count_limits);
    return UNITY_END();
}

