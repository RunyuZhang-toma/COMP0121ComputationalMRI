clear;
clc;

t_max = 25;    % ms
T1 = 10;       % ms
T2 = 5;        % ms
t = linspace(0,t_max,100);
fps = 10;
delta_w = -0.05*4*pi; % KHz

M0 = [0 1 0]';
M = free_procession_euler(t,M0,T1,T2,delta_w);

fig = figure();
set(gcf, 'color', [1 1 1])
ax = axes();
F = [];
for ii = 1:length(t)
    draw_frame(ax,struct('M0',M0,...
                         'Mt',M(:,ii),...
                         'M',M(:,1:ii),...
                         't',t(ii)),["X'","Y'","Z'"]);
    F =[F,getframe(fig)];
end

save_pdf(fig,'figure3.5.pdf');
save_video('video3.5.avi',F,fps);
