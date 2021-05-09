enum DealerState {
	START,
	DEALING_CARDS,
	ROTATING_CARDS_TO_UPRIGHT_POSITION,
	FLIPPING_CARDS,
	ALLOWING_CARD_REPLACEMENT_CHOICES,
	REMOVING_CHOSEN_CARDS,
	DEALING_REPLACEMENT_CARDS,
	ROTATING_REPLACEMENT_CARDS_TO_UPRIGHT_POSITION,
	FLIPPING_REPLACEMENT_CARDS,
	SHOWING_FINAL_RESULTS
};

state = DealerState.START;

cards = [noone, noone, noone, noone, noone];
NUM_CARDS = array_length(cards);
CARD_TARGET_POSITIONS = [
	{ x: 70, y: 67 },
	{ x: 95, y: 67 },
	{ x: 120, y: 67 },
	{ x: 145, y: 67 },
	{ x: 170, y: 67 },
];

CARD_DEALING_POSITION = {
	x: room_width / 2,
	y: -20
};

currentCardIndex = 0;

CARD_SELECTOR_Y = 90;
cardSelector = noone;
selectedCardIndex = 0;
