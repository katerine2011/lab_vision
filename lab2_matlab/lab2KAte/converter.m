lee_archivos = dir('*.tiff');
for k = 1:length(lee_archivos) 
archivo = lee_archivos(k).name;
I = imread(archivo);
imwrite(I,(strcat(archivo,'.jpg')));
end
exit;