/// @desc Menu - faz um menu, opções fornecidas no formulárui [["nome", função, argumento], [...]]
function Menu(_x, _y, _options, _description = -1, _width = undefined, _height = undefined)
{
	//criando a instância do objeto menu (depth -99999 para aparecer em cima de tudo
	with (instance_create_depth(_x, _y,-99999,obj_menu))
	{
		options = _options;
		description = _description;
		//número de opções que temos:
		var _options_count = array_length(_options);
		//quantas opções realmente podem/cabem no menu de uma vez para fins de scrolling
		visible_options_max = _options_count;
		
		//setando o tamanho
		xmargin = 10;
		ymargin = 8;
		//configurando a fonte pois usaremos funções string_width, 
		//dependem da fonte que está sendo definida,
		//para saber qual seria a largura real de uma string se desenhada
		draw_set_font(fnM5x7);
		height_line = 12;
		
		//auto width
		if (_width == undefined)
		{
			width = 1;
			if (description != -1) width = max(width, string_width(_description));
			for (var i = 0; i < _options_count; i++)
			{
				//o nome de cada opção está na primeira entrada de cada array no array de opções
				//por isso o "[0]" depois
				width = max(width, string_width(_options[i][0]));	
			}
			//em seguida adiciona uma margem para obter a largura total da caixa do menu
			width_full = width + xmargin *2;
		} else width_full = _width;
		
		//auto height
		if (_height == undefined)
		{
			height = height_line * (_options_count + (description != -1));
			height_full = height + ymargin * 2;
		}
		else
		{
			height_full = _height;
			//scrollando?
			if (height_line * (_options_count + (description != 1)) > _height - (ymargin * 2))
			{
				scrolling = true;
				visible_options_max = (_height - ymargin * 2) div height_line;
			}
		}
	}
}

function SubMenu(_options)
{
	//armazena nossas opções de menu atuais em um array chamado  dependendo do nível de profundidade em que estamos
	options_above[sub_menu_level] = options
	//em seguida aumentamos esse nível de profundidade
	sub_menu_level++;
	//e trocamos nossas opções de menu pelas opções de submenu
	options = _options;
	//também redefinindo nossa opção atualmente predominada no topo do novo menu
	hover = 0;
}

//função que permiter voltar à arvore de submenus
function MenuGoBack() 
{
	sub_menu_level--
	//troca o array de opções de volta do nosso array option_above 
	options = options_above[sub_menu_level];
	//redefinindo dnv o flutuante
	hover = 0;
}

function MenuSelectAction(_user, _action)
{
	//oculta o menu sem precisar destruí-lo (isso ocorre caso decidir retornar ao menu em vez de se comprometer com um alvo)
	with (obj_menu) active = false;
	
	//ativa o cursor de alvo se precisar, ou simplesmente começa a ação
	with (obj_battle)
	{
		if (_action.target_required)
		{
			with (cursor)
			{
				active = true; //para ativar o cursos
				active_action = _action;
				target_all = _action.target_all;
				if (target_all == MODE.VARIES) target_all = true;
				active_user = _user;
				
				//pra qual lado o alvo deve ir por padrão?
				if (_action.target_enemy_by_default) //mira no inimigo por padrão
				{
					target_index = 0;
					target_side = obj_battle.enemyUnidades;
					active_target = obj_battle.enemyUnidades[target_index]
				}
				else //alvo é si mesmo por padrão
				{
					target_side = obj_battle.partyUnidades;
					active_target = active_user;
					//essa função pega cada entrada ou elemento do array por vez e retornará verdadeiro se corresponder ao user atual
					var _find_self = function(_element)
					{
						return (_element == active_target)	
					}
					//array_find_index retornará o índice do elemento que retorna verdadeiro
					target_index = array_find_index(obj_battle.partyUnidades, _find_self)
					//resumindo: target_index apontará corretamente para qualquer unidade selecionada nesta ação
				}
			}
		}
		else 
		{
			//se não houver necessidade de um alvo para a ação, inicia a ação e encerra o menu
			begin_action(_user,_action,-1);
			with(obj_menu) instance_destroy();
		}
	}
}