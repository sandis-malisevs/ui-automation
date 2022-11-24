# Remember to rebuild iamge with --no-cache every time to avoid issues
FROM maven:3.8.6-openjdk-18

LABEL AUTHOR="Sandis Malisevs"

WORKDIR /ui-tests

COPY src ./
COPY pom.xml ./
COPY send_notification.sh ./
COPY testNG.xml ./

RUN mvn dependency:resolve
RUN mvn clean install -DskipTests
