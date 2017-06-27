#!/bin/bash

clear

source src_bonus/get_random.sh
source src_bonus/analyse_results.sh
source src_bonus/select_and_use_informations.sh
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
	stop=0
	i=1
	victoire_player=0
	victoire_ia=0
	victoire_player2=0
	if [ $close = '0' ]
		then
		read -p "Player, please type your name or pseudo ~ > " player_name
		if [[ $player_name = '' ]]
			then
			echo "incorrect name"
			main
		fi
		read -p "Do you want to play against an other player or against IA? ~ > " secplayer
		player=0
		if [[ $secplayer = "player" ]]; then
			player=1
			while [[ $victoire_player -lt $1 ]] && [[ $victoire_player2 -lt $1 ]] && [ $close -eq '0' ]
			do
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

				echo -e "\tâ•”â•â•â•â•â•â•â•â•â•â•â•â•â•—"
				echo -e "\tâ•‘ TOUR N# $i  â•‘"
				echo -e "\tâ•šâ•â•â•â•â•â•â•â•â•â•â•â•â•"
				disp_select_player	
				echo -e "\tâ€¢ Le joueur a $victoire_player victoire(s)"
				echo -e "\tâ€¢ Le joueur 2 a $victoire_player2 victoire(s)\n"

				let "i = i + 1"
				echo -e "\n\n"
			done
			echo "[ ######################### ] 100 %"
			if [[ $victoire_player > $victoire_player2 ]]
				then
				echo "Vous avez gagnÃ© la partie contre le deuxiÃ¨me joueur"
			elif [[ $victoire_player < $victoire_player2 ]]
				then
				echo "Le deuxiÃ¨me joueur a gagnÃ©"
			fi
		elif [[ $secplayer = "IA" ]]; then
			while [[ $victoire_player -lt $1 ]] && [[ $victoire_ia -lt $1 ]] && [ $close -eq '0' ]
			do
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

				echo -e "\tâ•”â•â•â•â•â•â•â•â•â•â•â•â•â•—"
				echo -e "\tâ•‘ TOUR N# $i  â•‘"
				echo -e "\tâ•šâ•â•â•â•â•â•â•â•â•â•â•â•â•"
				disp_select	
				echo -e "\tâ€¢ Le joueur a $victoire_player victoire(s)"
				echo -e "\tâ€¢ L'IA a $victoire_ia victoire(s)\n"

				let "i = i + 1"
				echo -e "\n\n"
			done
			echo "[ ######################### ] 100 %"
			if [[ $victoire_player > $victoire_ia ]]
				then
				echo "Vous avez gagnÃ© la partie contre la machine"
			elif [[ $victoire_player < $victoire_ia ]]
				then
				echo "La machine a gagnÃ©"
			fi
		fi
	fi # Fin joueur vs joueur
}
# Permet de boucler le programme et apelle les fonctions de comparaison des signes
main $@
echo "[ ######################### ] 100 %"