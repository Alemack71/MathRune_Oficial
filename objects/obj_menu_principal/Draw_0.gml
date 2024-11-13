/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();

if (no_saves)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	draw_text(room_width/2, 700, "Voce nao tem Saves")

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
