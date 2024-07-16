/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Se a variavel ativar ser true (quer dizer q o jogo saiu da batalha reativando todas as instancias)
if (global.ativar) 
{
	instance_destroy();
	global.key_2++;
} //Se nao, inicia a batalha
else if (global.ativar == false) 
{
	NewEncounter([global.enemies.slimeB, global.enemies.slimeB], sBgField);
}

//seta novamente para false para nao destruir todas as outras instancias
global.ativar = false;