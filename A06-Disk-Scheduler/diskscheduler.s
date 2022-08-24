	.file	"diskscheduler.c"
	.text
	.section	.rodata
.LC0:
	.string	"w+"
.LC1:
	.string	"tp2323955.txt"
.LC2:
	.string	"%d\n"
	.text
	.globl	findNearestHead
	.type	findNearestHead, @function
findNearestHead:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movl	%edi, -84(%rbp)
	movl	%esi, -88(%rbp)
	movq	%rdx, -96(%rbp)
	movl	%ecx, -100(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -40(%rbp)
	movl	$0, -80(%rbp)
	movl	$0, -68(%rbp)
	movl	$5001, -76(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	movl	$0, -72(%rbp)
	jmp	.L2
.L9:
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -68(%rbp)
	movl	-88(%rbp), %eax
	subl	-68(%rbp), %eax
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	cmpl	%eax, -76(%rbp)
	jle	.L3
	cmpl	$0, -84(%rbp)
	je	.L4
.L3:
	movl	-88(%rbp), %eax
	subl	-68(%rbp), %eax
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	cmpl	%eax, -76(%rbp)
	jle	.L5
	cmpl	$1, -84(%rbp)
	jne	.L5
	movl	-68(%rbp), %eax
	cmpl	-88(%rbp), %eax
	jge	.L4
.L5:
	movl	-88(%rbp), %eax
	subl	-68(%rbp), %eax
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	cmpl	%eax, -76(%rbp)
	jle	.L6
	cmpl	$-1, -84(%rbp)
	jne	.L6
	movl	-68(%rbp), %eax
	cmpl	-88(%rbp), %eax
	jg	.L6
.L4:
	movl	-88(%rbp), %eax
	subl	-68(%rbp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, -76(%rbp)
	subl	%eax, -76(%rbp)
	cmpl	$0, -72(%rbp)
	je	.L7
	movl	-80(%rbp), %eax
	movl	%eax, %ecx
	leaq	.LC2(%rip), %rdx
	movl	$0, %esi
	movl	$0, %edi
	movl	$0, %eax
	call	snprintf@PLT
	movl	%eax, -60(%rbp)
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rsi
	movl	-80(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, %ecx
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	movq	-40(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fputs@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L7:
	movl	-68(%rbp), %eax
	movl	%eax, -80(%rbp)
	jmp	.L8
.L6:
	movq	-56(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fputs@PLT
.L8:
	addl	$1, -72(%rbp)
.L2:
	movq	-96(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	leaq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	getline@PLT
	movq	%rax, -32(%rbp)
	cmpq	$-1, -32(%rbp)
	jne	.L9
	cmpl	$0, -100(%rbp)
	jne	.L10
	movl	-80(%rbp), %eax
	movl	%eax, %ecx
	leaq	.LC2(%rip), %rdx
	movl	$0, %esi
	movl	$0, %edi
	movl	$0, %eax
	call	snprintf@PLT
	movl	%eax, -64(%rbp)
	movl	-64(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movl	-64(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rsi
	movl	-80(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	%edx, %ecx
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	movq	-40(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fputs@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L10:
	movq	-96(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rsi
	movl	$0, %edi
	call	freopen@PLT
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	jmp	.L11
.L12:
	movq	-56(%rbp), %rax
	movq	-96(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fputs@PLT
.L11:
	movq	-40(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	leaq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	getline@PLT
	movq	%rax, -32(%rbp)
	cmpq	$-1, -32(%rbp)
	jne	.L12
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC1(%rip), %rdi
	call	remove@PLT
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	-80(%rbp), %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	findNearestHead, .-findNearestHead
	.globl	checkDirection
	.type	checkDirection, @function
checkDirection:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movl	%esi, -72(%rbp)
	movq	%rdx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -52(%rbp)
	movl	$1, -48(%rbp)
	movl	$1, -44(%rbp)
	movl	$0, -40(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	jmp	.L16
.L18:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -40(%rbp)
	movl	-40(%rbp), %eax
	cmpl	-72(%rbp), %eax
	jg	.L17
	movl	$0, -48(%rbp)
.L17:
	movl	-40(%rbp), %eax
	cmpl	-72(%rbp), %eax
	jl	.L16
	movl	$0, -44(%rbp)
.L16:
	movq	-80(%rbp), %rdx
	leaq	-24(%rbp), %rcx
	leaq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	getline@PLT
	movq	%rax, -16(%rbp)
	cmpq	$-1, -16(%rbp)
	jne	.L18
	movq	-80(%rbp), %rdx
	movl	-72(%rbp), %esi
	movl	-68(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	findNearestHead
	movl	%eax, -36(%rbp)
	cmpl	$1, -68(%rbp)
	jne	.L19
	movl	$4999, %eax
	subl	-72(%rbp), %eax
	movl	%eax, %ecx
	movl	-72(%rbp), %eax
	subl	-36(%rbp), %eax
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	cmpl	%eax, %ecx
	jge	.L19
	negl	-68(%rbp)
	movl	$4999, %eax
	subl	-72(%rbp), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	.L20
.L19:
	cmpl	$-1, -68(%rbp)
	jne	.L21
	movl	-72(%rbp), %eax
	subl	-36(%rbp), %eax
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	cmpl	%eax, -72(%rbp)
	jge	.L21
	negl	-68(%rbp)
	movl	-72(%rbp), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	.L20
.L21:
	cmpl	$1, -68(%rbp)
	jne	.L22
	cmpl	$1, -44(%rbp)
	jne	.L22
	negl	-68(%rbp)
	movl	$4999, %eax
	subl	-72(%rbp), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	.L20
.L22:
	cmpl	$-1, -68(%rbp)
	jne	.L20
	cmpl	$1, -48(%rbp)
	jne	.L20
	negl	-68(%rbp)
	movl	-72(%rbp), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movl	%eax, -52(%rbp)
.L20:
	movl	-68(%rbp), %eax
	movl	%eax, tempArr.2866(%rip)
	movl	-52(%rbp), %eax
	movl	%eax, 4+tempArr.2866(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	leaq	tempArr.2866(%rip), %rax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	checkDirection, .-checkDirection
	.globl	checkBorder
	.type	checkBorder, @function
checkBorder:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -48(%rbp)
	movl	$1, -44(%rbp)
	movl	$0, -36(%rbp)
	movl	$0, -40(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	jmp	.L26
.L27:
	movl	$1, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L26
	movl	$0, -44(%rbp)
.L26:
	movq	-64(%rbp), %rdx
	leaq	-24(%rbp), %rcx
	leaq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	getline@PLT
	movq	%rax, -16(%rbp)
	cmpq	$-1, -16(%rbp)
	jne	.L27
	cmpl	$1, -44(%rbp)
	jne	.L28
	cmpl	$1, -40(%rbp)
	jne	.L28
	movl	$5000, %eax
	subl	-52(%rbp), %eax
	movl	%eax, -48(%rbp)
	movl	$0, -52(%rbp)
.L28:
	movl	-52(%rbp), %eax
	movl	%eax, tempArr.2882(%rip)
	movl	-48(%rbp), %eax
	movl	%eax, 4+tempArr.2882(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	leaq	tempArr.2882(%rip), %rax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L30
	call	__stack_chk_fail@PLT
.L30:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	checkBorder, .-checkBorder
	.globl	fcfs
	.type	fcfs, @function
fcfs:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -72(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -52(%rbp)
	movl	$0, -40(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L32
.L34:
	movq	-80(%rbp), %rdx
	leaq	-24(%rbp), %rcx
	leaq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	getline@PLT
	movq	%rax, -16(%rbp)
	cmpl	$0, -44(%rbp)
	jne	.L33
	movl	-68(%rbp), %eax
	movl	%eax, -48(%rbp)
.L33:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -36(%rbp)
	movl	-48(%rbp), %eax
	subl	-36(%rbp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, -40(%rbp)
	subl	%eax, -40(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, -48(%rbp)
	movl	-40(%rbp), %eax
	addl	%eax, -52(%rbp)
	addl	$1, -44(%rbp)
.L32:
	movl	-44(%rbp), %eax
	cmpl	-72(%rbp), %eax
	jl	.L34
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	movl	-52(%rbp), %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L36
	call	__stack_chk_fail@PLT
.L36:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	fcfs, .-fcfs
	.section	.rodata
.LC3:
	.string	"dp2323955.txt"
	.text
	.globl	sstf
	.type	sstf, @function
sstf:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -72(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	leaq	.LC0(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -24(%rbp)
	movl	$0, -64(%rbp)
	movl	$0, -52(%rbp)
	movl	$0, -48(%rbp)
	jmp	.L38
.L39:
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fputs@PLT
.L38:
	movq	-80(%rbp), %rdx
	leaq	-32(%rbp), %rcx
	leaq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	getline@PLT
	movq	%rax, -16(%rbp)
	cmpq	$-1, -16(%rbp)
	jne	.L39
	movl	$0, -56(%rbp)
	jmp	.L40
.L42:
	cmpl	$0, -56(%rbp)
	jne	.L41
	movl	-68(%rbp), %eax
	movl	%eax, -60(%rbp)
.L41:
	movq	-24(%rbp), %rdx
	movl	-60(%rbp), %esi
	movl	-48(%rbp), %eax
	movl	$1, %ecx
	movl	%eax, %edi
	call	findNearestHead
	movl	%eax, -44(%rbp)
	movl	-60(%rbp), %eax
	subl	-44(%rbp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, -52(%rbp)
	subl	%eax, -52(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, -60(%rbp)
	movl	-52(%rbp), %eax
	addl	%eax, -64(%rbp)
	addl	$1, -56(%rbp)
.L40:
	movl	-56(%rbp), %eax
	cmpl	-72(%rbp), %eax
	jl	.L42
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC3(%rip), %rdi
	call	remove@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	movl	-64(%rbp), %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L44
	call	__stack_chk_fail@PLT
.L44:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	sstf, .-sstf
	.globl	scan
	.type	scan, @function
scan:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movl	%edx, -88(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	leaq	.LC0(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -32(%rbp)
	movl	$0, -72(%rbp)
	movl	$0, -56(%rbp)
	movl	$1, -64(%rbp)
	jmp	.L46
.L47:
	movq	-48(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fputs@PLT
.L46:
	movq	-96(%rbp), %rdx
	leaq	-40(%rbp), %rcx
	leaq	-48(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	getline@PLT
	movq	%rax, -24(%rbp)
	cmpq	$-1, -24(%rbp)
	jne	.L47
	movl	$0, -60(%rbp)
	jmp	.L48
.L50:
	cmpl	$0, -60(%rbp)
	jne	.L49
	movl	-84(%rbp), %eax
	movl	%eax, -68(%rbp)
.L49:
	movq	-32(%rbp), %rdx
	movl	-68(%rbp), %esi
	movl	-64(%rbp), %eax
	movl	$1, %ecx
	movl	%eax, %edi
	call	findNearestHead
	movl	%eax, -52(%rbp)
	movq	-32(%rbp), %rdx
	movl	-52(%rbp), %ecx
	movl	-64(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	checkDirection
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -64(%rbp)
	movl	-68(%rbp), %eax
	subl	-52(%rbp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, -56(%rbp)
	subl	%eax, -56(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, -68(%rbp)
	movl	-56(%rbp), %eax
	addl	%eax, -72(%rbp)
	movq	-16(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %eax
	addl	%eax, -72(%rbp)
	addl	$1, -60(%rbp)
.L48:
	movl	-60(%rbp), %eax
	cmpl	-88(%rbp), %eax
	jl	.L50
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC3(%rip), %rdi
	call	remove@PLT
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	movl	-72(%rbp), %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L52
	call	__stack_chk_fail@PLT
.L52:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	scan, .-scan
	.globl	cscan
	.type	cscan, @function
cscan:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movl	%edx, -88(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	leaq	.LC0(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -32(%rbp)
	movl	$0, -72(%rbp)
	movl	$0, -56(%rbp)
	movl	$1, -52(%rbp)
	jmp	.L54
.L55:
	movq	-48(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fputs@PLT
.L54:
	movq	-96(%rbp), %rdx
	leaq	-40(%rbp), %rcx
	leaq	-48(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	getline@PLT
	movq	%rax, -24(%rbp)
	cmpq	$-1, -24(%rbp)
	jne	.L55
	movl	$0, -60(%rbp)
	jmp	.L56
.L59:
	cmpl	$0, -60(%rbp)
	jne	.L57
	movl	-84(%rbp), %eax
	movl	%eax, -64(%rbp)
.L57:
	movq	-32(%rbp), %rdx
	movl	-64(%rbp), %esi
	movl	-52(%rbp), %eax
	movl	$1, %ecx
	movl	%eax, %edi
	call	findNearestHead
	movl	%eax, -68(%rbp)
	movq	-32(%rbp), %rdx
	movl	-68(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	checkBorder
	movq	%rax, -16(%rbp)
	movl	-64(%rbp), %eax
	subl	-68(%rbp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, -56(%rbp)
	subl	%eax, -56(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L58
	movq	-32(%rbp), %rdx
	movl	-52(%rbp), %eax
	movl	$1, %ecx
	movl	$0, %esi
	movl	%eax, %edi
	call	findNearestHead
	movl	%eax, -68(%rbp)
.L58:
	movl	-68(%rbp), %eax
	movl	%eax, -64(%rbp)
	movl	-56(%rbp), %eax
	addl	%eax, -72(%rbp)
	movq	-16(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %eax
	addl	%eax, -72(%rbp)
	addl	$1, -60(%rbp)
.L56:
	movl	-60(%rbp), %eax
	cmpl	-88(%rbp), %eax
	jl	.L59
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC3(%rip), %rdi
	call	remove@PLT
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	movl	-72(%rbp), %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L61
	call	__stack_chk_fail@PLT
.L61:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	cscan, .-cscan
	.section	.rodata
	.align 8
.LC4:
	.string	"ERROR: Usage = ./diskscheduler <initial_pos> <cylinder_file>"
	.align 8
.LC5:
	.string	"ERROR: <initial_pos> must be between 0-4999"
.LC6:
	.string	"r"
	.align 8
.LC7:
	.string	"ERROR: The file could not be opened"
.LC8:
	.string	"FCFS Page Faults = %d\n"
.LC9:
	.string	"SSTF Page Faults = %d\n"
.LC10:
	.string	"SCAN Page Faults = %d\n"
.LC11:
	.string	"C-SCAN Page Faults = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	cmpl	$3, -52(%rbp)
	je	.L63
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$-1, %eax
	jmp	.L64
.L63:
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	js	.L65
	cmpl	$4999, -28(%rbp)
	jle	.L66
.L65:
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movl	$-1, %eax
	jmp	.L64
.L66:
	movq	-64(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L67
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	movl	$-1, %eax
	jmp	.L64
.L67:
	movl	$0, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getc@PLT
	movb	%al, -33(%rbp)
	jmp	.L68
.L70:
	cmpb	$10, -33(%rbp)
	jne	.L69
	addl	$1, -32(%rbp)
.L69:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getc@PLT
	movb	%al, -33(%rbp)
.L68:
	cmpb	$-1, -33(%rbp)
	jne	.L70
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	movl	-32(%rbp), %edx
	movq	-8(%rbp), %rcx
	movl	-28(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	fcfs
	movl	%eax, -24(%rbp)
	movl	-32(%rbp), %edx
	movq	-8(%rbp), %rcx
	movl	-28(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	sstf
	movl	%eax, -20(%rbp)
	movl	-32(%rbp), %edx
	movq	-8(%rbp), %rcx
	movl	-28(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	scan
	movl	%eax, -16(%rbp)
	movl	-32(%rbp), %edx
	movq	-8(%rbp), %rcx
	movl	-28(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	cscan
	movl	%eax, -12(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, %eax
.L64:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.local	tempArr.2866
	.comm	tempArr.2866,8,8
	.local	tempArr.2882
	.comm	tempArr.2882,8,8
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
