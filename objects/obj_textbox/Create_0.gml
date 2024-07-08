/// Input
confirm_key = vk_enter;
up_key = vk_up;
down_key = vk_down;
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
text_y = padding * 3;
text_width = width - padding * 2;

/// Portrait
portrait_x = padding;
portrait_y = padding;

/// Speaker
speaker_x = padding;
speaker_y = 0;
speaker_font = fnt_text;
speaker_color = #464633;

/// Opções
option_x = padding;
option_y = padding * -6;
option_spacing = 50;
option_selection_indent = 24;
option_width = 300;
option_height = 40;
option_text_x = 10;
option_text_color = c_white;


/// Proprieties NÃO EDITAR.
actions = [];
current_action = -1;

text = "";
text_progress = 0;
text_length = 0;

portrait_sprite = -1;
portrait_width = sprite_get_width(spr_portrait);
portrait_height = sprite_get_height(spr_portrait);

portrait_side = PORTRAIT_SIDE.LEFT;

enum PORTRAIT_SIDE{
	LEFT,
	RIGHT
}

speaker_name = "";
speaker_width = sprite_get_width(spr_name);
speaker_height = sprite_get_height(spr_name);

options = [];
current_option = 0;
option_count = 0;

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
	
	
	
	
	
	
	