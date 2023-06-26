FROM openjdk:18-jdk-alpine

ARG JAR_FILE=~/jenkins_home/workspace/jenkins_test_main/build/libs/mySpring-0.0.1-SNAPSHOT.jar

COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","app.jar"]

EXPOSE 8085