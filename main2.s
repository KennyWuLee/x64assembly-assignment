	.file	"main.c"
	.globl	msg
	.section	.rodata
.LC0:
	.string	"hello"
	.data
	.align 8
	.type	msg, @object
	.size	msg, 8
msg:
	.quad	.LC0
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6

	movl	$200, %ebx
	movl	$1, %r12d
	sall	$31, %r12d
L1:
	movl	%ebx, %eax
	andl	%r12d, %eax
	cmpl	$0, %eax
	jg	L2
	movl	$48, %edi
	call	putchar
	jmp	L3
L2:
	movl	$49, %edi
	call	putchar
L3:
	shrl	$1, %r12d
	cmpl	$0, %r12d	
	jne	L1

	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 6.2.1 20160830"
	.section	.note.GNU-stack,"",@progbits
