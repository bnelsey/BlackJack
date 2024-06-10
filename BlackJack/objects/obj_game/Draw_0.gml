/// @description Insert description here
// You can write your code in this editor

// draw balance coin sprite
if balance_value > 0
{
	// Display the stack of chips
	var _y = 0; // starting X position (adjust to your liking)
	var _chips_length = array_length(balance_chips)-1;	
	
	for(i = 0; i <= _chips_length; i +=1)
	{
	    draw_sprite(spr_chip, balance_chips[i], 350, 608 - _y); // adjust the X offset as needed
	    _y += 5;
	}
}

// draw boxes
draw_set_color(c_black)
draw_set_alpha(0.5)


draw_rectangle(balance_x1,balance_y1,balance_x2,balance_y2,false)

if dealer_value > 0
	draw_rectangle(dealer_x1,dealer_y1,dealer_x2,dealer_y2,false)

 
// draw texts
draw_set_color(c_white)
draw_set_alpha(1)
draw_text(balance_x,balance_y,balance_string)

var _cards_left = array_length(deck);
draw_text(1669, 103-30, "left: " + string(_cards_left))
/*
if _cards_left > 0
{
	draw_sprite_ext(spr_card_back,0,deck_x, deck_y, 1,1,45,c_white,1)
}
*/

if dealer_value > 0
	draw_text(dealer_x,dealer_y,dealer_string)
	