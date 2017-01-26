function dk= ode_func(t,k)
n= 5;
dk= zeros(n*4,1);

sumvel_x=0;
sumvel_y=0;
sumpos_x=0;
sumpos_y=0;
for i=1:n
    sumvel_x=sumvel_x+k(i*4-2);
    sumvel_y=sumvel_y+k(i*4);
    sumpos_x=sumpos_x+k(i*4-3);
    sumpos_y=sumpos_y+k(i*4-1);
end
avgpos_x=sumpos_x/n;
avgpos_y=sumpos_y/n;
avgvel_x=sumvel_x/n;
avgvel_y=sumvel_y/n;
for i=1:n
    theta(i)=acosd(dot([k(i*4-3)-avgpos_x,k(i*4-1)-avgpos_y],[avgvel_x,avgvel_y])/(norm([k(i*4-3)-avgpos_x,k(i*4-1)-avgpos_y]*norm([avgvel_x,avgvel_y]))));
end
for i=1:n
    dk(i*4-3)=k(i*4-2);
    dk(i*4-1)=k(i*4);
    l=0;m=0;
    for j=1:n
       if i~=j
        l=l-(k(i*4-2)-k(j*4-2));%-2/(k(i*4-3)-k(j*4-3))+1/(k(i*4-3)-k(j*4-3)).^2;%add this to include field Vij in the control law
        m=m-(k(i*4)-k(j*4));%-2/(k(i*4-1)-k(j*4-1))+1/(k(i*4-1)-k(j*4-1)).^2;%add this to include field Vij in the control law
       end
    end
    dk(i*4-2)=l;%-sin(2*(theta(i)));%add this to include field Hi in the control law
     dk(i*4)=m;%-sin(2*(theta(i)));%add this to include field Hi in the control law
    
end
