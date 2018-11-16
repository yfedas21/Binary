TITLE MASM Illustrate XMM (main.asm)
; Description: Part of the assignment for SG7
; Revision date: 11/15/18
INCLUDE Irvine32.inc
.xmm ; include this line to use xmm functionality
.data
array1 BYTE 00h, 01h, 02h, 03h, 00h, 01h, 02h, 03h
BYTE 00h, 01h, 02h, 03h, 00h, 01h, 02h, 03h
array2 BYTE 16 DUP(02h)
.code
main PROC
    movdqa xmm0, XMMWORD PTR array1
    movdqa xmm1, XMMWORD PTR array2
    pcmpgtb xmm1, xmm0 ; bytes in xmm1 > bytes in xmm0 ? Ans in xmm1
    pcmpeqb xmm3, xmm3 ; create a register of F's
    pxor xmm1, xmm3 ; invert xmm1
    exit
main ENDP
END