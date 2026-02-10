# Repositorio de notas para el curso

# Crea un nuevo proyecto en la ruta absoluta o relativa que le proporciones
usethis::create_project("~/Desktop/rnaseq_2026_notas")

# Start a setup file
#Es importante numerar los archivos para que el README sea mas simple de actualizar

usethis::use_r("01-notas.R")

#Paquete que crea rutas relativas a la carpeta del proyecto, lo que hace que el código sea mas reproducible y fácil de compartir.
here
