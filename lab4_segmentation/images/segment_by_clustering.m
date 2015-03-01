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
    
   out_cluster = kmeans(outspace,number_of_clusters);
   matrix_out = reshape(out_cluster,x,y);
end 

%my_segmentation = matrix_out;
my_segmentation=matrix_out;

    
   	