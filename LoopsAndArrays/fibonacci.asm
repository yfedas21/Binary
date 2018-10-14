TITLE (fibonacci.asm)
; This program will calculate the first 7 numbers of the fibonacci sequence
; i.e.      0 , 1 , 1 , 2 , 3 , 5 , 8   
; Since the fib(7) is 8 and 8 < 15, a BYTE register can be used here...
; To accomodate larger numbers, larger registers must be used
INCLUDE Irvine32.inc ; this line needs to be here to assemble, for some reason...
.data
final BYTE ?
.code
main PROC
    ; set ecx loop counter to however many fib numbers
    ; you want to calculate minus initial two
    mov ecx, 5h
    ; initialize first and second fib numbers
    mov al, 0
    mov ah, 1

    lope:
        add al, ah  ; add higher number to lower
        xchg al, ah ; swap so ah always contains larger number
        loop lope
    mov [final], ah ; store final number in memory
    exit
main ENDP
end main