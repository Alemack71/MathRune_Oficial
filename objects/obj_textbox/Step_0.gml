/// Input
var confirm = keyboard_check_pressed(confirm_key);

/// Escrever o texto
text_progress = min(text_progress + text_speed, text_length);


/// Input Delay
if (input_delay > 0) {
	input_delay--;
	exit;
}

/// Parou de escrever
if (text_progress == text_length) {
	if (option_count > 0) {
		var up = keyboard_check_pressed(up_key);
		var down = keyboard_check_pressed(down_key);
		
		/// Ciclar as opções
		var change = down - up;
		if (change != 0) {
			current_option += change;
			
			/// Última opção
			if (current_option < 0)
				current_option = option_count - 1;
			else if (current_option >= option_count)
				current_option = 0;
		}
		if (confirm) {
			var option = options[current_option];
			options = [];
			option_count = 0;
			
			option.act(id);
		}
	}
	else if (confirm){
		next();
	}
}
else if (confirm) {
	text_progress = text_length;
}