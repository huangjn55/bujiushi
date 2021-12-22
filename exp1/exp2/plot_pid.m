close all
t = out.q3.time;
q3 = out.q3.data;
w3 = out.w3.data;
theta_3 = out.theta_3.data;
theta_dot_3 = out.theta_dot_3.data;

q2 = out.q2.data;
w2 = out.w2.data;
theta_2 = out.theta_2.data;
theta_dot_2 = out.theta_dot_2.data;

q1 = out.q1.data;
w1 = out.w1.data;
theta_1 = out.theta_1.data;
theta_dot_1 = out.theta_dot_1.data;

x_em = out.x_em.data - 1.738969362907555;
y_em = out.y_em.data - 1.738969362907555;
theta_em = out.theta_em.data;
v_exm = out.v_exm.data;
v_eym = out.v_eym.data;
w_em = out.w_em.data;

% input_step = out.input.data;
% % for test
% plot(t,w1)
% hold on
% plot(t,input_step)
% legend('output','input')
% title('Test')

% Joint 3
figure
subplot(211)
plot(t,w3)
hold on
plot(t,theta_dot_3);xlabel('time [s]');ylabel('Velocity [rad/s]')
legend('output','input')
title('Velocity of Joint 3')
subplot(212)
plot(t,theta_dot_3-w3);xlabel('time [s]');ylabel('Velocity Error [rad/s]')
title('Velocity Error of Joint3')

figure
subplot(211)
plot(t,q3)
hold on
plot(t,theta_3);xlabel('time [s]');ylabel('Position [rad]')
title('Position of Joint 3')
legend('output','input')
subplot(212)
plot(t,theta_3-q3);xlabel('time [s]');ylabel('Position Error [rad]')
title('Position Error of Joint3')


% Joint 2 
figure
subplot(211)
plot(t,w2)
hold on
plot(t,theta_dot_2);xlabel('time [s]');ylabel('Velocity [rad/s]')
legend('output','input')
title('Velocity of Joint 2')
subplot(212)
plot(t,theta_dot_2-w2);xlabel('time [s]');ylabel('Velocity Error [rad/s]')
title('Velocity Error pf Joint2')

figure
subplot(211)
plot(t,q2)
hold on
plot(t,theta_2);xlabel('time [s]');ylabel('Position [rad]')
title('Position of Joint 2')
legend('output','input')
subplot(212)
plot(t,theta_2-q2);xlabel('time [s]');ylabel('Position Error [rad]')
title('Position Error of Joint2')

% Joint 1
figure
subplot(211)
plot(t,w1)
hold on
plot(t,theta_dot_1);xlabel('time [s]');ylabel('Velocity [rad/s]')
legend('output','input')
title('Velocity of Joint 1')
subplot(212)
plot(t,theta_dot_1-w1);xlabel('time [s]');ylabel('Velocity Error [rad/s]')
title('Velocity Error of Joint1')

figure
subplot(211)
plot(t,q1)
hold on
plot(t,theta_1);xlabel('time [s]');ylabel('Position [rad]')
title('Position of Joint 1')
legend('output','input')
subplot(212)
plot(t,theta_1-q1);xlabel('time [s]');ylabel('Position Error [rad]')
title('Position Error of Joint1')


% end 
figure
subplot(311)
plot(t,x_em);xlabel('time [s]');ylabel('X_{e} [m]');title('End Position of X')
subplot(312)
plot(t,y_em);xlabel('time [s]');ylabel('Y_{e} [m]');title('End Position of Y')
subplot(313)
plot(t,theta_em);xlabel('time [s]');ylabel('\theta_{e} [rad]');title('End Theta')

figure
subplot(311)
plot(t,v_exm);xlabel('time [s]');ylabel('V_{x} [m/s]');title('End Velocity of X')
subplot(312)
plot(t,v_eym);xlabel('time [s]');ylabel('V_{y} [m/s]');title('End Velocity of Y')
subplot(313)
plot(t,w_em);xlabel('time [s]');ylabel('\omega_{e} [rad/s]');title('End Omega')

