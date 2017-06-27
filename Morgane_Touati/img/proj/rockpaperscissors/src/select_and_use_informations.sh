# This function execute 1 of three functions
function	launch_from_player_launch ()
{
	if [ -z "$user_choice" ]
		then
	if [ $user_choice = '1' ]
	then
		if_rock
	fi

	if [ $user_choice = '2' ]
	then
		if_paper
	fi

	if [ $user_choice = '3' ]
	then
		if_scissors	
	fi
	if [ $close = '0' ]
		then
		if [[ $user_choice < '1' ]] || [[ $user_choice > '3' ]]
			then
			echo "Incorrect entry"
		fi
	fi
	else
	
		echo "Incorrect entry"
	fi

}
# By the user entry we execute comparaisons functions

# See possible items
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
		if [ $user_choice = '' ]
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