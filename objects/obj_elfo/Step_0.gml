/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!instance_exists(obj_textbox)) {
	global.dialogo_on = false;
}

if (global.progresso_dialogo <= 0)
{
	instance_create_layer(x, y -24, "Instances", obj_exclamacao);	
} else {
	instance_destroy(obj_exclamacao);	
}
