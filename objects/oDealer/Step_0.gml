var playerWantsCards = keyboard_check_pressed(vk_space);
var isDoneDealingCards = currentCardIndex >= NUM_CARDS;
var isDoneFlippingCards = currentCardIndex >= NUM_CARDS;

var isDoneRotatingCardsToUprightPosition = true;
with (oCard) {
	if (state != CardState.IDLE) {
		isDoneRotatingCardsToUprightPosition = false;
	}
}



if (state == DealerState.IDLE && playerWantsCards) {
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
	state = DealerState.IDLE;
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

	case DealerState.IDLE:
	default: {
		// do nothing
	} break;
}
