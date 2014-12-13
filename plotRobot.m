function plotRobot(T, diameter, heading_length, color)

radius = diameter/2;
% Outline
for dth = 0:0.1:2*pi
        rx1 = radius*cos(dth);
        ry1 = radius*sin(dth);
        rx2 = radius*cos(dth + 0.1);
        ry2 = radius*sin(dth + 0.1);
        
        p1 = T*[rx1;ry1;1];
        p2 = T*[rx2;ry2;1];
        
        line([p1(1),p2(1)],[p1(2),p2(2)],'Color',color);
end
 
% Heading Line
line([T(1,3),heading_length*T(1,1) + T(1,3)],[T(2,3), heading_length*T(2,1) + T(2,3)], 'Color', color);