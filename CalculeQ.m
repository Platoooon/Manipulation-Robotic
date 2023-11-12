function q=CalculeQ(robot,Param,t)

    q=zeros(1,6);
    
    for i=1:6   %moteurs
        if t<Param(13) && t>=0  %t<t1
            q(i)=Param(i)+0.5*Param(21+i)*t^2;
        end
        if t<Param(14) && t>=Param(13)
            q(i)=Param(i)  +  Param(15+i)*(t-Param(13))   +   0.5*Param(21+i)*Param(13)^2;
        end
        if t<=Param(15) && t>=Param(14)
            q(i)=Param(6+i)-0.5*Param(21+i)*(t-Param(15))^2 ;
        end
    end
    
end