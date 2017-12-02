clc;
clear;

%采样
T = 1/(16*50);
i = 0:T:31*T;
t = 0:31;
s0 = 0.5;
s1 = cos(100*pi*i + pi/2);
s2 = 0.5*cos(200*pi*i + pi);
s3 = 2*cos(300*pi*i - pi/2);
s = s0 + s1 + s2 + s3; 
stem(t,s(t + 1))
title('时域采样');
xlabel('n');
ylabel('s(n)');