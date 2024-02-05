.model small
.stack 100h
.data
inst1 db "                          INSTRUCTIONS",'$'
inst2 db "                               ",'$'
inst3 db " 1: In the brick breaker game, the player moves a paddle from side to side to hit a BALL.",'$'
inst4 db "                               ",'$'
inst5 db " 2: If the ball hit the bottom ENCLOSURE, the player loses and the game ends!",'$'
inst6 db "                               ",'$'
inst7 db " 3: To win the game, all the BRICKS must be eliminated.",'$'
inst8 db "                               ",'$'
inst9 db " 4: Maximum time is 4 minutes to finish the game.",'$'
inst10 db "                               ",'$'
inst11 db " 5: A player will have maximum 3 lives.",'$'
inst12 db "                               ",'$'
inst13 db "                             GOOD LUCK!",'$'
inst14 db "                               ",'$'
inst15 db "  PRESS ESCAPE TO GO BACK TO MENU",'$'
inst16 db " 6: In the middle of the game press Escape to pause.",'$'

ender1 db "                     Better Luck Next Time  ",'$'
scorer db "score:",'$'
reader1 db " Name                Score           Level",'$'
namelength db 0
Namer db 60 dup (?)
entname db "Enter your name to start the game:",'$'
             
insi0 db "-------------------------------------------------------------------------------",'$'                 
insi1 db "                             ----------------",'$'
insi2 db "                             | 1 = New Game |",'$'
insi3 db "                             ----------------",'$'
insi4 db "         ",'$'
insi5 db "                         ------------------------",'$'
insi6 db "                         | ENTER = Instructions |",'$'
insi7 db "                         ------------------------",'$'
insi8 db "           ",'$'
insi9 db "                            --------------------",'$'
insi10 db "                            | ESCAPE = End Game |",'$'
insi11 db "                            ---------------------",'$'

insi00 db " ",'$'
insi01 db " ",'$'
insi12 db "  ",'$'
insi13 db "                              --------------",'$'
insi14 db "                              | 2 = Scores | ",'$'
insi15 db "                              -------------- ",'$'
insi16 db "                              | 3 = Enter Name |",'$'

levi0 db "                            || || LEVELS || ||",'$'

levi1 db "                             | A. LEVEL 1 |",'$'
levi2 db "                             | B. LEVEL 2 |",'$'
levi3 db "                             | C. LEVEL 3 |",'$'
levi4 db "                              | Esc. Menu |",'$'

win1 db "                       ||||||  YOU  WON!!!!   ||||||         ",'$'
win2 db "                     ||||||  CONGRATULATIONS!  |||||||",'$'


pause_ins db "                      Press 9 to continue",'$'

b1 db 2
b2 db 2
b3 db 2 
b4 db 2
b5 db 2 
b6 db 2 
b7 db 2 
b8 db 2 
b9 db 2
b10 db 0
incrementer dw 1
;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

fhandle dw ?
file_name db 'fister.txt',0
buffer db ?
;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

;************FOR BLOCKS ROW1**************
S3 DW 20
S4 DW 50

S31 DW 20
S41 DW 20

S5 DW 20
S6 DW 20

S51 DW 20
S61 DW 20

S7 DW 20
S8 DW 20

S71 DW 20
S81 DW 20

S9 DW 20
S10 DW 20

S91 DW 20
S101 DW 20

S11 DW 20
S12 DW 20

S111 DW 20
S121 DW 20

;**********************ROW2******************

P1 DW 20
P2 DW 50

P11 DW 20
P21 DW 30

P3 DW 20
P4 DW 30

P31 DW 20
P41 DW 30

P5 DW 20
P6 DW 30

P51 DW 20
P61 DW 30

P7 DW 20
P8 DW 30

P9 DW 20
P10 DW 30

P91 DW 20
P101 DW 30

;*********************ROW3******************

K1 DW 20
K2 DW 40

K11 DW 20
K21 DW 40

K3 DW 20
K4 DW 40

K31 DW 20
K41 DW 40

K5 DW 20
K6 DW 40

K51 DW 20
K61 DW 40

K7 DW 20
K8 DW 40

K71 DW 20
K81 DW 40

K9 DW 20
K10 DW 40

;*************************ROW4***********************
S_1 DW 20
S_2 DW 50

S_3 DW 20
S_4 DW 50

S_5 DW 20
S_6 DW 50

S_7 DW 20
S_8 DW 50

S_9 DW 20
S_10 DW 50

S_11 DW 20
S_12 DW 50

S_13 DW 20
S_14 DW 50

S_15 DW 20
S_16 DW 50

S_17 DW 20
S_18 DW 50

S_19 DW 20
S_20 DW 50

;**********************ROW5****************
P_1 DW 20
P_2 DW 60

P_3 DW 20
P_4 DW 60

P_5 DW 20
P_6 DW 60

P_7 DW 20
P_8 DW 60

P_9 DW 20
P_10 DW 60

P_11 DW 20
P_12 DW 60

P_13 DW 20
P_14 DW 60

P_15 DW 20
P_16 DW 60

P_17 DW 20
P_18 DW 60

;**********************ROW5****************
K_1 DW 20
K_2 DW 70

K_3 DW 20
K_4 DW 70

K_5 DW 20
K_6 DW 70

K_7 DW 20
K_8 DW 70

K_9 DW 20
K_10 DW 70

K_11 DW 20
K_12 DW 70

K_13 DW 20
K_14 DW 70

K_15 DW 20
K_16 DW 70

K_17 DW 20
K_18 DW 70

;*****************ROW6*****************
T_1 DW 20
T_2 DW 80

T_3 DW 20
T_4 DW 80

T_5 DW 20
T_6 DW 80

T_7 DW 20
T_8 DW 80

T_9 DW 20
T_10 DW 80

T_11 DW 20
T_12 DW 80

T_13 DW 20
T_14 DW 80

T_15 DW 20
T_16 DW 80

T_17 DW 20
T_18 DW 80

;*********************ROW8**************
M_1 DW 20
M_2 DW 90

M_3 DW 20
M_4 DW 90

M_5 DW 20
M_6 DW 90

M_7 DW 20
M_8 DW 90

M_9 DW 20
M_10 DW 90

;**********************LASTROW**************
W_1 DW 20
W_2 DW 100

W_3 DW 20
W_4 DW 100

W_5 DW 20
W_6 DW 100

widthw dw 280h
heightw dw 1E0h


ballx dw 140h
bally dw 1B3h

paddlex dw 10Eh
paddley dw 1BDh
paddlew dw 64h
paddleh dw 0Ah

ballsize dw 0Fh


ballspdx dw 0Ah
ballspdy dw 0Ah

ballspdx2 dw 0Fh
ballspdy2 dw 0Fh

score dw 0
lives db 3
paddlespd dw 0AH

timeaux db 0
;...................................................................................
.code

mov ax, @data
mov ds, ax
mov ax, 0

mov ah, 3ch ;service to create a file
lea dx,file_name
mov cl, 0
int 21h
mov fhandle,ax

mov ah, 3eh
mov bx,fhandle
int 21h

mov ah,00h
mov al,12h
int 10h 

call _Menu
call End_G
main proc





call cls
mov ah, 02h
    mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 5 ;Column Number 
    int 10h

	mov al,03H    ;FOR PRINTING b
mov bl,04h    ;color
MOV CX,1 
mov ah,09h
int 10h

mov ah, 02h
    mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 4 ;Column Number 
    int 10h

	mov al,03H    ;FOR PRINTING b
mov bl,04h    ;color
MOV CX,1 
mov ah,09h
int 10h

mov ah, 02h
    mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 3 ;Column Number 
    int 10h

	mov al,03H    ;FOR PRINTING b
mov bl,04h    ;color
MOV CX,1 
mov ah,09h
int 10h





call brickyproc
call sounder

chktime:



mov ah, 2Ch
int 21h
cmp dl, timeaux
JE chktime
mov timeaux,dl


.if lives<=0
call ender
mov lives, 3
.elseif
call chkwin
call removetrace

call movepaddle
call moveball



call ball
call paddle

call collision

.endif

jmp chktime
RET
main endp
;---------------------------------------------------


ball proc
mov cx, ballx
mov dx, bally


drawx:
mov ah, 0Ch
mov al, 0Fh
mov bh, 00h
int 10h
inc cx

mov ax, cx
sub ax, ballx
cmp ax, ballsize
JB drawx

mov cx, ballx
inc dx
mov ax,dx
sub ax, bally
cmp ax, ballsize
JB drawx



RET
ball endp





;---------------------------------------------------


paddle proc
mov cx, paddlex
mov dx, paddley


drawpx:
mov ah, 0Ch
mov al, 0Fh
mov bh, 00h
int 10h
inc cx

mov ax, cx
sub ax, paddlex
cmp ax, paddlew
JB drawpx

mov cx, paddlex
inc dx
mov ax,dx
sub ax, paddley
cmp ax, paddleh
JB drawpx



RET
paddle endp
;--------------------------------------------------
removetrace proc
mov cx, ballx
mov dx, bally



drawx:
mov ah, 0Ch
mov al, 00h
mov bh, 00h
int 10h
inc cx

mov ax, cx
sub ax, ballx
cmp ax, ballsize
JB drawx

mov cx, ballx
inc dx
mov ax,dx
sub ax, bally
cmp ax, ballsize
JB drawx


mov cx, paddlex
mov dx, paddley


drawpx:
mov ah, 0Ch
mov al, 00h
mov bh, 00h
int 10h
inc cx

mov ax, cx
sub ax, paddlex
cmp ax, paddlew
JB drawpx

mov cx, paddlex
inc dx
mov ax,dx
sub ax, paddley
cmp ax, paddleh
JB drawpx


RET
removetrace endp



level2 proc
mov ballspdx, 0Fh
mov ballspdy, 0Fh
mov paddlew ,3Ch
mov incrementer,5

mov b1, 1
mov b2, 1
mov b3, 1
mov b4, 1
mov b5, 1
mov b6, 1
mov b7, 1
mov b8, 1
mov b9, 1
RET
level2 endp


level3 proc
mov ballspdx, 10h
mov ballspdy, 10h
mov paddlew , 28h

mov incrementer,10
mov b1, 0
mov b2, 0
mov b3, 0
mov b4, 0
mov b5, 0
mov b6, 0
mov b7, 0
mov b8, 0
mov b9, 0

mov b10, 3

RET
level3 endp



;-------------------------------------------------------

cls proc
mov ah, 0
mov al, 12h    ;320x200
int 10h

MOV AH, 06H
MOV AL, 0h
MOV BH, 00H;BG color
MOV CX,0
MOV DX, 7000 
INT 10H

RET
cls endp
;-----------------------------------------------
moveball proc

mov ax, ballspdx
sub ballx,ax 



mov ax, widthw
sub ax, 19
cmp ballx,ax
JA revspdx 


mov ax, ballspdy
sub bally,ax

mov ax, 1E0h
sub ax, 19
cmp bally, ax
JA reset

mov ax, 0
add ax, 8
cmp bally, ax
JB revspdy


mov ax, bally
add ax, ballsize
cmp ax, paddley
JNG chkcollision

mov ax, paddley
add ax, paddleh
cmp bally, ax
JNL chkcollision

mov ax, ballx
add ax, ballsize
cmp ax, paddlex
JNG chkcollision

mov ax, paddlex
add ax, paddlew
cmp ballx, ax
JNL chkcollision

NEG ballspdy
call sounder
RET


chkcollision:

RET

revspdx:
NEG ballspdx
call sounder
RET

revspdy:
NEG ballspdy
call sounder
RET

reset:
mov ballx, 140h
mov bally, 1B3h
mov paddlex, 140h-60

.if lives==3
mov ah, 02h
    mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 3 ;Column Number 
    int 10h

	mov al,03H    ;FOR PRINTING b
mov bl,00h    ;color
MOV CX,1 
mov ah,09h
int 10h
.ENDIF
.if lives==2
mov ah, 02h
	mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 4 ;Column Number 
    int 10h

	mov al,03H    ;FOR PRINTING b
mov bl,00h    ;color
MOV CX,1 
mov ah,09h
int 10h
.ENDIF
.if lives==1
mov ah, 02h
	mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 5 ;Column Number 
    int 10h

	mov al,03H    ;FOR PRINTING b
mov bl,00h    ;color
MOV CX,1 
mov ah,09h
int 10h

.endif


dec lives

NEG ballspdx
NEG ballspdy

call sounder
RET

moveball endp

;------------------------------------------------------

movepaddle proc
mov ah,01h
int 16h
jz niga


mov ah,0
int 16h

cmp ah, 4Bh
je movleft
cmp ah, 4Dh
je movright

cmp ah, 1
je pauser







movright:
mov ax, paddlespd
add paddlex, ax

mov ax, widthw
sub ax, paddlew
dec ax
cmp paddlex, ax
JA subx

jmp niga

movleft:
mov ax, paddlespd
sub paddlex, ax

mov ax, 01h
cmp paddlex, ax
JB addx

niga:

RET 

addx:
mov ax, paddlespd
add paddlex, ax

RET

subx:
mov ax, paddlespd
sub paddlex, ax

RET

movepaddle endp

;-----------------------------------------------------------

collision proc










call collision2
call collision3
call collision4 
call collision5
call collision6
call collision7
call collision8
call collision9
call collision10
RET
collision endp


collision2 proc

cmp b1, 3
JE exit1
.if ballx>=45
call chkx
.endif
RET

chkx:
.if ballx<=105
call chky
.endif
RET

chky:
.if bally<=100





NEG ballspdy
NEG ballspdx

add b1, 1

.if b10==3
dec b1
.endif

mov ah, 02h
    mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 50 ;Column Number 
    int 10h

lea dx,scorer
mov ah,09h
int 21h

mov ax, incrementer
add score, ax
mov ah, 02h
    mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 58 ;Column Number 
    int 10h

	push score
	call printmultidigitnumber
call sounder
.endif
RET



exit1:
mov cx, 45
mov dx, 40


drawp:
mov ah, 0Ch
mov al, 00h
mov bh, 00h
int 10h
inc cx

mov ax, cx
sub ax, 45
cmp ax, 60
JB drawp

mov cx, 45
inc dx
mov ax,dx
sub ax, 40
cmp ax, 20
JB drawp
RET
collision2 endp



collision3 proc

cmp b2, 3
JE exit1
.if ballx>=185
call chkx
.endif
RET

chkx:
.if ballx<=245
call chky
.endif
RET

chky:
.if bally<=60

NEG ballspdy
NEG ballspdx
add b2, 1
mov ax, incrementer
add score, ax
mov ah, 02h
    mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 58 ;Column Number 
    int 10h

	push score
	call printmultidigitnumber
call sounder
.endif
RET



exit1:
mov cx, 185
mov dx, 40


drawp:
mov ah, 0Ch
mov al, 00h
mov bh, 00h
int 10h
inc cx

mov ax, cx
sub ax, 165
cmp ax, 60
JB drawp

mov cx, 165
inc dx
mov ax,dx
sub ax, 40
cmp ax, 20
JB drawp
RET
collision3 endp


collision4 proc

cmp b3, 3
JE exit1
.if ballx>=285
call chkx
.endif
RET

chkx:
.if ballx<=345
call chky
.endif
RET

chky:
.if bally<=60

NEG ballspdy
NEG ballspdx
add b3, 1
mov ax, incrementer
add score, ax 
mov ah, 02h
    mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 58 ;Column Number 
    int 10h

	push score
	call printmultidigitnumber
call sounder
.endif
RET



exit1:

mov cx, 285
mov dx, 40


drawp:
mov ah, 0Ch
mov al, 00h
mov bh, 00h
int 10h
inc cx

mov ax, cx
sub ax, 285
cmp ax, 60
JB drawp

mov cx, 285
inc dx
mov ax,dx
sub ax, 40
cmp ax, 20
JB drawp
RET
collision4 endp



collision5 proc

cmp b4, 3
JE exit1
.if ballx>=405
call chkx
.endif
RET

chkx:
.if ballx<=465
call chky
.endif
RET

chky:
.if bally<=60


NEG ballspdy
NEG ballspdx
add b4, 1
mov ax, incrementer
add score, ax
mov ah, 02h
    mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 58 ;Column Number 
    int 10h

	push score
	call printmultidigitnumber
call sounder
.endif
RET



exit1:
mov cx, 405
mov dx, 40


drawp:
mov ah, 0Ch
mov al, 00h
mov bh, 00h
int 10h
inc cx

mov ax, cx
sub ax, 405
cmp ax, 60
JB drawp

mov cx, 405
inc dx
mov ax,dx
sub ax, 40
cmp ax, 20
JB drawp
RET
collision5 endp






collision6 proc

cmp b5, 3
JE exit1
.if ballx>=525
call chkx
.endif
RET

chkx:
.if ballx<=585
call chky
.endif
RET

chky:
.if bally<=60

NEG ballspdy
NEG ballspdx
add b5, 1
mov ax, incrementer
add score, ax
mov ah, 02h
    mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 58 ;Column Number 
    int 10h

	push score
	call printmultidigitnumber
call sounder
.endif
RET



exit1:

mov cx, 525
mov dx, 40


drawp:
mov ah, 0Ch
mov al, 00h
mov bh, 00h
int 10h
inc cx

mov ax, cx
sub ax, 525
cmp ax, 60
JB drawp

mov cx, 525
inc dx
mov ax,dx
sub ax, 40
cmp ax, 20
JB drawp
RET
collision6 endp

collision7 proc

cmp b6, 3
JE exit1
.if ballx>=105
call chkx
.endif
RET

chkx:
.if ballx<=165
call chky
.endif
RET

chky:
.if bally<=120
call chky2
.endif
RET

chky2:
.if bally>=100





NEG ballspdy
NEG ballspdx
add b6, 1
mov ax, incrementer
add score, ax 
mov ah, 02h
    mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 58 ;Column Number 
    int 10h

	push score
	call printmultidigitnumber
call sounder
.endif
RET



exit1:


mov cx, 105
mov dx, 100


drawp:
mov ah, 0Ch
mov al, 00h
mov bh, 00h
int 10h
inc cx

mov ax, cx
sub ax, 105
cmp ax, 60
JB drawp

mov cx, 105
inc dx
mov ax,dx
sub ax, 100
cmp ax, 20
JB drawp


RET
collision7 endp

collision8 proc

cmp b7, 3
JE exit1
.if ballx>=225
call chkx
.endif
RET

chkx:
.if ballx<=285
call chky
.endif
RET

chky:
.if bally<=120
call chky2
.endif
RET

chky2:
.if bally>=100


NEG ballspdy
NEG ballspdx
add b7, 1
mov ax, incrementer
add score, ax
mov ah, 02h
    mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 58 ;Column Number 
    int 10h

	push score
	call printmultidigitnumber
call sounder
.endif
RET



exit1:

mov cx, 225
mov dx, 100


drawp:
mov ah, 0Ch
mov al, 00h
mov bh, 00h
int 10h
inc cx

mov ax, cx
sub ax, 225
cmp ax, 60
JB drawp

mov cx, 225
inc dx
mov ax,dx
sub ax, 100
cmp ax, 20
JB drawp
RET
collision8 endp


collision9 proc

cmp b8, 3
JE exit1
.if ballx>=345
call chkx
.endif
RET

chkx:
.if ballx<=405
call chky
.endif
RET

chky:
.if bally<=120
call chky2
.endif
RET

chky2:
.if bally>=100


NEG ballspdy
NEG ballspdx
add b8, 1
mov ax, incrementer
add score, ax
mov ah, 02h
    mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 58 ;Column Number 
    int 10h

	push score
	call printmultidigitnumber
call sounder
.endif
RET



exit1:

mov cx, 345
mov dx, 100

drawp:
mov ah, 0Ch
mov al, 00h
mov bh, 00h
int 10h
inc cx

mov ax, cx
sub ax, 345
cmp ax, 60
JB drawp

mov cx, 345
inc dx
mov ax,dx
sub ax, 100
cmp ax, 20
JB drawp
RET
collision9 endp

collision10 proc

cmp b9, 3
JE exit1
.if ballx>=465
call chkx
.endif
RET

chkx:
.if ballx<=525
call chky
.endif
RET

chky:
.if bally<=120
call chky2
.endif
RET

chky2:
.if bally>=100


NEG ballspdy
NEG ballspdx
add b9, 1
mov ax, incrementer
add score, ax
mov ah, 02h
    mov bh, 0
    mov dh, 1 ;Row Number 
    mov dl, 58 ;Column Number 
    int 10h

	push score
	call printmultidigitnumber
call sounder
.endif
RET



exit1:

mov cx, 465
mov dx, 100


drawp:
mov ah, 0Ch
mov al, 00h
mov bh, 00h
int 10h
inc cx

mov ax, cx
sub ax, 465
cmp ax, 60
JB drawp

mov cx, 465
inc dx
mov ax,dx
sub ax, 100
cmp ax, 20
JB drawp
RET
collision10 endp

;-----------

brickyproc proc


MOV S4,40
MOV S41,40
MOV S6,40
MOV S61,40
MOV S8,40
MOV S10,40
MOV S12,40
MOV P2,60
MOV P4,60
MOV P6,60
MOV P8,60
MOV P10,60
MOV K2, 80
MOV K4,80
MOV K6,80
MOV K8,80
MOV K10,80
MOV S61,40
MOV S81,40
MOV S101,40
MOV S121,40
MOV P21,60
MOV P41,60
MOV P61,60
MOV P101,60
MOV K21,80
MOV K41,80
MOV K61,80
MOV K81,80
MOV S_2,100
MOV S_4,100
MOV S_6,100
MOV S_8,100
MOV S_10,100
MOV S_12,100
MOV S_14,100
MOV S_16,100
MOV S_18,100
MOV S_20,100
MOV P_2,120
MOV P_4,120
MOV P_6,120
MOV P_8,120
MOV P_10,120
MOV P_12,120
MOV P_14,120
MOV P_16,120
MOV P_18,120
MOV K_2,140
MOV K_4,140
MOV K_6,140
MOV K_8,140
MOV K_10,140
MOV K_12,140
MOV K_14,140
MOV K_16,140
MOV K_18,140
MOV T_2,160
MOV T_4,160
MOV T_6,160
MOV T_8,160
MOV T_10,160
MOV T_12,160
MOV T_14,160
MOV T_16,160
MOV T_18,160
MOV M_2,180
MOV M_4,180
MOV M_6,180
MOV M_8,180
MOV M_10,180
MOV W_2,200
MOV W_4,200
MOV W_6,200

;**************other boxes ROW1**************

LOOP1:
	MOV S3,30 +15 ; for placement about x axis
	MOV BX,0

L11:
	MOV AH,0Ch
	MOV AL,0Eh   ; purple
	MOV CX,S3
	MOV DX,S4
	INT 10h

	INC S3
	INC BX
	CMP BX,60 ; for width
	JE LOOP2
	JNE L11

	LOOP2:
	INC S4
	CMP S4,60 ; for height
	JNE LOOP1

	;****************************************

	LOP1:
	MOV S31,90+15  ; for placement about x axis
	MOV BX,0

LO11:
	MOV AH,0Ch
	MOV AL,00h  ; purple
	MOV CX,S31
	MOV DX,S41
	INT 10h

	INC S31
	INC BX
	CMP BX,60 ; for width
	JE LOP2
	JNE LO11

	LOP2:
	INC S41
	CMP S41,60 ; for height
	JNE LOP1

	;******************************************

	LOOPP1:
	MOV S5,150+15  ; for placement about x axis
	MOV BX,0

L11P:
	MOV AH,0Ch
	MOV AL,03h  ; Green
	MOV CX,S5
	MOV DX,S6
	INT 10h

	INC S5
	INC BX
	CMP BX,60 ; for width
	JE LOOPP2
	JNE L11P

	LOOPP2:
	INC S6
	CMP S6,60 ; for height
	JNE LOOPP1

	;**************************************

	;*****************************************

	LOOPPP1:  
	MOV S7,210 +15 ; for placement about x axis
	MOV BX,0

L11PP:
	MOV AH,0Ch
	MOV AL,00h  ; YELLOW
	MOV CX,S7
	MOV DX,S8
	INT 10h

	INC S7
	INC BX
	CMP BX,60 ; for width
	JE LOOPPP2
	JNE L11PP

	LOOPPP2:
	INC S8
	CMP S8,60 ; for height
	JNE LOOPPP1

	;************************************

	L_OPPP1:  
	MOV S71,270+15  ; for placement about x axis
	MOV BX,0

L_11PP:
	MOV AH,0Ch
		MOV AL,0Eh   ; YELLOW
	MOV CX,S71
	MOV DX,S81
	INT 10h

	INC S71
	INC BX
	CMP BX,60 ; for width
	JE L_OPPP2
	JNE L_11PP

	L_OPPP2:
	INC S81
	CMP S81,60 ; for height
	JNE L_OPPP1

	;************************************

	LOOPPP11:  
	MOV S9,330+15  ; for placement about x axis
	MOV BX,0

L111PP:
	MOV AH,0Ch
	MOV AL,00h  ; BLUE
	MOV CX,S9
	MOV DX,S10
	INT 10h

	INC S9
	INC BX
	CMP BX,60 ; for width
	JE LOOPPP21
	JNE L111PP

	LOOPPP21:
	INC S10
	CMP S10,60 ; for height
	JNE LOOPPP11

	;***********************************

	L___1:  
	MOV S91, 390 +15 ; for placement about x axis
	MOV BX,0

    L___11:
	MOV AH,0Ch
	MOV AL,0001h  ; GREEN
	MOV CX,S91
	MOV DX,S101
	INT 10h

	INC S91
	INC BX
	CMP BX,60 ; for width
	JE L___2
	JNE L___11

	L___2:
	INC S101
	CMP S101,60 ; for height
	JNE L___1

	;************************************

	L__1:  
	MOV S11, 450 +15 ; for placement about x axis
	MOV BX,0

    L__11:
	MOV AH,0Ch
	MOV AL,00h  ; GREEN
	MOV CX,S11
	MOV DX,S12
	INT 10h

	INC S11
	INC BX
	CMP BX,60 ; for width
	JE L__2
	JNE L__11

	L__2:
	INC S12
	CMP S12,60 ; for height
	JNE L__1

	;***************************************

	L__01:  
	MOV S111, 510+15  ; for placement about x axis
	MOV BX,0

    L__011:
	MOV AH,0Ch
	MOV AL,03h  ; BLUE
	MOV CX,S111
	MOV DX,S121
	INT 10h

	INC S111
	INC BX
	CMP BX,60 ; for width
	JE L__02
	JNE L__011

	L__02:
	INC S121
	CMP S121,60 ; for height
	JNE L__01

	
		;************************ROW4***********************

	L410:  
	MOV S_1,30 +15 ; for placement about x axis
	MOV BX,0

    L411:
	MOV AH,0Ch
	MOV AL,0000h  ; BLUE
	MOV CX,S_1
	MOV DX,S_2
	INT 10h

	INC S_1
	INC BX
	CMP BX,60 ; for width
	JE L42
	JNE L411

	L42:
	INC S_2
	CMP S_2,120 ; for height
	JNE L410

	;******************************************

	L4100:  
	MOV S_3,90 +15 ; for placement about x axis
	MOV BX,0

    L4110:
	MOV AH,0Ch
	MOV AL,0Ah  ; GREEN
	MOV CX,S_3
	MOV DX,S_4
	INT 10h

	INC S_3
	INC BX
	CMP BX,60 ; for width
	JE L420
	JNE L4110

	L420:
	INC S_4
	CMP S_4,120 ; for height
	JNE L4100

	;******************************************

	L41000:  
	MOV S_5,150+15  ; for placement about x axis
	MOV BX,0

    L41100:
	MOV AH,0Ch
	MOV AL,00h  ; PURPLE
	MOV CX,S_5
	MOV DX,S_6
	INT 10h

	INC S_5
	INC BX
	CMP BX,60 ; for width
	JE L4200
	JNE L41100

	L4200:
	INC S_6
	CMP S_6,120 ; for height
	JNE L41000

	;******************************************

	L410000:  
	MOV S_7,210+15  ; for placement about x axis
	MOV BX,0

    L411000:
	MOV AH,0Ch
	MOV AL,0Fh  ;BLACK
	MOV CX,S_7
	MOV DX,S_8
	INT 10h

	INC S_7
	INC BX
	CMP BX,60 ; for width
	JE L42000
	JNE L411000

	L42000:
	INC S_8
	CMP S_8,120 ; for height
	JNE L410000

	;***************************************

	L4100000:  
	MOV S_9,270+15  ; for placement about x axis
	MOV BX,0

    L4110000:
	MOV AH,0Ch
	MOV AL,00h  ; YELLOW
	MOV CX,S_9
	MOV DX,S_10
	INT 10h

	INC S_9
	INC BX
	CMP BX,60 ; for width
	JE L420000
	JNE L4110000

	L420000:
	INC S_10
	CMP S_10,120 ; for height
	JNE L4100000

	;***************************************
	L41000000:  
	MOV S_11,330 +15 ; for placement about x axis
	MOV BX,0

    L41100000:
	MOV AH,0Ch
	MOV AL,03h  ; BLUE
	MOV CX,S_11
	MOV DX,S_12
	INT 10h

	INC S_11
	INC BX
	CMP BX,60 ; for width
	JE L4200000
	JNE L41100000

	L4200000:
	INC S_12
	CMP S_12,120 ; for height
	JNE L41000000

	;*********************************
	L410000000:  
	MOV S_13,330 +15 ; for placement about x axis
	MOV BX,0

    L411000000:
	MOV AH,0Ch
	MOV AL,00h  ; BLUE
	MOV CX,S_13
	MOV DX,S_14
	INT 10h

	INC S_13
	INC BX
	CMP BX,60 ; for width
	JE L42000000
	JNE L411000000

	L42000000:
	INC S_14
	CMP S_14,120 ; for height
	JNE L410000000

	;*************************************

	L4100000000:  
	MOV S_15,390 +15 ; for placement about x axis
	MOV BX,0

    L4110000000:
	MOV AH,0Ch
	MOV AL,00h  ; PURPLE
	MOV CX,S_15
	MOV DX,S_16
	INT 10h

	INC S_15
	INC BX
	CMP BX,60 ; for width
	JE L420000000
	JNE L4110000000

	L420000000:
	INC S_16
	CMP S_16,120 ; for height
	JNE L4100000000

	;*************************************

	L41000000000:  
	MOV S_17,450 +15 ; for placement about x axis
	MOV BX,0

    L41100000000:
	MOV AH,0Ch
	MOV AL,03h  ;BLACK
	MOV CX,S_17
	MOV DX,S_18
	INT 10h

	INC S_17
	INC BX
	CMP BX,60 ; for width
	JE L4200000000
	JNE L41100000000

	L4200000000:
	INC S_18
	CMP S_18,120 ; for height
	JNE L41000000000

	;*********************************

	L410000000000:  
	MOV S_19,510 +15 ; for placement about x axis
	MOV BX,0

    L411000000000:
	MOV AH,0Ch
	MOV AL,00h  ; YELLOW
	MOV CX,S_19
	MOV DX,S_20
	INT 10h

	INC S_19
	INC BX
	CMP BX,60 ; for width
	JE L42000000000
	JNE L411000000000

	L42000000000:
	INC S_20
	CMP S_20,120 ; for height
	JNE L410000000000

	mov cx, 345
mov dx, 100


drawpx:
mov ah, 0Ch
mov al, 0Ch
mov bh, 00h
int 10h
inc cx

mov ax, cx
sub ax, 345
cmp ax, 60
JB drawpx

mov cx, 345
inc dx
mov ax,dx
sub ax, 100
cmp ax, 20
JB drawpx



	exit:

		RET
brickyproc endp

pausee proc
mov cx,10000


pausee endp

sounder PROC 

        mov     al, 182        ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax, 940       ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 35         ; Pause for duration of note.
pauser_break1:
        mov     cx, 1000
pauser_break2:
        dec     cx
        jne     pauser_break2
        dec     bx
        jne     pauser_break1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 10001100b   ; Reset bits 1 and 0.
        out     61h, al 

RET
sounder ENDP


;-------------------------------------------------------

pauser proc






mov ah,00h
mov al,12h
int 10h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


lea dx,pause_ins
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


check214:
mov ah,01h
int 16h

mov ah,00h
int 16h
.if al==65
call sounder
RET
.elseif al==57
jmp exit

.endif
jmp check214









exit:
call main
ret

pauser endp





levelprocy proc

mov ah,00h
mov al,12h
int 10h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi13
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,levi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi13
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi1
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,levi1
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi1
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi1
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,levi2
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi1
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi1
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,levi3
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi1
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi13
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,levi4
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi13
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

check212:
mov ah,01h
int 16h

mov ah,00h
int 16h
.if al==65
call sounder
call main
.elseif al==66
call sounder
call level2
call main

.elseif al==67
call sounder
call level3
call main

.elseif al==27
call sounder
call _Menu
.endif
jmp check212

ret



levelprocy endp



printmultidigitnumber PROC uses ax bx cx dx bp
    mov bp,sp

    mov ax, [bp + 12]
    mov bx, 10
    mov cx, 0

    PUSHINTOSTACK:
        cmp ax,0
        je POPFROMSTACK

        inc cx
        mov dx,0
        div bx
        push dx
        jmp PUSHINTOSTACK

    POPFROMSTACK:
        cmp cx,0
        je COMPLETELYPOPED

        dec cx
        pop dx
        add dx,'0'
        mov ah,02h
        int 21h
        jmp POPFROMSTACK

    COMPLETELYPOPED:
        ret 2
printmultidigitnumber ENDP









ender proc 

mov ah,00h
mov al,12h
int 10h

check216:
mov ah,01h
int 16h

mov ah,00h
mov al,12h
int 10h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,ender1
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,score
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,levi4
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

mov ah,00h
int 16h
.if al==27
call sounder
call _Menu
.endif

jmp check216

mov lives, 3
ret

ender endp



chkwin proc
.if b1==3
call chkb2
.endif
ret

chkb2:
.if b2==3
call chkb3
.endif
ret

chkb3:
.if b3==3
call chkb4
.endif
ret

chkb4:
.if b4==3
call chkb5
.endif
ret

chkb5:
.if b5==3
call chkb6
.endif
ret

chkb6:
.if b6==3
call chkb7
.endif
ret

chkb7:
.if b7==3
call chkb8
.endif
ret

chkb8:
.if b8==3
call chkb9
.endif
ret

chkb9:
.if b9==3
call winprocy
.endif
ret

RET
chkwin endp


winprocy proc

mov ah,00h
mov al,12h
int 10h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,win1
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,win2
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,levi4
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

check213:
mov ah,01h
int 16h

mov ah,00h
int 16h
.if al==27
call sounder
call _Menu
.endif

jmp check213
ret


winprocy endp



readfile proc 

mov ah,00h
mov al,12h
int 10h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,reader1
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


;mov ah,3dh ; 3dh of dos services opens a file.
;mov al,0 ; 0 - for reading. 1 - for writing. 2 - both
;mov dx,offset filename ; make a pointer to the filename
;int 21h ; call dos
;mov handle,ax ; function 3dh returns the file handle in ax, here we save it for later use.

;mov ah,3fh
;mov cx,65 ;cx is how many bytes to read.
;mov dx,offset buffer ; dos functions like dx having pointers for some reason.
;mov bx,handle ; bx needs the file handle.
;int 21h ; call dos

;mov ah, 3eh ;service to close file.
;mov bx, filehandler
;int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi13
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,levi4
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi13
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


check223:
mov ah,01h
int 16h

mov ah,00h
int 16h
.if al==27
call sounder
call _Menu
.endif

jmp check223
ret

readfile endp




nameproc proc



mov ah,00h
mov al,12h
int 10h 

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,entname
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h



mov di,0
	mov di,offset Namer
	l1:
	mov cx, 2
	mov ah, 01h 		
	int 21h
	cmp al,0dh		
	je helpme
	mov [di], al
	inc di
	inc namelength
	jmp l1

	helpme:
	mov di,0

	check221:
mov ah,01h
int 16h

mov ah,00h
int 16h
.if al==13

mov ah,3dh ; 3dh of dos services opens a file.
mov al,1 ; 0 - for reading. 1 - for writing. 2 - both
lea dx,file_name ; make a pointer to the filename
int 21h ; call dos
mov fhandle,ax ; function 3dh returns the file handle in ax, here we save it for later use.

mov ah,40h
mov bx,fhandle
lea dx, Namer
mov cx, 10
int 21h

call sounder
call levelprocy
.endif

jmp check221

	ret
nameproc endp

_Menu proc


mov ah,00h
mov al,12h
int 10h 

mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 25     ; FOR DEFINING COLUMNS 
int 10h

mov al,'|'    ;FOR PRINTING b
mov bl,06h    ;color
MOV CX,1 
mov ah,09h
int 10h

mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 25     ; FOR DEFINING COLUMNS 
int 10h

mov al,'|'    ;FOR PRINTING b
mov bl,06h    ;color
MOV CX,1 
mov ah,09h
int 10h

mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 25     ; FOR DEFINING COLUMNS 
int 10h


mov al,'|'    ;FOR PRINTING b
mov bl,06h    ;color
MOV CX,1 
mov ah,09h
int 10h


mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 47    ; FOR DEFINING COLUMNS 
int 10h

mov al,'|'    ;FOR PRINTING b
mov bl,06h    ;color
MOV CX,1 
mov ah,09h
int 10h

mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 47     ; FOR DEFINING COLUMNS 
int 10h

mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 46    ; FOR DEFINING COLUMNS 
int 10h

mov al,'|'    ;FOR PRINTING b
mov bl,06h    ;color
MOV CX,1 
mov ah,09h
int 10h

mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 47    ; FOR DEFINING COLUMNS 
int 10h

mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 30     ; FOR DEFINING COLUMNS 
int 10h

mov al,'B'    ;FOR PRINTING b
mov bl,04h    ;color
MOV CX,1 
mov ah,09h
int 10h

mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 31     ; FOR DEFINING COLUMNS 
int 10h

mov al,'R'    ;FOR PRINTING r
mov bl,0Ah   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 32     ; FOR DEFINING COLUMNS 
int 10h

mov al,'I'    ;FOR PRINTING i
mov bl,04h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,2  ;FOR DEFINING ROWS 
mov dl, 33     ; FOR DEFINING COLUMNS 
int 10h

mov al,'C'    ;FOR PRINTING i
mov bl,0Ah   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,2  ;FOR DEFINING ROWS 
mov dl, 34     ; FOR DEFINING COLUMNS 
int 10h

mov al,'K'    ;FOR PRINTING i
mov bl,04h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 35     ; FOR DEFINING COLUMNS 
int 10h

mov al,' '    ;FOR PRINTING i
mov bl,0Ah   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 36    ; FOR DEFINING COLUMNS 
int 10h

mov al,' '    ;FOR PRINTING i
mov bl,04h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 37     ; FOR DEFINING COLUMNS 
int 10h

mov al,'B'    ;FOR PRINTING i
mov bl,0Ah   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 38    ; FOR DEFINING COLUMNS 
int 10h

mov al,'R'    ;FOR PRINTING i
mov bl,04h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 39     ; FOR DEFINING COLUMNS 
int 10h

mov al,'E'    ;FOR PRINTING i
mov bl,0Ah   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 40     ; FOR DEFINING COLUMNS 
int 10h

mov al,'A'    ;FOR PRINTING i
mov bl,04h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 41     ; FOR DEFINING COLUMNS 
int 10h

mov al,'K'    ;FOR PRINTING i
mov bl,0Ah   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 42     ; FOR DEFINING COLUMNS 
int 10h

mov al,'E'    ;FOR PRINTING i
mov bl,04h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,2   ;FOR DEFINING ROWS 
mov dl, 43    ; FOR DEFINING COLUMNS 
int 10h

mov al,'R'    ;FOR PRINTING i
mov bl,0Ah   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,2  ;FOR DEFINING ROWS 
mov dl, 44     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 27     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 27     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 28     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 28     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 29     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 29     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 30     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 30     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 31     ; FOR DEFINING COLUMNS 
int 10h





mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 31     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 32    ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 32     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 33     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 33     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 34     ; FOR DEFINING COLUMNS 
int 10h


mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 34     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 35     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 35     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 36     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 36     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 37     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 37     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 38     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 38     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 39     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 39     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 40     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 40     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 41     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 41     ; FOR DEFINING COLUMNS 
int 10h ;FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 42     ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 42    ; FOR DEFINING COLUMNS 
int 10h


mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 43    ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 43    ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 44    ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 44    ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,1   ;FOR DEFINING ROWS 
mov dl, 45   ; FOR DEFINING COLUMNS 
int 10h

mov al,'_'    ;FOR PRINTING i
mov bl,06h   
MOV CX,1 
mov ah,09h
int 10h
mov ah, 2
mov dh,3   ;FOR DEFINING ROWS 
mov dl, 45   ; FOR DEFINING COLUMNS 
int 10h




;;;;;likhana

lea dx,insi13
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi13
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h



lea dx,insi13
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


lea dx,insi1
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi2
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi3
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


lea dx,insi4
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


lea dx,insi13
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi14
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi15
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi4
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi5
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi6
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


lea dx,insi7
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h



lea dx,insi9
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi10
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi11
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi12
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h


lea dx,insi13
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi0
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h






;------------------------ 
check:
mov ah,01h
int 16h

mov ah,00h
int 16h
.if al==13
call sounder
call Inst
.elseif al==27
call sounder
call End_G
.elseif al==49
call sounder
call nameproc
.elseif al==50
call sounder
call readfile
.elseif al==51
call sounder
call nameproc
.endif
jmp check
ret
_Menu endp





Inst proc
mov ah,00h
mov al,12h
int 10h

lea dx,inst1
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,inst2
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,inst3
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,inst4
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,inst5
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,inst6
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,inst7
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,inst8
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,inst9
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,inst10
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,inst11
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,insi00
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,inst16
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,inst12
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,inst13
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,inst14
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

lea dx,inst15
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h






check1:
mov ah,01h
int 16h

mov ah,00h
int 16h
.if al==27
call sounder
call _Menu
.endif
jmp check1

ret
Inst endp

End_G proc
exit:
mov ah,04ch
int 21h
End_G ENDp
end





;------------------------------------------------------------

























mov ah, 4ch
int 21h
end
