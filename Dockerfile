# Используем образ с OpenJDK 17 (официальный образ)
FROM eclipse-temurin:21-jdk-jammy

# Создаем директорию для сервера
RUN mkdir -p /opt/minecraft/server
WORKDIR /opt/minecraft/server

# Устанавливаем необходимые пакеты
RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Скачиваем Purpur 1.20.1 build 2062
RUN wget -O purpur.jar https://api.purpurmc.org/v2/purpur/1.20.1/2062/download

# Копируем скрипт для запуска
COPY start.sh /opt/minecraft/start.sh
RUN chmod +x /opt/minecraft/start.sh

# Открываем порт майнкрафта
EXPOSE 25565
EXPOSE 24454

# Точка входа
ENTRYPOINT ["/opt/minecraft/start.sh"]