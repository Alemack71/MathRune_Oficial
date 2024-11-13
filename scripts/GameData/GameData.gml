//variavel de controle pra definir se o usuário acertou a questão ou não
global.acertou = false;

//variável para salvar a posição do obj_battle para outros objetos separados que precisam estar dentro da batalha usarem de referencial
global.battle_x = 0;
global.battle_y = 0;

#region ações
//action library
global.action_library =
{
	attack :
	{
		name : "Ataque",
		description : "{0} ataca!",
		sub_menu : -1,
		target_required : true,
		target_enemy_by_default : true,
		target_all : MODE.NEVER,
		user_animation : "attack",
		effect_sprite : sAttackBonk,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
			BattleChangeHP(_targets[0], - _damage, 0);
		}
	},
	ice : 
	{
		name : "Gelo",
		description : "{0} conjura gelo!",
		sub_menu : "Magias",
		mp_cost : 4,
		target_required : true,
		target_enemy_by_default : true, //0: party/si mesmo, 1: inimigo
		target_all : MODE.VARIES,
		user_animation : "cast",
		effect_sprite : sAttackIce,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (_user.mp >= mp_cost)
			{	
				for (var i = 0; i < array_length(_targets); i++)
				{
					var _damage = irandom_range(3,6);
					if (array_length(_targets) > 1) _damage = ceil(_damage * 0.75);
					BattleChangeHP(_targets[i], - _damage);
				}
				BattleChangeMP(_user, mp_cost);
			}
		}
	}
}

#endregion

#region operacoes_basicas_1

global.question_library_operacoes_basicas = 
[
	{
		pergunta : "Calcule a expressao:\n",
		alternativas : ["20","17","23","25"],
		alternativa_certa : 1,
		sprites : spr_question_1a, //0 indica que não precisa de sprites
		description : "{0} pergunta!",
		user_animation : "attack",
		effect_sprite : sAttackBonk,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (!global.acertou)
			{
				{
					var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
					BattleChangeHP(_targets[0], - _damage, 0);
				}
			}
		}
	},
	{
		pergunta : "Resolva:\n",
		alternativas : ["5","11","7","13"],
		alternativa_certa : 1,
		sprites : spr_question_1b,
		description : "{0} pergunta!",
		user_animation : "attack",
		effect_sprite : sAttackBonk,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (!global.acertou)
			{
				{
					var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
					BattleChangeHP(_targets[0], - _damage, 0);
				}
			}
		}
	},
	{
		pergunta : "Qual o resultado de\n5^2 + 3^2 ?",
		alternativas : ["25","34","29","18"],
		alternativa_certa : 1,
		sprites : 0,
		description : "{0} pergunta!",
		user_animation : "attack",
		effect_sprite : sAttackBonk,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (!global.acertou)
			{
				{
					var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
					BattleChangeHP(_targets[0], - _damage, 0);
				}
			}
		}
	},
	{
		pergunta : "Calcule a expressao:\n",
		alternativas : ["9","12","13","15"],
		alternativa_certa : 1,
		sprites : spr_question_1d,
		description : "{0} pergunta!",
		user_animation : "attack",
		effect_sprite : sAttackBonk,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (!global.acertou)
			{
				{
					var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
					BattleChangeHP(_targets[0], - _damage, 0);
				}
			}
		}
	},
	{
		pergunta : "Resolva\n",
		alternativas : ["15","18","17","20"],
		alternativa_certa : 3,
		sprites : spr_question_1e,
		description : "{0} pergunta!",
		user_animation : "attack",
		effect_sprite : sAttackBonk,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (!global.acertou)
			{
				{
					var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
					BattleChangeHP(_targets[0], - _damage, 0);
				}
			}
		}
	},
	{
		pergunta : "Qual o resultado de\n 7^2 - 4^2 ?",
		alternativas : ["33","37","45","49"],
		alternativa_certa : 0,
		sprites : 0,
		description : "{0} pergunta!",
		user_animation : "attack",
		effect_sprite : sAttackBonk,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (!global.acertou)
			{
				{
					var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
					BattleChangeHP(_targets[0], - _damage, 0);
				}
			}
		}
	},
	
]

#endregion

#region fatores_e_multiplos

global.fatores_e_multiplos = 
[
	{
		pergunta : "Encontre o MDC de:\n54 e 72",
		alternativas : ["9","6","18","12"],
		alternativa_certa : 2,
		sprites : 0, //0 indica que não precisa de sprites
		description : "{0} pergunta!",
		user_animation : "attack",
		effect_sprite : sAttackBonk,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (!global.acertou)
			{
				{
					var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
					BattleChangeHP(_targets[0], - _damage, 0);
				}
			}
		}
	},
	{
		pergunta : "Determine o MMC de:\n12 e 18",
		alternativas : ["54","36","72","24"],
		alternativa_certa : 1,
		sprites : 0, //0 indica que não precisa de sprites
		description : "{0} pergunta!",
		user_animation : "attack",
		effect_sprite : sAttackBonk,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (!global.acertou)
			{
				{
					var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
					BattleChangeHP(_targets[0], - _damage, 0);
				}
			}
		}
	},
	{
		pergunta : "Fatore (decomponha):\n56",
		alternativas : ["4 x 14","2^2 x 14","2 x 28","2^3 x 7"],
		alternativa_certa : 3,
		sprites : 0, //0 indica que não precisa de sprites
		description : "{0} pergunta!",
		user_animation : "attack",
		effect_sprite : sAttackBonk,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (!global.acertou)
			{
				{
					var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
					BattleChangeHP(_targets[0], - _damage, 0);
				}
			}
		}
	},
	{
		pergunta : "Fatore (decomponha):\n75",
		alternativas : ["3 x 5^2","5 x 15","3^2 x 5","25 x 3"],
		alternativa_certa : 0,
		sprites : 0, //0 indica que não precisa de sprites
		description : "{0} pergunta!",
		user_animation : "attack",
		effect_sprite : sAttackBonk,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (!global.acertou)
			{
				{
					var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
					BattleChangeHP(_targets[0], - _damage, 0);
				}
			}
		}
	},
	{
		pergunta : "Fatore (decomponha):\n120",
		alternativas : ["2 x 3 x 5","2^3 x 3 x 5","2^2 x 3 x 5","3 x 4 x 10"],
		alternativa_certa : 1,
		sprites : 0, //0 indica que não precisa de sprites
		description : "{0} pergunta!",
		user_animation : "attack",
		effect_sprite : sAttackBonk,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (!global.acertou)
			{
				{
					var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
					BattleChangeHP(_targets[0], - _damage, 0);
				}
			}
		}
	},
	{
		pergunta : "Encontre o MDC de:\n48 e 64",
		alternativas : ["8","12","16","24"],
		alternativa_certa : 2,
		sprites : 0, //0 indica que não precisa de sprites
		description : "{0} pergunta!",
		user_animation : "attack",
		effect_sprite : sAttackBonk,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (!global.acertou)
			{
				{
					var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
					BattleChangeHP(_targets[0], - _damage, 0);
				}
			}
		}
	},
	{
		pergunta : "Determine o MMC de:\n15, 10 e 25",
		alternativas : ["75","150","50","100"],
		alternativa_certa : 1,
		sprites : 0, //0 indica que não precisa de sprites
		description : "{0} pergunta!",
		user_animation : "attack",
		effect_sprite : sAttackBonk,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (!global.acertou)
			{
				{
					var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
					BattleChangeHP(_targets[0], - _damage, 0);
				}
			}
		}
	},
]

#endregion

//constantes para valores semi-booleanos
enum MODE
{
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2,
}

//Party data
function InitializeParty() {
    global.party = 
    [
        {
            name: global.name,
            hp: 2,
            hpMax: 20,
            mp: 10,
            mpMax: 15,
            strength: 6,
            sprites : { idle: sPlayerIdle, attack: sPlayerAttack, cast: sPlayerAttack, defend: sPlayerDefend, down: sPlayerDown},
            actions : [global.action_library.attack, global.action_library.ice]
        }
    ];
}

		//{
		//	name: "Carlinhos",
		//	hp: 18,
		//	hpMax: 44,
		//	mp: 20,
		//	mpMax: 30,
		//	strength: 4,
		//	sprites : { idle: sQuestyIdle, attack: sQuestyCast, cast: sQuestyCast, down: sQuestyDown, defend: sQuestyCast},
		//	actions : [global.action_library.attack, global.action_library.ice]
		//}

//Enemy Data
global.enemies =
{
	slimeG: 
	{
		name: "Slime",
		hp: 1,
		hpMax: 7,
		mp: 0,
		mpMax: 0,
		strength: 5,
		sprites: { idle: sSlime, attack: sSlimeAttack},
		actions: global.question_library_operacoes_basicas,
		current_question_index: -1, // Armazena o índice da questão atual
		AIscript : function()
		{
			// Seleciona uma questão aleatória se ainda não houver uma selecionada
			if (current_question_index == -1) {
				current_question_index = irandom(array_length(actions) - 1);
			}

			var _action = actions[current_question_index];

			// Atualiza o índice da próxima questão para o próximo turno
			current_question_index = irandom(array_length(actions) - 1);

			// Seleciona um membro aleatório da party como alvo
			var _possible_targets = array_filter(obj_battle.partyUnidades, function(_unit, _index)
			{
				return (_unit.hp > 0);
			});
			var _target = _possible_targets[irandom(array_length(_possible_targets) - 1)];

			return [_action, _target];
		}
	},
	slimeB: 
	{
		name: "Slime",
		hp: 7,
		hpMax: 7,
		mp: 0,
		mpMax: 0,
		strength: 5,
		sprites: { idle: sSLime_blue, attack: sSlime_blue_Attack},
		actions: global.fatores_e_multiplos,
		current_question_index: -1, // Armazena o índice da questão atual
		AIscript : function()
		{
			// Seleciona uma questão aleatória se ainda não houver uma selecionada
			if (current_question_index == -1) {
				current_question_index = irandom(array_length(actions) - 1);
			}

			var _action = actions[current_question_index];

			// Atualiza o índice da próxima questão para o próximo turno
			current_question_index = irandom(array_length(actions) - 1);

			// Seleciona um membro aleatório da party como alvo
			var _possible_targets = array_filter(obj_battle.partyUnidades, function(_unit, _index)
			{
				return (_unit.hp > 0);
			});
			var _target = _possible_targets[irandom(array_length(_possible_targets) - 1)];

			return [_action, _target];
		}
	},
	bat: 
	{
		name: "Bat",
		hp: 15,
		hpMax: 15,
		mp: 0,
		mpMax: 0,
		strength: 4,
		sprites: { idle: sBat, attack: sBatAttack},
		actions: [],
		xpValue : 18,
		AIscript : function()
		{
			//ataca um membro aleatório da party
			var _action = actions[0];
			//array_filter para filtrar membros da party vivos e mortos, 
			//caso vivo retorna 1, caso o contrário retorna 0
			var _possible_targets = array_filter(obj_battle.partyUnidades, function(_unit, _index)
			{
				//caso a unidade estiver viva ele retorna verdadeiro, 
				//incluindo a unidade na lista de posíveis alvos
				return (_unit.hp > 0);
			});
			var _target = _possible_targets[irandom(array_length(_possible_targets)-1)];
			return [_action, _target];
		}
	}
}




