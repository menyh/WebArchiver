#!/bin/sh
cd /data
# Initialize archive if needed
[ -f index.sqlite3 ] || archivebox init
# Create admin user if it doesn't exist!
echo "
from django.contrib.auth import get_user_model;
User = get_user_model();
u='${DJANGO_SUPERUSER_USERNAME}'; 
p='${DJANGO_SUPERUSER_PASSWORD}'; 
e='${DJANGO_SUPERUSER_EMAIL}';
User.objects.filter(username=u).exists() or User.objects.create_superuser(u, e, p)
" | archivebox manage shell
# Start ArchiveBox webserver
archivebox server 0.0.0.0:8080