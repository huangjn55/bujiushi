function [theta_1_dot,theta_2_dot,theta_3_dot] = path_plan_continue(u,p_e0,p_ef,phi_e0,phi_ef,tf,ts,J_g)
%使用11.7.1章中的笛卡尔空间连续位姿跟踪的方法进行规划
    
    v_em = (p_ef-p_e0)/(tf-ts); %速度最大值
    
    w_em = (phi_ef-phi_e0)/(tf-ts); %角速度最大值
    
    %按照梯形函数输出
    
    if(u<ts)
        v_e = v_em/ts*u;
        w_e = w_em/ts*u;
    elseif(u < tf-ts)
        v_e = v_em;
        w_e = w_em;
        
    else
        v_e = v_em-v_em/ts*(u-tf+ts);
        w_e = w_em-w_em/ts*(u-tf+ts);
    end
    v_ex = v_e(1);
    v_ey = v_e(2);
    
    theta_dot = J_g\[v_ex,v_ey,w_e];
    theta_1_dot = theta_dot(1);
    theta_2_dot = theta_dot(2);
    theta_3_dot = theta_dot(3);



end