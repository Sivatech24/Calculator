section .data
    prompt db "Enter an expression (e.g., 2 + 3): ", 0
    result db "Result: ", 0
    format db "%d", 0

section .bss
    num1 resd 1
    num2 resd 1
    operator resb 1
    total resd 1

section .text
    global _start

_start:
    ; Display a prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 29
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, operator
    mov edx, 1
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 1
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, operator
    mov edx, 1
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 1
    int 0x80

    ; Convert ASCII to integers
    mov eax, [num1]
    sub eax, '0'
    mov ebx, 10
    mul ebx
    mov ebx, [num2]
    sub ebx, '0'
    add eax, ebx

    ; Perform the operation
    mov ecx, [operator]
    cmp ecx, '+'
    je add
    cmp ecx, '-'
    je subtract
    cmp ecx, '*'
    je multiply
    cmp ecx, '/'
    je divide

add:
    add eax, ebx
    jmp display_result

subtract:
    sub eax, ebx
    jmp display_result

multiply:
    mul ebx
    jmp display_result

divide:
    xor edx, edx
    div ebx
    jmp display_result

display_result:
    ; Display the result
    mov ebx, eax
    mov eax, 4
    mov ecx, result
    mov edx, 7
    int 0x80

    ; Exit
    mov eax, 1
    int 0x80
