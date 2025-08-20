FROM archivebox/archivebox:latest

ENV DJANGO_SUPERUSER_USERNAME=admin
ENV DJANGO_SUPERUSER_PASSWORD=changeme
ENV DJANGO_SUPERUSER_EMAIL=you@example.com

EXPOSE 8000

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && \
    chown archivebox:archivebox /entrypoint.sh

USER archivebox

ENTRYPOINT ["/entrypoint.sh"]