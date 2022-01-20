clear; close all; clc;

%% �ֱⰡ 6�� �ڻ��� ��ȣ
temp = linspace(0, 2*pi, 7);
x=repmat(cos(temp(1:6)), 1, 5);
n=[(0:5)-12, (0:5)-6, 0:5, (0:5)+6, (0:5)+12];

figure('position',[906,558, 800, 170]);
stem(n, x,'k','linewidth',2);
xlim([-10, 10])
% ylim([-1, 6])
grid on;
xlabel('n');
ylabel('x[n]');
title('�ֱⰡ 6�� �ڻ��� ��ȣ');
set(gca,'fontname','�������');

%% �ֱⰡ 6�� ���� ������

plotXY(-1.5, 1.5, -1.5, 1.5,'complex_plane', true)
hold on;
theta = linspace(0, 2*pi, 1000);
plot(cos(theta), sin(theta),'k--');

xx = real(exp(1j*temp(1:6)));
yy = imag(exp(1j*temp(1:6)));

for i = 1:length(xx)
    plot([0, xx(i)], [0, yy(i)],'r-','linewidth',2);
    plot(xx(i), yy(i),'o','markerfacecolor','k','markeredgecolor','none','markersize',12);
end
axis square

%% �ֱⰡ 6�� �̻� ��ȣ
x=repmat([5,4,3,2,1,0], 1, 5);
n=[(0:5)-12, (0:5)-6, 0:5, (0:5)+6, (0:5)+12];

figure('position',[906,558, 800, 170]);
stem(n, x,'k','linewidth',2);
xlim([-10, 10])
ylim([-1, 6])
grid on;
xlabel('n');
ylabel('x[n]');
title('�ֱⰡ 6�� �̻� ��ȣ');
set(gca,'fontname','�������');