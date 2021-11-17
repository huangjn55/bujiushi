close all
time = out.p_ex.time;
figure;
subplot(3,1,1)
plot(time,out.p_ex.data);
title('End pos')
ylabel('p_ex [m]')
subplot(3,1,2)
plot(time,out.p_ey.data);
ylabel('p_ey [m]')
subplot(3,1,3)
plot(time,out.phi_e.data);
ylabel('\phi_e [rad]')

figure;
subplot(3,1,1)
plot(time,out.theta_dot_1.data)
ylabel('\dot \theta_1} [m]')
title('Theta dot ')
axis([0 20 -0.1 0.1]); % 设置坐标轴在指定的区间subplot(3,1,2)
subplot(3,1,2)
plot(time,out.theta_dot_2.data)
ylabel('\dot \theta_2} [m]')

subplot(3,1,3)
plot(time,out.theta_dot_3.data)
ylabel('\dot \theta_3 [m]')

figure;
J_g_data = [];
for i = 1:length(time)
    J_g_data(i) = det(out.J_g.data(:,:,i));
end
plot(J_g_data)
title('J_g')
grid on


figure;
subplot(3,1,1)
plot(time,out.theta_1.data)
ylabel('\theta_1')
subplot(3,1,2)
plot(time,out.theta_2.data)
ylabel('\theta_2')
subplot(3,1,3)
plot(time,out.theta_3.data)
ylabel('\theta_3')


figure;
subplot(3,1,1)
plot(time,out.v_ex.data)

