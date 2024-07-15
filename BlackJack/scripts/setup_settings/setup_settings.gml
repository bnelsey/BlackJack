// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setup_settings(){
	
	xoffset = 4
	yoffset = 3
	
	
	new_button = instance_create_depth(1781,285,-1002,obj_button)
	new_button.sprite_index = btn_settings
	
	settings_static = instance_create_depth(1030,79,-1001,obj_static)
	settings_static.sprite_index = settings_main

	settings_about_ads = instance_create_depth(6,226,-1001,obj_static)
	settings_about_ads.sprite_index = settings_ads
	settings_about_ads.visible = false
	
	settings_about_ads_arrow = instance_create_depth(907,869,-1001,obj_static)
	settings_about_ads_arrow.sprite_index = settings_arrow
	settings_about_ads_arrow.visible = false
		
	new_button = instance_create_depth(1045-xoffset,887-(yoffset*2),-1002,obj_button)
	new_button.sprite_index = button448
	new_button.button_section = SETTINGS_ABOUT_ADS
	new_button.button_id = 0
	new_button.image_alpha = 0
	
	
	new_button = instance_create_depth(1045-xoffset,984-(yoffset*2),-1002,obj_button)
	new_button.sprite_index = button539
	new_button.button_section = SETTINGS_ABOUT_J21PC
	new_button.button_id = 0
	new_button.image_alpha = 0

	// sfx
	new_button = instance_create_depth(1457-xoffset,187-yoffset,-1002,obj_button)
	new_button.sprite_index = button116
	new_button.button_section = SETTINGS_SFX
	new_button.button_id = 1
	new_button.image_alpha = 0
	new_button = instance_create_depth(1633-xoffset,187-yoffset,-1002,obj_button)
	new_button.sprite_index = button116	
	new_button.button_section = SETTINGS_SFX
	new_button.button_id = 0
	new_button.image_alpha = 0

	// music
	new_button = instance_create_depth(1457-xoffset,290-yoffset,-1002,obj_button)
	new_button.sprite_index = button116
	new_button.button_section = SETTINGS_MUSIC
	new_button.button_id = 1
	new_button.image_alpha = 1
	new_button = instance_create_depth(1633-xoffset,290-yoffset,-1002,obj_button)
	new_button.sprite_index = button116
	new_button.button_section = SETTINGS_MUSIC
	new_button.button_id = 0
	new_button.image_alpha = 1
	
	// playlist
	new_button = instance_create_depth(1333-xoffset,375-yoffset,-1002,obj_button)
	new_button.sprite_index = button116
	new_button.button_section = SETTINGS_PLAYLIST
	new_button.button_id = 0
	new_button.image_alpha = 0
	new_button = instance_create_depth(1448-xoffset,375-yoffset,-1002,obj_button)
	new_button.sprite_index = button154
	new_button.button_section = SETTINGS_PLAYLIST
	new_button.button_id = 1
	new_button.image_alpha = 0
	new_button = instance_create_depth(1605-xoffset,375-yoffset,-1002,obj_button)
	new_button.sprite_index = button154
	new_button.button_section = SETTINGS_PLAYLIST
	new_button.button_id = 2
	new_button.image_alpha = 0
	new_button = instance_create_depth(1773-xoffset,375-yoffset,-1002,obj_button)
	new_button.sprite_index = button116
	new_button.button_section = SETTINGS_PLAYLIST
	new_button.button_id = 3
	new_button.image_alpha = 0
	
	
	// buy-in
	new_button = instance_create_depth(1449-xoffset,466-yoffset,-1002,obj_button)
	new_button.sprite_index = button89
	new_button.button_section = SETTINGS_BUY_IN
	new_button.button_id = 100
	new_button.image_alpha = 0
	new_button = instance_create_depth(1558-xoffset,466-yoffset,-1002,obj_button)
	new_button.sprite_index = button89
	new_button.button_section = SETTINGS_BUY_IN
	new_button.button_id = 500
	new_button.image_alpha = 0
	new_button = instance_create_depth(1670-xoffset,466-yoffset,-1002,obj_button)
	new_button.sprite_index = button59
	new_button.button_section = SETTINGS_BUY_IN
	new_button.button_id = 1000
	new_button.image_alpha = 0
	new_button = instance_create_depth(1752-xoffset,466-yoffset,-1002,obj_button)
	new_button.sprite_index = button59
	new_button.button_section = SETTINGS_BUY_IN
	new_button.button_id = 2000
	new_button.image_alpha = 0
	new_button = instance_create_depth(1835-xoffset,466-yoffset,-1002,obj_button)
	new_button.sprite_index = button59
	new_button.button_section = SETTINGS_BUY_IN
	new_button.button_id = 5000
	new_button.image_alpha = 0
	
	new_button = instance_create_depth(1452-xoffset,514-yoffset,-1002,obj_button)
	new_button.sprite_index = button89
	new_button.button_section = SETTINGS_BUY_IN
	new_button.button_id = 10000
	new_button.image_alpha = 0
	new_button = instance_create_depth(1558-xoffset,514-yoffset,-1002,obj_button)
	new_button.sprite_index = button89
	new_button.button_section = SETTINGS_BUY_IN
	new_button.button_id = 20000
	new_button.image_alpha = 0
	new_button = instance_create_depth(1667-xoffset,514-yoffset,-1002,obj_button)
	new_button.sprite_index = button89
	new_button.button_section = SETTINGS_BUY_IN
	new_button.button_id = 50000
	new_button.image_alpha = 0
	new_button = instance_create_depth(1776-xoffset,514-yoffset,-1002,obj_button)
	new_button.sprite_index = button116
	new_button.button_section = SETTINGS_BUY_IN
	new_button.button_id = 100000
	new_button.image_alpha = 0
	
	
	// activate one sound button
	with(obj_button)
	{	
		if button_section == SETTINGS_SFX
		{
			image_alpha = 0		
			if button_id == global.volume
				image_alpha = 1
		}
		if button_section == SETTINGS_MUSIC
		{
			image_alpha = 0		
			if button_id == global.musicvolume
				image_alpha = 1
		}
		if button_section == SETTINGS_PLAYLIST
		{
			image_alpha = 1
		}
		if button_section == SETTINGS_BUY_IN
		{
			image_alpha = 0		
			if button_id == global.buy_in
				image_alpha = 1
		}
	}


	xsep = 59
	for(i=0;i<10;i+=1)
	{
		new_button = instance_create_depth(1269+i*xsep-xoffset,607-yoffset,-1002,obj_button)
		new_button.sprite_index = button59
		new_button.button_section = SETTINGS_DECKS
		//new_button.drawtext = true
		new_button.button_id = i+1
		new_button.text = string(new_button.button_id)
		new_button.xoffset = 0
		new_button.yoffset = 0
	}

	// activate one deck # button
	with(obj_button)
	{
		if button_section == SETTINGS_DECKS
		{
			if button_id = global.decks
				image_alpha = 1
			else
				image_alpha = 0
		}	
	}
	
	
	

	// table color
	new_button = instance_create_depth(1444-xoffset,741-yoffset,-1002,obj_button)
	new_button.sprite_index = button169
	new_button.button_section = SETTINGS_TABLE
	new_button.button_id = 0
	new_button.image_alpha = 1
	new_button = instance_create_depth(1687-xoffset,741-yoffset,-1002,obj_button)
	new_button.sprite_index = button169	
	new_button.button_section = SETTINGS_TABLE
	new_button.button_id = 1
	new_button.image_alpha = 0
	new_button = instance_create_depth(1444-xoffset,801-yoffset,-1002,obj_button)
	new_button.sprite_index = button169
	new_button.button_section = SETTINGS_TABLE
	new_button.button_id = 2
	new_button.image_alpha = 0
	new_button = instance_create_depth(1687-xoffset,801-yoffset,-1002,obj_button)
	new_button.sprite_index = button169
	new_button.button_section = SETTINGS_TABLE
	new_button.button_id = 3
	new_button.image_alpha = 0
	
	// activate one table color button
	with(obj_button)
	{
		if button_section == SETTINGS_TABLE
		{
			image_alpha = 0		
			if button_id == global.table_color
				image_alpha = 1
		}
	}
	

	settings_static.visible = false
	with(obj_button)
	{
		if button_section > 0
			instance_deactivate_object(id)
	}
}