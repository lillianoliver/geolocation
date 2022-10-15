FROM openjdk:8
ADD target/*.jar biomedical.jar
EXPOSE 8081
ENTRYPORT ["-java","-jar","biomedical.jar"]