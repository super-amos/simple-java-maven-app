FROM maven:3.8.7-openjdk-18-slim as build
WORKDIR /build
COPY pom.xml .
COPY src ./src
ARG VERSION_ID
RUN mvn clean install

FROM openjdk:18-jdk-alpine3.15
ARG VERSION_ID
COPY --from=build /build/target/my-app-$VERSION_ID.jar app.jar
CMD java -jar app.jar
