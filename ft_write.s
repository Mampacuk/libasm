; ---------------------------------------------------------------------------- ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_write.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: aisraely <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/06/07 21:58:49 by aisraely          #+#    #+#              ;
;    Updated: 2021/06/07 21:58:49 by aisraely         ###   ########.fr        ;
;                                                                              ;
; ---------------------------------------------------------------------------- ;

		extern	___error
		global	_ft_write
		section	.text
_ft_write:
		mov		rax, 0x02000004	; write syscall number
		syscall					; invoke syscall with the syscall num in rax
		jc		error			; if carry flag detects error, set errno
		jmp		exit
error:
		push	rax
    	call	___error
    	pop		rcx	
    	mov		[rax], rcx
    	mov		rax, -1
		jmp		exit
exit:
		ret
