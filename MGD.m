function T = MGD(rob,nb_dg_de_liberte)
    rob.theta(2:3) = rob.theta(2:3) + [-1.4576453 -0.898549163];

    T=zeros(4,4);
    Tp=eye(4);

    for j=1:nb_dg_de_liberte
        ca=cos(rob.alpha(j));
        sa=sin(rob.alpha(j));
        ct=cos(rob.theta(j));
        st=sin(rob.theta(j));
        
        T=Tp*[ct,-st,0,rob.d(j);ca*st,ca*ct,-sa,-rob.r(j)*sa;sa*st,ct*sa,ca,rob.r(j)*ca;0,0,0,1];
        Tp=T;
    end
end

