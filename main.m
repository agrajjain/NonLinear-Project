clc, clear all

x_init=Initialize();

[t,x]=ode45('ode_func',[0 20],x_init);



y=zeros(4,length(t));
yRef=zeros(4,length(t));
for i=1:length(t)
    y(:,i)=out(x(i,:));
    [yRef(:,i),~,~]=Reference(t(i,:));
end

Visualizer(t,x)
figure(2)
axis([-6 6 -1 2])
axis square
hold all
plot(y(1,:),y(2,:),'g')
plot(yRef(1,:),yRef(2,:),'k')
plot((y(1,:)+y(3,:)),(y(2,:)+y(4,:)),'g')
plot((yRef(1,:)+yRef(3,:)),(yRef(2,:)+yRef(4,:)),'k')
% figure
% plot(t,yd)
