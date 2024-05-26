# Установка базового образа PostgreSQL
FROM postgres:16

# Запись скрипта инициализации прямо в Dockerfile
RUN echo "#!/bin/bash" > /usr/local/bin/init.sh && \
    echo "rm -rf /var/lib/postgresql/data/*" >> /usr/local/bin/init.sh && \
    echo "until pg_basebackup -h db -D /var/lib/postgresql/data -U ${PGUSER} -vP -w; do" >> /usr/local/bin/init.sh && \
    echo "  echo 'Replica not ready, trying again...'" >> /usr/local/bin/init.sh && \
    echo "  sleep 1" >> /usr/local/bin/init.sh && \
    echo "done" >> /usr/local/bin/init.sh && \
    echo "echo 'Backup done, starting replica...'" >> /usr/local/bin/init.sh && \
    echo "chown -R postgres:postgres /var/lib/postgresql/data" >> /usr/local/bin/init.sh && \
    echo "chmod 700 /var/lib/postgresql/data" >> /usr/local/bin/init.sh && \
    echo "su - postgres -c '/usr/lib/postgresql/16/bin/postgres -D /var/lib/postgresql/data'" >> /usr/local/bin/init.sh

RUN chmod +x /usr/local/bin/init.sh

CMD ["/usr/local/bin/init.sh"]
