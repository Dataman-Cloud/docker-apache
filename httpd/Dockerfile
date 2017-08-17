FROM library/centos7-httpd-2.4.6-base
MAINTAINER jyliu <jyliu@dataman-inc.com>

COPY conf_temp /
COPY /entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
