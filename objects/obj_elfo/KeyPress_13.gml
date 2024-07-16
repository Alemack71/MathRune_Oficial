//dialogo está ativo ent fica true


	if distance_to_object(obj_player) <= 10
	{
		if (!global.dialogo_on)
		{
			 progresso++;
		}
	
		if (progresso == 1) {
	        global.dialogo_on = true;
			startDialogue(dialogo);
			
			primeiro_terminado = true;
	    }
	    else if (progresso == 2 && dialogo_2 != 0) {
	        global.dialogo_on = true;
	        dialogo = dialogo_2;
	        startDialogue(dialogo);
	    }
	    else if (progresso == 3 && dialogo_3 != 0) {
	        global.dialogo_on = true;
	        dialogo = dialogo_3;
	        startDialogue(dialogo);
	    }
		else if (progresso == 4 && dialogo_4 != 0) {
	        global.dialogo_on = true;
	        dialogo = dialogo_4;
	        startDialogue(dialogo);
	    }
	
		if (dialogo_final != 0 && primeiro_terminado && !global.dialogo_on) {
	        global.dialogo_on = true;
	        dialogo = dialogo_final;
	        startDialogue(dialogo);
			if (room_atual == 1) global.dialogo_acabou_elfo1 = true;
			else if (room_atual == 2) global.dialogo_acabou_elfo2 = true;
			if (dialogo_trocou) {
				dialogo_trocou = false;
			}
	    }
	}




