function outspace = space2cluster( imagen, feature_space)

Im =imagen;

x=size(Im,1);
y=size(Im,2);

if strcmpi(feature_space, 'rgb')==1 ||strcmpi(feature_space, 'lab')==1 ||strcmpi(feature_space, 'hsv')==1 ;
    
matrix_out(:,1)=reshape(Im(:,:,1),x*y,1);
matrix_out(:,2)=reshape(Im(:,:,2),x*y,1);
matrix_out(:,3)=reshape(Im(:,:,3),x*y,1);


elseif strcmpi(feature_space, 'rgb+xy')==1 ||strcmpi(feature_space, 'lab+xy')==1 ||strcmpi(feature_space, 'hsv+xy')==1 ;
    
x1=1:y;
Mat_position_x =repmat(x1,x,1);

y1=1:x;
Mat_position_y =repmat(y1',1,y);

matrix_out(:,1)=reshape(Im(:,:,1),x*y,1);
matrix_out(:,2)=reshape(Im(:,:,2),x*y,1);
matrix_out(:,3)=reshape(Im(:,:,3),x*y,1);
matrix_out(:,4)=reshape(Mat_position_x,x*y,1);
matrix_out(:,5)=reshape(Mat_position_y,x*y,1);
end

outspace = matrix_out;