// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function new_deck(){

	with(obj_game)
	{
		// 0-13 = Clubs
		// 14-27 = Diamonds
		// 28-41 = Hearts
		// 42-55 = Spades
		// Joker IDs: 0, 14, 28, 42 (the first of each suite)
		// special jokers: 56, 57
		
		deck = []

		// Initialize the array with numbers 1 to 56
		for (i = 0; i < 56; i++) {
		    deck[i] = i;
		}

		// add one extra joker from each suite
		//array_push(deck, 0, 14, 28, 42)

		// add special black and red jokers
		array_push(deck, 56,56,57,57)

		dbg("deck",deck)
		dbg("deck size",array_length(deck))
		
		// shuffle array
		deck = array_shuffle(deck)
		
	}
}