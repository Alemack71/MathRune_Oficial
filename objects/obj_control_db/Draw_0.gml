/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _x = room_width/2;
var _y = (room_height/2) -100;

draw_set_font(fnOpenSansPX);

draw_set_valign(1);
draw_set_halign(1);

if data == -1
{
	draw_text(32,32, "Loading...");
}
else
{
	draw_text(_x,_y - 32, "Highscores:");
	
	for (var i = 0; i < array_length(data); i++)
	{
		var _doc = data[i];
		draw_text(_x, _y + (32 * i), $"{_doc.name}: {_doc.score}");
	}
}

