FROM eclipse-temurin:17

WORKDIR /app

COPY target/leave-management-system1-1.0-SNAPSHOT.jar app.jar

ENTRYPOINT ["java","-jar","app.jar"]
