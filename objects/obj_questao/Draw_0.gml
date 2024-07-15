// Centralizar a sprite da caixa principal (sBox)
var _spr_box_width = 180;
var _spr_box_height = 100;

var _x_centro = (global.battle_x + 158) - (_spr_box_width / 2);
var _y_centro = (global.battle_y + 80) - (_spr_box_height / 2);

draw_sprite_stretched(sBox, 0, _x_centro, _y_centro, _spr_box_width, _spr_box_height);

// Coordenadas base para desenhar a questão e as alternativas dentro da sBox
var question_margin_top = 2;
var alternatives_margin_top = 50;
var margin_horizontal = 5;

var start_x = _x_centro + margin_horizontal;
var start_y = _y_centro + alternatives_margin_top;

var alternative_width = (_spr_box_width - 3 * margin_horizontal) / 2; // Considerando duas colunas
var alternative_height = 20; // Altura da sprite da alternativa

// Desenhar a questão centralizada
var question_x = _x_centro + (_spr_box_width / 2);
var question_y = _y_centro + question_margin_top;
draw_set_font(fnQuest);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(0);
draw_text(question_x, question_y, questao_box);
//question_x = 440
//question_y = 171
if (imagem != 0)
{
	if (imagem != 0) {
	    var image_width = 110;  // Largura desejada para a sprite da imagem
	    var image_height = 33;  // Altura desejada para a sprite da imagem
    
	    // Calcula a posição X da imagem para centralizar com a pergunta
	    var image_x = _x_centro + (_spr_box_width / 2) - (image_width / 2);
    
	    // Calcula a posição Y da imagem fixa entre a pergunta e as alternativas
	    var image_y = question_y + ((start_y - question_y) / 2) - (image_height / 2);
    
	    // Desenha a sprite da imagem
	    draw_sprite_stretched(imagem, 0, image_x, image_y + 7, image_width, image_height);
	}
}

// Matriz para posicionar as alternativas em uma grade 2x2
var positions = [
    [0, 0],
    [1, 0],
    [0, 1],
    [1, 1]
];

for (var i = 0; i < array_length(alternativas_box); i++) {
    var pos = positions[i];
    var alternative_x = start_x + pos[0] * (alternative_width + margin_horizontal); // Espaçamento entre colunas
    var alternative_y = start_y + pos[1] * (alternative_height + margin_horizontal); // Espaçamento entre linhas
    
    // Configurar a cor de mistura (blend) da imagem antes de desenhar
    if (i == alternativa_selecionada) {
        draw_sprite_stretched(sQuest_selected, 0, alternative_x, alternative_y, alternative_width, alternative_height);
    } else {

        draw_sprite_stretched(sQuest, 0, alternative_x, alternative_y, alternative_width, alternative_height);
    }
    
	 // Se a resposta foi revelada, mostrar as alternativas corretas e incorretas
    if (resposta_revelada) {
        if (i == alternativa_certa) {
            draw_sprite_stretched(sQuest_right, 0, alternative_x, alternative_y, alternative_width, alternative_height);
        } else if (i == alternativa_selecionada) {
            draw_sprite_stretched(sQuest_wrong, 0, alternative_x, alternative_y, alternative_width, alternative_height);
        }
    }
	
    // Desenhar o texto da alternativa centralizado
	draw_set_font(fnQuest);
	draw_set_color(c_white);
	draw_set_halign(0)
	draw_set_valign(0)
    draw_text(alternative_x + alternative_width / 2 - string_width(alternativas_box[i]) / 2, 
              alternative_y + alternative_height / 2 - string_height(alternativas_box[i]) / 2,
              alternativas_box[i]);
}
