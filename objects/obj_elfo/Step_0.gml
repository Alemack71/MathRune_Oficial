/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!instance_exists(obj_textbox)) {
	global.dialogo_on = false;
}

if (room_atual == 1)
{
	if (global.dialogo_acabou_elfo1 == false)
	{
		instance_create_layer(x, y -24, "Instances", obj_exclamacao);	
	} else {
		instance_destroy(obj_exclamacao);	
		dialogo = dialogo_final;
	}
}


if (room_atual == 2)
{
	if (global.dialogo_acabou_elfo2 == false)
	{
		instance_create_layer(x, y -24, "Instances", obj_exclamacao);	
	} else {
		instance_destroy(obj_exclamacao);	
		dialogo = dialogo_final;
	};
	
	if (global.key_slimeg == 3)
	{	
		dialogo_2 = "Fatores_Multiplos";
	};
	
	if (global.key_slimeg == 3 && global.key_slimeb == 3)
	{	
		dialogo_final = "Finalizacao_floresta_1";
		
		if (!global.dialogo_acabou_elfo2) {
			dialogo_trocou = true;
		} else {
			dialogo_trocou = false;
		}
	
		if (dialogo_trocou)
		{
			instance_create_layer(x, y -24, "Instances", obj_exclamacao);
		} else if (!dialogo_trocou)
		{
			instance_destroy(obj_exclamacao);	
		}
	}
}

if (room_atual == 3)
{
	if (global.dialogo_acabou_elfo3 == false)
	{
		instance_create_layer(x, y -24, "Instances", obj_exclamacao);	
	} else {
		instance_destroy(obj_exclamacao);	
		dialogo = dialogo_final;
	};
	
	if (global.key_mushroomo == 4)
	{	
		progresso = 1;
		dialogo_2 = "Radiciacao";
	};
	
	if (global.key_mushroomo == 4 && global.key_mushroomp == 4)
	{	
		progresso = 4;
		dialogo_final = "Finalizacao_floresta_2";
		
		if (!global.dialogo_acabou_elfo3) {
			dialogo_trocou = true;
		} else {
			dialogo_trocou = false;
		}
	
		if (dialogo_trocou)
		{
			instance_create_layer(x, y -24, "Instances", obj_exclamacao);
		} else if (!dialogo_trocou)
		{
			instance_destroy(obj_exclamacao);	
		}
	}
}

if (room_atual == 5)
{
	if (global.dialogo_acabou_elfo5 == false)
	{
		instance_create_layer(x, y -24, "Instances", obj_exclamacao);	
	} else {
		instance_destroy(obj_exclamacao);	
		dialogo = dialogo_final;
	};
	
	if (global.key_batd == 3)
	{	
		progresso = 1;
		dialogo_2 = "Sistemas_Equacoes";
	};
	
	if (global.key_batd == 3 && global.key_skeleton_1 == 3)
	{	
		progresso = 4;
		dialogo_final = "Finalizacao_caverna_1";
		
		if (!global.dialogo_acabou_elfo5) {
			dialogo_trocou = true;
		} else {
			dialogo_trocou = false;
		}
	
		if (dialogo_trocou)
		{
			instance_create_layer(x, y -24, "Instances", obj_exclamacao);
		} else if (!dialogo_trocou)
		{
			instance_destroy(obj_exclamacao);	
		}
	}
}

if (room_atual == 6)
{
	if (global.dialogo_acabou_elfo6 == false)
	{
		instance_create_layer(x, y -24, "Instances", obj_exclamacao);	
	} else {
		instance_destroy(obj_exclamacao);	
		dialogo = dialogo_final;
	};
	
	if (global.key_batr == 3)
	{	
		progresso = 1;
		dialogo_2 = "Equacao_Segundo_Grau";
	};
	
	if (global.key_batr == 3 && global.key_skeleton_2 == 3)
	{	
		progresso = 4;
		dialogo_final = "Finalizacao_caverna_2";
		
		if (!global.dialogo_acabou_elfo6) {
			dialogo_trocou = true;
		} else {
			dialogo_trocou = false;
		}
	
		if (dialogo_trocou)
		{
			instance_create_layer(x, y -24, "Instances", obj_exclamacao);
		} else if (!dialogo_trocou)
		{
			instance_destroy(obj_exclamacao);	
		}
	}
}

if (room_atual == 8)
{
	if (global.dialogo_acabou_elfo8 == false)
	{
		instance_create_layer(x, y -24, "Instances", obj_exclamacao);	
	} else {
		instance_destroy(obj_exclamacao);	
		dialogo = dialogo_final;
	};
	
	if (global.key_knight_1 == 3)
	{	
		progresso = 1;
		dialogo_2 = "Porcentagem";
	};
	
	if (global.key_knight_1 == 3 && global.key_mage == 3)
	{	
		progresso = 2;
		dialogo_2 = "RegraDeTres";
	};
	
	if (global.key_knight_1 == 3 && global.key_mage == 3 && global.key_knight_2 == 3)
	{	
		progresso = 4;
		dialogo_final = "Finalizacao_masmorra_1";
		
		if (!global.dialogo_acabou_elfo8) {
			dialogo_trocou = true;
		} else {
			dialogo_trocou = false;
		}
	
		if (dialogo_trocou)
		{
			instance_create_layer(x, y -24, "Instances", obj_exclamacao);
		} else if (!dialogo_trocou)
		{
			instance_destroy(obj_exclamacao);	
		}
	}
}

if (room_atual == 9)
{
	if (global.dialogo_acabou_elfo9 == false)
	{
		instance_create_layer(x, y -24, "Instances", obj_exclamacao);	
	} else {
		instance_destroy(obj_exclamacao);	
		dialogo = dialogo_final;
	}
}


show_debug_message("progresso:" + string(progresso));
show_debug_message("Elfo 6:" + string(global.dialogo_acabou_elfo6));
show_debug_message("Keys:" + string(global.key_slimeb));
show_debug_message("Keys:" + string(global.key_slimeg));
