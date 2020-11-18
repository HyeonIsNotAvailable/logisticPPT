clear; close all; clc;

addpath('D:\angeloyeo.github.io\MATLAB\�ٸ��������code\Annotate-v1.2.1\Annotate\');
addpath('C:\angeloyeo.github.io\MATLAB\�ٸ��������code\Annotate-v1.2.1\Annotate\');

%% ��ǥ��鸸 

%% ������ subspace

figure('color','w','position',[680, 300, 480, 480]);
hold on;
set(gca,'Visible','off')
xlim([-5, 5])
ylim([-5, 5])

Annotate(gca,'arrow', [-5, 5], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-5, 5]);

for i = -5:4
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -5:4
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(4.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.5, 4.8105, '$$y$$','interpreter','latex','fontsize',12);

% row space and null space
h = Annotate(gca,'arrow', [0, -1], [0, 1]);
h.Primitive.Color = [0, 0, 0];
h.Primitive.LineWidth = 2;

h = Annotate(gca,'arrow', [0, 2], [0, 3]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;

h = Annotate(gca,'arrow', [0, 1], [0, 4]);
h.Primitive.Color = [0.2, 0.2, 1];
h.Primitive.LineWidth = 2;

line([-1, 1],[1, 4],'linestyle','--')
line([2, 1],[3, 4],'linestyle','--')

xx = linspace(-5,5,100);
yy1 = 2/3*xx+5/3;
plot(xx, yy1,'b');

%% subspace�� �ƴ� ����� �׸�
figure('color','w','position',[680, 300, 480, 480]);
hold on;
set(gca,'Visible','off')
xlim([-5, 5])
ylim([-5, 5])

Annotate(gca,'arrow', [-5, 5], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-5, 5]);

for i = -5:4
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -5:4
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(4.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.5, 4.8105, '$$y$$','interpreter','latex','fontsize',12);

% row space and null space
h = Annotate(gca,'arrow', [0, 2], [0, 2]);
h.Primitive.Color = [0, 0, 0];
h.Primitive.LineWidth = 2;

h = Annotate(gca,'arrow', [0, 1], [0, 1]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;

xx = linspace(-5,5,100);
yy1 = xx;
plot(xx, yy1,'b');
%% ��� A = [2, 1; 4, 2]�� ������� �������� �ð�ȭ

figure('color','w','position',[680, 300, 480, 480]);
hold on;
set(gca,'Visible','off')
xlim([-5, 5])
ylim([-5, 5])

Annotate(gca,'arrow', [-5, 5], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-5, 5]);

for i = -5:4
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -5:4
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(4.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.5, 4.8105, '$$y$$','interpreter','latex','fontsize',12);

% row space and null space
h = Annotate(gca,'arrow', [0, 4], [0, 2]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;

h = Annotate(gca,'arrow', [0, 2], [0, 1]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;

xx = linspace(-5,5,100);
yy1 = 1/2 * xx;
plot(xx, yy1,'r');
% yy2 = -2 * xx;
% plot(xx, yy2, 'r--');

%% column space �׸� ��

figure('color','w','position',[680, 300, 480, 480]);
hold on;
set(gca,'Visible','off')
xlim([-5, 5])
ylim([-5, 5])

Annotate(gca,'arrow', [-5, 5], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-5, 5]);

for i = -5:4
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -5:4
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(4.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.5, 4.8105, '$$y$$','interpreter','latex','fontsize',12);

% row space and null space
h = Annotate(gca,'arrow', [0, 2], [0, 4]);
h.Primitive.Color = [0, 0, 1];
h.Primitive.LineWidth = 2;

h = Annotate(gca,'arrow', [0, 1], [0, 2]);
h.Primitive.Color = [0, 0, 1];
h.Primitive.LineWidth = 2;

xx = linspace(-5,5,100);
yy1 = 2 * xx;
plot(xx, yy1,'b');
% yy2 = -1/2 * xx;
% plot(xx, yy2, 'b--');

%% ������� �������� �ð�ȭ �Բ�


%% ��� A = [2, 1; 4, 2]�� ������� �������� �ð�ȭ

figure('color','w','position',[680, 300, 480, 480]);
hold on;
set(gca,'Visible','off')
xlim([-5, 5])
ylim([-5, 5])

Annotate(gca,'arrow', [-5, 5], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-5, 5]);

for i = -5:4
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -5:4
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(4.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.5, 4.8105, '$$y$$','interpreter','latex','fontsize',12);

% row space and null space
h = Annotate(gca,'arrow', [0, 4], [0, 2]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;

h = Annotate(gca,'arrow', [0, 2], [0, 1]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;

xx = linspace(-5,5,100);
yy1 = 1/2 * xx;
plot(xx, yy1,'r');
yy2 = -2 * xx;
plot(xx, yy2, 'r--');
