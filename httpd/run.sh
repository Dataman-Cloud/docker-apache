docker run -d
	-e HTTP_PORT=82 \
	-e HTTPS_PORT=1443 \
	-e APP_LIST=http://127.0.0.1,http:127.0.0.1:5015 \
	library/centos7-httpd-2.4.6	
