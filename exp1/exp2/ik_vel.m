function [dtheta1,dtheta2,dtheta3] = ik_vel(ve,we,v0,w0)
    I_1 = evalin('base','I_0');
    I_2 = evalin('base','I_0');
    I_3 = evalin('base','I_0');
    b_0 = evalin('base','b_0');

    s_0 = sind(theta_0);
    c_0 = cosd(theta_0);
    s_01 = sind(theta_0+theta_1);
    c_01 = cosd(theta_0+theta_1);
    s_012 = sind(theta_0+theta_1+theta_2);
    c_012 = cosd(theta_0+theta_1+theta_2);
    s_0123 = sind(theta_0+theta_1+theta_2+theta_3);
    c_0123 = cosd(theta_0+theta_1+theta_2+theta_3);
    
    J_s = [
        1     0     -b_0*s_0-l_1*s_01-l_2*s_012-l_3*s_0123;
        0     1      b_0*c_0+l_1*c_01+l_2*c_012+l_3*c_0123;
        0     0                        1                  ;
        ];
    J_m = [
        -l_1*s_01-l_2*s_012-l_3*s_0123  -l_2*s_012-l_3*s_0123    -l_3*s_0123;
         l_1*c_01+l_2*c_012+l_3*c_0123   l_2*c_012+l_3*c_0123     l_3*c_0123;
         1                               1                        1         ;
        ]; 
   ve = [ve(1);ve(2);we];
   v0 = [v0(1);v0(2);w0];

    dtheta = J_m\(ve-J_s*v0);
    dtheta1 = dtheta(1);
    dtheta2 = dtheta(2);
    dtheta3 = dtheta(3);
end