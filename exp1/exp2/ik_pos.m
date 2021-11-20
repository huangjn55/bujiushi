function [q1,q2,q3] = ik_pos(r0,q0,pe,phie,q_last)
r0x = r0(1);
r0y = r0(2);
pex = pe(1);
pey = pe(2);
l1 = evalin('base','l_1');
l2 = evalin('base','l_2');
l3 = evalin('base','l_3');
b0 = evalin('base','b_0');

q123 = phie-q0;
temp1 = pex-l3*cos(phie)-r0x-b0*cos(q0);
temp2 = pey-l3*sin(phie)-r0y-b0*sin(q0);
q2_1 = acos((temp1^2+temp2^2-l1^2-l2^2)/(2*l1*l2));

q2_2 = -q2_1;
if abs(q2_1-q_last(2))>= abs(q2_2-q_last(2))
    q2 = q2_2;
else
    q2 = q2_1;
end
a = (l1+l2*cos(q2))*temp1+l2*sin(q2)*temp2;
b = (l1+l2*cos(q2))^2 + (l2*sin(q2))^2;
q12_1 = acos(a/b);
q12_2 = -q12_1;
q12_1;
q12_2;

if abs(q12_1-(q_last(1)+q_last(2)))>=abs(q12_2-(q_last(1)+q_last(2)))
    q12 = q12_2;
else
    q12 = q12_1;
end

q1 = q12 - q0;
q3 = q123-q1-q2;
end