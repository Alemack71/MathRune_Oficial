//variavel de controle pra definir se o usuário acertou a questão ou não
global.acertou = false;

//variável para salvar a posição do obj_battle para outros objetos separados que precisam estar dentro da batalha usarem de referencial
global.battle_x = 0;
global.battle_y = 0;

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
					var _damage = irandom_range(10,15);
					if (array_length(_targets) > 1) _damage = ceil(_damage * 0.75);
					BattleChangeHP(_targets[i], - _damage);
				}
				BattleChangeMP(_user, mp_cost);
			}
		}
	}
}


global.question_library_operacoes_basicas = 
[
	{
		pergunta : "Calcule a expressão:\n8 + 3 × (10−4) ÷ 2.",
		alternativas : ["20","17","23","25"],
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
		pergunta : "Resolva:\n",
		alternativas : ["5","11","7","13"],
		alternativa_certa : 2,
		sprites : spr_question_1a,
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
		pergunta : "Qual é o resultado de\n",
		alternativas : ["25","34","29","18"],
		alternativa_certa : 1,
		sprites : spr_question_1a,
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
            hp: 10,
            hpMax: 89,
            mp: 10,
            mpMax: 15,
            strength: 6,
            sprites : { idle: sLuluIdle, attack: sLuluAttack, cast: sLuluAttack, defend: sLuluDefend, down: sLuluDown},
            actions : [global.action_library.attack, global.action_library.ice]
        },
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
    ];
}

//Enemy Data
global.enemies =
{
	slimeG: 
	{
		name: "Slime",
		hp: 10,
		hpMax: 30,
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
	}
	,
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




