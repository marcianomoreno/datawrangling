#
# Data Wrangling en R para Programadores SQL
# Autor: Marciano Moreno, marciano_moreno@acm.org
#
# dplyr.R - Demostración de Dplyr

install.packages("dplyr")
install.packages(c("nycflights13", "Lahman"))
install.packages("RSQLite")
library(dplyr)
library(nycflights13)
library(RSQLite)

#Exploración de datos
ref_flights <- flights # Para referencia en el entorno global
flights
str(flights)
head(flights)
tail(flights)
dim(flights)
names(flights)
class(flights) # Identificar las clases de las que hereda este objeto

# Acceso a elementos del tbl
flights[1] # Primera columna
flights[1,] # Primer renglón
flights[,1] # Primera columna como data.frame, no como vector.
is.vector(flights[,1])

flights$carrier # Elementos de la columna carrier, como vector
is.vector(flights$carrier)

# Selección de columnas
select(flights, origin, dest, air_time)

# Encadenamiento en dplyr:
# dplyr provee del operador %>% operator. x %>% f(y) se vuelve f(x, y).
flights %>% select(origin, dest, air_time)

# Filtrado de renglones
distinct(select(flights, carrier)) # Más rápido que base::unique()
unique(flights$carrier) # de base

flights %>% filter(carrier == "UA")
flights %>% filter(carrier == "UA" & dest == "LAX") # 5,823 renglones
flights %>% filter(carrier == "UA" && dest == "LAX") # 0 renglones

# Usando encadenamiento podemos filtar renglones y columnas:
flights %>% filter(carrier == "UA" & dest == "LAX") %>%
  select(origin, dest, air_time)

# Sin encadenamiento - Opción 1 anidando funciones
select(filter(flights, carrier == "UA" & dest == "LAX"), origin, dest, air_time)

#Sin encadenamiento - Opción 2, usando variables temporales
t1 <- filter(flights, carrier == "UA" & dest == "LAX")
t2 <- select(t1, origin, dest, air_time)
t2

# slice() permite filtrar renglones por posición
flights %>% slice(5:10)

# Agrupación y cálculo de agregados
flights %>% group_by(origin) %>% summarise(count = n(), dist = mean(distance, na.rm = TRUE))
flights %>% group_by(origin, dest) %>% summarise(count = n(), dist = mean(distance, na.rm = TRUE))

flights_db1 <- tbl(nycflights13_sqlite(), "flights")


carriers_df <- flights %>% group_by(carrier)
str(carriers_df)

carriers_db1 <- flights_db1 %>% group_by(carrier)
str(carriers_db1)
summary(carriers_df$arr_delay)
carriers_df %>% summarise(delay = mean(arr_delay))
system.time(carriers_df %>% summarise(delay = mean(arr_delay)))

carriers_db1 %>% summarise(delay = mean(arr_delay)) %>% collect()
system.time(carriers_df %>% summarise(delay = mean(arr_delay)))
browseVignettes(package = c("dplyr", "tidyr"))
