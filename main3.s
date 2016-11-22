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

decimal:
	cmpq	$0, %rdi	
	je	L1
	
	movq	$10, %rcx
	movq	$0, %rdx
	movq	%rdi, %rax
	divq	%rcx
	pushq	%rdx
	
	movq	%rax, %rdi
	call	decimal	

	popq	%rdx	
	add	$48, %rdx
	movq	%rdx, %rdi
	call	putchar
L1:	
	ret

main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6

	movq	$72940023, %rdi
	call	decimal

	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 6.2.1 20160830"
	.section	.note.GNU-stack,"",@progbits
