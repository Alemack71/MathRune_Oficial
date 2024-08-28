/// @description Inserir descrição aqui
// Você pode escrever seu código neste 

//Ajustando a profundidade
depth = -y  

//garantindo que nao se movem durante o pause
if(global.gamePaused){ 
	
	image_speed = 0;
	move_x = 0;
	move_y = 0;
	exit;

} else
{
	image_speed = 1;	
}

//rodando estado
roda_estado();