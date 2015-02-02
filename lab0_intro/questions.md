# Warmup Questions

1.  What is the clone url of this repository?
    >   answer

2.  What is the output of the ``cal`` command?

        multi
        line
        answer

# Homework Questions

1.  What is the ``grep``command?
    >  Grep es un comando que busca un patrón en cada fichero o en la entrada de un archivo.

2.  What is a *makefile*?
    >   Un archivo Makefile es un archivo de texto en el cual se distinguen cuatro tipos básicos de declaraciones (Comentarios, variables, reglas explícitas, reglas implícitas) para construir y gestionar lso proyectos.

3.  What is *git*?
    >   Un git es un software de control de versiones que permite el control de los diversos códigos fuente 

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   Prune es una acción dentro de find para evitar o excluir en la búsqueda archivos que se quieren ignorar. Por ejemplo:

juan@juan-Pc:~$ find -name  \*.txt 
./unixkatstuff/science.txt 
./.config/libreoffice/4/user/uno_packages/cache/log.txt 
./.config/google-chrome/Default/Pepper Data/Shockwave Flash/CacheWritableAdobeRoot/AssetCache/VWMT94YU/cacheSize.txt 
./.config/google-chrome/chrome_shutdown_ms.txt 
./.pki/nssdb/pkcs11.txt 
./Documentos/Edison/Control/Motor.txt 
./Documentos/Edison/Control/Motr.txt 
./Documentos/Edison/Control/prueba.txt 
./Documentos/fichero.txt 
./.mozilla/firefox/c3o6ile7.default/urlclassifierkey3.txt 

juan@juan-Pc:~$ find -name Documentos -prune -o -name \*.txt 
./unixkatstuff/science.txt 
./.config/libreoffice/4/user/uno_packages/cache/log.txt 
./.config/google-chrome/Default/Pepper Data/Shockwave Flash/CacheWritableAdobeRoot/AssetCache/VWMT94YU/cacheSize.txt 
./.config/google-chrome/chrome_shutdown_ms.txt 
./.pki/nssdb/pkcs11.txt 
./Documentos 
./.mozilla/firefox/c3o6ile7.default/urlclassifierkey3.txt 

5.  Where is the file ``xxxxxx``
    >   /usr/src/linux-headers-3.13.0-37-generic/include/config/blk/dev/3w/xxxx

6.  How many files with ``gnu`` in its name are in ``dir``
    >   answer

7.  How many files contain ``gpl`` inside in ``dir``
    >   answer

8.  What does the ``cut`` command do?
    >   cut saca información específica línea a línea de un archivo de texto 

9.  What does the ``wget`` command do?
    >   wget descarga archivos de un url específico

10.  What does the ``diff`` command do?
    >   diff compara ficheros línea por línea

11.  How many users exist in *Guitaca*?
    >   hay 48 usuarios en guitaca

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   answer

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   answer

14.  What is the name of the linux distribution running on *Guitaca*?
    >   answer

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

   script find_duplicates.sh 
   `` #!bin/bash``
   `` md5sum *| sort | uniq -w33 -D``

el script toma la suma de control (md5sum)de los ficheros en una carpeta, y cuando encuentra sumas iguales para dos archivos éste devuelve la suma y los nombres de los archivos.
Referencia:`` J. S. Pons, «El Sotanillo de Juan Sierra Pons,» 2006. [En línea]. Available: http://www.elsotanillo.net/2006/10/linux-script-bash-para-encontrar-ficheros-duplicados-con-diferentes-nombres-en-el-mismo-directorio-2/. [Último acceso: 2 02 2015]``

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >   da la orden al script para que entieneda que bash es el lenguaje en el que se va a trabajar

17. How many unique images are in the ``sipi_images`` folder?
    >   answer
    
