function rob = Mise_a_Jour( rob )

articu = zeros(3,5);

T = MGD(rob,2);
articu(:,2) = T(1:3,4);
T = MGD(rob,3);
articu(:,3) = T(1:3,4);
T = MGD(rob,4);
articu(:,4) = T(1:3,4);
T = MGD(rob,8);
articu(:,5) = T(1:3,4);

for i = 1:4
    set(rob.bras(i), 'xdata', [articu(1,i+1),articu(1,i)] , 'ydata', [articu(2,i+1),articu(2,i)] , 'zdata', [articu(3,i+1),articu(3,i)] );
end    

%Repères
P0=[0; 0; 0; 1];
R0=eye(4);
R0(4,:)=[1 1 1 1];     

for h = 1:8
    if h~=1
        Pt=MGD(rob,h-1)*P0;
        R=MGD(rob,h-1)*R0;
    else
        Pt=P0;
        R=R0; 
    end 
    
    factor=30;
    
    for i=1:3
        set(rob.axe(h,i), 'xdata',[R(1,i)+factor*(R(1,i)-Pt(1)),Pt(1)], 'ydata', [R(2,i)+factor*(R(2,i)-Pt(2)),Pt(2)], 'zdata', [R(3,i)+factor*(R(3,i)-Pt(3)),Pt(3)] );
    end
end

drawnow;

end

