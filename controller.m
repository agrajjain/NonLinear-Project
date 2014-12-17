function [ tau ] = controller( t, x, mass)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

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
 tau=feedback1(x,u,mass);
 
end

