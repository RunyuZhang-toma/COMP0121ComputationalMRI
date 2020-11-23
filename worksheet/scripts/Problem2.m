clear;
clc;

t_pulse = 1;    % ms
delta_theta = pi/2; % 90 deg
w1 = delta_theta/t_pulse;
t = linspace(0,t_pulse,20);
fps = 10;

M0 = [0 0 1]';
M = forced_procession_rot(t,M0,w1);

fig = figure();
set(gcf, 'color', [1 1 1])
ax = axes();
F = [];
for ii = 1:length(t)
    draw_frame(ax,struct('M0',M0,...
                         'Mt',M(:,ii),...
                         'M',M(:,1:ii),...
                         't',t(ii)),["X'","Y'","Z'"]);
    % draw B_eff
    draw_vector(ax,[0,0,0],[1,0,0],'B_{eff}');
    F =[F,getframe(fig)];
end

save_pdf(fig,'figure2.4.pdf');
save_video('video2.4.avi',F,fps);

