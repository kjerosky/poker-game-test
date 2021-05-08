var isAtTargetPosition = x == targetX && y == targetY;

if (state == CardState.BEING_DEALT && isAtTargetPosition) {
	state = CardState.IDLE;
}

switch (state) {
	case CardState.BEING_DEALT: {
		var deltaX = (targetX - xstart) / DEAL_FRAMES;
		var deltaY = (targetY - ystart) / DEAL_FRAMES;
		x += deltaX;
		y += deltaY;

		image_angle += DEAL_ROTATION_SPEED;

		dealFramesLeft--;
		if (dealFramesLeft == 0) {
			x = targetX;
			y = targetY;
		}
	} break;

	case CardState.IDLE: {
		// do nothing
	} break;
}

// adjust the image angle to always be within the range [0, 360)
while (image_angle < 0) {
	image_angle += 360;
}
while (image_angle >= 360) {
	image_angle -= 360;
}
