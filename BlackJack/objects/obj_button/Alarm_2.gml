/// @description free_chips_counter

alarm[2] = room_speed * 1

global.free_chips += 1000
//text = "Free Chips Now: " + string(global.free_chips)
text = "Free Chips Now: " + num_separator(global.free_chips, ",", 3)