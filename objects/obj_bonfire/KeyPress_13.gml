if distance_to_object(obj_player) <= 5 && global.dialogo_on = false{
	
	if (global.party[0].hp < global.party[0].hpMax) || (global.party[0].mp < global.party[0].mpMax){
		if (global.key_bonfire == 3)
		{
			ativou = true;
			global.dialogo_on = true;
			startDialogue("Bonfire_Descanso");
			global.party[0].hp = global.party[0].hpMax;
			global.party[0].mp = global.party[0].mpMax;
		} else
		{
			global.dialogo_on = true;
			ativou = false;
			startDialogue("Bonfire_Insuficiente");
		}
	} else if (global.party[0].hp = global.party[0].hpMax) || (global.party[0].mp = global.party[0].mpMax){
		global.dialogo_on = true;
		ativou = false;
		startDialogue("Bonfire_Cheio");
	}
}