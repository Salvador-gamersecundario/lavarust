FROM alpine:latest
RUN apk add --no-cache ca-certificates

# Copiar el binario desde tu repo local al contenedor
COPY hearth /hearth
RUN chmod +x /hearth

# Copiar el archivo de configuración si lo tienes
COPY config.toml /config.toml

# Exponer el puerto
EXPOSE 30031

# Definir puerto y contraseña como variables de entorno
ENV HEARTH_SERVER_PORT=30031
ENV HEARTH_SERVER_PASSWORD=youshallnotpass

# Ejecutar Hearth con el archivo de configuración
ENTRYPOINT ["/hearth", "--config", "/config.toml"]