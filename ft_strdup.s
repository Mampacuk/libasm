; ---------------------------------------------------------------------------- ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: aisraely <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/06/07 21:56:28 by aisraely          #+#    #+#              ;
;    Updated: 2021/06/07 21:56:29 by aisraely         ###   ########.fr        ;
;                                                                              ;
; ---------------------------------------------------------------------------- ;

		extern	_malloc
		extern	_ft_strlen
		extern	___error
		extern	_ft_strcpy
		global	_ft_strdup
		section	.text
_ft_strdup:
		xor		rax, rax		; rax = 0;
		cmp		rdi, 0			; is the given string null?
		je		exit			; YES: exit with a null
		push	rdi				; save rdi
		call	_ft_strlen		; rax now holds strlen
		inc		rax				; +1 byte for terminating byte
		mov		rdi, rax		; rdi now holds strlen for malloc
		call	_malloc			; rax now holds the pointer to the resulting string
		jc		error			; if malloc failed, return NULL
		pop		rdi				; restore rdi
		mov		rsi, rdi		; push rdi to src of future ft_strcpy call
		mov		rdi, rax		; push rax to dst of future ft_strcpy call
		call	_ft_strcpy		; call ft_strcpy on 'em
		jmp		exit			; return
error:
		push	rax
    	call	___error
    	pop		rcx	
    	mov		qword [rax], 12	; set errno to ENOMEM
    	xor		rax, rax
		jmp		exit
exit:
		ret
