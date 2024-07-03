#region INPUT 

if (keyboard_check_pressed(vk_left)) global.PL = true; else	global.PL = false;

if (keyboard_check_pressed(vk_right)) global.PR = true; else global.PR = false;

if (keyboard_check_pressed(vk_up)) global.PU = true; else global.PU = false;

if (keyboard_check_pressed(vk_down)) global.PD = true; else global.PD = false;

if (keyboard_check_pressed(vk_enter)) global.POK = true; else global.POK = false;

if (keyboard_check_pressed(vk_backspace)) global.PCAN = true; else global.PCAN = false;

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
	        global.name = currentName;
	        InitializeParty(); // Inicializa o party com o nome definido
			room_goto(rm_game);
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