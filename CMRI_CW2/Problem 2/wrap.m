%% function wrap(phs)
function [ wrap_phs ] = wrap( phs )

% This is the method to wrap the img
% INPUTS:
% phs: the img data
% OUTPUTS:
% wrap_phs: the processed img data

% get the phs dimension info
shape = size(phs);

% reshape it to one dimension to simplify calculation
reshaped_phs = reshape(phs, [1, numel(phs)]);
reshape_wrap = reshaped_phs;

% use pixwrap to finish the task
for i = 1:numel(phs)
    reshape_wrap(i) = pixwrap(reshaped_phs(i));
end

% reshape to the initial size
wrap_phs = reshape(reshape_wrap, shape);

end

%% function pixwrap(pix)
function [wrap_pix] = pixwrap(pix)

% This function is used to judge the pix and calculate it final value

% if pix is in range, keep the same
if pix <= pi && pix >= -pi
    wrap_pix = pix;

% if less process again
elseif pix < -pi
    wrap_pix = pixwrap(pix + 2*pi);
else
    
% if more process again
    wrap_pix = pixwrap(pix - 2*pi);
end

end