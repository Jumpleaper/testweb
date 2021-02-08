FROM ubuntu:16.04
RUN apt-get update
RUN apt install default-jdk
RUN apt install tomcat9
RUN apt install maven
RUN apt install git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello
RUN mvn package
RUN cd target
COPY hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
