; I affirm that all code given below was written solely by me, Yuriy Fedas,
; and that any help I received adhered to the rules stated for this exam. 

TITLE Kaleidoscope (main.asm)

INCLUDE Irvine32.inc 
.data
space BYTE " ",0
.code 
main PROC
    call Randomize ; set the starting seed
    mov al, 0
    mov ecx, 12 ; loopey loop 12 times
    L1:
        mov dl, al
        call getColor ; returns a number in ebx
        mov eax, ebx
        call SetTextColor
        mov edx, offset space
        call WriteString 
        inc al
        loop L1
    ;mov eax, 0 * 16 ; replace 0 with color (random int)
    ;call SetTextColor
    ;mov edx, offset space
    ;call WriteString

    ;mov dh, 12 ; row
    ;mov dl, 0 ; column

    exit
main ENDP

; ------------------------------------------------------------
getColor PROC
;
; A subroutine to get a random color (those defined by Irvine)
; and return to the calling function as a decimal 0 - 15
; Receives: nothing
; Returns: ebx <- color, 0 - 15d
; Requires: Randomize, RandomRange from Irvine32.inc
; ------------------------------------------------------------

    mov eax, 15d ; colors are from 0 - 15
    call RandomRange
    mov ebx, eax ; move the random integer into ebx to return
    imul ebx, ebx, 16
    ret

getColor ENDP

; ------------------------------------------------------------
func PROC
; ------------------------------------------------------------

func ENDP

end 