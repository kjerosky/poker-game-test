if (keyboard_check_pressed(vk_space)) {
	var targetX = X_TARGETS[currentTarget];
	var targetY = Y_TARGETS[currentTarget];
	
	var card = instance_create_layer(room_width / 2, -20, "Instances", oCard);
	card.targetX = targetX;
	card.targetY = targetY;
	card.cardValue = irandom_range(1, 52);
	card.state = CardState.BEGIN_BEING_DEALT;
	
	currentTarget = (currentTarget + 1) % NUM_TARGETS;
}

if (keyboard_check_pressed(vk_enter)) {
	with (oCard) {
		state = CardState.BEGIN_ROTATE_TO_UPRIGHT_POSITION;
	}
}

if (keyboard_check_pressed(ord("F"))) {
	with (oCard) {
		state = CardState.BEGIN_FLIPPLING;
	}
}
