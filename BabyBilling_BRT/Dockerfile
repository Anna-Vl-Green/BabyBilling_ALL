FROM openjdk:17-jdk-slim
# Set the working directory in the container
WORKDIR /app
# Copy the built JAR file from the previous stage to the container
COPY target/BRT-1.0-SNAPSHOT.jar ./app.jar
# Set the command to run the application
CMD ["java", "-jar", "app.jar"]