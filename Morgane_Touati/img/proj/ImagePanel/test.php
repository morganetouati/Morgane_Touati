<?php
$ins = imagecreatefromjpeg('http://info.viamichelin.fr/data/public/styles/thumbnail/public/reussir-sejour_0.jpg?itok=MvWgLzvj');
$i = 0;
$posIni = 0;
$posIni2 = 0;
$tailleimg = getimagesize('http://info.viamichelin.fr/data/public/styles/thumbnail/public/reussir-sejour_0.jpg?itok=MvWgLzvj');
$NouvelleLargeur = 350;
 
$Reduction = ( ($NouvelleLargeur * 100)/$tailleimg[0] );
$nbImg = 10;
$toto = $nbImg / 5;
if (!is_int($toto))
	$toto++;
$NouvelleHauteur = ( ($tailleimg[1] * $Reduction)/100 );
$img = imagecreatetruecolor(($NouvelleLargeur * 5), ($NouvelleHauteur * $toto));
while ($i < $nbImg)
{
	imagecopyresampled($img, $ins, $posIni, $posIni2, 0, 0, $NouvelleLargeur, $NouvelleHauteur, $tailleimg[0], $tailleimg[1]);
	$posIni = $posIni + $NouvelleLargeur;
	if($posIni == ($NouvelleLargeur * 5))
	{
		$posIni = 0;
		$posIni2 = $posIni2 + $NouvelleHauteur;
	}
	$i++;
}
imagejpeg($img, './o.jpg');
imagedestroy($img);
?>