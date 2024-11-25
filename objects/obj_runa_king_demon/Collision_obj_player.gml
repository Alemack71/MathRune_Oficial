/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

global.coletou_runa3 = true;
global.dialogo_on = true;
startDialogue("Runa_king_demon");

global.party[0].hpMax = 69;
global.party[0].mpMax = 69;

global.party[0].hp = global.party[0].hpMax;
global.party[0].mp = global.party[0].mpMax;

instance_destroy();
