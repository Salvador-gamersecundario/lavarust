FROM alpine:latest
RUN apk add --no-cache ca-certificates

# Descargar el binario de Hearth usando curl
RUN curl -L https://github.com/HearthAudio/Hearth/releases/download/v0.1.1/hearth-linux-x86_64 -o /hearth && \
    chmod +x /hearth

# Copiar el archivo de configuración si lo tienes
# COPY config.toml /config.toml

# Exponer el puerto
EXPOSE 30031

# Definir puerto y contraseña como variables de entorno
ENV HEARTH_SERVER_PORT=30031
ENV HEARTH_SERVER_PASSWORD=youshallnotpass

# Ejecutar Hearth
ENTRYPOINT ["/hearth"]