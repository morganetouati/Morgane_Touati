$(document).ready(function(){
	slide = $('.slide #1');
	hauteur_marge = 0;
	img_cour = 1;
	nombre_img=4;
	taille_img = 517;

	$('#next').click(function(){
		if (nombre_img>img_cour) {
			img_cour += 1;
			hauteur_marge = (img_cour-1) * taille_img;
			$('.slider').animate({
				'margin-top' : -hauteur_marge
			})
		};
	})

	$('#prev').click(function(){
		if (1<img_cour) {
			img_cour = img_cour - 1;
			hauteur_marge = (img_cour-1) * taille_img;
			$('.slider').animate({
				'margin-top' : -hauteur_marge
			})
		};
	})


});