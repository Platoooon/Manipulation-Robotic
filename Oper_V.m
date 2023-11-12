function V = Oper_V(M)
    V = [0 -M(3) M(2); M(3) 0 -M(1); -M(2) M(1) 0];
end