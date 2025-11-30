FROM ubuntu:18.04
RUN apt update
RUN apt install -y maven tomcat9 git && \
    rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /app/boxfuse-sample-java-war-hello
WORKDIR /app/boxfuse-sample-java-war-hello
RUN mvn package
RUN cp target/hello-1.0.war /var/lib/tomcat9/webapps/hello-1.0.war
EXPOSE 8081
CMD CMD ["catalina.sh", "run"]