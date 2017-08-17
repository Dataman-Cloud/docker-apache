#!/bin/bash
set -e

rm -rf /run/httpd/* /tmp/httpd*

HTTP_PORT=${HTTP_PORT:-80}
HTTPS_PORT=${HTTPS_PORT:-443}
APP_LIST=${APP_LIST:-"http://127.0.0.1:5013,http://127.0.0.1:5014"}

for APP in `echo $APP_LIST|tr ',' ' '`;do
    BALANCER_MEMBERS="$BALANCER_MEMBERS	BalancerMember $APP\n"
done

replace_var(){
    files=$@
    echo $files | xargs sed -i 's#--HTTP_PORT--#'$HTTP_PORT'#g'
    echo $files | xargs sed -i 's#--HTTPS_PORT--#'$HTTPS_PORT'#g'
    echo $files | xargs sed -i 's#--BALANCER_MEMBERS--#'"$BALANCER_MEMBERS"'#g'
}

create_conf(){
    rm -rf conf_temp_tmp
    cp -R conf_temp conf_temp_tmp 

    files=`grep -rl '' conf_temp_tmp/*`
    replace_var $files

    rm -rf /etc/httpd/{conf,conf.d}
    mv conf_temp_tmp/* /etc/httpd/
    rm -rf conf_temp_tmp
}

create_conf

exec /usr/sbin/apachectl -DFOREGROUND
