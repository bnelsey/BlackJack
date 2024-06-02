/// @description Insert description here
// You can write your code in this editor

alarm[1] = room_speed * 0.25
//window_set_fullscreen(true)
//exit

if (browser_width != width || browser_height != height)
{
	window_set_size(browser_width,browser_height)
	width = browser_width
	height = browser_height
	window_center()
}