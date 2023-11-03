ARG IMAGE_VERSION=""
FROM aemdesign/aem-base:${IMAGE_VERSION}

LABEL   os="centos 7" \
        java="oracle 11" \
        container.description="aem instance, will run as author unless specified otherwise" \
        version="jdk11" \
        imagename="aem"
        #test.command=" java -version 2>&1 | grep 'java version' | sed -e 's/.*java version "\(.*\)".*/\1/'" \
        #test.command.verify="1.8"

ARG AEM_VERSION="6.5.0"
ARG AEM_PORT="4502"
ARG AEM_RUNMODE="author"
ARG AEM_JVM_OPTS="-server -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=0.0.0.0:58242 -Xms1024m -Xmx1024m -XX:MaxDirectMemorySize=256M -XX:+CMSClassUnloadingEnabled -Djava.awt.headless=true -Dorg.apache.felix.http.host=0.0.0.0"
ARG AEM_START_OPTS="-p ${AEM_PORT} -a 0.0.0.0 -v -r ${AEM_RUNMODE}"
ARG AEM_JARFILE="/aem/aem-quickstart.jar"

ENV AEM_JVM_OPTS="${AEM_JVM_OPTS}" \
    AEM_START_OPTS="${AEM_START_OPTS}"\
    AEM_JARFILE="${AEM_JARFILE}"

WORKDIR /aem

COPY .docker/aem/scripts/*.sh /aem/
COPY .docker/aem/aem-sdk/*.zip /aem/aem-sdk/

#expose port
EXPOSE ${AEM_PORT} 58242 57345 57346

VOLUME ["/aem/crx-quickstart/repository", "/aem/crx-quickstart/logs", "/aem/backup"]


#ensure script has exec permissions
RUN chmod +x /aem/*.sh

RUN apt-get update
RUN apt-get install unzip

#make java pid 1
ENTRYPOINT ["/aem/startup.sh"]

# ENTRYPOINT ["tail"]
# CMD ["-f","/dev/null"]