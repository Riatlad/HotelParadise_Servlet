FROM postgres:latest

#Donde /docker-entrypoint-initdb.d es la carpeta donde se guarda el dump.sql porque ejecuta los scripts automaticamente
RUN chmod a+r /docker-entrypoint-initdb.d/dump.sql 
 
RUN  /etc/init.d/postgresql start &&  psql -h localhost  -U postgres pruebashotel </docker-entrypoint-initdb.d/dump.sql