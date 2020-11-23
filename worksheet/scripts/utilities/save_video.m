function [] = save_video(name,frames,fps)
filepath = fileparts(mfilename('fullpath'));
writer = VideoWriter(strcat(filepath,[filesep '..' filesep '..' filesep 'videos' filesep],name));
writer.FrameRate = fps;
writer.Quality = 100;
open(writer);
for f = frames
    writer.writeVideo(f);
end
close(writer);

end

