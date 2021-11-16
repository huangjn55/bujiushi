u = 0:0.01:20;
p_e0 = [19,0]';
theta_0 = [0,0,0];
p_ef = [17,3]';
phi_e0 = 0;
phi_ef = 30;
tf = 20;
ts = 3;
i=1;
for u = 0:0.01:20
    [v_ex_t,v_ey_t,w_e_t] = path_plan_continue(u,p_e0,theta_0,p_ef,phi_e0,phi_ef,tf,ts)
    v_ex(i) = v_ex_t;
    v_ey(i) = v_ey_t;
    w_e(i) = w_e_t;
    i = i+1;
end

