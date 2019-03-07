#include <stdio.h>
#include <stdint.h>
#include <ctime>
#include <cstring>

// include statement above were provided by professor's template

extern "C" void display(long[], long);

// this funciton will print every value in array
void display(long arr[], long size) {

    for (long i = 0; i < size; i++) {
        printf("%ld\n", arr[i]);
    }
}
