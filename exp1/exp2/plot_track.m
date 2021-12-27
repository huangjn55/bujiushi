close all
t = out.x.time;
x_target = out.x.data;
y_target = out.y.data;

x_e = out.x_em.data+0.949854039234883;
y_e = out.y_em.data+1.3;

figure
subplot(211)
plot(t,x_target);xlabel('time [s]');ylabel('Position [m]')
hold on 
plot(t,x_e)
legend('Target','End Effector')
title('Position X')
subplot(212)
plot(t,y_target);xlabel('time [s]');ylabel('Position [m]')
hold on
plot(t,y_e)
legend('Target','End Effector')
title('Position Y')


figure
subplot(211)
plot(t,x_target-x_e);xlabel('time [s]');ylabel('Position [m]')

title('Error of Position X')
subplot(212)
plot(t,y_target-y_e);xlabel('time [s]');ylabel('Position [m]')
title('Error of Position Y')