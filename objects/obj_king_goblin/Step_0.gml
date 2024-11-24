/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

var _dist_x = abs(x - obj_player.x);
var _dist_y = abs(y - obj_player.y);

if (_dist_x <= 666 && _dist_y <= 48) {
	if(global.ativar && !global.escapou) 
	{
		instance_destroy();
		instance_create_layer(x, y, "Instances", obj_runa_king_slime);
		global.key_goblin_king++;
	} //Se nao, inicia a batalha
	else if (global.ativar == false) 
	{
		NewEncounter([global.enemies.king_Slime], sBgField_Cave);
	}

	//se o player escapou ele precisa ser distanciado para não entrar instantaneamente na batalha dnv

	//seta novamente para false para nao destruir todas as outras instancias e permitir que escape dnv
	global.ativar = false;
	global.escapou = false;
}



