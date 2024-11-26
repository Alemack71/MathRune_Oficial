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
		global.dialogo_acabou_elfo2 = ini_read_real("Elfo","dialogo2",0);
		global.dialogo_acabou_elfo3 = ini_read_real("Elfo","dialogo3",0);
		global.dialogo_acabou_elfo5 = ini_read_real("Elfo","dialogo5",0);
		global.dialogo_acabou_elfo6 = ini_read_real("Elfo","dialogo6",0);
		global.dialogo_acabou_elfo8 = ini_read_real("Elfo","dialogo8",0);
		global.dialogo_acabou_elfo9 = ini_read_real("Elfo","dialogo9",0);
		
		global.coletou_runa1 = ini_read_real("Rune","king_slime",0);
		global.coletou_runa2 = ini_read_real("Rune","king_goblin",0);
		global.coletou_runa3 = ini_read_real("Rune","king_demon",0);
		
		global.key_bonfire = ini_read_real("Chave","0",0);
		
		global.key_slimeg = ini_read_real("Chave","1",0);
		global.key_slimeb = ini_read_real("Chave","2",0);
		global.key_mushroomo = ini_read_real("Chave","3",0);
		global.key_mushroomp = ini_read_real("Chave","4",0);
		
		global.key_slime_king = ini_read_real("Chave","5",0);
		
		global.key_batd = ini_read_real("Chave","6",0);
		global.key_skeleton_1 = ini_read_real("Chave","7",0);
		global.key_batr = ini_read_real("Chave","8",0);
		global.key_skeleton_2 = ini_read_real("Chave","9",0);	
		
		global.key_goblin_king = ini_read_real("Chave","10",0);
		
		global.key_knight_1 = ini_read_real("Chave","11",0);
		global.key_mage = ini_read_real("Chave","12",0);
		global.key_knight_2 = ini_read_real("Chave","13",0);
		
		global.key_demon_king = ini_read_real("Chave","14",0);
		
	    var roomID;
	    roomID = ini_read_real("Player","sala_atual",0);
	    room_goto(roomID);
	    ini_close();
	} else{
		//Quando não existe arquivo e o player clica em jogar de novo ele volta como se tivesse clicado em "Novo Jogo", resetando e voltando ao padrão todos as vartiaveis necessárias
		instance_create_layer(50, 69, "Instances", obj_player);
		global.party[0].hp = 20;
		global.party[0].mp = 15;
		
		global.dialogo_acabou_elfo1 = 0;
		global.dialogo_acabou_elfo1 = 0;
		global.dialogo_acabou_elfo2 = 0;
		global.dialogo_acabou_elfo3 = 0;
		global.dialogo_acabou_elfo5 = 0;
		global.dialogo_acabou_elfo6 = 0;
		global.dialogo_acabou_elfo8 = 0;
		global.dialogo_acabou_elfo9 = 0;
		
		global.coletou_runa1 = 0;
		global.coletou_runa2 = 0;
		global.coletou_runa3 = 0;
		
		global.key_bonfire = 0;
		
		global.key_slimeg = 0;
		global.key_slimeb = 0;
		global.key_mushroomo = 0;
		global.key_mushroomp = 0;
		
		global.key_slime_king = 0;
		
		global.key_batd = 0;
		global.key_skeleton_1 = 0;
		global.key_batr = 0;
		global.key_skeleton_2 = 0;	
		
		global.key_goblin_king = 0;
		
		global.key_knight_1 = 0;
		global.key_mage = 0;
		global.key_knight_2 = 0;
		
		global.key_demon_king = 0;
		
		room_goto(rm_game_tutorial);
	}
}else if(index == 1){
	url_open("https://alemack71.github.io/MathRune_Oficial/");
}else if(index == 2){
	room_goto(rm_menu);
}