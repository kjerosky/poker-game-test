var isAtTargetPosition = dealFramesLeft == 0;
var isInUprightPosition = rotateToUprightPositionFramesLeft == 0;

if (state == CardState.BEGIN_BEING_DEALT) {
	state = CardState.BEING_DEALT;

	dealFramesLeft = DEAL_FRAMES;
	deltaX = (targetX - xstart) / DEAL_FRAMES;
	deltaY = (targetY - ystart) / DEAL_FRAMES;
} else if (state == CardState.BEING_DEALT && isAtTargetPosition) {
	state = CardState.IDLE;

	x = targetX;
	y = targetY;
} else if (state == CardState.BEGIN_ROTATE_TO_UPRIGHT_POSITION) {
	state = CardState.ROTATE_TO_UPRIGHT_POSITION;

	rotateToUprightPositionFramesLeft = ROTATE_TO_UPRIGHT_POSITION_FRAMES;
	if (image_angle < 180) {
		deltaAngle = -image_angle / ROTATE_TO_UPRIGHT_POSITION_FRAMES;
	} else {
		deltaAngle = (360 - image_angle) / ROTATE_TO_UPRIGHT_POSITION_FRAMES;
	}
} else if (state == CardState.ROTATE_TO_UPRIGHT_POSITION && isInUprightPosition) {
	state = CardState.IDLE;

	image_angle = 0;
}

switch (state) {
	case CardState.BEING_DEALT: {
		x += deltaX;
		y += deltaY;

		image_angle -= DEAL_ROTATION_SPEED;

		dealFramesLeft--;
	} break;

	case CardState.IDLE: {
		// do nothing
	} break;

	case CardState.ROTATE_TO_UPRIGHT_POSITION: {
		image_angle += deltaAngle;

		rotateToUprightPositionFramesLeft--;
	} break;
}

// adjust the image angle to always be within the range [0, 360)
while (image_angle < 0) {
	image_angle += 360;
}
while (image_angle >= 360) {
	image_angle -= 360;
}
