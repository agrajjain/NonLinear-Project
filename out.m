function [ h ] = out( x )
%Output of the system

Dimensions
phi=(r/(2*b))*(x(3)-x(4));
h1=x(1)+(lv/2+L)*cos(phi);
h2=x(2)+(lv/2+L)*sin(phi);
h3=l1*cos(x(5))+l2*cos(x(5)+x(6));
h4=l1*sin(x(5))+l2*sin(x(5)+x(6));

h=[h1;h2;h3;h4];
end

