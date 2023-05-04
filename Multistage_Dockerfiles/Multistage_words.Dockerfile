# Stage 1:
FROM maven:3.6.3-jdk-8-slim AS build
COPY pom.xml .
COPY src src
RUN mvn verify 
## package

# Stage 2: 
FROM openjdk:8-jre-slim
COPY --from=build ./target ./target
EXPOSE 8080

CMD ["java", "-Xmx8m", "-Xms8m", "-jar", "/target/words.jar"]