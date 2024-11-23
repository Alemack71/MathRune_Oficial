/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

var _dist_x = abs(x - obj_player.x);
var _dist_y = abs(y - obj_player.y);

if (_dist_x <= 64 && _dist_y <= 64) {
    // Inicia o diálogo do chefe
	global.dialogo_on = true;
    startDialogue("Dialogo_king_slime");
	
	if (keyboard_check_released(vk_enter))
	{
	    // Decide o próximo passo após o diálogo
	    if (global.ativar && !global.escapou) {
	        instance_destroy();
	        global.key_slime_king++;
	    } 
	    // Se não, inicia a batalha
	    else if (!global.ativar) {
	        NewEncounter([global.enemies.king_Slime], sBgField_Forest);
	    }
	}

    // Reseta os estados globais para a próxima interação
	
    global.ativar = false;
    global.escapou = false;
}



