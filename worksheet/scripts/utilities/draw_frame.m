function [ax] = draw_frame(ax, context, axis_label)

O = [0 0 0]';
X = [2 0 0]';
Y = [0 2 0]';
Z = [0 0 2]';

% clear axes
cla(ax);
% redraw
draw_axis(ax,O',X',Y',Z',axis_label);

% draw M0
draw_vector(ax,O',context.M0','M_0');
% draw Mt
draw_vector(ax,O',context.Mt','M_t');

% draw Trace of Mt
hold(ax,'on');
M = context.M;
plot3(ax,M(1,:),M(2,:),M(3,:));
hold(ax,'off');

axis([-1,2,-1,2,0,2]);
axis off;
view([20 25 5]);
title(sprintf('t = %.2f ms',context.t));

ax.Position = [0.05 0 0.9 1];

end