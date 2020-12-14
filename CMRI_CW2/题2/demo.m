load img.mat
wrapped_img = wrap(img);
figure('color','w')
subplot(121)
imshow(img, [-5,30])
colormap jet
colorbar
axis on
title('Unwrapped Image')
subplot(122)
imshow(wrapped_img, [-5,30])
colormap jet
colorbar
axis on
title('Wrapped Image')
