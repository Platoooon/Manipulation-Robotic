clc
clear

hold on
figure(1);
axis([-100 700 -400 400 0 800]);

% Constantes et déclarations :
dt=0.006;

rob = initRobot();


%%%%%%%%%%%%%%%%    TEST Commmande Trapeze    %%%%%%%%%%%%%%%%    
%test_trapeze(rob, dt);


%%%%%%%%%%%%%%%%    TEST Commmande Polynomiale    %%%%%%%%%%%%%%%% 
%test_poly(rob, dt);


%%%%%%%%%%%%%%%%    TEST Commande cinématique    %%%%%%%%%%%%%%%%  
%test_cinematique(rob, dt);



%%%%%   Déplacement TRAPEZE => Deplacement cartésien(Commande cinématique)  %%%%%%  
%test_Trapeze_Cine(rob, dt);




