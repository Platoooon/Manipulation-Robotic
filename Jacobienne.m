function Jacob = Jacobienne(P,rob)
    n=length(rob.r);
    
    for j=1:n
        T=MGD(rob,j);
        z(:,j)=T(1:3,3);
        OP(:,j)=P-T(1:3,4);
        Jacob(:,j)=[cross(z(:,j),OP(:,j));z(:,j)];
    end
end