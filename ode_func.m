function [ x_dot ] = ode_func( t,x )

tau=[0,0,-10,0]';
x_dot=SYSTEM(x,tau);

end

