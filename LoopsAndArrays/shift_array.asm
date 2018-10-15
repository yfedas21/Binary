TITLE (shift_array.asm)
; This program will take an int array and increment the 
; positions of each value. ie [10,20,30,40] --> [40,10,20,30]
; How to do modulo solution found here: https://stackoverflow.com/questions/8021772/assembly-language-how-to-do-modulo
INCLUDE Irvine32.inc 
.data
intArray BYTE 10h, 20h, 30h, 40h
swapped BYTE SIZEOF intArray DUP(?) ; an array to hold the modified array
.code
main PROC
    mov dx, 0 ; clear register for mod
    mov edi, 0
    mov ax, SIZEOF intArray ; should be 4
    mov ecx, SIZEOF intArray ; number of loop iterations
    mov esi, 1 

    pool:
        mov bx, WORD PTR [esi] ; the number you are modding ie 1 mod 4, bx would be 1
        div bx
        movzx edi, intArray[esi]
        mov [swapped[bx]], BYTE PTR [edi]
        inc esi
        loop pool
    exit
    ; div bx will store remainder in dx 
main ENDP
end main