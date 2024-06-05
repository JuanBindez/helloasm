section .data
    msg db 'Hello, World!', 0x0A  ; A mensagem a ser impressa, terminada com uma nova linha (0x0A)

section .bss

section .text
    global _start

_start:
    ; sys_write(stdout, msg, 14)
    mov rax, 1        ; syscall number for sys_write (1)
    mov rdi, 1        ; file descriptor 1 is stdout
    mov rsi, msg      ; pointer to the message
    mov rdx, 14       ; message length
    syscall           ; call kernel

    ; sys_exit(0)
    mov rax, 60       ; syscall number for sys_exit (60)
    xor rdi, rdi      ; exit code 0
    syscall           ; call kernel
