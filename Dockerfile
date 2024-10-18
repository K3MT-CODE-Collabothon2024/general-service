# Use a Maven image to build the application
FROM maven:3.8.3-openjdk-17 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and download dependencies (without building the project yet)
COPY pom.xml .

# Download all dependencies before copying the source code
RUN mvn dependency:go-offline

# Copy the source code
COPY src ./src

# Package the application (create the JAR file)
RUN mvn clean package -DskipTests

# Use a smaller, slimmer OpenJDK image to run the application
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /app/target/*.jar /app/app.jar

# Expose the application port
EXPOSE 8080

# Set environment variables for PostgreSQL connection
ENV SPRING_DATASOURCE_URL=jdbc:postgresql://postgres_container:5432/my_database
ENV SPRING_DATASOURCE_USERNAME=root
ENV SPRING_DATASOURCE_PASSWORD=12345

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
