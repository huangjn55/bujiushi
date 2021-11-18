time = out.t.data;
xe = out.x_em.data-1.738969362907555;
ye = out.y_em.data-1.738969362907555;

v_ex = out.v_exm.data;
v_ey = out.v_eym.data;
r_gx = out.r_gx.data;
r_gy = out.r_gy.data;

v_exp = out.v_ex.data;
v_eyp = out.v_ey.data;
p_ex = out.p_ex.data;
p_ey = out.p_ey.data;

figure(1)
subplot(411)
plot(time,xe,'linewidth',2)
xlabel('time')
ylabel('xe(m)')

subplot(412)
plot(time,ye,'linewidth',2)
xlabel('time')
ylabel('ye(m)')

subplot(413)
plot(time,v_ex,'linewidth',2)
xlabel('time')
ylabel('ve_x(m)')

subplot(414)
plot(time,v_ey,'linewidth',2)
xlabel('time')
ylabel('ve_y(m)')


figure(2)
subplot(411)
plot(time,p_ex - xe,'linewidth',2)
xlabel('time')
ylabel('xe(m)')

subplot(412)
plot(time,p_ey - ye,'linewidth',2)
xlabel('time')
ylabel('ye(m)')

subplot(413)
plot(time,v_exp - v_ex,'linewidth',2)
xlabel('time')
ylabel('ve_x(m)')

subplot(414)
plot(time,v_eyp - v_ey,'linewidth',2)
xlabel('time')
ylabel('ve_y(m)')

figure(3)
subplot(411)
plot(time,p_ex,'linewidth',2)
xlabel('time')
ylabel('error xe(m)')

subplot(412)
plot(time,p_ey,'linewidth',2)
xlabel('time')
ylabel('error ye(m)')

subplot(413)
plot(time,v_exp,'linewidth',2)
xlabel('time')
ylabel('error ve_x(m)')

subplot(414)
plot(time,v_eyp,'linewidth',2)
xlabel('time')
ylabel('error ve_y(m)')


