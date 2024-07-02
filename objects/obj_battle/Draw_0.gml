/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//desenha um plano de fundo para a batalha
draw_sprite(battleBackground,0,x,y);

//desenhando as unidades em ordem de profundidade:

//obtendo a unidade com o turno atual através do id da instância na entrada "turno"
var _unidade_com_turno_atual = unidade_turno_ordem[turno].id;
for (var i = 0; i < array_length(unidade_render_ordem); i++)
{
	//vai desenhar primeiro oq ta atrás (elemento mais na frente do array)
	with (unidade_render_ordem[i])
	{
		draw_self();
	}
}

//desenhando o UI
draw_sprite_stretched(sBox,0,x+75,y+120,245,60);
draw_sprite_stretched(sBox,0,x,y+120,74,60);

//constantes para posições
#macro COLUMN_ENEMY 15
#macro COLUMN_NAME 90
#macro COLUMN_HP 160
#macro COLUMN_MP 220

//desenhando o cabeçalho
draw_set_font(fnM3x6);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_gray);
draw_text(x+COLUMN_ENEMY,y+120, "INIMIGO");	
draw_text(x+COLUMN_NAME,y+120, "NOME");
draw_text(x+COLUMN_HP,y+120, "VIDA");
draw_text(x+COLUMN_MP,y+120, "MANA");

//desenhando nome dos inimigos
draw_set_font(fnOpenSansPX);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
var _draw_limite = 3;
var _drawn = 0;

for (var i = 0; (i < array_length(enemyUnidades)) && (_drawn < _draw_limite); i++)
{
	var _char = enemyUnidades[i];
	if (_char.hp > 0)
	{
		_drawn++;
		draw_set_color(c_white);
		if (_char.id == _unidade_com_turno_atual) draw_set_color(c_yellow);
		draw_text(x+COLUMN_ENEMY,y+130+(i*12),_char.name);
	}
}

//desenhando informações da party
for (var i = 0; i < array_length(partyUnidades); i++)
{
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	
	var _char = partyUnidades[i];
	
	if (_char.id == _unidade_com_turno_atual) draw_set_color(c_yellow);
	if (_char.hp <= 0) draw_set_color(c_red);
	//fazendo um ficar embaixo do outro
	draw_text(x+COLUMN_NAME,y+130+(i*12),_char.name);
	draw_set_halign(fa_right);
	
	draw_set_color(c_white);
	if (_char.hp < (_char.hpMax * 0.5)) draw_set_color(c_orange);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_HP+50,y+130+(i*12), string(_char.hp) + "/" + string(_char.hpMax));
	
	draw_set_color(c_white);
	if (_char.mp < (_char.mpMax * 0.5)) draw_set_color(c_orange);
	if (_char.mp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_MP+50,y+130+(i*12),string(_char.mp) + "/" + string(_char.mpMax));
	
	draw_set_color(c_white);
}

//desenha o selecionador de alvo
if (cursor.active)
{
	with (cursor)
	{
		if (active_target != noone)
		{
			if (!is_array(active_target)) //nos diz se estamos no modo all ou não
			{
				draw_sprite(sPointer,0,active_target.x,active_target.y);	
			}
			else
			{
				draw_set_alpha(sin(get_timer()/50000)+1); //isso sifnicia apenas que desaoareceremos entre 0 e 2 alfa a cada meio segundo ou mais (efeito piscante)
				for (var i = 0; i < array_length(active_target); i++)
				{
					draw_sprite(sPointer,0,active_target[i].x,active_target[i].y);
				}
				draw_set_alpha(1.0);
			}
		}
	}
}

//desenhando texto de batalha
if (battle_text != "") //se tiver algo no battle text
{
	var _w = string_width(battle_text)+ 20;
	draw_sprite_stretched(sBox,0,x+160-(_w*0.5),y+5,_w,25);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(x+160,y+10,battle_text);
}