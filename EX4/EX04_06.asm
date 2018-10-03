TITLE Symbolic Text Constants            (EX04_06.asm)
INCLUDE Irvine32.inc
.data
school EQU <"Whitworth",0>
major EQU <"Computer Science and Mathematics",0>
I EQU <"Do not know what I am doing",0>
someVar1 BYTE school 
someVar2 BYTE major 
someVar3 BYTE I
.code
main PROC
	exit
main ENDP
END main