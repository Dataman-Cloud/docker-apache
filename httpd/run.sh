docker rm -f apache
docker run -it \
	--name apache \
	-e HTTP_PORT=82 \
	-e HTTPS_PORT=1443 \
	-e APP_LIST=http://tomcat.default.hatest.dataman.gateway.swan.com \
	--net host \
	--add-host=tomcat.default.hatest.dataman.gateway.swan.com:192.168.1.214 \
	--entrypoint=bash \
	library/centos7-httpd-2.4.6	
