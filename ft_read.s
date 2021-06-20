; ---------------------------------------------------------------------------- ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_read.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: aisraely <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/06/07 21:59:29 by aisraely          #+#    #+#              ;
;    Updated: 2021/06/07 21:59:30 by aisraely         ###   ########.fr        ;
;                                                                              ;
; ---------------------------------------------------------------------------- ;

		extern	___error
		global	_ft_read
		section	.text
_ft_read:
		mov		rax, 0x02000003	; write syscall number
		syscall					; invoke syscall with the syscall num in rax
		jc		error			; if carry flag detects error, set errno
		jmp		exit
error:
		push	rax				; save the error code on the stack
		call	___error		; call __error which puts a pointer to 'errno' into rax
		pop		rcx				; move the error code from the stack to rcx
		mov		[rax], rcx		; go by the errno pointer and put in it the error code
		mov		rax, -1			; put -1 into rax, instead of the errno pointer
		jmp		exit
exit:
		ret
