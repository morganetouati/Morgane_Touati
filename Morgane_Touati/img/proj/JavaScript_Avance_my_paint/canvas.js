"use strict";
var canvas,
	context,
	dragging = false,
	dragStartLocation,
	snapshot;

function getCanvasCoordinates(event)/*coordonées de la sourie*/
{
	var x = event.clientX - canvas.getBoundingClientRect().left,
		y = event.clientY - canvas.getBoundingClientRect().top;
	return {x: x, y: y};
}

function takeSnapshot()
{
	snapshot = context.getImageData(0, 0, canvas.width, canvas.height);
}

function restoreSnapshot()
{
	context.putImageData(snapshot, 0, 0);
}

var line = false;
var circle = false;
var rectangle = false;

function set(value)
{
	if(value == 'line')
	{
		line = true;
		circle = false;
		rectangle = false;
	}
	else if(value == 'circle')
	{
		circle = true;
		line = false;
		rectangle = false;
	}
	else if(value == 'rectangle')
	{
		rectangle = true;
		line = false;
		circle = false;
	}
}

function drawLine(position)/*tracer des lignes*/
{
	context.lineWidth = 4;
	context.beginPath();
	context.moveTo(dragStartLocation.x, dragStartLocation.y);
	context.lineTo(position.x, position.y);
	context.stroke();
	context.fill();
}

function drawCircle(position)/*tracer des cercles*/
{
	var radius = Math.sqrt(Math.pow((dragStartLocation.x - position.x), 2) + Math.pow((dragStartLocation.y - position.y), 2));
	context.beginPath();
	context.arc(dragStartLocation.x, dragStartLocation.y, radius, 0, 2 * Math.PI, false);
	context.fill();
}

function drawRectangle(position)/*tracer des rectangles*/
{
	context.beginPath();
	context.rect(dragStartLocation.x, dragStartLocation.y, position.x, position.y);
    context.strokeStyle = 'black';
    context.lineWidth = 2;
    context.stroke();
	context.fill();
}

function dragStart(event)
{
	dragging = true;
	dragStartLocation = getCanvasCoordinates(event);
	takeSnapshot();
}

function drag(event)
{
	var position;
	if(dragging === true)
	{
		restoreSnapshot();
		position = getCanvasCoordinates(event);
		if(circle)/*tracer des cercles*/
				drawCircle(position);
		if(line)/*tracer des lignes*/
				drawLine(position);
		if(rectangle)/*tracer des rectangles*/
				drawRectangle(position);
	}
}

function dragStop(event)
{
	dragging = false;
	restoreSnapshot();
	var position = getCanvasCoordinates(event);
	if(circle)/*tracer des cercles*/
			drawCircle(position);
	if(line)/*tracer des lignes*/
			drawLine(position);
	if(rectangle)/*tracer des rectangles*/
			drawRectangle(position);
}

var colors = ['black', 'grey', 'white', 'red', 'orange', 'pink', 'yellow', 'blue', 'violet', 'green'];

for(var i=0, n=colors.length;i<n;i++)
{
	var swatch = document.createElement('div');
	swatch.className = 'swatch';
	swatch.style.backgroundColor = colors[i];
	swatch.addEventListener('click', setSwatch);
	document.getElementById('colors').appendChild(swatch);
}

function setColor(color)
{
	context.fillStyle = color;
	context.strokeStyle = color;
	var active = document.getElementsByClassName('active')[0];
	if(active)
	{
		active.className = 'swatch';
	}
}

function setSwatch(e)
{
	var swatch = e.target;
	setColor(swatch.style.backgroundColor);
	swatch.className += ' active';
}
/*setSwatch({target: document.getElementsByClassName('swatch')[0]});*/

function eraseCanvas()
{
	context.clearRect(0, 0, canvas.width, canvas.height);
}

function init()
{
	canvas = document.getElementById("paint");
	context = canvas.getContext('2d');
	context.lineCap = "round";

	var clearCanvas = document.getElementById("clearCanvas");

	canvas.addEventListener('mousedown', dragStart, false);
	canvas.addEventListener('mousemove', drag, false);
	canvas.addEventListener('mouseup', dragStop, false);
	clearCanvas.addEventListener("click", eraseCanvas, false);
}
window.addEventListener('load', init, false);