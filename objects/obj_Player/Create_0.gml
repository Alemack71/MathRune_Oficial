/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Iniciando o meu primeiro estado
estado_idle = new estado()

//Iniciando o estado walk
estado_walk = new estado()

//Iniciando o estado de attack
estado_attack = new estado()

#region estado_idle
//Meu estado idle precisa de um inicia
estado_idle.inicia = function()
{
	//Definindo a sprite atual com base na direção 
	var _sprite = define_sprite(dir, spr_Player_idle_side, spr_Player_idle_front, spr_Player_idle_back)
	
	//Ajustando a sprite	
	sprite_index = _sprite
	
	//Garantindo que a animação comece no primeiro frame
	image_index = 0
}

estado_idle.roda = function()
{
	//Achando a condição para sair desse estado
	
	//Se eu estiver em movimento, então vou para o estado de walk
	
	//xor retorna true para um dos dois mas false para os dois ao mesmo tempo
	if (global.dialogo_on == 0) {
		if (up xor down or left xor right)
		{
			troca_estado(estado_walk)	
		}
	}	
	//Condição para ir para o estado de ataque
	if (attack) 
	{
		troca_estado(estado_attack)
	}
		
}

#endregion

#region estado_walk

estado_walk.inicia = function()
{
	
	dir = (point_direction(0, 0, right - left, down - up) div 90) 
	//Definindo a sprite
	
	
	//Configurando a sprite
	sprite_index = define_sprite(dir, spr_Player_walk_side, spr_Player_walk_front, spr_Player_walk_back)
	
	//Começando a animação do começo
	image_index = 0
}

estado_walk.roda = function()
{
	
	//Condição para sair do estado
	//Se eu estou parado eu vou para o estado de idle
	
	//Definindo a sprite
	sprite_index = define_sprite(dir, spr_Player_walk_side, spr_Player_walk_front, spr_Player_walk_back)
	
	if (movev == 0 and moveh == 0)
	{
		troca_estado(estado_idle)	
	}
	
	//Indo para o estado de ataque
	if (attack)
	{
		troca_estado(estado_attack)	
	}
}

#endregion

#region estado_attack

estado_attack.inicia = function()
{
	//Definindo a sprite
	//Ajustando a sprite	
	sprite_index = define_sprite(dir, spr_Player_atk_side, spr_Player_atk_front, spr_Player_atk_back)
	
	//Garantindo que a animação comece no primeiro frame
	image_index = 0
	
	moveh = 0
	movev = 0
}

//Configurando o estado de attack
estado_attack.roda = function()
{
	
	/*Achando a velocidade real da animação
	var speed_real = image_speed  / game_get_speed(gamespeed_fps)
	
	show_debug_message(speed_real)
	*/
	
	//Saindo do ataque quando ele acabar
	if (image_index >= image_number-0.2)
	{
		//Indo para o estado de parado
		troca_estado(estado_idle)
	}
}

#endregion 

//iniciar variáveis
#region iniciando variáveis

//controles iniciados sem valor
up = noone
down = noone
left = noone
right = noone
attack = noone

//variáveis de movimento
//iniciando parado
moveh = 0
movev = 0

//velocidade do jogador
vel = 2

//consertar diagonal
veld = vel * 0.707 

//Controlando a direção que o player está olhando]
dir = 0

#endregion

//Iniciando minha máquina de estado
inicia_estado(estado_idle)

if ( global.player_continuing == true )
{
    global.player_continuing = false
    x = global.player_x
    y = global.player_y
}

