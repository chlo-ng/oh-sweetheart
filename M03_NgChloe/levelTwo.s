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
	.file	"levelTwo.c"
	.text
	.align	2
	.global	updateLevelTwo
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLevelTwo, %function
updateLevelTwo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r2, .L4+4
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	updatePlayer
	.word	count
	.size	updateLevelTwo, .-updateLevelTwo
	.align	2
	.global	drawLevelTwo
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLevelTwo, %function
drawLevelTwo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r4, .L8+4
	mov	r2, #117440512
	ldr	r1, .L8+8
	mov	r3, #512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L8+16
	ldrh	r1, [r2]
	ldr	r2, .L8+20
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	drawSprites
	.word	DMANow
	.word	shadowOAM
	.word	waitForVBlank
	.word	hOff
	.word	vOff
	.size	drawLevelTwo, .-drawLevelTwo
	.align	2
	.global	initializeSprites2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeSprites2, %function
initializeSprites2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, #256
	ldr	r4, .L14
	mov	r0, #3
	ldr	r2, .L14+4
	ldr	r1, .L14+8
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L14+12
	ldr	r1, .L14+16
	mov	lr, pc
	bx	r4
	mov	lr, #1
	mov	r6, #32
	mov	r1, #0
	mov	r10, #3
	mov	ip, #24
	mov	r5, #88
	mov	r9, #188
	mov	r8, #20
	mov	r7, #4
	mov	r0, lr
	mov	r2, #8
	ldr	r3, .L14+20
	ldr	r4, [r3]
	ldr	r3, .L14+24
	add	r4, r4, #5
	str	r4, [r3, #4]
	ldr	r4, .L14+28
	ldr	r4, [r4]
	add	r4, r4, r6
	str	r4, [r3]
	str	r6, [r3, #16]
	str	r6, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	r1, [r3, #28]
	str	r10, [r3, #40]
	str	lr, [r3, #12]
	str	lr, [r3, #8]
	ldr	r3, .L14+32
	str	r1, [r3]
	ldr	r3, .L14+36
	str	r1, [r3]
	ldr	r3, .L14+40
	str	r1, [r3]
	ldr	r3, .L14+44
	str	r1, [r3, #48]
	str	r1, [r3, #100]
	str	r9, [r3, #4]
	ldr	r1, .L14+48
	str	r8, [r3, #56]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	ip, [r3, #68]
	str	ip, [r3, #72]
	str	r5, [r3]
	str	r5, [r3, #52]
	ldr	r3, .L14+52
	str	r7, [r1]
	add	r1, r3, #312
.L11:
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r0, [r3, #48]
	add	r3, r3, #52
	cmp	r1, r3
	bne	.L11
	mov	lr, #32
	mov	r2, #0
	mov	ip, #24
	ldr	r3, .L14+56
	ldr	r0, .L14+60
	ldr	r1, .L14+64
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #4]
	str	r2, [r3]
	str	r2, [r1]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hOff
	.word	hero
	.word	vOff
	.word	exitted
	.word	damaged
	.word	healed
	.word	switches
	.word	heroHealth
	.word	traps
	.word	door
	.word	391
	.word	unlocked
	.size	initializeSprites2, .-initializeSprites2
	.align	2
	.global	initLevelTwo
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLevelTwo, %function
initLevelTwo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	initializeSprites2
	mov	r3, #0
	mov	r1, #480
	ldr	lr, .L18
	ldr	ip, .L18+4
	ldr	r0, .L18+8
	ldr	r2, .L18+12
	str	r3, [lr]
	str	r3, [ip]
	str	r3, [r0]
	str	r1, [r2]
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	count
	.word	vOff
	.word	hOff
	.word	MAPWIDTH
	.size	initLevelTwo, .-initLevelTwo
	.comm	count,4,4
	.comm	used,4,4
	.comm	heart,48,4
	.comm	health,208,4
	.comm	healthBar,48,4
	.comm	knife,48,4
	.comm	key,48,4
	.comm	switches,104,4
	.comm	traps,312,4
	.comm	door,48,4
	.comm	enemy,48,4
	.comm	healed,4,4
	.comm	damaged,4,4
	.comm	hero,48,4
	.comm	shadowOAM,1024,4
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
