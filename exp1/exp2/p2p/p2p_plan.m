%牛顿迭代法求解点到点问题

% 定义规划目标
p_ef = [10,10]; %末端目标位置
phi_ef = 0;

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



learnRate_a15 = 1; %初始步长
learnRate_a25 = 1; 
learnRate_a35 = 1;


[r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(a15_hat,a25_hat,a35_hat);
G = abs(p_ex - p_ef(1)) + abs(p_ey-p_ef(2)) + 5*abs(phi_ef-phi_e);
error_pex = [];
error_pey = [];
error_phie = [];
G_history = [];

round = 40;

for k = 1:1:round

    %调整a15_hat
    % Up Search
    a15_hat = a15_hat + learnRate_a15; 

[r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(a15_hat,a25_hat,a35_hat);
    G_temp = (abs(p_ex - p_ef(1)))^2 + (abs(p_ey-p_ef(2)))^2 + 5*(abs(phi_ef-phi_e))^2;
    while(flag)
        
    end
    if(G_temp>G)
        % Down Search
        a15_hat = a15_hat - 2*learnRate_a15; 

        [r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(a15_hat,a25_hat,a35_hat);
        G_temp = (abs(p_ex - p_ef(1)))^2 + (abs(p_ey-p_ef(2)))^2 + 5*(abs(phi_ef-phi_e))^2; 
        if(G_temp>G)
            % 上下搜索都没用，恢复原来的参数，并减小步长
            a15_hat = a15_hat+learnRate_a15;  
            learnRate_a15 = updatelearnrate(learnRate_a15,6/7);

        else
            %向下搜索有用
            G = G_temp;
        end  
    else
        %向上搜索有用
        G = G_temp;

    end
    
    
    

    %调整a25_hat
    % Up Search
    a25_hat = a25_hat + learnRate_a25; 
    [r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(a15_hat,a25_hat,a35_hat);
    G_temp = (abs(p_ex - p_ef(1)))^2 + (abs(p_ey-p_ef(2)))^2 + 5*(abs(phi_ef-phi_e))^2;
    if(G_temp>G)
        % Down Search
        a25_hat = a25_hat - 2*learnRate_a25; 

        [r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(a15_hat,a25_hat,a35_hat);
       G_temp = (abs(p_ex - p_ef(1)))^2 + (abs(p_ey-p_ef(2)))^2 + 5*(abs(phi_ef-phi_e))^2;
        
        if(G_temp>G)
            % 上下搜索都没用，恢复原来的参数，并减小步长
            a25_hat = a25_hat+learnRate_a25; 
            learnRate_a25 = updatelearnrate(learnRate_a25,5/6);
        else
            G = G_temp;
        end     
    
    else
        G = G_temp;
    end

    
    
            
    %调整a35_hat
    % Up Search
    a35_hat = a35_hat + learnRate_a35; 
	[r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(a15_hat,a25_hat,a35_hat);
    G_temp = (abs(p_ex - p_ef(1)))^2 + (abs(p_ey-p_ef(2)))^2 + 5*(abs(phi_ef-phi_e))^2;
    

    if(G_temp>G)
        % Down Search
        a35_hat = a35_hat - 2*learnRate_a35; 
        [r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(a15_hat,a25_hat,a35_hat);
       G_temp = (abs(p_ex - p_ef(1)))^2 + (abs(p_ey-p_ef(2)))^2 + 5*(abs(phi_ef-phi_e))^2;
        
        if(G_temp>G)
            % 上下搜索都没用，恢复原来的参数，并减小步长
            a35_hat = a35_hat+learnRate_a35;    
            learnRate_a35 = updatelearnrate(learnRate_a35,4/5);
        else
            G = G_temp;
        end
    else
        G = G_temp;
    end
    k
    G
    G_history(k) = G;
    learnRate = [learnRate_a15,learnRate_a25,learnRate_a35]
    error = [p_ef(1)-p_ex,p_ef(2)-p_ey,phi_ef-phi_e]
    error_pex(k) = error(1);
    error_pey(k) = error(2);
    error_phie(k) = error(3);
    
    
end
a_hat = [a15_hat,a25_hat,a35_hat]

figure
subplot(311)
plot(1:1:round,error_pex);
title('')
xlabel('Iteration Number')
ylabel('Error p_ex [m]')
subplot(312)
plot(1:1:round,error_pey);
title('')
xlabel('Iteration Number')
ylabel('Error p_ey [m]')

subplot(313)
plot(1:1:round,error_pey*180/pi);
title('')
xlabel('Iteration Number')
ylabel('Error phi_e [°]')

figure
plot(1:1:round,G_history);
xlabel('Iteration Number')
ylabel('Loss Function')


function new_rate = updatelearnrate(rate,factor)
    new_rate = factor*rate;
end

%4/5,3/4,2/3
%5/6,4/5,3/4