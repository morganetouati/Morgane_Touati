function doFirst() {
	image = document.getElementById('pic');
	image.addEventListener("dragstart", startDrag, false);
	left = document.getElementById('left');
	right = document.getElementById('right');
	left.addEventListener("dragenter", function(e){e.preventDefault();}, false);
	left.addEventListener("dragover", function(e){e.preventDefault();}, false);
	left.addEventListener("drop", dropped, false);
	right.addEventListener("dragenter", function(e){e.preventDefault();}, false);
	right.addEventListener("dragover", function(e){e.preventDefault();}, false);
	right.addEventListener("drop", dropped2, false);
}

function startDrag(e)
{
	var code = '<img id="pic" src="img/minion3.png" alt="minion" />';
	e.dataTransfer.setData('Text', code);
}

function dropped(e)
{
	$('#pic').remove();
	e.preventDefault ();
	left.innerHTML = e.dataTransfer.getData('Text');
	$('#right').append("Par ICIIIIIIII");
}

function dropped2(e)
{
	$('#pic').remove();
	e.preventDefault ();
	right.innerHTML = e.dataTransfer.getData('Text');
	$('#left').append("Par LAAAAAAAAAA");
}
window.addEventListener("load", doFirst, false);
window.setInterval(doFirst, 10);