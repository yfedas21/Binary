TITLE (convert.asm)
; This program will convert from Big Endian to Little Endian
; ex. takes 12345678 and reverses the order and stores in 
; the label littleEndian: 78563412 
; CHALLENGE: reverse 12345678 to 87654321
; bswap solution accidentally found here: https://stackoverflow.com/questions/46824630/how-do-i-address-the-upper-16-bits-of-a-32-bit-register
INCLUDE Irvine32.inc 
.data
bigEndian BYTE 12h, 34h, 56h, 78h
bigEnd DWORD 12345678h
littleEndian DWORD ? 
backwards DWORD ? 
.code
main PROC 
    mov eax, 00000000h
    mov al, bigEndian
    mov ah, bigEndian+1
    bswap eax
    mov ah, bigEndian+2
    mov al, bigEndian+3
    bswap eax 
    ; All that is left to do is to assign the littleEndian label
    ; to hold the contents of eax
main ENDP
end main