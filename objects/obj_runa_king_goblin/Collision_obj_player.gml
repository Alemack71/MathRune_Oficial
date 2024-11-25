/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

global.coletou_runa2 = true;
global.dialogo_on = true;
startDialogue("Runa_king_goblin");

global.party[0].hpMax = 40;
global.party[0].mpMax = 25;

global.party[0].hp = global.party[0].hpMax;
global.party[0].mp = global.party[0].mpMax;

instance_destroy();
