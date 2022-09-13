FROM java:8

USER root
# Create app directory
RUN mkdir -p /app

#RUN chmod 777 -R /app
RUN chmod -R +x /app

WORKDIR /app

COPY ./target/docker-0.0.1-SNAPSHOT.jar /app

EXPOSE 8080


RUN pwd
RUN ls -al

ENV PROFILE = "dev"
ENTRYPOINT ["java", "-jar", "docker-0.0.1-SNAPSHOT.jar"]