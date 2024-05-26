FROM postgres:16

COPY init.sql /docker-entrypoint-initdb.d/

ENV DB_REPL_USER repl_user
ENV DB_REPL_PASSWORD pass123

RUN echo "host replication all 0.0.0.0/0 md5" >> /var/lib/postgresql/data/pg_hba.conf

RUN echo "CREATE USER ${DB_REPL_USER} WITH REPLICATION ENCRYPTED PASSWORD '${DB_REPL_PASSWORD}';" >> /docker-entrypoint-initdb.d/init.sql && \
    echo "SELECT pg_create_physical_replication_slot('replication_slot');" >> /docker-entrypoint-initdb.d/init.sql

ARG DB_PORT
ENV POSTGRES_DB_PORT=${DB_PORT}

RUN mkdir -p /oracle/pg_data/archive && \
    chown -R postgres:postgres /oracle/pg_data

RUN echo "wal_level=replica" >> /usr/share/postgresql/postgresql.conf.sample
RUN echo "hot_standby=on" >> /usr/share/postgresql/postgresql.conf.sample
RUN echo "max_wal_senders=10" >> /usr/share/postgresql/postgresql.conf.sample
RUN echo "max_replication_slots=10" >> /usr/share/postgresql/postgresql.conf.sample
RUN echo "hot_standby_feedback=on" >> /usr/share/postgresql/postgresql.conf.sample
RUN echo "log_replication_commands=on" >> /usr/share/postgresql/postgresql.conf.sample

CMD ["postgres"]
