/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (global.player_continuing) {
    // Criar o jogador na posição salva
    instance_create_layer(global.player_x, global.player_y, "Instances", obj_player);
    global.player_continuing = false; // Resetar a flag para garantir que isso só aconteça uma vez
	
} else if (global.novo_jogo) {
	instance_create_layer(50, 69, "Instances", obj_player);
	global.dialogo_acabou_elfo1 = false;
	global.dialogo_acabou_elfo2 = false;
	global.novo_jogo = false; //Mesmo motivo
}

// Criar os outros dois objetos persistentes
if (!instance_exists(obj_game_pause_and_bar)) {
    instance_create_layer(0, 0, "Instances", obj_game_pause_and_bar);
}

if (!instance_exists(obj_UI_menu)) {
    instance_create_layer(0, 0, "Instances", obj_UI_menu);
}

//Gerencia em que nivel o player está
if (global.coletou_runa1)
{
	global.party[0].actions = [global.action_library.attack, global.action_library.ice, global.action_library.escape];
}
if (global.coletou_runa1 && global.coletou_runa2) 
{
	global.party[0].actions =  [global.action_library.attack, global.action_library.ice, global.action_library.fire, global.action_library.escape];
}

global.party[0].hpMax = 20 + (10 * global.coletou_runa1) + (10 * global.coletou_runa2);
global.party[0].mpMax = 15 + (5 * global.coletou_runa1) + (10 * global.coletou_runa2);