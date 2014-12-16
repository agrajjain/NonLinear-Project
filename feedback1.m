function [ tau ] = feedback1( x,u )
%First level Non linear state feedback

Dimensions

S =[ (r*cos((r*(x(3) - x(4)))/(2*b)))/2, (r*cos((r*(x(3) - x(4)))/(2*b)))/2; (r*sin((r*(x(3) - x(4)))/(2*b)))/2, (r*sin((r*(x(3) - x(4)))/(2*b)))/2;                              1,                              0;                              0,                              1];
eta=[x(7);x(8)];
MV =[ m - m2*(l1*sin((2*b*x(5) + x(3)*r - x(4)*r)/(2*b)) + l2*sin((2*b*x(5) + 2*b*x(6) + x(3)*r - x(4)*r)/(2*b))) - l1*m1*sin((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b), l2*m2*cos((2*b*x(5) + 2*b*x(6) + x(3)*r - x(4)*r)/(2*b)) + l1*m1*cos((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b) + l1*m2*cos((2*b*x(5) + x(3)*r - x(4)*r)/(2*b)), ((2*m1*r*l1^2)/3 + (lv*m1*r*cos(x(5))*l1)/4)/b + (m2*r*(6*l1^2 + 12*cos(x(6))*l1*l2 + 3*lv*cos(x(5))*l1 + 8*l2^2 + 3*lv*cos((2*b^2*x(5) + 2*b^2*x(6))/(2*b^2))*l2))/(12*b), - ((2*m1*r*l1^2)/3 + (lv*m1*r*cos(x(5))*l1)/4)/b - (m2*r*(6*l1^2 + 12*cos(x(6))*l1*l2 + 3*lv*cos(x(5))*l1 + 8*l2^2 + 3*lv*cos((2*b^2*x(5) + 2*b^2*x(6))/(2*b^2))*l2))/(12*b);                                                                                               -l2*m2*sin((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b),                                                                                         m + l2*m2*cos((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b),                                                                                   (l2*m2*r*(8*l2 + 6*l1*cos(x(6)) + 3*lv*cos((2*b^2*x(5) + 2*b^2*x(6))/(2*b^2))))/(12*b),                                                                                    -(l2*m2*r*(8*l2 + 6*l1*cos(x(6)) + 3*lv*cos((2*b^2*x(5) + 2*b^2*x(6))/(2*b^2))))/(12*b);                                                                                                                                                   0,                                                                                                                                                0,                                                                                                                                                             Ic^2 + Iw,                                                                                                                                                                   -Ic^2;                                                                                                                                                   0,                                                                                                                                                0,                                                                                                                                                                 -Ic^2,                                                                                                                                                               Ic^2 + Iw];
Rv =[ - m2*(l1*sin((2*b*x(5) + x(3)*r - x(4)*r)/(2*b)) + l2*sin((2*b*x(5) + 2*b*x(6) + x(3)*r - x(4)*r)/(2*b))) - l1*m1*sin((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b),          -l2*m2*sin((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b);  l2*m2*cos((2*b*x(5) + 2*b*x(6) + x(3)*r - x(4)*r)/(2*b)) + l1*m1*cos((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b) + l1*m2*cos((2*b*x(5) + x(3)*r - x(4)*r)/(2*b)),           l2*m2*cos((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b);         (m2*r*(6*l1^2 + 12*cos(x(6))*l1*l2 + 3*lv*cos(x(5))*l1 + 8*l2^2 + 3*lv*cos(x(5) + x(6))*l2))/(12*b) + (l1*m1*r*(8*l1 + 3*lv*cos(x(5))))/(12*b),  (l2*m2*r*(8*l2 + 3*lv*cos(x(5) + x(6)) + 6*l1*cos(x(6))))/(12*b);       - (m2*r*(6*l1^2 + 12*cos(x(6))*l1*l2 + 3*lv*cos(x(5))*l1 + 8*l2^2 + 3*lv*cos(x(5) + x(6))*l2))/(12*b) - (l1*m1*r*(8*l1 + 3*lv*cos(x(5))))/(12*b), -(l2*m2*r*(8*l2 + 3*lv*cos(x(5) + x(6)) + 6*l1*cos(x(6))))/(12*b)];
Cv =[ (l2*m2*x(9)*x(8)*r*cos((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b) - l1*m2*x(9)^2*cos((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b) - l2*m2*x(9)^2*cos((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b) - l2*m2*x(10)^2*cos((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b) - 2*l2*m2*x(9)*x(10)*cos((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b) - (l2*m2*x(9)*x(7)*r*cos((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b) - (l2*m2*x(10)*x(7)*r*cos((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b) - l1*m1*x(9)^2*cos((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b) + (l2*m2*x(10)*x(8)*r*cos((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b) - (l1*m1*x(9)*x(7)*r*cos((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b) + (l1*m1*x(9)*x(8)*r*cos((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b) - (l1*m2*x(9)*x(7)*r*cos((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b) + (l1*m2*x(9)*x(8)*r*cos((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b); (l2*m2*x(9)*x(8)*r*sin((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b) - l1*m2*x(9)^2*sin((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b) - l2*m2*x(9)^2*sin((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b) - l2*m2*x(10)^2*sin((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b) - 2*l2*m2*x(9)*x(10)*sin((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b) - (l2*m2*x(9)*x(7)*r*sin((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b) - (l2*m2*x(10)*x(7)*r*sin((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b) - l1*m1*x(9)^2*sin((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b) + (l2*m2*x(10)*x(8)*r*sin((b*x(5) + b*x(6) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b) - (l1*m1*x(9)*x(7)*r*sin((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b) + (l1*m1*x(9)*x(8)*r*sin((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b) - (l1*m2*x(9)*x(7)*r*sin((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b) + (l1*m2*x(9)*x(8)*r*sin((b*x(5) + (x(3)*r)/2 - (x(4)*r)/2)/b))/(2*b);                                                                                                                                                                                                                                                                                                             (lv*m2*x(9)*x(8)*r^2*(l2*sin(x(5) + x(6)) + l1*sin(x(5))))/(8*b^2) - (l2*m2*x(10)^2*r*(lv*sin(x(5) + x(6)) + 2*l1*sin(x(6))))/(4*b) - (lv*m2*x(9)*x(7)*r^2*(l2*sin(x(5) + x(6)) + l1*sin(x(5))))/(8*b^2) - (lv*m2*x(9)^2*r*(l2*sin(x(5) + x(6)) + l1*sin(x(5))))/(4*b) - (l2*m2*x(10)*x(7)*r^2*(lv*sin(x(5) + x(6)) + 2*l1*sin(x(6))))/(8*b^2) + (l2*m2*x(10)*x(8)*r^2*(lv*sin(x(5) + x(6)) + 2*l1*sin(x(6))))/(8*b^2) - (l1*lv*m1*x(9)^2*r*sin(x(5)))/(4*b) - (l2*m2*x(9)*x(10)*r*(lv*sin(x(5) + x(6)) + 2*l1*sin(x(6))))/(2*b) - (l1*lv*m1*x(9)*x(7)*r^2*sin(x(5)))/(8*b^2) + (l1*lv*m1*x(9)*x(8)*r^2*sin(x(5)))/(8*b^2);                                                                                                                                                                                                                     (lv*m2*x(9)^2*r*(l2*sin(x(5) + x(6)) + l1*sin(x(5))))/(4*b) + (l2*m2*x(10)^2*r*(lv*sin(x(5) + x(6)) + 2*l1*sin(x(6))))/(4*b) + (lv*m2*x(9)*x(7)*r^2*(l2*sin(x(5) + x(6)) + l1*sin(x(5))))/(8*b^2) - (lv*m2*x(9)*x(8)*r^2*(l2*sin(x(5) + x(6)) + l1*sin(x(5))))/(8*b^2) + (l2*m2*x(10)*x(7)*r^2*(lv*sin(x(5) + x(6)) + 2*l1*sin(x(6))))/(8*b^2) - (l2*m2*x(10)*x(8)*r^2*(lv*sin(x(5) + x(6)) + 2*l1*sin(x(6))))/(8*b^2) + (l1*lv*m1*x(9)^2*r*sin(x(5)))/(4*b) + (l2*m2*x(9)*x(10)*r*(lv*sin(x(5) + x(6)) + 2*l1*sin(x(6))))/(2*b) + (l1*lv*m1*x(9)*x(7)*r^2*sin(x(5)))/(8*b^2) - (l1*lv*m1*x(9)*x(8)*r^2*sin(x(5)))/(8*b^2)];
Cr = [x(9)^2*((m1*sin(2*x(5))*l1^2)/3 + (m2*sin(2*x(5) + 2*x(6))*l2^2)/3) + (l2^2*m2*x(10)^2*sin(2*x(5) + 2*x(6)))/3 + (lv*r^2*(x(7) - x(8))^2*(l1*m1*sin(x(5)) + l1*m2*sin(x(5)) + l2*m2*sin(x(5) + x(6))))/(8*b^2) + (2*l2^2*m2*x(9)*x(10)*sin(2*x(5) + 2*x(6)))/3 - (l1*l2*m2*x(10)*r*sin(x(6))*(x(7) - x(8)))/(2*b);                                                                                                                              (l2^2*m2*sin(2*x(5) + 2*x(6))*(x(9) + x(10))^2)/3 + (l2*m2*r^2*(lv*sin(x(5) + x(6)) + 2*l1*sin(x(6)))*(x(7) - x(8))^2)/(8*b^2) + (l1*l2*m2*x(9)*r*sin(x(6))*(x(7) - x(8)))/(2*b)];
Rr=Rv';
SDot =[ -(r^2*sin((r*(x(3) - x(4)))/(2*b))*(x(7) - x(8)))/(4*b), -(r^2*sin((r*(x(3) - x(4)))/(2*b))*(x(7) - x(8)))/(4*b);  (r^2*cos((r*(x(3) - x(4)))/(2*b))*(x(7) - x(8)))/(4*b),  (r^2*cos((r*(x(3) - x(4)))/(2*b))*(x(7) - x(8)))/(4*b);                                               0,                                               0;                                               0,                                               0];
Mr =[ (4*l1^2*m1)/3 + l1^2*m2 + (4*l2^2*m2)/3 + 2*l1*l2*m2*cos(x(6)), (l2*m2*(4*l2 + 3*l1*cos(x(6))))/3;                              (l2*m2*(4*l2 + 3*l1*cos(x(6))))/3,                    (4*l2^2*m2)/3];

P=[S'*MV*S,S'*Rv;Rr*S,Mr];
ksi=[-S'*MV*SDot*eta-S'*Cv;-Cr-Rr*SDot*eta];

tau=(P*u-ksi);


end
