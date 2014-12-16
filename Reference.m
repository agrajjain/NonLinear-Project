function [ yRef, yDRef, yDDRef ] = Reference( t )
% Generate desired reference tracectory and it's derivatives
Dimensions 

yRef=zeros(4,1);
yDRef=zeros(4,1);
yDDRef=zeros(4,1);

   yRef(1)=6*cos(t);
   yDRef(1)=-6*sin(t);
   yDDRef(1)=-6*cos(t);
  
   yRef(2)=6*sin(t);
   yDRef(2)=6*cos(t);
   yDDRef(2)=-6*sin(t);

 yRef(3)=(l1+l2)/2;
 
 yRef(4)=sin(t);
 yDRef(4)=cos(t);
 yDDRef(4)=-sin(t);

end

