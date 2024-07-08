/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Se a variavel ativar ser true (quer dizer q o jogo saiu da batalha reativando todas as instancias)
if(inst_4E1B8FB1.ativar) 
{
	instance_destroy();
} //Se nao, inicia a batalha
else if (inst_4E1B8FB1.ativar == false) 
{
	NewEncounter([global.enemies.slimeG, global.enemies.slimeG], sBgField);
}

//seta novamente para false para nao destruir todas as outras instancias
inst_4E1B8FB1.ativar = false;