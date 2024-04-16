/// @description update all strings


/*
// testing
alarm[1] = room_speed
balance_value = choose(1,22,333,4444,55555)
bet_value = choose(1,22,333,4444,55555)
dealer_value = choose(1,22,333,4444,55555)
player_value = choose(1,22,333,4444,55555)
*/

balance_string = string(balance_value)
balance_w = string_width(balance_string) + 10
balance_h = string_height(balance_string)
balance_x1 = balance_x - balance_w * 0.5
balance_y1 = balance_y - balance_h * 0.5
balance_x2 = balance_x + balance_w * 0.5
balance_y2 = balance_y + balance_h * 0.5


bet_string = string(bet_value)
bet_w = string_width(bet_string) + 10
bet_h = string_height(bet_string)
bet_x1 = bet_string_x - bet_w * 0.5
bet_y1 = bet_string_y - bet_h * 0.5
bet_x2 = bet_string_x + bet_w * 0.5
bet_y2 = bet_string_y + bet_h * 0.5


dealer_string = string(dealer_value)
dealer_w = string_width(dealer_string) + 10
dealer_h = string_height(dealer_string)
dealer_x1 = dealer_x - dealer_w * 0.5
dealer_y1 = dealer_y - dealer_h * 0.5
dealer_x2 = dealer_x + dealer_w * 0.5
dealer_y2 = dealer_y + dealer_h * 0.5


player_string = string(player_value)
player_w = string_width(player_string) + 10
player_h = string_height(player_string)
player_x1 = player_x - player_w * 0.5
player_y1 = player_y - player_h * 0.5
player_x2 = player_x + player_w * 0.5
player_y2 = player_y + player_h * 0.5