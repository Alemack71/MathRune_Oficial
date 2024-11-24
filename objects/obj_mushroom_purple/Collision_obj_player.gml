/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//Se a variavel ativar ser true (quer dizer q o jogo saiu da batalha reativando todas as instancias) e ele não escapou (quer dizer que o player de fato venceu a luta)
if(global.ativar && !global.escapou) 
{
	instance_destroy();
	if (global.key_mushroomp < 4) global.key_mushroomp++;
	if (global.key_bonfire < 3) global.key_bonfire++;
} //Se nao, inicia a batalha
else if (global.ativar == false) 
{
	NewEncounter([global.enemies.mushroomP], sBgField_Forest);
}

//se o player escapou ele precisa ser distanciado para não entrar instantaneamente na batalha dnv
if (global.escapou) 
{
    var _dx = [0, 32, 0, -32]; // Deslocamentos para direita, baixo, esquerda, cima (x)
    var _dy = [-32, 0, 32, 0]; // Deslocamentos para cima, direita, baixo, esquerda (y)

    for (var i = 0; i < array_length(_dx); i++) 
    {
        var _new_x = obj_player.x + _dx[i];
        var _new_y = obj_player.y + _dy[i];
        
        // Verifica se a posição não possui colisores
        if (!position_meeting(_new_x, _new_y, obj_Colisor)) 
        {
            obj_player.x = _new_x;
            obj_player.y = _new_y;
            break; // Sai do loop ao encontrar uma posição válida
        }
    }
}

//seta novamente para false para nao destruir todas as outras instancias e permitir que escape dnv
global.ativar = false;
global.escapou = false;