clear; close all; clc;
xx = linspace(-3,3,100);
yy = normpdf(xx, 0, 1);

figure;
% subplot(2,1,1);
plot(xx, yy)
set(gca,'visible','off')
% subplot(2,1,2);
% rng(1)
% plot(randn(1), 0, 'ro');
% xlim([-3, 3])

%% k=1�� ī������ ���� �ùķ��̼�
figure;
newVid = VideoWriter('pic2','MPEG-4');

newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);
rng(1);
my_list = randn(1,1000);
my_list = my_list.^2;

for i = round(linspace(1,1000,100))
    histogram(my_list(1:i));
    xlim([0, 12])
    xlabel('x');
    ylabel('frequency');
    title('�������� 1�� ī������ ���� �ùķ��̼�');
    grid on;
    YLIM = ylim;
    text(8, YLIM(2) * 0.9, ['�ݺ� Ƚ�� = ',num2str(i)], 'fontsize', 12);
    writeVideo(newVid, getframe(gcf));
    if i == 1000
        for j = 1:20
            writeVideo(newVid, getframe(gcf));
        end
    end
    
    drawnow;
    if i< 1000
        cla
    end
end
close(newVid);

%% Chi-square ������ ��
figure;
hist_val = histogram(my_list,'Normalization','pdf'); 

hold on;
xx = linspace(0, 12, 100);
yy = pdf('chi2', xx, 1);
% yy = yy./max(yy) * max(hist_val.Values);
plot(xx, yy,'linewidth',2)
xlabel('x');
ylabel('Normalized Frequency');
grid on;
title('�������� 1�� ī������ �������� ��');

%% k=3�� ī������ ���� �ùķ��̼�
figure;
newVid = VideoWriter('pic5','MPEG-4');

newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);
rng(1);
my_list2 = randn(3,1000);
my_list2 = my_list2.^2;
my_list2 = sum(my_list2,1);

for i = round(linspace(1,1000,100))
    histogram(my_list2(1:i));
    xlim([0, 16])
    xlabel('x');
    ylabel('frequency');
    title('�������� 3�� ī������ ���� �ùķ��̼�');
    grid on;
    YLIM = ylim;
    text(8, YLIM(2) * 0.9, ['�ݺ� Ƚ�� = ',num2str(i)], 'fontsize', 12);
    writeVideo(newVid, getframe(gcf));
    if i == 1000
        for j = 1:20
            writeVideo(newVid, getframe(gcf));
        end
    end
    
    drawnow;
    if i< 1000
        cla
    end
end
close(newVid);

%% Chi-square ������ ��
figure;
hist_val = histogram(my_list2,'Normalization','pdf'); 

hold on;
xx = linspace(0, 16, 100);
yy = pdf('chi2', xx, 3);
% yy = yy./max(yy) * max(hist_val.Values);
plot(xx, yy,'linewidth',2)
xlabel('x');
ylabel('Normalized Frequency');
grid on;
title('�������� 3�� ī������ �������� ��');

%%

my_color = lines(4);
figure;
xx = linspace(0, 8, 100);
for i_df = 1:4
    yy = pdf('chi2', xx, i_df);
    hold on;
    h(i_df) = plot(xx, yy,'color',my_color(i_df,:),'linewidth',2);
    
end

legend(h, '������: 1', '������: 2','������: 3','������: 4');
grid on;
xlabel('x');
ylabel('pdf');
title('�پ��� �������� ���� ī������ ������ ��');