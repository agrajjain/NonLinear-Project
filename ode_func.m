function [ x_dot ] = ode_func( t,x )

%Outputs
 y=out(x);
 yDot=outDer(x);

%Reference
[yR,yDotR,yDDotR]=Reference(t);


%Controller
 v=staticFeedback(y, yDot, yR, yDotR, yDDotR);
 %v=[0;0;0;0];
 u=feedback2(x,v);
 %u=[0;0;0;0];
 tau=feedback1(x,u);

%tau(3)=0;
%tau(4)=0;
%tau=[0,0,1,0]';
x_dot=SYSTEM(x,tau);

end

