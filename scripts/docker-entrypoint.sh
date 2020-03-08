#!/bin/sh

SQLCONF_FILE=/var/www/localhost/htdocs/sites/default/sqlconf.php
if [ -w ${SQLCONF_FILE} ]; then
  echo -n "Modifying sqlconf.php ..."
  sed -i -e "s/MYSQL_HOST/$MYSQL_HOST/g" \
       -e "s/MYSQL_PORT/$MYSQL_PORT/g" \
       -e "s/MYSQL_DATABASE/$MYSQL_DATABASE/g" \
       -e "s/MYSQL_USER/$MYSQL_USER/g" \
       -e "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" \
       ${SQLCONF_FILE}
  echo "done."

else
  echo "File ${SQLCONF_FILE} is not writable. Not modifying."
fi


PING_RESULT=1
                                                                                                        
while [ ${PING_RESULT} -ne 0 ]; do
  echo "Waiting for mysql to come up ... checking every 5 seconds ..."                                    
  sleep 5                                                                                  
  mysqladmin -h ${MYSQL_HOST} --connect-timeout=2 -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ping
  PING_RESULT=$?                                                                           
done


echo "MySQL now active on host ${MYSQL_HOST}!"

echo "Starting Apache Web Server ..."

# Finally, as the last step, execute the command specified as CMD in Dockerfile:
exec "$@"
