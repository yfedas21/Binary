Title EX06_03_Filling_Array.asm

INCLUDE Irvine32.inc 
.data
dArray DWORD ? ; array to be generated
secondArray DWORD ? ; second time proc run
.code
main PROC
    ; move pointer to dArray to eax 
    ; for procedure handling
    mov eax, offset dArray
    ; move value for N into ebx (10)
    mov ebx, 1010b 
    ; move values of j and k into 
    ; the appropriate registers
    mov edx, 0h
    mov edx, 100d ; lower bound
    mov esi, 0h
    mov esi, 1000d ; upper bound
    call fillArray
    
    ; set the loop counter 
    mov ecx, ebx

    L1:
    ; address of first array element
        mov edx, [eax]
        call WriteInt
        call crlf
        add eax, 4
        loop L1

    ; Run the procedure again
    mov eax, offset secondArray
    mov ebx, 1010b
    mov edx, 0h
    mov edx, 50d
    mov esi, 0h
    mov esi, 1000d
    call fillArray
    exit
main ENDP

; --------------------------------------------------------------
fillArray PROC
;
; Fills an array with double words with N random integers, 
; making sure that values fall in the j...k range, inclusive.
; Receives: EAX, EBX, EDX, ESI, the pointer to the array, the 
;       number of integers in the array, and values of j and k, 
;       respectively. 
; Returns: Nothing
; Requires: Nothing
;---------------------------------------------------------------
    ; preserve the register values
    pushad

    ; set the loop counter to N
    mov ecx, ebx
    ; since ebx served its purpose, 
    ; reuse it (move the array ptr to ebx)
    mov ebx, eax

    ; upper bound, inclusive (+1),
    ; for RandomRange
    inc esi

    ; modify upper bound, esi should
    ; contain 900
    sub esi, edx ; 1000 - 100 = 900
    L1:
        mov eax, esi ; set the upper bound
        call RandomRange ; eax now holds a number between 0 - 901
        add eax, edx ; to make the random number within range
        mov DWORD PTR [ebx], eax
        add ebx, 4 ; next DWORD
        loop L1

    ; pop the register values off the stack
    popad
    ret
fillArray ENDP

end main