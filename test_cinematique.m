function test_cinematique(rob, dt)

    T = MGD(rob,length(rob.r));
    Pe = T(1:3,4);
    
    
    %Deplacement désiré
    Pos_Dep = [12; 2; 5];
    
    
    %Position et Orientation désirés
    Pd=[Pe(1) + Pos_Dep(1); Pe(2) + Pos_Dep(2); Pe(3) + Pos_Dep(3)];
    Ad = T(1:3,1:3);
    
    dimPe = 400;
    Pe = zeros(3, dimPe);

    for i = 1:dimPe
        rob = systemeBras(dt,rob,Pd,[0; 0; 0],Ad,[0;0;0]);
        T = MGD(rob,length(rob.r));
        Pe(1:3,i) = T(1:3,4);
        rob = Mise_a_Jour(rob);
    end

    line(Pe(1,:),Pe(2,:),Pe(3,:));
end