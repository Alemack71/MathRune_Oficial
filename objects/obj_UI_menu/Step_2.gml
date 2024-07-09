if (global.gamePaused){
	
	var keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	var keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	pauseOptionSelected += (keyDown - keyUp);
	if (pauseOptionSelected >= array_length(pauseOption)) pauseOptionSelected = 0;
	if (pauseOptionSelected < 0) pauseOptionSelected = array_length(pauseOption) -1;
	
	var keyActivate = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)
	if (keyActivate){
		switch (pauseOptionSelected){
			case 0: //Continue
			{
				global.gamePaused = false;
				with (all)
				{		
					gamePausedImageSpeed = image_speed
					image_speed = 0;
				}
			}break;
			case 1: // Save and Quit
			{
				if(file_exists("save.sav"))file_delete("save.sav");
				ini_open("save.sav");
				ini_write_string("Player","nome",global.name);
				ini_write_real("Player","x_atual",obj_player.x);
				ini_write_real("Player","y_atual",obj_player.y);
				ini_write_real("Player","hp_atual",global.party[0].hp);
				ini_write_real("Player","mp_atual",global.party[0].mp);
				ini_write_real("Player","sala_atual", room);
				ini_close();
				with(obj_game) instance_destroy();
				instance_destroy(obj_player);
				instance_destroy();
				room_goto(rm_menu);	
			}break;
			case 2: // Save and Quit to Desktop
			{
				url_open("https:/www.google.com");
			}
		}
	}
}
			
				