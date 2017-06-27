#include "file.h"

t_struct *new_struct(int c)
{
	t_struct *p;

	p=malloc(sizeof(t_struct));
	p->c=c;
	p->col=NULL;
	return (p);
}

t_struct *add_struct(t_struct *p, int c)
{
	t_struct *new;
	t_struct *tmp;

	if (p == NULL)
	{
		p=new_struct(c);
	}
	else
	{
		new=new_struct(c);
		tmp=p;
		while (tmp->col != NULL)
		{
			tmp=tmp->col;
		}
		tmp->col=new;
	}
	return (p);
}