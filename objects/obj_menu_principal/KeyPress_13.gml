if(index == 0){
	room_goto(rm_name)
}else if(index == 1){
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
		
		global.coletou_runa1 = ini_read_real("Rune","king_slime",0);
		global.coletou_runa2 = ini_read_real("Rune","king_goblin",0);
		global.coletou_runa3 = ini_read_real("Rune","king_demon",0);
		
		global.key_slimeg = ini_read_real("Chave","1",0);
		global.key_slimeb = ini_read_real("Chave","2",0);
		global.key_mushroomo = ini_read_real("Chave","3",0);
		global.key_mushroomp = ini_read_real("Chave","4",0);
		
		global.key_slime_king = ini_read_real("Chave","5",0);
		
		global.key_batd = ini_read_real("Chave","6",0);
		global.key_batr = ini_read_real("Chave","7",0);
		
		global.player_continuing = true
		var roomID;
		roomID = ini_read_real("Player","sala_atual",0);
		room_goto(roomID);
		ini_close();
	} else
{
	no_saves = !no_saves; //Faz a mensagem "No saves" ficar indo e voltando
	}
}else if(index == 2){
	url_open("https://alemack71.github.io/MathRune_Oficial/");
}else if(index == 3){
	game_end();
}