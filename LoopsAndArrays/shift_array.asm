TITLE (shift_array.asm)
; This program will take an int array and increment the 
; positions of each value. ie [10,20,30,40] --> [40,10,20,30]
INCLUDE Irvine32.inc 
.data
intArray BYTE 10h, 20h, 30h, 40h
.code
main PROC
    ; Personally, I hate this solution, even though it has
    ; the correct behavior. I would rather implement this
    ; sort of feature using the mod operator. All I would need
    ; in that case would be the address of the first value in the 
    ; array. What I mean by mod feature: have a counter esi start at 1. 
    ; 1 mod 4 is 1, 2 mod 4 is 2, 3 mod 4 is 3, and 4 mod 4 is 0. 
    ; I would use the result of the mod to determine where to place the 
    ; value. I couldn't do this in assembler because I ran out of registers... 
    mov al, intArray+3
    mov ah, intArray+2
    mov bl, intArray+1
    mov bh, intArray
    mov [intArray], al
    mov [intArray+1], bh
    mov [intArray+2], bl
    mov [intArray+3], ah
    exit
main ENDP
end main