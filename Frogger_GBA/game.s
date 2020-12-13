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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawObstacle.part.0, %function
drawObstacle.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L8
	push	{r4, r5, lr}
	ldr	r1, .L8+4
	ldr	r5, .L8+8
	ldr	r4, .L8+12
	add	lr, r3, #140
.L3:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	movgt	ip, #448
	movle	ip, #452
	ldr	r2, [r3, #4]
	ldrb	r0, [r3]	@ zero_extendqisi2
	and	r2, r2, r5
	add	r3, r3, #28
	orr	r2, r2, r4
	orr	r0, r0, #16384
	cmp	lr, r3
	strh	ip, [r1, #12]	@ movhi
	strh	r2, [r1, #10]	@ movhi
	strh	r0, [r1, #8]	@ movhi
	add	r1, r1, #8
	bne	.L3
	pop	{r4, r5, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	obstacle
	.word	shadowOAM
	.word	511
	.word	-32768
	.size	drawObstacle.part.0, .-drawObstacle.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTurtle.part.0, %function
updateTurtle.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	blt	.L22
	beq	.L15
	ldr	r2, [r0, #12]
	ldr	r1, [r0, #4]
	add	r2, r2, #239
	cmp	r2, r1
	movlt	r3, #0
	strlt	r3, [r0, #4]
	bge	.L21
.L14:
	mov	r5, #0
	ldr	r3, .L23
	ldr	r4, .L23+4
	ldr	ip, .L23+8
	ldr	r0, .L23+12
	add	lr, r3, #440
.L13:
	ldr	r2, [r3, #24]
	add	r2, r2, #1
	mla	r1, r4, r2, ip
	cmp	r0, r1, ror #2
	str	r2, [r3, #24]
	bcc	.L17
	ldr	r1, [r3, #40]
	ldr	r2, [r3, #36]
	sub	r1, r1, #1
	cmp	r2, r1
	add	r2, r2, #1
	strlt	r2, [r3, #36]
	strge	r5, [r3, #36]
.L17:
	add	r3, r3, #44
	cmp	lr, r3
	bne	.L13
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	ldr	r2, [r0, #12]
	ldr	r1, [r0, #4]
	rsb	r0, r2, #0
	cmp	r1, r0
	rsble	r2, r2, #239
	strle	r2, [r4, #4]
	ble	.L14
.L21:
	add	r3, r3, r1
	str	r3, [r4, #4]
	b	.L14
.L15:
	mov	r1, #1
	mvn	r0, #0
	ldr	r3, .L23+16
	mov	lr, pc
	bx	r3
	str	r0, [r4, #20]
	b	.L14
.L24:
	.align	2
.L23:
	.word	turtle
	.word	-1030792151
	.word	85899344
	.word	42949672
	.word	getRandNumRange
	.size	updateTurtle.part.0, .-updateTurtle.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTurtle.part.0, %function
drawTurtle.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L31
	push	{r4, r5, lr}
	ldr	r0, .L31+4
	ldr	lr, .L31+8
	add	ip, r3, #440
.L28:
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #28]
	and	r1, r1, lr
	ldr	r5, [r3, #20]
	orr	r1, r1, #16384
	ldrb	r4, [r3]	@ zero_extendqisi2
	strh	r1, [r0, #50]	@ movhi
	lsl	r1, r2, #4
	ldr	r2, [r3, #36]
	cmp	r5, #0
	strh	r4, [r0, #48]	@ movhi
	add	r4, r1, r2
	addge	r2, r2, #3
	addge	r2, r2, r1
	lslge	r2, r2, #17
	lsl	r4, r4, #17
	add	r3, r3, #44
	lsrlt	r2, r4, #16
	lsrge	r2, r2, #16
	cmp	ip, r3
	strh	r2, [r0, #52]	@ movhi
	add	r0, r0, #8
	bne	.L28
	pop	{r4, r5, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	turtle
	.word	shadowOAM
	.word	511
	.size	drawTurtle.part.0, .-drawTurtle.part.0
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L51
	add	r5, r4, #140
.L35:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	add	r4, r4, #28
	blne	drawObstacle.part.0
.L34:
	cmp	r4, r5
	bne	.L35
	ldr	r4, .L51+4
	add	r5, r4, #440
.L37:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	add	r4, r4, #44
	blne	drawTurtle.part.0
.L36:
	cmp	r4, r5
	bne	.L37
	ldr	r3, .L51+8
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	cmp	r2, #0
	add	r1, r1, #16
	bne	.L38
	mov	r0, #512
	ldr	r2, .L51+12
	lsl	r1, r1, #3
	strh	r0, [r2, r1]	@ movhi
.L39:
	ldr	r0, [r3, #44]
	ldr	r1, [r3, #40]
	cmp	r0, #0
	add	r1, r1, #16
	beq	.L40
	mov	ip, #8
	ldr	r0, [r3, #28]
	ldr	lr, [r3, #24]
	orr	r3, r0, #16384
	add	r0, r2, r1, lsl #3
	lsl	r1, r1, #3
	strh	r3, [r0, #2]	@ movhi
	strh	lr, [r2, r1]	@ movhi
	strh	ip, [r0, #4]	@ movhi
.L41:
	ldr	r0, .L51+16
	ldr	r3, [r0, #4]
	ldr	ip, [r0, #28]
	ldr	r1, [r0, #20]
	lsl	r3, r3, #23
	add	r1, r1, ip, lsl #5
	lsr	r3, r3, #23
	ldrb	ip, [r0]	@ zero_extendqisi2
	orr	r3, r3, #16384
	lsl	r1, r1, #1
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	strh	ip, [r2]	@ movhi
	ldr	r0, .L51+20
	mov	lr, pc
	bx	r0
	ldr	r4, .L51+24
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L51+12
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L38:
	mov	ip, #8
	ldr	r2, .L51+12
	ldr	r0, [r3, #4]
	ldr	r4, [r3]
	lsl	lr, r1, #3
	orr	r0, r0, #16384
	add	r1, r2, r1, lsl #3
	strh	r4, [r2, lr]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	b	.L39
.L40:
	mov	r3, #512
	lsl	r1, r1, #3
	strh	r3, [r2, r1]	@ movhi
	b	.L41
.L52:
	.align	2
.L51:
	.word	obstacle
	.word	turtle
	.word	livesObject
	.word	shadowOAM
	.word	player
	.word	waitForVBlank
	.word	DMANow
	.size	drawGame, .-drawGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #147
	mov	lr, #10
	mov	ip, #12
	mov	r0, #4
	ldr	r3, .L55
	ldr	r1, [r3, #12]
	rsb	r1, r1, #120
	stmib	r3, {r1, lr}
	str	r4, [r3]
	str	ip, [r3, #12]
	str	r0, [r3, #32]
	str	r2, [r3, #40]
	str	r2, [r3, #16]
	str	r2, [r3, #28]
	str	r2, [r3, #20]
	pop	{r4, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L58
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #28]
	ldr	r2, [r1, #20]
	lsl	r3, r3, #23
	ldr	r0, .L58+4
	ldrb	r1, [r1]	@ zero_extendqisi2
	lsr	r3, r3, #23
	add	r2, r2, ip, lsl #5
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L59:
	.align	2
.L58:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initObstacles
	.syntax unified
	.arm
	.fpu softvfp
	.type	initObstacles, %function
initObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #135
	mov	r7, #12
	ldr	r4, .L64
	ldr	r6, .L64+4
.L61:
	mov	r1, #240
	mov	r0, #0
	mov	lr, pc
	bx	r6
	mov	r3, #18
	mov	r2, r0
	mov	r1, #2
	mvn	r0, #1
	str	r2, [r4, #4]
	str	r5, [r4]
	str	r3, [r4, #12]
	str	r7, [r4, #8]
	mov	lr, pc
	bx	r6
	mov	r2, #1
	mov	r3, #7
	sub	r5, r5, #12
	cmp	r5, #75
	str	r0, [r4, #20]
	str	r2, [r4, #16]
	str	r3, [r4, #24]
	add	r4, r4, #28
	bne	.L61
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	obstacle
	.word	getRandNumRange
	.size	initObstacles, .-initObstacles
	.align	2
	.global	updateObstacle
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateObstacle, %function
updateObstacle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, lr}
	ldr	r2, [r0, #8]
	ldr	r3, [r0]
	ldr	lr, [r0, #12]
	ldr	ip, [r0, #4]
	ldr	r5, .L82
	sub	sp, sp, #16
	sub	r2, r2, #2
	add	r3, r3, #2
	str	r2, [sp, #12]
	str	r3, [sp, #4]
	mov	r4, r0
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	str	lr, [sp, #8]
	str	ip, [sp]
	ldr	r6, .L82+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L68
	ldr	r3, [r4, #20]
	cmp	r3, #0
	blt	.L81
	beq	.L71
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #4]
	rsb	r2, r2, #260
	cmp	r1, r2
	bge	.L72
.L80:
	add	r3, r3, r1
	str	r3, [r4, #4]
	b	.L66
.L68:
	mov	ip, #147
	mov	r0, #0
	ldr	r1, .L82+8
	ldr	r3, [r5, #12]
	ldr	r2, [r1]
	rsb	r3, r3, #120
	sub	r2, r2, #1
	str	r2, [r1]
	str	r3, [r5, #4]
	str	ip, [r5]
	str	r0, [r5, #20]
.L66:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L81:
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #4]
	rsb	r0, r2, #0
	cmp	r1, r0
	bgt	.L80
	rsb	r2, r2, #239
	mvn	r1, #0
	mvn	r0, #1
	str	r2, [r4, #4]
	ldr	r3, .L82+12
	mov	lr, pc
	bx	r3
	str	r0, [r4, #20]
	b	.L66
.L72:
	str	r0, [r4, #4]
	mov	r1, #2
	mov	r0, #1
	ldr	r3, .L82+12
	mov	lr, pc
	bx	r3
	str	r0, [r4, #20]
	b	.L66
.L71:
	mov	r1, #2
	mvn	r0, #1
	ldr	r3, .L82+12
	mov	lr, pc
	bx	r3
	str	r0, [r4, #20]
	b	.L66
.L83:
	.align	2
.L82:
	.word	player
	.word	collision
	.word	lives
	.word	getRandNumRange
	.size	updateObstacle, .-updateObstacle
	.align	2
	.global	drawObstacle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawObstacle, %function
drawObstacle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bxeq	lr
	b	drawObstacle.part.0
	.size	drawObstacle, .-drawObstacle
	.align	2
	.global	initTurtle
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTurtle, %function
initTurtle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #64
	mov	r5, #0
	mov	r10, #12
	mov	r9, #16
	mov	r7, #1
	ldr	r4, .L92
	ldr	r8, .L92+4
.L89:
	mov	r3, #0
	mov	r1, #3
	mov	r2, #10
	ands	r0, r5, #1
	str	r6, [r4]
	str	r10, [r4, #8]
	str	r9, [r4, #12]
	str	r7, [r4, #16]
	str	r6, [r4, #44]
	str	r10, [r4, #52]
	str	r9, [r4, #56]
	str	r7, [r4, #60]
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	str	r3, [r4, #80]
	str	r3, [r4, #68]
	str	r1, [r4, #40]
	str	r1, [r4, #84]
	str	r2, [r4, #28]
	str	r2, [r4, #72]
	bne	.L87
	mov	r1, #240
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #12]
	sub	r3, r0, r3
	str	r0, [r4, #4]
	str	r7, [r4, #20]
	str	r7, [r4, #64]
	str	r3, [r4, #48]
.L88:
	add	r5, r5, #1
	cmp	r5, #5
	sub	r6, r6, #12
	add	r4, r4, #88
	bne	.L89
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L87:
	mov	r0, r3
	mov	r1, #240
	mov	lr, pc
	bx	r8
	mvn	r2, #0
	ldr	r3, [r4, #12]
	sub	r3, r0, r3
	str	r0, [r4, #4]
	str	r3, [r4, #48]
	str	r2, [r4, #20]
	str	r2, [r4, #64]
	b	.L88
.L93:
	.align	2
.L92:
	.word	turtle
	.word	getRandNumRange
	.size	initTurtle, .-initTurtle
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #256
	ldr	r4, .L96
	mov	r0, #3
	ldr	r2, .L96+4
	ldr	r1, .L96+8
	mov	lr, pc
	bx	r4
	mov	r8, #10
	mov	r0, #3
	ldr	r2, .L96+12
	ldr	r1, .L96+16
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L96+20
	mov	lr, pc
	bx	r3
	mov	r6, #12
	mov	r1, #0
	mov	r0, #8
	mov	lr, #144
	mov	ip, #1
	mov	r4, #2
	mov	r5, #147
	mov	r7, #4
	ldr	r2, .L96+24
	ldr	r3, [r2, #12]
	rsb	r3, r3, #120
	stmib	r2, {r3, r8}
	ldr	r3, .L96+28
	str	r6, [r3, #28]
	str	r1, [r3, #4]
	str	lr, [r3]
	str	lr, [r3, #24]
	str	r0, [r3, #12]
	str	r0, [r3, #8]
	str	r0, [r3, #36]
	str	r0, [r3, #32]
	str	r4, [r3, #40]
	str	ip, [r3, #20]
	str	ip, [r3, #16]
	str	ip, [r3, #44]
	str	r7, [r2, #32]
	str	r5, [r2]
	str	r6, [r2, #12]
	str	r1, [r2, #40]
	str	r1, [r2, #16]
	str	r1, [r2, #28]
	str	r1, [r2, #20]
	bl	initObstacles
	bl	initTurtle
	mov	r2, #30
	ldr	r0, .L96+32
	ldr	r1, .L96+36
	ldr	r3, .L96+40
	str	r5, [r0]
	str	r4, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L97:
	.align	2
.L96:
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	player
	.word	livesObject
	.word	furthest
	.word	lives
	.word	countdown
	.size	initGame, .-initGame
	.align	2
	.global	updateTurtle
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTurtle, %function
updateTurtle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bxeq	lr
	b	updateTurtle.part.0
	.size	updateTurtle, .-updateTurtle
	.align	2
	.global	drawTurtle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTurtle, %function
drawTurtle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bxeq	lr
	b	drawTurtle.part.0
	.size	drawTurtle, .-drawTurtle
	.align	2
	.global	isFloating
	.syntax unified
	.arm
	.fpu softvfp
	.type	isFloating, %function
isFloating:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, .L112
	mov	r5, #0
	mov	r4, r7
	ldr	r6, .L112+4
	ldr	r8, .L112+8
	sub	sp, sp, #16
	b	.L105
.L103:
	add	r5, r5, #1
	cmp	r5, #10
	add	r4, r4, #44
	beq	.L111
.L105:
	ldr	r1, [r6]
	cmp	r1, #74
	bgt	.L103
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #12]
	ldr	ip, [r4, #8]
	str	r0, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	str	ip, [sp, #12]
	ldr	r3, [r6, #8]
	ldr	r2, [r6, #12]
	ldr	r0, [r6, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L103
	mov	r0, #1
	add	r3, r5, r5, lsl #2
	add	r5, r5, r3, lsl #1
	add	r5, r7, r5, lsl #2
	ldr	r2, [r5, #20]
	ldr	r3, .L112+12
	str	r2, [r3]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L111:
	mov	r0, #0
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L113:
	.align	2
.L112:
	.word	turtle
	.word	player
	.word	collision
	.word	speedCopy
	.size	isFloating, .-isFloating
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L147
	ldr	r3, [r4, #20]
	cmp	r3, #4
	movne	r2, #4
	strne	r2, [r4, #20]
	ldr	r2, [r4, #32]
	strne	r3, [r4, #24]
	ldr	r3, [r4, #28]
	sub	r2, r2, #1
	cmp	r3, r2
	movge	r3, #0
	ldr	r2, .L147+4
	ldrh	r2, [r2]
	addlt	r3, r3, #1
	tst	r2, #32
	str	r3, [r4, #28]
	beq	.L117
	ldr	r3, .L147+8
	ldrh	r3, [r3]
	tst	r3, #32
	bne	.L117
	ldr	r3, [r4, #4]
	cmp	r3, #2
	ble	.L117
	mov	r2, #3
	ldr	r1, [r4, #12]
	sub	r3, r3, r1
	str	r3, [r4, #4]
	str	r2, [r4, #20]
	bl	isFloating
	cmp	r0, #0
	bne	.L144
.L122:
	ldr	r3, [r4]
	sub	r3, r3, #11
	cmp	r3, #63
	bls	.L145
.L114:
	pop	{r4, lr}
	bx	lr
.L117:
	tst	r2, #16
	beq	.L119
	ldr	r3, .L147+8
	ldrh	r3, [r3]
	tst	r3, #16
	bne	.L119
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #12]
	add	r3, r3, r1
	cmp	r3, #239
	movle	r2, #2
	strle	r3, [r4, #4]
	strle	r2, [r4, #20]
	ble	.L126
.L119:
	tst	r2, #128
	beq	.L120
	ldr	r3, .L147+8
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L120
	ldr	r1, [r4]
	ldr	r3, [r4, #8]
	add	r3, r1, r3
	cmp	r3, #149
	bgt	.L120
	mov	r2, #1
	ldr	r3, [r4, #12]
	add	r1, r3, r1
	str	r1, [r4]
	str	r2, [r4, #20]
	b	.L126
.L120:
	tst	r2, #64
	bne	.L146
.L121:
	ldr	r3, [r4, #20]
	cmp	r3, #4
	moveq	r2, #0
	ldreq	r3, [r4, #24]
	streq	r2, [r4, #28]
	streq	r3, [r4, #20]
.L126:
	bl	isFloating
	cmp	r0, #0
	beq	.L122
.L144:
	ldr	r2, .L147+12
	ldr	r3, [r4, #4]
	ldr	r2, [r2]
	add	r3, r3, r2
	str	r3, [r4, #4]
	pop	{r4, lr}
	bx	lr
.L146:
	ldr	r3, .L147+8
	ldrh	r3, [r3]
	ands	r3, r3, #64
	bne	.L121
	ldr	r2, [r4]
	cmp	r2, #5
	ble	.L121
	ldr	r1, .L147+16
	ldr	ip, [r4, #12]
	ldr	r0, [r1]
	sub	r2, r2, ip
	cmp	r2, r0
	str	r3, [r4, #20]
	str	r2, [r4]
	strlt	r2, [r1]
	b	.L126
.L145:
	bl	isFloating
	cmp	r0, #0
	bne	.L114
	mov	r0, #147
	mov	r1, #108
	ldr	r2, .L147+20
	ldr	r3, [r2]
	sub	r3, r3, #1
	stm	r4, {r0, r1}
	str	r3, [r2]
	b	.L114
.L148:
	.align	2
.L147:
	.word	player
	.word	oldButtons
	.word	buttons
	.word	speedCopy
	.word	furthest
	.word	lives
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r0, .L161
	bl	updateObstacle
	ldr	r0, .L161+4
	bl	updateObstacle
	ldr	r0, .L161+8
	bl	updateObstacle
	ldr	r0, .L161+12
	bl	updateObstacle
	ldr	r0, .L161+16
	bl	updateObstacle
	ldr	r4, .L161+20
	add	r5, r4, #440
.L151:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	movne	r0, r4
	blne	updateTurtle.part.0
.L150:
	add	r4, r4, #44
	cmp	r4, r5
	bne	.L151
	ldr	r3, .L161+24
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L160
	cmp	r3, #0
	ldreq	r2, .L161+28
	streq	r3, [r2, #20]
.L153:
	bl	updatePlayer
	ldr	r0, .L161+32
	ldr	r2, [r0]
	add	r3, r2, r2, lsl #4
	ldr	r1, .L161+36
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	ldr	ip, .L161+40
	sub	r1, r1, r3
	cmp	ip, r1, ror #2
	ldrcs	r1, .L161+44
	ldrcs	r3, [r1]
	add	r2, r2, #1
	subcs	r3, r3, #1
	strcs	r3, [r1]
	str	r2, [r0]
	pop	{r4, r5, r6, lr}
	bx	lr
.L160:
	mov	r2, #0
	ldr	r3, .L161+28
	str	r2, [r3, #44]
	b	.L153
.L162:
	.align	2
.L161:
	.word	obstacle
	.word	obstacle+28
	.word	obstacle+56
	.word	obstacle+84
	.word	obstacle+112
	.word	turtle
	.word	lives
	.word	livesObject
	.word	time
	.word	143165576
	.word	71582788
	.word	countdown
	.size	updateGame, .-updateGame
	.align	2
	.global	initLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #8
	mov	r1, #1
	mov	r0, #144
	mov	r4, #0
	mov	lr, #12
	mov	ip, #2
	ldr	r3, .L165
	str	r4, [r3, #4]
	str	lr, [r3, #28]
	str	r0, [r3]
	str	r0, [r3, #24]
	str	ip, [r3, #40]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #36]
	str	r2, [r3, #32]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r1, [r3, #44]
	pop	{r4, lr}
	bx	lr
.L166:
	.align	2
.L165:
	.word	livesObject
	.size	initLives, .-initLives
	.align	2
	.global	updateLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLives, %function
updateLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L171
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L170
	cmp	r3, #0
	ldreq	r2, .L171+4
	streq	r3, [r2, #20]
	bx	lr
.L170:
	mov	r2, #0
	ldr	r3, .L171+4
	str	r2, [r3, #44]
	bx	lr
.L172:
	.align	2
.L171:
	.word	lives
	.word	livesObject
	.size	updateLives, .-updateLives
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #20]
	ldr	r3, [r0, #16]
	cmp	r2, #0
	add	r3, r3, #16
	beq	.L174
	mov	ip, #8
	ldr	r2, [r0, #4]
	ldr	r1, .L180
	str	lr, [sp, #-4]!
	ldr	lr, [r0]
	orr	r2, r2, #16384
	lsl	r0, r3, #3
	add	r3, r1, r3, lsl #3
	strh	lr, [r1, r0]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L174:
	mov	r1, #512
	ldr	r2, .L180
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L181:
	.align	2
.L180:
	.word	shadowOAM
	.size	drawLives, .-drawLives
	.comm	speedCopy,4,4
	.comm	furthest,4,4
	.comm	time,4,4
	.comm	countdown,4,4
	.comm	lives,4,4
	.comm	livesObject,48,4
	.comm	turtle,440,4
	.comm	obstacle,140,4
	.comm	player,44,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
