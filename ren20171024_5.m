clc;
clear;

N = 16;
T = 1/(16*50);
i = 0:T:31*T;
t = 0:31;
s = [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];        %��������ΪN�ĳ弤��

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

%��ɢ��
i1 = 0:N - 1;
subplot(3,2,1),stem(i1,y3(i1 + 1));              %ʱ����
title('ʱ����');
xlabel('n');
ylabel('s(n)');
res1 = abs(fft(y3));
subplot(3,2,3),stem(i1,res1(i1 + 1));            %��Ƶ����
title('��ɢ��Ƶ');
hold on
stem(i1,abs(H),'red','square');
xlabel('n');
ylabel('����');
res2 = angle(fft(y3));
subplot(3,2,4),stem(i1,res2(i1 + 1));            %��Ƶ����
title('��ɢ��Ƶ');
xlabel('n');
ylabel('��λ');

%������
y = [y3,zeros(1,400)];
Y = fft(y);
w = 0:pi/200:2*pi;
subplot(3,2,5),plot(abs(Y));
title('������Ƶ');
xlabel('n');
ylabel('����');
subplot(3,2,6),plot(angle(Y));
title('������Ƶ');
xlabel('n');
ylabel('��λ');