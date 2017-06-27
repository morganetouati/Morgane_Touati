#include "file.h"

void  my_putchar(char c)
{
	write(1, &c, 1);
}

void  my_putstr(char *str)
{
  while (*str != '\0')
    {
      my_putchar(*str);
      str++;
    }
}

void  my_putnbr(int i)
{
  my_putchar((char)(i+48));
}

char *readline(void)
{
  int i;
  char c;
  char *str;
  
  i=0;
  c=getchar();
  str=malloc(1000*sizeof(char));
  while (c != '\n' && i < 1000)
  {
    str[i]=c;
    c=getchar();
    i++;
  }
  return (str);
}