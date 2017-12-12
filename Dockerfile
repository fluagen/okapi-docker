FROM postgres

COPY ./init.d/ /app/init.d/
COPY ./repo/ /app/repo/
COPY ./init.sh /docker-entrypoint-initdb.d/init.sh

WORKDIR /app

CMD ["postgres"]