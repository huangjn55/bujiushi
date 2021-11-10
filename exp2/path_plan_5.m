function pe = path_plan(pe_initial,pe_target,tf,t)
a0 = pe_initial;
a1 = 0;
a2 = 0;
a3 = 20.*(pe_target - pe_initial)./(2.*tf^3);
a4 = -30.*(pe_target - pe_initial)./(2.*tf^4);
a5 = 12.*(pe_target - pe_initial)./(2.*tf^5);

pe = a0+a1*t+a2*(t^2)+a3*(t^3)+a4*(t^4)+a5*(t^5);




