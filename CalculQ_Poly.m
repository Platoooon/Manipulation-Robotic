function [q,v]=CalculQ_Poly(robot, param, t)
    q=zeros(1,6); 
    v=zeros(1,6);

    for i=1:6
        % On ajuste ka pour vmax = kv, c'est à dire v(tf/2)=kv :
        ka = 6*(param(6+i)-param(i)) / (param(13)^2);
        
        a0 = param(i);
        a2 = ka*0.5;
        a3 = -ka/(3*param(13));
        
        q(1,i) = a0 + a2 * t^2 + a3 * t^3;
        v(1,i) = 2*a2 * t + 3*a3 * t^2;  
    end
end