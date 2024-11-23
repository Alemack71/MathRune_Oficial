/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

global.coletou_runa1 = true;
global.dialogo_on = true;
startDialogue("Runa_king_slime");

global.party[0].hpMax = 30;
global.party[0].mpMax = 20;

global.party[0].hp = global.party[0].hpMax;
global.party[0].mp = global.party[0].mpMax;

instance_destroy();
