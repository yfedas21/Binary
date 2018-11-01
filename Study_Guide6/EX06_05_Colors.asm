TITLE Probabilities and Colors
; Written by Yuriy Fedas. Calculate a probability and 
; set a color to the console for 20 lines
; I am proud of my clean indenting... who cares about the code
INCLUDE Irvine32.inc 
.data
hello BYTE "______________ WELCOME ____________________",0 ; some message
.code 
main PROC 
    ; greet the locals
    mov edx, offset hello
    call WriteString
    call crlf

    ; set the loop to run 20 times
    mov ecx, 20
    L1:
        mov eax, 10d ; for the random range
        call RandomRange
        cmp eax, 5 ; assume the random number is <= 5
        ja GreaterThanFive ; if not, jump
            mov eax, green + (green * 16) ; otherwise, 
            call SetTextColor ; set the appropriate color
            mov edx, offset hello
            call WriteString
            call crlf
            jmp veryEnd
        GreaterThanFive: ; case when the random number 
            cmp eax, 8   ; is greater than 5. test against 8
            ja GreaterThanEight ; if greater than 8, must be 9, so jump
                mov eax, white + (white * 16)
                call SetTextColor
                mov edx, offset hello
                call WriteString
                call crlf
                jmp veryEnd
            GreaterThanEight: ; the 10% blue case
                mov eax, blue + (blue * 16)
                call SetTextColor
                mov edx, offset hello
                call WriteString
                call crlf
        veryEnd: ; the very end 
        loop L1
    exit
main ENDP
end main