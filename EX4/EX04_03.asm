; 1. Declare a symbolic constant using the equal-sign directive that contains the ASCII code (08h) for the Backspace key
BackspaceKey = 08h 

; 2. Declare a symbolic constant named SecondsInDay using the equal-sign directive and assign it an arithmetic expression that calculates the number of seconds in a 24-hour period.
SecondsInDay = (60 * 60 * 24)

; 3. Write a statement that causes the assembler to calculate the number of bytes in the following array, and assign the value to a symbolic constant named ArraySize:
myArray WORD 20 DUP(?)
ArraySize = ($ - myArray)

; 4. Show how to calculate the number of elements in the following array, and assign the value to a symbolic constant named ArraySize:
myArray DWORD 30 DUP(?)
ArraySize = ($ - myArray) / 4 ; a DWORD is 4 bytes long

; 5. Use a TESTEQU expression to redefine "proc" as "procedure"
procedure TEXTEQU <proc>

; 6. Use TEXTEQU to create a symbol named Sample for a string constant, and then use the symbol when defining a string variable named MyString
Sample TEXTEQU <BYTE>
MyString Sample "This is a string"

; 7. Use TEXTEQU to assign the symbol SetupESI to the following line of code: move esi, OFFSET myArray
SetupESI TEXTEQU <move esi, OFFSET myArray>