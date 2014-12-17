function [ yRef, yDRef, yDDRef ] = Reference( t )
% Generate desired reference tracectory and it's derivatives
Dimensions 

yRef=zeros(4,1);
yDRef=zeros(4,1);
yDDRef=zeros(4,1);

% yRef(1)=6*cos(t);
% yDRef(1)=-6*sin(t);
% yDDRef(1)=-6*cos(t);
%
% yRef(2)=6*sin(t);
% yDRef(2)=6*cos(t);
% yDDRef(2)=-6*sin(t);


if t<5
    yRef(1)=t;
    yDRef(1)=1;
    yRef(4)=(l1+l2)/2+0.5*sin(t);
    yDRef(4)=cos(t);
    yDDRef(4)=-sin(t);
elseif t<15
    yRef(1)=10-t;
    yDRef(1)=-1;
    yRef(4)=(l1+l2)/2+0.5*sin(10-t);
    yDRef(4)=-cos(10-t);
    yDDRef(4)=-sin(10-t);
else
    yRef(1)=-20+t;
    yDRef(1)=1;
    yRef(4)=(l1+l2)/2+0.5*sin(-20+t);
    yDRef(4)=cos(-20+t);
    yDDRef(4)=-sin(-20+t);
end

%yRef(4)=;
 


end

