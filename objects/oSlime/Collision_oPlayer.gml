/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//quando o player encosta no slime ativa o encontro
if(inst_8AA9384.ativar) 
{
	instance_destroy();
} else if (inst_8AA9384.ativar == false) 
{
	NewEncounter([global.enemies.slimeG, global.enemies.slimeG], sBgField);
}

inst_8AA9384.ativar = false;