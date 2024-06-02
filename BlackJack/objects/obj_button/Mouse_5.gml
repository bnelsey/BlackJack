/// @description split test

if sprite_index == btn_deal
{
	obj_game.alarm[6] = 1
	//array_push(obj_game.deck, 2,16,30,44,2,16,2,16,30,44,2,16) // split test, 2's <-- this is the main one
	
	// temporary tests follow:
	//array_push(obj_game.deck, 9,23,37,51) // split test, 9's
	//array_push(obj_game.deck, 57,57,57,57) // red joker test
	//array_push(obj_game.deck, 3,1,8,8,6,6) // copy specific play
	//array_push(obj_game.deck,23,3,0,2,9,3,23) // player gets split 9s, one gets regular blackjack, other gets joker21

	
	
	// better test code, auto reversed:
	var _new_card_array = [];
	
	//_new_card_array = [0,1,2,3]
	_new_card_array = [16,2,44,30,16,2,16,2,44,30,16,2] // split test, 2's <-- this is the main one
	
	//23,3,9,2,0,3,23
	//23 3 9 2 0 3 23
	
	_new_card_array = array_reverse(_new_card_array)
	obj_game.deck = array_concat(obj_game.deck, _new_card_array)
	dbg("deck", obj_game.deck)
}	