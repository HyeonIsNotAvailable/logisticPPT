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


%% �ڽ��� ȭ��ǥ ��� �͵��� MATLAB���� �׷����� �� ������?

newVid = VideoWriter('pic4', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

addpath('../')
figure('position',[680, 558, 1080, 420],'color','w');
patch([-2, -2, 2, 2], [10, -10, -10, 10],'w','edgecolor','k','linewidth',2)
xlim([-9, 9])
ylim([-12, 12])
hold on;
text(0, 0, sprintf('�̺й����� �ý��� \n (����+������)'),'HorizontalAlignment','center','VerticalAlignment','middle','fontname','�������','fontsize',12)
text(-6, 10, '<�Է� ����>','HorizontalAlignment','center','VerticalAlignment','middle','fontname','�������','fontsize',15,'FontWeight','bold')
text(6, 10, '<��� ����>','HorizontalAlignment','center','VerticalAlignment','middle','fontname','�������','fontsize',15,'FontWeight','bold')

% set(gca,'visible','off')
mArrow2(-3.5,0,-2.5,0,{'linewidth',2})
mArrow2(2.5,0,3.5,0,{'linewidth',2})
set(gca,'visible','off');

clear h
for i_text = 1:5
    txt_colors = {'black','black','black','black','black'};
    txt_colors{i_text} = 'red';
    h(1) = text(-6, 0, sprintf('[\\color{%s}2, \\color{%s}3, \\color{%s}5, \\color{%s}1, \\color{%s}4]', txt_colors{1}, txt_colors{2}, txt_colors{3}, txt_colors{4}, txt_colors{5}),...
        'HorizontalAlignment','center','VerticalAlignment','middle','fontname','�������','fontsize',20,'fontweight','bold');
    h(2) = text(6, 0, sprintf('[\\color{%s}8, \\color{%s}5, \\color{%s}1, \\color{%s}2, \\color{%s}7]', txt_colors{1}, txt_colors{2}, txt_colors{3}, txt_colors{4}, txt_colors{5}),...
        'HorizontalAlignment','center','VerticalAlignment','middle','fontname','�������','fontsize',20,'fontweight','bold');
    
    for ii = 1:10
        writeVideo(newVid, getframe(gcf))
    end
    delete(h);
end

close(newVid)

%% �ڽ��� ȭ��ǥ ��� �͵��� MATLAB���� �׷����� �� ������?

newVid = VideoWriter('pic5', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

addpath('../')
xx1 = linspace(-8,-4,100);
xx2 = linspace(4,8,100);

p1 = [-11, -8, -6]+2;
p2 = [5.8, 7.9, 10.6]-2;
yy1 = polyval(poly(p1), xx1)-3;
yy2 = -polyval(poly(p2), xx2)-3;

my_color = lines(4);

figure('position',[680, 558, 1080, 420],'color','w');
plot(xx1, yy1, 'color',my_color(1,:),'linewidth',2);
hold on;
plot(xx2, yy2, 'color',my_color(1,:),'linewidth',2);
patch([-2, -2, 2, 2], [10, -10, -10, 10],'w','edgecolor','k','linewidth',2)
text(0, 0, sprintf('�̺й����� �ý��� \n (����+������)'),'HorizontalAlignment','center','VerticalAlignment','middle','fontname','�������','fontsize',12)
text(-6, 10, '<�Է� �Լ�>','HorizontalAlignment','center','VerticalAlignment','middle','fontname','�������','fontsize',15,'FontWeight','bold')
text(6, 10, '<��� �Լ�>','HorizontalAlignment','center','VerticalAlignment','middle','fontname','�������','fontsize',15,'FontWeight','bold')
xlim([-9, 9])
ylim([-12, 12])
% set(gca,'visible','off')
mArrow2(-3.5,0,-2.5,0,{'linewidth',2})
mArrow2(2.5,0,3.5,0,{'linewidth',2})
set(gca,'visible','off');

highlight = 1:10;

clear h
while(1)
    if any(highlight>length(xx1))
        break;
    end
    h(1) = plot(xx1(highlight), yy1(highlight), 'color','r','linewidth',3);
    h(2) = plot(xx2(highlight), yy2(highlight), 'color','r','linewidth',3);
    
    h(3) = mArrow2(mean(xx1(highlight)) + 1.5, mean(yy1(highlight)) + 1.5,  mean(xx1(highlight)) + 0.5 , mean(yy1(highlight)) + 0.5,{'color','r'});
    h(4) = mArrow2(mean(xx2(highlight)) + 1.5, mean(yy2(highlight)) + 1.5,  mean(xx2(highlight)) + 0.5 , mean(yy2(highlight)) + 0.5,{'color','r'});
    
    for ii = 1:10
        writeVideo(newVid, getframe(gcf))
    end
    
    delete(h)
    highlight = highlight + 10;
end

close(newVid)



