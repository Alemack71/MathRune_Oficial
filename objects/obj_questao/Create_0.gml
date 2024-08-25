/// @description Inserir descrição aqui
//questao = "x + 2";
//alternativas = ["skibid", "toilet", "sigma da bahia", "fanum tax"];
//alternativa_correta = 2;
//alternativa_selecionada = 0;
//delay = 0;

questao_box = pergunta;
alternativas_box = alternativas;
alternativa_correta = alternativa_certa;
alternativa_selecionada = 0;
delay = 0;
delay_resposta = 0;
_key_confirm = false; 
resposta_revelada = false;
imagem = sprites;

_spr_box_width = 180;
_spr_box_height = 100;

_x_centro = (global.battle_x + 158) - (_spr_box_width / 2);
_y_centro = (global.battle_y + 80) - (_spr_box_height / 2);

//camera display
view_w = camera_get_view_width(view_camera[0]);
view_h = camera_get_view_height(view_camera[0]);
display_set_gui_size(view_w,view_h);

//barra de tempo
time_max = 100;
time = time_max;
timebar_w = 50;
timebar_h = 3;

color_1 = make_color_rgb(255,0,64); //Cor principal
color_2 = make_color_rgb(19,19,19); //Cor do background
color_3 = make_color_rgb(19,19,19); //Cor do outline (borda)