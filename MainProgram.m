clc
clear all
tspan= [0:0.1:10]; n=5; 
b=5; vel_low=-1; vel_high=1; range=(vel_high-vel_low);
i=1;
while i<=4*n
    pin(i)=b*rand;
    pin(i+1)=vel_low+range*rand;
    i=i+2;
end

for i=1:4*n
    kin(i)=pin(i);
end

[t,k]= ode45(@ode_func,tspan,kin,[]);


figure
hold on 
for i=1:n
    plot(k(:,i*4-2),k(:,i*4-1))
end
xlabel('position along X')   
ylabel('position along Y');   
title('Robot position'); 
legend('Robot1','Robot2','Robot3','Robot4','Robot5');

% The following function is to get a plot of distance between extreme
% robots vs time. Which inturn shows the drag reduction.
%  for z=1:length(tspan)
%      len(z)=z;
% sumvel_x=0;
% sumvel_y=0;
% sumpos_x=0;
% sumpos_y=0;
% for i=1:n
%     sumvel_x=sumvel_x+k(z,i*4-2);
%     sumvel_y=sumvel_y+k(z,i*4);
%     sumpos_x=sumpos_x+k(z,i*4-3);
%     sumpos_y=sumpos_y+k(z,i*4-1);
% end
% avgpos_x=sumpos_x/n;
% avgpos_y=sumpos_y/n;
% avgvel_x=sumvel_x/n;
% avgvel_y=sumvel_y/n;
% 
% theta=acosd(dot([avgvel_x,avgvel_y],[avgpos_x+1,avgpos_y])/(norm([avgvel_x,avgvel_y])*norm([avgpos_x+1,avgpos_y])));
% 
% R=[cos(theta+pi/2) -sin(theta+pi/2) 0 ; sin(theta+pi/2) cos(theta+pi/2) 0 ; 0 0 1];
% Rot=[R',-R'*[avgpos_x;avgpos_y;0];[0 0 0 1]];
% for i=1:n
% P=Rot*[k(i*4-3);k(i*4-1);0;1];
% cam(1,i)=P(1,1);
% end
% dis(z)=max(cam(1,:))-min(cam(1,:));
%  end
% 
% figure
% plot(len,dis);
% xlabel('time')   
% ylabel('distance between extreme robots');   
% title('Plot of convergence'); 



