clear; close all; clc;

%% h = 10�� ���
figure;
x = -10:10;

f = zeros(1,length(x));
f(x==0) = 0;

% ���� x�� ���ؼ�

for i = find(x==0):length(f)-1
    f(i+1) = x(i) + f(i);
end

% ���� x�� ���ؼ�
for i = find(x==0):-1:2
   f(i-1) =  f(i) - x(i-1);
end

plot(x, f,'o-','linewidth',2)
xlabel('$$x$$','interpreter','latex');
ylabel('$$f(x)$$','interpreter','latex');
grid on;

title('$$f(x+1) = x + f(x)$$','interpreter','latex')
set(gca,'fontsize',12)
set(gca,'xtick', -10:1:10)