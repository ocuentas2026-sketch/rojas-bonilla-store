FROM tomcat:9.0-jdk17-temurin

# Limpiar aplicaciones previas
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar todo el contenido al directorio ROOT
COPY ROJAS_BONILLA_2-1.0-SNAPSHOT* /usr/local/tomcat/webapps/ROOT/

# Si se copió como carpeta interna, mover los archivos a la raíz de ROOT
RUN if [ -d "/usr/local/tomcat/webapps/ROOT/ROJAS_BONILLA_2-1.0-SNAPSHOT" ]; then \
        mv /usr/local/tomcat/webapps/ROOT/ROJAS_BONILLA_2-1.0-SNAPSHOT/* /usr/local/tomcat/webapps/ROOT/ && \
        rm -rf /usr/local/tomcat/webapps/ROOT/ROJAS_BONILLA_2-1.0-SNAPSHOT; \
    fi

EXPOSE 8080
CMD ["catalina.sh", "run"]
