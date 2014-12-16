function [ h ] = outDer( x )
%Output of the system

Dimensions
phi=(r/(2*b))*(x(3)-x(4));
dphi=(r/(2*b))*(x(7)-x(8));
vx=(r*x(7)*cos(phi))/2 + (r*x(8)*cos(phi))/2;
vy=(r*x(7)*sin(phi))/2 + (r*x(8)*sin(phi))/2;
h1=vx+(lv/2+L)*sin(phi)*dphi;
h2=vy+(lv/2+L)*cos(phi)*dphi;
h3=-l1*sin(x(5))*x(9)-l2*sin(x(5)+x(6))*(x(9)+x(10));
h4=l1*cos(x(5))*x(9)+l2*cos(x(5)+x(6))*(x(9)+x(10));

h=[h1;h2;h3;h4];
end

