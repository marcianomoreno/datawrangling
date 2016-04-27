#
# Data Wrangling en R para Programadores SQL
# Autor: Marciano Moreno, marciano_moreno@acm.org
#
# intro_R.R - Introducción a R

# CTRL + ENTER permite enviar comandos de la ventana de scripts a la ventana de comandos.

getwd() # Consultar el directorio de trabajo

setwd("C:/RDemos") # Asignar el directorio de trabajo. Se usan diagonal hacia adelante como separador de directorios

2 + 2 # Operaciones aritméticas

a <- 2 * 2 # Asignación de variables con el operador <-, también se puede usar =
a # Obtener el valor de a

vec <- c(30, 10, 20) # Un vector creado con la función c(): concatenate
vec
vec[2] # 10
length(vec) # Número de elementos en el vector
nrow(vec) # NULL
ncol(vec) # NULL

mean(vec) 
sum(vec)

sort(vec) # Ordenamiento de vectores y factores

seq(from = 1, to = 5, by = 1) # Secuencia regular
seq(1,5) # Secuencia con argumentos default (from, to, by=1)
1:5 # Expresado de forma más compacta

rep(1,10) # Vector con el número 1
seq(from = "a", to = "j")

m <- matrix(1:10, nrow = 2) # Matriz numérica 
m[1] # [1] 1 - primer elemento
m[1,] # [1] 1 3 5 7 9 - primer renglón
m[,1] # [1] 1 2 - primera columna
length(m) # Número de elementos en la matriz
dim(m) 
ncol(m) # 5
nrow(m) # 2

f <- factor(c(1,2,3), labels = c("Malo", "Bueno", "Excelente"), ordered = TRUE)
f 
colores <- factor(c(1,2,3), labels = c("Rojo", "Verde", "Azul")) # ordered = FALSE por omisión
colores

# Lista
l <- list(item1 = 1, item2= c(3,2,1), item3 = c("a", "b"))
l
names(l)
l$item1
length(l)
l[[2]]
l[[2]][3]

search() # Listar los paquetes cargados.

data() # Consultar los datasets provistos en R

ls() # Listar objetos en el ambiente
rm(list = ls()) # Borrar todos los datos y valores del ambiente

