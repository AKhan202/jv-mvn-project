# Use an official Maven image to build the application
FROM maven:3.8.4-openjdk-11 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and install dependencies
COPY pom.xml . 
RUN mvn dependency:go-offline

# Copy the source code and build the application
COPY src ./src 
#RUN mvn clean package -DskipTests=true -e && ls -l /app/target  # Check the target directory for the built JAR
RUN mvn clean package -DskipTests=true -e && \
    echo "Contents of target directory:" && \
    ls -l /app/target


# Use a smaller image to run the application
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the built jar file from the build stage
#COPY --from=build /app/target/myapp-1.0-SNAPSHOT.jar /app/myapp.jar 
COPY --from=build /app/target/jv-mvn-project-1.0-SNAPSHOT.jar /app/myapp.jar


# Command to run the application
ENTRYPOINT ["java", "-jar", "/app/myapp.jar"]
