; ---------------------------------------------------------------------------- ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: aisraely <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/06/07 21:56:18 by aisraely          #+#    #+#              ;
;    Updated: 2021/06/07 21:56:20 by aisraely         ###   ########.fr        ;
;                                                                              ;
; ---------------------------------------------------------------------------- ;

		global	_ft_strcmp
		section	.text

_ft_strcmp:
		xor		rax, rax
		xor		rcx, rcx
while:
		movzx	rax, byte [rdi]			; save -s1
		movzx	rcx, byte [rsi]			; save -s2
		cmp		byte [rdi], 0			; if (-s1 == '\0'...
		je		exit
		cmp		rax, rcx				; ... -s1 != -s2)
		jne		exit					; return (-s1 - -s2);
		inc		rdi						; s1++;
		inc		rsi						; s2++;
		jmp		while
exit:
		sub 		rax, rcx 
		ret
