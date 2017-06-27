# If the sign is rock
function	if_rock ()
{
	if [ $ans = "scissors" ]
	then
		echo -e "\n\033[31m->\tGagnÃ©\033[0m\n"
		let "victoire_player = victoire_player + 1"
	elif [ $ans = 'paper' ]
	then
		echo -e "\n\033[31m->\tPerdu\033[0m\n"
		let "victoire_ia = victoire_ia + 1"
	else
		echo -e "\n\033[31m->\tEgalitÃ©\033[0m\n"
	fi
}

# Else if the sign is paper
function	if_paper ()
{
	if [ $ans = "rock" ]
	then
		echo -e "\n\033[31m->\tGagnÃ©\033[0m\n"
		let "victoire_player = victoire_player + 1"
	elif [ $ans = 'scissors' ]
	then
		echo -e "\n\033[31m->\tPerdu\033[0m\n"
		let "victoire_ia = victoire_ia + 1"
	else
		echo -e "\n\033[31m->\tEgalitÃ©\033[0m\n"
	fi
}

# Else if the sign is scissors
function	if_scissors ()
{
	if [ $ans = "paper" ]
	then
		echo -e "\n\033[31m->\tGagnÃ©\033[0m\n"
		let "victoire_player = victoire_player + 1"
	elif [ $ans = 'rock' ]
	then
		echo -e "\n\033[31m->\tPerdu\033[0m\n"
		let "victoire_ia = victoire_ia + 1"
	else
		echo -e "\n\033[31m->\tEgalitÃ©\033[0m\n"
	fi	
}

# Else if the sign is tornado
function	if_tornado ()
{
	if [ $ans = "scissors" ]
	then
		echo -e "\n\033[31m->\tGagnÃ©\033[0m\n"
		let "victoire_player = victoire_player + 1"
	elif [ $ans = 'rock' ]
	then
		echo -e "\n\033[31m->\tGagnÃ©\033[0m\n"
		let "victoire_player = victoire_player + 1"
	else
		echo -e "\nGagnÃ©\n"
		let "victoire_player = victoire_player + 1"
	fi	
}

# If the sign is rock
function	rock ()
{
	if [ $user_choice = "3" ]
	then
		echo -e "\n\033[31m->\tLe joueur 1 gagne\033[0m\n"
		let "victoire_player2 = victoire_player2 + 1"
	elif [ $user_choice = '1' ]
	then
		echo -e "\n\033[31m->\tLe joueur 2 gagne\033[0m\n"
		let "victoire_player = victoire_player + 1"
	elif [ $user_choice = '4' ]
	then
		echo -e "\n\033[31m->\tLe joueur 1 gagne\033[0m\n"
		let "victoire_player = victoire_player + 1"
	else
		echo -e "\n\033[31m->\tEgalitÃ©\033[0m\n"
	fi
}

# Else if the sign is paper
function	paper ()
{
	if [ $user_choice = "2" ]
	then
		echo -e "\n\033[31m->\tLe joueur 2 gagne\033[0m\n"
		let "victoire_player2 = victoire_player2 + 1"
	elif [ $user_choice = '3' ]
	then
		echo -e "\n\033[31m->\tLe joueur 1 gagne\033[0m\n"
		let "victoire_player = victoire_player + 1"
	elif [ $user_choice = '4' ]
	then
		echo -e "\n\033[31m->\tLe joueur 1 gagne\033[0m\n"
		let "victoire_player = victoire_player + 1"
	else
		echo -e "\n\033[31m->\tEgalitÃ©\033[0m\n"
	fi
}

# Else if the sign is scissors
function	scissors ()
{
	if [ $user_choice = "1" ]
	then
		echo -e "\n\033[31m->\tLe joueur 2 gagne\033[0m\n"
		let "victoire_player2 = victoire_player2 + 1"
	elif [ $user_choice = '2' ]
	then
		echo -e "\n\033[31m->\tLa joueur 1 gagne\033[0m\n"
		let "victoire_player = victoire_player + 1"
	elif [ $user_choice = '4' ]
	then
		echo -e "\n\033[31m->\tLe joueur 1 gagne\033[0m\n"
		let "victoire_player = victoire_player + 1"
	else
		echo -e "\n\033[31m->\tEgalitÃ©\033[0m\n"
	fi	
}

# Else if the sign is tornado
function	tornado ()
{
	if ! [ $user_choice = "4" ]
	then
		echo -e "\n\033[31m->\tLe joueur 2 gagne\033[0m\n"
		let "victoire_player2 = victoire_player2 + 1"
	else
		echo -e "\nEgalitÃ©\n"
	fi	
}