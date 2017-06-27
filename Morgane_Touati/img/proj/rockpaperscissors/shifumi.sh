#!/bin/bash
function	title ()
{
echo ' ______     __  __     __     ______   __  __     __    __     __    '
echo '/\  ___\   /\ \_\ \   /\ \   /\  ___\ /\ \/\ \   /\ "-./  \   /\ \   '
echo '\ \___  \  \ \  __ \  \ \ \  \ \  __\ \ \ \_\ \  \ \ \-./\ \  \ \ \  '
echo ' \/\_____\  \ \_\ \_\  \ \_\  \ \_\    \ \_____\  \ \_\ \ \_\  \ \_\ '
echo -e '  \/_____/   \/_/\/_/   \/_/   \/_/     \/_____/   \/_/  \/_/   \/_/ \n'
                                                                     
                                                                         
}
clear
title
source src/get_random.sh
source src/analyse_results.sh
source src/select_and_use_informations.sh
args=("$*")

close=0
if [ -z "${args[0]}" ]
	then 
		echo -e "Game win count isn't set ...\n\n"
	else
		if [[ ${args[0]} < 0 ]]
			then
				echo -e "Error : Negative counter\n\n"
				close=1
			else
				pattern='^[0-9]+$'
				if ! [[ ${args[0]} =~ $pattern ]]
				then
   					echo -e "Error: Not a number\n\n"
   					close=1
   				else
					echo -e "Victory number is set to '${args[0]}'\n\n"
			fi
		fi
fi


function	progress_bar ()
{
	let "one = ($victoire_player * 100) / ${args[0]}"
	j=0
	let "two = $one / 4"
	echo -e "[ \c"
	while [ $j != $two ]
	do
		echo -e "#\c"	
		((++j))
	done
	while [ $j != 25 ]
	do
		echo -e "_\c"	
		((++j))
	done
	echo -e " ] $one %"
}

# Lance le programme
function	main ()
{
	nb=3
	i=1
	victoire_player=0
	victoire_ia=0
	echo $1
	echo $name
	if [ $close = '0' ]
		then
			read -p "Player, please type your name or pseudo ~ > " player_name
	fi
	while [ $victoire_player -lt $1 ] && [ $close -eq '0' ]
	do
		progress_bar
		echo -e "\tâ•”â•â•â•â•â•â•â•â•â•â•â•â•â•—"
		echo -e "\tâ•‘ TOUR N# $i  â•‘"
		echo -e "\tâ•šâ•â•â•â•â•â•â•â•â•â•â•â•â•"
		
disp_select
		echo -e "\tâ€¢ $victoire_player points for $player_name"
		echo -e "\tâ€¢ $victoire_ia for the computer\n"
		
		let "i = i + 1"
		echo -e "\n\n"
	done
	echo "[ ######################### ] 100 %"
}
# Permet de boucler le programme et apelle les fonctions de comparaison des signes
main $@