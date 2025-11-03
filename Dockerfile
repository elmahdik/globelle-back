# Используем официальный образ Eclipse Temurin с Java 23
FROM eclipse-temurin:23-jdk-alpine

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем все файлы проекта
COPY . .

# Собираем проект через Maven wrapper
RUN ./mvnw clean package -DskipTests

# Указываем команду запуска приложения
# Render будет подставлять переменную $PORT, если нужно
CMD ["sh", "-c", "java -Dserver.port=${PORT:-8080} -jar target/globelle-back.jar"]

# Открываем порт 8080 (Render автоматически пробрасывает $PORT)
EXPOSE 8080
