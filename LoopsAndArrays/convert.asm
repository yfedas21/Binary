TITLE (convert.asm)
; This program will convert from Big Endian to Little Endian
; ex. takes 12345678 and reverses the order and stores in 
; the label littleEndian: 78563412 
; bswap solution accidentally found here: https://stackoverflow.com/questions/46824630/how-do-i-address-the-upper-16-bits-of-a-32-bit-register
.data
bigEndian BYTE 12h, 34h, 56h, 78h
littleEndian DWORD ? 
.code
main PROC
    ; set ecx loop counter to size of bigEndian
    ; (ecx determines loop iterations)
    mov ecx, SIZEOF bigEndian

    ; use esi register as index
    mov esi, 0

    ; the following loop works because bigEndian and
    ; littleEndian are right next to each other in memory

    ; Loopy McLoopface
    loopey_loop:
        mov al, BYTE PTR [littleEndian+(ecx-5)]
        mov BYTE PTR [littleEndian+esi], al
        inc esi
        loop loopey_loop

    ; eax - contains the converted DWORD
    ; ebx - the original DWORD to convert
    mov eax, [littleEndian]
    mov ebx, DWORD PTR [bigEndian]

    ; Now, for a one-liner...
    mov eax, DWORD PTR [bigEndian]
    bswap eax ; yeet
    exit
main ENDP
end main