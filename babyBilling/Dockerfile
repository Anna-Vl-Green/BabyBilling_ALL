FROM openjdk:17-jdk-slim
# Set the working directory in the container
WORKDIR /app
# Copy the built JAR file from the previous stage to the container
COPY target/babybilling-1.0-SNAPSHOT.jar ./app.jar
EXPOSE 8081:8081
# Set the command to run the application
CMD ["java", "-jar", "app.jar"]