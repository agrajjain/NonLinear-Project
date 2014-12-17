function [ m_new ] = adaptation(x,tau,x_dot,m_old )

m_new=m_old;

step =0.05;


error_mid=norm(x_dot-SYSTEM(x,tau,m_old));
error_high=norm(x_dot-SYSTEM(x,tau,m_old+step));
error_low=norm(x_dot-SYSTEM(x,tau,m_old-step));

[~,var]=min([error_high,error_mid,error_low]);
switch var
    case 1
        m_new=m_old+step;
    case 2
        m_new=m_old;
    case 3
        m_new=m_old;
end

end

