/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(inst_4E1B8FB1.ativar) 
{
	instance_destroy();
} else if (inst_4E1B8FB1.ativar == false) 
{
	NewEncounter([global.enemies.slimeG, global.enemies.slimeG], sBgField);
}

inst_4E1B8FB1.ativar = false;