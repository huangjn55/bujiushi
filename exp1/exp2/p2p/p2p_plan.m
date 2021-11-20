%牛顿迭代法求解点到点问题

% 定义规划目标
p_ef = [5,10]; %末端目标位置
phi_ef = pi/4;

%定义时间步长
time_step = 0.001;
t = 0:time_step:20;
tf = 20;


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

r0 = [-1.738969362907555,-1.738969362907555]'; %基座初始位置


%初始参数
tau = t/tf;
[q1,q2,q3] = ik_pos(r0,theta_0_0,p_ef,phi_ef,[theta_1_0,theta_2_0,theta_3_0]'); %先求解出固定基座的关节角曲线作为初始值
a15_hat = (q1-theta_1_0)/(1-5/2+5/3);
a25_hat = (q2-theta_2_0)/(1-5/2+5/3);
a35_hat = (q3-theta_3_0)/(1-5/2+5/3);



learnRate_a15 = 2; %初始步长
learnRate_a25 = 2; 
learnRate_a35 = 2;
for k = 1:1:20
    %计算结果
    
    theta_1_dot = a15_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
    theta_2_dot = a25_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
    theta_3_dot = a35_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
    [r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(t,theta_1_dot,theta_2_dot,theta_3_dot,theta_0_0,theta_1_0,theta_2_0,theta_3_0,time_step);
    last_G = abs(p_ex - p_ef(1)) + abs(p_ey-p_ef(2)) + 5*abs(phi_ef-phi_e);
    
    %调整a15_hat
    % Up Search
    a15_hat = a15_hat + learnRate_a15; 
    theta_1_dot = a15_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
    theta_2_dot = a25_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
    theta_3_dot = a35_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
    [r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(t,theta_1_dot,theta_2_dot,theta_3_dot,theta_0_0,theta_1_0,theta_2_0,theta_3_0,time_step);
    G = abs(p_ex - p_ef(1)) + abs(p_ey-p_ef(2)) + 5*abs(phi_ef-phi_e);
    if(G>last_G)
        % Down Search
        a15_hat = a15_hat - 2*learnRate_a15; 
        theta_1_dot = a15_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
        theta_2_dot = a25_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
        theta_3_dot = a35_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
        [r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(t,theta_1_dot,theta_2_dot,theta_3_dot,theta_0_0,theta_1_0,theta_2_0,theta_3_0,time_step);
        G = abs(p_ex - p_ef(1)) + abs(p_ey-p_ef(2)) +5*abs(phi_ef-phi_e);
        
        if(G>last_G)
            % 上下搜索都没用，恢复原来的参数，并减小步长
            learnRate_a15 = learnRate_a15/2;
            a15_hat = a15_hat+learnRate_a15;          
        end     
    end
    
        
    %调整a25_hat
    % Up Search
    a25_hat = a25_hat + learnRate_a25; 
    theta_1_dot = a15_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
    theta_2_dot = a25_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
    theta_3_dot = a35_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
    [r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(t,theta_1_dot,theta_2_dot,theta_3_dot,theta_0_0,theta_1_0,theta_2_0,theta_3_0,time_step);
    G = abs(p_ex - p_ef(1)) + abs(p_ey-p_ef(2)) + 3*abs(phi_ef-phi_e);
    if(G>last_G)
        % Down Search
        a25_hat = a25_hat - 2*learnRate_a25; 
        theta_1_dot = a15_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
        theta_2_dot = a25_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
        theta_3_dot = a35_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
        [r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(t,theta_1_dot,theta_2_dot,theta_3_dot,theta_0_0,theta_1_0,theta_2_0,theta_3_0,time_step);
        G = abs(p_ex - p_ef(1)) + abs(p_ey-p_ef(2)) + 5*abs(phi_ef-phi_e);
        
        if(G>last_G)
            % 上下搜索都没用，恢复原来的参数，并减小步长
            learnRate_a25 = learnRate_a25/2;
            a25_hat = a25_hat+learnRate_a25;          
        end     
    end
    
            
    %调整a35_hat
    % Up Search
    a35_hat = a35_hat + learnRate_a35; 
    theta_1_dot = a15_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
    theta_2_dot = a25_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
    theta_3_dot = a35_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
    [r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(t,theta_1_dot,theta_2_dot,theta_3_dot,theta_0_0,theta_1_0,theta_2_0,theta_3_0,time_step);
    G = abs(p_ex - p_ef(1)) + abs(p_ey-p_ef(2)) + 5*abs(phi_ef-phi_e);
    if(G>last_G)
        % Down Search
        a35_hat = a35_hat - 2*learnRate_a35; 
        theta_1_dot = a15_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
        theta_2_dot = a25_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
        theta_3_dot = a35_hat*(5*tau.^4 - 10*tau.^3 + 5*tau.^2)/tf;
        [r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(t,theta_1_dot,theta_2_dot,theta_3_dot,theta_0_0,theta_1_0,theta_2_0,theta_3_0,time_step);
        G = abs(p_ex - p_ef(1)) + abs(p_ey-p_ef(2)) + 5*abs(phi_ef-phi_e);
        
        if(G>last_G)
            % 上下搜索都没用，恢复原来的参数，并减小步长
            learnRate_a35 = learnRate_a35/2;
            a35_hat = a35_hat+learnRate_a35;          
        end     
    end
    
    k
    G
    
    
    
end
