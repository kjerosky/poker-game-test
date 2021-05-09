enum CardState {
	IDLE,
	BEGIN_BEING_DEALT,
	BEING_DEALT,
	BEGIN_ROTATE_TO_UPRIGHT_POSITION,
	ROTATE_TO_UPRIGHT_POSITION,
	BEGIN_FLIPPLING,
	FLIPPING,
	BEGIN_CHANGE_SELECTION_STATUS,
	CHANGE_SELECTION_STATUS
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

SELECTED_Y_OFFSET = -25;
SELECTED_ANGLE_MAX_OFFSET = 15;
CHANGE_SELECTION_STATUS_FRAMES = 10;
changeSelectionStatusFramesLeft = 0;
isSelected = false;
