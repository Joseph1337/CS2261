	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #100663296
	ldr	r4, .L4
	mov	r0, #3
	ldr	r3, .L4+4
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	6128
	.word	bgTiles
	.word	100720640
	.word	bgMap
	.word	bgPal
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #4352
	mov	r1, #56320
	mov	r2, #0
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r0, .L7
	ldr	r1, .L7+4
	ldrh	r0, [r0, #48]
	ldr	r3, .L7+8
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L12:
	.align	2
.L11:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #2752
	ldr	r4, .L15
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L15+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L15+8
	ldr	r1, .L15+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L15+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L15+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L16:
	.align	2
.L15:
	.word	DMANow
	.word	gameBgTiles
	.word	100720640
	.word	gameBgMap
	.word	gameBgPal
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	start.part.0, %function
start.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L23
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	bl	goToGame
	ldr	r3, .L23+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	buttons
	.word	initGame
	.size	start.part.0, .-start.part.0
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L27
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	start.part.0
.L28:
	.align	2
.L27:
	.word	oldButtons
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L31
	mov	lr, pc
	bx	r3
	ldr	r4, .L31+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L31+8
	mov	lr, pc
	bx	r4
	mov	r3, #208
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L31+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L31+16
	ldr	r1, .L31+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L31+24
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L31+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L32:
	.align	2
.L31:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	pausedbgTiles
	.word	100720640
	.word	pausedbgMap
	.word	pausedbgPal
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L45
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L34
	ldr	r2, .L45+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L43
.L34:
	tst	r3, #4
	beq	.L33
	ldr	r3, .L45+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L44
.L33:
	pop	{r4, lr}
	bx	lr
.L44:
	pop	{r4, lr}
	b	goToStart
.L43:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L34
.L46:
	.align	2
.L45:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L49
	mov	lr, pc
	bx	r3
	ldr	r4, .L49+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L49+8
	mov	lr, pc
	bx	r4
	mov	r3, #128
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L49+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L49+16
	ldr	r1, .L49+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L49+24
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L49+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L50:
	.align	2
.L49:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	winTiles
	.word	100720640
	.word	winMap
	.word	winPal
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L53
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L54:
	.align	2
.L53:
	.word	oldButtons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L57
	mov	lr, pc
	bx	r3
	ldr	r4, .L57+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L57+8
	mov	lr, pc
	bx	r4
	mov	r3, #240
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L57+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L57+16
	ldr	r1, .L57+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L57+24
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L57+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L58:
	.align	2
.L57:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	loseTiles
	.word	100720640
	.word	loseMap
	.word	losePal
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L70
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L60
	ldr	r3, .L70+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L67
.L60:
	ldr	r3, .L70+16
	ldr	r3, [r3]
	cmp	r3, #14
	ble	.L68
	ldr	r3, .L70+20
	ldr	r3, [r3]
	cmp	r3, #0
	blt	.L69
.L59:
	pop	{r4, lr}
	bx	lr
.L68:
	bl	goToWin
	ldr	r3, .L70+20
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L59
.L69:
	pop	{r4, lr}
	b	goToLose
.L67:
	bl	goToPause
	b	.L60
.L71:
	.align	2
.L70:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	furthest
	.word	lives
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #4352
	mov	r1, #56320
	mov	r2, #0
	push	{r4, r7, fp, lr}
	strh	r0, [r3]	@ movhi
	ldr	r4, .L87
	strh	r1, [r3, #8]	@ movhi
	ldr	r9, .L87+4
	ldrh	r0, [r4, #48]
	ldr	r5, .L87+8
	ldr	r6, .L87+12
	ldr	r3, .L87+16
	strh	r0, [r9]	@ movhi
	strh	r2, [r5]	@ movhi
	ldr	fp, .L87+20
	mov	lr, pc
	bx	r3
	ldr	r8, .L87+24
	ldrh	r0, [r9]
	ldr	r2, [r6]
	ldr	r7, .L87+28
	ldr	r10, .L87+32
.L74:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r9]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L82
.L76:
	.word	.L80
	.word	.L79
	.word	.L78
	.word	.L77
	.word	.L75
.L75:
	tst	r0, #8
	beq	.L82
	ldr	r3, .L87+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r9]
	b	.L74
.L77:
	tst	r0, #8
	beq	.L82
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [r9]
	b	.L74
.L78:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r9]
	b	.L74
.L79:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r9]
	b	.L74
.L80:
	tst	r0, #8
	beq	.L82
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r9]
	b	.L74
.L82:
	mov	r0, r3
	b	.L74
.L88:
	.align	2
.L87:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	state
	.word	goToStart
	.word	start.part.0
	.word	game
	.word	pause
	.word	win.part.0
	.word	lose.part.0
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	seed,4,4
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
