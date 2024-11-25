#region INPUT 

if (keyboard_check_pressed(vk_left)) global.PL = true; else	global.PL = false;

if (keyboard_check_pressed(vk_right)) global.PR = true; else global.PR = false;

if (keyboard_check_pressed(vk_up)) global.PU = true; else global.PU = false;

if (keyboard_check_pressed(vk_down)) global.PD = true; else global.PD = false;

if (keyboard_check_pressed(vk_enter)) global.POK = true; else global.POK = false;

if (keyboard_check_pressed(vk_backspace)) global.PCAN = true; else global.PCAN = false;

if keyboard_check_pressed(ord("A")) {
	posicao = a_letters[0,0]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
if keyboard_check_pressed(ord("B")) {
	posicao = a_letters[1,0]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
if keyboard_check_pressed(ord("C")) {
	posicao = a_letters[2,0]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
if keyboard_check_pressed(ord("D")) {
	posicao = a_letters[3,0]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}

if keyboard_check_pressed(ord("E")) {
	posicao = a_letters[4,0]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
if keyboard_check_pressed(ord("F")) {
	posicao = a_letters[5,0]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("G")) {
	posicao = a_letters[6,0]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("H")) {
	posicao = a_letters[7,0]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("I")) {
	posicao = a_letters[8,0]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("J")) {
	posicao = a_letters[9,0]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("K")) {
	posicao = a_letters[0,1]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("L")) {
	posicao = a_letters[1,1]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}

	if keyboard_check_pressed(ord("M")) {
	posicao = a_letters[2,1]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("N")) {
	posicao = a_letters[3,1]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("O")) {
	posicao = a_letters[4,1]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("P")) {
	posicao = a_letters[5,1]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("Q")) {
	posicao = a_letters[6,1]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("R")) {
	posicao = a_letters[7,1]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("S")) {
	posicao = a_letters[8,1]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("T")) {
	posicao = a_letters[9,1]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("U")) {
	posicao = a_letters[0,2]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
		if keyboard_check_pressed(ord("V")) {
	posicao = a_letters[1,2]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("W")) {
	posicao = a_letters[2,2]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}	
	
	if keyboard_check_pressed(ord("X")) {
	posicao = a_letters[3,2]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("Y")) {
	posicao = a_letters[4,2]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(ord("Z")) {
	posicao = a_letters[5,2]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}
	
	if keyboard_check_pressed(vk_space) {
	posicao = a_letters[6,2]
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(posicao);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(posicao);
		}
	}	
	
if(keyboard_check_pressed(vk_escape)) {
	room_goto(rm_menu); 
}

#endregion

#region CURSOR
if (global.PL){
	if (gridX - 1) < 0 gridX = (xLetters - 1);
	else gridX --;
}

if (global.PR){
	if (gridX + 1) >= xLetters gridX = 0;
	else gridX ++;
}

if (global.PU){
	if (gridY -1) < 0 gridY = (yLetters - 1);
	else gridY --;
}

if (global.PD){
	if (gridY + 1) >= yLetters gridY = 0;
	else gridY ++;
}

#endregion

#region OK

if (global.POK){
	
	var newLetter = a_letters[gridX, gridY];
	
	if(newLetter == "OK"){
		if (string_length(currentName) >= 3)
		{
			global.novo_jogo = true; //trigger para 
			file_delete("save.sav"); //deleta o save antigo (isso não esta no botão play no inicio pq se o usuario quiser voltar ele vai querer continuar o jogo de antes, entao só deletaremos o save antigo quando ele ja tiver criado o novo personagem)
	        global.name = currentName;
	        InitializeParty(); // Inicializa o party com o nome definido
			InitializeDialogoComNome(); // Inicializa o script de dialogo com nome
			room_goto(rm_game_tutorial);
		}
	}
	
	if(newLetter != "OK"){
		if (string_length(currentName) == 0)
		{
			currentName += string_upper(newLetter);
		} else if (string_length(currentName) > 0)
		{
			currentName +=  string_lower(newLetter);
		}
	}
}

#endregion

#region CANCEL 

if (global.PCAN){
	letterCount = string_length(currentName);
	
	if (letterCount >= 1) currentName = string_delete(currentName, letterCount, 1);
}

#endregion

show_debug_message(string_length(currentName))