//começa a apagar aos poucos
image_alpha -= 0.2;
if (vspeed < 0) image_alpha = 1.0;
if (y > ystart) vspeed = 0;
//quando desaparece a imagem completamente o objeto é destruído
if (image_alpha <=0) instance_destroy();