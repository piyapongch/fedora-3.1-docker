FROM openjdk:8-jdk-stretch

ENV CATALINA_HOME=/home/fedora-3.1/tomcat
ENV FEDORA_HOME=/home/fedora-3.1
    
# Add Fedora 3.1
ADD ./fedora-3.1.tar.gz /home

EXPOSE 8080 61616
WORKDIR /home/fedora-3.1

CMD ${CATALINA_HOME}/bin/catalina.sh run