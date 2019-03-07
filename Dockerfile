FROM fabric8/java-alpine-openjdk8-jre

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY target/sprintbootwebapp-0.0.1-SNAPSHOT.jar /app

# Make port 9001 available to the world outside this container
EXPOSE 3030

# Run app.py when the container launches
CMD ["java", "-jar", "sprintbootwebapp-0.0.1-SNAPSHOT.jar"]

