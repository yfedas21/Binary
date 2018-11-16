TITLE MASM Illustrate removal of unpredictable branches (main.asm)
; Description:
; Revision date:
INCLUDE Irvine32.inc
CONST1 EQU 55h
CONST2 EQU 35h
CONST3 EQU CONST1 - CONST2
.data
.code
main PROC
    call Randomize
    call Clrscr
    ;-------------------------------------------------------------
    ; Assembly language to solve unpredictable branch problem
    ;-------------------------------------------------------------
    mov ecx, 20
    L1:
        ; Compute a random EBX value
        push ecx
        mov eax,5000
        call RandomRange
        mov ebx, eax ; move random value to EBX

        ; Compute a random EAX calue
        mov eax,5000
        call RandomRange

        ; Conditionally set ECX to CONST1 or CONST2
        xor ecx, ecx ; clear ecx (C in the C++ code)
        cmp eax, ebx ; values of EAX and EBX unpredictable
        setge cl ; cl= 0 OR cl= 1
        sub ecx, 1 ; ecx= FFFFFFFFh OR ecx= 00000000h
        and ecx, CONST3 ; ecx= CONST3 OR ecx= 00000000h
        ; TODO ADD A LINE OF CODE SO THAT ECX = CONST1 OR ECX = CONST2 appropriately
        ; HINT: WHAT IS IS ECX CURRENTLY? HOW CAN YOU COMPUTE THE CORRECT VALUE WITH
        ; ONE LINE OF CODE?
        ; ecx= CONST1 OR ecx= CONST2
        ; Use the value of ECX
        add ecx, CONST2 ; <---------------------- This is the line I added -----------------<<<<<<<<<<<<
        mov eax, ecx
        call WriteHex
        call crlf
        pop ecx
    loop L1
    exit
main ENDP
END
