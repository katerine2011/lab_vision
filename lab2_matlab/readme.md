# Introduction to Images in Matlab

## Setup

1.  Start the virtual machine
2.  Clone the original lab vision repository

    ```bash
    git clone https://github.com/diego0020/lab_vision.git lab_vision_orig
    ```
3.  Clone your fork from the repository

    ```bash
    git clone https://github.com/<USER>/lab_vision.git lab_vision
    ```
4.  Copy the folder lab2_matlab to your repository

    ```bash
    cp -rf lab_vision_orig/lab2_matlab lab_vision
    ```
5.  Delete the original repository from your machine

    ```bash
    rm -rf lab_vision_orig
    ```
6.  Commit changes to your repository

    ```bash
    cd lab_vision
    git status
    git add *
    git commit -m "added matlab lab"
    ```
7.  Push changes

    ```bash
    git push
    ```    
8.  Download and uncompress the sipi_images misc folder in your home folder

    ```bash
    cd ~
    scp -r vision@guitaca.uniandes.edu.co:/home/vision/sipi_images/misc.tar.gz .
    # alternative
    # wget http://sipi.usc.edu/database/misc.tar.gz
    tar -xzf misc.tar.gz
    ```    
9.  Open matlab

    ```bash
    /usr/local/MATLAB/R2014b/bin/matlab
    ```

Note: On windows you can use [github for windows](https://windows.github.com/) or [git-scm](http://git-scm.com/)

**IMPORTANT**
This file contains questions, you should write your answers here and don't forget to **commit** and **push** to
your github account.

## Working directory

The following commands can be used inside matlab, just like in bash

    -   pwd
    -   ls
    -   cd

For more file system see http://www.mathworks.com/help/matlab/file-operations.html

Note the current directory is also shown at the top of the graphical interface

1.  Change to the *misc* directory, which contains the uncompressed sipi_images
2.  List the contents of the directory

## Reading Images

The [imread](http://www.mathworks.com/help/matlab/ref/imread.html) command is used in matlab to read images. 

1.  Look at the manual page for the command
2.  Read the ``5.1.12`` image
    
    What is the dimension of the output?

    >   size = 256x256 class uint8 

3.  Read the ``4.2.03`` image
    What is the dimension of the output?

    >   size = 512x512x3 class uint8 

## Displaying Images

The following commands can be used for displaying images

-   [image](http://www.mathworks.com/help/matlab/ref/image.html)
-   [imshow](http://www.mathworks.com/help/images/ref/imshow.html)

1.  Look at their manual pages
2.  Try displaying the images read in the previous point using both commands
3.  What are the differences?

    >   ``Image`` muestra la matriz de información como una imagen con coordenadas o plano y permite variar las dimesiones de la imagen al ampliar la pantalla, ``imshow`` muestra la imagen manteniendo las dimensiones, sin cambiar la estructura de los pixeles. Por otro lado imshow muestra la figura como una gráfica, ``image`` muestra la información de la matriz como imagen y cada elemento de color es representado en un ``colormap``

## Writing Images

The [imwrite](http://www.mathworks.com/help/matlab/ref/imwrite.html) image is used for writing images to disk

1.  Look at the manual page
2.  Write one of the images from before as png and as jpg
3.  Write a matlab function that takes the path of an image and converts it to jpg

## Matlab and the shell

### Shell from Matlab

It is possible to excecute bash commands from matlab by using the [system](http://www.mathworks.com/help/matlab/ref/system.html) command
or by using a [bang](http://www.mathworks.com/help/matlab/matlab_env/run-external-commands-scripts-and-programs.html)

1.  Look at the manual pages
2.  Try it (for example ``!ps``)

### Matlab from the shell

It is also possible to invoke matlab in a non interactive mode to run a script from the terminal. If the matlab
binary is on the system PATH you can do something like this

```bash
matlab -nodisplay -nosplash -r "write_jpg('boat.512.tiff'); exit"
# or
matlab -nodisplay -nosplash script.m"
```
If the command or script doesn't end in ``exit`` the matlab shell will stay open, and will block the bash script.

### Exercise

1.  Create a script for converting all tiff images to jpeg
    -   You may create a bash script that calls matlab
    -   Or a matlab script that calls bash 
    -   Or both
2.  Save this script in the matlab lab folder of your git repository

## Filters

### Adding noise

The [imnoise](http://www.mathworks.com/help/images/ref/imnoise.html) command can be used to add noise to images.
We can do this to simulate difficult capture conditions, and evaluate the algorithms over difficult situations.

1.  Read the manual page
2.  Try the diffente noise types, and save the noisy images to the repository (5 images)
3.  Try saving noisy images as jpg, what happens?

    > Al aplicarle ruido gausiano a una imagen RGB y guardarla en dos formatos distintos (tiff y jpg), se evidencia que a pesar de que las dimensiones son las mismas para las imágenes guardadas el tamaño en memoria cambia (png más pequeña), luego al observar en detalle las imágenes se observa que la imagen en formato png se percibe con una perdida en la resolución y por ello aparenta tener más ruido. 

### Median filter

These filters can be applied to a an image in order to remove noise. 
-   To apply a mean filter create it with the function [fspecial](http://www.mathworks.com/help/images/ref/fspecial.html)
    and apply it with [imfilter](http://www.mathworks.com/help/images/ref/imfilter.html) 
-   To apply a median filter use the function [medfilt2](http://www.mathworks.com/help/images/ref/medfilt2.html)

1.  Read the manuals for the functions described above
2.  Try applying both kinds of filters to noisy images. Be sure to zoom in to see the effects
3.  Try different sizes for the filters
4.  Which filter works best for salt & pepper noise?

    > El mejor filtro para una imagen con ruido sal y pimienta es el filtro de la mediana que trae por defecto Matlab porque al variar las dimensiones (matriz cuadrada ``nxn``) para ``n=1`` y ``n=2`` aún se percibía ruido y en ``n=3y4`` la imagen mejoraba pero no de la misma manera que al aplicar solo ``mediana1=medfilt2(J1) %J1 imagen con ruido sal y pimienta``. Los demás filtros no quitaban ek ruido o suavizaban mucho la imagen.

For more on noise removal read http://www.mathworks.com/help/images/noise-removal.html

### Blur

To blur or smooth an image we can use the mean filter described above. We can also use the gaussian filter
which can be otained from [fspecial](http://www.mathworks.com/help/images/ref/fspecial.html).

1.  Smooth an image using average and gaussian filters
2.  Try different sizes for the filters
3.  What differences do you notice?

    > Se realizó una variación del tamaño de de los filtro desde 1x1 hasta 15x15 de dos en dos y se encontró que si en el filtro de la gausiana no se varía el sigma que trae por defecto (0.5) el suavizado no se nota mucho comparando los filtros gaussianos de diferentes tamaños. si se aumenta el sigma y también se aumenta el tamaño hasta máximo [10 10] y sigma =10 se tiene el mismo efecto de muy poco suavizado con respecto al filtro promedio. Para tener un suavizado notorio es necesario aumentar el tamaño por encima de n=10 y sigma mayor a 15, dado que el filtro gausiano le da mayor peso a píxel central y valores muy pequeños a los píxeles más aislados. 

### Sharpen

The [imsharpen](http://www.mathworks.com/help/images/ref/imsharpen.html) function lets us sharpen an image. 

1.  Sharp the ``5.1.12`` image. What do you notice?

    > Le da contraste a los bordes y la imagen, el radio ayuda a dar un contorno claro alrededor de los bordes y amount aunmenta la saturación de la imagen 

2.  Sharp a blurred image. What do you notice?

    > En una imagen borrosa se ve más nítida y ayuda a mejorar el contraste.

### Edge detection

The following filters from fspecil can be used to enhance edges in an image
-   laplacian
-   log
-   prewitt
-   sobel

Notice that the last two filters detect horizontal edges, in order to detect vertical edges you have to transpose them.

1.  Try applying this filters
2.  What is the difference between prewitt and sobel?

    > Sobel mantiene una intesidad mayor en los bordes detectados y aparentemente sobel contiene más bordes detectados. Aunque visualmente no parecen tener mucha diferencias.

More sophisticated methods for finding edges can be found in the following pages
    -   http://www.mathworks.com/discovery/edge-detection.html
    -   http://www.mathworks.com/help/images/ref/edge.html

### More

For more filtering operations look at http://www.mathworks.com/help/images/linear-filtering.html

## Color Spaces

As seen on the section on reading image, color images are represented by matrices with 4 dimensios.
The [color](http://www.mathworks.com/help/images/color.html) matlab module contains functions for moving between
color spaces.

1.  Load the ``4.2.03.tiff`` image (Mandril).
2.  Split it into the three color channels
    
    ```matlab
    img=imread('4.2.03.tiff');
    r = img(:,:,1);
    g = img(:,:,2);
    b = img(:,:,3);
    ```
3.  Look at the three channels simultaneusly

    ```matlab
    figure;
    subplot(2,2,1), subimage(img);
    subplot(2,2,2), subimage(r);
    subplot(2,2,3), subimage(g);
    subplot(2,2,4), subimage(b);
    ```
    
4.  Save the mosaic as a png file
    
    ```matlab
    print ('-dpng','rgb_mosaic.png');
    ```
5.  Transform the image to the following color spaces and repeat the exercise
    -   ycbcr
    -   lab
    -   hsv (use [rgb2hsv](http://www.mathworks.com/help/matlab/ref/rgb2hsv.html))

6.  Save all the mosaics in your github repository

## Pyramids

The [impyramid](http://www.mathworks.com/help/images/ref/impyramid.html) function creates gaussian pyramids from an image.

1.  Read the manual page
2.  Create a four level pyramid from the ``5.1.12`` clock  image
3.  At what level does the people in the picture dissappear?

    >  En el segundo nivel las personas desaparecen 
    
4.  At what level does the numbers in the clock disappear?

    >  En el segundo nivel los números desaparecen 

## Template Matching

The [norm2corrx](http://www.mathworks.com/help/images/ref/normxcorr2.htm) can be used to look for patterns in an image.

1.  Download the ``sequences.tar.gz`` file (from guitaca or sipi) and decompress it
2.  Go to the sequences directory
3.  Read the ``motion04.512.tiff`` image
4.  Use the ``imcrop`` comand to crop the train at the right side of the figure
    
    ```matlab
    [train,square] = imcrop(image);
    ```
5.  Now use [normxcorr2](http://www.mathworks.com/help/images/ref/normxcorr2.htm) to locate the train back in the image

    ```matlab
    c=normxcorr2(train,image);
    % c is correlation from -1 to 1
    [sx,sy] = size(image);
    d=floor(size(train)/2);
    dx=d(1);
    dy=d(2);
    %Remove borders from c2 to make it the same size as image
    c2=c(dx+1:sx+dx,dy+1:sy+dy);
    %lets accentuate it more
    c3=c2.^3;
    %convert it into an image from 0 to 1
    cr=0.5+0.5*c3;
    %leave the original image as the luminance channel
    y=mat2gray(image);
    %empty cb channel
    cb=0.5*ones(size(image));
    %join the three channels
    ycbcr=cat(3,y,cb,cr);
    rgb=ycbcr2rgb(ycbcr);
    imshow(rgb);
    ```
6.  Explain what the above code does

    > 1. lee la imagen en 2D y con la función ``imcrop`` se selecciona un ``template`` de la imagen original (con las dimensiones y en el lugar que se desee). 2). con ``c=normxcorr2(train,image)`` se realiza la correlación cruzada de la imagen con el template y entrega valores entre -1 y 1. La imagen queda más grande 3).se extraen las dimensiones de la imagen dividida en 2 y se toma la parte entera más cercana al tamaño. 4). ``c2=c(dx+1:sx+dx,dy+1:sy+dy)`` se construye la matriz con las correlaciones con el tamaño adecuado(igual a la imagen original) y luego se acentúa los niveles de correlación(``c3=c2.^3``). 5). Normaliza la matriz de correlación entre 0 y 1 ``cr=0.5+0.5*c3`` para representar uno de los componentes de crominancia, luego ``y=mat2gray(image)`` para extraer y representar los niveles de luminancia y ``cb=0.5*ones(size(image))`` para el otro canal de crominancia que en este caso es un plano de gris. 6). la función cat concatena los planos de color para obtener la representación ``ycbcr=cat(3,y,cb,cr)`` y luego transformarlo en rgb ``rgb=ycbcr2rgb(ycbcr)`` y por último se gráfica. Con este método se encuentra en una imagen en 2D el template con la ubicación de valores de crominancia mayor sobre la imagen.
    
7.  Now lets find the train in the next frame, read image ``motion05.512.tiff``.
8.  Apply the procedure written above to it (use the train template from the past frame)
9.  What are the limitations of this method?

    > Las limitaciones del método son: 1. Necesitamos seleccionar el template, además dicho template debe tener diferencias en contraste significativas con otras partes de la imagen, dado que si tomamos un objeto con valores de gris similar a partes de la imagen seguramente no encontraremos lo que esperábamos (ejemplo: al seleccionar el carro con la parte blanca la mayoría de los píxeles coincidían con valores cercanos en correlación que las nubes o el bus ) por basarse en la correlación cruzada.  

See [here](http://www.mathworks.com/help/images/examples/registering-an-image-using-normalized-cross-correlation.html)
another example.

## End

Don't forget to commit and push your answers and images to github
