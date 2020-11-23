function [ax] = draw_axis(ax,O,X,Y,Z,labels)

hold(ax,'on'); 
pbaspect manual;
arrow3(O,X,'r',0,0);
text(X(1),X(2),X(3),labels(1));
arrow3(O,Y,'g',0,0);
text(Y(1),Y(2),Y(3),labels(2));
arrow3(O,Z,'b',0,0); 
text(Z(1),Z(2),Z(3),labels(3));
hold(ax,'off'); 

end

