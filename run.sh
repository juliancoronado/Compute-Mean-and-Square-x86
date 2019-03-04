# /bin/bash
# Author name: Julian Coronado
# Program name: Arrays
# Assignment number: 3

# Removes old files
rm *.o
rm *.out
rm *.lis

echo "Bash script is now running.\n"

# Assemble the module control.asm
nasm -f elf64 -l control.lis -o control.o control.asm

# Assemble the module compute_mean.asm
nasm -f elf64 -l compute_mean.lis -o compute_mean.o compute_mean.asm

# Compile the C++ module driver.cpp
g++ -c -m64 -Wall -l driver.lis -o driver.o driver.cpp -fno-pie -no-pie

# Compile the C++ module square.cpp
g++ -c -m64 -Wall -l square.lis -o square.o square.cpp -fno-pie -no-pie

# Compile the C module display.cpp
g++ -c -m64 -Wall -l display.lis -o display.o display.cpp -fno-pie -no-pie

# Link the object files already created
g++ -m64 -o arrays.out control.o compute_mean.o driver.o square.o display.o -fno-pie -no-pie

echo "The bash script has finished successfully and is now closing.\n"

# Executes
./arrays.out
