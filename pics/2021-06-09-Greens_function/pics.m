clear; close all; clc;

xx = linspace(-3,3,100);

p1 = [-2, 1.5, 1];
p2 = [3, -2, -5];
yy1 = polyval(poly(p1), xx);
yy2 = polyval(poly(p2), xx);

my_color = lines(4);
%% ǥ���� �κ� ����

highlight = 65:70;

figure;
plot(xx, yy1, 'color',my_color(1,:),'linewidth',5);
hold on;
plot(xx(highlight), yy1(highlight),'color','r','linewidth',8)
set(gca,'visible','off')
figure;
plot(xx, yy2, 'color',my_color(1,:),'linewidth',5);
hold on;
plot(xx(highlight), yy2(highlight),'color','r','linewidth',8)
set(gca,'visible','off')