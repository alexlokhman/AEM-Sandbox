FROM maven:3.8.4-jdk-11

RUN ln -sf /bin/bash /bin/sh

WORKDIR /home

COPY .docker/maven/.m2/*.xml /root/.m2/
COPY .docker/maven/scripts/*.sh /home/
RUN chmod +x /home/*.sh

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]