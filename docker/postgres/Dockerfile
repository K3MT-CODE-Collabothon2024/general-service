FROM postgres:15

ENV POSTGRES_DB=collabothon
ENV POSTGRES_USER=root
ENV POSTGRES_PASSWORD=12345

COPY ./init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432