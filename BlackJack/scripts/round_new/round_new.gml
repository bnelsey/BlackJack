// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function round_new(){
	
	dealer_card_dealt = 0
	dealer_cards = []
	repeat_and_deal = false
	double_and_deal = false
	double_down = false
	ace_joker_split = false
	insurance_taken = false
	regular_play_resume = false
	
	
	player_hand_current_id = 0
	player_hand_current = player_hand_list[player_hand_current_id]
	
	with(hand0)
	{
		player_card_dealt = 0
		player_cards = []	
		player_card_instances = []
		bet_value = 0
	}
	with(hand1)
	{
		player_card_dealt = 0
		player_cards = []	
		player_card_instances = []
		bet_value = 0
	}
	with(hand2)
	{
		player_card_dealt = 0
		player_cards = []	
		player_card_instances = []
		bet_value = 0
	}
}