FROM maven:3.9.8-eclipse-temurin-17 AS build
WORKDIR /app
COPY techbleat-global-bank-backend/transaction-service/pom.xml .
COPY techbleat-global-bank-backend/transaction-service/src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/transaction-service-1.0.0.jar app.jar
CMD ["java", "-jar", "app.jar"]
