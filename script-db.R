# sqldf("attach db as new")
# 
# read.csv.sql("bd_por_dias.csv", sql = "create table autos as select * from file", dbname = "db")
# 
# closeAllConnections()

# library(lubridate)
# 
# datos <-read.csv("predicciones.csv", header=T, sep=";")
# 
# datos$fecha <- parse_date_time(datos$fecha, "%d-%m-%Y")
# 
# datos$fecha <- as.Date(datos$fecha)
# 
# class(datos$fecha)
# sapply(datos, class)