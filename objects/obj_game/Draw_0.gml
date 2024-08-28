/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

	var _cam_x = camera_get_view_x(view_camera[0]);
	var _cam_y = camera_get_view_y(view_camera[0]);

	var _x = _cam_x + 10;
	var _y =  _cam_y + 10;

	draw_set_font(fnOpenSansPX);
	draw_set_color(c_aqua);
	draw_set_halign(fa_left);
	
	

if (!global.gamePaused)
{
	draw_text(_x, _y, "Score: ");
	draw_set_color(c_yellow);
	draw_text(_x + string_width("Score: "), _y, string(global.pontos));
}

