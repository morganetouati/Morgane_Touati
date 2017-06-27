$(function(){
var bouton = $(".num");
var champs = $("#chmps_cal");

	bouton.click(function()
	{
		var valeur = $(this).val(); //stock la valeur
		var champs_actuel = champs.val(); //la valeur
		champs.val(champs_actuel+valeur);
	});

	$("#egal").click(function()
	{
		var equation = champs.val();
		var calc = eval(equation);
		champs.val(calc);
	})

	$("#effacer").click(function()
	{
		champs.val("");

	});
});