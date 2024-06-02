/// @description Joker21 test


if sprite_index == btn_deal
{
	//obj_game.alarm[6] = 1
	
	//array_push(obj_game.deck, 56,56,57,57,0, 9, 28, 42) // joker 21
	//array_push(obj_game.deck, 56,56,57,57) // joker value test
	//array_push(obj_game.deck, 1,1,15,15) // ace value test
	
	if async_processed == 0 or async_processed == 2
	{
		async_processed = 1	
		async_request = get_string_async("Which cards to place on top of the deck? use card_id #0-57, separated by spaces or commas", "0 1 2 3")
	}
}