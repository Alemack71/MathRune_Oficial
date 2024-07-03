startY = 50;
startX = 683;
draw_set_font(fnt_monospaced);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(startX, startY, "Digite seu nome")

startY = 240;
startX = 683;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_currentName);
draw_text(startX, startY, currentName);

draw_set_halign(fa_left);
draw_set_valign(fa_top)

startY = 420;
startX = 200;

draw_set_font(fnt_monospaced);
fontSize = 50;
var buffer = ceil(fontSize);

var charCount = 1;

for (var yy = 0; yy < yLetters; yy ++){
    for (var xx = 0; xx < xLetters; xx ++){
        
        var letter = a_letters[xx, yy];
        
        var drawX = startX + (xx * (fontSize * 2));
        var drawY = startY + (yy * (fontSize + buffer));
        
        draw_text(drawX, drawY, letter);
        draw_set_halign(fa_left); 
        draw_set_valign(fa_top); 
		
        if (xx == gridX && yy == gridY) 
            draw_sprite(spr_cursor, 0, drawX, drawY); 
        
        charCount ++;
    }
}
