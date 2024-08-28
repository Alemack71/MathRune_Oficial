/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

root =  "highscores";
listener = FirebaseFirestore(root).Listener();

data = -1; //isso vai conter um array com todos os dados

sort_score = function(_a, _b)
{
	//função que vai deixar em ordem crescente os scores
	return _b.score - _a.score;
}

