/// @description Insert description here
// You can write your code in this editor


// Display the stack of chips
var _y = 0; // starting X position (adjust to your liking)
var _chips_length = array_length(chip_stack);	
	
for(var _i = 0; _i < _chips_length; _i +=1)
{
	draw_sprite(spr_chip, chip_stack[_i], x, y - _y); // adjust the X offset as needed
	_y += 5;
}