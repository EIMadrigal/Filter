clc;
clear;

N = 16;
T = 1/(16*50);
i = 0:T:31*T;
t = 0:31;
s0 = 0.5;
s1 = cos(100*pi*i + pi/2);
s2 = 0.5*cos(200*pi*i + pi);
s3 = 2*cos(300*pi*i - pi/2);
s = s0 + s1 + s2 + s3; 

r = 0.999;
y1 = CombFilter(s,N,r);

for i = 0:3
    z = zeros(1,48);
    order = i;            %第i路
    H = [1 exp(-1j*pi*(N - 1)/N) exp(-1j*2*pi*(N - 1)/N) 0 0 0 0 0 0 0 0 0 0 0 -exp(-1j*14*pi*(N - 1)/N) -exp(-1j*15*pi*(N - 1)/N)];
    y2 = Resonator2(y1,N,r,order,H(order + 1));
    z = z + y2;
    
    for j = N:31
        y3(j - N + 1) = y2(j + 1);
    end
    
    i1 = 0:N - 1;
    subplot(2,2,i + 1),stem(i1,y3(i1 + 1));              %时域波形
    title(['第',num2str(i+1),'路']);
    xlabel('n');
    ylabel('s(n)');
end
