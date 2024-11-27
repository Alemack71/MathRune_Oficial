/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (point_distance(x, y, obj_player.x, obj_player.y) <= 32) {
	
	if (global.coletou_runa3) {
		instance_destroy(obj_player);
		room_goto(rm_fim);
	}
}
