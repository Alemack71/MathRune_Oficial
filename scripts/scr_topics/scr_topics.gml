global.topics = {};

global.topics[$ "Exemplo"] = [
	TEXT("o"),
	TEXT("Eu espero que essa coisa funcione"),
	TEXT("Muito texto, várias palavras para testar o sistema de quebra de linha, não sei mais o que escrever. Muito texto, várias palavras para testar o sistema de quebra de linha, não sei mais o que escrever."),
];

global.topics[$ "Bos Vindas a MathRune"] = [
	TEXT("Ah Olá"),
	TEXT("Você me salvou"),
	TEXT("Acho que voce nao conhece esse lugar, parece novo por aqui, meu nome é Luck, e eu irei te guiar nessa terra mágica!"),
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

global.topics[$ "Chose Eggs"] = [
	TEXT("That's a healthy way to start the day!"),
	GOTO("End of Breakfast")
];

global.topics[$ "Chose Pancakes"] = [
	TEXT("Ooh, yummy!"),
	GOTO("End of Breakfast")
];

global.topics[$ "End of Breakfast"] = [
	TEXT("Goodbye, now!")
];

global.topics[$ "Bonfire_Descanso"] = [
	TEXT("Voce descansou na bonfire. Isso te enche de determinacao")
];

global.topics[$ "Bonfire_Cheio"] = [
	TEXT("Nao temos tempo para descansar. E hora de partir.")
];