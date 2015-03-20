function Mi=interes_al_reves(Mf,Y)
for mes=1:(Y*12)
    if Mf<=10000000
        Mi=Mf/(1+0.05);
        Mf=Mi;
    elseif (Mf>10000000 && Mf<=20000000) && ((Mf/(1+0.05)>10000000))
        Mi=Mf/(1+0.07);
        Mf=Mi;
    elseif (Mf/(1+0.05))<10000000
        Mi=Mf/(1+0.05);
        Mf=Mi;
    elseif Mf>20000000 && (Mf/(1+0.05)>20000000)
        Mi=Mf/(1+0.09);
        Mf=Mi;
    elseif (Mf/(1+0.05))<20000000
        Mi=Mf/(1+0.07);
        Mf=Mi;
    end
end
Mi
end