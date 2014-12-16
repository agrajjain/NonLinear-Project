function [ v ] = staticFeedback( y, yD, yRef, yDRef, yDDRef)
%Static feedback for trajectory tracking
%P is a 4x2 matrix with poles 
v=zeros(4,1);
A=[0,1;0,0];
B=[0;1];

%Parameters
Poles=[ -10, -10;...
        -10, -10;...
        -10, -10;...
        -10, -10];

Q=[100,0;...
    0,100];
R=0.01;
N=0;


for i=1:4
    z1=y(i)-yRef(i);
    z2=yD(i)-yDRef(i);
    z=[z1;z2];
    %K=acker(A,B,Poles(i,:));
    [K,~,~]=lqr(A,B,Q,R,N);
    v(i)=-K*z+yDDRef(i);
end
end