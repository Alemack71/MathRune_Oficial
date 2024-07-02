// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

//Iniciando máquina de estados
function estado() constructor
{
	//Iniciando estado
	static inicia = function() {}
	//Rodando estado
	static roda = function() {}
	//Finalizando estado
	static finaliza = function() {}
}

//funções para controlar minha máquina de estado
//iniciando o estado
function inicia_estado(_estado)
{
	//Salvando estado passado em uma variável
	estado_atual = _estado
	
	//iniciando o estado atual
	estado_atual.inicia()
}

//Rodando o estado
function roda_estado()
{
	estado_atual.roda()	
}

//Trocando de estado
function troca_estado(_estado)
{
	//Finalizando o estado atual
	estado_atual.finaliza()
	
	//Rodando o próximo estado
	estado_atual = _estado
	
	//Rodando o próximo estado
	estado_atual.inicia()
}

//Definindo a sprite
function define_sprite(_dir = 0, _sprite_side, _sprite_front, _sprite_back)
{
	var _sprite;
	
	switch(_dir)
	{
		case 0: _sprite = _sprite_side; image_xscale = 1; break
		case 1: _sprite = _sprite_back; break
		case 2: _sprite = _sprite_side; image_xscale = -1; break
		case 3: _sprite = _sprite_front; break
	}
	
	return _sprite
}