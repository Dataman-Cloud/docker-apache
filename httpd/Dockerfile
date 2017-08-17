FROM library/centos7-httpd-2.4.6-base
MAINTAINER jyliu <jyliu@dataman-inc.com>

COPY conf_temp /conf_temp
COPY /entrypoint.sh /
RUN rm -rf /etc/httpd/conf /etc/httpd/conf.d && chmod +x /*.sh

ENTRYPOINT ["/entrypoint.sh"]
