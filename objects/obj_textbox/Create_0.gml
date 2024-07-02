/// Input
confirm_key = vk_enter;
max_input_delay = 5;
input_delay = max_input_delay;

/// Posição
margin = 16;
padding = 8;
width = display_get_gui_width() - margin * 1;
height = sprite_height;
	
x = display_get_gui_width() - width / 1;
y = display_get_gui_height() - height - margin; 


/// Texto 
text_font = fnt_text;
text_color = c_white;
text_speed = 0.6;
text_x = padding;
text_y = padding;
text_width = width - padding * 2;


/// Proprieties NÃO EDITAR.
actions = [];
current_action = -1;

text = "";
text_progress = 0;
text_length = 0;

/// Methods
setTopic = function(topic) {
	actions = global.topics[$ topic];
	current_action = -1;
	
	next();
}

/// Proxima ação
next = function() {
	current_action++;
	if (current_action >= array_length(actions)){
		instance_destroy();
	}
	else {
		actions[current_action].act(id);
	}
}

/// Setar o texto
setText = function(newText){
	text = newText;
	text_length = string_length(newText);
	text_progress = 0;
}
	
	
	
	
	
	
	