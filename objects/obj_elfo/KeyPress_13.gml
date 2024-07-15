//dialogo está ativo ent fica true

if distance_to_object(obj_player) <= 10{
	if (!global.dialogo_on)
	{
		 global.progresso_dialogo ++;
	}
	
	if (global.progresso_dialogo == 1) {
        global.dialogo_on = true;
		startDialogue(dialogo);
    }
    else if (global.progresso_dialogo == 2) {
        global.dialogo_on = true;
        dialogo = "Teste";
        startDialogue(dialogo);
        global.progresso_dialogo = 2;
    }
    else if (global.progresso_dialogo == 3) {
        global.dialogo_on = true;
        dialogo = "Breakfast";
        startDialogue(dialogo);
    }
}  




