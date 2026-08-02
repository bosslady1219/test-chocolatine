##
## EPITECH PROJECT, 2026
## Makefile
## File description:
## compilation
##

CC	=	clang

SRC	=	src/my_putchar.c \
		src/my_putstr.c \
		src/my_strcmp.c \
		src/my_put_nbr.c \
		src/my_boxer.c \
		src/my_printf.c

OBJ	=	$(SRC:.c=.o)

NAME	=	boxerNameFormatter

all :	$(NAME)

$(NAME) :	$(OBJ)
		$(CC) $(OBJ) -o $(NAME)

clean :
	find . -type f \( \
		-name "*.o" -o \
		-name "*~" -o \
		-name "a.out" -o \
		-name "#*#" -o \
		-name "vgcore.*" -o \
		-name "*.gcno" -o \
		-name "*.gcda" \
		\) \
	-delete

tests_run:
	$(CC) --coverage -o unit_tests $(SRC) tests/unit_tests.c -lcriterion
	./unit_tests

fclean : clean
	rm -f $(NAME)

re : fclean all
