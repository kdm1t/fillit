# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mwilbur <mwilbur@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/23 17:25:35 by mwilbur           #+#    #+#              #
#    Updated: 2019/12/11 17:13:41 by mwilbur          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fillit
SRCS = ./srcs/*.c
OBJS = filling_map.o list_tetramino.o main.o map.o over_size.o validate.o
SRCS_FOLDER=./srcs/
INCLUDES = ./includes/fillit.h
FLAGS = -Wall -Wextra -Werror
LIBFT = ./libft/

all: $(NAME)

$(NAME): $(OBJS)
		make -C $(LIBFT)
		gcc $(FLAGS) -c $(SRCS) -I $(INCLUDES)
		gcc $(FLAGS) $(OBJS) -o $(NAME) -L. libft/libft.a

%.o: $(SRCS_FOLDER)%.c
	gcc $(FLAGS) -c $<

clean:
		rm -f $(OBJS);
		make -C $(LIBFT) clean

fclean: clean
		rm -f $(NAME)
		make -C $(LIBFT) fclean

re: fclean all

.PHONY: all clean fclean re
