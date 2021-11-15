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

NAME		= test
LIBASM		= libasm.a
CC			= gcc
CFLAGS		= -Wall -Wextra -Werror
ASM			= nasm
AFLAGS		= -f macho64
RM			= rm -rf
AR			= ar rsc

%.o: %.s
	$(ASM) $(AFLAGS) $< -o $@

all: $(LIBASM)

$(LIBASM): $(OBJS)
	$(AR) $(LIBASM) $(OBJS)

clean:			
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(LIBASM) 
	$(RM) $(NAME)

re:	fclean all

run: re
	$(CC) $(FLAGS) libasm.a main.c -o $(NAME)
	./$(NAME)

.PHONY: clean, fclean, re, run