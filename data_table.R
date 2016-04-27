#
# Data Wrangling en R para Programadores SQL
# Author: Marciano Moreno, marciano_moreno@acm.org
#
# data_table.R - Data table demo

install.packages("data.table") # Instalar un paquete externo.
library("data.table") # Cargar en memoria el paquete.
flights <- fread("datasets/flights14.csv") # Carga rápida de archivos.


# Exploración de datos.
flights
summary(flights)
str(flights)
dim(flights)
nrow(flights)
ncol(flights)
names(flights)
row.names(flights)

# Acceso a elementos del data table.
flights[1] # Primer renglón.
flights[1,] # Primer renglón (también).
flights[,1] # 1. El segundo componente del data table es una expresión.
flights[,year] # Vector con elementos de la columna year.
is.vector(flights[,year])
flights$year # También vector con elementos de la columna year.
is.vector(flights$year)
# Selección de columnas (y renglones)
flights[1:10, .(year)] # Data table con una columna, year.
is.vector(flights[1:10, .(year)])
is.data.table(flights[1:10, .(year)])
flights[1:10,.(year, dep_time, carrier)] # Seleccionando columnas por nombre

# Filtrado de renglones
flights[dest=="LAX"]
flights[dest=="LAX" & dep_delay > 0] # Comportamiento distinto vs. el data.frame.

# Filtrado de renglonres y columnas
flights[dest=="LAX" & dep_delay > 0, .(origin, dest, air_time)]

# Agrupación y cálculo de agregados
flights[, .(mean_air_time = mean(air_time), var_air_time = var(air_time)), by = .(origin, dest)]

# Ordenamiento
setcolorder(flights, distance)

# Combinando información: joins, apply, conjuntos


#También se pueden crear data tables con data.table y as.data.table
dt <- data.table(id = c("b", "b", "b", "a", "a", "c"),
                 a = 1:6, b = 7:12, c = 13:18)
dt
str(dt)
class(dt$id) #Las columnas de caracter nunca se convierten a factor por omisión
getOption("datatable.print.nrows") # Número de renglones a mostrar

# Forma básica del data.table
#dt[i, j, by]
# R           i                 j         by
# SQL     where   select | update   group by

# De dt subconjunto de renglones usando i, entonces calcula j, agrupado por by

# Subconjunto de renglones con i
# Tomar todas los vuelos con JFK como aeropuerto de origen en el mes de junio
ans <- flights[origin == "JFK" & month == 6L] 
# Notas: 
# las columnas se refieren como variables, no es necesario usar el prefijo dt$columna
#  los índices de renglón que satisfacen la condición 
# no se requiere de una coma después de i
ans
dt[1] # Primera observación
dt[1,] # Primera observación

# Para ordenar se usa la función base order() de R
flights[order(origin, -dest)]
sample(10)
