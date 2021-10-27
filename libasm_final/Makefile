# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rlinkov <rlinkov@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/07 19:51:35 by rlinkov           #+#    #+#              #
#    Updated: 2021/04/08 13:57:19 by rlinkov          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RM				= rm -rf
NAME			= libasm.a
COMPIL_LINUX 	= nasm -f elf64
SRCS_PATH       = ./src/
SRCS			= ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
SRC				= $(addprefix $(SRCS_PATH), $(SRCS))
OBJECTS			= $(SRC:.s=.o)

%.o: %.s
	$(COMPIL_LINUX) $< -o $@

all: $(NAME)

$(NAME): $(OBJECTS)
	ar rc $(NAME) $(OBJECTS)
	ranlib $(NAME)

clean:
	$(RM) $(OBJECTS)

fclean: clean
	$(RM) $(NAME)

re: fclean all