// prototype function
extern "C" void square(long[], long);

// function square will square every value in array
void square(long arr[], long size) {

    for (long i = 0; i < size; i++) {
        arr[i] = arr[i] * arr[i];
    }
}