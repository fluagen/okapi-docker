FROM mcpayment/ubuntu-java8


RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

# deploy okapi

COPY ./repo/ /app/repo/
COPY ./init.d /app/init.d
COPY ./start.sh /app/start.sh

RUN chmod -R 777 /app/init.d/* && \ 
	chmod 777 /app/start.sh

WORKDIR /app

# start okapi service

CMD /app/start.sh