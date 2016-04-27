#
# Data Wrangling en R para Programadores SQL
# Autor: Marciano Moreno, marciano_moreno@acm.org
#
# data_frame.R - Demostración de data.frame

data() # Listar los datasets
data(iris) # Cargar en memoria el dataset iris
df <- iris

class(df) # Determinar la clase del objeto
mode(df) # Determinar el tipo o modalidad de almacenamiento de un objeto

# Exploración de datos
iris
summary(df)
str(df)
head(df)
tail(df, n=15)
dim(df)
nrow(df)
ncol(df)
names(df)
row.names(df)

#Acceso a elementos del data frame
df[1] # Primera columna
df[1,] # Primer renglón
df[,1] # Primera columna como vector

df$Sepal.Length # Vector
is.vector(df$Sepal.Length)

# Selección de columnas
df[,c(1,3,5)]

# Filtrado de renglones
df[which(df$Species=="setosa"),]
df[which(df$Sepal.Length>3.0 & df$Species == "setosa"),] # OK: Con el operador & se evaluan todos los elementos del vector
df[which(df$Sepal.Length>3.0 && df$Species == "setosa"),] # CUIDADO:Con el operador & solo se evalua el primer elemento del vector

# Agrupación y cálculo de agregados
aggregate(df[,1:4], by = list(df$Species), mean)

# Ordenamiento:
df[order(df$Sepal.Length, decreasing = TRUE),]

# Combinando información: joins, apply, conjuntos

# cbind() combinación de data frames por columnas
# rbind() combinación de data frames por renglones


iris_df$Sepal.Length
# Selección de columnas
iris_df[[1]] # 
iris_df$Sepal.Length[1]

iris_df[1,1]
iris_df[[1]][1]

iris_df$Sepal.Width
iris_df[[2]]
iris_df$Sepal.Width[1]
iris_df[1,2]
iris_df["Sepal.Width"]
iris_df[c("Sepal.Length", "Sepal.Width")]

iris_df[1:2]
iris_df[,1:3]





