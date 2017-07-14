FROM demoregistry.dataman-inc.com/library/centos7-base:latest
MAINTAINER jyliu <jyliu@dataman-inc.com>

COPY rpms /rpms

RUN yum -y install /rpms/httpd/*.rpm && yum clean all && rm -rf /rpms
