time = out.t.data;
%multibody
px = out.p.data(:,2);
py = out.p.data(:,3);
pvx = out.p.data(:,4);
pvy = out.p.data(:,5);

%calculate
r_0x = out.r_0x.Data;
r_0y = out.r_0y.Data;

px_ = out.p_ex.Data - r_0x(1);
py_ = out.p_ey.Data;

pvx_ = out.v_ex.Data;
pvy_ = out.v_ey.Data;



figure(1)
fontsize = 20;
linewidth = 2;
subplot(411)
plot(time,px,'b--',time,px_,'r','linewidth',linewidth)
legend('data from multibody','data from matlab')
xlabel('time(s)')
ylabel('x position(m)')
title('End-effector position(x)')
set(gca,'fontsize',fontsize,'fontname','Times');

subplot(412)
plot(time,py,'b--',time,py_,'r','linewidth',linewidth)
legend('data from multibody','data from matlab')
xlabel('time(s)')
ylabel('y position(m)')
title('End-effector position(y)')
set(gca,'fontsize',fontsize,'fontname','Times');

subplot(413)
plot(time,pvx,'b--',time,pvx_,'r','linewidth',linewidth)
legend('data from multibody','data from matlab')
xlabel('time(s)')
ylabel('x velocity(m/s)')
title('End-effector velocity(x)')
set(gca,'fontsize',fontsize,'fontname','Times');

subplot(414)
plot(time,pvy,'b--',time,pvy_,'r','linewidth',linewidth)
legend('data from multibody','data from matlab')
xlabel('time(s)')
ylabel('y velocity(m/s)')
title('End-effector velocity(y)')
set(gca,'fontsize',fontsize,'fontname','Times');

figure(2)
subplot(411)
plot(time,px-px_,'linewidth',linewidth)
xlabel('time(s)')
ylabel('x position(m)')
title('Error(x)')
set(gca,'fontsize',fontsize,'fontname','Times');

subplot(412)
plot(time,py-py_,'linewidth',linewidth)
xlabel('time(s)')
ylabel('y position(m)')
title('Error(y)')
set(gca,'fontsize',fontsize,'fontname','Times');

subplot(413)
plot(time,pvx-pvx_,'linewidth',linewidth)
xlabel('time(s)')
ylabel('x velocity(m/s)')
title('Error(v_x)')
set(gca,'fontsize',fontsize,'fontname','Times');

subplot(414)
plot(time,pvy-pvy_,'linewidth',linewidth)
xlabel('time(s)')
ylabel('y velocity(m/s)')
title('Error(v_y)')
set(gca,'fontsize',fontsize,'fontname','Times');



