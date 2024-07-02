/// @description desenhando o menu

draw_sprite_stretched(sBox, 0, x, y, width_full, height_full);
draw_set_color(c_white);
draw_set_font(fnM5x7);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//armazena em _desc para saber se há uma descrição para desenhar
var _desc = (description != -1);
//sistema de scroll do menu: isso nos da quantas opções alem do "fundo" teórico do menu estamos
var _scroll_push = max(0, hover - (visible_options_max -1));

//esse loop pode signficar que vamos além do numero de opções que temos dependendo do tamanho da caixa
for (l = 0; l < (visible_options_max + _desc); l++)
{
	//então primeiramente verificaremos se l é maior ou igual ao número de opções, se for true, encerra o loop
	if (l >= array_length(options)) break;
	draw_set_color(c_white);
	
	if (l == 0 && (_desc))
	{
		//nós desenhamos isso em nosso x e y + nossa margem
		draw_text(x + xmargin, y + ymargin, description);
	}
	else
	{
		//caso contrário teremos a opção que queremos mostrar qual é o nosso l atual menos se houve ou não uma descrição + nosso valor do scroll_push
		var _options_to_show = l - _desc + _scroll_push;
		//_str será a string desenhada que obtemos do nosso array de opções, escolhendo a entrada usando _options_to_show e obtendo seu nome no indice 0
		var _str = options[_options_to_show][0];
		//se tivermos essa opção destacada nós a destacamos com amarelo brilhoso
		if (hover == _options_to_show - _desc)
		{
			draw_set_color(c_yellow);
			//por isso precisamos atualizar a cor para branco em cada volta no loop (se n td fica amarelo)
		}
		//se a opção n tiver disponivel no momento, conforme armazenado no indice 3 do seu array definimos a cor como cinza
		if (options[_options_to_show][3] == false) draw_set_color(c_gray);
		//então finalmente desenhamos a string
		draw_text(x + xmargin, y + ymargin + l * height_line, _str);
	}
}

draw_sprite(sPointer, 0, x + xmargin + 8, y + ymargin + ((hover - _scroll_push) * height_line) + 7);
//se não estivermos mostrando todas as opções de uma vez e o usuário conseguir rolar, é bom avisar isso com uma seta pra baixo
//se as opções visiveis forem menor que o numero de opções e o hover não estiver na opção inferior
if (visible_options_max < array_length(options)) && (hover < array_length(options)-1)
{
	//mostrando uma seta em baixo mostrando q tem mais opções
	draw_sprite(sDownArrow, 0, x + width_full * 0.5, y + height_full - 7);
}