sqldf("attach db as new")

read.csv.sql("bd_por_dias.csv", sql = "create table autos as select * from file", dbname = "db")

closeAllConnections()
