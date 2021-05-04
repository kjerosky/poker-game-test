if (dealFramesLeft <= 0) {
	exit;
}

var deltaX = (targetX - xstart) / DEAL_FRAMES;
var deltaY = (targetY - ystart) / DEAL_FRAMES;
x += deltaX;
y += deltaY;

dealFramesLeft--;
if (dealFramesLeft == 0) {
	x = targetX;
	y = targetY;
}
