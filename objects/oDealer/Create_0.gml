enum DealerState {
	IDLE,
	DEALING_CARDS,
	ROTATING_CARDS_TO_UPRIGHT_POSITION,
	FLIPPING_CARDS
};

state = DealerState.IDLE;

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
