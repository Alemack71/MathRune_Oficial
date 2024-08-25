/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Desenhando a barra de vida (display)
//regra de três pra definir o tamanho da barra
var _amount = (time / time_max) * timebar_w;

//formula para ter um valor fixo
var _amount_fixed = (time_max / time_max) * timebar_w;

//Subtraindo pela metade da largura da barra pra centralizar no meio
var _x1 = view_w / 2 - (timebar_w) / 2;
var _y1 = view_h / 2;
var _x2 = _x1 + _amount;
var _x2_fixed = _x1 + _amount_fixed;
var _y2 = _y1 + timebar_h;

//garantindo que a barra nao passe do negativo
if (time > 0) 
{
	if (time / time_max > 0.6) 
    {
        // Barra amarela quando acima de 60%
        color_1 = make_color_rgb(255, 255, 0);
    } 
    else if (time / time_max > 0.3) 
    {
        // Barra laranja quando entre 30% e 60%
        color_1 = make_color_rgb(255, 165, 0);
    } 
    else 
    {
        // Barra vermelha quando abaixo de 30%
        color_1 = make_color_rgb(255, 0, 64);
    }
	
	//Desenhando background barra
	draw_set_color(color_2);
	draw_rectangle(_x1,_y1,_x2_fixed,_y2,false);
	
	//Desenhando barra de tempo
	draw_set_color(color_1);
	draw_rectangle(_x1,_y1,_x2,_y2,false);
	
	//Desenhando borda
	draw_set_color(color_3);
	draw_rectangle(_x1,_y1,_x2_fixed,_y2,true);
}