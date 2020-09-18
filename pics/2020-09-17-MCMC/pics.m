clear; close all; clc;

n_iter = 10000;
accept = 0;
reject = 0;
figure('position',[680, 558, 453, 420],'color','w')

newVid = VideoWriter('pic1', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

for i_iter = 1:n_iter
    x = rand(1) * 2 -1;
    y = rand(1) * 2 -1;
    
    if (x^2 + y^2) <= 1
        accept = accept + 1;
        c = 'r';
    else
        reject = reject + 1;
        c = 'b';
    end
    plot(x, y,'.', 'color',c);
    hold on;
    
    t = text(0, -0.77557, sprintf('���� ����: %.4f',4 * accept / i_iter),'fontsize',15,'fontweight','bold','BackgroundColor','w');
    
    if rem(i_iter, 100) == 0
        xlim([-1, 1])
        ylim([-1, 1])
        writeVideo(newVid, getframe(gcf))
        drawnow;
    end
    
    if i_iter < n_iter
        delete(t);
    end
end

for i = 1:30 % ������ ��鿡�� 1.5�� �� ����� �� �ֵ���
    writeVideo(newVid, getframe(gcf))
end


close(newVid)

%% sampling 

% ������: https://www.cs.ubc.ca/~arnaud/andrieu_defreitas_doucet_jordan_intromontecarlomachinelearning.pdf
%
%

rng(1)
n_iter = 5000;
target = @(x) 0.3*exp(-0.2 * x.^2) + 0.7 * exp(-0.2 * (x - 10).^2);
xx = linspace(-10,20, 1000);
figure('color','w');
plot(xx, target(xx),'linewidth',2)
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('$$f(x) = 0.3e^{-0.2x^2} + 0.7e^{-0.2(x-10)^2}$$','interpreter','latex')

%% ���� ���� �ϳ� �׷��ֱ�

figure('color','w');
h1 = plot(xx, target(xx),'linewidth',2);
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('$$f(x) = 0.3e^{-0.2x^2} + 0.7e^{-0.2(x-10)^2}$$','interpreter','latex')
hold on;
h2 = plot(xx, normpdf(xx, 7, 2),'linewidth',2,'linestyle','--');
legend([h1, h2], 'Ÿ�� ����', '���� ����')

%% ���Ⱥ����κ��� ���� ����Ʈ ��õ �ޱ�

figure('color','w','position',1000*[0.3298, 0.3420, 1.2048, 0.4200]);
subplot(1,2,1);
h1 = plot(xx, target(xx),'linewidth',2);
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('���ο� ������ �����ϴ� ���')
hold on;
h2 = plot(xx, normpdf(xx, 7, 2),'linewidth',2,'linestyle','--');
rng(1); x_new = randn(1) * 2 + 7

line([7, 7],[0, target(7)],'color','r','linestyle','--')
plot(7, target(7),'o','markerfacecolor','r');

line([x_new x_new],[0, target(x_new)],'color','b','linestyle','--')
plot(x_new, target(x_new),'o','markerfacecolor','b');

legend([h1, h2], 'Ÿ�� ����', '���� ����')

subplot(1,2,2);
h1 = plot(xx, target(xx),'linewidth',2);
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('���ο� ������ �����ϴ� ���')
hold on;
h2 = plot(xx, normpdf(xx, 7, 2),'linewidth',2,'linestyle','--');
x_new = 10;

line([7, 7],[0, target(7)],'color','r','linestyle','--')
plot(7, target(7),'o','markerfacecolor','r');

line([x_new x_new],[0, target(x_new)],'color','b','linestyle','--')
plot(x_new, target(x_new),'o','markerfacecolor','b');

legend([h1, h2], 'Ÿ�� ����', '���� ����')

%%  Metropolis Hastings

% initialize x_0
x = [];
x = [x, (rand(1, 1) - 0.5) * 30 + 5]; % -10���� 20������ �������� random uniform

proposal = @(x, mu, s) 1/(s*sqrt(2*pi))*exp(-(x-mu)^2/(2*s^2)); % ���Ժ���

my_std = 10;

for i = 1 : n_iter
    u = rand(1); % sample u
    x_old = x(i);
    
    % ���� ���� q(x_new | x_old) = N(x_old, sigma)�κ��� ���� ����
    x_new = randn(1) * my_std + x_old;
    
    % A(x_old, x_new) ���
    A = min(1, ...
        (target(x_new) * proposal(x_old, x_new, my_std)) / ...
        (target(x_old) * proposal(x_new, x_old, my_std))...
        );
    
    if u < A
        x = [x x_new];
        
    else
        x = [x x_old];
    end
end

