/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!instance_exists(obj_textbox)) {
	global.dialogo_on = false;
}

if (progresso <= 0  && global.dialogo_acabou_elfo1 = false)
{
	instance_create_layer(x, y -24, "Instances", obj_exclamacao);	
} else {
	instance_destroy(obj_exclamacao);	
}

if (progresso <= 0  && global.dialogo_acabou_elfo2 = false)
{
	instance_create_layer(x, y -24, "Instances", obj_exclamacao);	
} else {
	instance_destroy(obj_exclamacao);	
}

show_debug_message(global.dialogo_acabou_elfo1
);

