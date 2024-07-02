/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//ira travar todas as instâncias presentes no jogo menos ela mesmo, 
//ou seja, apenas ela vai estar rodando
instance_deactivate_all(true);

global.battle_x = x;
global.battle_y = y;

unidades = [];
turno = 0;
unidade_turno_ordem = [];
unidade_render_ordem = [];

turn_count = 0;
round_count = 0;
battle_wait_time_frames = 90;
battle_wait_time_remaining = 0;
battle_text = "";
current_user = noone;
current_action = -1;
current_targets = noone;

waiting_for_idle = false;
delay_frames = 30;

//fazendo um cursor de alvo
cursor =
{
	active_user : noone,
	active_target : noone,
	active_action : -1,
	target_side : -1,
	target_index : 0,
	target_all : false,
	confirm_delay : 0,
	active : false
}

//criando os inimigos:
for (var i = 0; i < array_length(enemies); i++) 
{
	enemyUnidades[i] = instance_create_depth(x+250+(i*10), y+68+(i*20), depth-10, obj_battle_unit_enemy, enemies[i]);
	
	//empura especificada unidade de inimigo para o final do array "unidades"
	array_push(unidades, enemyUnidades[i]);
}

//criando as unidades da party
for (var i = 0; i < array_length(global.party); i++)
{
	partyUnidades[i] = instance_create_depth(x+70-(i*10), y+68+(i*15), depth-10, obj_battle_unit_pc, global.party[i]);
	
	//empura especificada unidade da party para o final do array "unidades"
	array_push(unidades, partyUnidades[i]);
}

//embaralha a ordem do turno
unidade_turno_ordem = array_shuffle(unidades);

//adquirindo ordem de renderização
atualizar_render_ordem = function ()
{
	unidade_render_ordem = [];
	array_copy(unidade_render_ordem,0,unidades,0,array_length(unidades));
	//coloca em ordem no array os elementos mais "longe" da tela (menor y)
	//se 2 for maior que 1, 1 fica na frente no array 
	array_sort(unidade_render_ordem, function(_1, _2)
	{
		return _1.y - _2.y;	
	});
}

//chamando a função renderização que acabamos de criar
atualizar_render_ordem();

//criando a máquina de estado para os turnos:

//criação de menus para o jogador ou para deixar a IA escolher uma ação
function battle_state_select_action()
{
	//verifica se o objeto menu existe, porque se ele existir, estaremos aguardando a entrada do player antes de continuar
	if (!instance_exists(obj_menu))
	{
		//pega a unidade atual
		var _unit = unidade_turno_ordem[turno];
	
		//a unidade está viva ou capaz de agir?
		if (!instance_exists(_unit)) || (_unit.hp <= 0)
		{
			battle_state = battle_state_victory_check;
			exit;
		}
	
		//selecionando uma ação para executar
		//função comentada pois apenas faz o personagem se bater:
		//begin_action(_unit.id, global.action_library.attack, _unit.id);
	
		//verificando se é a vez de um personagem controlável
		if (_unit.object_index == obj_battle_unit_pc)
		{
			//pegando todos os dados necessários para a ação de menu
			var _menu_options = [];
			var _sub_menus = {};
			
			//obtendo lista de ações
			var _action_list = _unit.actions
			
			for (var i = 0; i < array_length(_action_list); i++)
			{
				var _action = _action_list[i];	
				var _available = true; //mais tarde vamos checar custo de mana aqui
				var _name_and_count = _action.name; //mais tarde vamos modificar o nome para incluir a contagem de itens (se a ação for um item)
				
				//se a ação tiver um submenu de -1 quer dizer q é ação de nível superior, como ataque (n precisa clicar mais de 1 vez pra performar)
				if (_action.sub_menu == -1)
				{
					//essa função apenas iniciará a ação que passamos por enquanto
					array_push(_menu_options, [_name_and_count, MenuSelectAction, [_unit, _action], _available]);
				}
				else
				{
					//cria um submenu ou adiciona a um submenu criado anteriormente:
					
					//esse "$" nos permite procurar uma entrada de estrutura com uma string, em vez de diretamente
					if (is_undefined(_sub_menus[$ _action.sub_menu]))
					{
						//caso não exista um submenu com este nome iremos criá-lo com essa função 
						variable_struct_set(_sub_menus, _action.sub_menu, [[_name_and_count, MenuSelectAction, [_unit, _action], _available]]);
					}
					else //se o submenu já existir
					{
						array_push(_sub_menus[$ _action.sub_menu], [_name_and_count, MenuSelectAction, [_unit, _action], _available]);
					}
				}
				
			}
			
			//converter a estruct de submenu em um array e adicionar seu conteúdo ao nosso menu de nível superior
			//isso cria uma matriz contendo os nomes de cada membro da struct
			var _sub_menus_array = variable_struct_get_names(_sub_menus);
			for (var i = 0; i < array_length(_sub_menus_array); i++)
			{
				//organiza submenu caso precise aqui
					
				//adiciona a opção de voltar ao final de cada submenu além da tecla Esc
				array_push(_sub_menus[$ _sub_menus_array[i]], ["Voltar", MenuGoBack, -1, true]);
				//em seguida apenas adicionamos o próprio submenu ao nosso menu de nível superior
				array_push(_menu_options, [_sub_menus_array[i], SubMenu, [_sub_menus[$ _sub_menus_array[i]]], true]);
			}
			
			Menu(x+10, y+110, _menu_options, , 74, 60);
		}
		else
		{
			//se a unit é uma IA
		    // se a unit é uma IA
			var _enemy_action = _unit.AIscript();
			if (_enemy_action != -1) 
			{
				begin_action(_unit.id, _enemy_action[0], _enemy_action[1]);
				var question_data = _enemy_action[0]; // Ajustar para pegar a ação correta que é uma struct
				instance_create_depth(x, y, -999999, obj_questao, question_data);
			}
		}
	}
}

//estado para iniciar a ação selecionada
function begin_action(_user, _action, _targets)
{
	current_user = _user;
	current_action = _action;
	current_targets = _targets;
	battle_text = string_ext(_action.description, [_user.name]); //essa função permite passar um array de outras strings além de uma string
	if (!is_array(current_targets)) current_targets = [current_targets];
	battle_wait_time_remaining = battle_wait_time_frames;
	
	if (_user.object_index != obj_battle_unit_pc) 
    {
        // Pausa a ação do inimigo até a questão ser respondida
        battle_state = battle_state_wait_for_answer;
    }
	else
	{
		with (_user)
		{
			//informa ao estado de ação de execução que ainda estamos no meio de uma animação
			acting = true;
			//roda a animação do user se está definido para aquela ação, e para aquele user
			if (!is_undefined(_action[$ "user_animation"])) && (!is_undefined(_user.sprites[$ _action.user_animation]))
			{
				sprite_index = sprites[$ _action.user_animation];
				image_index = 0;
			}
		}
		battle_state = battle_state_perform_action;
	}
}

function battle_state_wait_for_answer()
{
    if (!instance_exists(obj_questao))
    {
        if (global.acertou)
        {
            // Jogador acertou, exibe defesa
            battle_text = string_ext("{0} defendeu!", [current_targets[0].name]);
            with (current_targets[0])
            {
                sprite_index = sprites.defend;
                image_index = 0;
            }
			 with (current_user)
            {
                sprite_index = sprites.attack;
                image_index = 0;
                acting = true;
            }
        }
        else
        {
            // Jogador errou, exibe ataque do inimigo
            battle_text = string_ext("{0} atacou!", [current_user.name]);
            with (current_user)
            {
                sprite_index = sprites.attack;
                image_index = 0;
                acting = true;
            }
        }

        // Independente de acertar ou errar, realiza o ataque
        battle_state = battle_state_perform_action;
        battle_wait_time_remaining = battle_wait_time_frames; // Adiciona um delay antes do ataque

        // Resetar o estado para próximo turno
    }
}

//estado para reproduzir animações, sons, e outros efeitos de nossa ação
function battle_state_perform_action()
{
    // Se a animação ainda está rodando
    if (current_user.acting)
    {
        // Quando isso acaba, executa o efeito da ação se existir
        if (current_user.image_index >= current_user.image_number - 1)
        {
            with(current_user)
            {
                sprite_index = sprites.idle;
                image_index = 0;
                acting = false;
            }

            if (variable_struct_exists(current_action, "effect_sprite"))
            {
                if ((current_action.effect_on_target == MODE.ALWAYS) || ((current_action.effect_on_target == MODE.VARIES) && (array_length(current_targets) <= 1)))
                {
                    for (var i = 0; i < array_length(current_targets); i++)
                    {
                        instance_create_depth(current_targets[i].x, current_targets[i].y, current_targets[i].depth - 1, obj_battle_effect, {sprite_index : current_action.effect_sprite});
                    }
                }
                else // Roda isso em 0,0
                {
                    var _effect_sprite = current_action.effect_sprite;
                    if (variable_struct_exists(current_action, "effect_sprite_on_target")) _effect_sprite = current_action.effect_sprite_on_target;
                    instance_create_depth(x, y, depth - 100, obj_battle_effect, {sprite_index : _effect_sprite});
                }
            }

            current_action.func(current_user, current_targets);

            // Verifica se os targets são inimigos
            if (current_user.object_index == obj_battle_unit_enemy)
            {
                // Ativa o delay antes de voltar ao estado idle
                waiting_for_idle = true;
                delay_frames = 30; // Defina o número de frames de delay aqui
            }
        }
    }
    else // Espera pelo delay e então acaba o turno
    {
        if (waiting_for_idle)
        {
            delay_frames--;
            if (delay_frames <= 0)
            {
                waiting_for_idle = false;

                // Agora pode voltar os targets ao estado idle
                for (var i = 0; i < array_length(current_targets); i++)
                {
                    var _target = current_targets[i];
                    if (_target.object_index == obj_battle_unit_pc)
                    {
                        with (_target)
                        {
                            sprite_index = sprites.idle;
                            image_index = 0;
                        }
                    }
                }
            }
        }

        if (!instance_exists(obj_battle_effect))    
        {
            battle_wait_time_remaining--;
            if (battle_wait_time_remaining == 0)
            {
                battle_wait_time_remaining = battle_wait_time_frames;
                battle_state = battle_state_victory_check;    
            }
        }
    }    
}

//checa se a batalha deve terminar ou prosseguir depois da ação
function battle_state_victory_check()
{
	//verifica se todos os inimigos estão derrotados
	var _enemies_dead = AllDead(enemyUnidades);
	//verifica se todos os aliados foram derrotados
	var _party_dead = AllDead(partyUnidades);
	
	 if (_enemies_dead) {
        //A favela venceu
        battle_text = "Vitoria!";
        // Aqui você pode adicionar lógica adicional para o que acontece em caso de vitória
    
	    // Desativa o objeto de batalha
		battle_wait_time_remaining--
		if (battle_wait_time_remaining == 0)
		{
			// Atualiza o HP global
			AtualizarHpGlobal();
		
			inst_8AA9384.ativar = true;
			instance_activate_object(obj_reativar);
			instance_destroy();
		}
		exit;
     } else if (_party_dead)
	 {
		//A party perdeu
		battle_text = "Derrota!";
		
		battle_wait_time_remaining--
		if (battle_wait_time_remaining == 0)
		{
			room_goto(rm_derrota);
		}
		exit;
	 }
	
	battle_state = battle_state_turn_progression;
}

//estado para caso a batalha não terminar após a ação, 
//para decidir quem deve ser o próximo e, em seguida, repetir todo o caminho para selecionar uma ação
function battle_state_turn_progression()
{
	turn_count++;
	turno++;
	//loop no turno
	if (turno > array_length(unidade_turno_ordem) - 1)
	{
		turno = 0;
		round_count++;
	}
	battle_state = battle_state_select_action;
}

//nosso objeto de batalha vai chamar qualquer função que esteja atualmente em battle_state em cada frame
battle_state = battle_state_select_action;