FROM openjdk:17-jdk-slim

VOLUME /tmp

WORKDIR /app

COPY target/my-spring-boot-app.jar /app/app.jar

EXPOSE 8080

ENV SPRING_DATASOURCE_URL=jdbc:postgresql://postgres_container:5432/my_database
ENV SPRING_DATASOURCE_USERNAME=root
ENV SPRING_DATASOURCE_PASSWORD=12345

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
