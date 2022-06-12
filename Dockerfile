# use a centos base image
FROM centos:centos7.9.2009

# update our server
RUN yum update -y

# set maintainer
LABEL maintainer "info@apotians.com"

# set a health check
# HEALTHCHECK --interval=5s \
#             --timeout=5s \
#             CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 80

