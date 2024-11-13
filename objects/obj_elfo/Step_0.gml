/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!instance_exists(obj_textbox)) {
	global.dialogo_on = false;
}

if (room_atual == 1)
{
	if (global.dialogo_acabou_elfo1 == false)
	{
		instance_create_layer(x, y -24, "Instances", obj_exclamacao);	
	} else {
		instance_destroy(obj_exclamacao);	
		dialogo = dialogo_final;
	}
}

if (room_atual == 2)
{
	if (global.dialogo_acabou_elfo2 == false)
	{
		instance_create_layer(x, y -24, "Instances", obj_exclamacao);	
	} else {
		instance_destroy(obj_exclamacao);	
		dialogo = dialogo_final;
	}
}

//show_debug_message(global.dialogo_acabou_elfo1
//);

if (room_atual == 2 && global.key_1 == 4)
{
	dialogo_final = "Fatores_Multiplos";
	if (!global.dialogo_acabou_elfo2) {
		dialogo_trocou = true;
	} else {
		dialogo_trocou = false;
	}
	
	if (dialogo_trocou)
	{
		instance_create_layer(x, y -24, "Instances", obj_exclamacao);
	} else if (!dialogo_trocou)
	{
		instance_destroy(obj_exclamacao);	
	}
};

show_debug_message("Elfo 1:" + string(dialogo_final));
show_debug_message("Elfo 2:" + string(global.dialogo_acabou_elfo2));
show_debug_message("Trocou:" + string(dialogo_trocou));
show_debug_message("terminou:" + string(progresso));
