 read_file = dir('*.jpg');
 siz = size(read_file,1);
% method= ('watershed');
 spaces={'rgb','hsv','lab','rgb+xy','hsv+xy','lab+xy'};

            k=70
            
                my_seg1 = segment_by_clustering( '2018.jpg', 'rgb', method, k);
                
                my_seg2 = segment_by_clustering( '2018.jpg', 'hsv', method, k);
              
                my_seg3 = segment_by_clustering( '2018.jpg', 'lab', method, k);
                
%                 my_seg4 = segment_by_clustering( '2018.jpg', 'rgb+xy', method, k);
%                 my_seg5 = segment_by_clustering( '2018.jpg', 'hsv+xy', method, k);
%                 my_seg6 = segment_by_clustering( '2018.jpg', 'lab+xy', method, k);
                
          figure,
              subplot(1,3,1),imshow(my_seg1),title('rgb')
              subplot(1,3,2),imshow(my_seg2),title('hsv')
              subplot(1,3,3),imshow(my_seg3),title('lab')
%               subplot(2,3,4),imshow(my_seg4),title('rgb+xy')
%               subplot(2,3,5),imshow(my_seg5),title('hsv+xy')
%               subplot(2,3,6),imshow(my_seg6),title('lab+xy')
              
              
              
            
            
           Folder = fullfile('/home/katerineguarin/lab_vision/lab4_segmentation/images','/',method(met),'/',spaces(sp), [Image_rgb(1:end-4) '.mat']);
           save(Folder{1},'groundTruthkt')
            
       