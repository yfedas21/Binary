TITLE Study Guide Exercise 1 Review
INCLUDE Irvine32.inc 

.data

.code
main PROC
    mov ax, FFh
    ; Single instruction to clear high 8 bits
    ; of AX
    mov ah, 0h
    ; test if a number is even or odd, set
    ; the zero flag if even
    and al, 1h
    ; convert from upper to lowercase, or keep
    ; character in lowercase 
    and al, 11011111b
main ENDP
end main