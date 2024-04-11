/// @description update all strings



balance_string = string(balance_value)
balance_w = string_width(balance_string) + 10
balance_h = string_height(balance_string)
balance_x1 = balance_x - balance_w * 0.5
balance_y1 = balance_y - balance_h * 0.5
balance_x2 = balance_x + balance_w * 0.5
balance_y2 = balance_y + balance_h * 0.5


for(i=0; i<=2;i+=1)
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

dealer_string = string(dealer_value)
dealer_w = string_width(dealer_string) + 10
dealer_h = string_height(dealer_string)
dealer_x1 = dealer_x - dealer_w * 0.5
dealer_y1 = dealer_y - dealer_h * 0.5
dealer_x2 = dealer_x + dealer_w * 0.5
dealer_y2 = dealer_y + dealer_h * 0.5