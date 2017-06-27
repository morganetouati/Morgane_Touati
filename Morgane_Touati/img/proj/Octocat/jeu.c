#include "file.h"

int   deplace(char cond, int **tab, int begin[2])
    {
     if (cond == 'd')
     {
      if (tab[begin[0]][begin[1]+1]!=1)
      {
       tab[begin[0]][begin[1]]=0;
       tab[begin[0]][begin[1]+1]=2;
       begin[1]+=1;
       return (0);
     }
     else
     {
    my_putstr("Oh non malheureux! Vous vous Ãªtes pris un mur!\n");
       return (-1);
     }
   }
   else if (cond == 's')
   {
    if (tab[begin[0]+1][begin[1]]!=1)
    {
     tab[begin[0]][begin[1]]=0;
     tab[begin[0]+1][begin[1]]=2;
     begin[0]+=1;
     return (0);
   }
   else
   {
    my_putstr("Oh non malheureux! Vous vous Ãªtes pris un mur!\n");
     return (-1);
   }
  }
  else if (cond == 'a')
  {
    if (tab[begin[0]][begin[1]-1]!=1)
    {
     tab[begin[0]][begin[1]]=0;
     tab[begin[0]][begin[1]-1]=2;
     begin[1]-=1;
     return (0);
   }
   else
   {
    my_putstr("Oh non malheureux! Vous vous Ãªtes pris un mur!\n");
    return (-1);
   }
  }
  else
  {
    if (tab[begin[0]-1][begin[1]]!=1)
    {
     tab[begin[0]][begin[1]]=0;
     tab[begin[0]-1][begin[1]]=2;
     begin[0]-=1;
     return (0);
   }
   else
   {
    my_putstr("Oh non malheureux! Vous vous Ãªtes pris un mur!\n");
     return (-1);
   }
  }
}

void vide(int **tab, t_struct *p, int line)
{
  int i;
  t_struct *tmp;
  t_struct *tmp2;
  
  for (i=0; i < line; i++)
  {
    free(tab[i]);
  }
  free(tab);
  i=0;
  while (p != NULL)
  {
    tmp=p;
    while (tmp->col != NULL)
    {
      tmp2=tmp;
      tmp=tmp->col;
    }
    tmp2->col=NULL;
    free(tmp);
    if (tmp == p)
        p=NULL;
  }
}

void casu(void)
{
  int line;
  int col;
  t_struct *p;
	int **tab;
	char *entree;
	int fin;
	int begin[2];
	int end[2];
  
  
     fin=0;
	p=readFile("test.txt");
	line=count_size_line(p);
	col=count_size_col(p);
	tab=create_tab(line, col, p);
	local(begin, end, tab, line, col);
	aff_tab(tab, line, col);
  while (tab[end[0]][end[1]]!=2 && fin == 0)
  {
    entree=readline();
    if (entree[0] == 'q')
    {
      fin=1;
    }
    else if (entree[0] == 'd' || entree[0] == 'a' || entree[0] == 'w' || entree[0] == 's')
    {
    my_putstr("\033c");
      fin=deplace(entree[0], tab, begin);
      if (fin == 0)
        aff_tab(tab, line, col);
    }
    free(entree);
  }
     if (fin == 0)
        my_putstr("Vous avez rÃ©ussi\n");
  vide(tab, p, line);
}

void blind(void)
{
  int line;
  int col;
  t_struct *p;
  int **tab;
  char *entree;
  int fin;
  int begin[2];
  int end[2];
  
  
  fin=0;
  p=readFile("test.txt");
  line=count_size_line(p);
  col=count_size_col(p);
  tab=create_tab(line, col, p);
  local(begin, end, tab, line, col);
  aff_tab(tab, line, col);
  while (tab[end[0]][end[1]]!=2 && fin == 0)
  {
    entree=readline();
    if (entree[0] == 'q')
    {
      fin=1;
    }
    else if (entree[0] == 'd' || entree[0] == 'a' || entree[0] == 'w' || entree[0] == 's')
    {
        my_putstr("\033c");
      fin=deplace(entree[0], tab, begin);
      if (fin == 0)
        aff_tab_blind(tab, line, col);
    }
    free(entree);
  }
    if (fin == 0)
        my_putstr("Vous avez rÃ©ussi\n");
  vide(tab, p, line);
}

void hard(void)
{
    int line;
    int i;
    int col;
    t_struct *p;
	int **tab;
	char *entree;
	int fin;
	int begin[2];
	int end[2];
  
  
  fin=0;
  i=0;
	p=readFile("test.txt");
	line=count_size_line(p);
	col=count_size_col(p);
	tab=create_tab(line, col, p);
	local(begin, end, tab, line, col);
	aff_tab(tab, line, col);
    entree=readline();
      while (tab[end[0]][end[1]]!=2 && fin == 0 && entree[i])
      {
    	my_putstr("\033c");
        if (entree[0] == 'q')
        {
          fin=1;
        }
        else if (entree[i] == 'd' || entree[i] == 'a' || entree[i] == 'w' || entree[i] == 's')
        {
          fin=deplace(entree[i], tab, begin);
          aff_tab(tab, line, col);
        }
        i++;
      }
      if (fin == 0)
      {
        if (tab[end[0]][end[1]]!=2)
            my_putstr("Vous Ãªtes perdu et vous Ãªtes mort de faim\n");
        else
        {
            my_putstr("Vous avez rÃ©ussi\n");
        }
      }
    free(entree);
      vide(tab, p, line);
}