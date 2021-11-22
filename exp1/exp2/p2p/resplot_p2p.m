close all
time = out.t.data;

% 
% %plan
% v_ex_plan = out.v_ex_plan.data;
% v_ey_plan = out.v_ey_plan.data;
% w_e_plan = out.w_e_plan.data*180/pi;


%multibody
v_exm = out.v_exm.data;
v_eym = out.v_eym.data;
w_em = out.w_em.data;
xem = out.x_em.data-1.738969362907555;
yem = out.y_em.data-1.738969362907555;
phi_em = out.theta_em.data*180/pi;

%m function
v_exp = out.v_ex.data;
v_eyp = out.v_ey.data;
w_ep = out.w_e.data*180/pi;
p_exp = out.p_ex.data;
p_eyp = out.p_ey.data;
phi_ep = out.phi_e.data*180/pi;

%result of multibody 
figure(1)
subplot(311)
plot(time,xem,'linewidth',2)
xlabel('time')
ylabel('xe(m)')
title('Multibody: Position')

subplot(312)
plot(time,yem,'linewidth',2)
xlabel('time')
ylabel('ye(m)')

subplot(313)
plot(time,phi_em,'linewidth',2)
xlabel('time')
ylabel('phi_e(°)')

figure(2)
subplot(311)
plot(time,v_exm,'linewidth',2)
title('Multibody: Velocity')
xlabel('time')
ylabel('ve_x(m)')

subplot(312)
plot(time,v_eym,'linewidth',2)
xlabel('time')
ylabel('ve_y(m)')

subplot(313)
plot(time,w_em,'linewidth',2)
xlabel('time')
ylabel('w_e(°/s)')


%result of m function 
figure(3)
subplot(311)
plot(time,p_exp,'linewidth',2)
title('m Function: Position')
xlabel('time')
ylabel('xe(m)')

subplot(312)
plot(time,p_eyp,'linewidth',2)
xlabel('time')
ylabel('ye(m)')

subplot(313)
plot(time,phi_ep,'linewidth',2)
xlabel('time')
ylabel('phi_e(°)')

figure(4)
subplot(311)
plot(time,v_exp,'linewidth',2)
title('m Function: Velocity')
xlabel('time')
ylabel('ve_x(m)')

subplot(312)
plot(time,v_eyp,'linewidth',2)
xlabel('time')
ylabel('ve_y(m)')

subplot(313)
plot(time,w_ep,'linewidth',2)
xlabel('time')
ylabel('w_e(°/s)')

% % error between plan and m function
% figure(5)
% subplot(311)
% plot(time,v_ex_plan-v_exm,'linewidth',2)
% title('Error: plan - multibody')
% 
% xlabel('time')
% ylabel('error v_ex(m/s)')
% 
% subplot(312)
% plot(time,v_ey_plan-v_eym,'linewidth',2)
% xlabel('time')
% ylabel('error v_ey(m/s)')
% 
% subplot(313)
% plot(time,w_e_plan-w_em,'linewidth',2)
% xlabel('time')
% ylabel('error w_e(°/s)')

% %error between multibody and m function
% 
% figure(3)
% subplot(411)
% plot(time,p_ex - xe,'linewidth',2)
% title('error between multibody and m function')
% xlabel('time')
% ylabel('error xe(m)')
% 
% subplot(412)
% plot(time,p_ey - ye,'linewidth',2)
% xlabel('time')
% ylabel('error ye(m)')
% 
% subplot(413)
% plot(time,v_exp - v_ex,'linewidth',2)
% xlabel('time')
% ylabel('error ve_x(m)')
% 
% subplot(414)
% plot(time,v_eyp - v_ey,'linewidth',2)
% xlabel('time')
% ylabel('error ve_y(m)')
% 
% %plan vex, vey, we
% figure(4)
% 
% subplot(311)
% plot(time,v_ex_plan,'linewidth',2)
% xlabel('time')
% ylabel('ve_x_plan(m))')
% title('Plan')
% 
% subplot(312)
% plot(time,v_ey_plan,'linewidth',2)
% xlabel('time')
% ylabel('ve_y_plan(m))')
% 
% subplot(313)
% plot(time,w_e_plan,'linewidth',2)
% xlabel('time')
% ylabel('w_e_plan(m))')




