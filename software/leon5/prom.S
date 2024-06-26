
/* Template boot-code for LEON3 test benches */

#include "prom.h"

#ifndef STACKSIZE
#define STACKSIZE 0x00020000
#endif


	.seg	"text"
	.proc	0
	.align	4
	.global start
start:

	flush
	set 0x10e0, %g1		! init IU
	mov %g1, %psr
	mov %g0, %wim
	mov %g0, %tbr
	mov %g0, %y
	mov %g0, %asr16
	nop
	set  0x81000f, %g1
	sta %g1, [%g0] 2
	mov %g0, %g2
	nop
	nop
	nop
	nop
	nop
	or %g2, %g2, %g0
	nop
	nop
	nop
	nop
	nop
#ifdef DSUADDR
	set	DSUADDR, %g2
	st	%g0, [%g2]
	st	%g0, [%g2+0x08]
	st	%g0, [%g2+0x20]
	st	%g0, [%g2+0x24]
	st	%g0, [%g2+0x40]
	st	%g0, [%g2+0x44]
	st	%g0, [%g2+0x50]
	st	%g0, [%g2+0x54]
	st	%g0, [%g2+0x58]
	st	%g0, [%g2+0x5C]
	st	%g0, [%g2+0x54]
#endif

2:
	mov %asr17, %g3
	and %g3, 0x1f, %g3
	mov %g0, %g4
	mov %g0, %g5
	mov %g0, %g6
	mov %g0, %g7
1:
	mov %g0, %l0
	mov %g0, %l1
	mov %g0, %l2
	mov %g0, %l3
	mov %g0, %l4
	mov %g0, %l5
	mov %g0, %l6
	mov %g0, %l7
	mov %g0, %o0
	mov %g0, %o1
	mov %g0, %o2
	mov %g0, %o3
	mov %g0, %o4
	mov %g0, %o5
	mov %g0, %o6
	mov %g0, %o7
	subcc %g3, 1, %g3
	bge 1b
	save

	mov	2, %g1
	mov	%g1, %wim
	set 0x10e0, %g1		! enable traps
	mov %g1, %psr
	nop; nop; nop;

	mov %psr, %g1
	srl %g1, 12, %g1
	andcc %g1, 1, %g0
	be 1f
	nop

	set _fsrxx, %g3
	ld [%g3], %fsr
	ldd [%g3], %f0
	ldd [%g3], %f2
	ldd [%g3], %f4
	ldd [%g3], %f6
	ldd [%g3], %f8
	ldd [%g3], %f10
	ldd [%g3], %f12
	ldd [%g3], %f14
	ldd [%g3], %f16
	ldd [%g3], %f18
	ldd [%g3], %f20
	ldd [%g3], %f22
	ldd [%g3], %f24
	ldd [%g3], %f26
	ldd [%g3], %f28
	ldd [%g3], %f30
	nop
	nop
	nop
	nop
	nop
	faddd %f0, %f2, %f4
	nop
	nop
	nop
	nop
	ba  1f	
	nop
	
	
.align	8
_fsrxx:
	.word 0
	.word 0

1:
	mov %asr17, %g3
	srl %g3, 28, %g3
	andcc %g3, 0x0f, %g3
	bne 1f
	 nop

#ifdef L2MCTRLIO
	set L2MCTRLIO, %g1
	set MCFG1, %g2
	st  %g2, [%g1]
	set MCFG2, %g2
	st  %g2, [%g1+4]
	set MCFG3, %g2
	st  %g2, [%g1+8]
#endif
!	set IRQCTRL, %g1
!	set 0x0ffff, %g2
!	st  %g2, [%g1+0x10]

#ifdef UARTADDR
        set UARTADDR, %g1
        st  %g0, [%g1+0xC]
        set 3, %g2
        st %g2,  [%g1+0x8]
#ifdef XPREV
        set 32, %g2
9:      subcc %g2, 1, %g2
        bne 9b
         st %g0, [%g1+0x10]
#endif
#endif

#if defined(GPTADDR) && (defined(TIMERFREQ) || defined(XPREV))
#ifndef TIMERFREQ
#define TIMERFREQ 1
#endif
        set GPTADDR, %g1
        set (TIMERFREQ-1), %g2
        st %g2, [%g1+4]
#ifdef XPREV
        st %g0, [%g1+0x10]
        st %g0, [%g1+0x14]
#endif
#endif

#if defined(IRQCTRL) && defined(XPREV)
        set IRQCTRL, %g1
#ifdef XPREV
        st %g0, [%g1]
#endif
#endif

#ifdef DDR2CTRLIO
	set DDR2CTRLIO, %g1
	set DDR2CFG4, %g2
	st  %g2, [%g1+12]
#endif

#ifdef ASDCFG
#ifndef SDCTRLPNP
#define SDCTRLPNP 0xFFFFF860
#endif
	set SDCTRLPNP, %g1
	ld  [%g1], %g2
	srl %g2, 12, %g2
	set 0x01009, %g1
	subcc %g1, %g2, %g0
	bne 1f

	set ASDCFG, %g1
	set DSDCFG, %g2
	st  %g2, [%g1]
#endif

	! %g3 = cpu index
1:	set STACKSIZE, %g2
        mov %g0, %g1
2:	subcc %g3, 0, %g0
	be 3f
	nop
	add %g1, %g2, %g1
	ba 2b
	sub %g3, 1, %g3


3:	set RAMSTART+ RAMSIZE-32, %fp
	sub %fp, %g1, %fp
	sub %fp, 96, %sp

	set RAMSTART, %g1

	jmp %g1
	nop

.align	32
