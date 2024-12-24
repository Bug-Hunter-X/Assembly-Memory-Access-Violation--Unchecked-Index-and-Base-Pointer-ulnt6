section .data
    array dword 10, 20, 30, 40, 50 ; Example array
    array_size equ ($-array)/4 ; Calculate the size of the array

section .text
    global _start

_start:
    mov ebx, array ; Base address of the array
    mov ecx, 2 ; Index (we'll access the 3rd element)

    ; Check index bounds
    cmp ecx, array_size
    jge error_handler ; Jump to error handler if index is out of bounds

    mov esi, ecx ; Use the validated index
    mov eax, [ebx+esi*4] ; Access array element safely
    ; ... further operations using eax ...
    jmp exit

error_handler:
    ; Handle the error (e.g., print an error message or exit)
    ; ... error handling code...
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80

exit:
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80