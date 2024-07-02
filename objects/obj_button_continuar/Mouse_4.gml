event_inherited();

if (instance_exists(obj_ajuda))
	{
		instance_destroy(obj_ajuda);
	}

if (instance_exists(obj_save))
	{
		instance_destroy(obj_save);
	}

else

	{
		instance_create_layer(room_width / 2, room_height -100, "Instances", obj_save);
	}
