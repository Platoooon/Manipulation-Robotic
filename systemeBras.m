function robot = systemeBras(dt,robot,Pd,Pd_deriv,Ad,wd)
% Constantes du système:
Kp = 1;
Ko = 1;

qc = robot.theta;

T = MGD(robot,length(robot.r));
Pe = T(1:3,4);
Ae = T(1:3,1:3);

    %%%%%%%%%%%  SYSTEME BOUCLE POSITION/ORIENTATION  %%%%%%%%%%%
    Eps_P = Pd-Pe;
    Eps_O = 0.5*(cross(Ae(:,1),Ad(:,1)) + cross(Ae(:,2),Ad(:,2)) + cross(Ae(:,3),Ad(:,3)));
    L = -0.5*(Oper_V(Ae(:,1))* Oper_V(Ad(:,1)) + Oper_V(Ae(:,2))*Oper_V(Ad(:,2)) + Oper_V(Ae(:,3))*Oper_V(Ad(:,3)));

    dPe = Eps_P*Kp + Pd_deriv;
    we = inv(L)*(Eps_O * Ko + (wd' * L')');
    Vitesse = [dPe;we];
    
    J = Jacobienne(Pe,robot);
    Jplus = pinv(J);
    
    dq_phi = Jplus*Vitesse;
    
    for k = 1:6
        if dq_phi(k,1) > robot.kv_max(k)
            dq_phi(k,1) = robot.kv_max(k);
        end
        qc(k) = qc(k) + dq_phi(k,1)*dt;
    end

    %Commande sur qc => q
    
    % q après réalisation commande
    for i=1:6
        if(qc(i) < robot.qMax(i,1) || qc(i) > robot.qMax(i,2))
            return
        end
    end
    
    robot.theta=qc;


    
   

end 