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
params.addParameter('p', @(t) 0); % nonhomogenous forcing�� ���� �뵵
params.addParameter('newFigure', false);
params.addParameter('color',0.5 * ones(1,3))
params.addParameter('linewidth',1)

params.parse(varargin{:});

p = params.Results.p;
h_fig = params.Results.newFigure;
color = params.Results.color;
linewidth = params.Results.linewidth;

if nargin == 2
    yval = tval;
end

if h_fig
    figure;
end

[tm,ym]=meshgrid(tval,yval);

dt = tval(2) - tval(1);
dy = yval(2) - yval(1);
yp=feval(func,tm,ym) + feval(p, tm);
s = 1./max(1/dt,abs(yp)./dy)*0.35;
quiver(tval,yval,s,s.*yp,0,'.','color',color,'linewidth',linewidth);
quiver(tval,yval,-s,-s.*yp,0,'.','color',color,'linewidth',linewidth);
grid on;
axis tight;
hold on;

xlabel('$t$','interpreter','latex');
ylabel('$x$','interpreter','latex');