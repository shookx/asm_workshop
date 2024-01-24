#include <stdio.h>

extern size_t my_strlen(const char *);

int main() {
    const char *test_string = "Hello, world!";
    size_t length = my_strlen(test_string);

    printf("Length of '%s' is %zu\n", test_string, length);

    return 0;
}
