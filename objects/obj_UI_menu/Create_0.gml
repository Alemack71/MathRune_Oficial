pauseOption = ["Continuar", "Salvar e Sair", "Ajuda"];
pauseOptionSelected = 0;

x_visao = view_wport[0]+100;
y_visao = view_hport[0]+50;

root =  "highscores";
listener = FirebaseFirestore(root).Listener();

depth = -1000;