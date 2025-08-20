FROM archivebox/archivebox:latest
ENV DJANGO_SUPERUSER_USERNAME=admin
ENV DJANGO_SUPERUSER_PASSWORD=changeme
ENV DJANGO_SUPERUSER_EMAIL=you@example.com

# Optionally set up ArchiveBox config here

EXPOSE 8000
CMD ["sh", "-c", "cd /data && [ -f index.sqlite3 ] || archivebox init --yes && archivebox server 0.0.0.0:8000"]