function Visualizer( t,x )
%Visualizer Simulation visualizer
%   Plot robot and arena

%Visualizer Parameters
max_dim = 500; %Overall Arena Dimension 
HEADING_LENGTH = 2.5; %Length of Heading indicator
r_diameter = 2.5; %Diameter of robot symbol


axis([-max_dim - 0.2, max_dim + 0.2, -max_dim - 0.2, max_dim + 0.2])
axis square

hold all
figure(1);

for n = 1:length(t)
    cla
    %%% PLOT ROBOT %%%
    % Robot Transformation Matrix
    Dimensions
    th=(r/(2*b))*(x(n,3)-x(n,4));
    
    T = [cos(th),-sin(th), x(n,1);
         sin(th), cos(th), x(n,2);
           0,        0,     1];
       
    plotRobot(T, r_diameter, HEADING_LENGTH, 'k');
    xlabel('X axis');
    ylabel('Y axis');
    text(-max_dim,max_dim + 0.5,['t: ',num2str(t(n))]);
    pause(1/256);
end

end

