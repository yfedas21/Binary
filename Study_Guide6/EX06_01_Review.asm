TITLE Study Guide Exercise 1 Review
INCLUDE Irvine32.inc 

.data

.code
main PROC
    mov ax, 0FFFFh
    ; Single instruction to clear high 8 bits
    ; of AX
    mov ah, 0h
    ; test if a number is even or odd, set
    ; the zero flag if even
    and al, 00000001b
    ; convert from upper to lowercase, or keep
    ; character in lowercase 
    mov al, 42h ; the letter capital B
    or al, 0100000b ; convert to lowercase
    exit
main ENDP
end main