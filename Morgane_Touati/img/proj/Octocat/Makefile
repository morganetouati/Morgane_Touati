CC		=	gcc
NAME	=	octocat
SRC		=	func_base.c	\
			func_tab.c	\
			func_list.c	\
			func_menu.c	\
			func_file.c	\
			jeu.c		\
			main.c
OBJ 	=	$(SRC:%.c=%.o)
CFLAGS	=	-W -Wall -Wextra -Werror -pedantic -ansi
RM		=	rm -f

$(NAME):	$(OBJ)
			$(CC) $(OBJ) -o $(NAME)
all:		$(NAME)

clean:
			$(RM) $(OBJ)

fclean:		clean
			$(RM) $(NAME)

re:			fclean all