function plotRobot(pose,arm, color)


% Outline
% for dth = 0:0.1:2*pi
%         rx1 = radius*cos(dth);
%         ry1 = radius*sin(dth);
%         rx2 = radius*cos(dth + 0.1);
%         ry2 = radius*sin(dth + 0.1);
%         
%         p1 = T*[rx1;ry1;1];
%         p2 = T*[rx2;ry2;1];
%         
%         line([p1(1),p2(1)],[p1(2),p2(2)],'Color',color);
% end

Dimensions

body=plot(...
[pose(1)-lv     pose(1)+lv  pose(1)+lv  pose(1)-lv pose(1)-lv],...
[pose(2)-b    pose(2)-b pose(2)+b pose(2)+b pose(2)-b], 'Color', color);

rotate(body,[0 0 1],radtodeg(pose(3)),[pose(1) pose(2) 0]);

% Heading Line
%line([pose(1),heading_length*cos(pose(3)) + pose(1)],[pose(2), heading_length*sin(pose(3)) + pose(2)], 'Color', color);