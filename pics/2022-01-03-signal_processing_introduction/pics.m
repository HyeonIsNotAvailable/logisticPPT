load gong.mat
audiowrite('pic1_sound.wav', y, Fs);
t = 0:1/Fs:length(y)/Fs-1/Fs;
% sound(y, Fs)

figure('position',[146, 472, 1920, 1080],'color','w');
plot(t, y)
grid on;
hold on;
xlabel('time (s)');
ylabel('amplitude');

axis tight

newVid = VideoWriter('pic1','MPEG-4');

newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);
YLIMs = ylim;
% 1�ʸ� �̵��ϴµ� �� ���� sample�� �ʿ��ұ�?
% 8192 ���� ������ �ʿ��ϰ���
interval = round(8192/newVid.FrameRate);
for i_t = [1:interval:length(t), length(t)]
    h = line(t(i_t) * ones(1,2), YLIMs, 'color','r','linewidth',2);
    writeVideo(newVid, getframe(gcf));
    
    drawnow;
    if i_t< length(t)
        delete(h)
    end
end
close(newVid);