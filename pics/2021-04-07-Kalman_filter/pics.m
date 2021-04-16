clear; close all; clc;

%% gaussian ����
xx = linspace(-5, 5, 1000);
yy = normpdf(xx, 0, 1);

figure('color','w');
plot(xx, yy,'linewidth',2);
xlabel('x'); ylabel('f(x)');
ylim([0, 0.45])
xlim([-5, 5])
title('ǥ�� ���� ����');
grid on;
