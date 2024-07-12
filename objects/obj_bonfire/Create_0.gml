//iniciando o estado padrão de todos os inimigos
estado_idle		= new estado();
estado_start	= new estado();
estado_burning	= new estado()
estado_apagando	= new estado();

ativou = false;
apaga = false;

tempo_estado = 30;
timer_estado = tempo_estado;

//inicia o estado idle por padrão
inicia_estado(estado_idle);

#region estado_idle

estado_idle.inicia = function()
{
	timer_estado = tempo_estado;
	//Definir a sprite q ele vai usar
	sprite_index = spr_fogueira_idle;
	//Iniciar a animação do começo
	image_index = 0;	
	
}


estado_idle.roda = function()
{
	if (ativou)
	{
		troca_estado(estado_start);
	}
	
}
#endregion

#region estado_start

estado_start.inicia = function()
{
	sprite_index = spr_fogueira_start;
	image_index = 0;
	
}

estado_start.roda = function()
{
	timer_estado--
	
	//inverte horizontalmente o slime
	if (timer_estado < 0) 
	{
		troca_estado(estado_burning)
		
	} 
	
}

#endregion

#region estado_burning
	estado_burning.inicia = function()
	{
		//Definir a sprite q ele vai usar
		sprite_index = spr_fogueira_burning;
		//Iniciar a animação do começo
		image_index = 0;	
	
	}


	estado_burning.roda = function()
	{
		if (ativou == 0)
		{
			timer_estado = tempo_estado;
			troca_estado(estado_apagando);
		}
	
	}
#endregion

#region estado_apagando
	estado_apagando.inicia = function()
	{
		sprite_index = spr_fogueira_desligando;
		image_index = 0;
	
	}

	estado_apagando.roda = function()
	{
		timer_estado--
	
		if (timer_estado < 0) 
		{
			troca_estado(estado_idle);
		
		} 
	}
#endregion
//iniciando o estado COM as modificações
inicia_estado(estado_idle);
global.dialogo_on = false;