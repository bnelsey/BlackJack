// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setup_settings(){
	settings_static = instance_create_depth(1294,283,-490,obj_static)
	settings_static.sprite_index = spr_settings

	new_bet = instance_create_depth(1781,292,-500,obj_button)
	new_bet.sprite_index = btn_settings

	new_bet = instance_create_depth(1540-7,372-3,-500,obj_button)
	new_bet.sprite_index = btn_medium
	new_bet.button_id = 1
	new_bet.image_alpha = 0
	new_bet = instance_create_depth(1678-3,372-3,-500,obj_button)
	new_bet.sprite_index = btn_medium
	new_bet.button_id = 0
	new_bet.image_alpha = 0

	// activate one sound button
	with(obj_button)
	{	
		if sprite_index == btn_medium
		{
			image_alpha = 0		
			if button_id == global.volume
				image_alpha = 1
		}
	}


	xsep = 40
	for(i=0;i<10;i+=1)
	{
		new_bet = instance_create_depth(1460+i*xsep,510,-500,obj_button)
		new_bet.sprite_index = btn_small
		new_bet.drawtext = true
		new_bet.button_id = i+1
		new_bet.text = string(new_bet.button_id)
		new_bet.xoffset = 0
		new_bet.yoffset = 0
	}

	// activate one deck # button
	with(obj_button)
	{
		if sprite_index = btn_small
		{
			if button_id = global.decks
				drawsprite = true
		}	
	}

	settings_static.visible = false
	with(obj_button)
	{
		if sprite_index == btn_medium or sprite_index == btn_small
			instance_deactivate_object(id)
	}
}