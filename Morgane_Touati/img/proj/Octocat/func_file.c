#include "file.h"

t_struct *readFile(char *str)
{
	char *car;
	int file;
	int res;
	t_struct *p;
	
	p=NULL;
	car=malloc(sizeof(char));
	file=open(str, O_RDONLY);
	if (file > 0)
	{
		do
		{
			res=read(file, car, 1);
			p=add_struct(p, (int)*car);
		} while (res > 0);
	}
	free(car);
    close(file);
    return (p);
}

int count_size_line(t_struct *p)
{
	int line;
	t_struct *tmp;
	
	line=0;
	tmp=p;
	while (tmp)
	{
		if (tmp->c == '\n')
			line++;	
		tmp=tmp->col;
	}
	line++;
	return (line);
}

int count_size_col(t_struct *p)
{
	int col;
	t_struct *tmp;
	
	col=0;
	tmp=p;
	while (tmp->c != '\n')
	{
		col++;	
		tmp=tmp->col;
	}
	return col;
}