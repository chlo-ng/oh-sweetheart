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
	.file	"levelOne.c"
	.text
	.align	2
	.global	initializeSwitches
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeSwitches, %function
initializeSwitches:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #24
	mov	lr, #188
	mov	r0, #88
	mov	r1, #0
	mov	ip, #20
	ldr	r3, .L4
	str	lr, [r3, #4]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #68]
	str	r2, [r3, #72]
	str	ip, [r3, #56]
	str	r0, [r3]
	str	r0, [r3, #52]
	str	r1, [r3, #48]
	str	r1, [r3, #100]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	switches
	.size	initializeSwitches, .-initializeSwitches
	.align	2
	.global	initializeTraps
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeTraps, %function
initializeTraps:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L10
	mov	r1, #8
	mov	r3, r2
	mov	ip, #0
	push	{r4, r5, lr}
	add	r0, r2, #312
.L7:
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #48]
	add	r3, r3, #52
	cmp	r3, r0
	bne	.L7
	mov	lr, #47
	mov	r5, #88
	mov	r4, #100
	mov	ip, #26
	mov	r0, #79
	mov	r1, #109
	mov	r3, #38
	str	lr, [r2, #4]
	str	lr, [r2, #56]
	str	r5, [r2]
	str	r4, [r2, #52]
	str	ip, [r2, #108]
	str	ip, [r2, #160]
	str	r0, [r2, #104]
	str	r0, [r2, #260]
	str	r1, [r2, #156]
	str	r1, [r2, #208]
	str	r3, [r2, #212]
	str	r3, [r2, #264]
	pop	{r4, r5, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	traps
	.size	initializeTraps, .-initializeTraps
	.align	2
	.global	initializeSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeSprites, %function
initializeSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r0, #3
	ldr	r4, .L14
	mov	r3, #256
	ldr	r2, .L14+4
	ldr	r1, .L14+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L14+12
	ldr	r1, .L14+16
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L14+20
	mov	lr, pc
	bx	r3
	mov	r3, #3
	mov	r2, #1
	mov	r4, #0
	mov	r8, #32
	mov	r7, #104
	mov	r6, #16
	mov	lr, #128
	mov	ip, #100
	mov	r0, #40
	mov	r1, #4
	ldr	r5, .L14+24
	str	r3, [r5, #40]
	ldr	r3, .L14+28
	str	r2, [r3]
	ldr	r3, .L14+32
	str	r4, [r3]
	ldr	r3, .L14+36
	str	r4, [r3]
	ldr	r3, .L14+40
	str	r4, [r3]
	ldr	r3, .L14+44
	str	r2, [r5, #12]
	str	r2, [r5, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	ldr	r2, .L14+48
	stm	r3, {r0, ip}
	str	r8, [r5, #16]
	str	r8, [r5, #20]
	str	lr, [r5]
	str	r7, [r5, #4]
	str	r4, [r5, #24]
	str	r4, [r5, #36]
	str	r4, [r5, #28]
	str	r6, [r3, #16]
	str	r6, [r3, #20]
	str	r1, [r2]
	bl	initializeTraps
	mov	r3, #24
	mov	fp, #64
	mov	ip, #88
	mov	r10, #188
	mov	r9, #20
	mov	r0, #8
	mov	lr, #165
	mov	r1, #120
	ldr	r2, .L14+52
	stm	r2, {r4, r7}
	str	r8, [r2, #16]
	str	r3, [r2, #20]
	ldr	r2, .L14+56
	str	r4, [r2]
	ldr	r2, .L14+60
	str	r7, [r2, #4]
	ldr	r7, .L14+64
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	str	fp, [r2]
	ldr	r2, [r5]
	str	r4, [r7]
	ldr	r5, [r5, #4]
	ldr	r7, .L14+68
	sub	r2, r2, #4
	stm	r7, {r2, r5}
	ldr	r2, .L14+72
	str	r4, [r2, #48]
	str	r4, [r2, #100]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	str	r3, [r2, #68]
	str	r3, [r2, #72]
	str	r10, [r2, #4]
	str	r9, [r2, #56]
	str	ip, [r2]
	str	ip, [r2, #52]
	ldr	r2, .L14+76
	ldr	ip, .L14+80
	str	r4, [r2, #48]
	str	r4, [r2, #100]
	str	r4, [r2, #152]
	str	r4, [r2, #204]
	ldr	r5, .L14+84
	ldr	r2, .L14+88
	str	r0, [ip, #16]
	str	r0, [ip, #20]
	str	lr, [ip, #4]
	str	r1, [ip]
	str	r4, [r5]
	str	r3, [r2, #16]
	mov	r3, #60
	ldr	r0, .L14+92
	str	r6, [r2, #20]
	str	r3, [r2, #4]
	str	r4, [r0]
	str	r1, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	hero
	.word	enemyHealth
	.word	exitted
	.word	damaged
	.word	healed
	.word	enemy
	.word	heroHealth
	.word	door
	.word	unlocked
	.word	key
	.word	equippedKey
	.word	healthBar
	.word	switches
	.word	health
	.word	heart
	.word	used
	.word	knife
	.word	equippedKnife
	.size	initializeSprites, .-initializeSprites
	.align	2
	.global	initLevelOne
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLevelOne, %function
initLevelOne:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	initializeSprites
	mov	r2, #0
	ldr	r3, .L18
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L19:
	.align	2
.L18:
	.word	count
	.size	initLevelOne, .-initLevelOne
	.align	2
	.global	initializeHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeHealth, %function
initializeHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, lr}
	mov	r0, #8
	mov	lr, #165
	mov	ip, #120
	ldr	r1, .L22
	ldm	r1, {r2, r4}
	ldr	r1, .L22+4
	sub	r2, r2, #4
	stm	r1, {r2, r4}
	ldr	r2, .L22+8
	ldr	r1, .L22+12
	str	r3, [r2]
	ldr	r2, .L22+16
	str	r3, [r1, #48]
	stm	r2, {ip, lr}
	str	r3, [r1, #100]
	str	r3, [r1, #152]
	str	r3, [r1, #204]
	str	r0, [r2, #16]
	str	r0, [r2, #20]
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	hero
	.word	healthBar
	.word	used
	.word	health
	.word	heart
	.size	initializeHealth, .-initializeHealth
	.align	2
	.global	updateHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHealth, %function
updateHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L42
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, [r3]
	ldr	r2, [r3, #4]
	ldr	r6, .L42+4
	ldr	r3, .L42+8
	sub	r4, r4, #8
	str	r2, [r3, #4]
	str	r4, [r3]
	mov	r0, #0
	mov	r3, r6
	ldr	r8, .L42+12
	ldr	r1, .L42+16
	ldr	r7, .L42+20
	ldr	ip, [r8]
	ldr	lr, [r1]
	ldr	r5, [r7]
	add	r2, r2, #24
.L28:
	cmp	ip, #0
	beq	.L25
	ldr	r1, [r3, #48]
	cmp	r1, #0
	beq	.L40
.L25:
	cmp	lr, #0
	add	r1, r0, #1
	beq	.L27
	cmp	r5, #0
	bne	.L27
	ldr	r9, [r3, #48]
	cmp	r9, #0
	bne	.L41
.L27:
	cmp	r1, #4
	str	r2, [r3, #4]
	str	r4, [r3], #52
	sub	r2, r2, #8
	beq	.L24
	mov	r0, r1
	b	.L28
.L40:
	mov	ip, #1
	ldr	r2, .L42+24
	add	r3, r0, r0, lsl ip
	add	r0, r0, r3, lsl #2
	ldr	r3, [r2]
	add	r6, r6, r0, lsl #2
	sub	r3, r3, #1
	str	r1, [r8]
	str	r3, [r2]
	str	ip, [r6, #48]
.L24:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L41:
	ldr	r9, [r3, #100]
	cmp	r9, #0
	bne	.L27
	mov	r1, #1
	ldr	r2, .L42+24
	add	ip, r0, r0, lsl r1
	ldr	r3, [r2]
	add	r0, r0, ip, lsl #2
	add	r3, r3, r1
	add	r0, r6, r0, lsl #2
	str	r3, [r2]
	str	r5, [r0, #48]
	str	r1, [r7]
	b	.L24
.L43:
	.align	2
.L42:
	.word	hero
	.word	health
	.word	healthBar
	.word	damaged
	.word	healed
	.word	used
	.word	heroHealth
	.size	updateHealth, .-updateHealth
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L114
	ldr	r3, [r4, #28]
	cmp	r3, #4
	movne	r2, #4
	strne	r2, [r4, #28]
	ldr	r2, [r4, #24]
	strne	r3, [r4, #32]
	add	r3, r2, r2, lsl #2
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	ldr	r1, .L114+4
	add	r3, r3, r3, lsl #16
	ldr	r0, .L114+8
	add	r3, r2, r3, lsl #1
	add	r1, r3, r1
	cmp	r0, r1, ror #2
	sub	sp, sp, #16
	bcc	.L46
	ldr	r3, [r4, #36]
	ldr	r1, [r4, #40]
	add	r3, r3, #1
	cmp	r3, r1
	movge	r3, #0
	str	r3, [r4, #36]
.L46:
	ldr	r3, .L114+12
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L48
	mov	r1, #1
	ldr	r3, [r4, #4]
	ldr	r0, [r4, #12]
	sub	r3, r3, r0
	str	r3, [r4, #4]
	str	r1, [r4, #28]
.L48:
	ldr	r3, .L114+12
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L49
	mov	r1, #2
	ldr	r3, [r4, #4]
	ldr	r0, [r4, #12]
	add	r3, r3, r0
	str	r3, [r4, #4]
	str	r1, [r4, #28]
.L49:
	ldr	r3, .L114+12
	ldrh	r1, [r3, #48]
	tst	r1, #64
	ldr	r1, [r4]
	bne	.L50
	mov	ip, #3
	ldrh	r3, [r3, #48]
	ldr	r0, [r4, #8]
	tst	r3, #128
	sub	r0, r1, r0
	movne	r1, r0
	str	r0, [r4]
	str	ip, [r4, #28]
	bne	.L52
.L51:
	mov	r3, #0
	str	r1, [r4]
	str	r3, [r4, #28]
.L52:
	add	r2, r2, #1
	str	r2, [r4, #24]
.L55:
	ldr	r8, .L114+16
	mov	r7, #0
	mov	r5, r8
	mov	r9, #1
	ldr	r6, .L114+20
.L54:
	add	ip, r5, #16
	ldm	ip, {ip, lr}
	add	r2, r4, #16
	sub	lr, lr, #12
	ldm	r2, {r2, r3}
	ldr	r0, [r4, #4]
	str	lr, [sp, #12]
	sub	ip, ip, #12
	ldr	lr, [r5]
	str	ip, [sp, #8]
	ldr	ip, [r5, #4]
	add	r1, r1, #16
	stm	sp, {ip, lr}
	sub	r3, r3, #20
	sub	r2, r2, #16
	sub	r0, r0, #4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	strne	r9, [r5, #48]
	cmp	r7, #1
	ldr	r1, [r4]
	add	r5, r5, #52
	bne	.L72
	ldr	r3, [r8, #48]
	cmp	r3, #0
	beq	.L57
	ldr	r3, .L114+24
	str	r7, [r3, #48]
	str	r7, [r3, #100]
	str	r7, [r3, #152]
	str	r7, [r3, #204]
	str	r7, [r3, #256]
	str	r7, [r3, #308]
.L57:
	ldr	r3, [r8, #100]
	add	r2, r4, #16
	cmp	r3, #0
	ldr	r0, [r4, #4]
	ldm	r2, {r2, r3}
	bne	.L106
.L58:
	ldr	ip, .L114+28
	ldr	ip, [ip]
	cmp	ip, #0
	bne	.L60
.L61:
	ldr	r5, .L114+32
	ldr	ip, [r5]
	cmp	ip, #0
	bgt	.L107
.L63:
	ldr	r5, .L114+24
	ldr	r9, .L114+36
	ldr	r8, .L114+40
	ldr	r10, .L114+44
	add	r0, r0, #8
	add	r7, r5, #312
	b	.L68
.L66:
	add	r5, r5, #52
	cmp	r7, r5
	beq	.L108
.L68:
	ldr	ip, [r5, #48]
	cmp	ip, #0
	mov	ip, r0
	bne	.L66
	add	ip, r5, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r5]
	str	ip, [sp, #8]
	ldr	ip, [r5, #4]
	sub	r3, r3, #16
	stm	sp, {ip, lr}
	sub	r2, r2, #16
	add	r1, r1, #16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L67
	ldr	r0, [r4, #4]
	add	r5, r5, #52
	add	r0, r0, #8
	add	r2, r4, #16
	cmp	r7, r5
	mov	ip, r0
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	bne	.L68
.L108:
	ldr	lr, .L114+48
	ldr	lr, [lr]
	cmp	lr, #3
	sub	r2, r2, #8
	ble	.L109
.L69:
	ldr	lr, .L114+52
	ldr	r4, [lr, #20]
	ldr	r5, [lr, #16]
	str	r4, [sp, #12]
	mov	r0, ip
	ldm	lr, {r4, ip}
	stmib	sp, {r4, r5}
	str	ip, [sp]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L114+56
	strne	r2, [r3]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L72:
	mov	r7, #1
	b	.L54
.L67:
	ldr	r2, [r9]
	smull	r3, r1, r8, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #4
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #3
	moveq	lr, #1
	ldr	r0, [r4, #4]
	add	r2, r4, #16
	add	r0, r0, #8
	mov	ip, r0
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	streq	lr, [r10]
	b	.L66
.L50:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L110
	ldr	r3, [r4, #28]
	cmp	r3, #4
	bne	.L52
	mov	r2, #0
	ldr	r3, [r4, #32]
	str	r2, [r4, #36]
	str	r3, [r4, #28]
	b	.L55
.L107:
	ldr	ip, .L114+60
	ldr	lr, [ip, #4]
	add	lr, lr, #8
	ldr	r7, [ip, #20]
	str	lr, [sp]
	ldr	lr, [ip, #16]
	ldr	ip, [ip]
	add	r0, r0, #8
	stmib	sp, {ip, lr}
	str	r7, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L64
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	b	.L63
.L109:
	ldr	ip, .L114+64
	add	r5, ip, #16
	ldm	r5, {r5, lr}
	str	lr, [sp, #12]
	ldr	lr, [ip]
	ldr	ip, [ip, #4]
	str	r5, [sp, #8]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L111
	mov	r1, #1
	ldr	r3, .L114+68
	ldr	ip, [r4, #4]
	ldr	r2, [r4, #16]
	str	r1, [r3]
	add	ip, ip, #8
	ldr	r1, [r4]
	ldr	r3, [r4, #20]
	sub	r2, r2, #8
	b	.L69
.L106:
	ldr	r5, .L114+72
	add	ip, r5, #16
	ldm	ip, {ip, lr}
	ldr	r7, [r5]
	ldr	r5, [r5, #4]
	add	lr, lr, lr, lsr #31
	add	ip, ip, ip, lsr #31
	asr	lr, lr, #1
	asr	ip, ip, #1
	add	r7, r7, #4
	add	r5, r5, #4
	stm	sp, {r5, r7, ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L112
	mov	r2, #1
	ldr	r3, .L114+28
	str	r2, [r3]
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
.L60:
	ldr	ip, .L114+76
	add	r5, ip, #16
	ldm	r5, {r5, lr}
	str	lr, [sp, #12]
	ldr	lr, [ip]
	ldr	ip, [ip, #4]
	str	r5, [sp, #8]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L113
	mov	ip, #1
	ldr	r3, .L114+80
	ldrh	r2, [r3]
	ldr	r3, .L114+84
	tst	r2, #1
	add	r2, r4, #16
	str	ip, [r3]
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	beq	.L61
	ldr	lr, .L114+88
	ldrh	lr, [lr]
	tst	lr, #1
	ldreq	lr, .L114+92
	streq	ip, [lr]
	b	.L61
.L64:
	ldr	r2, .L114+36
	ldr	r3, .L114+40
	ldr	r2, [r2]
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #4
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #3
	moveq	r2, #1
	ldreq	r3, .L114+44
	streq	r2, [r3]
	ldr	r3, .L114+56
	ldr	r3, [r3]
	add	r2, r4, #16
	cmp	r3, #0
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	beq	.L63
	ldr	ip, .L114+80
	ldrh	ip, [ip]
	tst	ip, #1
	beq	.L63
	ldr	ip, .L114+88
	ldrh	ip, [ip]
	ands	ip, ip, #1
	streq	ip, [r5]
	b	.L63
.L112:
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	b	.L58
.L113:
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	b	.L61
.L111:
	ldr	ip, [r4, #4]
	ldr	r2, [r4, #16]
	ldr	r1, [r4]
	ldr	r3, [r4, #20]
	add	ip, ip, #8
	sub	r2, r2, #8
	b	.L69
.L110:
	ldr	r3, [r4, #8]
	add	r1, r1, r3
	b	.L51
.L115:
	.align	2
.L114:
	.word	hero
	.word	715827880
	.word	357913940
	.word	67109120
	.word	switches
	.word	collision
	.word	traps
	.word	equippedKey
	.word	enemyHealth
	.word	count
	.word	1717986919
	.word	damaged
	.word	heroHealth
	.word	knife
	.word	equippedKnife
	.word	enemy
	.word	heart
	.word	healed
	.word	key
	.word	door
	.word	oldButtons
	.word	unlocked
	.word	buttons
	.word	exitted
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L124
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #16]
	add	r1, r2, r1
	cmp	r1, #149
	mvngt	r1, #0
	strgt	r1, [r3, #12]
	cmp	r2, #90
	movle	r1, #1
	ldr	r0, .L124+4
	strle	r1, [r3, #12]
	ldr	r1, [r0, #4]
	add	r1, r1, #8
	cmp	r2, r1
	beq	.L123
.L119:
	ldr	r1, .L124+8
	ldr	r1, [r1]
	tst	r1, #1
	ldreq	r1, [r3, #12]
	addeq	r2, r1, r2
	streq	r2, [r3, #4]
	bx	lr
.L123:
	ldr	r1, [r0]
	ldr	r0, [r3]
	sub	ip, r1, #25
	cmp	ip, r0
	bgt	.L119
	mov	r2, #0
	sub	r1, r1, #3
	cmp	r0, r1
	str	r2, [r3, #12]
	bxge	lr
	ldr	r2, .L124+8
	ldr	r2, [r2]
	tst	r2, #1
	ldreq	r2, [r3, #8]
	addeq	r0, r2, r0
	streq	r0, [r3]
	bx	lr
.L125:
	.align	2
.L124:
	.word	enemy
	.word	hero
	.word	count
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateLevelOne
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLevelOne, %function
updateLevelOne:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateEnemy
	bl	updatePlayer
	bl	updateHealth
	ldr	r2, .L128
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L129:
	.align	2
.L128:
	.word	count
	.size	updateLevelOne, .-updateLevelOne
	.align	2
	.global	drawSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSprites, %function
drawSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L156
	ldr	ip, .L156+4
	ldr	r3, [r0, #4]
	and	r3, r3, ip
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, .L156+8
	push	{r4, r5, r6, lr}
	ldr	r4, [r0, #28]
	ldr	lr, [r2]
	ldr	r2, [r0, #36]
	ldr	r1, .L156+12
	ldrb	r0, [r0]	@ zero_extendqisi2
	add	r2, r2, r4, lsl #5
	lsl	r2, r2, #2
	cmp	lr, #0
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	ble	.L131
	ldr	r2, .L156+16
	ldr	r3, [r2, #4]
	ldrb	r0, [r2]	@ zero_extendqisi2
	and	r3, r3, ip
	ldr	r2, .L156+20
	orr	r3, r3, #16384
	strh	r3, [r1, #10]	@ movhi
	strh	r0, [r1, #8]	@ movhi
	strh	r2, [r1, #12]	@ movhi
.L132:
	ldr	r0, .L156+24
	ldr	r0, [r0]
	cmp	r0, #0
	movne	r0, #704
	moveq	r0, #544
	ldr	r2, .L156+28
	ldr	r3, [r2, #4]
	ldrb	r2, [r2]	@ zero_extendqisi2
	lsl	r3, r3, #23
	strh	r2, [r1, #16]	@ movhi
	lsr	r3, r3, #23
	ldr	r2, .L156+32
	orr	r3, r3, #32768
	strh	r3, [r1, #18]	@ movhi
	strh	r0, [r1, #20]	@ movhi
	ldr	r3, [r2, #4]
	ldr	r0, [r2, #48]
	lsl	r3, r3, #23
	cmp	r0, #0
	ldrne	ip, .L156+36
	ldreq	ip, .L156+40
	ldrb	r0, [r2]	@ zero_extendqisi2
	lsr	r3, r3, #23
	orr	r3, r3, #32768
	strh	r0, [r1, #24]	@ movhi
	strh	r3, [r1, #26]	@ movhi
	strh	ip, [r1, #28]	@ movhi
	ldr	r3, [r2, #56]
	ldr	ip, [r2, #100]
	ldr	r0, .L156+4
	cmp	ip, #0
	and	r3, r3, r0
	ldrb	ip, [r2, #52]	@ zero_extendqisi2
	ldr	lr, .L156+44
	orr	r3, r3, #32768
	beq	.L137
	ldr	r4, .L156+48
	ldr	r2, [r4, #4]
	and	r2, r2, r0
	orr	r2, r2, lr
	ldrb	r4, [r4]	@ zero_extendqisi2
	ldr	lr, .L156+36
	ldr	r0, .L156+52
	strh	ip, [r1, #32]	@ movhi
	strh	r3, [r1, #34]	@ movhi
	strh	r2, [r1, #42]	@ movhi
	strh	r4, [r1, #40]	@ movhi
	strh	lr, [r1, #36]	@ movhi
	strh	r0, [r1, #44]	@ movhi
.L138:
	ldr	r3, .L156+56
	ldr	r3, [r3]
	cmp	r3, #0
	ldrhne	r3, [r1, #40]
	ldr	r0, .L156+12
	orrne	r3, r3, #512
	strhne	r3, [r1, #40]	@ movhi
	mov	r2, r0
	mov	r1, r0
	ldr	r3, .L156+60
	ldr	r6, .L156+4
	ldr	r5, .L156+64
	add	lr, r3, #312
.L142:
	ldr	ip, [r3, #48]
	cmp	ip, #0
	ldreq	ip, [r3, #4]
	ldrhne	ip, [r2, #48]
	ldrbeq	r4, [r3]	@ zero_extendqisi2
	andeq	ip, ip, r6
	orrne	ip, ip, #512
	add	r3, r3, #52
	strheq	r5, [r2, #52]	@ movhi
	strheq	ip, [r2, #50]	@ movhi
	strheq	r4, [r2, #48]	@ movhi
	strhne	ip, [r2, #48]	@ movhi
	cmp	lr, r3
	add	r2, r2, #8
	bne	.L142
	mov	r5, #207
	mov	lr, #239
	ldr	r3, .L156+68
	ldr	ip, .L156+4
	ldr	r2, [r3, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r2, r2, ip
	orr	r3, r3, #16384
	strh	r3, [r1, #96]	@ movhi
	orr	r2, r2, #16384
	ldr	r3, .L156+72
	strh	r2, [r1, #98]	@ movhi
	strh	r5, [r1, #100]	@ movhi
	mov	r4, ip
	add	ip, r3, #208
.L145:
	ldr	r2, [r3, #48]
	cmp	r2, #0
	ldreq	r2, [r3, #4]
	ldrhne	r2, [r0, #104]
	ldrbeq	r5, [r3]	@ zero_extendqisi2
	andeq	r2, r2, r4
	orrne	r2, r2, #512
	add	r3, r3, #52
	strheq	lr, [r0, #108]	@ movhi
	strheq	r2, [r0, #106]	@ movhi
	strheq	r5, [r0, #104]	@ movhi
	strhne	r2, [r0, #104]	@ movhi
	cmp	ip, r3
	add	r0, r0, #8
	bne	.L145
	ldr	r3, .L156+76
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L146
	mov	r0, #205
	ldr	r2, .L156+80
	ldr	r3, [r2, #4]
	ldrb	r2, [r2]	@ zero_extendqisi2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	strh	r3, [r1, #138]	@ movhi
	strh	r2, [r1, #136]	@ movhi
	strh	r0, [r1, #140]	@ movhi
.L147:
	ldr	r3, .L156+84
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L148
	ldr	r2, .L156+88
	ldr	r3, [r2, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mov	r0, #109
	mvn	r3, r3, lsr #17
	ldrb	r2, [r2]	@ zero_extendqisi2
	orr	r2, r2, #16384
	strh	r3, [r1, #146]	@ movhi
	strh	r2, [r1, #144]	@ movhi
	strh	r0, [r1, #148]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L137:
	ldr	r2, .L156+40
	strh	ip, [r1, #32]	@ movhi
	strh	r3, [r1, #34]	@ movhi
	strh	r2, [r1, #36]	@ movhi
	b	.L138
.L148:
	ldrh	r3, [r1, #144]
	orr	r3, r3, #512
	strh	r3, [r1, #144]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L146:
	ldrh	r3, [r1, #136]
	orr	r3, r3, #512
	strh	r3, [r1, #136]	@ movhi
	b	.L147
.L131:
	ldrh	r3, [r1, #8]
	orr	r3, r3, #512
	strh	r3, [r1, #8]	@ movhi
	b	.L132
.L157:
	.align	2
.L156:
	.word	hero
	.word	511
	.word	enemyHealth
	.word	shadowOAM
	.word	enemy
	.word	646
	.word	unlocked
	.word	door
	.word	switches
	.word	554
	.word	682
	.word	-32768
	.word	key
	.word	870
	.word	equippedKey
	.word	traps
	.word	550
	.word	healthBar
	.word	health
	.word	healed
	.word	heart
	.word	equippedKnife
	.word	knife
	.size	drawSprites, .-drawSprites
	.align	2
	.global	drawLevelOne
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLevelOne, %function
drawLevelOne:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawSprites
	ldr	r4, .L160
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L160+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L160+8
	ldrh	r1, [r2]
	ldrh	r2, [r2, #4]
	pop	{r4, lr}
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L161:
	.align	2
.L160:
	.word	DMANow
	.word	shadowOAM
	.word	.LANCHOR0
	.size	drawLevelOne, .-drawLevelOne
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
	.global	vOff
	.global	hOff
	.comm	equippedKnife,4,4
	.comm	equippedKey,4,4
	.comm	exitted,4,4
	.comm	pressed,4,4
	.comm	unlocked,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
