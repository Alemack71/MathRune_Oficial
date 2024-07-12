event_inherited();

if (!instance_exists(obj_textbox)) {
	global.dialogo_on = false;
}

//rodando estado
roda_estado();

show_debug_message(timer_estado)
