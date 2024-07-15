/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Se a variavel ativar ser true (quer dizer q o jogo saiu da batalha reativando todas as instancias)
if(inst_9CFA2F7.ativar) 
{
	instance_destroy();
} //Se nao, inicia a batalha
else if (inst_9CFA2F7.ativar == false) 
{
	NewEncounter([global.enemies.slimeB, global.enemies.slimeB], sBgField);
}

//seta novamente para false para nao destruir todas as outras instancias
inst_9CFA2F7.ativar = false;