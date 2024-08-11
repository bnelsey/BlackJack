/// @description Insert description here
// You can write your code in this editor


initialize_step = 0
initialize_step_previous = 0

x = room_width/2
y = room_height/2
sprite_index = spr_intro1
image_xscale = 0.1
image_yscale = 0.1

alarm[0] = 1
//room_goto(rm_init)


start_val = image_xscale
target_val = 1
steps_total = room_speed * 0.5
steps_left = steps_total

