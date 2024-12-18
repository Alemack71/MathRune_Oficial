if (global.gamePaused){
	
	var keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	var keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	pauseOptionSelected += (keyDown - keyUp);
	if (pauseOptionSelected >= array_length(pauseOption)) pauseOptionSelected = 0;
	if (pauseOptionSelected < 0) pauseOptionSelected = array_length(pauseOption) -1;
	
	var keyActivate = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)
	if (keyActivate){
		switch (pauseOptionSelected){
			case 0: //Continue
			{
				global.gamePaused = false;
				with (all)
				{		
					gamePausedImageSpeed = image_speed
					image_speed = 0;
				}
			}break;
			case 1: // Save 
			{
				if(file_exists("save.sav"))file_delete("save.sav");
				ini_open("save.sav");
				ini_write_string("Player","nome",global.name);
				ini_write_real("Player","x_atual",obj_player.x);
				ini_write_real("Player","y_atual",obj_player.y);
				ini_write_real("Player","hp_atual",global.party[0].hp);
				ini_write_real("Player","mp_atual",global.party[0].mp);
				ini_write_real("Player","sala_atual", room);
				
				ini_write_real("Elfo","dialogo",global.dialogo_acabou_elfo1);
				ini_write_real("Elfo","dialogo2",global.dialogo_acabou_elfo2);
				ini_write_real("Elfo","dialogo3",global.dialogo_acabou_elfo3);
				ini_write_real("Elfo","dialogo5",global.dialogo_acabou_elfo5);
				ini_write_real("Elfo","dialogo6",global.dialogo_acabou_elfo6);
				ini_write_real("Elfo","dialogo8",global.dialogo_acabou_elfo8);
				ini_write_real("Elfo","dialogo9",global.dialogo_acabou_elfo9);
				
				ini_write_real("Rune","king_slime",global.coletou_runa1);
				ini_write_real("Rune","king_goblin",global.coletou_runa2);
				ini_write_real("Rune","king_demon",global.coletou_runa3);
				
				ini_write_real("Chave","0",global.key_bonfire);

				ini_write_real("Chave","1",global.key_slimeg);
				ini_write_real("Chave","2",global.key_slimeb);
				ini_write_real("Chave","3",global.key_mushroomo);
				ini_write_real("Chave","4",global.key_mushroomp);
				
				ini_write_real("Chave","5",global.key_slime_king);
			
				ini_write_real("Chave","6",global.key_batd);
				ini_write_real("Chave","7",global.key_skeleton_1);
				ini_write_real("Chave","8",global.key_batr);
				ini_write_real("Chave","9",global.key_skeleton_2);
				
				ini_write_real("Chave","10",global.key_goblin_king);
				
				ini_write_real("Chave","11",global.key_knight_1);
				ini_write_real("Chave","12",global.key_mage);
				ini_write_real("Chave","13",global.key_knight_2);
		
				ini_write_real("Chave","14",global.key_demon_king);
				
				ini_close();
				
				global.gamePaused = false;
				with (all)
				{		
					gamePausedImageSpeed = image_speed
					image_speed = 0;
				}
			}break;
			case 2: //Salva e vai para ajuda
			{
				if(file_exists("save.sav"))file_delete("save.sav");
				ini_open("save.sav");
				ini_write_string("Player","nome",global.name);
				ini_write_real("Player","x_atual",obj_player.x);
				ini_write_real("Player","y_atual",obj_player.y);
				ini_write_real("Player","hp_atual",global.party[0].hp);
				ini_write_real("Player","mp_atual",global.party[0].mp);
				ini_write_real("Player","sala_atual", room);
				
				ini_write_real("Elfo","dialogo",global.dialogo_acabou_elfo1);
				ini_write_real("Elfo","dialogo2",global.dialogo_acabou_elfo2);
				ini_write_real("Elfo","dialogo3",global.dialogo_acabou_elfo3);
				ini_write_real("Elfo","dialogo5",global.dialogo_acabou_elfo5);
				ini_write_real("Elfo","dialogo6",global.dialogo_acabou_elfo6);
				ini_write_real("Elfo","dialogo8",global.dialogo_acabou_elfo8);
				ini_write_real("Elfo","dialogo9",global.dialogo_acabou_elfo9);
				
				ini_write_real("Rune","king_slime",global.coletou_runa1);
				ini_write_real("Rune","king_goblin",global.coletou_runa2);
				ini_write_real("Rune","king_demon",global.coletou_runa3);
				
				ini_write_real("Chave","0",global.key_bonfire);

				ini_write_real("Chave","1",global.key_slimeg);
				ini_write_real("Chave","2",global.key_slimeb);
				ini_write_real("Chave","3",global.key_mushroomo);
				ini_write_real("Chave","4",global.key_mushroomp);
				
				ini_write_real("Chave","5",global.key_slime_king);
			
				ini_write_real("Chave","6",global.key_batd);
				ini_write_real("Chave","7",global.key_skeleton_1);
				ini_write_real("Chave","8",global.key_batr);
				ini_write_real("Chave","9",global.key_skeleton_2);
				
				ini_write_real("Chave","10",global.key_goblin_king);
				
				ini_write_real("Chave","11",global.key_knight_1);
				ini_write_real("Chave","12",global.key_mage);
				ini_write_real("Chave","13",global.key_knight_2);
		
				ini_write_real("Chave","14",global.key_demon_king);
				
				ini_close();
				with(obj_game_pause_and_bar) instance_destroy();
				instance_destroy(obj_player);
				instance_destroy();
				room_goto(rm_menu);	
				url_open("https://alemack71.github.io/MathRune_Oficial/");
			}break;
			case 3: // Save and Quit
			{
				if(file_exists("save.sav"))file_delete("save.sav");
				ini_open("save.sav");
				ini_write_string("Player","nome",global.name);
				ini_write_real("Player","x_atual",obj_player.x);
				ini_write_real("Player","y_atual",obj_player.y);
				ini_write_real("Player","hp_atual",global.party[0].hp);
				ini_write_real("Player","mp_atual",global.party[0].mp);
				ini_write_real("Player","sala_atual", room);
				
				ini_write_real("Elfo","dialogo",global.dialogo_acabou_elfo1);
				ini_write_real("Elfo","dialogo2",global.dialogo_acabou_elfo2);
				ini_write_real("Elfo","dialogo3",global.dialogo_acabou_elfo3);
				ini_write_real("Elfo","dialogo5",global.dialogo_acabou_elfo5);
				ini_write_real("Elfo","dialogo6",global.dialogo_acabou_elfo6);
				ini_write_real("Elfo","dialogo8",global.dialogo_acabou_elfo8);
				ini_write_real("Elfo","dialogo9",global.dialogo_acabou_elfo9);
				
				ini_write_real("Rune","king_slime",global.coletou_runa1);
				ini_write_real("Rune","king_goblin",global.coletou_runa2);
				ini_write_real("Rune","king_demon",global.coletou_runa3);
				
				ini_write_real("Chave","0",global.key_bonfire);

				ini_write_real("Chave","1",global.key_slimeg);
				ini_write_real("Chave","2",global.key_slimeb);
				ini_write_real("Chave","3",global.key_mushroomo);
				ini_write_real("Chave","4",global.key_mushroomp);
				
				ini_write_real("Chave","5",global.key_slime_king);
			
				ini_write_real("Chave","6",global.key_batd);
				ini_write_real("Chave","7",global.key_skeleton_1);
				ini_write_real("Chave","8",global.key_batr);
				ini_write_real("Chave","9",global.key_skeleton_2);
				
				ini_write_real("Chave","10",global.key_goblin_king);
				
				ini_write_real("Chave","11",global.key_knight_1);
				ini_write_real("Chave","12",global.key_mage);
				ini_write_real("Chave","13",global.key_knight_2);
		
				ini_write_real("Chave","14",global.key_demon_king);
				
				ini_close();
				with(obj_game_pause_and_bar) instance_destroy();
				instance_destroy(obj_player);
				instance_destroy();
				room_goto(rm_menu);	
			}
		}
	}
}
			
				