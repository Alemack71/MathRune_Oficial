draw_self();

draw_set_font(fnt_monospaced);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(x, y, button_text, escala_texto_x, escala_texto_y, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);