FROM centos:7

LABEL maintainer="Marcelo Melo marceloagmelo@gmail.com"

USER root

ENV GID 20000
ENV UID 20000

ENV JAVA_VERSION 1.8.0
ENV IMAGE_SCRIPTS_HOME /opt/scripts
ENV APP_HOME /opt/app
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
ENV PATH=$PATH:$JAVA_HOME/bin

ADD scripts $IMAGE_SCRIPTS_HOME
COPY Dockerfile $IMAGE_SCRIPTS_HOME/Dockerfile

RUN mkdir -p $APP_HOME && \
    yum clean all && yum update -y && yum -y install \
    java-$JAVA_VERSION-openjdk-devel \
    net-tools && \
    groupadd --gid $GID java && useradd --uid $UID -m -g java java && \
    chown -R java:java $IMAGE_SCRIPTS_HOME && \
    chown -R java:java $APP_HOME && \
    echo "running..." >> /opt/run.log && \
    chown java:java /opt/run.log && \
    yum clean all && \
    rm -Rf /tmp/* && rm -Rf /var/tmp/*

EXPOSE 8080  

USER java

WORKDIR $IMAGE_SCRIPTS_HOME

ENTRYPOINT [ "./control.sh" ]
CMD [ "start" ]