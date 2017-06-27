#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct s_struct
{
	int c;
	struct s_struct *col;
} t_struct;

void        casu(void);
void 		blind(void);
void		hard(void);
void        my_putchar(char c);
void    	my_putstr(char *str);
void        my_putnbr(int i);
void        aff_tab(int **tab, int line, int col);
int         **create_tab(int line, int col, t_struct *p);
t_struct    *new_struct(int c);
t_struct    *add_struct(t_struct *p, int c);
t_struct    *readFile(char *str);
int         count_size_line(t_struct *p);
int         count_size_col(t_struct *p);
void        aff_menu(void);
void    	menu(void);
char        *readline(void);
void 		local(int begin[2], int end[2], int **tab, int line, int col);
void 		aff_tab_blind(int **tab, int line, int col);