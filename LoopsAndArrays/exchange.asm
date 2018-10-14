TITLE (exchange.asm)
; this program exchanges every pair of values 
; in an (BYTE) array 
; (i.e. swap i -> i + 1, i + 2 -> i + 3, etc)
; 
;       ******* NOTE : THIS PROGRAM IS WRITTEN TO TAKE PROCESS AN ARRAY OF BYTES ********
;       ******* TO USE A DIFFERENT TYPE:                                         ********
;               1. Change the type from BYTE to desired type on line 16
;               2. On line 26, change the incrementor accordingly in the index
;               3. On line 28, be sure to add the correct number of bytes to esi
;               4. Change register from al to ax or eax accordingly, lines 25 - 27
;
INCLUDE Irvine32.inc 
.data
; an array with an even number of values
array BYTE 1h, 2h, 3h, 4h, 5h, 6h, 7h, 8h, 9h, 10h
.code
main PROC
    mov ecx, (SIZEOF array)/2 ; set the correct # of iterations
    mov esi, 0 ; prevent weird issues when incrementing

    ; the code is self-explanatory, I feel like going through
    ; what each line does is redundant... SEE NOTE ABOVE
    lop: 
        mov al, array[esi] 
        xchg al, array[esi+1]
        mov [array[esi]], al 
        add esi, 2
        loop lop
    exit
main ENDP
end main