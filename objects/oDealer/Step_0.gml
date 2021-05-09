var playerWantsCards = keyboard_check_pressed(vk_space);
var isDoneDealingCards = currentCardIndex >= NUM_CARDS;
var isDoneFlippingCards = currentCardIndex >= NUM_CARDS;
var isDoneChoosingReplacementCards = keyboard_check_pressed(vk_enter);

var isDoneRotatingCardsToUprightPosition = true;
with (oCard) {
	if (state != CardState.IDLE) {
		isDoneRotatingCardsToUprightPosition = false;
	}
}



if (state == DealerState.START && playerWantsCards) {
	state = DealerState.DEALING_CARDS;
	
	for (var i = 0; i < NUM_CARDS; i++) {
		if (cards[i] != noone) {
			instance_destroy(cards[i]);
		}

		cards[i] = instance_create_layer(CARD_DEALING_POSITION.x, CARD_DEALING_POSITION.y, "Instances", oCard);
		cards[i].targetX = CARD_TARGET_POSITIONS[i].x;
		cards[i].targetY = CARD_TARGET_POSITIONS[i].y;
		cards[i].cardValue = irandom_range(1, 52);
	}
	
	currentCardIndex = 0;
	cards[currentCardIndex].state = CardState.BEGIN_BEING_DEALT;
} else if (state == DealerState.DEALING_CARDS && isDoneDealingCards) {
	state = DealerState.ROTATING_CARDS_TO_UPRIGHT_POSITION;

	with (oCard) {
		state = CardState.BEGIN_ROTATE_TO_UPRIGHT_POSITION;
	}
} else if (state == DealerState.ROTATING_CARDS_TO_UPRIGHT_POSITION && isDoneRotatingCardsToUprightPosition) {
	state = DealerState.FLIPPING_CARDS;

	currentCardIndex = 0;
	cards[currentCardIndex].state = CardState.BEGIN_FLIPPLING;
} else if (state == DealerState.FLIPPING_CARDS && isDoneFlippingCards) {
	state = DealerState.ALLOWING_CARD_REPLACEMENT_CHOICES;

	selectedCardIndex = 0;
	cardSelector = instance_create_layer(CARD_TARGET_POSITIONS[selectedCardIndex].x, CARD_SELECTOR_Y, "Instances", oCardSelector);
} else if (state == DealerState.ALLOWING_CARD_REPLACEMENT_CHOICES && isDoneChoosingReplacementCards) {
	state = DealerState.REMOVING_CHOSEN_CARDS;

	instance_destroy(oCardSelector);

	var areCardsSelected = false;
	with (oCard) {
		if (isSelected) {
			areCardsSelected = true;
		}
	}
	if (!areCardsSelected) {
		state = DealerState.SHOWING_FINAL_RESULTS;
	}
}



switch (state) {
	case DealerState.DEALING_CARDS: {
		var currentCard = cards[currentCardIndex];
		if (currentCard.state == CardState.IDLE) {
			currentCardIndex++;
			if (currentCardIndex >= NUM_CARDS) {
				break;
			}

			currentCard = cards[currentCardIndex];
			currentCard.state = CardState.BEGIN_BEING_DEALT;
		}
	} break;

	case DealerState.ROTATING_CARDS_TO_UPRIGHT_POSITION: {
		// do nothing
	} break;

	case DealerState.FLIPPING_CARDS: {
		var currentCard = cards[currentCardIndex];
		if (currentCard.state == CardState.IDLE) {
			currentCardIndex++;
			if (currentCardIndex >= NUM_CARDS) {
				break;
			}

			currentCard = cards[currentCardIndex];
			currentCard.state = CardState.BEGIN_FLIPPLING;
		}
	} break;

	case DealerState.ALLOWING_CARD_REPLACEMENT_CHOICES: {
		if (keyboard_check_pressed(vk_left)) {
			selectedCardIndex = selectedCardIndex - 1 < 0 ? NUM_CARDS - 1 : selectedCardIndex - 1;
		} else if (keyboard_check_pressed(vk_right)) {
			selectedCardIndex = selectedCardIndex + 1 >= NUM_CARDS ? 0 : selectedCardIndex + 1;
		} else if (keyboard_check_pressed(vk_space)) {
			cards[selectedCardIndex].state = CardState.BEGIN_CHANGE_SELECTION_STATUS;
		}

		cardSelector.x = CARD_TARGET_POSITIONS[selectedCardIndex].x;
		cardSelector.y = CARD_SELECTOR_Y;
	} break;

	case DealerState.REMOVING_CHOSEN_CARDS: {
		//TODO
	} break;

	case DealerState.DEALING_REPLACEMENT_CARDS: {
		//TODO
	} break;

	case DealerState.ROTATING_REPLACEMENT_CARDS_TO_UPRIGHT_POSITION: {
		//TODO
	} break;

	case DealerState.FLIPPING_REPLACEMENT_CARDS: {
		//TODO
	} break;

	case DealerState.SHOWING_FINAL_RESULTS: {
		//TODO
	} break;

	case DealerState.START:
	default: {
		// do nothing
	} break;
}
