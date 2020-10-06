clear; close all; clc;

x = [ones(1, 10), 2 * ones(1, 100), 3 * ones(1, 50)];

figure;
histogram(x, 'Normalization','probability')

set(gca,'xtick',[1,2,3]);
set(gca,'xticklabel',{'��','��','��'});
set(gca,'fontsize',15);
xlabel('���� ���');
ylabel('Ȯ��');
grid on;
title('�� ���� ��� ���� �� ��翡 ���� Ȯ������');