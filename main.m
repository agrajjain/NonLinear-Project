clc, clear

x_init=Initialize();

[t,x]=ode45('ode_func',[0 20],x_init);

Visualizer(t,x)

y=zeros(4,length(x));
yd=zeros(4,length(x));
for i=1:length(x)
    y(:,i)=out(x(i,:));
    yd(:,i)=outDer(x(i,:));
end

figure
plot(t,y)
figure
plot(t,yd)
