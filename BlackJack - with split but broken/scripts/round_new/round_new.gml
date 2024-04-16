// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function round_new(){
	obj_game.dealer_card_dealt = 0
	obj_game.player_card_dealt = 0
	obj_game.player_cards[0] = []
	obj_game.player_cards[1] = []
	obj_game.player_cards[2] = []	
	obj_game.player_card_instances[0] = []
	obj_game.player_card_instances[1] = []
	obj_game.player_card_instances[2] = []
	obj_game.dealer_cards = []	
	obj_game.repeat_and_deal = false
	obj_game.double_and_deal = false
	obj_game.double_down = false
	obj_game.ace_joker_split = false
}