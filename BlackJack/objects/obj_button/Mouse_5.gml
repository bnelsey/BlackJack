/// @description split test

if sprite_index == btn_deal
{
	obj_game.alarm[6] = 1
	array_push(obj_game.deck, 2,16,30,44,2,16,2,16,30,44,2,16) // split test, 2's
	//array_push(obj_game.deck, 9,23,37,51) // split test, 9's
	//array_push(obj_game.deck, 57,57,57,57) // red joker test
	//array_push(obj_game.deck, 3,1,8,8,6,6) // copy specific play
	dbg("deck", obj_game.deck)
}	