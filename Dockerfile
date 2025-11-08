# Используем Java 23
FROM eclipse-temurin:23-jdk-alpine

# Устанавливаем Maven
RUN apk add --no-cache maven

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем pom.xml и скачиваем зависимости
COPY pom.xml .
RUN mvn dependency:go-offline

# Копируем исходники
COPY src ./src

# Собираем проект
RUN mvn clean package -DskipTests

# Запускаем собранный JAR
CMD ["sh", "-c", "java -Dserver.port=${PORT:-8080} -jar target/*.jar"]

EXPOSE 8080
