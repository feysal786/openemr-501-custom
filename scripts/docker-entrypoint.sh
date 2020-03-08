#!/bin/sh
sed -i -e "s/SQLHOST/$SQLHOST/g" \
       -e "s/SQLPORT/$SQLPORT/g" \
       -e "s/DBNAME/$DBNAME/g" \
       -e "s/LOGIN/$LOGIN/g" \
       -e "s/PASSWORD/$PASSWORD/g" \
       /var/www/localhost/htdocs/sites/default/sqlconf.php

# Execute the command specified as CMD in Dockerfile:
exec "$@"
