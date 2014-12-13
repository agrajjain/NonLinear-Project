function [ x_dot ] = ode_func( t,x )

tau=[1,1,0,0]';
x_dot=SYSTEM(x,tau);

end

