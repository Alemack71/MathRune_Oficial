//roda a máquina de estado
battle_state();

//controle do cursos
if (cursor.active)
{
	with (cursor)
	{
		//input
		var _key_up = keyboard_check_pressed(vk_up);
		var _key_down = keyboard_check_pressed(vk_down);
		var _key_left = keyboard_check_pressed(vk_left);
		var _key_right = keyboard_check_pressed(vk_right);
		var _key_toggle = false; //utilizado para alternar entre modos de alvo punico e multialvo
		var _key_confirm = false; 
		var _key_cancel = false;
		confirm_delay++ //isso impede de usar a ação com o mesmo clique para selecionar ela
		if (confirm_delay > 1)
		{
			_key_confirm = keyboard_check_pressed(vk_enter);
			_key_cancel = keyboard_check_pressed(vk_escape);
			_key_toggle = keyboard_check_pressed(vk_shift)
		}
		//movimento horizontal ou vertical necessário para o cursor
		var _move_v = _key_down - _key_up; //define as unidades que visamos
		var _move_h = -1;
		
		if (active_action.target_enemy_by_default)
		{
			_move_h = 1;	
		} else
		{
			_move_h = _key_right - _key_left;
		}
		
		if (_move_h == -1) target_side = obj_battle.partyUnidades; //se pressionar para a esquerda terá como alvo os jogadores
		if (_move_h == 1) target_side = obj_battle.enemyUnidades; //se pressionar a direita terá como alvo os inimigos
		
		//verifica lista de alvos
		if (target_side == obj_battle.enemyUnidades)
		{
			//troca o array inimigo unidades em target_side por uma cópia que contém apenas inimigos vivos (não queremos selecionar inimigos mortos, ou seja hp <= 0)
			target_side = array_filter(target_side, function(_element, _index)
			{
				return _element.hp > 0;	
			});
		}
		
		//se move entre alvos
		if (target_all == false) //modo de alvo único
		{
			if (_move_v == 1) target_index++;
			if (_move_v == -1) target_index--;
			
			//indo para o indice zero se ultrapassar o último e vice-versa
			var _targets = array_length(target_side);
			if (target_index < 0) target_index = _targets - 1;
			if (target_index > (_targets -1)) target_index = 0;
			
			//identifica o alvo
			active_target = target_side[target_index];
			
			//muda para o modo all se tivermos pressionado a telca shift e nossa ação permitir fazer isso
			if (active_action.target_all == MODE.VARIES) && (_key_toggle) //alterma para all mode
			{
				target_all = true;	
			}
		}
		else //alvo de modo all
		{
			active_target = target_side; //aponta atual alvo para todo o array
			
			if (active_action.target_all == MODE.VARIES) && (_key_toggle) //alterma para single mode
			{
				target_all = false;	
			}
		}
		
		//confirma a ação
		if (_key_confirm)
		{
			//inicia a ação e fecha o menu, como antes
			with (obj_battle) begin_action(cursor.active_user, cursor.active_action, cursor.active_target);
			with (obj_menu) instance_destroy();
			//deixa o cursor inativo e volta o confirm_delay com valor 0
			active = false;
			confirm_delay = 0;
		}
		
		//cancela a ação e retorna para o menu
		//confere também se não ta pressionado o botão de confirmar, apenas para evitar que ambos sejam disparados ao mesmo tempo
		if (_key_cancel) && (!_key_confirm)
		{
			with (obj_menu) active = true;
			active = false;
			confirm_delay = 0;
		}
			
	}
}

//show_debug_message(string(alarm[0]));