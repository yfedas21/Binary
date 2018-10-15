TITLE (reverse_string.asm)
; This program takes a string and reverses it
; for example: racecar -> racecar
INCLUDE Irvine32.inc 
.data 
source BYTE "This is a source string",0
sourceSize = ($ - source) - 1
target BYTE SIZEOF source DUP(?)
.code 
main PROC 
    ; push the source string on the stack
    mov ecx, sourceSize
    mov esi, 0
    ; push each char on the stack
    L1: 
        movzx eax, source[esi]
        push eax 
        inc esi
        loop L1

    ; pop each char off the stack
    ; store in the target array
    mov ecx, sourceSize
    mov esi, 0
    L2:
        pop eax
        mov target[esi], al
        inc esi
        loop L2
    
    ; display both strings
    mov edx, OFFSET source
    call Writestring
    call Crlf
    mov edx, OFFSET target
    call Writestring
    call Crlf
    exit
main ENDP
end main