global.PL = false;
global.PR = false;
global.PO = false;
global.PD = false;

global.POK = false;
global.PCAN = false;

currentName = "";
limite = 9;

gridX = 9;
gridY = 2;

letterString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ   ";

xLetters = 10;
yLetters = 3;

charCount = 1;

for(var yy = 0; yy < yLetters; yy ++){
	for(var xx = 0; xx < xLetters; xx ++){
		if (charCount <= 29){
			a_letters[xx, yy] = string_char_at(letterString, charCount);
		}else{
			a_letters[xx,yy] = "OK"
		}
		charCount ++;
	}
}

posicao = a_letters[gridX, gridY];