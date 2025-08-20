#!/bin/sh
cd /data
[ -f index.sqlite3 ] || archivebox init
echo "
from django.contrib.auth import get_user_model;
User = get_user_model();
u='${DJANGO_SUPERUSER_USERNAME}'
p='${DJANGO_SUPERUSER_PASSWORD}'
e='${DJANGO_SUPERUSER_EMAIL}'
if not User.objects.filter(username=u).exists():
    User.objects.create_superuser(u, e, p)
" | archivebox manage shell
archivebox server 0.0.0.0:8000