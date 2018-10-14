TITLE (reverse_string.asm)
; This program takes a string and reverses it
; for example: racecar -> racecar
INCLUDE Irvine32.inc 
.data 
source BYTE "This is a source string",0
target BYTE SIZEOF source DUP(#)
.code 
main PROC 
    mov eax, 0
main ENDP
end main