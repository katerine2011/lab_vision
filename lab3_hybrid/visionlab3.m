x2 = imread('juana2.jpg');
x1 = imread('vivi.jpg');

% x1 = imread('einstein.bmp');
% x2 = imread('marilyn.bmp');
% 
% x1 = imread('plane.bmp');
% x2 = imread('bird.bmp');

% x1=rgb2gray(x1);
% x2=rgb2gray(x2);

f1 = fspecial('gaussian',[35 35],35);
f2 = fspecial('gaussian',[30 30],30);

Imfilt_l = 1.1*imfilter(x1,f1);
Imfilt_h = (1.2*x2-imfilter(x2,f2));

Im_hyb = Imfilt_l+Imfilt_h;
figure, imshow(Im_hyb)
print('-dpng','5n.png')

%%
Im2 = imread('juana2.jpg');
Im= imread('vivi.jpg');
% 
% Im = imread('einstein.bmp');
% Im2 = imread('marilyn.bmp');

%figure,imshow(Im)
subplot(2,4,1),image(Im)
Im1 = impyramid(Im, 'reduce');
%figure,imshow(Im1)
subplot(2,4,2),image(Im1)
Im1 = impyramid(Im1, 'reduce');
%figure,imshow(Im1)
subplot(2,4,3),image(Im1)
Im1 = impyramid(Im1, 'reduce');
%figure,imshow(Im1)
subplot(2,4,4),image(Im1)

Im1 = impyramid(Im1, 'expand');
Im1 = impyramid(Im1, 'expand');
Im1 = impyramid(Im1, 'expand');
%subplot(2,4,6),imshow(Im1)
subplot(2,4,6),image(Im1),title('Ima Lowfilter')

figure,subplot(2,4,1),image(Im2)
 Im3 = impyramid(Im2, 'reduce');
 subplot(2,4,2),image(Im3)
 Im3 = impyramid(Im3, 'reduce');
 subplot(2,4,3),image(Im3)
 Im3 = impyramid(Im3, 'reduce');
 subplot(2,4,4),image(Im3)
 
 Im3 = impyramid(Im3, 'expand');
 Im3 = impyramid(Im3, 'expand');
 Im3 = impyramid(Im3, 'expand');
 
 subplot(2,4,6),image(Im3)
 

x1=size(Im1,1)
y1=size(Im1,2)

Imh=(1.3*Im2(1:x1,1:y1,:)-Im3(1:x1,1:y1,:));
figure,imshow(Imh)
ImHyb = Im1(1:x1,1:y1,:)+Imh;
figure,imshow(ImHyb);

print('-dpng','HybPyrb.png')