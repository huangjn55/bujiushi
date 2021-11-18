% 给定关节角轨迹，计算机器人最终的状态，用于测试simulink外部仿真是否正确

% 定义初始参数
p_e0 = [6.503671324211731, 14.503671324211730]; %末端初始位置
phi_e0 = pi/2; %末端初始姿态角

p_ef = [8,10]; %末端目标位置
phi_ef = pi/4;


ts = 3; %上升时间
tf = 10; 

time_step = 0.001;
t = 0:time_step:10;

% 定义关节角函数

% 定义变量
J_g =  zeros([3,3]);
theta_dot_1 = 0;
theta_dot_2 = 0;
theta_dot_3 = 0;



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

for i = 1:length(t)
   u = t(i);
   [r_0x,r_0y,p_ex,p_ey,phi_e] = robot_position(theta_0,theta_1,theta_2,theta_3); %计算位置级
   [v_0x,v_0y,w_0,v_ex,v_ey,w_e,J_g] = robot_velocity(r_0x,r_0y,theta_0,theta_1,theta_2,theta_3,theta_dot_1,theta_dot_2,theta_dot_3); %计算速度级
   
   [theta_dot_1,theta_dot_2,theta_dot_3,v_ex_plan,v_ey_plan,w_e_plan,det_J,det_Jg] = path_plan_continue(u,p_e0,p_ef,phi_e0,phi_ef, tf, ts, J_g); %计算规划的关节角速度
   
   %积分基座姿态和关节角度
   theta_0 = theta_0 + w_0*time_step;
   theta_1 = theta_1 + theta_dot_1*time_step;
   theta_2 = theta_2 + theta_dot_2*time_step;
   theta_3 = theta_3 + theta_dot_3*time_step;
end
