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


isprime:
	movq	$2, %rcx
L3:
	movq	%rcx, %rax
	imulq	%rax
	cmpq	%rax, %rdi
	jl	L4	

	movq	$0, %rdx
	movq	%rdi, %rax	
	divq	%rcx	
	cmpq	$0, %rdx
	je	L5

	inc	%rcx
	jmp	L3
L4:
	movq	$1, %rax
	jmp	L2
L5:
	movq	$0, %rax
L2:	
	ret

main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6

	movl	$1000000000, %ebx	
L7:
	movl	%ebx, %edi
	call	isprime
	cmpl	$1, %eax
	jne	L6
	
	call	decimal
	movl	$10, %edi
	call	putchar
L6:
	incl	%ebx
	cmpl	$1000000100, %ebx
	jle	L7
	
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 6.2.1 20160830"
	.section	.note.GNU-stack,"",@progbits
