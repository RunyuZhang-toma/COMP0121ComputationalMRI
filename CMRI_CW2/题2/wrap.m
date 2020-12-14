function [ wrap_phs ] = wrap( phs )

shape = size(phs);
reshaped_phs = reshape(phs, [1, numel(phs)]);
reshape_wrap = reshaped_phs;
for i = 1:numel(phs)
    reshape_wrap(i) = pixwrap(reshaped_phs(i));
end
wrap_phs = reshape(reshape_wrap, shape);
end

function [wrap_pix] = pixwrap(pix)
if pix <= pi && pix >= -pi
    wrap_pix = pix;
elseif pix < -pi
    wrap_pix = pixwrap(pix + 2*pi);
else
    wrap_pix = pixwrap(pix - 2*pi);
end
end