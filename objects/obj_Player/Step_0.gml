/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.gamePaused){ 
	moveh = 0;
	movev = 0;
	exit;
} else
{
	image_speed = 1;	
}

//Ajustando a minha profundidade
depth = -y

//pegando os inputs do player
up = keyboard_check(vk_up) or keyboard_check(ord("W"))
down = keyboard_check(vk_down) or keyboard_check(ord("S"))
right =  keyboard_check(vk_right) or keyboard_check(ord("D"))
left =  keyboard_check(vk_left) or keyboard_check(ord("A"))
//attack = keyboard_check_pressed(vk_space) or keyboard_check(ord("J"))

//aplicando os inputs à velocidade
if (global.dialogo_on == 0)  {
	movev = (down - up) * vel
	moveh = (right - left) * vel
	}
	
if (movev != 0 && moveh != 0) 
{
	movev = (down - up) * veld
	moveh = (right - left) * veld
}

//calculando a direção antes de mover
if (global.dialogo_on == 0 && moveh != 0 or movev != 0)  {
	dir = (point_direction(0, 0, moveh, movev) div 90) 
	}

//Rodando a minha máquina de estado
roda_estado()

//variável de controle pra saber se o player colidiu ou não
var _colidiu = false;

if place_meeting(x+moveh,y,obj_Colisor)
{
	while !place_meeting(x+sign(moveh),y,obj_Colisor)
	{
		x+=sign(moveh)	
	}
	moveh = 0;
	_colidiu = true; //marca que houve colisão
}

if (global.dialogo_on == 0) {
	x+=moveh
}

if place_meeting(x,y+movev,obj_Colisor)
{
	while !place_meeting(x,y+sign(movev),obj_Colisor)
	{
		y+=sign(movev)	
	}
	
	movev = 0;
	_colidiu = true;
}

if (global.dialogo_on == 0) {
	y+=movev
}

if (global.dialogo_on)
{
	_colidiu = true;	
}

if (_colidiu) {
	troca_estado(estado_idle);	
}

//show_debug_message(global.novo_jogo);
