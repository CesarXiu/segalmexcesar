FROM openjdk:8-alpine

COPY target/uberjar/segalmexcesar.jar /segalmexcesar/app.jar

EXPOSE 3000

CMD ["java", "-jar", "/segalmexcesar/app.jar"]
