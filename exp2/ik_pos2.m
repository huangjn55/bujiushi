function [q0,q1,q2,q3] = ik_pos2(pe,phie,q1_flag,q0_flag)
 pex = pe(1);

pey = pe(2);
    a_1 = evalin('base','a_1');
    a_2 = evalin('base','a_2');
    a_3 = evalin('base','a_3');
    b_0 = evalin('base','b_0');
    b_1 = evalin('base','b_1');
    b_2 = evalin('base','b_2');
%     b_3 = evalin('base','b_3');
    l_1 = evalin('base','l_1');
    l_2 = evalin('base','l_2');
    l_3 = evalin('base','l_3');
    m_0 = evalin('base','m_0');
    m_1 = evalin('base','m_1');
    m_2 = evalin('base','m_2');
    m_3 = evalin('base','m_3');
    M = evalin('base','M');

A = (m_0/M)*b_0;
B = m_0/M*a_1 + (m_0+m_1)/M*b_1;
C = (m_0+m_1)/M*a_2 + (m_0+m_1+m_2)/M*b_2 ;
D = (m_0+m_1+m_2)/M*a_3 + b_2;

temp1 = pex-D*cos(phie);
temp2 = pey-D*sin(phie);

q1 = acos(    (temp1^2+temp2^2-A^2-(B+C)^2)/2/A/(B+C)     );
if q1_flag == 0
    q1 = -q1;
end

q2 = 0;

q0 = acos(     (   temp1*(A+(B+C)*cos(q1))+temp2*(B+C)*sin(q1)   )/(   (A+(B+C)*cos(q1))^2 +(B+C)^2*sin(q1)^2   )     );
if q0_flag == 0
    q0 = -q0;
end

q3 = phie -q0 - q1 - 0;


end