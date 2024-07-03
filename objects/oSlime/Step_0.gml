/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Ajustando a minha profundidade
depth = -y

if (obj_Player != noone) {
    // Definir os limites da área de ativação
    var trigger_left = x - trigger_width / 2;
    var trigger_right = x + trigger_width / 2;
    var trigger_top = y - trigger_height / 2;
    var trigger_bottom = y + trigger_height / 2;

    // Verificar se o jogador está dentro da área de ativação
    if (obj_Player.x > trigger_left && obj_Player.x < trigger_right &&
        obj_Player.y > trigger_top && obj_Player.y < trigger_bottom) {
        // Ativar batalha
       if(inst_4E1B8FB1.ativar) 
	   {
		    instance_destroy();
	   } else if (inst_4E1B8FB1.ativar == false) 
	   {
		    NewEncounter([global.enemies.slimeG, global.enemies.slimeG], sBgField);
	   }

		inst_4E1B8FB1.ativar = false;

        // Você pode querer destruir o inimigo aqui se for adequado
        // instance_destroy();
    }
}
	
