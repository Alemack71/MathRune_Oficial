/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (active)
{
	//controla o menu pela keyboard
	hover += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
	//o selecionar da "uma volta"
	if (hover > array_length(options)-1) hover = 0;
	if (hover < 0) hover = array_length(options)-1;
	
	//executa ação selecionada
	if (keyboard_check_pressed(vk_enter))
	{
		//se a opção tiver mais que uma entrada no array (significando que é mais que apenas um texto)
		//E se a quarta entrada (indice 3) que é o nosso sinalizador "disponivel" for verdadeiro
		if (array_length(options[hover]) > 1) && (options[hover][3] == true)
		{
			//se os 2 for true, queremos saber se a opção selecionada contém uma função
			if (options[hover][1] != 1)
			{
				//atribuímos essa função como _func
				var _func = options[hover][1];
				//e se houver argumentos armazenados para essa função (armazenados no indice 2)
				if (options[hover][2] != -1) script_execute_ext(_func,options[hover][2]); else _func();
				
			}
		}
	}
	
	//volta
	if (keyboard_check_pressed(vk_escape))
	{
		//se tivemos pelo menos um sub_menu_level de profundidade chama a função GoBack e voltamos um nivel	
		if (sub_menu_level > 0) MenuGoBack();
	}
}