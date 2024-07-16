/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//travel para próxima room
if (global.dialogo_acabou_elfo1 || global.dialogo_acabou_elfo2) {
	room_goto(destino);
	
	other.x = posicao_x;
	other.y = posicao_y;
}
	

//definindo a posição x e y do player ('other' é com qm eu colido)
