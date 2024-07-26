#!/bin/bash

# Navigate to the Adminer directory
cd /var/www/html/adminer

# Start the PHP built-in server in the foreground
php -S 0.0.0.0:8080 adminer.php
