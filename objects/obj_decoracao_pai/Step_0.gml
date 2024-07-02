/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Ajustando a profundidade
depth = -bbox_bottom

//Ficando transparente quando o player passar por tras de mim
//Checando se o player existe
if (transparente) 
{
	if (instance_exists(obj_Player))
	{
		//Checando se o player está em cima de mim
		if (obj_Player.y < y)
		{
			//Checando se o player esta mais ou menos atras de mim
			if (point_in_rectangle(obj_Player.x, obj_Player.y, bbox_left - 10, bbox_top - 25, bbox_right + 10, bbox_top))
			{
				//Ficando transparente
				image_alpha = lerp(image_alpha, 0.5, 0.1)
			}
			else 
			{
				image_alpha = lerp(image_alpha, 1, 0.1)
			}
		}
	}
}