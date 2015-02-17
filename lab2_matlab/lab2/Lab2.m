%Reading Images
    %imread
Im1 = imread('5.1.12.tiff');
Im2 = imread('4.2.03.tiff');
whos

%Displaying Images
figure,
subplot(2,2,1),imshow(Im1),title('imshow')
subplot(2,2,2),image(Im1),title('image')
subplot(2,2,3),imshow(Im2),title('imshow')
subplot(2,2,4),image(Im2),title('image')

%Writing Images
imwrite(Im1,'Im3.png');
imwrite(Im1,'Im4.jpg');
imwrite(Im2,'Im5.png');
imwrite(Im2,'Im6.jpg');

%noise 
    % ima 5.1.12.tiff
I = Im1;

J1 = imnoise(I,'gaussian',0.05, 0.05);
J2 = imnoise(I,'poisson');
J3 = imnoise(I,'salt & pepper', 0.07);
J4 = imnoise(I,'speckle', 0.02);
figure,
subplot (2,2,1),imshow(J1),title('gaussian noise')
subplot (2,2,2),imshow(J2),title('poisson noise')
subplot (2,2,3),imshow(J3),title('salt & pepper noise')
subplot (2,2,4),imshow(J4),title('speckle noise')

    %ima 4.2.03.tiff
I = Im2;

J11 = imnoise(I,'gaussian',0.05, 0.05);
J12 = imnoise(I,'poisson');
J13= imnoise(I,'salt & pepper', 0.07);
J14 = imnoise(I,'speckle', 0.02);


figure,
subplot (2,2,1),imshow(J11),title('gaussian noise')
subplot (2,2,2),imshow(J12),title('poisson noise')
subplot (2,2,3),imshow(J13),title('salt & pepper noise')
subplot (2,2,4),imshow(J14),title('speckle noise')

    %ima jpg
Im4 = imread('Im6.jpg');
J21 = imnoise(Im4,'gaussian',0.05, 0.05);
J22 = imnoise(Im4,'poisson');
J23 = imnoise(Im4,'salt & pepper', 0.07);
J24 = imnoise(Im4,'speckle', 0.02);
figure,imshow(J21)
figure,
subplot (2,2,1),imshow(J11),title('gaussian noise')
subplot (2,2,2),imshow(J12),title('poisson noise')
subplot (2,2,3),imshow(J13),title('salt & pepper noise')
subplot (2,2,4),imshow(J14),title('speckle noise')

%% %filtros
Im1 = imread('5.1.12.tiff');
Im2 = imread('4.2.03.tiff');

I = Im1;

J11 = imnoise(I,'gaussian',0, 0.009);
J12 = imnoise(I,'poisson');
J1= imnoise(I,'salt & pepper', 0.09);
J14 = imnoise(I,'speckle', 0.02);

% figure,
% subplot (2,2,1),imshow(J11),title('gaussian noise')
% subplot (2,2,2),imshow(J12),title('poisson noise')
% subplot (2,2,3),imshow(J13),title('salt & pepper noise')
% subplot (2,2,4),imshow(J14),title('speckle noise')

%im=rgb2gray(imax);
h1=fspecial('average');
h2=fspecial('average',[9,9]);%filtro bidimensional media
h3=fspecial('disk');
h4=fspecial('gaussian');
h5=fspecial('laplacian');
h6=fspecial('log');
h7=fspecial('motion'); 
h8=fspecial('prewitt');
h9=fspecial('sobel');
h10=fspecial('unsharp');             
        

Filtro1=imfilter(J1,h1);% Generar el Filtro Gaussiano
Filtro2=imfilter(J1,h2);% Generar Filtro de la media
Filtro3=imfilter(J1,h3); %Generar el Filtro de la mediana
Filtro4=imfilter(J1,h4);% Generar el Filtro Gaussiano
Filtro5=imfilter(J1,h5);% Generar Filtro de la media
Filtro6=imfilter(J1,h6);% Generar el Filtro Gaussiano
Filtro7=imfilter(J1,h7);% Generar el Filtro Gaussiano
Filtro8=imfilter(J1,h8);% Generar Filtro de la media

mediana1=medfilt2(J1); %Generar el Filtro de la mediana
mediana2=medfilt2(J1,[1 1]); %Generar el Filtro de la mediana
mediana3=medfilt2(J1,[2 2]); %Generar el Filtro de la mediana
mediana4=medfilt2(J1,[3 3]); %Generar el Filtro de la mediana
mediana5=medfilt2(J1,[4 4]); %Generar el Filtro de la mediana
mediana6=medfilt2(J1,[35 5]); %Generar el Filtro de la mediana
% figure,
% subplot(3,3,1),subimage(J1),title('con ruido')
% subplot(3,3,2),subimage(Filtro1),title('Filtro Media de 3x3')
% subplot(3,3,3),subimage(Filtro1),title('Filtro de media de 9x9')
% subplot(3,3,4),subimage(Filtro1),title('Filtro disk')
% subplot(3,3,5),subimage(Filtro1),title('filtro gausian')
% subplot(3,3,6),subimage(Filtro1),title('filtro la placiano')
% subplot(3,3,7),subimage(Filtro1),title('Filtro log')
% subplot(3,3,8),subimage(Filtro1),title('Filtro Motion')
% subplot(3,3,9),subimage(Filtro1),title('filtro prewitt')

figure,
subplot(3,3,1),subimage(J1),title('con ruido')
subplot(3,3,2),subimage(mediana1),title('Filtro Mediana ')
subplot(3,3,3),subimage(mediana2),title('Filtro Mediana 1x1')
subplot(3,3,4),subimage(mediana3),title('Filtro Mediana 2x2')
subplot(3,3,5),subimage(mediana4),title('Filtro Mediana 3x3')
subplot(3,3,6),subimage(mediana5),title('Filtro Mediana 4x4')
subplot(3,3,7),subimage(mediana6),title('Filtro Mediana 5x5')
%% suavizado media 

Im2 = imread('4.2.03.tiff');
J1=Im2;
h1 = fspecial('average',[1,1]);
h2 = fspecial('average');
h4 = fspecial('average',[5 5]);
h5 = fspecial('average',[7 7]);
h6 = fspecial('average',[9 9]);
h7 = fspecial('average',[11 11]); 
h8 = fspecial('average',[13 13]);
h9 = fspecial('average',[15 15]);

Filtro1=imfilter(J1,h1);
Filtro2=imfilter(J1,h2);
Filtro4=imfilter(J1,h4);
Filtro5=imfilter(J1,h5);
Filtro6=imfilter(J1,h6);
Filtro7=imfilter(J1,h7);
Filtro8=imfilter(J1,h8);
Filtro9=imfilter(J1,h9); 
 
figure,
subplot(3,3,1),subimage(Im2),title('con ruido')
subplot(3,3,2),subimage(Filtro1),title('Filtro Mediana 1x1')
subplot(3,3,3),subimage(Filtro2),title('Filtro Mediana 3x3')
subplot(3,3,4),subimage(Filtro4),title('Filtro Mediana 5x5')
subplot(3,3,5),subimage(Filtro5),title('Filtro Mediana 7x7')
subplot(3,3,6),subimage(Filtro6),title('Filtro Mediana 9x9')
subplot(3,3,7),subimage(Filtro7),title('Filtro Mediana 11x11')
subplot(3,3,8),subimage(Filtro8),title('Filtro Mediana 13x13')
subplot(3,3,9),subimage(Filtro9),title('Filtro Mediana 15x15')
%% suavizado gauss
Im2 = imread('4.2.03.tiff');
J1=Im2;
%variar size
h1 = fspecial('gaussian',[1 1],0.5);
h2 = fspecial('gaussian',[3 3],0.5);
h4 = fspecial('gaussian',[5 5],0.5);
h5 = fspecial('gaussian',[7 7],0.5);
h6 = fspecial('gaussian',[9 9],0.5);
h7 = fspecial('gaussian',[11 11],0.5);
h8 = fspecial('gaussian',[13 13],0.5);
h9 = fspecial('gaussian',[15 15],0.5);

Filtro1=imfilter(J1,h1);
Filtro2=imfilter(J1,h2);
Filtro4=imfilter(J1,h4);
Filtro5=imfilter(J1,h5);
Filtro6=imfilter(J1,h6);
Filtro7=imfilter(J1,h7);
Filtro8=imfilter(J1,h8);
Filtro9=imfilter(J1,h9); 

%variar sigma 
h11 = fspecial('gaussian',[10 10],0.02);
h21 = fspecial('gaussian',[10 10],0.1);
h41 = fspecial('gaussian',[10 10],0.5);
h51 = fspecial('gaussian',[10 10],3);
h61 = fspecial('gaussian',[10 10],5.7);
h71 = fspecial('gaussian',[10 10],9);
h81 = fspecial('gaussian',[10 10],12.5);
h91 = fspecial('gaussian',[10 10],10);

Filtro11=imfilter(J1,h11);
Filtro21=imfilter(J1,h21);
Filtro41=imfilter(J1,h41);
Filtro51=imfilter(J1,h51);
Filtro61=imfilter(J1,h61);
Filtro71=imfilter(J1,h71);
Filtro81=imfilter(J1,h81);
Filtro91=imfilter(J1,h91); 

% figure,
% subplot(3,3,1),subimage(Im2),title('con ruido')
% subplot(3,3,2),subimage(Filtro1),title('Filtro Mediana 1x1')
% subplot(3,3,3),subimage(Filtro2),title('Filtro Mediana 3x3')
% subplot(3,3,4),subimage(Filtro4),title('Filtro Mediana 5x5')
% subplot(3,3,5),subimage(Filtro5),title('Filtro Mediana 7x7')
% subplot(3,3,6),subimage(Filtro6),title('Filtro Mediana 9x9')
% subplot(3,3,7),subimage(Filtro7),title('Filtro Mediana 11x11')
% subplot(3,3,8),subimage(Filtro8),title('Filtro Mediana 13x13')
% subplot(3,3,9),subimage(Filtro9),title('Filtro Mediana 15x15')

figure,
subplot(3,3,1),subimage(Im2),title('con ruido')
subplot(3,3,2),subimage(Filtro11),title('Gauss 5x5')
subplot(3,3,3),subimage(Filtro21),title('Gauss 5x5')
subplot(3,3,4),subimage(Filtro41),title('Gauss 5x5')
subplot(3,3,5),subimage(Filtro51),title('Gauss 5x5')
subplot(3,3,6),subimage(Filtro61),title('Gauss 5x5')
subplot(3,3,7),subimage(Filtro71),title('Gauss 5x5')
subplot(3,3,8),subimage(Filtro81),title('Gauss 5x5')
subplot(3,3,9),subimage(Filtro91),title('Gauss 2x5')


%% imsharpen 
%%

Im2 = imread('4.2.03.tiff');
%Im2 = imread('5.1.12.tiff');

J1=Im2;

% h1=fspecial('laplacian',0.05); % entre 0-1
% h2=fspecial('log',[],); %[5 5] 0.5
% h3=fspecial('motion');

h1 = fspecial('prewitt');
h2 = fspecial('sobel');

Filtro1=imfilter(J1,h1);
Filtro2=imfilter(J1,h2);

figure,
subplot(1,3,1),imshow(Im2),title('original')
subplot(1,3,2),imshow(Filtro1),title('prewitt')
subplot(1,3,3),imshow(Filtro2),title('sobel')

%color space
