TITLE Symbolic Constants (EX04_05.asm)
.data
m = 1
t = 2
w = 3
th = 4
f = 5
sa = 6
su = 7
week DWORD m,t,w,th,f,sa,su
.code
MAIN PROC
	mov eax, week
MAIN ENDP
END MAIN