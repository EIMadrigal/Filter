clc;
clear;

N = 16;
T = 1/(16*50);
H = [1 exp(-1j*pi*(N - 1)/N) exp(-1j*2*pi*(N - 1)/N) 0 0 0 0 0 0 0 0 0 0 0 -exp(-1j*14*pi*(N - 1)/N) -exp(-1j*15*pi*(N - 1)/N)];
h = ifft(H)

%��ɢ��
t = 0:N - 1;
res1 = abs(H);         %��Ƶ����
subplot(2,2,1),stem(t,res1(t + 1));
title('�˲�������ɢ��Ƶ��');
xlabel('n');
ylabel('����');
res2 = angle(H);       %��Ƶ����
subplot(2,2,2),stem(t,res2(t + 1));
title('�˲�������ɢ��Ƶ��');
xlabel('n');
ylabel('��λ');

%������
y = [h,zeros(1,400)];
Y = fft(y);
w = 0:pi/200:2*pi;
subplot(2,2,3),plot(abs(Y));
title('�˲�����������Ƶ��');
xlabel('w');
ylabel('����');
subplot(2,2,4),plot(angle(Y));
title('�˲�����������Ƶ��');
xlabel('w');
ylabel('��λ');