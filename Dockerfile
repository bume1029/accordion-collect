FROM centos:centos7
MAINTAINER bskim <bum1029@gmail.com> 

USER root

COPY jdk-8u121-linux-i586.tar.gz /tmp/ 
COPY scouter_server.tar.gz /tmp/

# Install Java 1.8.0_121
RUN mkdir -p /usr/java
WORKDIR /usr/java
RUN yum install glibc.i686 ld-linux.so.2 telnet net-tools -y \
&& tar -xvf /tmp/jdk-8u121-linux-i586.tar.gz
ENV JAVA_HOME /usr/java/jdk1.8.0_121
ENV PATH $JAVA_HOME/bin/:$PATH 
  
# Install Scouter 
WORKDIR /opt
RUN tar -xvf /tmp/scouter_server.tar.gz \
 && chmod +x /opt/scouter_server/*.sh
  
ENV SCOUTER_HOME /opt/scouter_server
ENV PATH $SCOUTER_HOME/:$PATH

#Client
EXPOSE 6100
EXPOSE 6100/udp

CMD ["startup.sh"]
