/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Se a variavel ativar ser true (quer dizer q o jogo saiu da batalha reativando todas as instancias) e ele não escapou (quer dizer que o player de fato venceu a luta)
if(global.ativar && !global.escapou) 
{
	instance_destroy();
	global.key_1++;
} //Se nao, inicia a batalha
else if (global.ativar == false) 
{
	NewEncounter([global.enemies.slimeG], sBgField_Forest);
}

//se o player escapou ele precisa ser distanciado para não entrar instantaneamente na batalha dnv
if (global.escapou) obj_player.x -= 32;

//seta novamente para false para nao destruir todas as outras instancias e permitir que escape dnv
global.ativar = false;
global.escapou = false;

