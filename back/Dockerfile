FROM eclipse-temurin:23-jdk-alpine

RUN apk add --no-cache maven

WORKDIR /app

# Копируем pom.xml и src из подпапки back
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package -DskipTests

CMD ["sh", "-c", "java -Dserver.port=${PORT:-8080} -jar target/*.jar"]

EXPOSE 8080