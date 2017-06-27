# This function execute 1 of three functions
function	launch_from_player_launch ()
{
	if [ $user_choice = '2' ]
	then
		if_rock
	fi

	if [ $user_choice = '1' ]
	then
		if_paper
	fi

	if [ $user_choice = '3' ]
	then
		if_scissors
	fi

	if [ $user_choice = '4' ]
	then
		if_tornado
	fi
}

game2()
{
	arret=0
	
	while [ $arret = 0 ]
	do
		if [ $user2_choice = '2' ]
		then
			rock
			arret=1
		fi

		if [ $user2_choice = '1' ]
		then
			paper
			arret=1
		fi

		if [ $user2_choice = '3' ]
		then
			scissors
			arret=1
		fi

		if [ $user2_choice = '4' ]
		then
			tornado
			arret=1
		fi
		if [[ $user2_choice -lt 0 ]]
			then
			echo "Saisie incorrecte"
			arret=0
		fi
	done

}

# By the user entry we execute comparaisons functions

# See possible items
function	disp_select_player ()
{
	user_choice=0
	echo "â•”â•â•â•â•¦â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•—"
	echo "â•‘ 1 â•‘ Paper        â•‘"
	echo "â• â•â•â•â•¬â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•£"
	echo "â•‘ 2 â•‘ Rock         â•‘"
	echo "â• â•â•â•â•¬â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•£"
	echo "â•‘ 3 â•‘ Scissors     â•‘"
	echo "â• â•â•â•â•¬â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•£"
	echo "â•‘ 4 â•‘ Tornado      â•‘"
	echo -e "â•šâ•â•â•â•©â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•\n"
	user_choice=0
	user2_choice=0
	while [[ $user_choice -eq '0' ]]
	do
		read -p 'Player choice ~ > ' user_choice
		if [ $user_choice = '' ]
			then
			echo -e "\tEmpty !!!"
			user_choice=0
		fi
	done
	while [[ $user2_choice -eq 0 ]]
	do
		read -p 'Player 2 choice ~ > ' user2_choice
		if [ $user2_choice = '' ]
			then
			echo -e "\tEmpty !!!"
			user2_choice=0
		fi
	done
	if [ $user_choice = 'quit' ]
		then
		read -p "Are you sure ? (y / n) ~ > " confirmation
		if [ $confirmation = 'y' ]
		then
			close=1
		fi
	fi
	choix
	if [[ $player -eq 1 ]]
		then
		game2
	else
		launch_from_player_launch
	fi
}

function	disp_select ()
{
	user_choice=0
	echo "â•”â•â•â•â•¦â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•—"
	echo "â•‘ 1 â•‘ Rock         â•‘"
	echo "â• â•â•â•â•¬â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•£"
	echo "â•‘ 2 â•‘ Paper        â•‘"
	echo "â• â•â•â•â•¬â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•£"
	echo "â•‘ 3 â•‘ Scissors     â•‘"
	echo -e "â•šâ•â•â•â•©â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•\n"
	while [[ $user_choice -eq 0 ]]
	do
		read -p 'Player choice ~ > ' user_choice
		if [[ $user_choice = '' ]]
			then
			echo -e "\tEmpty !!!"
			user_choice=0
		fi
	done
	if [ $user_choice = 'quit' ]
		then
		read -p "Are you sure ? (y / n) ~ > " confirmation
		if [ $confirmation = 'y' ]
		then
				close=1
		fi
	fi
	choix
	launch_from_player_launch
}