function Visualizer( t,x )
%Visualizer Simulation visualizer
%   Plot robot and arena

%Visualizer Parameters
max_dim = 10; %Overall Arena Dimension 


axis([-max_dim - 0.2, max_dim + 0.2, -max_dim - 0.2, max_dim + 0.2])
axis square

hold all
figure(1);

for n = 1:length(t)
    cla
    %%% PLOT ROBOT %%%
    % Robot Transformation Matrix
    Dimensions
    phi=(r/(2*b))*(x(n,3)-x(n,4));
    pose=[x(n,1) x(n,2) phi];
    manip=[x(n,5) x(n,6)];
    plotRobot(pose,manip,'k');
    xlabel('X axis');
    ylabel('Y axis');
    text(-max_dim,max_dim + 0.5,['t: ',num2str(t(n))]);
    pause(1/256);
end

end

