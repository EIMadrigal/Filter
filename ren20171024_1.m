clc;
clear;

T = 1/(16*50);
i2 = 16*T:T:31*T;
t2 = 0:15;
s0 = 0.5;
s1 = cos(100*pi*i2 + pi/2);
s2 = 0.5*cos(200*pi*i2 + pi);
s3 = 2*cos(300*pi*i2 - pi/2);

s = s0 + s1 + s2 + s3; 

res1 = abs(fft(s));         %��Ƶ����
subplot(2,1,1),stem(t2,res1(t2 + 1));
title('�����źŷ�Ƶ');
xlabel('n');
ylabel('����');
res2 = angle(fft(s));       %��Ƶ����
subplot(2,1,2),stem(t2,res2(t2 + 1));
title('�����ź���Ƶ');
xlabel('n');
ylabel('��λ');