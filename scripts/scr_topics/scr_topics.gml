global.topics = {};

global.topics[$ "Bem vindo"] = [
	SPEAKER("?", spr_portrait_sam, PORTRAIT_SIDE.LEFT),
	TEXT("Voce parece perdido e novo por aqui. Nao acho que ja tenha visto voce antes."),
	SPEAKER("?", spr_portrait_sam, PORTRAIT_SIDE.LEFT),
	TEXT("Bom... nesse caso Bem-vindo a MathRune! Um mundo magico onde runas matematicas mantem o equilibrio e a ordem"),
	SPEAKER("Luck", spr_portrait_sam_mad),
	TEXT("... Que infelizmente foram tomadas pelos grandes lordes, causando caos e desequilibrio entre as forcas matematicas"),
	SPEAKER("Luck", spr_portrait_sam, PORTRAIT_SIDE.LEFT),
	TEXT("Alias, eu me chamo Luck. Posso ajuda-lo a recuperar as runas e restaurar MathRune se quiser. Voce parece mais forte que eu para acabar com os monstros daqui e tomar as runas dos lordes..."),
];


global.topics[$ "Teste"] = [
	SPEAKER("Sam", spr_portrait_sam, PORTRAIT_SIDE.LEFT),
	TEXT("Hoje meu dia está pessimo."),
	SPEAKER("Sam", spr_portrait_sam, PORTRAIT_SIDE.LEFT),
	TEXT("Por que pessimo, voce me pergunta?"),
	SPEAKER("Sam", spr_portrait_sam_mad),
	TEXT("Eu vi Ismael Britzke hoje!")
];

global.topics[$ "Breakfast"] = [
	SPEAKER("Sam", spr_portrait_sam, PORTRAIT_SIDE.LEFT),
	CHOICE("What do you want for breakfast?",
		OPTION("Eggs", "Chose Eggs"),
		OPTION("Pancakes", "Chose Pancakes"))
];

global.topics[$ "Fracasso"] = [
	TEXT("Oh ... nao esperava por essa resposta"),
	GOTO("Encerramento")
];

global.topics[$ "Comecar jornada"] = [
	TEXT("Otimo!"),
	GOTO("comeco da jornada")
];

global.topics[$ "Encerramento"] = [
	TEXT("Bem ... voce pode ficar aqui e apreciar a natureza se quiser entao!")
];

global.topics[$ "comeco da jornada"] = [
	TEXT("Entao voce pode seguir para o leste"),
	TEXT("Nao se preocupe eu irei te alcancar e te ensinar tudo o que voce precisar quando voce chegar la!")
];


global.topics[$ "Bonfire_Descanso"] = [
	TEXT("Voce descansou na bonfire. Isso te enche de determinacao")
];

global.topics[$ "Bonfire_Cheio"] = [
	TEXT("Nao temos tempo para descansar. E hora de partir.")
];