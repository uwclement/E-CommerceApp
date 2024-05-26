# Use the Maven image to build the project
FROM maven:3.8.5-openjdk-21 AS build
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN mvn clean package -DskipTests

# Use the JDK image to run the application
FROM openjdk:21-jdk-slim
COPY --from=build /usr/src/app/target/e-commerce-0.0.1-SNAPSHOT.jar /app/demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/demo.jar"]
