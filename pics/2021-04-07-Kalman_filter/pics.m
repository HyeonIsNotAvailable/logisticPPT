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

%% �� ����þ� ������ ��
xx = linspace(-10, 20, 1000);

mu1 = 0; mu2 = 8;
sigma1 = 2; sigma2 = 4;

yy1 = normpdf(xx, mu1, sigma1);
yy2 = normpdf(xx, mu2, sigma2);

mu_new = (sigma1^2*mu2 + sigma2^2*mu1)/(sigma1^2 + sigma2^2);
sigma_new = sqrt(1/(1/sigma1^2 + 1/sigma2^2));

yy3_1 = yy1.*yy2/(sum(yy1.*yy2)*(xx(2)-xx(1))); % �Ʒ��Ͱ� ���� ��� ������
yy3_2 = normpdf(xx, mu_new, sigma_new);

yy3 = yy1.*yy2;

clear h
figure('color','w');
h(1) = plot(xx, yy1,'linewidth',2);
hold on;
h(2) = plot(xx, yy2,'linewidth',2);
h(3) = plot(xx, yy3_2,'linewidth',2);
xlabel('x');
ylabel('pdf');
title('�� ����þ� ������ ��')
grid on;
% legend(h,'Anyword For Length','Anyword For Length','Anyword For Length')
set(gca,'fontname','�������')