<?php
$patrick = imagecreatetruecolor(800, 600);
$j = 1;
$oui = 1;
$exit = 0;
$NouvelleLargeur = 350;
$urlarray = array();
if ($argc < 3)
	echo "Erreur : Veuillez entrer au moins un lien.\nUtilisation : [-jpgnNls] fichier/url [fichier/url ...] nom_de_la_base\n";
else
{
	while ($j != ($argc))
	{
		preg_match('/-[jpglnNs]+/', $argv[$j], $option);
		if (!empty($option))
			$oui++;
		$j++;
	}
	$j = ($oui - 1);
	$oui = $oui - 1;
	$options = knownOptions($oui, $argv);
	while ($j != ($argc - 1))
	{
		preg_match('/http\S*/', $argv[$j], $internet);
		preg_match('/\S*html/', $argv[$j], $local);
		preg_match('/\S*php/', $argv[$j], $local2);
		if (!empty($internet))
		{
			createUrl($urlarray, $j, $argc, $argv);
			$exit = 0;
		}
		else if (!empty($local) || !empty($local2))
		{
			urlLocal($urlarray, $j, $argc, $argv);
			$exit = 0;
		}
		else
		{
			$exit = 1;
		}
		$j++;
	}
	$nblien = $argc - 1;
	if (strpos($argv[$nblien], "http") || strpos($argv[$nblien], "php") || strpos($argv[$nblien], "html"))
		$exit = 1;
	if ($exit == 1)
		echo "Veuillez entrer l'adresse d'un fichier http/php, ou une url, ainsi qu'un nom pour l'image Ã  gÃ©nÃ©rer.\n";
	if ($exit == 0 && !empty($urlarray))
	{
		$NouvelleHauteur = calcDim($urlarray, $NouvelleLargeur);
		$pls = createBase($urlarray, $NouvelleLargeur, $NouvelleHauteur);
		createImage($urlarray, $NouvelleLargeur, $NouvelleHauteur, $pls, $argc, $argv, $options);
	}
	else
		echo "Utilisation : [-jpgnNls] fichier/url [fichier/url ...] nom_de_la_base\n";
}

function knownOptions($oui, $argv)
{
	$options = array();
	while ($oui != 0)
	{
		if (strpos($argv[$oui], "-") === 0)
		{
			$trueoption = explode("-", $argv[$oui]);
			array_push($options, $trueoption[1]);
		}
		$oui--;
	}
	return $options;
}
function createUrl(&$urlarray, $j, $argc, $argv)
{
	$url = $argv[$j];
	$array = get_headers($url);
	$string = $array[0];
	if(strpos($string,"200"))
	{

		$curl = curl_init($url);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
		$contents = curl_exec($curl);
		curl_close($curl);
		preg_match_all('/<img[^>]*>/', $contents, $result);
		$i = 0;
		if (!empty($result[0]))
		{
			$actualresult = $result[0];
			while (isset($actualresult[$i])) 
			{
				$img = $actualresult[$i];
				preg_match('/src=["\']\S+/', $img, $test);
				if (!empty($test))
				{
					$beurre = $test[0];
					$jambon = explode("'", $beurre);
					if (!isset($jambon[1]))
					{
						$jambon = explode('"', $beurre);
						preg_match_all('/\/\S*/', $jambon[1], $saucisson);
					}
					if (is_array($saucisson))
					{
						if (ord($saucisson[0][0][0]) == 47 && ord($saucisson[0][0][1]) == 47)
						{
							$saucisson = substr($saucisson[0][0],2);
						}
						else
						{
							$donald = $saucisson[0][0];
							$trump = explode("/", $url);
							$saucisson = $trump[0] . "//" . $trump[2] . $donald;
						}
					}
					if (ord($saucisson[0]) == 104 && ord($saucisson[1]) == 116 && ord($saucisson[2]) == 116 && ord($saucisson[3]) == 112)
						$url = $saucisson;
					else
						$url = "http://" . $saucisson;
					$array = get_headers($url);
					$string = $array[0];
					if(strpos($string,"200") || strpos($string,"301"))
						array_push($urlarray, $url);
				}
				$i++;
			}
		}
		else
			echo "Il n'y a pas d'image sur cette page. \n";
	}
	else
		echo "Ce site n'existe pas.\n";
	return $urlarray;
}

function createImage($urlarray, $NouvelleLargeur, $NouvelleHauteur, $pls, $argc, $argv, $options)
{
	$i = 0;
	$nburl = count($urlarray);
	$posIni = 0;
	$posIni2 = 0;
	while ($i < $nburl)
	{
		$dim = getimagesize($urlarray[$i]);
		if (strpos($urlarray[$i], "gif") == true || strpos($urlarray[$i], "GIF") == true)
			$ins = imagecreatefromgif($urlarray[$i]);
		if (strpos($urlarray[$i], "jpg") == true || strpos($urlarray[$i], "JPG") == true || strpos($urlarray[$i], "jpeg") == true || strpos($urlarray[$i], "JPEG") == true)
			$ins = imagecreatefromjpeg($urlarray[$i]);
		if (strpos($urlarray[$i], "png") == true || strpos($urlarray[$i], "PNG") == true)
			$ins = imagecreatefrompng($urlarray[$i]);
		imagecopyresampled($pls, $ins, $posIni, $posIni2, 0, 0, $NouvelleLargeur, $NouvelleHauteur, $dim[0], $dim[1]);
		$posIni = $posIni + $NouvelleLargeur;
		if($posIni == ($NouvelleLargeur * 5))
		{
			$posIni = 0;
			$posIni2 = $posIni2 + $NouvelleHauteur;
		}
		$i++;
		randomMessage();
	}
	if (empty($options) || in_array("j", $options))
		imagejpeg($pls, './' . $argv[($argc - 1)] . '.jpg');
	if (in_array("p", $options))
		imagepng($pls, './' . $argv[($argc - 1)] . '.png');
	if (in_array("g", $options))
		imagegif($pls, './' . $argv[($argc - 1)] . '.gif');
	imagedestroy($pls);
}

function calcDim($urlarray, $NouvelleLargeur)
{
	if (!empty($urlarray))
	{
		$i = 0;
		$hauteur = 0;
		$nburl = count($urlarray);
		$largeur = 0;
		while ($i != $nburl)
		{
			$imghaut = getimagesize($urlarray[$i]);
			if ($imghaut[1] > $hauteur)
				$hauteur = $imghaut[1];
			if ($imghaut[0] > $largeur)
				$largeur = $imghaut[0];
			$i++;
		}
		$reduction = (($NouvelleLargeur * 100)/$largeur);
		$NouvelleHauteur = (($hauteur * $reduction)/100);
		return $NouvelleHauteur;
	}
}

function createBase($urlarray, $NouvelleLargeur, $NouvelleHauteur)
{
	$nburl = count($urlarray);
	$toto = $nburl / 5;
	if (!is_int($toto))
		$toto++;
	$pls = imagecreatetruecolor(($NouvelleLargeur * 5), ($NouvelleHauteur * $toto));
	return $pls;
}

function urlLocal(&$urlarray, $j, $argc, $argv)
{

	$nom = array();
	$l = 0;
	$url = $argv[$j];
	if (file_exists($url))
	{
		if (!is_dir($url))
		{
			if (is_readable($url))
			{
				$handle = fopen($url, "r");
				$contents = fread($handle, filesize($url));
				fclose($handle);
				preg_match_all('/<img[^>]*>/', $contents, $result);
				$i = 0;
				if (!empty($result[0]))
				{
					$actualresult = $result[0];
					while (isset($actualresult[$i])) 
					{

						$img = $actualresult[$i];
						preg_match('/src=["\']\S+/', $img, $test);
						if (!empty($test))
						{
							$beurre = $test[0];
							$jambon = explode("'", $beurre);
							if (!isset($jambon[1]))
								$jambon = explode('"', $beurre);
							$nomimage = explode("/", $jambon[1]);
							while ($l != (count($nomimage) - 1))
							{

								$realname = $realname . '/' . $nomimage[$l];
								$l++;
							}

							array_push($nom, $nomimage[$l]);
							$i++;
						}
						$i++;
					}
					$path = explode("/", $url);
					$nbpath = count($path);
					$k = 0;
					while ($k != $nbpath - 1)
					{
						$truepath = $truepath . $path[$k] . "/";
						$k++;
					}
					$i = 0;
					while ($i != count($nom))
					{
						$realpath = $truepath . $realname . '/'  . $nom[$i];
						array_push($urlarray, $realpath);
						$realpath = "";
						$i++;
					}
				}
			}
			else
				echo "Erreur : Le fichier " . $argv[$j] . " est protÃ©gÃ© en lecture.\n";

		}
		else
			echo "Erreur : Le lien que vous avez rentrÃ© est un rÃ©pertoire.\n";
	}
	else
		echo "Erreur : Le fichier " . $argv[$j] . " n'existe pas.\n";

	return($urlarray);
}

function randomMessage()
{
	$message = array("GÃ©nÃ©ration des pixels", "Calcul de la vitesse lumiÃ¨re", "Sacrifice de chÃ¨vres", "Obtention des pleins pouvoirs", "Recherche de l'humour",
		"Utilisation de file_get_contents()", "Affichage de messages alÃ©atoires", "Construction d'un temple Ã  l'effigie de l'examinateur");
	$nbmessaeges = count($message);
	$i = rand(0, ($nbmessaeges - 1));
	echo $message[$i] . " en cours...\nDone.\n";
}
?>