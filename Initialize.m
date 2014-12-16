function [ x_init ] = Initialize()
%Initialize Initialization and Description of the state variables

x_init=zeros(10,1); %10 state variables

x_init(1)   =0; %   x Co-ordinate of Platform center (m)    
x_init(2)   =0; %   y Co-ordinate of Platform center (m)    
x_init(3)   =0; %   Angular position of right wheel (rad)
x_init(4)   =0; %   Angular position of left wheel  (rad)
x_init(5)   =-pi/4; %   Angular Position of Joint 1     (rad)
x_init(6)   =pi/2; %   Angular Position of Joint 2     (rad)
x_init(7)   =0; %   Angular velocit of right wheel  (rad/s)
x_init(8)   =0; %   Angular velocit of left wheel   (rad/s)
x_init(9)   =0; %   Angular Velocity of Joint 1     (rad/s)
x_init(10)  =0; %   Angular Velocity of Joint 2     (rad/s)

end

