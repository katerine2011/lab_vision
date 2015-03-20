function my_segmentation = segment_by_clustering( rgb_image, feature_space, clustering_method, number_of_clusters)
% feature_space : 'rgb', 'lab', 'hsv', 'rgb+xy', 'lab+xy', 'hsv+xy'
% clustering_method = k-means, gmm, hierarchical or watershed (code seen in class)
% Feature_Space condition
Im_rgb = imread(rgb_image);
x=size(Im_rgb,1);
y=size(Im_rgb,2);

if strcmpi(feature_space, 'rgb')==1||strcmpi(feature_space, 'rgb+xy')==1 ;
    outspace = space2cluster(Im_rgb,feature_space);
    
elseif strcmpi(feature_space, 'lab')==1||strcmpi(feature_space, 'lab+xy')==1 ;
    Im_lab = rgb2lab(Im_rgb);
    outspace = space2cluster(Im_rgb,feature_space);
    
elseif strcmpi(feature_space, 'hsv')==1||strcmpi(feature_space, 'hsv+xy')==1 ;
    Im_hsv = rgb2hsv(Im_rgb);
    outspace = space2cluster(Im_hsv,feature_space);
     
else
	error('Unrecognized segmentation type');
   
end

if strcmpi(clustering_method, 'k-means')==1 ;
    
   out_cluster = kmeans(double(outspace),number_of_clusters);
   matrix_out = reshape(out_cluster,x,y);
   matrix_out=label2rgb(matrix_out,'jet','w','shuffle');
   
elseif strcmp(clustering_method, 'gmm')==1 ;
   options = statset( 'Display', 'final');
   gmm = fitgmdist(double(outspace),number_of_clusters,'Options', options, 'Regularize',0.0001);
   Clus=cluster(gmm,double(outspace));
   matrix_out = reshape(Clus,x,y);
   matrix_out=label2rgb(matrix_out,'jet','w','shuffle');
end

if strcmp(clustering_method, 'hierarchical')==1;
    
    if strcmpi(feature_space, 'rgb')==1
       Im=rgb2gray(Im_rgb);
       
    elseif strcmpi(feature_space, 'hsv')==1
       Im=rgb2hsv(Im_rgb); 
       Im=Im(:,:,1);
    elseif strcmpi(feature_space, 'lab')==1
       Im=rgb2lab(Im_rgb);
       Im=Im(:,:,1);
    end
    Im1 = impyramid(Im, 'reduce');
    Im1 = impyramid(Im1, 'reduce');
    
    distance=pdist(Im1,'cityblock');
    hieclus=linkage(distance,'average');
    Clus=cluster(hieclus,'maxclust',number_of_clusters);
    %matrix_out = reshape(Clus,x,y);
    Im2 = impyramid(Clus, 'expand');
    matrix_out = impyramid(Im2, 'expand');
    
elseif strcmp(clustering_method, 'watershed')==1;
    
    if strcmpi(feature_space, 'rgb')==1
        Im=rgb2gray(Im_rgb);
        hy = fspecial('sobel');
        hx = hy';
        Iy = imfilter(double(Im), hy, 'replicate');
        Ix = imfilter(double(Im), hx, 'replicate');
        grad = sqrt(Ix.^2 + Iy.^2);
     elseif strcmpi(feature_space, 'hsv')==1
         Im=rgb2hsv(Im_rgb);
         Im=Im(:,:,1);
         hy = fspecial('sobel');
         hx = hy';
         Iy = imfilter(double(Im), hy, 'replicate');
         Ix = imfilter(double(Im), hx, 'replicate');
         grad = sqrt(Ix.^2 + Iy.^2);
         grad=round(255*grad);
     elseif strcmpi(feature_space, 'lab')==1
         Im=rgb2lab(Im_rgb);
         Im=Im(:,:,1);
         hy = fspecial('sobel');
         hx = hy';
         Iy = imfilter(double(Im), hy, 'replicate');
         Ix = imfilter(double(Im), hx, 'replicate');
         grad = sqrt(Ix.^2 + Iy.^2);
         grad=round(grad);
    end
        % watersheds
        marker = imextendedmin(grad,number_of_clusters);
        new_grad = imimposemin(grad, marker);
        ws = watershed(new_grad);
        matrix_out=label2rgb(ws,'jet','w','shuffle');
     
end
%my_segmentation = matrix_out;
my_segmentation = matrix_out;
%figure, imshow(my_segmentation)
   	