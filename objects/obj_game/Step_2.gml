if (keyboard_check_pressed(vk_escape)){
	if (!global.dialogo_on) 
	{
		global.gamePaused = !global.gamePaused;
	
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