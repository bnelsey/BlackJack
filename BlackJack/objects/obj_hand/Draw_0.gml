/// @description Insert description here
// You can write your code in this editor

//draw_text(100,100, alarm[2])


// draw boxes
draw_set_color(c_black)
draw_set_alpha(0.5)


if bet_value > 0
	draw_rectangle(bet_x1,bet_y1,bet_x2,bet_y2,false)
	
if player_value > 0
	draw_rectangle(player_x1,player_y1,player_x2,player_y2,false)
	
	
 
// draw texts
draw_set_color(c_white)
draw_set_alpha(1)


if bet_value > 0
	draw_text(bet_string_x,bet_string_y,bet_string)
		
if player_value > 0
	draw_text(player_x,player_y,player_string)



