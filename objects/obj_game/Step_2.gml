if (keyboard_check_pressed(vk_escape)){
	if (!global.dialogo_on) 
	{
		if (!global.gamePaused) 
		{
			global.gamePaused = true;
		}
		
		if(global.gamePaused){
			with(all){
				gamePausedImageSpeed = image_speed;
				image_speed = 0;
			}
		}
		else{
			with(all)
			{
				image_speed = gamePausedImageSpeed;
			}
		}
	}
}