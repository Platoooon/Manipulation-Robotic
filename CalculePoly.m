function Param = CalculePoly(robot, qi, qf, duree)
    kv_max = robot.kv_max;
    ka_max = robot.ka_max;
    
    max_tf = duree;
    
    for i=1:6
        % On ajuste ka pour vmax = kv, c'est à dire v(tf/2)=kv :
        ka = 16*kv_max(i)^2 / (6*(qf(i)-qi(i)));
        
        if ka>ka_max(i)
            % Et si ka>ka_max => ka=ka_Max
            ka = ka_max(i);
        end
        
        tf = sqrt(6*(qf(i)-qi(i))/ka);
        
        if tf>max_tf
            max_tf = tf;
        end
    end
    
    Param = [qi,qf,max_tf];
end