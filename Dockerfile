# Dockerfile
FROM openjdk:8

ENV MAVEN_VERSION 3.3.9

#RUN mkdir -p /usr/share/maven \
#  && curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
#    | tar -xzC /usr/share/maven --strip-components=1 \
#  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

#ENV MAVEN_HOME /usr/share/maven

#VOLUME /root/.m2

CMD ["mvn"] 

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