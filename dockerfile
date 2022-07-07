FROM openjdk:8-jdk-alpine
COPY ./target/gameoflife.war /usr/app/
WORKDIR /usr/app
ENTRYPOINT ["java","-jar","gameoflife.war"]