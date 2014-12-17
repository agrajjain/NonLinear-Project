function [ x_dot ] = ode_func( t,x )

persistent mass2
if(isempty(mass2))
	mass2 = 0.1;
end

tau=controller(t,x,mass2);

m_actual=1;
x_dot=SYSTEM(x,tau,m_actual);

mass2=adaptation(x,tau,x_dot,mass2)

end

