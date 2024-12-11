/// @description Código atualizado para limitar a área de caça do inimigo
// Inicializa o tempo de estado e variáveis de movimento
tempo_estado = game_get_speed(gamespeed_fps) * 3;
timer_estado = tempo_estado;

move_x = 0;
move_y = 0;

// Define os limites da área de movimentação
limite_cima = y - 32;
limite_baixo = y + 32;
limite_esquerda = x - 32;
limite_direita = x + 32;

// Herda o evento pai
event_inherited();

// Criação dos estados
estado_hunt = new estado();
alvo = obj_player;

#region estado_idle

estado_idle.inicia = function() {
    // Define a sprite
    sprite_index = spr_mushroom_orange_idle;
    image_index = 0;

    // Reseta o timer do estado
    timer_estado = tempo_estado;
};

estado_idle.roda = function() {
    // Diminui o timer do estado
    timer_estado--;

    var _tempo = irandom(timer_estado);

    if (_tempo <= 0) {
        // Escolhe o próximo estado (maior chance de continuar no idle)
        var _estado_novo = choose(estado_walk, estado_walk, estado_idle);
        troca_estado(_estado_novo);
    }
};

#endregion

#region estado_walk

estado_walk.inicia = function() {
    sprite_index = spr_mushroom_orange_walk;
    image_index = 0;

    // Reseta o timer do estado
    timer_estado = tempo_estado;

    // Escolhe velocidades aleatórias para movimentação
    move_x = random_range(-0.6, 0.6);
    move_y = random_range(-0.6, 0.6);
};

estado_walk.roda = function() {
    if (instance_exists(obj_player)) {
        alvo = obj_player.id;
    } else {
        alvo = noone;
        troca_estado(estado_idle);
    }

    // Movimenta-se com colisão
    move_and_collide(move_x, move_y, obj_Colisor);

    // Verifica os limites e impede que saia da área delimitada
    if (x > limite_direita) {
        x = limite_direita;  // Ajusta posição
        move_x = -abs(move_x); // Inverte direção
    } else if (x < limite_esquerda) {
        x = limite_esquerda;
        move_x = abs(move_x);
    }

    if (y > limite_baixo) {
        y = limite_baixo;
        move_y = -abs(move_y);
    } else if (y < limite_cima) {
        y = limite_cima;
        move_y = abs(move_y);
    }

    // Altera escala horizontal para dar a impressão de "olhar" na direção do movimento
    image_xscale = sign(move_x) == 0 ? 1 : sign(move_x);

    // Persegue o jogador se estiver próximo
    if (distance_to_object(obj_player) <= 16) {
        xscale = sign(alvo.x - x);
        mp_potential_step_object(alvo.x, alvo.y, 1, obj_Colisor);
    }

    // Diminui o timer do estado
    timer_estado--;

    var _tempo = irandom(timer_estado);

    if (_tempo <= 0) {
        // Alterna entre os estados com maior chance de ir para idle
        var _estado_novo = choose(estado_idle, estado_walk, estado_idle);
        troca_estado(_estado_novo);
    }
};

#endregion

// Inicia o estado inicial
inicia_estado(estado_idle);
