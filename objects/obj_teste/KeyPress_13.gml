//dialogo está ativo ent fica true


if distance_to_object(obj_player) <= 10{
	global.dialogo_on = true;
	startDialogue("Breakfast");
}  

//dialogo acaba e volta para false

