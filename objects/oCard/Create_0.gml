enum CardState {
	BEGIN_BEING_DEALT,
	BEING_DEALT,
	IDLE,
	BEGIN_ROTATE_TO_UPRIGHT_POSITION,
	ROTATE_TO_UPRIGHT_POSITION
};

state = CardState.BEGIN_BEING_DEALT;

DEAL_ROTATION_SPEED = 15;

DEAL_FRAMES = 20;
dealFramesLeft = 0;
deltaX = -1;
deltaY = -1;

ROTATE_TO_UPRIGHT_POSITION_FRAMES = 20;
rotateToUprightPositionFramesLeft = 0;
deltaAngle = 0;

image_index = 0;
image_speed = 0;
image_angle = irandom_range(0, 359);

targetX = -1;
targetY = -1;
