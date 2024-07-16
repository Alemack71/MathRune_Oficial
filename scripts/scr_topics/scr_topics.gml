global.topics = {};

global.topics[$ "Bem vindo"] = [
	SPEAKER("?", spr_portrait_luck_mad, PORTRAIT_SIDE.LEFT),
	TEXT("..."),
	SPEAKER("?", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
	TEXT("Oh, olá. Me desculpe, eu não estava esperando uma conversa... É raro ver rostos novos por aqui."),
	SPEAKER("?", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Bom... Bem-vindo a MathRune, um mundo onde o equilíbrio e a ordem são mantidos pelas poderosas runas matemáticas."),
	SPEAKER("?", spr_portrait_luck_mad),
	TEXT("... Que infelizmente foram tomadas pelos grandes lordes, causando caos e desiquilíbrio."),
	SPEAKER("Luck", spr_portrait_luck),
	TEXT("Hmmm perdoe minha falta de modos... Eu me chamo Luck e posso ajudá-lo a recuperar as runas e restaurar MathRune. Você parece forte o suficiente para desafiar os lordes e trazer o equilíbrio de volta."),
];

function InitializeDialogoComNome(){
	global.topics[$ "Começo da Jornada"] = [
		SPEAKER("Luck", spr_portrait_luck_mad, PORTRAIT_SIDE.LEFT),
		TEXT("Já ia me esquecendo ... E você como se chama?"),
		SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
		TEXT("Oh, " + string(global.name) + "? Belo nome!"),
		SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
		TEXT("Você pode atravessar para a direção leste, está infestado de inimigos nesta área, mas não se preocupe, eu te ensinarei a derrota-los!"),
	];
}


global.topics[$ "Siga"] = [
		SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
		TEXT("Siga em frente! Eu te acompanho..."),
	];
	
global.topics[$ "Introdução ao combate"] = [
	SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
	TEXT("Parece que encontramos um desafio matemático. Há varios monstros por aqui ... "),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Em MathRune, para derrotar os inimigos você deve resolver problemas matemáticos. Cada inimigo vai te perguntar alguma questão diferente e você deve resolve-las!"),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Bom... Vamos começar pelos slimes verdes, são do tipo mais simples que tem por aqui."),
	SPEAKER("Luck", spr_portrait_luck),
	TEXT("Primeiro, precisamos lembrar das ordens de operações para responder suas perguntas."),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Elas definem a ordem certa para resolver expressões matemáticas. A sigla PEMDAS pode te ajudar a lembrar: Parênteses, Expoentes, Multiplicação e Divisão (da esquerda para a direita), e Adição e Subtração (da esquerda para a direita)."),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Acho que com isso você consegue derrotar todos os slimes verdes. Não se preocupe com o resto, quando você acabar com eles eu te ensinarei a como derrotar os próximos!"),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Lembre-se que se você não lembra ou não acha suficiente o que te ensinei, é sempre possível verificar a seção 'Ajuda' no menu, clicando na tecla 'Escape', para aulas mais detalhadas!"),
];

global.topics[$ "Ensinando fatores e múltiplos "] = [
	SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
	TEXT("Parece que você conseguiu derrotar todos os slimes verdes, parabéns!"),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Agora temos que resolver "),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Fatorar um número significa decompor esse número em seus fatores primos. Isso envolve dividir o número sucessivamente pelos menores primos até que não seja mais possível."),
	SPEAKER("Luck", spr_portrait_luck),
	TEXT("O MMC de dois números é o menor número que é múltiplo de ambos. Para encontrá-lo, decomponha cada número em fatores primos e escolha os maiores expoentes comuns."),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("O MDC de dois números é o maior número que divide ambos sem deixar resto. Para encontrá-lo, decomponha cada número em seus fatores primos e escolha os menores expoentes comuns."),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Acho que com isso você consegue derrotar todos os slimes azuis. Não se preocupe com o resto, quando você acabar com eles eu te ensinarei a como derrotar os próximos!"),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Lembre-se que se você não lembra ou não acha suficiente o que te ensinei, é sempre possível verificar a seção 'Ajuda' no menu, clicando na tecla 'Escape', para aulas mais detalhadas!"),
];





#region fogueira

global.topics[$ "Bonfire_Descanso"] = [
	TEXT("Você descansou na fogueira. Suas forças estão renovadas.")
];

global.topics[$ "Bonfire_Cheio"] = [
	TEXT("Não temos tempo para descansar. É hora de resolver problemas matemáticos!")
];

#endregion

#region placas
global.topics[$ "Aviso_enter"] = [
	TEXT("Parabéns, você interagiu comigo!")
];

global.topics[$ "Aviso_bonfire"] = [
	TEXT("Quando achar uma fogueira, você também pode interagir para acendê-la e recuperar sua vida e mana!")
];
#endregion