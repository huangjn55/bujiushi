function [r_0x,r_0y,phi_0,p_ex,p_ey,phi_e] = calculation(a1_hat,a2_hat,a3_hat)
    a15_hat = a1_hat;
    a25_hat = a2_hat;
    a35_hat = a3_hat;
    
    simout = sim('exp2_p2p_calculations');
    r_0x = simout.r_0x.data(end);
    r_0y = simout.r_0y.data(end);
    phi_0 = simout.theta_0.data(end);
    p_ex = simout.p_ex.data(end);
    p_ey = simout.p_ey.data(end);
    phi_e = simout.phi_e.data(end);



end