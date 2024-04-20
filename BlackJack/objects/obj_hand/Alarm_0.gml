/// @description Insert description here
// You can write your code in this editor

// calculate positions for bets and player cards

i = my_hand_id
//for(i=0; i<=2;i+=1)
/*
{
	bet_string[i] = string(bet_value[i])
	bet_w[i] = string_width(bet_string[i]) + 10
	bet_h[i] = string_height(bet_string[i])
	bet_x1[i] = bet_string_x[i] - bet_w[i] * 0.5
	bet_y1[i] = bet_string_y[i] - bet_h[i] * 0.5
	bet_x2[i] = bet_string_x[i] + bet_w[i] * 0.5
	bet_y2[i] = bet_string_y[i] + bet_h[i] * 0.5
	
	
	player_string[i] = string(player_value[i])
	player_w[i] = string_width(player_string[i]) + 10
	player_h[i] = string_height(player_string[i])
	player_x1[i] = player_x[i] - player_w[i] * 0.5
	player_y1[i] = player_y[i] - player_h[i] * 0.5
	player_x2[i] = player_x[i] + player_w[i] * 0.5
	player_y2[i] = player_y[i] + player_h[i] * 0.5
}
*/



bet_string = string(bet_value)
bet_w = string_width(bet_string) + 10
bet_h = string_height(bet_string)
bet_x1 = bet_string_x - bet_w * 0.5
bet_y1 = bet_string_y - bet_h * 0.5
bet_x2 = bet_string_x + bet_w * 0.5
bet_y2 = bet_string_y + bet_h * 0.5


player_string = string(player_value)
player_w = string_width(player_string) + 10
player_h = string_height(player_string)
player_x1 = player_x - player_w * 0.5
player_y1 = player_y - player_h * 0.5
player_x2 = player_x + player_w * 0.5
player_y2 = player_y + player_h * 0.5