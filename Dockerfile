# Usamos una imagen oficial de Tomcat con Java
FROM tomcat:10.1-jdk17

# Eliminamos la aplicación por defecto de Tomcat para que no interfiera
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copiamos nuestro archivo WAR generado por Maven y lo renombramos como ROOT.war
# Esto hace que tu proyecto abra directamente en la ruta principal (ej: tuurl.onrender.com)
COPY target/ROJAS_BONILLA-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Exponemos el puerto 8080 que es el que usa Tomcat por defecto
EXPOSE 8080

# Comando para iniciar Tomcat
CMD ["catalina.sh", "run"]