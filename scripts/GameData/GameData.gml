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
		name : "Atacar",
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
	},
	fire : 
	{
		name : "Fogo",
		description : "{0} conjura fogo!",
		sub_menu : "Magias",
		mp_cost : 6,
		target_required : true,
		target_enemy_by_default : true, //0: party/si mesmo, 1: inimigo
		target_all : MODE.VARIES,
		user_animation : "cast",
		effect_sprite : sAttackFire,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (_user.mp >= mp_cost)
			{	
				for (var i = 0; i < array_length(_targets); i++)
				{
					var _damage = irandom_range(5,7);
					if (array_length(_targets) > 1) _damage = ceil(_damage * 0.75);
					BattleChangeHP(_targets[i], - _damage);
				}
				BattleChangeMP(_user, mp_cost);
			}
		}
	},
	escape :
	{
		name : "Certeza?",
		description : "{0} escapa!",
		sub_menu : "Escapar",
		target_required : false,
		target_enemy_by_default : false,
		target_all : MODE.NEVER,
		delay_frames: 30, // Define o número de frames de delay
		func : function()
		{
			global.ativar = true;
			global.escapou = true;
			instance_activate_object(obj_reativar);
			instance_destroy(obj_battle);
		}
	},
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
	{
		pergunta : "Determine o MMC de:\n8 e 12",
		alternativas : ["12","36","24","48"],
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
		pergunta : "Determine o MMC de:\n15 e 20",
		alternativas : ["60","30","75","90"],
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
		pergunta : "Determine o MMC de:\n6, 9 e 15",
		alternativas : ["24","30","36","90"],
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
		pergunta : "Determine o MMC de:\n4, 8 e 12",
		alternativas : ["16","12","24","48"],
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
		pergunta : "Determine o MMC de:\n10, 25 e 30",
		alternativas : ["100","75","200","150"],
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
		pergunta : "Fatore (decomponha):\n60",
		alternativas : ["2^2 x 3 x 5","2 x 3 x 10","2 x 5 x 6","2^3 x 5"],
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
		pergunta : "Fatore (decomponha):\n36",
		alternativas : ["2 x 3^2","2^2 x 3^2","2^3 x 3","2^2 x 3"],
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

#region potenciacao

global.potenciacao = 
[
	{
		pergunta : "Calcule:\n7^2",
		alternativas : ["14","28","64","49"],
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
		pergunta : "Calcule:\n",
		alternativas : ["49","-49","14","-14"],
		alternativa_certa : 0,
		sprites : spr_question_3b, //0 indica que não precisa de sprites
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
		pergunta : "Calcule:\n-7^2",
		alternativas : ["49","-49","-14","14"],
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
		pergunta : "Calcule:\n",
		alternativas : ["0,04","0,2","0,16","0,08"],
		alternativa_certa : 2,
		sprites : spr_question_3d, //0 indica que não precisa de sprites
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
		pergunta : "Calcule:\n2^3 x 2^4",
		alternativas : ["32","128","64","256"],
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
		pergunta : "Calcule:\n",
		alternativas : ["9","27","81","243"],
		alternativa_certa : 0,
		sprites : spr_question_3f, //0 indica que não precisa de sprites
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
		pergunta : "Calcule:\n",
		alternativas : ["729","64","512","128"],
		alternativa_certa : 2,
		sprites : spr_question_3g, //0 indica que não precisa de sprites
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
		pergunta : "Calcule:\n2^4",
		alternativas : ["8","16","32","4"],
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
		pergunta : "Calcule:\n",
		alternativas : ["1/2","4","2","1/4"],
		alternativa_certa : 3,
		sprites : spr_question_3i, //0 indica que não precisa de sprites
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
		pergunta : "Calcule:\n",
		alternativas : ["16","8","4","2"],
		alternativa_certa : 2,
		sprites : spr_question_3j, //0 indica que não precisa de sprites
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
		pergunta : "Calcule:\n",
		alternativas : ["3","9","1","27"],
		alternativa_certa : 0,
		sprites : spr_question_3k, //0 indica que não precisa de sprites
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
		pergunta : "Calcule:\n",
		alternativas : ["1/16","1/81","1/27","81"],
		alternativa_certa : 1,
		sprites : spr_question_3l, //0 indica que não precisa de sprites
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
		pergunta : "Calcule:\n",
		alternativas : ["-26","-20","-25","-24"],
		alternativa_certa : 0,
		sprites : spr_question_3m, //0 indica que não precisa de sprites
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
		pergunta : "Calcule:\n",
		alternativas : ["12500","6250","78125","15625"],
		alternativa_certa : 3,
		sprites : spr_question_3n, //0 indica que não precisa de sprites
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

#region radiciacao

global.radiciacao =
[
	{
		pergunta : "Calcule o radical:\n",
		alternativas : ["2","4","8","18"],
		alternativa_certa : 1,
		sprites : spr_question_4a, //0 indica que não precisa de sprites
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
		pergunta : "Calcule o radical:\n",
		alternativas : ["3","9","-3","-9"],
		alternativa_certa : 2,
		sprites : spr_question_4b, //0 indica que não precisa de sprites
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
		pergunta : "Calcule o radical:\n",
		alternativas : ["5","1","0","-1"],
		alternativa_certa : 2,
		sprites : spr_question_4c, //0 indica que não precisa de sprites
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
		pergunta : "Calcule o radical:\n",
		alternativas : ["64","4","8","16"],
		alternativa_certa : 3,
		sprites : spr_question_4d, //0 indica que não precisa de sprites
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
		pergunta : "Resolva a operacao:\n",
		alternativas : ["3","12","2","6"],
		alternativa_certa : 3,
		sprites : spr_question_4e, //0 indica que não precisa de sprites
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
		pergunta : "Resolva a operacao:\n",
		alternativas : ["4","16","2","8"],
		alternativa_certa : 0,
		sprites : spr_question_4f, //0 indica que não precisa de sprites
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
		pergunta : "Resolva a operacao:\n",
		alternativas : ["1/4","1/2","3/4","3/2"],
		alternativa_certa : 2,
		sprites : spr_question_4g, //0 indica que não precisa de sprites
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
		pergunta : "Calcule o radical:\n",
		alternativas : ["15","5","25","10"],
		alternativa_certa : 1,
		sprites : spr_question_4h, //0 indica que não precisa de sprites
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
		pergunta : "Resolva a operacao:\n",
		alternativas : ["2","4","6","8"],
		alternativa_certa : 0,
		sprites : spr_question_4i, //0 indica que não precisa de sprites
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
		pergunta : "Calcule o radical:\n",
		alternativas : ["5/2","1/2","4/5","2/5"],
		alternativa_certa : 3,
		sprites : spr_question_4j, //0 indica que não precisa de sprites
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
		pergunta : "Resolva a operacao:\n",
		alternativas : ["6","3","4","8"],
		alternativa_certa : 2,
		sprites : spr_question_4k, //0 indica que não precisa de sprites
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
		pergunta : "Resolva a operacao:\n",
		alternativas : ["9","-6","-3","6"],
		alternativa_certa : 1,
		sprites : spr_question_4l, //0 indica que não precisa de sprites
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
		pergunta : "Racionalize a fracao:\n",
		alternativas : ["1","2","3","0"],
		alternativa_certa : 0,
		sprites : spr_question_4m, //0 indica que não precisa de sprites
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
		pergunta : "Racionalize a fracao:\n",
		alternativas : ["1","2","4","0,5"],
		alternativa_certa : 1,
		sprites : spr_question_4n, //0 indica que não precisa de sprites
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

#region slime_king

global.question_slime_king =
[
	{
		pergunta : "Calcule a expressao:\n",
		alternativas : ["65","77","88","95"],
		alternativa_certa : 3,
		sprites : spr_question_5a, //0 indica que não precisa de sprites
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
		pergunta : "Encontre o menor\nmultiplo de 12\nque satisfaca:\n",
		alternativas : ["36","48","60","72"],
		alternativa_certa : 0,
		sprites : spr_question_5b, //0 indica que não precisa de sprites
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
		pergunta : "Fatore 72 e calcule:\n2^3 x produto dos\nfatores restantes\n",
		alternativas : ["144","216","288","180"],
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
		pergunta : "Resolva a expressao\n",
		alternativas : ["12","14","16","18"],
		alternativa_certa : 1,
		sprites : spr_question_5d, //0 indica que não precisa de sprites
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
		pergunta : "Determine o MDC de 48 e 60\ne use-o para resolver:\n",
		alternativas : ["33","36","30","27"],
		alternativa_certa : 0,
		sprites : spr_question_5e, //0 indica que não precisa de sprites
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

#region equacao_1_grau

global.equacao_1 =
[
	{
		pergunta : "Resolva a equacao:\nx + 7 = 14",
		alternativas : ["x = 7","x = 6","x = 8","x = 5"],
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
		pergunta : "Resolva a equacao:\n3x -2 = 16",
		alternativas : ["x = 4","x = 6","x = 8","x = 5"],
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
		pergunta : "Resolva a equacao:\n5x + 8 = 3x + 20",
		alternativas : ["x = 4","x = 5","x = 8","x = 6"],
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
		pergunta : "Resolva a equacao:\n",
		alternativas : ["x = 10","x = 12","x = 14","x = 8"],
		alternativa_certa : 1,
		sprites : spr_question_6d, //0 indica que não precisa de sprites
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
		pergunta : "Resolva a equacao:\n7x + 5 = 9x - 11",
		alternativas : ["x = 6","x = 7","x = 8","x = 5"],
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
		pergunta : "Resolva a equacao:\n10x -4 = 4x + 14",
		alternativas : ["x = 3","x = 4","x = 5","x = 6"],
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
		pergunta : "Resolva a equacao:\n",
		alternativas : ["x = 8","x = 9","x = 10","x = 12"],
		alternativa_certa : 2,
		sprites : spr_question_6g, //0 indica que não precisa de sprites
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
		pergunta : "Resolva a equacao:\n",
		alternativas : ["x = 6","x = 8","x = 10","x = 4"],
		alternativa_certa : 1,
		sprites : spr_question_6h, //0 indica que não precisa de sprites
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
		pergunta : "Resolva a equacao:\n6x - 8 = 4 - 2x",
		alternativas : ["x = 5/2","x = 2","x = 3/2","x = 1"],
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
		pergunta : "Resolva a equacao:\n2x + 3 = 5x - 6",
		alternativas : ["x = 3","x = 4","x = 5","x = 2"],
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
		pergunta : "Resolva a equacao:\n",
		alternativas : ["x = 3","x = 5","x = 4","x = 2"],
		alternativa_certa : 2,
		sprites : spr_question_6k, //0 indica que não precisa de sprites
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
		pergunta : "Resolva a equacao:\n5x - 7 + x = 13",
		alternativas : ["x = 10/3","x = 4","x = 5","x = 9/2"],
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
		pergunta : "Resolva a equacao:\n3 + 7x = 18 + 2x",
		alternativas : ["x = 4","x = 3","x = 5","x = 6"],
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
		pergunta : "Resolva a equacao:\n8x - 4 = 6x + 12",
		alternativas : ["x = 6","x = 10","x = 8","x = 5"],
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
]

#endregion

#region sistemas

global.sistemas_equacao_1 =
[
	{
		pergunta : "Resolva o sistema:\n",
		alternativas : ["x = 3, y = 4","x = 4, y = 2","x = 5, y = 1","x = 2, y = 6"],
		alternativa_certa : 1,
		sprites : spr_question_7a, //0 indica que não precisa de sprites
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
		pergunta : "Resolva o sistema:\n",
		alternativas : ["x = 5, y = 7","x = 6, y = 6","x = 4, y = 8","x = 7, y = 5"],
		alternativa_certa : 1,
		sprites : spr_question_7b, //0 indica que não precisa de sprites
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
		pergunta : "Resolva o sistema:\n",
		alternativas : ["x = 4, y = 3","x = 3, y = 2","x = 4, y = 1","x = 5, y = 2"],
		alternativa_certa : 2,
		sprites : spr_question_7c, //0 indica que não precisa de sprites
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
		pergunta : "Resolva o sistema:\n",
		alternativas : ["x = 6, y = 5","x = 8, y = 3","x = 9, y = 2","x = 7, y = 4"],
		alternativa_certa : 3,
		sprites : spr_question_7d, //0 indica que não precisa de sprites
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
		pergunta : "Resolva o sistema:\n",
		alternativas : ["x = 3, y = 1","x = 2, y = 1","x = 4, y = 1","x = 0, y = 3"],
		alternativa_certa : 0,
		sprites : spr_question_7e, //0 indica que não precisa de sprites
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
		pergunta : "Resolva o sistema:\n",
		alternativas : ["x = 8, y = -4","x = -4, y = -2","x = -2, y = -4","x = 4, y = 2"],
		alternativa_certa : 1,
		sprites : spr_question_7f, //0 indica que não precisa de sprites
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
		pergunta : "Resolva o sistema:\n",
		alternativas : ["x = 8, y = -4","x = -3, y = -4","x = -2, y = -4","x = 4, y = 2"],
		alternativa_certa : 1,
		sprites : spr_question_7g, //0 indica que não precisa de sprites
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
		pergunta : "O $ de uma camiseta e\n2x o $ de um bone. Juntos, os 2\nCustam 90, qual o $ da camisa?",
		alternativas : ["60","70","40","50"],
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
		pergunta : "Um doce custa 10$ a mais\nque 1 bala. 1 doce e 2 balas\nvalem 70$. Quanto custa o doce?",
		alternativas : ["20","30","25","35"],
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
		pergunta : "x + y = 14\nO dobro de x menos y e 16\nOs valores de x e y sao:",
		alternativas : ["x = 10, y = 4","x = 8, y = 6","x = 12, y = 2","x = 9, y = 5"],
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
]

#endregion

#region produtos_notaveis

global.produtos_notaveis =
[
	{
		pergunta : "Qual o resultado de:\n",
		alternativas : ["x^2 +4x +4","x^2 +4x +2","x^2 +2x +4","x^2 +2x +2"],
		alternativa_certa : 0,
		sprites : spr_question_8a, //0 indica que não precisa de sprites
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
		pergunta : "Qual o resultado de:\n",
		alternativas : ["9x^2 +30x +25","9x^2 +20x +25","9x^2 +30x +5","3x^2 +30x +25"],
		alternativa_certa : 0,
		sprites : spr_question_8b, //0 indica que não precisa de sprites
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
		pergunta : "Qual o resultado de:\n",
		alternativas : ["x^2 +4y +8y^2","x^2 +4xy +16y^2","x^2 +8xy +4y^2","x^2 +8xy +16y^2"],
		alternativa_certa : 3,
		sprites : spr_question_8c, //0 indica que não precisa de sprites
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
		pergunta : "Calcule o valor de:\n",
		alternativas : ["a^2 -8a +4","a^2 -16a +4","a^2 -8a +16","a^2 -4a +16"],
		alternativa_certa : 2,
		sprites : spr_question_8e, //0 indica que não precisa de sprites
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
		pergunta : "Qual o resultado de:\n",
		alternativas : ["x^2 -5x +25","x^2 -10x +25","x^2 -25x +10","x^2 -25x +25"],
		alternativa_certa : 1,
		sprites : spr_question_8f, //0 indica que não precisa de sprites
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
		pergunta : "Calcule o valor de:\n",
		alternativas : ["9a^2 -6ab +b^2","9a^2 -3ab +b^2","9a^2 -9ab +b^2","9a^2 -6ab +b"],
		alternativa_certa : 0,
		sprites : spr_question_8g, //0 indica que não precisa de sprites
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
		pergunta : "Calcule o valor de:\n",
		alternativas : ["x^2 -49","x^2 +14x +49","x^2 -14x -49","x^2 -14x +49"],
		alternativa_certa : 0,
		sprites : spr_question_8h, //0 indica que não precisa de sprites
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
		alternativas : ["25a^2 +15b^2","25a^2 -6b^2","25a^2 -9b^2","25a^2 -3b^2"],
		alternativa_certa : 2,
		sprites : spr_question_8i, //0 indica que não precisa de sprites
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
		pergunta : "Calcule o valor de:\n",
		alternativas : ["x^2 +8x -16","x^2 -8x -16","x^2 +8x +16","x^2 -16"],
		alternativa_certa : 3,
		sprites : spr_question_8j, //0 indica que não precisa de sprites
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

#region equacao_2_grau

global.equacao_2 =
[
	{
		pergunta : "Resolva a equacao:\nx^2 - 5x + 6 = 0",
		alternativas : ["S = {-2,-3}","S = {3,2}","S = {-6,1}","S = {1,6}"],
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
		pergunta : "Resolva a equacao:\nx^2 + 7x + 10 = 0",
		alternativas : ["S = {5,-2}","S = {-2,-3}","S = {-5,-2}","S = {2,-7}"],
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
		pergunta : "Determine as raizes da equacao:\nx^2 - 4x - 12 = 0",
		alternativas : ["S = {6,-2}","S = {-6,2}","S = {3,-4}","S = {-3,4}"],
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
		pergunta : "Encontre S para:\nx^2 + x - 6 = 0",
		alternativas : ["S = {3,-2}","S = {-3,2}","S = {1,-6}","S = {-1,-6}"],
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
		pergunta : "Resolva:\n2x^2 - 8x = 0",
		alternativas : ["S = {-2,-4}","S = {0,-4}","S = {4,-2}","S = {0,4}"],
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
		pergunta : "Resolva:\nx^2 - 9 = 0",
		alternativas : ["S = {-3,3}","S = {0,3}","S = {6,-3}","S = {0,-3}"],
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
		pergunta : "Encontre as raizes de:\nx^2 - 6x = 0",
		alternativas : ["S = {0,-6}","S = {3,-3}","S = {0,6}","S = {0,-3}"],
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
		pergunta : "Resolva:\nx^2 + 8x + 15 = 0",
		alternativas : ["S = {5,3}","S = {-5,-3}","S = {-5,3}","S = {5,-3}"],
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
		pergunta : "Determine S para:\n3x^2 - 12 = 0",
		alternativas : ["S = {0,2}","S = {2,4}","S = {0,-4}","S = {-2,2}"],
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
		pergunta : "Encontre as raizes de:\nx^2 - 2x - 3 = 0",
		alternativas : ["S = {3,-1}","S = {2,4}","S = {0,-3}","S = {-1,2}"],
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
		pergunta : "Resolva:\nx^2 + 2x - 8 = 0",
		alternativas : ["S = {-4,2}","S = {-2,4}","S = {2,-4}","S = {-2,2}"],
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
		pergunta : "Encontre as raizes de:\nx^2 + x - 20 = 0",
		alternativas : ["S = {-4,5}","S = {4,-5}","S = {-5,-4}","S = {5,4}"],
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
		pergunta : "Resolva:\nx^2 - 7x + 10 = 0",
		alternativas : ["S = {−5,2}","S = {7,−10}","S = {5,2}","S = {−7,10}"],
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
		pergunta : "Determine S para:\n4x^2 - 25 = 0",
		alternativas : ["S = {-5/2,5/2}","S = {5/2,5}","S = {- 5,5}","S = {- 5/4,5/4}"],
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
]

#endregion

#region goblin_king

global.question_goblin_king =
[
	{
		pergunta : "Resolva a equacao 2x + 5 = 15:\ne use o valor encontrado para calcular\nx^2 - 4x",
		alternativas : ["-10","0","5","10"],
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
		pergunta : "Resolva o sistema de equacoes:\nx + y = 7 e x - y = 3.\nDepois, calcule o produto:",
		alternativas : ["10","21","25","30"],
		alternativa_certa : 1,
		sprites : spr_question_10b, //0 indica que não precisa de sprites
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
		pergunta : "Expanda o produto notavel:\n(x + 3)^2\ne encontre o valor de x",
		alternativas : ["x = -3","x = -1","x = 0","x = -2"],
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
		pergunta : "Encontre as raizes de:\n3x - 2 = x^2",
		alternativas : ["S = {1,2}","S = {-1,-2}","S = {-1,2}","S = {1,-2}"],
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
		pergunta : "Resolva o sistema:\n2x + y = 10 e x - y = 2,\ne use os valores para calcular:",
		alternativas : ["2","5","10","20"],
		alternativa_certa : 3,
		sprites : spr_question_10e, //0 indica que não precisa de sprites
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
            hp: 20,
            hpMax: 20,
            mp: 2,
            mpMax: 15,
            strength: 6,
            sprites : { idle: sPlayerIdle, attack: sPlayerAttack, cast: sPlayerCast, defend: sPlayerDefend, down: sPlayerDown},
            actions : [global.action_library.attack, global.action_library.escape]
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
		actions: question_library_operacoes_basicas,
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
		hp: 1,
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
	mushroomO: 
	{
		name: "Cogumelo",
		hp: 1,
		hpMax: 16,
		mp: 0,
		mpMax: 0,
		strength: 5,
		sprites: { idle: spr_mushroom_orange_walk, attack: spr_mushroom_orange_attack},
		actions: global.potenciacao,
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
	mushroomP: 
	{
		name: "Cogumelo",
		hp: 1,
		hpMax: 16,
		mp: 0,
		mpMax: 0,
		strength: 5,
		sprites: { idle: spr_mushroom_purple_walk, attack: spr_mushroom_purple_attack},
		actions: global.radiciacao,
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
	king_Slime: 
	{
		name: "Rei Slime",
		hp: 1,
		hpMax: 35,
		mp: 0,
		mpMax: 0,
		strength: 10,
		sprites: { idle: spr_slime_king_idle, attack: spr_slime_king_attack},
		actions: global.question_slime_king,
		current_question_index: -1, // Armazena o índice da questão atual
		AIscript : function()
		{
			// Verifica se a questão atual ainda não foi definida
		    if (current_question_index == -1) {
		        current_question_index = 0; // Começa com a primeira questão
		    }

		    // Seleciona a questão atual
		    var _action = actions[current_question_index];

		    // Atualiza o índice da próxima questão para o próximo turno
		    current_question_index += 1;

		    // Verifica se o índice ultrapassou o tamanho do array e reinicia o ciclo
		    if (current_question_index >= array_length(actions)) {
		        current_question_index = 0; // Volta para o início
		    }

			// Seleciona um membro aleatório da party como alvo
			var _possible_targets = array_filter(obj_battle.partyUnidades, function(_unit, _index)
			{
				return (_unit.hp > 0);
			});
			var _target = _possible_targets[irandom(array_length(_possible_targets) - 1)];

			return [_action, _target];
		}
	},
	BatD: 
	{
		name: "Morcego",
		hp: 1,
		hpMax: 16,
		mp: 0,
		mpMax: 0,
		strength: 5,
		sprites: { idle: sBat_dark_walk, attack: sBat_dark_attack},
		actions: global.equacao_1,
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
	Skeleton1: 
	{
		name: "Esqueleto",
		hp: 16,
		hpMax: 16,
		mp: 0,
		mpMax: 0,
		strength: 5,
		sprites: { idle: spr_skeleton_1_idle, attack: spr_skeleton_1_attack},
		actions: global.sistemas_equacao_1,
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
	BatR: 
	{
		name: "Morcego",
		hp: 1,
		hpMax: 16,
		mp: 0,
		mpMax: 0,
		strength: 5,
		sprites: { idle: spr_bat_red_walk, attack: spr_bat_red_attack},
		actions: global.produtos_notaveis,
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
	Skeleton2: 
	{
		name: "Esqueleto",
		hp: 16,
		hpMax: 16,
		mp: 0,
		mpMax: 0,
		strength: 5,
		sprites: { idle: spr_skeleton_2_idle, attack: spr_skeleton_2_attack},
		actions: global.equacao_2,
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
	king_Goblin: 
	{
		name: "Rei Goblin",
		hp: 40,
		hpMax: 40,
		mp: 0,
		mpMax: 0,
		strength: 10,
		sprites: { idle: spr_king_goblin_idle, attack: spr_king_goblin_attack},
		actions: global.question_goblin_king,
		current_question_index: -1, // Armazena o índice da questão atual
		AIscript : function()
		{
			// Verifica se a questão atual ainda não foi definida
		    if (current_question_index == -1) {
		        current_question_index = 0; // Começa com a primeira questão
		    }

		    // Seleciona a questão atual
		    var _action = actions[current_question_index];

		    // Atualiza o índice da próxima questão para o próximo turno
		    current_question_index += 1;

		    // Verifica se o índice ultrapassou o tamanho do array e reinicia o ciclo
		    if (current_question_index >= array_length(actions)) {
		        current_question_index = 0; // Volta para o início
		    }

			// Seleciona um membro aleatório da party como alvo
			var _possible_targets = array_filter(obj_battle.partyUnidades, function(_unit, _index)
			{
				return (_unit.hp > 0);
			});
			var _target = _possible_targets[irandom(array_length(_possible_targets) - 1)];

			return [_action, _target];
		}
	},
}