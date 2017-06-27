<?php

main($argv);

function main($argv){
$time_start = microtime(true);
$error = 0;
if(!isset($argv['1']) || !isset($argv['2'])){
	echo 'Not enough arguments provided.\n';
	++$error;
}
else if(!file_exists($argv['1']) || !file_exists($argv['2'])){
	echo 'Incorrect file\n';
	++$error;
}
if(!$error){

	$dico_file = fopen($argv['2'], 'r');
	$message_file = fopen($argv['1'], 'r');

	$i = -1;

	while(!feof($dico_file)){
		$words[$i] = fgets($dico_file);
		++$i;
	}

	$words[$i - 1] .= "\n";

	while(!feof($message_file)){
		$message .= fread($message_file, 8192);
	}

	$message_words = str_word_count($message, 1);

	$words = array_flip($words);


	foreach ($message_words as $word) {
		if(isset($words[$word."\n"])){
			echo $word . "\n";
		}
	}

	$execution_time = (microtime(true) - $time_start);
	echo "Recherche effectuee en {$execution_time} sec\n";

	fclose($dico_file);
	fclose($message_file);
}

}
?>