%% Machine LEarning Lecture 2
%% This code uses gradient descent approach for a two input features x=x0,x1,x2
%% Linear function h(x)=theta0+theta1*x
clear all
close all
%% create data set

%Target variable x2 depends on feature x1
x1=[0.5 2.3 2.9 4 5 7 8 9 11 15]; 
x2=[1.4 1.9 3.2 4.5 5.5 7.2 8.8 11 16 17];

figure (1)
subplot(2,1,1)
scatter(x1,x2,'LineWidth',8)
hold on
line(x1,x2)
title('Feature Crossplot');
xlabel('x1');
ylabel('x2');

%% Only varying slope
% while flag~=1
%     yp=m(i).*x1+c;
%     loss(i+1)=sum((x2-yp).^2);
%     dlossm(i+1)=sum(-2*(x2-yp));
%     ss(i+1)=dlossm(i+1)*0.1; %step size=dloss*learning rate
%     m(i+1)=m(i)-ss(i+1);
%     if(loss(i+1)<1)
%         flag=1;
%     end
%     hold on
%     subplot(2,1,2)
%     scatter(m(i+1),loss(i+1))
%     xlabel('slope')
%     ylabel('loss')
% 
%     i=i+1;
%     pause(1.0)
% end

%% Varying slope and intercept (Gradient Descent LR)
flag=0;
i=1;
c=0;
m=0.01;
while flag~=1
    yp=m(i).*x1+c(i); %prediction of target variable yp=mx+c
    loss(i+1)=sum((x2-yp).^2); %sum of all (x2-yp)^2 residuals
    dlossm(i+1)=sum(-2*(x2-yp)); %loss d/dslope*loss
    dlossc(i+1)=sum(-2*0.5*(x2-yp));%lossc d/dintercept*loss
    ssm(i+1)=dlossm(i+1)*0.01; %stepsizeslope=dloss*learning rate
    ssc(i+1)=dlossc(i+1)*0.01; %stepsizeintercept
    m(i+1)=m(i)-ssm(i+1); % slope update
    c(i+1)=c(i)-ssc(i+1); % intercept update
    if(loss(i+1)<15.2822) %tolerance 
        flag=1;
    end
    hold on
    subplot(2,1,2)
    scatter3(m(i+1),c(i+1),loss(i+1),'LineWidth',10)
    set(gca,'zscale','log')
    xlabel('slope')
    ylabel('intercept')
    zlabel('loss')
    title('Gradient Descent')
    hold on
    subplot(2,1,1)
    y2=m(i).*x1+c(i+1);
    scatter(x1,y2)
    line(x1,y2)

    i=i+1;
    pause(0.5)
end





