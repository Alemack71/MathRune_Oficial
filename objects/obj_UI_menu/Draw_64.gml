if (global.gamePaused){
	
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0,0,view_wport[0],view_hport[0],false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_set_font(fnt_monospaced);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text(view_wport[0] * 0.5, view_hport[0] * 0.3, "Game Paused");
	for (var i = 0; i < array_length(pauseOption); i++){
		var _print = "";
		if (i == pauseOptionSelected){
			_print += "> " + pauseOption[i] + " <";
		}
		else{
			_print += pauseOption[i];
			draw_set_alpha(1.0);
		}
		draw_text(view_wport[0] * 0.5, view_hport[0] * 0.5 + 18 + (i * 90), _print);
		draw_set_alpha(1.0);
	}
}

//1280,720