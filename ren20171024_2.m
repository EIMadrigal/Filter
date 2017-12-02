clc;
clear;

N = 16;
T = 1/(16*50);
H = [1 exp(-1j*pi*(N - 1)/N) exp(-1j*2*pi*(N - 1)/N) 0 0 0 0 0 0 0 0 0 0 0 -exp(-1j*14*pi*(N - 1)/N) -exp(-1j*15*pi*(N - 1)/N)];
h = ifft(H)

%离散谱
t = 0:N - 1;
res1 = abs(H);         %幅频特性
subplot(2,2,1),stem(t,res1(t + 1));
title('滤波器（离散幅频）');
xlabel('n');
ylabel('幅度');
res2 = angle(H);       %相频特性
subplot(2,2,2),stem(t,res2(t + 1));
title('滤波器（离散相频）');
xlabel('n');
ylabel('相位');

%连续谱
y = [h,zeros(1,400)];
Y = fft(y);
w = 0:pi/200:2*pi;
subplot(2,2,3),plot(abs(Y));
title('滤波器（连续幅频）');
xlabel('w');
ylabel('幅度');
subplot(2,2,4),plot(angle(Y));
title('滤波器（连续相频）');
xlabel('w');
ylabel('相位');