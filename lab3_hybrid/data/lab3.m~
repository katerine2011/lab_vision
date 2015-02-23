x2 = imread('FotoHV.jpg');
x1 = imread('pozo.jpg');

% x1 = imread('einstein.bmp');
% x2 = imread('marilyn.bmp');
% 
% x1 = imread('plane.bmp');
% x2 = imread('bird.bmp');

%x1=rgb2gray(x1);
%x2=rgb2gray(x2);

f1 = fspecial('gaussian',[20 20],20);
f2 = fspecial('gaussian',[35 35],30);

Imfilt_l = imfilter(x1,f1);
Imfilt_h = (1.2*x2-imfilter(x2,f2));

Im_hyb = Imfilt_l+Imfilt_h;
figure, imshow(Im_hyb)
print('-dpng','Hyb.png')

%%
Im = imread('FotoHV.jpg');
Im2 = imread('pozo.jpg');

Im1 = impyramid(Im, 'reduce');
Im1 = impyramid(Im1, 'reduce');
Im1 = impyramid(Im1, 'reduce');

figure,imshow(Im1)
Im1 = impyramid(Im1, 'expand');
Im1 = impyramid(Im1, 'expand');
Im1 = impyramid(Im1, 'expand');
figure,imshow(Im1)

 Im3 = impyramid(Im2, 'reduce');
 Im3 = impyramid(Im3, 'reduce');
 Im3 = impyramid(Im3, 'reduce')
 Im3 = impyramid(Im3, 'expand');
 Im3 = impyramid(Im3, 'expand');
 Im3 = impyramid(Im3, 'expand');
 
% Im3 = impyramid(Im2, 'expand');
% Im3 = impyramid(Im3, 'expand');
% Im3 = impyramid(Im3, 'reduce');
% Im3 = impyramid(Im3, 'reduce');


Imh=(Im2(1:297,1:265,:)-Im3(1:297,1:265,:));
%imshow(Imh)
ImHyb = Im1(1:297,1:265,:)+Imh;
%figure,imshow(ImHyb);

print('-dpng','HybPyra.png')