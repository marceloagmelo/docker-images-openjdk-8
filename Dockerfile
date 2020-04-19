FROM maven:3.6.3-jdk-8 AS builder

LABEL maintainer="Marcelo Melo marceloagmelo@gmail.com"

USER root

ENV APP_HOME /opt/app

ADD app $APP_HOME

RUN mvn -f $APP_HOME/pom.xml clean package

FROM centos:7

USER root

ENV GID 20000
ENV UID 20000

ENV JAVA_VERSION 1.8.0
ENV APP_HOME /opt/app
ENV IMAGE_SCRIPTS_HOME /opt/scripts

ADD scripts $IMAGE_SCRIPTS_HOME
COPY Dockerfile $IMAGE_SCRIPTS_HOME/Dockerfile

RUN mkdir -p $APP_HOME && \
    yum clean all && yum update -y && yum -y install \
    java-$JAVA_VERSION-openjdk-devel \
    net-tools && \
    groupadd --gid $GID java && useradd --uid $UID -m -g java java && \
    chown -R java:java $APP_HOME && \
    chown -R java:java $IMAGE_SCRIPTS_HOME && \
    yum clean all && \
    rm -Rf /tmp/* && rm -Rf /var/tmp/*


COPY --from=builder $APP_HOME/target/java-application-1.0-SNAPSHOT.jar $APP_HOME/java-application-1.0-SNAPSHOT.jar

EXPOSE 8080  

USER java

WORKDIR $IMAGE_SCRIPTS_HOME

ENTRYPOINT [ "./control.sh" ]
CMD [ "start" ]