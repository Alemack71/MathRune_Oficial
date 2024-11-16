if (distance_to_object(obj_player) <= 10) {
    if (!global.dialogo_on && dialogo_concluido) {
        progresso++;
		dialogo_concluido = false;
    }

    // Verifica se o diálogo final foi concluído na sala atual
    var _dialogo_acabou_sala = false;
    if (room_atual == 1) {
        _dialogo_acabou_sala = global.dialogo_acabou_elfo1;
    } else if (room_atual == 2) {
        _dialogo_acabou_sala = global.dialogo_acabou_elfo2;
    }

    // Se o diálogo final já foi concluído, exibe apenas o diálogo final
    if (_dialogo_acabou_sala) {
        global.dialogo_on = true;
        dialogo = dialogo_final;
    } else {
        // Caso contrário, avança normalmente pelos diálogos
        if (progresso == 0) {
            global.dialogo_on = true;
            dialogo = dialogo; // Defina o primeiro diálogo
			primeiro_terminado = true;
			dialogo_concluido = true; //sinaliza que esse dialogo foi concluido e pode seguir para o próximo quando usuário clicar de novo
        } else if (progresso == 1 && dialogo_2 != 0) {
            global.dialogo_on = true;
            dialogo = dialogo_2;
			dialogo_concluido = true;
        } else if (progresso == 2 && dialogo_3 != 0) {
            global.dialogo_on = true;
            dialogo = dialogo_3;
			dialogo_concluido = true;
        } else if (progresso == 3 && dialogo_4 != 0) {
            global.dialogo_on = true;
            dialogo = dialogo_4;
			dialogo_concluido = true;
        } else if ((dialogo_final != 0 && !global.dialogo_on && primeiro_terminado) or (progresso == 4 && !global.dialogo_on)) {
            global.dialogo_on = true;
            dialogo = dialogo_final;

            // Marca o diálogo final como concluído para a sala atual
            if (room_atual == 1) {
                global.dialogo_acabou_elfo1 = true;
            } else if (room_atual == 2) {
                global.dialogo_acabou_elfo2 = true;
            }

            if (dialogo_trocou) {
                dialogo_trocou = false;
            }
			
        }
    }

    // Inicia o diálogo selecionado
    startDialogue(dialogo);
}