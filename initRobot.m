function rob = initRobot
%Paramètres DH
rob.theta=[0 0 0 0 0 0 pi 0];
rob.alpha=[0 -pi/2 0 -pi/2 pi/2 -pi/2 0 0];
rob.d=[0 0 265.69 30 0 0 0 0];
rob.r=[159 0 0 258 0 0 123 112];
%Limites angle articulations (qmax)
rob.qMax=[-pi pi; -pi/2 pi/2; -pi/2 3*pi/4; -pi pi; -pi/2 pi/2; -pi pi];
rob.kv_max=[3.3 3.3 3.3 3.3 3.2 3.2];
rob.ka_max=[30 30 30 30 30 30];


%Articulations:

articu = zeros(3,5);

T = MGD(rob,2);
articu(:,2) = T(1:3,4);
T = MGD(rob,3);
articu(:,3) = T(1:3,4);
T = MGD(rob,4);
articu(:,4) = T(1:3,4);
%T = MGD(rob,7)*Transl(0,0,112);  % Crayon dans le long de Z(repère 7)
T = MGD(rob,8);
articu(:,5) = T(1:3,4);

for i = 1:4
    rob.bras(i) = line([articu(1,i+1),articu(1,i)] , [articu(2,i+1),articu(2,i)] , [articu(3,i+1),articu(3,i)],'color','k');
end    


grid on
%_______________________________________________________________________________________________________

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
        switch i
            case 1
                color='r';
            case 2
                color='g';
            case 3
                color='b';
        end
        rob.axe(h,i)=line([R(1,i)+factor*(R(1,i)-Pt(1)),Pt(1)], [R(2,i)+factor*(R(2,i)-Pt(2)),Pt(2)], [R(3,i)+factor*(R(3,i)-Pt(3)),Pt(3)],'linewidth',2, 'color',color);
    end
end

drawnow;

end

