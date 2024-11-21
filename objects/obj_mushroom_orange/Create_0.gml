/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

tempo_estado = game_get_speed(gamespeed_fps) * 3;
timer_estado = tempo_estado;

move_x			= 0;
move_y			= 0;

limite_cima		= y-32
limite_baixo	= y+32
limite_esquerda = x-32
limite_direita	= x+32

// Inherit the parent event
event_inherited();

#region estado_idle

estado_idle.inicia = function()
{
	//Definir a sprite q ele vai usar
	sprite_index = spr_mushroom_orange_idle;
	//Iniciar a animação do começo
	image_index = 0;
	
	//resetando o timer dnv
	timer_estado = tempo_estado;
	
}


estado_idle.roda = function()
{
	//Diminuindo o timer do estado
	timer_estado--
	
	var _tempo = irandom(timer_estado);
	
	if (_tempo <= 0)
	{
		//dando mais chance de ir pro estado walk doq continuar no idle
		var _estado_novo = choose(estado_walk, estado_walk, estado_idle)
		
		troca_estado(_estado_novo);
	}
	
}
#endregion

#region estado_walk

estado_walk.inicia = function()
{
	sprite_index = spr_mushroom_orange_walk;
	image_index = 0;
	
	//resetando o timer estado
	timer_estado = tempo_estado
	
	//escolhendo aleatoriamente uma velocidade x e y para ele andar
	move_x = random_range(-0.6,0.6);
	move_y = random_range(-0.6,0.6);
	
}

estado_walk.roda = function()
{
	// Atualizar a posição do slime
    move_and_collide(move_x,move_y,obj_Colisor);
    
    // Verificar os limites e inverter a direção se necessário
    if (x >= limite_direita || x <= limite_esquerda) {
        move_x = -move_x;
    }
    if (y >= limite_baixo || y <= limite_cima) {
        move_y = -move_y;
    }
	
	//inverte horizontalmente o slime
	if (move_x < 0) 
	{
		image_xscale = -1;
	} else
	{
		image_xscale = 1;
	}
	
	//Diminuindo o timer do estado
	timer_estado--
	
	var _tempo = irandom(timer_estado);
	
	if (_tempo <= 0)
	{
		//dando mais chance de ir pro idle
		var _estado_novo = choose(estado_idle, estado_walk, estado_idle);
		
		troca_estado(_estado_novo);
	}
	
}

#endregion

//iniciando o estado COM as modificações
inicia_estado(estado_idle);