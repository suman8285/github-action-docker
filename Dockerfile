FROM rhel7:latest
RUN yum -y update && yum -y install java-1.8.0-openjdk && yum clean all
USER root
# Create app directory
RUN mkdir -p /app

#RUN chmod 777 -R /app
RUN chmod -R +x /app

WORKDIR /app

COPY ./target/docker-0.0.1-SNAPSHOT.jar /app

EXPOSE 8080

CMD java -version

RUN pwd
RUN ls -al

ENV PROFILE = "dev"
ENTRYPOINT ["java", "-jar", "docker-0.0.1-SNAPSHOT.jar"]