; Author name: Julian Coronado
; Program title: Arrays
; Files in this program: driver.cpp, control.asm, square.cpp, display.c, compute_mean.asm, run.sh
; Course number: CPSC 240
; Assignment number: 3
; Required delivery date: Mar 7, 2019 before 11:59pm
; Purpose: Learn how arrays work and pass them through different files.
; Language of this module:  X86 with Intel syntax

; ===== BEGIN CODE AREA ====================================================================================================================================================

extern printf                                               ; External C++ function for writing to standard output device
extern scanf                                                ; External C++ function for reading from the standard input device
global compute_mean                                              ; This makes "control" callable by functions outside of this file.

; ===== INITIALIZED DATA ===================================================================================================================================================

segment .data                                               ; Place initialized data here

meantext db "The mean of those numbers is: ", 0

stringformat db "%s", 0                                     ; General string format
inputformat db "%ld", 10, 0                                     ; General integer format
floatformat db "%f", 10, 0

; ===== UNINITIALIZED DATA =================================================================================================================================================

segment .bss                                                ; Place un-initialized data here.

; ===== EXECUTABLE INSTRUCTIONS ============================================================================================================================================

segment .text                                               ; Place executable instructions in this segment.

compute_mean:                                                    ; Entry point. Execution begins here.

; ===== BACK UP REGISTERS ==================================================================================================================================================

push       rbp                                              ; Save a copy of the stack base pointer
mov        rbp, rsp                                         ; We do this in order to be 100% compatible with C and C++.
push       rbx                                              ; Back up rbx
push       rcx                                              ; Back up rcx
push       rdx                                              ; Back up rdx
push       rsi                                              ; Back up rsi
push       rdi                                              ; Back up rdi
push       r8                                               ; Back up r8
push       r9                                               ; Back up r9
push       r10                                              ; Back up r10
push       r11                                              ; Back up r11
push       r12                                              ; Back up r12
push       r13                                              ; Back up r13
push       r14                                              ; Back up r14
push       r15                                              ; Back up r15
pushf                                                       ; Back up rflags

; ===== END OF BACK UP REGISTERS ===========================================================================================================================================

mov r14, rdi ; array
mov r13, rsi ; size

mov r8, 0 ; will hold sum

sum_loop:
    cmp r13, 0
    je sum_done

    add r8, [r14]
    dec r13
    add r14, 8
    jmp sum_loop

sum_done:
    ; sum is in r8

    mov rax, r8 ; moves sum into rax
    cqo ; extends rax to rdx:rax
    idiv rsi ; divids rax by rsi (which holds array size)
    mov r9, rax ; moves quotient into r9
    
    mov rax, 0
    mov rdi, stringformat
    mov rsi, meantext
    call printf

    mov rax, 0
    mov rdi, inputformat
    mov rsi, r9
    call printf

    mov rax, 0



; ===== RESTORES REGISTERS =================================================================================================================================================

popf                                                        ; Restore rflags
pop        r15                                              ; Restore r15
pop        r14                                              ; Restore r14
pop        r13                                              ; Restore r13
pop        r12                                              ; Restore r12
pop        r11                                              ; Restore r11
pop        r10                                              ; Restore r10
pop        r9                                               ; Restore r9
pop        r8                                               ; Restore r8
pop        rdi                                              ; Restore rdi
pop        rsi                                              ; Restore rsi
pop        rdx                                              ; Restore rdx
pop        rcx                                              ; Restore rcx
pop        rbx                                              ; Restore rbx
pop        rbp                                              ; Restore rbp

ret                                                         ; No parameter with this instruction.  This instruction will pop 8 bytes from
                                                            ; the integer stack, and jump to the address found on the stack.
; ===== END OF PROGRAM ====================================================================================================================================================
