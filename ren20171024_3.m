clc;
clear;

N = 16;
L = 2*N;
T = 1/(16*50);
i = 0:T:31*T;
t = 0:31;
s0 = 0.5;
s1 = cos(100*pi*i + pi/2);
s2 = 0.5*cos(200*pi*i + pi);
s3 = 2*cos(300*pi*i - pi/2);
s = s0 + s1 + s2 + s3; 

r = 0.95;
y1 = CombFilter(s,N,r);                    %梳妆滤波器

z = zeros(1,L + N);
H = [1 exp(-1j*pi*(N - 1)/N) exp(-1j*2*pi*(N - 1)/N) 0 0 0 0 0 0 0 0 0 0 0 -exp(-1j*14*pi*(N - 1)/N) -exp(-1j*15*pi*(N - 1)/N)];

for order = 0:N/2
    y2 = Resonator2(y1,N,r,order,H(order + 1));             %谐振器
    z = z + y2;
end

y2 = z/N;

for i = N:31
    y3(i - N + 1) = y2(i + 1);                %输出信号第二个周期
end

i1 = 0:N - 1;
subplot(2,2,1),stem(i1,y3(i1 + 1));              %时域波形
title('输出信号时域');
xlabel('n');
ylabel('s(n)');
res1 = abs(fft(y3));
subplot(2,2,3),stem(i1,res1(i1 + 1));            %幅频特性
title('输出信号幅频');
xlabel('n');
ylabel('幅度');
res2 = angle(fft(y3));
subplot(2,2,4),stem(i1,res2(i1 + 1));            %相频特性
title('输出信号相频');
xlabel('n');
ylabel('相位');