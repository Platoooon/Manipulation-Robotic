function Param = CalculeTrapeze (robot, qi, qf, duree)
    for i=1:6
        if(qf(i) < robot.qMax(i,1) || qf(i) > robot.qMax(i,2))
            Param = -1*ones(1,27);     % on fixe ainsi t1 et tf à -1 cela permet de bloquer fonction CalculeQ
            return
        end
    end

    tf=zeros(1,6);
    t1=zeros(1,6);
    max_tf=0;
    j=0;
    
    kv_max = robot.kv_max;
    ka_max = robot.ka_max;
    
    new_kv=zeros(1,6);
    new_ka=zeros(1,6);
    
    not_possible=zeros(1,6);    %impossible de faire la commande en trapeze  pour moteur 1,2,3,4: qf-qi < 0.3630  moteur 5,6: qf-qi < 0.3413
    
    for i = 1:6
        if kv_max(i) <= sqrt(ka_max(i) * (qf(i)-qi(i)))      % vitesse max atteignable, accelération au max : forme trapeze
            tf (i) =((qf(i)-qi(i))/kv_max(i) + kv_max(i)/ka_max(i));
            t1 (i) = kv_max(i)/ka_max(i);
        else                                                % vitesse max inatteignable, accelération au max : forme inconnue
            not_possible(i)=1;
        end
        
        if max_tf < tf (i)
            max_tf = tf (i);
            j=i;
        end
    end

    if max_tf<duree   
        max_tf=duree;
    end
    
    max_t1=kv_max(j)/ka_max(j);
    t2=max_tf-max_t1;
    
    %changer les kv_max et ka_max pour les plus lents
    for i=1:6
        if not_possible(i) == 0
            new_kv(i)=kv_max(i)*(tf(i)-t1(i))/(max_tf-max_t1); %tf(i): ancien tf   max_tf: nouveau tf
            new_ka(i)=new_kv(i)/t1(i);
        else   %choisir un calcul convenable !!!!!!!!!!!!
            new_kv(i) = (qf(i)-qi(i)) / t2;
            new_ka(i)=new_kv(i)/max_t1;
        end
    end
    

    Param = [qi,qf,max_t1,t2,max_tf,new_kv,new_ka];
    
end