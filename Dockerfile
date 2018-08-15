#target: complete build environment
FROM maven as builder
# add source code
COPY . .
# package jar
RUN mvn clean package



# Second stage: minimal runtime environment
FROM openjdk:8-jre-alpine
# copy jar from the first stage
COPY --from=builder target/docker-0.0.1-SNAPSHOT.jar app.jar
# run jar
CMD ["java", "-jar", "app.jar"]
