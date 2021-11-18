function [theta_1_dot,theta_2_dot,theta_3_dot,v_ex_plan,v_ey_plan,w_e_plan,det_J,det_Jg] = path_plan_continue(u,p_e0,p_ef,phi_e0,phi_ef, tf, ts, J_g)
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

    % 防止奇异
    J = J_g;
%     %奇异值分解
%     s = svd(J); % 降序返回矩阵J的奇异值
%     lamda_m = 0.5;
%     epsilon = 0.0001;%是否为奇异的判定条件
%     if(s(3)>epsilon)
%         lamda_2 = 0;
%     else
%         lamda_2 = (1-(s(3)/epsilon)^2)*lamda_m^2;
%     end
%     J = J_g'/(J_g*J_g'+lamda_2*eye(size(J_g)));

    
    %防止初始时刻J_g是零矩阵导致的错误
    if(det(J)==0)
        theta_1_dot=0;
        theta_2_dot=0;
        theta_3_dot=0;
    else
        theta_dot = J\[v_ex,v_ey,w_e]';
        theta_1_dot = theta_dot(1);
        theta_2_dot = theta_dot(2);
        theta_3_dot = theta_dot(3);
    end
    det_J = cond(J);
    det_Jg = cond(J_g);
    v_ex_plan = v_ex;
    
    v_ey_plan = v_ey;
    w_e_plan = w_e;
    




end