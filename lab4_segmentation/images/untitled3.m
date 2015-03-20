%clear all; close all; clc
im = imread('2018.jpg');
%Im=rgb2gray(im);
Im=rgb2lab(im);
Im=Im(:,:,1);
%gradiente
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(Im), hy, 'replicate');
Ix = imfilter(double(Im), hx, 'replicate');
grad = sqrt(Ix.^2 + Iy.^2);

% watersheds

for h = 30
grad=round(grad);
marker = imextendedmin(grad, h);
new_grad = imimposemin(grad, marker);
ws = watershed(new_grad);
OO=label2rgb(ws(:,:,1),'jet','w','shuffle');

%
figure;
imshow(OO);

end
%%  
Im_rgb = imread('2018.jpg');
%if strcmpi(feature_space, 'rgb')==1
       Im=rgb2gray(Im_rgb);
       
 %   elseif strcmpi(feature_space, 'hsv')==1
       %Im=rgb2hsv(Im_rgb); 
      % Im=Im(:,:,1);
  %  elseif strcmpi(feature_space, 'lab')==1
     %  Im=rgb2lab(Im_rgb);
    %   Im=Im(:,:,1);
   % end
    Im1 = impyramid(Im, 'reduce');
    Im1 = impyramid(Im1, 'reduce');
    
    disx=pdist(Im1,'cityblock');
    Y1=squareform(disx);
    disy=pdist(Im1','cityblock');
    Y2=squareform(disy);
    
    hiecx=linkage(disx,'average');
    hiecy=linkage(disy,'average');
    Clus=cluster(hiecx,'maxclust',30);
    Clus1=cluster(hiecy,'maxclust',30);
    %matrix_out = reshape(Clus,x,y);
    Im2 = impyramid(Clus, 'expand');
    matrix_out = impyramid(Im2, 'expand');
    
    
    

