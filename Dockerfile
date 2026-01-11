FROM alpine:latest
RUN apk add --no-cache ca-certificates

# Descargar el binario de Hearth
ADD https://github.com/HearthAudio/Hearth/releases/latest/download/hearth-linux-x86_64 /hearth
RUN chmod +x /hearth

# Copiar el archivo de configuración (asegúrate de tenerlo en tu repo local)
COPY config.toml /config.toml

# Exponer el puerto
EXPOSE 30031

# Definir puerto y contraseña como variables de entorno
ENV HEARTH_SERVER_PORT=30031
ENV HEARTH_SERVER_PASSWORD=youshallnotpass

# Ejecutar Hearth con el archivo de configuración
ENTRYPOINT ["/hearth", "--config", "/config.toml"]