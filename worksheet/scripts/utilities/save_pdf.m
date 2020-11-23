function [] = save_pdf(fig,name)
filepath = fileparts(mfilename('fullpath'));
fig.Renderer='Painters';
p = fig.PaperPosition;
set(fig,'PaperSize',[1.1*p(3) 1.1*p(4)]);
print(fig,strcat(filepath,[filesep '..' filesep '..' filesep 'figures' filesep],name),'-dpdf','-r0')
end

