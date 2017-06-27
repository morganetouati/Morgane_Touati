# If the sign is rock
function	if_rock ()
{
	echo $ans
	if [ $ans = "scissors" ]
	then
		echo -e "\033[31m\n->\trock crushes scissors\n\033[0m"
		((victoire_player = $victoire_player + 1))
	elif [ $ans = 'paper' ]
	then
		echo -e "\033[31m\n->\tpaper cover rock\n\033[0m"
		((victoire_ia = $victoire_ia + 1))
	else
		echo -e "\033[31m\n->\tequality\n\033[0m"
	fi
}

# Else if the sign is paper
function	if_paper ()
{
	if [ $ans = "rock" ]
	then
		echo -e "\033[31m\n->\tpaper covers rock\n\033[0m"
		let "victoire_player = $victoire_player + 1"
	elif [ $ans = 'scissors' ]
	then
		echo -e "\033[31m\n->\tscissors cut paper\n\033[0m"
		let "victoire_ia = $victoire_ia + 1"
	else
		echo -e "\033[31m\n->\tequality\n\033[0m"
	fi
}

# Else if the sign is scissors
function	if_scissors ()
{
	if [ $ans = "paper" ]
	then
		echo -e "\033[31m\n->\tscissors cut paper\n\033[0m"
		let "victoire_player = $victoire_player + 1"
	elif [ $ans = 'rock' ]
	then
		echo -e "\033[31m\n->\trock crushes scissors\n\033[0m"
		let "victoire_ia = $victoire_ia + 1"
	else
		echo -e "\033[31m\n->\tequality\n\033[0m"
	fi	
}