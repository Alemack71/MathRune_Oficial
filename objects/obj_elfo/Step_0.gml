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

//show_debug_message(global.dialogo_acabou_elfo1
//);

if (room_atual == 2 && global.key_1 == 4)
{
	dialogo_final = "Fatores_Multiplos"
	global.dialogo_acabou_elfo2 = false
	dialogo_trocou = true;
	if (dialogo_trocou)
	{
		ponto_exclamacao_reaparece = true;	
	} else if (!dialogo_trocou)
	{
		ponto_exclamacao_reaparece = false;	
	}
	
	if (ponto_exclamacao_reaparece)
	{
		instance_create_layer(x, y -24, "Instances", obj_exclamacao);	
	} else if (!ponto_exclamacao_reaparece)
	{
		instance_destroy(obj_exclamacao);		
	}
};

