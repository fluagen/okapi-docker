FROM fluagen/ubuntu-java8

# deploy okapi

COPY ./repo/ /app/repo/
COPY ./init.d /app/init.d
COPY ./start.sh /app/start.sh

RUN chmod -R 777 /app/init.d/* && \ 
	chmod 777 /app/start.sh

WORKDIR /app

# start okapi service

EXPOSE 9130

ENTRYPOINT ["./start.sh"]