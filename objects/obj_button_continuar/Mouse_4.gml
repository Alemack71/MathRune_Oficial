event_inherited();

if(file_exists("save.sav")){ 
	ini_open("save.sav");
	global.name = ini_read_string("Player","nome","")
	InitializeParty()
	global.player_x = ini_read_real("Player","x_atual",0);
	global.player_y = ini_read_real("Player","y_atual",0);
	global.party[0].hp = ini_read_real("Player","hp_atual",0);
	global.party[0].mp = ini_read_real("Player","mp_atual",0);
	global.player_continuing = true
    var roomID;
    roomID = ini_read_real("Player","sala_atual",0);
    room_goto(roomID);
    ini_close();
} else
{
	no_saves = !no_saves;	
}