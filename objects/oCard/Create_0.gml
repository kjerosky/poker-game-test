enum CardState {
	BEING_DEALT,
	IDLE
};

state = CardState.BEING_DEALT;

DEAL_ROTATION_SPEED = -15;

DEAL_FRAMES = 20;
dealFramesLeft = DEAL_FRAMES;

image_index = 0;
image_speed = 0;
image_angle = irandom_range(0, 359);

targetX = -1;
targetY = -1;

