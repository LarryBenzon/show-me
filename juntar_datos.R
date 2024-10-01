# Cargar los paquetes necesarios
library(readxl)
library(dplyr)

# Especificar la ruta de los archivos Excel
ruta_archivo1 <- "C:/Users/User/OneDrive/el arca/datos/D1.xlsx"
ruta_archivo2 <- "C:/Users/User/OneDrive/el arca/datos/D2.xlsx"

# Leer los archivos Excel
datos1 <- read_excel(ruta_archivo1)
datos2 <- read_excel(ruta_archivo2)

# Eliminar columnas vacías en ambos dataframes
eliminar_columnas_vacias <- function(dataframe) {
  dataframe[, colSums(is.na(dataframe)) < nrow(dataframe)]
}
datos1 <- eliminar_columnas_vacias(datos1)
datos2 <- eliminar_columnas_vacias(datos2)

# Realizar una unión completa de los dataframes
datos_comb <- full_join(datos1, datos2, by = intersect(names(datos1), names(datos2)))
