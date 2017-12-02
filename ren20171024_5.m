clc;
clear;

N = 16;
T = 1/(16*50);
i = 0:T:31*T;
t = 0:31;
s = [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];        %输入周期为N的冲激串

r = 0.95;
y1 = CombFilter(s,N,r);

z = zeros(1,48);

for order = 0:N/2
    H = [1 exp(-1j*pi*(N - 1)/N) exp(-1j*2*pi*(N - 1)/N) 0 0 0 0 0 0 0 0 0 0 0 -exp(-1j*14*pi*(N - 1)/N) -exp(-1j*15*pi*(N - 1)/N)];
    y2 = Resonator2(y1,N,r,order,H(order + 1));
    z = z + y2;
end

y2 = z/N;

for i = N:31
    y3(i - N + 1) = y2(i + 1);
end

%离散谱
i1 = 0:N - 1;
subplot(3,2,1),stem(i1,y3(i1 + 1));              %时域波形
title('时域波形');
xlabel('n');
ylabel('s(n)');
res1 = abs(fft(y3));
subplot(3,2,3),stem(i1,res1(i1 + 1));            %幅频特性
title('离散幅频');
hold on
stem(i1,abs(H),'red','square');
xlabel('n');
ylabel('幅度');
res2 = angle(fft(y3));
subplot(3,2,4),stem(i1,res2(i1 + 1));            %相频特性
title('离散相频');
xlabel('n');
ylabel('相位');

%连续谱
y = [y3,zeros(1,400)];
Y = fft(y);
w = 0:pi/200:2*pi;
subplot(3,2,5),plot(abs(Y));
title('连续幅频');
xlabel('n');
ylabel('幅度');
subplot(3,2,6),plot(angle(Y));
title('连续相频');
xlabel('n');
ylabel('相位');