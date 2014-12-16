function plotRobot(pose,arm, color)

%Load Robot Dimensions
Dimensions
lv=2;
%Calculate Transformation matrices
T1 =[ cos(arm(1) + pose(3)), -sin(arm(1) + pose(3)), pose(1) + l1*cos(arm(1) + pose(3)) + (lv*cos(pose(3)))/2; sin(arm(1) + pose(3)),  cos(arm(1) + pose(3)), pose(2) + l1*sin(arm(1) + pose(3)) + (lv*sin(pose(3)))/2;                                0,                                 0,                                                                             1];
 
T2 =[ cos(arm(1) + arm(2) + pose(3)), -sin(arm(1) + arm(2) + pose(3)), pose(1) + l1*cos(arm(1) + pose(3)) + (lv*cos(pose(3)))/2 + l2*cos(arm(1) + arm(2) + pose(3)); sin(arm(1) + arm(2) + pose(3)),  cos(arm(1) + arm(2) + pose(3)), pose(2) + l1*sin(arm(1) + pose(3)) + (lv*sin(pose(3)))/2 + l2*sin(arm(1) + arm(2) + pose(3));                                      0,                                       0,                                                                                                                         1];

Tv =[ cos(pose(3)), -sin(pose(3)), pose(1) + (lv*cos(pose(3)))/2; sin(pose(3)),  cos(pose(3)), pose(2) + (lv*sin(pose(3)))/2;                          0,                           0,                                       1];

%Vertices for platform
ver1=Tv*[lv/2;b;1];
ver2=Tv*[lv/2;-b;1];
ver3=Tv*[-lv/2;-b;1];
ver4=Tv*[-lv/2;b;1];

%Plot platform
plot(...
[ver1(1),ver2(1),ver3(1),ver4(1),ver1(1)],...
[ver1(2),ver2(2),ver3(2),ver4(2),ver1(2)], 'Color', color);

%Arms
ver1=Tv*[0;0;1];
ver2=T1*[0;0;1];
ver3=T2*[0;0;1];

line([ver1(1),ver2(1)],[ver1(2),ver2(2)],'Color', color);
line([ver2(1),ver3(1)],[ver2(2),ver3(2)],'Color', color);

%Joints
plot(ver1(1),ver1(2),'Color', color, 'Marker', 'o','MarkerSize',2);
plot(ver2(1),ver2(2),'Color', color, 'Marker', 'o','MarkerSize',2);
plot(ver3(1),ver3(2),'Color', color, 'Marker', 'o','MarkerSize',2);
