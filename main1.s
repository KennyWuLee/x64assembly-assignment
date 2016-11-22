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

	#msg address
	movq	msg(%rip), %rbx
	#counter
	movq	$0, %r12
L1:
	movq	%rbx, %rax
	addq	%r12, %rax
	movzbl	(%rax), %edi
	#stop at 0 char
	cmp	$0, %edi
	je	L2
	call	putchar
	inc	%r12
	jmp	L1
L2:
	movq	%rbx, %rax
	addq	%r12, %rax
	movzbl	(%rax), %edi
	cmp	$0, %r12
	jl	L3
	call	putchar
	dec	%r12
	jmp	L2
L3:



	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 6.2.1 20160830"
	.section	.note.GNU-stack,"",@progbits
