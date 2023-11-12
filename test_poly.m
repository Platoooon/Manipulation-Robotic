function test_poly(rob, dt)
    qi=rob.theta(1,1:6);
    qf = [0 0.285 1.324 0 0.746 0];
    duree=3;
    Param = CalculePoly (rob, qi, qf, duree);

    nbPas = duree/dt;
    q=zeros(nbPas+1,6);
    v=zeros(nbPas+1,6);
    t = dt*(0:nbPas);
    
    for i=1:nbPas+1
        [q(i,:), v(i,:)]=CalculQ_Poly(rob, Param, t(i));
    end

    % Position des angles des moteurs q(i) en fonction du temps :
    figure(2);
    hold on
    for i=1:6
        plot(t, q(:,i));
    end
    
    % Vitesse en fonction du temps (forme trapèzoïdale) :   
    figure(3);
    hold on
    for i=1:6
        plot(t, v(:,i));
    end
    
    % Simulation du bras
    for i=1:nbPas+1
        rob.theta(1:6) = q(i,:);
        rob = Mise_a_Jour(rob);
    end
end