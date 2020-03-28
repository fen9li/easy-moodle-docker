#!/bin/bash

set -e
  
echo `date` > /var/www/html/marker

# configure moodledata permissions
chown -R nobody:www-data /var/www/moodledata
chmod -R 0770 /var/www/moodledata

# seed testing moodle database here if you need
