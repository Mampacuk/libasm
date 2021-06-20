; ---------------------------------------------------------------------------- ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: aisraely <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/06/07 21:59:58 by aisraely          #+#    #+#              ;
;    Updated: 2021/06/07 21:59:59 by aisraely         ###   ########.fr        ;
;                                                                              ;
; ---------------------------------------------------------------------------- ;

		global	_ft_strcpy
		section	.text

_ft_strcpy:
		mov		rax, rdi
while:
		cmp		byte [rsi], 0
		je		exit
		mov		r8b, [rsi]
		mov		[rdi], r8b
		inc		rdi
		inc		rsi
		jmp		while
exit:
		mov		byte [rdi], 0
		ret
