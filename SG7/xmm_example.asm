TITLE xmm Example - add many numbers at once - cool!
INCLUDE Irvine32.inc 
.xmm
.data
array1 BYTE 14h, 15h, 16h, 17h, 18h, 19h, 1ah, 1bh, ; decimals from 20 - 36 
            1ch, 1dh, 1eh, 1fh, 20h, 21h, 22h, 23h, 

array2 BYTE 23h, 22h, 21h, 20h, 1fh, 1eh, 1dh, 1ch,
            1bh, 1ah, 19h, 18h, 17h, 16h, 15h, 14h
.code
main PROC 
    movdqa xmm0, XMMWORD PTR array1
    movdqa xmm1, XMMWORD PTR array2
    paddb xmm1, xmm0 ; add the two 16 byte registers, store sum in xmm1
    exit
main ENDP
end