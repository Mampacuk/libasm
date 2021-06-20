; ---------------------------------------------------------------------------- ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: aisraely <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/06/07 22:00:04 by aisraely          #+#    #+#              ;
;    Updated: 2021/06/07 22:00:05 by aisraely         ###   ########.fr        ;
;                                                                              ;
; ---------------------------------------------------------------------------- ;

		global	_ft_strlen
		section	.text

_ft_strlen:
		mov		rax, 0
while:
		cmp		byte [rdi + rax], 0
		je		exit
		inc		rax
		jmp		while
exit:
		ret
