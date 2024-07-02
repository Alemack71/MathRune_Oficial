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
	if (confirm) {
		next();
	}
}
else if (confirm) {
	text_progress = text_length;
}
