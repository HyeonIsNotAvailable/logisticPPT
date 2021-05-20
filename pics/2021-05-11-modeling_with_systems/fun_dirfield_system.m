function fun_dirfield_system(func_dxdt, func_dydt,xval,yval, varargin)
% 2�� 1�� �̺й����Ŀ� ���� �������� �׷��ִ� �Լ�.
%
% 2�� 1�� �̺й������̶� ���� �Ʒ��� ���� ������ ������ ������ ������.
%
% dx/dt = f(x, y)
% dy/dt = g(x, y)
%
% Ȥ�� ������ �̺й������� ������ ��쿡�� ������ ���� ���µ� ����� �� ����.
% �� ��쿡�� ��� plot�� animation�� ��.
% dx/dt = f(x, y) + p(t)
% dy/dt = g(x, y) + q(t)
%
% [�Է�]
%
% func_dxdt

params = inputParser;
params.CaseSensitive = false;
params.addParameter('t', false); % nonhomogenous outforcing�� ���� �뵵
params.addParameter('p', false); % nonhomogenous outforcing�� ���� �뵵
params.addParameter('q', false); % nonhomogenous outforcing�� ���� �뵵
params.addParameter('color', 0.5 * ones(1,3)); % nonhomogenous outforcing�� ���� �뵵
params.addParameter('stream',false)
params.addParameter('record',false)
params.addParameter('filename','default_name')

params.parse(varargin{:});

t = params.Results.t;
p = params.Results.p; % particular 
q = params.Results.q;
arrow_color = params.Results.color;
h_stream = params.Results.stream;
h_record = params.Results.record;
filename = params.Results.filename;

h_nonhomogeneous = false;

if any(t)
    h_nonhomogeneous = true;
    if p == false
       p = zeros(size(q));
    end
    if q == false
        q = zeros(size(p));
    end
    
end

if nargin == 3
    yval = xval;
end

[xm,ym]=meshgrid(xval,yval);

framerate = 20;
if h_record
    newVid = VideoWriter(filename,'MPEG-4');
    
    newVid.FrameRate = framerate;
    newVid.Quality = 100;
    open(newVid);
end

if ~h_nonhomogeneous
    xp=feval(func_dxdt,xm,ym);
    yp=feval(func_dydt,xm,ym);
    
    s = sqrt(xp.^2+yp.^2); % ��� quiver�� ���⸸ ��Ÿ���� �ǹǷ� ũ��� ����ȭ �ϰ���.
    
    quiver(xval,yval,xp./s,yp./s, 0.5,'color',arrow_color);
    axis tight;
    xlabel('$$x$$','interpreter','latex');
    ylabel('$$y$$','interpreter','latex');
        
    if h_stream
        [verts,averts] = streamslice(xval,yval,xp,yp);
        sl = streamline([verts averts]);

        iverts = interpstreamspeed(xval,yval,xp,yp,verts,0.02);
        [~,M] = streamparticlesMod(iverts,100,'Animate',3,'FrameRate',framerate,'Markersize',5);
    end
    if h_record
        writeVideo(newVid, repmat(M, 1, 5));
        close(newVid)
    end
else
    
    for i_t = 1:length(t)
        xp=feval(func_dxdt,xm,ym) - p(i_t);
        yp=feval(func_dydt,xm,ym) - q(i_t);
        
        s = sqrt(xp.^2+yp.^2); % ��� quiver�� ���⸸ ��Ÿ���� �ǹǷ� ũ��� ����ȭ �ϰ���.
        
        quiver(xval,yval,xp./s,yp./s, 0.5,'color',arrow_color);
        xlabel('$$x$$','interpreter','latex');
        ylabel('$$y$$','interpreter','latex');
        
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

