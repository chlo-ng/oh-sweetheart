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
	ldr	r2, .L4+12
	ldr	r3, .L4+16
	str	r4, [r2]
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
	.word	lastState
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
	mov	r3, #0
	ldr	r1, .L8+4
	ldr	r2, .L8+8
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	initStartScreen
	.word	state
	.word	lastState
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
	mov	r3, #256
	mov	r1, #67108864
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r4, .L12
	strh	r3, [r1]	@ movhi
	mov	r0, #3
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r3, #2640
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+12
	mov	r0, #3
	ldr	r1, .L12+16
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L12+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	instructionsPal
	.word	instructionsTiles
	.word	100677632
	.word	instructionsMap
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
	ldr	r3, .L24
	ldrh	r3, [r3]
	tst	r3, #2
	bxeq	lr
	ldr	r3, .L24+4
	ldrh	r3, [r3]
	push	{r4, lr}
	ands	r4, r3, #2
	beq	.L23
	pop	{r4, lr}
	bx	lr
.L23:
	mov	r2, #67108864
	ldrh	r3, [r2]
	orr	r3, r3, #4096
	strh	r3, [r2]	@ movhi
	ldr	r3, .L24+8
	mov	lr, pc
	bx	r3
	ldr	r2, .L24+12
	ldr	r3, .L24+16
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	oldButtons
	.word	buttons
	.word	initStartScreen
	.word	state
	.word	lastState
	.size	instructions, .-instructions
	.align	2
	.global	goToLevelOne
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLevelOne, %function
goToLevelOne:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #1792
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L28
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L28+4
	mov	lr, pc
	bx	r4
	mov	r3, #32
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L28+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L28+12
	mov	r0, #3
	ldr	r1, .L28+16
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L28+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L29:
	.align	2
.L28:
	.word	DMANow
	.word	room1Pal
	.word	room1Tiles
	.word	100677632
	.word	room1Map
	.word	state
	.size	goToLevelOne, .-goToLevelOne
	.align	2
	.global	goToLevelTwo
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLevelTwo, %function
goToLevelTwo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #4352
	ldr	r1, .L32
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L32+4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L32+8
	mov	lr, pc
	bx	r4
	mov	r3, #160
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L32+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L32+16
	mov	r3, #2048
	mov	r0, #3
	ldr	r1, .L32+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L32+24
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L32+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L33:
	.align	2
.L32:
	.word	18177
	.word	DMANow
	.word	room2Pal
	.word	room2Tiles
	.word	100677632
	.word	room2Map
	.word	initLevelTwo
	.word	state
	.size	goToLevelTwo, .-goToLevelTwo
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
	ldr	r3, .L46
	mov	lr, pc
	bx	r3
	ldr	r4, .L46+4
	ldr	r3, .L46+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L44
	ldr	r4, .L46+16
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L45
.L34:
	pop	{r4, lr}
	bx	lr
.L44:
	bl	goToInstructions
	mov	r3, #0
	str	r3, [r4]
	ldr	r4, .L46+16
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L34
.L45:
	ldr	r3, .L46+20
	mov	lr, pc
	bx	r3
	bl	goToLevelTwo
	mov	r3, #0
	str	r3, [r4]
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	updateStartScreen
	.word	howGame
	.word	waitForVBlank
	.word	drawStartScreen
	.word	playGame
	.word	initLevelTwo
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
	ldr	r4, .L50
	strh	r1, [r2, #8]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L50+4
	mov	lr, pc
	bx	r4
	mov	r3, #672
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L50+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L50+12
	mov	r0, #3
	ldr	r1, .L50+16
	mov	lr, pc
	bx	r4
	mov	r2, #6
	ldr	r3, .L50+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L51:
	.align	2
.L50:
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
	ldr	r4, .L55
	strh	r1, [r2, #8]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L55+4
	mov	lr, pc
	bx	r4
	mov	r3, #672
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L55+8
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L55+12
	mov	r0, #3
	ldr	r1, .L55+16
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L55+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L56:
	.align	2
.L55:
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
	ldr	r4, .L60
	strh	r1, [r2, #8]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L60+4
	mov	lr, pc
	bx	r4
	mov	r3, #224
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L60+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L60+12
	mov	r0, #3
	ldr	r1, .L60+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L60+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L61:
	.align	2
.L60:
	.word	DMANow
	.word	pauseScreenPal
	.word	pauseScreenTiles
	.word	100677632
	.word	pauseScreenMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	levelOne
	.syntax unified
	.arm
	.fpu softvfp
	.type	levelOne, %function
levelOne:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L76
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L73
	ldr	r3, .L76+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L74
.L64:
	ldr	r3, .L76+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L62
	ldr	r3, .L76+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L75
.L62:
	pop	{r4, lr}
	bx	lr
.L73:
	bl	goToLevelTwo
	ldr	r3, .L76+16
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L64
.L74:
	bl	goToLose
	b	.L64
.L75:
	mov	r2, #2
	ldr	r3, .L76+28
	pop	{r4, lr}
	str	r2, [r3]
	b	goToPause
.L77:
	.align	2
.L76:
	.word	updateLevelOne
	.word	waitForVBlank
	.word	drawLevelOne
	.word	exitted
	.word	heroHealth
	.word	oldButtons
	.word	buttons
	.word	lastState
	.size	levelOne, .-levelOne
	.align	2
	.global	levelTwo
	.syntax unified
	.arm
	.fpu softvfp
	.type	levelTwo, %function
levelTwo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L92
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L89
	ldr	r3, .L92+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L90
.L80:
	ldr	r3, .L92+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L78
	ldr	r3, .L92+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L91
.L78:
	pop	{r4, lr}
	bx	lr
.L89:
	bl	goToWin
	ldr	r3, .L92+16
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L80
.L90:
	bl	goToLose
	b	.L80
.L91:
	mov	r2, #3
	ldr	r3, .L92+28
	pop	{r4, lr}
	str	r2, [r3]
	b	goToPause
.L93:
	.align	2
.L92:
	.word	updateLevelTwo
	.word	waitForVBlank
	.word	drawLevelTwo
	.word	exitted
	.word	heroHealth
	.word	oldButtons
	.word	buttons
	.word	lastState
	.size	levelTwo, .-levelTwo
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
	ldr	r3, .L105
	ldrh	r3, [r3]
	tst	r3, #2
	bxeq	lr
	ldr	r3, .L105+4
	ldrh	r3, [r3]
	tst	r3, #2
	bxne	lr
	push	{r4, lr}
	ldr	r4, .L105+8
	ldr	r3, [r4]
	cmp	r3, #2
	beq	.L103
.L98:
	cmp	r3, #3
	beq	.L104
	pop	{r4, lr}
	bx	lr
.L104:
	pop	{r4, lr}
	b	goToLevelTwo
.L103:
	bl	goToLevelOne
	ldr	r3, [r4]
	b	.L98
.L106:
	.align	2
.L105:
	.word	oldButtons
	.word	buttons
	.word	lastState
	.size	pause, .-pause
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Debugging Initialized\000"
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
	ldr	r3, .L118
	mov	lr, pc
	bx	r3
	ldr	r0, .L118+4
	ldr	r3, .L118+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L118+12
	mov	lr, pc
	bx	r3
	ldr	r6, .L118+16
	ldr	fp, .L118+20
	ldr	r5, .L118+24
	ldr	r10, .L118+28
	ldr	r7, .L118+32
	ldr	r8, .L118+36
	ldr	r9, .L118+40
	ldr	r4, .L118+44
.L108:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L109:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L109
.L111:
	.word	.L114
	.word	.L113
	.word	.L112
	.word	.L112
	.word	.L110
	.word	.L110
	.word	.L110
.L110:
	mov	lr, pc
	bx	r7
	b	.L108
.L112:
	mov	lr, pc
	bx	r8
	b	.L108
.L113:
	mov	lr, pc
	bx	r9
	b	.L108
.L114:
	mov	lr, pc
	bx	r10
	b	.L108
.L119:
	.align	2
.L118:
	.word	mgba_open
	.word	.LC0
	.word	mgba_printf
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	levelOne
	.word	pause
	.word	67109120
	.size	main, .-main
	.comm	lastState,4,4
	.comm	state,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	enemyHealth,4,4
	.comm	heroHealth,4,4
	.comm	MAPWIDTH,4,4
	.comm	MAPHEIGHT,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	equippedKnife,4,4
	.comm	equippedKey,4,4
	.comm	exitted,4,4
	.comm	pressed,4,4
	.comm	unlocked,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
