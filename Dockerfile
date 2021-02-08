FROM ubuntu:20.04
RUN apt update && apt install default-jdk -y && apt install tomcat9 && apt install maven -y && apt install git -y
ENV CATALINA_HOME /usr/share/tomcat9
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
ENV CATALINA_BASE /var/lib/tomcat9
WORKDIR /home/ubuntu
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /home/ubuntu/boxfuse-sample-java-war-hello/
RUN mvn -f /home/ubuntu/boxfuse-sample-java-war-hello/pom.xml package
RUN cp /home/ubuntu/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
WORKDIR $CATALINA_HOME
CMD ["catalina.sh", "run"]
