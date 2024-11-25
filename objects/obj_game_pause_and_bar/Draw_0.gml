///// @description Inserir descrição aqui
//// Você pode escrever seu código neste editor

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

var _x = _cam_x + 240;
var _y =  _cam_y + 10;

var _x_bar = _cam_x ;
var _y_bar =  _cam_y + 10;

draw_set_font(fnOpenSansPX);
draw_set_color(c_aqua);
draw_set_halign(fa_left);

//if (!global.gamePaused)
//{
//	draw_text(_x, _y, "Score: ");
//	draw_set_color(c_yellow);
//	draw_text(_x + string_width("Score: "), _y, string(global.pontos));
//}

var _escala = 1;
var _guia =  display_get_gui_height();
var _spra = sprite_get_height(spr_hud_barra)  * _escala;

var _vida = global.party[0].hp;
var _maxvida = global.party[0].hpMax;

var _mana = global.party[0].mp;
var _maxmana = global.party[0].mpMax;

//Se o jogo tiver pausado, oculta a barra de vida/mana
if (!global.gamePaused)
{
    //draw_sprite_ext(spr_hud_barra_vida, 0, _x_bar, _y_bar, (_vida/_maxvida) * _escala, _escala, 0, c_white, 1);
	//draw_sprite_ext(spr_hud_barra_mana, 0, _x_bar, _y_bar+4, (_mana/_maxmana) * _escala, _escala, 0, c_white, 1);
	//draw_sprite_ext(spr_hud_barra, 0, _x_bar, _y_bar,_escala, _escala, 0, c_white, 1);
}


