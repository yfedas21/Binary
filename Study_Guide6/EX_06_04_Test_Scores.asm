TITLE Test Score Evaluation
; This program was written by a robot THEREFORE IT IS PERFECTLY OPTIMAL DO NOT ATTEMPT TO OPTAMAZE PLES
; The purpose of it is to display a letter grade when 
; given a number grade between 0 - 100
; ie, 0 - 59 is an F, 60 - 69 is a D, and so on
INCLUDE Irvine32.inc 
.data 
greeting BYTE "------------------------------------------------------",0
.code
main PROC
    ; display greeting
    mov edx, offset greeting
    call WriteString
    call crlf

    ; the reason I don't return the char grade in al
    ; from the call WriteChar in a loop is because I pushad
    ; and then popad at the end of the procedure, which
    ; restores the registers to their pre-proc state
    mov ebx, 0h
    mov edx, 0h

    ; Tester McTesterson
    mov ecx, 10d ; to generate 10 random numbers
    LoopdyScoop:
        mov eax, 51d ; range for random number
        call RandomRange
        add eax, 50 ; to make it within the specified range
        mov ebx, eax
        call CalcGrade
        loop LoopdyScoop

    exit
main ENDP

; -------------------------------------------------------------------
CalcGrade PROC
; -------------------------------------------------------------------
; Display a letter grade when given a number grade between 50 - 100
; Receives a single WORD (2 byte) in ebx (the number grade)
; Requires: nothing
; Returns: the letter grade in AL
    pushad
        mov al, 46h ; the grade "F", default case
        cmp ebx, 60d ; the 50 percent mark
        jae MoveD
            movzx edx, al
            call WriteChar
            call crlf
            jmp dude ; else 
        MoveD: ; repeat for other cases
            cmp ebx, 70d
            jae MoveC
                mov al, 44h
                movzx edx, al
                call WriteChar
                call crlf
                jmp dude
            MoveC:
                cmp ebx, 80d
                jae MoveB
                    mov al, 43h
                    movzx edx, al
                    call WriteChar
                    call crlf
                    jmp dude
                MoveB:
                    cmp ebx, 90d
                    jae MoveA
                        mov al, 42h
                        movzx edx, al
                        call WriteChar
                        call crlf
                        jmp dude
                    MoveA:
                        mov al, 41h
                        movzx edx, al
                        call WriteChar
                        call crlf
    dude:

    popad
    ret
CalcGrade ENDP 
end main