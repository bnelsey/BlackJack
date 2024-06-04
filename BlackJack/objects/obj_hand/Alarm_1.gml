/// @description update all strings



bet_value = ceil(bet_value)

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

dbg("hand strings updated! bet value is", bet_value)
dbg("current_time", current_time)