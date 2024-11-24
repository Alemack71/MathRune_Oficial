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

global.topics[$ "Finalizacao_floresta_1"] = [
	SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
	TEXT("Você conseguiu vencer todos os slimes ... impressionante!"),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Bom, agora acho que estamos prontos para avançar para a próxima área!")
];

global.topics[$ "Potenciacao"] = [
	SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
	TEXT("Para enfrentar os cogumelos, você precisa dominar uma nova técnica: a Potenciação!"),
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
    TEXT("Você está indo muito bem! Agora vamos aprender algo fundamental para enfrentar os cogumelos roxos: a Radiciação."),
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

global.topics[$ "Finalizacao_floresta_2"] = [
    SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
    TEXT("Você conseguiu vencer todos os cogumelos... impressionante!"),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Bom, agora acho que estamos prontos para avançar para a próxima área!"),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Mas antes disso, precisamos derrotar o grande lorde da floresta: o Rei Slime."),
    SPEAKER("Luck", spr_portrait_luck_mad, PORTRAIT_SIDE.LEFT),
    TEXT("Infelizmente, eu não consigo te ajudar a derrotá-lo. Você terá que usar tudo que aprendeu aqui para conseguir vencê-lo."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Mas eu confio em você!"),
    SPEAKER("Luck", spr_portrait_luck_mad, PORTRAIT_SIDE.LEFT),
    TEXT("Apenas lembre-se de salvar o jogo aqui antes de avançar para a área do chefe."),
];

#endregion


#region boss_1

global.topics[$ "Dialogo_king_slime"] = [
	SPEAKER("Rei Sime"),
	TEXT("Você não prosseguira!"),
];

#endregion


#region fase 2

global.topics[$ "Equacao_Primeiro_Grau"] = [
	SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
    TEXT("Você conseguiu pegar a runa do Rei Slime! Sabia que podia confiar em você para salvar o mundo."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Você está indo muito bem! Agora vamos aprender algo essencial para continuar sua jornada e derrotar os morcegos da caverna: as Equações de Primeiro Grau."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Essas equações conectam valores conhecidos e desconhecidos, chamados de incógnitas. Elas são expressas assim: ax + b = 0."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Aqui, 'a' e 'b' são números reais, e 'a' deve ser diferente de zero. A incógnita, geralmente representada por x, é o termo que queremos descobrir."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Um exemplo de equação de primeiro grau é: 2x = 4. Aqui, queremos saber qual valor de x torna a igualdade verdadeira."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Para resolver, isolamos a incógnita de um lado da equação e movemos os valores constantes para o outro. Importante: ao mudar um termo de lado, invertemos a operação."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Por exemplo, se um número está somando, ele passará subtraindo; se está multiplicando, ele passará dividindo. Isso mantém a igualdade verdadeira."),
    SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
    TEXT("Com isso, você está pronto para começar a resolver equações de primeiro grau!"),
	SPEAKER("Luck", spr_portrait_luck_mad, PORTRAIT_SIDE.LEFT),
	TEXT("Lembre-se que se você não lembra ou não acha suficiente o que te ensinei, é sempre possível verificar a seção 'Ajuda' no menu, clicando na tecla 'Esc', para aulas mais detalhadas!"),
];

global.topics[$ "Sistemas_Equacoes"] = [
	SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
	TEXT("Você conseguiu vencer todos os morcegos ... impressionante!"),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Excelente progresso! Agora vamos aprender a resolver sistemas de equações do 1º grau.\nEssenciais para derrotar os esqueletos"),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Um sistema de equações é composto por duas ou mais equações que compartilham incógnitas. O objetivo é encontrar valores que satisfaçam todas as equações ao mesmo tempo."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Existem dois métodos principais para resolver sistemas: o método da substituição e o método da adição. Vamos começar pelo da substituição."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("No método da substituição, isolamos uma incógnita em uma das equações, substituímos o valor encontrado na outra equação, e resolvemos."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Por exemplo, no sistema: x + y = 12 e 3x - y = 20, podemos isolar o x na primeira equação: x = 12 - y. Depois substituímos esse valor na segunda equação."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Após a substituição, teremos uma equação com apenas uma incógnita. Resolva para encontrar o valor de y e, depois, substitua esse valor de volta para encontrar x."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Agora, vamos ao método da adição!"),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Esse método é útil quando os coeficientes de uma incógnita possuem valores opostos. Assim, somamos as equações para eliminar essa incógnita."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Por exemplo, no sistema: x + y = 12 e 3x - y = 20, podemos somar as equações diretamente, pois o coeficiente de y em uma é positivo e na outra é negativo."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Após a soma, sobrará uma equação com apenas a incógnita x. Resolva essa equação, e depois substitua o valor encontrado em uma das equações originais para determinar y."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Se os coeficientes não forem opostos, você pode multiplicar uma das equações por um número que torne os coeficientes opostos."),
    SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
    TEXT("E pronto! Agora você conhece os dois métodos para resolver sistemas de equações. Vamos praticar para fixar o aprendizado!"),
	SPEAKER("Luck", spr_portrait_luck_mad, PORTRAIT_SIDE.LEFT),
	TEXT("Lembre-se que se você não lembra ou não acha suficiente o que te ensinei, é sempre possível verificar a seção 'Ajuda' no menu, clicando na tecla 'Esc', para aulas mais detalhadas!"),
];

global.topics[$ "Finalizacao_caverna_1"] = [
	SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
	TEXT("Você conseguiu vencer todos os inimigos ... impressionante!"),
	SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
	TEXT("Bom, agora acho que estamos prontos para avançar para a próxima área!")
];

global.topics[$ "Produtos_Notaveis"] = [
    SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
    TEXT("Excelente progresso! Agora vamos aprender sobre os produtos notáveis."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Os produtos notáveis são expressões algébricas importantes que aparecem com frequência em problemas matemáticos."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Vamos começar pelo Quadrado da Soma de Dois Termos."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("O quadrado da soma é dado por (a + b)^2. Isso significa multiplicar (a + b) por ele mesmo."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Ao aplicar a distributiva, temos a^2 + 2ab + b^2. Ou seja, o quadrado do primeiro termo, somado ao dobro do produto dos dois termos, mais o quadrado do segundo termo."),
    SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
    TEXT("Agora vamos ao Quadrado da Diferença de Dois Termos."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("O quadrado da diferença é representado por (a - b)^2. Assim como antes, multiplicamos (a - b) por ele mesmo."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Aplicando a distributiva, o resultado é a^2 - 2ab + b^2. Perceba que é parecido com o quadrado da soma, mas com um sinal negativo no termo do meio."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Por fim, temos o Produto da Soma pela Diferença de Dois Termos."),
    SPEAKER("Luck", spr_portrait_luck, PORTRAIT_SIDE.LEFT),
    TEXT("Essa propriedade é representada como (a + b)(a - b). Aqui, o resultado é a diferença dos quadrados dos dois termos: a^2 - b^2."),
    SPEAKER("Luck", spr_portrait_luck_pog, PORTRAIT_SIDE.LEFT),
    TEXT("Essas propriedades são muito úteis para simplificar expressões e resolver equações. Vamos praticar algumas questões para fixar o aprendizado!"),
	SPEAKER("Luck", spr_portrait_luck_mad, PORTRAIT_SIDE.LEFT),
	TEXT("Lembre-se que se você não lembra ou não acha suficiente o que te ensinei, é sempre possível verificar a seção 'Ajuda' no menu, clicando na tecla 'Esc', para aulas mais detalhadas!"),
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
	TEXT("Quando achar uma fogueira, você também pode interagir para acendê-la e recuperar sua vida e mana!\n(Apenas se tiver derrotado 3 inimigos ou mais)")
];

global.topics[$ "Aviso_chefe_escapar"] = [
	TEXT("Cuidado! Não tente escapar do chefe. Acredite em mim, eu já tentei!\n -Placa")
];

#endregion

#region runas

global.topics[$ "Runa_king_slime"] = [
	TEXT("Parabéns, você coletou a runa do Rei Slime!\nVocê sente o poder dela sendo absorvido, aumentando seus atributos!")
];

#endregion
