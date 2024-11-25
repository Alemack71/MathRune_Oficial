if(index == 0){
	if(file_exists("save.sav")){ 
		ini_open("save.sav");
		global.name = ini_read_string("Player","nome","")
		InitializeParty()
		InitializeDialogoComNome()
		global.player_x = ini_read_real("Player","x_atual",0);
		global.player_y = ini_read_real("Player","y_atual",0);
		global.party[0].hp = ini_read_real("Player","hp_atual",0);
		global.party[0].mp = ini_read_real("Player","mp_atual",0);
		global.dialogo_acabou_elfo1 = ini_read_real("Elfo","dialogo",0);
		global.player_continuing = true
	    var roomID;
	    roomID = ini_read_real("Player","sala_atual",0);
	    room_goto(roomID);
	    ini_close();
	} else{
		//Quando não existe arquivo e o player clica em jogar de novo ele volta como se tivesse clicado em "Novo Jogo", resetando e voltando ao padrão todos as vartiaveis necessárias
		instance_create_layer(50, 69, "Instances", obj_player);
		global.party[0].hp = 2;
		global.party[0].mp = 10;
		global.dialogo_acabou_elfo1 = 0;
		room_goto(rm_game_tutorial);
	}
}else if(index == 1){
	url_open("https://alemack71.github.io/MathRune_Oficial/");
}else if(index == 2){
	room_goto(rm_menu);
}