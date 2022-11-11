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
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #256
	push	{r4, lr}
	mov	r4, #0
	strh	r2, [r3]	@ movhi
	add	r2, r2, r3
	ldrh	r0, [r2, #48]
	ldr	r1, .L4
	ldr	r2, .L4+4
	strh	r0, [r1]	@ movhi
	strh	r4, [r2]	@ movhi
	strh	r4, [r3, #16]	@ movhi
	strh	r4, [r3, #18]	@ movhi
	ldrh	r2, [r3]
	orr	r2, r2, #4096
	strh	r2, [r3]	@ movhi
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+12
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	buttons
	.word	oldButtons
	.word	initStartScreen
	.word	state
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldrh	r3, [r2]
	orr	r3, r3, #4096
	push	{r4, lr}
	strh	r3, [r2]	@ movhi
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L8+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L9:
	.align	2
.L8:
	.word	initStartScreen
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #3
	ldr	r3, .L11
	str	r2, [r3]
	bx	lr
.L12:
	.align	2
.L11:
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L23
	ldrh	r3, [r3]
	tst	r3, #2
	bxeq	lr
	ldr	r3, .L23+4
	ldrh	r3, [r3]
	push	{r4, lr}
	ands	r4, r3, #2
	beq	.L22
	pop	{r4, lr}
	bx	lr
.L22:
	mov	r2, #67108864
	ldrh	r3, [r2]
	orr	r3, r3, #4096
	strh	r3, [r2]	@ movhi
	ldr	r3, .L23+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+12
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	oldButtons
	.word	buttons
	.word	initStartScreen
	.word	state
	.size	instructions, .-instructions
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
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L27
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L27+4
	mov	lr, pc
	bx	r4
	mov	r3, #32
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L27+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L27+12
	mov	r0, #3
	ldr	r1, .L27+16
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L27+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	DMANow
	.word	room1Pal
	.word	room1Tiles
	.word	100677632
	.word	room1Map
	.word	state
	.size	goToGame, .-goToGame
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
	push	{r4, lr}
	ldr	r3, .L40
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+12
	ldr	r2, [r3]
	cmp	r2, #0
	movne	r0, #0
	movne	r1, #3
	ldr	r4, .L40+16
	ldrne	r2, .L40+20
	strne	r0, [r3]
	ldr	r3, [r4]
	strne	r1, [r2]
	cmp	r3, #0
	bne	.L39
	pop	{r4, lr}
	bx	lr
.L39:
	ldr	r3, .L40+24
	mov	lr, pc
	bx	r3
	bl	goToGame
	mov	r3, #0
	str	r3, [r4]
	pop	{r4, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	updateStartScreen
	.word	waitForVBlank
	.word	drawStartScreen
	.word	howGame
	.word	playGame
	.word	state
	.word	initGame
	.size	start, .-start
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
	mov	r2, #67108864
	mov	r3, #256
	mov	r1, #1792
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L44
	strh	r1, [r2, #8]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L44+4
	mov	lr, pc
	bx	r4
	mov	r3, #672
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L44+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L44+12
	mov	r0, #3
	ldr	r1, .L44+16
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L44+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L45:
	.align	2
.L44:
	.word	DMANow
	.word	losePal
	.word	loseTiles
	.word	100677632
	.word	loseMap
	.word	state
	.size	goToLose, .-goToLose
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
	b	instructions
	.size	lose, .-lose
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
	mov	r2, #67108864
	mov	r3, #256
	mov	r1, #1792
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L49
	strh	r1, [r2, #8]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L49+4
	mov	lr, pc
	bx	r4
	mov	r3, #672
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L49+8
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L49+12
	mov	r0, #3
	ldr	r1, .L49+16
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L49+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L50:
	.align	2
.L49:
	.word	DMANow
	.word	winPal
	.word	winTiles
	.word	100677632
	.word	winMap
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
	b	instructions
	.size	win, .-win
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
	mov	r2, #67108864
	mov	r3, #256
	mov	r1, #1792
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L54
	strh	r1, [r2, #8]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L54+4
	mov	lr, pc
	bx	r4
	mov	r3, #224
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L54+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L54+12
	mov	r0, #3
	ldr	r1, .L54+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L54+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L55:
	.align	2
.L54:
	.word	DMANow
	.word	pauseScreenPal
	.word	pauseScreenTiles
	.word	100677632
	.word	pauseScreenMap
	.word	state
	.size	goToPause, .-goToPause
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
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L67
	ldr	r3, .L70+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L68
.L58:
	ldr	r3, .L70+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
	ldr	r3, .L70+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
.L56:
	pop	{r4, lr}
	bx	lr
.L67:
	bl	goToWin
	ldr	r3, .L70+16
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L58
.L68:
	bl	goToLose
	b	.L58
.L69:
	pop	{r4, lr}
	b	goToPause
.L71:
	.align	2
.L70:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	exitted
	.word	heroHealth
	.word	oldButtons
	.word	buttons
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
	push	{r4, r7, fp, lr}
	ldr	r6, .L86
	ldr	fp, .L86+4
	ldr	r3, .L86+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L86+12
	ldr	r2, [r6]
	ldrh	r1, [fp]
	ldr	r9, .L86+16
	ldr	r7, .L86+20
	ldr	r8, .L86+24
	ldr	r10, .L86+28
	ldr	r4, .L86+32
.L74:
	strh	r1, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L81
.L76:
	.word	.L79
	.word	.L78
	.word	.L77
	.word	.L75
	.word	.L75
	.word	.L75
.L75:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L74
.L77:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L74
.L78:
	tst	r1, #2
	beq	.L81
	tst	r3, #2
	beq	.L85
.L81:
	mov	r1, r3
	b	.L74
.L79:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L74
.L85:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L74
.L87:
	.align	2
.L86:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	goToGame
	.word	67109120
	.size	main, .-main
	.text
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
	@ link register save eliminated.
	ldr	r3, .L93
	ldrh	r3, [r3]
	tst	r3, #2
	bxeq	lr
	ldr	r3, .L93+4
	ldrh	r3, [r3]
	tst	r3, #2
	bxne	lr
	b	goToGame
.L94:
	.align	2
.L93:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.comm	state,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	enemyHealth,4,4
	.comm	heroHealth,4,4
	.comm	equippedKnife,4,4
	.comm	equippedKey,4,4
	.comm	exitted,4,4
	.comm	pressed,4,4
	.comm	unlocked,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
