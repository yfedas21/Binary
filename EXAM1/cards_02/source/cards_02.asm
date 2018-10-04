TITLE Second Exam Exercise with Cards (cards_02.asm)
; Description: Card Value Program
; Author: Yuriy Fedas
; Honor Statement: I affirm that all code given below was written solely by me, Yuriy, and that any help I received adhered to the rules stated for this exam.
; Date: 10/03/18
INCLUDE Irvine32.inc
TWO = 2
THREE = 3
FOUR = 4
FIVE = 5
SIX = 6
SEVEN = 7 
EIGHT = 8
NINE = 9
TEN = 10
JACK = 11
QUEEN = 12
KING = 13
ACE = 14
.data
cards DWORD ACE, KING, QUEEN, JACK, TEN, NINE, EIGHT, SEVEN, SIX, FIVE, FOUR, THREE, TWO
SUM DWORD 0 ; or if this doesn't work, SUM DWORD ?
NEWLINE DWORD 0Dh, 0Ah,0
.code
main proc
    ; Setup a loop that will run 13 times and output all the DWORD card values
    mov ecx, 13
    mov esi, 0
    label1:
        ; This writes out each DWORD from the array "cards" to the screen
        mov eax,cards[esi*TYPE DWORD]
        call WriteInt
        ; This increments the array index counter
        add sum, eax
        inc esi
    LOOP label1 ; Loop 13 times (based on value in ECX)
    call Crlf ; this darned command writes to the next line
    mov eax, SUM
    call WriteInt

    invoke ExitProcess,0
main endp
end main