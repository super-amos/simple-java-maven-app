FROM maven:3.8.7-openjdk-18-slim as build
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn clean install

FROM openjdk:18-jdk-alpine3.15
COPY --from=build /build/target/my-app-1.0-SNAPSHOT.jar app.jar
CMD java -jar app.jar
