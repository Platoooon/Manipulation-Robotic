clc
clear

hold on
figure(1);
axis([-100 700 -400 400 0 800]);

% Constantes et d�clarations :
dt=0.006;

rob = initRobot();


%%%%%%%%%%%%%%%%    TEST Commmande Trapeze    %%%%%%%%%%%%%%%%    
%test_trapeze(rob, dt);


%%%%%%%%%%%%%%%%    TEST Commmande Polynomiale    %%%%%%%%%%%%%%%% 
%test_poly(rob, dt);


%%%%%%%%%%%%%%%%    TEST Commande cin�matique    %%%%%%%%%%%%%%%%  
%test_cinematique(rob, dt);



%%%%%   D�placement TRAPEZE => Deplacement cart�sien(Commande cin�matique)  %%%%%%  
%test_Trapeze_Cine(rob, dt);




