function CDM = Cdm(m,c,rob)
    CDM=zeros(4,1);
    M=sum(m);
    n=length(m);
    
    for i=1:n
        CDM=CDM+ 1/M*(m(i)*MGD(rob,i)*c(:,i));
    end
end
    
    