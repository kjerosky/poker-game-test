enum CardState {
	BEGIN_BEING_DEALT,
	BEING_DEALT,
	IDLE,
	BEGIN_ROTATE_TO_UPRIGHT_POSITION,
	ROTATE_TO_UPRIGHT_POSITION,
	BEGIN_FLIPPLING,
	FLIPPING
};

state = CardState.IDLE;

DEAL_ROTATION_SPEED = 15;

DEAL_FRAMES = 20;
dealFramesLeft = 0;
deltaX = -1;
deltaY = -1;

ROTATE_TO_UPRIGHT_POSITION_FRAMES = 20;
rotateToUprightPositionFramesLeft = 0;
deltaAngle = 0;

FLIPPING_FRAMES = 20;
flippingFramesLeft = 0;
deltaXScale = 0;

image_index = 0;
image_speed = 0;
image_angle = irandom_range(0, 359);

targetX = -1;
targetY = -1;

showingCard = false;
cardValue = 0;
