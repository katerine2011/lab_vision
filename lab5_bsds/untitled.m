method='hierarchical';
k=20;
im='376086.jpg';
my_segmentation1 = segment_by_clustering( im, 'rgb', method, k);
my_segmentation2 = segment_by_clustering( im, 'hsv', method, k);
my_segmentation3 = segment_by_clustering( im, 'lab', method, k);
figure,
subplot(2,2,1),imshow(imread(im)),title('original')
subplot(2,2,2),imshow(my_segmentation1),title('rgb')
subplot(2,2,3),imshow(my_segmentation1),title('hsv')
subplot(2,2,4),imshow(my_segmentation2),title('lab')
