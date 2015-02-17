#!bin/bash
#este script convierte imágenes .tiff en imágenes .jpg
# primero se ubica la ruta de donde se encuentran la imágenes .tiff
# y luego se ejecuta el script de matlab que debe estar en la misma carpeta
# donde están las imágenes
# 
cd /home/katerineguarin/Documents/misc

matlab -nodisplay -nosplash -r converter
