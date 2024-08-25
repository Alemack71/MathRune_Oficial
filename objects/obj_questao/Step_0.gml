/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _key_up = keyboard_check_pressed(vk_up);
var _key_down = keyboard_check_pressed(vk_down);
var _key_left = keyboard_check_pressed(vk_left);
var _key_right = keyboard_check_pressed(vk_right);
var _fps = game_get_speed(gamespeed_fps);
var _key_cancel = false;

delay++ //isso impede de usar a ação com o mesmo clique para selecionar ela

var _clicou = false

if (delay > 2)
{
	_key_confirm = keyboard_check_pressed(vk_enter);
}

if (_key_confirm) _clicou = true;

if (_key_up) {
    if (alternativa_selecionada > 1) {
        alternativa_selecionada -= 2;
    }
}

if (_key_down) {
    if (alternativa_selecionada < array_length(alternativas_box) - 2) {
        alternativa_selecionada += 2;
    }
}

if (_key_left) {
    if (alternativa_selecionada % 2 != 0) {
        alternativa_selecionada -= 1;
    }
}

if (_key_right) {
    if (alternativa_selecionada % 2 == 0 && alternativa_selecionada < array_length(alternativas_box) - 1) {
        alternativa_selecionada += 1;
    }
}

// Verifica se o usuário confirma a escolha

if (_key_confirm && !resposta_revelada or time <= 0) 
{
	if (alternativa_selecionada == alternativa_certa)
	{
		global.acertou = true;
	} else if (alternativa_selecionada != alternativa_certa)
	{
		global.acertou = false;
	}
	resposta_revelada = true;
	alarm[0] = 120

} else

if (!resposta_revelada)
{
	time -= (_fps/300);
} else {
	time -= 0;
}
	
if (time <= 0) 
{
	global.acertou = false;
	instance_destroy();
}


show_debug_message(time)

