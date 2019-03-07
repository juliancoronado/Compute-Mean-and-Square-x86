// function prototype
extern "C" void square(long[], long);

// function "square" will square every value in array
void square(long arr[], long size) {

    // multipies each array value by itself
    for (long i = 0; i < size; i++) {
        arr[i] = arr[i] * arr[i];
    }
}