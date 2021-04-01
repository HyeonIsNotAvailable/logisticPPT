clear; close all; clc;

%% Ŭ�����͸� ���� ���� ���� �׸�
% pic 1
S1 = [0.2, 1;1, 0.3] /10;
S2 = [0.3, -1; -1, 0.2] /10;
n = 500;
clust1 = randn(n,2) * S1 + repmat([0.2, 0.2], n, 1);
clust2 = randn(n,2) * S2 + repmat([0.8, 0.8], n, 1);

figure;
plot(clust1(:,1), clust1(:,2),'o','markerfacecolor',ones(1,3) * 0.4,'markeredgecolor','none')
hold on;
plot(clust2(:,1), clust2(:,2),'o','markerfacecolor',ones(1,3) * 0.4,'markeredgecolor','none');
grid on;
xlabel('x');
ylabel('y');

%% pic 2
% pic 1
my_color = lines(2);

figure;
plot(clust1(:,1), clust1(:,2),'o','markerfacecolor',my_color(1,:),'markeredgecolor','none')
hold on;
plot(clust2(:,1), clust2(:,2),'o','markerfacecolor',my_color(2,:),'markeredgecolor','none');
grid on;
xlabel('x');
ylabel('y');

%% 

clust = [clust1; clust2];
[idx, centroids] = kmeans(clust ,2);

figure;
plot(clust(idx==1,1), clust(idx==1,2),'o');
hold on;
plot(clust(idx==2,1), clust(idx==2,2),'o');

plot(centroids(1,1), centroids(1,2),'kx','linewidth',3,'markersize',15);
plot(centroids(2,1), centroids(2,2),'kx','linewidth',3,'markersize',15);