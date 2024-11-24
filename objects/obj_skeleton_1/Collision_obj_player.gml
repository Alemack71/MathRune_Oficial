/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(global.ativar && !global.escapou) 
{
	instance_destroy();
	if (global.key_skeleton_1 < 3) global.key_skeleton_1++;
	if (global.key_bonfire < 3) global.key_bonfire++;
} //Se nao, inicia a batalha
else if (global.ativar == false) 
{
	NewEncounter([global.enemies.Skeleton1, global.enemies.Skeleton1], sBgField_Cave);
}

//se o player escapou ele precisa ser distanciado para não entrar instantaneamente na batalha dnv
if (global.escapou) obj_player.y += 64;

//seta novamente para false para nao destruir todas as outras instancias e permitir que escape dnv
global.ativar = false;
global.escapou = false;