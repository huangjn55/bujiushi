
%连杆尺寸
a_1 = 3;
a_2 = 3;
a_3 = 3;

b_0 = 4;
b_1 = 3;
b_2 = 3;
b_3 = 3;

l_1 = a_1 + b_1;
l_2 = a_2 + b_2;
l_3 = a_3 + b_3;

%质量
m_0 = 10; %基座质量
m_1 = 1;
m_2 = 1;
m_3 = 1;
M = m_0 + m_1 + m_2 + m_3; %系统总质量

%连杆形状
length_0 = 8;%基座边长
length_1 = l_1; %连杆总长度
length_2 = l_2;
length_3 = l_3;
% width_0 = 8; %基座边长
% width_1 = 2;%连杆边长
% width_2 = 2;
% width_3 = 2;

%转动惯量
% I_0 = 1/12*m_0*(length_0*length_0+width_0*width_0);
% I_1 = 1/12*m_1*(length_1*length_1+width_1*width_1);
% I_2 = 1/12*m_2*(length_2*length_2+width_2*width_2);
% I_3 = 1/12*m_3*(length_3*length_3+width_3*width_3);
I_0 = 106.667;
I_1 = 3.25;
I_2 = 3.25;
I_3 = 3.25;
% I_1 = 0.66666667;
% I_2 = I_1;
% I_3 = I_2;



% %关节角
% theta_0 = 0;
% theta_1 = 40;
% theta_2 = 50;
% theta_3 = 60;
% 
% %关节角速度  °/s单位
% theta_dot_1 = 10;
% theta_dot_2 = 20;
% theta_dot_3 = 10;
% 
% s_0 = sind(theta_0);
% c_0 = cosd(theta_0);
% s_01 = sind(theta_0+theta_1);
% c_01 = cosd(theta_0+theta_1);
% s_012 = sind(theta_0+theta_1+theta_2);
% c_012 = cosd(theta_0+theta_1+theta_2);
% s_0123 = sind(theta_0+theta_1+theta_2+theta_3);
% c_0123 = cosd(theta_0+theta_1+theta_2+theta_3);
% [r_0x,r_0y,p_ex,p_ey,Phi_e] = position(theta_0,theta_1,theta_2,theta_3)
% [v_0x,v_0y,w_0,v_ex,v_ey,w_e] = velocity(r_0x,r_0y,theta_0,theta_1,theta_2,theta_3,theta_dot_1,theta_dot_2,theta_dot_3)
