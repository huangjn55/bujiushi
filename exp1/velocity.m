%通过公式6-363计算末端速度
function [v_0x,v_0y,w_0,v_ex,v_ey,w_e] = velocity(r_0x,r_0y,theta_0,theta_1,theta_2,theta_3,theta_dot_1,theta_dot_2,theta_dot_3)
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

    %更新各个参量
    s_0 = sind(theta_0);
    c_0 = cosd(theta_0);
    s_01 = sind(theta_0+theta_1);
    c_01 = cosd(theta_0+theta_1);
    s_012 = sind(theta_0+theta_1+theta_2);
    c_012 = cosd(theta_0+theta_1+theta_2);
    s_0123 = sind(theta_0+theta_1+theta_2+theta_3);
    c_0123 = cosd(theta_0+theta_1+theta_2+theta_3);

    k_vx = -m_1*(b_0*s_0+a_1*s_01)-m_2*(b_0*s_0+l_1*s_01+a_2*s_012)-m_3*(b_0*s_0+l_1*s_01+l_2*s_012+a_3*s_0123); %公式6-321    check
    k_vy = m_1*(b_0*c_0+a_1*c_01)+m_2*(b_0*c_0+l_1*c_01+a_2*c_012)+m_3*(b_0*c_0+l_1*c_01+l_2*c_012+a_3*c_0123); %公式6-322     check
    k_px1 = -m_1*a_1*s_01-m_2*(l_1*s_01+a_2*s_012)-m_3*(l_1*s_01+l_2*s_012+a_3*s_0123);%公式6-323   check
    k_px2 = -m_2*a_2*s_012 - m_3*(l_2*s_012+a_3*s_0123); %公式6-324   check
    k_px3 = -m_3*a_3*s_0123; %公式6-325    check

    k_py1 = m_1*a_1*c_01+m_2*(l_1*c_01+a_2*c_012)+m_3*(l_1*c_01+l_2*c_012+a_3*c_0123); %公式6-326   check
    k_py2 = m_2*a_2*c_012+m_3*(l_2*c_012+a_3*c_0123);  %公式6-327   check
    k_py3 = m_3*a_3*c_0123;  %公式6-328  check

    k_w = (I_0+I_1+I_2+I_3) + m_1*(b_0*c_0+a_1*c_01)^2 +m_1*(b_0*s_0+a_1*s_01)^2 ...
        +m_2*(b_0*c_0+l_1*c_01+a_2*c_012)^2+m_2*(b_0*s_0+l_1*s_01+a_2*s_012)^2 ...
        +m_2*(b_0*c_0+l_1*c_01+l_2*c_012+a_3*c_0123)^2 + m_3*(b_0*s_0+l_1*s_01+l_2*s_012+a_3*s_0123)^2 ...
        -M*(r_0x^2+r_0y^3); %公式6-353   check

    k_q1 = (I_1+I_2+I_3) +m_1*a_1*c_01*(b_0*c_0+a_1*c_01)+m_1*a_1*s_01*(b_0*s_0+a_1*s_01) ...
        +m_2*(l_1*c_01+a_2*c_012)*(b_0*c_0+l_1*c_01+a_2*c_012) ...
        +m_2*(l_1*s_01+a_2*s_012)*(b_0*s_0+l_1*s_01+a_2*s_012) ...
        +m_3*(l_1*c_01+l_2*c_012+a_3*c_0123)*(b_0*c_0+l_1*c_01+l_2*c_012+a_3*c_0123) ...
        +m_3*(l_1*s_01+l_2*s_012+a_3*s_0123)*(b_0*s_0+l_1*s_01+l_2*s_012+a_3*s_0123) ...
        +r_0x*(m_1*a_1*c_01+m_2*(l_1*c_01+a_2*c_012)+m_3*(l_1*c_01+l_2*c_012+a_3*c_0123)) ...
        +r_0y*(m_1*a_1*s_01+m_2*(l_1*s_01+a_2*s_012)+m_3*(l_1*s_01+l_2*s_012+a_3*s_0123)); %公式6-354    check

    k_q2 = (I_2+I_3)+m_2*a_2*c_012*(b_0*c_0+l_1*c_01+a_2*c_012)+m_2*a_2*s_012*(b_0*s_0+l_1*s_01+a_2*s_012) ...
        +m_3*(l_2*c_012+a_3*c_0123)*(b_0*c_0+l_1*c_01+l_2*c_012+a_3*c_0123) ...
        +m_3*(l_2*s_012+a_3*s_0123)*(b_0*s_0+l_1*s_01+l_2*s_012+a_3*s_0123) ...
        +r_0x*(m_2*a_2*c_012+m_3*(l_2*c_012+a_3*c_0123)) ...
        +r_0y*(m_2*a_2*s_012+m_3*(l_2*s_012+a_3*s_0123));%公式6-355     check

    k_q3 = I_3+m_3*a_3*c_0123*(b_0*c_0+l_1*c_01+l_2*c_012+a_3*c_0123)+m_3*a_3*s_0123*(b_0*s_0+l_1*s_01+l_2*s_012+a_3*s_0123) ...
        +m_3*a_3*c_0123*r_0x+m_3*a_3*s_0123*r_0y;%公式6-356     check

    J_s = [
        1     0     -b_0*s_0-l_1*s_01-l_2*s_012-l_3*s_0123;
        0     1      b_0*c_0+l_1*c_01+l_2*c_012+l_3*c_0123;
        0     0                        1                  ;
        ];%公式6-309   check
    J_m = [
        -l_1*s_01-l_2*s_012-l_3*s_0123  -l_2*s_012-l_3*s_0123    -l_3*s_0123;
         l_1*c_01+l_2*c_012+l_3*c_0123   l_2*c_012+l_3*c_0123     l_3*c_0123;
         1                               1                        1         ;
        ];  %公式6-310  check

    J_1 = [
        M   0   k_vx;
        0   M   k_vy;
        0   0   k_w ;
        ];%公式6-360  check
    J_2 = [
        k_px1  k_px2  k_px3;
        k_py1  k_py2  k_py3;
        k_q1   k_q2   k_q3
        ];%公式6-361   check
    J_g = -J_s*inv(J_1)*J_2+J_m;  %公式6-363  check


    %计算速度
    velocity_end = J_g*[theta_dot_1;theta_dot_2;theta_dot_3]; %末端速度
    velocity_0 = -inv(J_1)*J_2*[theta_dot_1;theta_dot_2;theta_dot_3];%基座速度
    v_ex = velocity_end(1);
    v_ey = velocity_end(2);
    w_e = velocity_end(3);
    v_0x = velocity_0(1);
    v_0y = velocity_0(2);
    w_0 = velocity_0(3);
