// Author name: Julian Coronado
// Program title: Arrays
// Files in this program: driver.cpp, control.asm, square.cpp, display.c, compute_mean.asm, run.sh
// Course number: CPSC 240
// Assignment number: 3
// Required delivery date: Mar 7, 2019 before 11:59pm
// Purpose: Learn how arrays work and pass them through different files.
// Language of this module: C++
// Execute: arrays.out

#include <stdio.h>
#include <stdint.h>
#include <ctime>
#include <cstring>

// enables function in assembly file
extern "C" double control();

int main(){
    double answer;
    printf("%s", "Welcome to Arrays!\n");
    printf("%s", "This program is brought to you by Julian Coronado.\n");
    
    // calls function control() 
    answer = control();
    
    printf("%s", "The driver received this number: ");
    printf("%lf\n", answer);
    printf("%s\n", "The program has completed! Have a nice day!");
        
    return 0;

} // End of main
