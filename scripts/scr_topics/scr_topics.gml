global.topics = {};

#region introdução

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

#endregion

#region fase 1
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
	SPEAKER("Luck", spr_portrait_luck_mad, PORTRAIT_SIDE.LEFT),
	TEXT("Lembre-se que se você não lembra ou não acha suficiente o que te ensinei, é sempre possível verificar a seção 'Ajuda' no menu, clicando na tecla 'Esc', para aulas mais detalhadas!"),
];

global.topics[$ "Fatores_Multiplos"] = [
	SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
	TEXT("Você derrotou todos os slimes? Impressionante... Você está preparado para desafios maiores. Escute com atenção, vou te ensinar a derrotar os poderosos slimes azuis."),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("A decomposição de números consiste em expressar um número como a soma, produto ou combinação de outros números menores."),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Para decompor o número 30 em fatores primos: Divida 30 pelo menor número primo (2): 30 ÷ 2 = 15; Divida 15 pelo menor número primo (3): 15 ÷ 3 = 5; O 5 já é primo, então paramos aqui; A decomposição de 30 em fatores primos é: 30 = 2 × 3 × 5."),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("O Máximo Divisor Comum de dois ou mais números é o maior número inteiro positivo que divide todos eles sem deixar resto, ou seja, mantém um valor inteiro."),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Para encontrar o MDC, pode-se utilizar o método da fatoração em números primos."),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("O Mínimo Múltiplo Comum de dois ou mais números é o menor número inteiro positivo que é múltiplo de todos eles."),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Para encontrar o MMC, pode-se utilizar o método da fatoração em números primos ou o algoritmo da decomposição simultânea."),
	SPEAKER("Luck", spr_portrait_luck_mad, PORTRAIT_SIDE.LEFT),
	TEXT("Lembre-se que se você não lembra ou não acha suficiente o que te ensinei, é sempre possível verificar a seção 'Ajuda' no menu, clicando na tecla 'Escape', para aulas mais detalhadas!")
];

global.topics[$ "Finalização_floresta_1"] = [
	SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
	TEXT("Você conseguiu vencer todos os slimes ... impressionante!"),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Bom, agora acho que estamos prontos para avançar para a próxima área!")
	
];

global.topics[$ "Potenciacao"] = [
	SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
	TEXT("Para enfrentar os cogumelos, você precisa dominar um novo poder: a Potenciação!"),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Potenciação é uma forma de simplificar multiplicações repetidas. Por exemplo, em vez de escrever 2 × 2 × 2 × 2, podemos escrever 2^4, que significa '2 elevado a quarta potência'."),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Se o expoente for negativo, como em 2^(-3), o número se torna um 'inverso'. Isso significa 1 dividido por 2^3, ou seja, 1/8."),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Agora, existem regras importantes para operar potências:"),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("1. Para multiplicar potências com a mesma base, você soma os expoentes. Por exemplo, 2^3 × 2^4 = 2^(3+4) = 2^7."),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("2. Para dividir potências com a mesma base, você subtrai os expoentes. Por exemplo, 3^5 ÷ 3^2 = 3^(5-2) = 3^3."),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("3. Quando elevar uma potência a outra potência, multiplique os expoentes. Por exemplo, (2^3)^2 = 2^(3×2) = 2^6."),
	SPEAKER("Luck", spr_portrait_luck_mad, PORTRAIT_SIDE.LEFT),
	TEXT("Ah, e não se esqueça: qualquer número elevado a 0 é sempre igual a 1, como 7^0 = 1."),
	SPEAKER("Luck", spr_portrait_luck_mad, PORTRAIT_SIDE.LEFT),
	TEXT("Lembre-se que se você não lembra ou não acha suficiente o que te ensinei, é sempre possível verificar a seção 'Ajuda' no menu, clicando na tecla 'Escape', para aulas mais detalhadas!"),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Com essas regras e um pouco de prática, você será capaz de derrotar os mais temidos cogumelos laranjas. Vamos testar seus conhecimentos com algumas questões!")
];

global.topics[$ "Radiciacao"] = [
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Você está indo muito bem! Agora vamos aprender algo fundamental para enfrentar os slimes verdes: a Radiciação."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Radiciação é o processo de descobrir qual número, multiplicado por ele mesmo um certo número de vezes, resulta em outro número. Por exemplo, o número que multiplicado por ele mesmo 2 vezes dá 16 é 4."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Se o índice da raiz não estiver escrito, ele é 2, ou seja, é uma raiz quadrada."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Você pode usar a fatoração para calcular raízes. Por exemplo, para a raiz cúbica de 8, você pode dividir 8 em fatores iguais, como 2 × 2 × 2. Isso significa que a raiz cúbica de 8 é 2."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Outro detalhe importante: o resultado de uma raiz de 0 será sempre 0, e o resultado de uma raiz de 1 será sempre 1."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Quando temos raízes em frações, como raiz de 16 sobre 25, podemos separar as raízes do numerador e do denominador. Assim, a raiz de 16/25 vira 4/5."),
    SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
    TEXT("Agora, uma técnica especial: a racionalização!"),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Se tivermos uma fração com raiz no denominador, como 1 dividido por raiz de 2, multiplicamos o numerador e o denominador pela raiz. Assim, 1/(raiz de 2) se torna raiz de 2 dividido por 2."),
	SPEAKER("Luck", spr_portrait_luck_mad, PORTRAIT_SIDE.LEFT),
	TEXT("Lembre-se que se você não lembra ou não acha suficiente o que te ensinei, é sempre possível verificar a seção 'Ajuda' no menu, clicando na tecla 'Escape', para aulas mais detalhadas!"),
    SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
    TEXT("Com isso, você está preparado para resolver questões de radiciação e enfrentar novos desafios! Vamos praticar?")
];

#endregion

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