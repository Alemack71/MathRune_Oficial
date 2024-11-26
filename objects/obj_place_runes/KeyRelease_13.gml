/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (point_distance(x, y, obj_player.x, obj_player.y) <= 32) {
	if (global.coletou_runa3) room_goto(rm_fim);
}
