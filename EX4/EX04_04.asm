TITLE Integer Expression Calculation            (EX04_04.asm)
; This program adds and subtracts 32-bit unsigned
; integers and stores the sum in a variable.
INCLUDE Irvine32.inc
.data
val1 DWORD 8
val2 DWORD 4
Val3 DWORD 2
val4 DWORD 1
finalVal DWORD ?
.code
main PROC
	mov eax, val1
    mov ebx, val2
    mov ecx, val3
    mov edx, val4

    add eax, ebx
    add ecx, edx
    sub eax, ecx

	mov finalVal, eax		; store the result in finalVal
	exit
main ENDP
END main
