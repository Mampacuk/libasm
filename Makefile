# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aisraely <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/07 21:56:03 by aisraely          #+#    #+#              #
#    Updated: 2021/06/07 21:56:07 by aisraely         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS = ${shell find "." -name "*.s"}
OBJS = $(SRCS:.s=.o)

NAME = libasm.a
FLAGS = -Wall -Wextra -Werror
NASM = /Users/aisraely/Downloads/nasm-2.15.05/nasm
NASM_FLAGS  = -f macho64

%.o: 			%.s
				$(NASM) $(NASM_FLAGS) $< -o $@

all: 			$(NAME)

$(NAME):		$(OBJS)
				ar rsc $(NAME) $(OBJS)

clean:			
				rm -rf $(OBJS)

fclean:			clean
				rm -rf $(NAME) 
				rm -rf lib

re:				fclean all

run:			re
				gcc $(FLAGS) libasm.a main.c -o lib
				./lib

.PHONY: 		clean, fclean, re, run
