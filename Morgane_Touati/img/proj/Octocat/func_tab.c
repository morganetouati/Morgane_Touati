#include "file.h"

void aff_tab(int **tab, int line, int col)
{
	int i;
	int j;
	
	for (i=0; i < line; i++)
	{
		for (j=0; j < col; j++)
		{
			my_putchar(' ');
			if (tab[i][j] == 0)
			 my_putchar(' ');
			else if (tab[i][j] == 1)
			 my_putchar('#');
			else if (tab[i][j] == 2)
			 my_putchar('8');
		}
		printf("\n");
	}
}

void aff_tab_blind(int **tab, int line, int col)
{
	int i;
	int j;
	
	my_putstr("\033c");
	for (i=0; i < line; i++)
	{
		for (j=0; j < col; j++)
		{
			my_putchar(' ');
			if (tab[i][j] == 0)
			 my_putchar(' ');
			else if (tab[i][j] == 1)
			 my_putchar(' ');
			else if (tab[i][j] == 2)
			 my_putchar('8');
		}
		printf("\n");
	}
}

int **create_tab(int line, int col, t_struct *p)
{
	int i;
	int j;
	int **tab;
	t_struct *tmp;

	tmp=p;
	tab=malloc(line*sizeof(int*));
	for (i=0; i < line; i++)
	{
		tab[i]=malloc(col*sizeof(int));
	}
	for (i=0; i < line; i++)
	{
		for (j=0; j < col; j++)
		{
			tab[i][j]=(tmp->c)-48;
			tmp=tmp->col;
		}
		tmp=tmp->col;
	}
	return tab;
}

void local(int begin[2], int end[2], int **tab, int line, int col)
{
	int i;
	int j;
	
	for (i=0; i<line; i++)
	{
		for (j=0; j<col; j++)
		{
			if (tab[i][j] == 2)
			{
				begin[0]=i;
				begin[1]=j;
			}
			else if (tab[i][j] == 3)
			{
				end[0]=i;
				end[1]=j;
			}
		}
	}
}