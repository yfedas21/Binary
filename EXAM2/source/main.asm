; I affirm that all code given below was written solely by me, Yuriy Fedas,
; and that any help I received adhered to the rules stated for this exam. 

TITLE Kaleidoscope (main.asm)

INCLUDE Irvine32.inc 
.data
space BYTE " ",0
caption BYTE "Are you ready?!",0
msg BYTE "Press OK if you are ready to collect ", 0dh, 0ah
    BYTE " your biggest headache... ",0
.code 
main PROC
    mov ebx, offset caption
    mov edx, offset msg
    call Msgbox

    mov ecx, 100 ; change the kaleidoscope 100 times
    hloop:
        mov eax, 1000 ; delay for one second
        call Delay
        call Randomize ; set the starting seed
        call setColor ; calling subroutine here 
        loop hloop

    exit
main ENDP

; ------------------------------------------------------------
getColor PROC
;
; A subroutine to get a random color (those defined by Irvine)
; and return to the calling function as a decimal 0 - 15
; Receives: nothing
; Returns: eax <- color, 0 - 15d
; Requires: Randomize, RandomRange from Irvine32.inc
; ------------------------------------------------------------

    mov eax, 15d ; colors are from 0 - 15
    call RandomRange
    ;mov ebx, eax ; move the random integer into ebx to return
    imul eax, eax, 16
    ret

getColor ENDP

; ------------------------------------------------------------
setColor PROC
; ------------------------------------------------------------
;
; A subroutine to create the kaleidoscope
; Receives: nothing (the column size is 24 by default)
; Returns: nothing
; Requires: Gotoxy, SetTextColor, WriteString, Crlf 

    mov dh, 0 ; <-- to make sure dh is 0 to save headache
    mov ecx, 12 ; create an outer loop for rows (12 - 1)
    incRow: 
        push ecx
        mov dl, 0 ; for column increment 
        mov ecx, 12 ; create an inner loop for columns (12 - 1)
        incCol: ; use Gotoxy to set colors in all 4 quadrants

            call Gotoxy ; <-- the current cursor position

            ; Set quadrant 2 (in normal xy contexts)
            call getColor ; returns a color in ebx
            call SetTextColor ; set the color of the text 
            push edx ; to save the state of dh above
            mov edx, offset space
            call WriteString
            pop edx

            ; Set quadrant 1
            push edx
            neg dl
            add dl, 23
            call Gotoxy
            mov edx, offset space
            call WriteString
            pop edx 

            ; Set quadrant 3
            push edx 
            neg dh
            add dh, 23
            call Gotoxy
            mov edx, offset space
            call WriteString
            pop edx
            
            ; Set quadrant 4
            push edx
            neg dh
            add dh, 23
            neg dl
            add dl, 23
            call Gotoxy
            mov edx, offset space
            call WriteString
            pop edx

            inc dl ; shift column position
            loop incCol
        
        pop ecx ; restore ecx value from stack
        call crlf ; next line bois
        inc dh ; <-- increment the row bois 
        loop incRow
    
    ret ; subroutine return 
setColor ENDP

end 