CREATE USER repl_user WITH REPLICATION ENCRYPTED PASSWORD 'repl_user';

SELECT pg_create_physical_replication_slot('replication_slot');

DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'new_database') THEN
        CREATE DATABASE new_database;
    END IF;
END$$;

\c new_database

CREATE TABLE IF NOT EXISTS Emails(
    id SERIAL PRIMARY KEY,
    email VARCHAR (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Numbers(
    id SERIAL PRIMARY KEY,
    number VARCHAR (255) NOT NULL
);

INSERT INTO Emails (email) VALUES ('email123@gmail.com'), ('yandexuser@yandex.ru');
INSERT INTO Numbers (number) VALUES ('+7 950 689 56 55'), ('89378567879');
