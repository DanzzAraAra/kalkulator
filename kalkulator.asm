section .data
    msg1 db "Masukkan angka pertama (0-9): "
    len1 equ $ - msg1

    msg2 db "Masukkan operator (+,-,*): "
    len2 equ $ - msg2

    msg3 db "Masukkan angka kedua (0-9): "
    len3 equ $ - msg3

    hasil db "Hasil: "
    lenHasil equ $ - hasil

    newline db 10

section .bss
    num1 resb 2
    num2 resb 2
    op resb 2
    out resb 2

section .text
    global _start

_start:
    ; Angka pertama
    mov rax,1
    mov rdi,1
    mov rsi,msg1
    mov rdx,len1
    syscall

    mov rax,0
    mov rdi,0
    mov rsi,num1
    mov rdx,2
    syscall

    ; Operator
    mov rax,1
    mov rdi,1
    mov rsi,msg2
    mov rdx,len2
    syscall

    mov rax,0
    mov rdi,0
    mov rsi,op
    mov rdx,2
    syscall

    ; Angka kedua
    mov rax,1
    mov rdi,1
    mov rsi,msg3
    mov rdx,len3
    syscall

    mov rax,0
    mov rdi,0
    mov rsi,num2
    mov rdx,2
    syscall

    ; ASCII -> angka
    mov al,[num1]
    sub al,'0'
    mov bl,[num2]
    sub bl,'0'

    mov cl,[op]

    cmp cl,'+'
    je tambah

    cmp cl,'-'
    je kurang

    cmp cl,'*'
    je kali

tambah:
    add al,bl
    jmp tampil

kurang:
    sub al,bl
    jmp tampil

kali:
    mul bl

tampil:
    add al,'0'
    mov [out],al

    mov rax,1
    mov rdi,1
    mov rsi,hasil
    mov rdx,lenHasil
    syscall

    mov rax,1
    mov rdi,1
    mov rsi,out
    mov rdx,1
    syscall

    mov rax,1
    mov rdi,1
    mov rsi,newline
    mov rdx,1
    syscall

    mov rax,60
    xor rdi,rdi
    syscall
