function test_Trapeze_Cine(rob, dt)   
% durant ce test nous allons positionner l'effecteur au niveau du sol avec une commande trapèzoïdale, 
% puis nous dessinons un trait avec la comande cinematique  
    
    % commande trapèzoïdale
    qi = rob.theta(1:6);
    qf = [0 0.285 1.324 0 0.746 0];
    duree = 3;
    Param = CalculeTrapeze (rob, qi, qf, duree);

    nbPas = duree/dt;
    q=zeros(nbPas+1,6);
    t = dt*(0:nbPas);


    for i=1:nbPas+1
        rob.theta(1:6) = CalculeQ(rob,Param,t(i)); 
        rob = Mise_a_Jour(rob);
    end

    
    % Dessine une ligne avec commande cinématique
    Pd=[400; 0; 0];
    Ad=[-1 0 0; 0 1 0; 0 0 -1];

    dimPe = 600;
    Pe = zeros(3, dimPe);

    for i = 1:dimPe
        rob = systemeBras(dt,rob,Pd,[0; 0; 0],Ad,[0;0;0]);
        T = MGD(rob,length(rob.r));
        Pe(1:3,i) = T(1:3,4);
        rob = Mise_a_Jour(rob);
    end

    line(Pe(1,:),Pe(2,:),Pe(3,:));
end