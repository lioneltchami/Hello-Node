# use a centos base image
FROM ubuntu: 18.04
RUN  apt-get update -y

# set maintainer
LABEL maintainer "Apoti"

# This command will copy our war file into the docker image we are creating
#`  COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps

# set a health check
# HEALTHCHECK --interval=5s \
#             --timeout=5s \
#             CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8080
