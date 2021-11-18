%遗传算法中的适应度函数

function z = fitness(x)

    %每个关节有1个参数(a_i5)，因此x一共有3维

    % 定义初始参数
    
    p_e0 = [6.503671324211731, 14.503671324211730]; %末端初始位置
    phi_e0 = pi/2; %末端初始姿态角

    p_ef = [8,10]; %末端目标位置
    phi_ef = pi/4;


    ts = 3; %上升时间
    tf = 10; 

    time_step = 0.001;
    t = 0:time_step:10;

    % 定义变量
    J_g =  zeros([3,3]);
    theta_dot_1 = 0;
    theta_dot_2 = 0;
    theta_dot_3 = 0;


    
    %初始值
    theta_0_0 = 0;
    theta_1_0 = pi/4;
    theta_2_0 = pi/4;
    theta_3_0 = 0;
    
    theta_0 = 0;
    theta_1 = pi/4;
    theta_2 = pi/4;
    theta_3 = 0;
    
    


    r_0x = 0; %基座位置
    r_0y = 0;
    phi_0 = 0;
    p_ex = 0; %末端位置
    p_ey = 0;
    phi_e = 0;
    v_0x = 0; %基座速度
    v_0y = 0;
    w_0 = 0; 
    v_ex = 0;%末端速度
    v_ey = 0;
    w_e = 0;

    % 定义关节角参数，这块见11-85
    a15 = x(1);
    a25 = x(2);
    a35 = x(3);
    
    for i = 1:length(t)
       u = t(i);
       [r_0x,r_0y,p_ex,p_ey,phi_e] = robot_position(theta_0,theta_1,theta_2,theta_3); %计算位置级
       [v_0x,v_0y,w_0,v_ex,v_ey,w_e,J_g] = robot_velocity(r_0x,r_0y,theta_0,theta_1,theta_2,theta_3,theta_dot_1,theta_dot_2,theta_dot_3); %计算速度级
        
       %规划关节角
       theta_1 = a15*(u^5-5/2*tf*u^4 + 5/3 * tf^2*u^3) + theta_1_0;
       theta_2 = a25*(u^5-5/2*tf*u^4 + 5/3 * tf^2*u^3) + theta_2_0;
       theta_3 = a35*(u^5-5/2*tf*u^4 + 5/3 * tf^2*u^3) + theta_3_0;

       %积分基座姿态
       theta_0 = theta_0 + w_0*time_step;

    end
    
    %计算适应度
    z = abs(p_ef(1)-p_ex) + abs(p_ef(2)-p_ey) + 3*abs(phi_ef - phi_e);
    


end