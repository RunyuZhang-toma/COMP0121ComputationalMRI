function [ax] = draw_vector(ax,O,V,label)

hold(ax,'on'); 
arrow3(O,V);
text(V(1),V(2),V(3),label);
hold(ax,'off'); 

end


