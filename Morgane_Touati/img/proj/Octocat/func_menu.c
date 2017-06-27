#include "file.h"

void aff_menu(void)
{
	my_putstr("\033[31;1m{----------\033[31;5mMenu OCTOCAT\033[0m\033[31;1m----------}\n\033[0m");
	my_putstr("{           ==========           }\n");
	my_putstr("{\033[31;1m        C -> Niveau CASU        \033[0m}\n");
	my_putstr("{           ==========           }\n");
	my_putstr("{\033[31;1m        H -> Niveau HARDCORE    \033[0m}\n");
	my_putstr("{           ==========           }\n");
	my_putstr("{\033[31;1m        B -> Niveau BLIND       \033[0m}\n");
	my_putstr("{--------------------------------}\n");
}

void	menu(void)
{
	char *choix;

	aff_menu();
	choix=readline();
	my_putstr("\033c");
	while (choix[0] != 'q')
	{
		if (choix[0] == 'C' || choix[0] == 'c')
		{
			casu();
		}
		else if (choix[0] == 'H' || choix[0] == 'h')
		{
			hard();
		}
		else if (choix[0] == 'B' || choix[0] == 'b')
		{
			blind();
		}
		else
		{
			my_putstr("Vous n'avez pas rentrÃ© la bonne commande\n");
		}
		aff_menu();
		choix=readline();
		my_putstr("\033c");
	}
	free(choix);
}