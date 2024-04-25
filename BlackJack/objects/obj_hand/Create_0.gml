/// @description Insert description here
// You can write your code in this editor

playing = false
playing_visible = false

my_hand_id = 0
player_cards = []
player_card_instances = []

/*
bet_x[0] = 915
bet_y[0] = 786
bet_string_x[0] = 970
bet_string_y[0] = 901

player_x[0] = 961
player_y[0] = 763

player_x[1] = 1244
player_y[1] = 763

player_x[2] = 702
player_y[2] = 763


player_card_x[0] = 904
player_card_y[0] = 586

player_card_x[1] = 1187
player_card_y[1] = 586

player_card_x[2] = 645
player_card_y[2] = 586

// calculate positions for bets and player cards
i = my_hand_id
//for(i=0; i<=2;i+=1)
{
	bet_value[i] = 0
	bet_string[i] = string(bet_value[i])
	bet_obj[i] = noone
	bet_w[i] = string_width(bet_string[i]) + 10
	bet_h[i] = string_height(bet_string[i])
	bet_x1[i] = bet_string_x[i] - bet_w[i] * 0.5
	bet_y1[i] = bet_string_y[i] - bet_h[i] * 0.5
	bet_x2[i] = bet_string_x[i] + bet_w[i] * 0.5
	bet_y2[i] = bet_string_y[i] + bet_h[i] * 0.5
	

	player_value[i] = 0
	player_string[i] = string(player_value[i])
	player_w[i] = string_width(player_string[i]) + 10
	player_h[i] = string_height(player_string[i])
	player_x1[i] = player_x[i] - player_w[i] * 0.5
	player_y1[i] = player_y[i] - player_h[i] * 0.5
	player_x2[i] = player_x[i] + player_w[i] * 0.5
	player_y2[i] = player_y[i] + player_h[i] * 0.5
}

*/




player_card_x = 1187
player_card_y = 586
player_x = 1244
player_y = 763
player_card_dealt = 0
player_card_xsep = player_card_xsep
player_card_ysep = player_card_ysep
card_xoffset = card_xoffset
card_yoffset = card_yoffset



player_value = 0
player_string = string(player_value)
player_x = 968
player_y = 557
player_w = string_width(player_string) + 10
player_h = string_width(player_string)
player_x1 = player_x - player_w * 0.5
player_y1 = player_y - player_h * 0.5
player_x2 = player_x + player_w * 0.5
player_y2 = player_y + player_h * 0.5


bet_value = 0
last_bet_value = 0
bet_string = string(bet_value)
bet_obj = noone
bet_x = 915
bet_y = 786
bet_w = string_width(bet_string) + 10
bet_h = string_width(bet_string)
bet_string_x = 970
bet_string_y = 901
bet_x1 = bet_string_x - bet_w * 0.5
bet_y1 = bet_string_y - bet_h * 0.5
bet_x2 = bet_string_x + bet_w * 0.5
bet_y2 = bet_string_y + bet_h * 0.5