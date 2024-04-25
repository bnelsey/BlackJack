/// @description Insert description here
// You can write your code in this editor


// draw balance coin sprite
if balance_value > 0
	draw_sprite(spr_chip, 0, 350, 608)


// draw boxes
draw_set_color(c_black)
draw_set_alpha(0.5)



draw_rectangle(balance_x1,balance_y1,balance_x2,balance_y2,false)

if dealer_value > 0
	draw_rectangle(dealer_x1,dealer_y1,dealer_x2,dealer_y2,false)

/*
if bet_value > 0
	draw_rectangle(bet_x1,bet_y1,bet_x2,bet_y2,false)
if player_value > 0
	draw_rectangle(player_x1,player_y1,player_x2,player_y2,false)
*/
 
// draw texts
draw_set_color(c_white)
draw_set_alpha(1)
draw_text(balance_x,balance_y,balance_string)

var _cards_left = array_length(deck);
draw_text(1713, 119, "cards left: " + string(_cards_left))

if dealer_value > 0
	draw_text(dealer_x,dealer_y,dealer_string)
	
/*
if bet_value > 0
	draw_text(bet_string_x,bet_string_y,bet_string)
if player_value > 0
	draw_text(player_x,player_y,player_string)

*/