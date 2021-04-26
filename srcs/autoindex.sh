#!/bin/bash
if grep "autoindex off" /etc/nginx/sites-available/localhost
then
    sed -i "s/autoindex off/autoindex on/" ./etc/nginx/sites-available/localhost
    service nginx reload
else
    sed -i "s/autoindex on/autoindex off/" ./etc/nginx/sites-available/localhost
    service nginx reload
fi