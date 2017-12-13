FROM mcpayment/ubuntu-java8


# deploy okapi

COPY ./repo/ /app/repo/
COPY ./init.sh /app/init.d/init.sh
COPY ./start.sh /app/start.sh

RUN chmod -R 777 /app/init.d/* && \ 
	chmod 777 /app/start.sh

WORKDIR /app

# start okapi service

CMD /app/start.sh