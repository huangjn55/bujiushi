function [r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(t,theta_1_dot,theta_2_dot,theta_3_dot,q0,q1,q2,q3,time_step)
    
    %初始化参数
    theta_0 = q0;
    theta_1 = q1;
    theta_2 = q2;
    theta_3 = q3;
    r_0x = 0; %基座位置
    r_0y = 0;
    phi_0 = 0;
    p_ex = 0; %末端位置
    p_ey = 0;
    phi_e = 0;
    for i = 1:1:length(t)

        %正运动学计算
        [r_0x,r_0y,p_ex,p_ey,phi_e] = robot_position(theta_0,theta_1,theta_2,theta_3); %计算位置级
        [v_0x,v_0y,w_0,v_ex,v_ey,w_e,J_g] = robot_velocity(r_0x,r_0y,theta_0,theta_1,theta_2,theta_3,theta_1_dot(i),theta_2_dot(i),theta_3_dot(i)); %计算速度级

        %积分基座姿态
        theta_0 = theta_0 + w_0*time_step;
        
        %积分关节角度
        theta_1 = theta_1 + theta_1_dot(i)*time_step;
        theta_2 = theta_2 + theta_2_dot(i)*time_step;
        theta_3 = theta_3 + theta_3_dot(i)*time_step;
        if(i==1)
            i
            res =[r_0x,r_0y,p_ex,p_ey,phi_e]
        end

    end


end