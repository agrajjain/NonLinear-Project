% Store all constants related to the robot.
% All Numbers in MKS units
%-------------------Platform-----------------------
m   = 5;   %Mass of the platform
Ic  = 1.66;    %Moment of Inertia aroung Center
Iw  = 1.575e-5;    %Moment of Inertia of wheel and motor around axis of wheel.
b   = 0.5;    %width of the platform/2
r   = 0.07;    %radius of the wheel
lv  = 0;    %Length of Platform

%------------------Manipulator---------------------
m1  = 0.1;    %Mass of link 1
%m2  = 0.1;    %Mass of link 2
l1  = 1;  %Length of link 1
l2  =1.6;   %Length of link 2

opt=[-pi/4;pi/2]; %Optimal configuration of the Manipulator.
L=(lv/2)+hypot(l1,l2);