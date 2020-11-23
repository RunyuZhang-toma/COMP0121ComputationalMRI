clear;
clc;

t_pulse = 1;    % ms
delta_theta = pi/2; % 90 deg
w1 = delta_theta/t_pulse;
t = linspace(0,t_pulse,50);
fps = 10;
w0 = 4*pi;     % KHz

M0 = [0 0 1]';
M = forced_procession_lab(t,M0,w0,w1);

fig = figure();
set(gcf, 'color', [1 1 1])
ax = axes();
F = [];
for ii = 1:length(t)
    draw_frame(ax,struct('M0',M0,...
                         'Mt',M(:,ii),...
                         'M',M(:,1:ii),...
                         't',t(ii)),["X","Y","Z"]);
    F =[F,getframe(fig)];
end

save_pdf(fig,'figure3.1.pdf');
save_video('video3.1.avi',F,fps);
