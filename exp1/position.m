%根据公式6-294和6-295,6-296进行建模
function [r_0x,r_0y,p_ex,p_ey,Phi_e] = position(theta_0,theta_1,theta_2,theta_3)
    %读取工作空间的所有变量
    a_1 = evalin('base','a_1');
    a_2 = evalin('base','a_2');
    a_3 = evalin('base','a_3');
    b_0 = evalin('base','b_0');
    b_1 = evalin('base','b_1');
    b_2 = evalin('base','b_2');
    b_3 = evalin('base','b_3');
    l_1 = evalin('base','l_1');
    l_2 = evalin('base','l_2');
    l_3 = evalin('base','l_3');
    m_0 = evalin('base','m_0');
    m_1 = evalin('base','m_1');
    m_2 = evalin('base','m_2');
    m_3 = evalin('base','m_3');
    M = evalin('base','M');
    I_0 = evalin('base','I_0');
    I_1 = evalin('base','I_0');
    I_2 = evalin('base','I_0');
    I_3 = evalin('base','I_0');
    
    %计算参数
    s_0 = sin(theta_0);
    c_0 = cos(theta_0);
    s_01 = sin(theta_0+theta_1);
    c_01 = cos(theta_0+theta_1);
    s_012 = sin(theta_0+theta_1+theta_2);
    c_012 = cos(theta_0+theta_1+theta_2);
    s_0123 = sin(theta_0+theta_1+theta_2+theta_3);
    c_0123 = cos(theta_0+theta_1+theta_2+theta_3);
    
    b_0_hat = m_0/M*b_0;
    b_1_hat = (m_0 + m_1)/M*b_1;
    b_2_hat = (m_0 + m_1 + m_2)/M*b_2;
    b_3_hat = b_2;

    a_1_hat = m_0/M*a_1;
    a_2_hat = (m_0 + m_1)/M*a_2;
    a_3_hat = (m_0+m_1+m_2)/M*a_3;
    
    %计算r_0 公式6-293  check
    r_0x = -( (m_1+m_2+m_3)/M*b_0*c_0 + ((m_1+m_2+m_3)/M*a_1 + (m_2+m_3)/M*b_1)*c_01 + ((m_2+m_3)/M*a_2 + m_3/M*b_2)*c_012 + m_3/M*a_3*c_0123);
    r_0y = -( (m_1+m_2+m_3)/M*b_0*s_0 + ((m_1+m_2+m_3)/M*a_1 + (m_2+m_3)/M*b_1)*s_01 + ((m_2+m_3)/M*a_2 + m_3/M*b_2)*s_012 + m_3/M*a_3*s_0123);
    
    
    %计算末端位姿
    p_ex = b_0_hat*c_0 + (a_1_hat+b_1_hat)*c_01 + (a_2_hat+b_2_hat)*c_012+(a_3_hat+b_3_hat)*c_0123;
    p_ey = b_0_hat*s_0 + (a_1_hat+b_1_hat)*s_01 + (a_2_hat+b_2_hat)*s_012+(a_3_hat+b_3_hat)*s_0123;

    Phi_e = theta_0+theta_1+theta_2+theta_3;%末端姿态角
