clc, clear

x_init=Initialize();

[t,x]=ode45('ode_func',[0 10],x_init);

Visualizer(t,x)
