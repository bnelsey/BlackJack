// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function round_new(){
	
	dealer_card_dealt = 0
	dealer_cards = []
	repeat_and_deal = false
	double_and_deal = false
	double_down = false
	ace_joker_split = false
	
	
	with(hand0)
	{
		player_card_dealt = 0
		player_cards = []	
	}
	with(hand1)
	{
		player_card_dealt = 0
		player_cards = []	
	}
	with(hand2)
	{
		player_card_dealt = 0
		player_cards = []	
	}
}