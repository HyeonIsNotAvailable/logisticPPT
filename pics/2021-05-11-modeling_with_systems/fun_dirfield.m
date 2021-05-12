function fun_dirfield(func,tval,yval, varargin)
% 1�� �̺й����Ŀ� ���� �������� �׷��ִ� �Լ�
%
% ���⼭ 1�� �̺й������� ������ ���� ���� ����.
%
% dy/dt = f(t, y)
%
% Ȥ�� ������ �̺й������� ������ ��쿡�� ������ ���� ���µ� ����� �� ����.
% �� ��쿡�� plot�� animation�� ��.
% dy/dt = f(t, y) + p(t)
%
% [�Է�]
%
% func: �Լ� �ڵ� �Է�
% tval: x�࿡ ȭ��ǥ�� ǥ���� ��ġ���� �׸� ��. ���� linspace(-1, 1, 10) �̶�� �ϸ� -1�� 1���̿� 10����
% ȭ��ǥ�� �׷����� �� ����. 
% yval: ���� ���������̳� y �࿡ ȭ��ǥ�� ǥ���� ��ġ���� �׸� ��.
% 
% [��� ����]
%
% fun_dirfield(@(t,y) 1/4.y^3, linspace(-4, 4, 10), linspace(-4, 4, 10));
%
% (c) �������� ����������Ʈ 2021/05/12

params = inputParser;
params.CaseSensitive = false;
params.addParameter('t', false); % nonhomogenous outforcing�� ���� �뵵
params.addParameter('p', false); % nonhomogenous outforcing�� ���� �뵵
params.addParameter('newFigure', false);

params.parse(varargin{:});

t = params.Results.t;
p = params.Results.p;
h_fig = params.Results.newFigure;

h_animate = false;

if any(t)
    h_animate = true;
end

if nargin == 2
    yval = tval;
end

if h_fig
    figure;
end

[tm,ym]=meshgrid(tval,yval);

dt = tval(2) - tval(1);
dy = yval(2) - yval(1);

if ~h_animate
    yp=feval(func,tm,ym);

    s = 1./max(1/dt,abs(yp)./dy)*0.35;

    quiver(tval,yval,s,s.*yp,0,'.','color',0.5 * ones(1,3));

    quiver(tval,yval,-s,-s.*yp,0,'.','color',0.5 * ones(1,3));

    axis tight;
else
    
    for i_t = 1:length(t)
        yp=feval(func,tm,ym) + p(i_t);
        s = 1./max(1/dt,abs(yp)./dy)*0.35;
        quiver(tval,yval,s,s.*yp,0,'.','color',0.5 * ones(1,3));
        quiver(tval,yval,-s,-s.*yp,0,'.','color',0.5 * ones(1,3));
        
        axis tight;
        hold on;
        XLIMs = xlim;
        YLIMs = ylim;
        
        text((XLIMs(2) - XLIMs(1)) * 0.1 + XLIMs(1), (YLIMs(2) - YLIMs(1)) * 0.9 + YLIMs(1),['t=',sprintf('%.2f',t(i_t))],'BackgroundColor','w','fontsize',15);
        
        pause(0.1)
        if i_t < length(t)
            cla;
        end
    end
    
end